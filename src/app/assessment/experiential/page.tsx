// ============================================================================
// EXPERIENTIAL ASSESSMENT PAGE
// ============================================================================
//
// This page displays experiential tasks - career-anchored challenges that
// measure objective performance + subjective experience.
//
// FLOW:
// 1. User arrives after behavioral questions
// 2. We load 3 mandatory tasks (selected in initialise)
// 3. User completes each task (or skips)
// 4. After each task: collect confidence, satisfaction, difficulty ratings
// 5. When done: navigate to processing page
//
// Each task type has different UI - see the renderTask() function.
//
// ============================================================================

'use client';

import { useState, useEffect, useRef, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState } from '@/lib/assessment';
import { 
  getExperientialState, 
  saveExperientialState, 
  initialiseExperientialState,
  fetchTasksByIds,
  saveExperientialResponse,
  markExperientialComplete,
  MANDATORY_TASK_COUNT,
} from '@/lib/experiential';
import { scoreTask } from '@/lib/experiential-scoring';
import { ExperientialTask, ExperientialScoreResult } from '@/lib/experiential-types';
import { supabase } from '@/lib/supabase';


// ============================================================================
// COMPONENT
// ============================================================================

export default function ExperientialPage() {
  const router = useRouter();
  
  // === STATE ===
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [tasks, setTasks] = useState<ExperientialTask[]>([]);
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [currentResponse, setCurrentResponse] = useState<Record<string, any>>({});
  const [showRatings, setShowRatings] = useState(false);
  const [taskResult, setTaskResult] = useState<ExperientialScoreResult | null>(null);
  
  // Rating states (collected after each task)
  const [confidence, setConfidence] = useState<number | null>(null);
  const [satisfaction, setSatisfaction] = useState<number | null>(null);
  const [perceivedDifficulty, setPerceivedDifficulty] = useState<number | null>(null);
  
  // Timing
  const startTimeRef = useRef<number>(Date.now());
  const [timeRemaining, setTimeRemaining] = useState<number | null>(null);
  const [timedOut, setTimedOut] = useState(false);
  
  // Animation
  const [animating, setAnimating] = useState(false);
  
  // Current task
  const currentTask = tasks[currentTaskIndex];
  const progress = tasks.length > 0 
    ? Math.round((currentTaskIndex / tasks.length) * 100) 
    : 0;


  // === INITIALISATION ===
  useEffect(() => {
    async function init() {
      // Check we have a session
      const assessmentState = getInitialState();
      if (!assessmentState.sessionId) {
        router.push('/');
        return;
      }
      setSessionId(assessmentState.sessionId);
      
      // Get or create experiential state
      let expState = getExperientialState();
      
      // If no mandatory tasks selected yet, initialise
      if (expState.mandatoryTaskIds.length === 0) {
        const newState = await initialiseExperientialState();
        if (!newState) {
          // No tasks available - skip to processing
          console.warn('No experiential tasks available, skipping');
          router.push('/assessment/processing');
          return;
        }
        expState = newState;
      }
      
      // If already completed, go to processing
      if (expState.mandatoryComplete) {
        router.push('/assessment/processing');
        return;
      }
      
      // Load the actual task data
      const loadedTasks = await fetchTasksByIds(expState.mandatoryTaskIds);
      setTasks(loadedTasks);
      setCurrentTaskIndex(expState.currentMandatoryIndex);
      
      setLoading(false);
    }
    
    init();
  }, [router]);


  // === TIMER ===
  useEffect(() => {
    if (!currentTask || showRatings) return;
    
    // Reset timer for new task
    startTimeRef.current = Date.now();
    setTimedOut(false);
    setCurrentResponse({});
    
    if (currentTask.time_limit_secs) {
      setTimeRemaining(currentTask.time_limit_secs);
      
      const interval = setInterval(() => {
        setTimeRemaining(prev => {
          if (prev === null || prev <= 1) {
            clearInterval(interval);
            setTimedOut(true);
            handleSubmit(true); // Auto-submit on timeout
            return 0;
          }
          return prev - 1;
        });
      }, 1000);
      
      return () => clearInterval(interval);
    } else {
      setTimeRemaining(null);
    }
  }, [currentTask, showRatings]);


  // === HANDLERS ===
  
  /**
   * Called when user submits their answer (or timer runs out)
   */
  const handleSubmit = useCallback(async (wasTimeout = false) => {
    if (!currentTask || !sessionId) return;
    
    const timeTaken = Date.now() - startTimeRef.current;
    
    // Score the response
    const result = scoreTask(currentTask, currentResponse);
    setTaskResult(result);
    
    // Show ratings UI
    setShowRatings(true);
    setTimedOut(wasTimeout);
  }, [currentTask, sessionId, currentResponse]);
  
  /**
   * Called after user provides ratings - saves everything and moves on
   */
  const handleRatingsComplete = async () => {
    if (!currentTask || !sessionId || !taskResult) return;
    
    setAnimating(true);
    
    const timeTaken = Date.now() - startTimeRef.current;
    
    // Save to database
    await saveExperientialResponse(
      sessionId,
      currentTask.id,
      currentResponse,
      taskResult.score,
      taskResult.breakdown,
      timeTaken,
      timedOut,
      confidence,
      satisfaction,
      perceivedDifficulty
    );
    
    // Update local state
    const expState = getExperientialState();
    expState.currentMandatoryIndex = currentTaskIndex + 1;
    
    // Check if done with mandatory tasks
    if (currentTaskIndex + 1 >= tasks.length) {
      expState.mandatoryComplete = true;
      saveExperientialState(expState);
      
      // Update session
      await markExperientialComplete(sessionId, tasks.length, 0);
      
      // Update assessment state
      const assessmentState = getInitialState();
      saveState({ ...assessmentState, stage: 'processing' });
      
      setTimeout(() => {
        router.push('/assessment/processing');
      }, 500);
    } else {
      saveExperientialState(expState);
      
      // Reset for next task
      setTimeout(() => {
        setCurrentTaskIndex(currentTaskIndex + 1);
        setShowRatings(false);
        setTaskResult(null);
        setConfidence(null);
        setSatisfaction(null);
        setPerceivedDifficulty(null);
        setCurrentResponse({});
        setAnimating(false);
      }, 400);
    }
  };
  
  /**
   * Skip this task entirely
   */
  const handleSkip = async () => {
    if (!sessionId) return;
    
    setAnimating(true);
    
    // Save skip to database (score = null)
    await supabase.from('bo_v1_experiential_responses').insert({
      session_id: sessionId,
      task_id: currentTask.id,
      response: { skipped: true },
      score: null,
      time_taken_ms: Date.now() - startTimeRef.current,
      timed_out: false,
    });
    
    // Update state
    const expState = getExperientialState();
    expState.currentMandatoryIndex = currentTaskIndex + 1;
    
    if (currentTaskIndex + 1 >= tasks.length) {
      expState.mandatoryComplete = true;
      saveExperientialState(expState);
      
      await markExperientialComplete(sessionId, currentTaskIndex, 1);
      
      const assessmentState = getInitialState();
      saveState({ ...assessmentState, stage: 'processing' });
      
      setTimeout(() => {
        router.push('/assessment/processing');
      }, 500);
    } else {
      saveExperientialState(expState);
      
      setTimeout(() => {
        setCurrentTaskIndex(currentTaskIndex + 1);
        setCurrentResponse({});
        setAnimating(false);
      }, 400);
    }
  };
  
  /**
   * Skip entire experiential section
   */
  const handleSkipAll = async () => {
    if (!sessionId) return;
    
    const expState = getExperientialState();
    expState.mandatoryComplete = true;
    expState.skipped = true;
    saveExperientialState(expState);
    
    await markExperientialComplete(sessionId, 0, tasks.length);
    
    const assessmentState = getInitialState();
    saveState({ ...assessmentState, stage: 'processing' });
    
    router.push('/assessment/processing');
  };


  // === LOADING STATE ===
  if (loading || !currentTask) {
    return (
      <div className="min-h-screen bg-slate-900 flex items-center justify-center">
        <div className="animate-spin h-8 w-8 border-2 border-cyan-500 border-t-transparent rounded-full" />
      </div>
    );
  }


  // === RENDER ===
  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-900 to-cyan-950 flex flex-col">
      {/* Header */}
      <header className="p-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className="text-cyan-400 text-sm font-medium">Experiential</span>
          <span className="text-slate-600">•</span>
          <span className="text-slate-500 text-sm">{formatTaskType(currentTask.task_type)}</span>
        </div>
        <div className="flex items-center gap-4">
          {timeRemaining !== null && (
            <span className={`text-sm font-mono ${timeRemaining < 30 ? 'text-red-400' : 'text-slate-400'}`}>
              {formatTime(timeRemaining)}
            </span>
          )}
          <span className="text-slate-500 text-sm">
            {currentTaskIndex + 1} / {tasks.length}
          </span>
        </div>
      </header>

      {/* Progress bar */}
      <div className="px-4">
        <div className="h-1 bg-slate-800 rounded-full overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-cyan-500 to-blue-500 transition-all duration-300"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      {/* Main content */}
      <div className="flex-1 flex flex-col items-center justify-center p-6">
        <div className={`max-w-2xl w-full transition-all duration-300 ${animating ? 'opacity-0 translate-y-4' : 'opacity-100'}`}>
          
          {!showRatings ? (
            // === TASK VIEW ===
            <>
              {/* Task card */}
              <div className="bg-slate-800/50 rounded-2xl p-8 border border-slate-700/50 mb-6">
                <h2 className="text-xl font-semibold text-slate-100 mb-2">
                  {currentTask.title}
                </h2>
                <p className="text-slate-400 mb-6">
                  {currentTask.instruction}
                </p>
                
                {/* Task-specific UI */}
                <TaskRenderer
                  task={currentTask}
                  response={currentResponse}
                  onResponseChange={setCurrentResponse}
                />
              </div>

              {/* Submit button */}
              <button
                onClick={() => handleSubmit(false)}
                disabled={Object.keys(currentResponse).length === 0}
                className="w-full p-4 rounded-xl bg-cyan-600 hover:bg-cyan-500 disabled:bg-slate-700 disabled:text-slate-500 text-white font-medium transition-all"
              >
                Submit Answer
              </button>

              {/* Skip button */}
              <div className="mt-4 text-center">
                <button
                  onClick={handleSkip}
                  className="text-slate-500 hover:text-slate-400 text-sm transition-colors"
                >
                  Skip this task →
                </button>
              </div>
            </>
          ) : (
            // === RATINGS VIEW ===
            <>
              {/* Result feedback */}
              {taskResult && (
                <div className="bg-slate-800/50 rounded-2xl p-6 border border-slate-700/50 mb-6">
                  <div className="flex items-center justify-between mb-4">
                    <span className="text-slate-400">Your score</span>
                    <span className="text-2xl font-bold text-cyan-400">
                      {taskResult.percentage}%
                    </span>
                  </div>
                  {taskResult.feedback && (
                    <p className="text-slate-300 text-sm">{taskResult.feedback}</p>
                  )}
                </div>
              )}

              {/* Ratings */}
              <div className="bg-slate-800/50 rounded-2xl p-6 border border-slate-700/50 mb-6 space-y-6">
                {/* Confidence */}
                <RatingScale
                  label="How confident were you in your answer?"
                  value={confidence}
                  onChange={setConfidence}
                  lowLabel="Not confident"
                  highLabel="Very confident"
                />
                
                {/* Satisfaction */}
                <RatingScale
                  label={currentTask.satisfaction_question}
                  value={satisfaction}
                  onChange={setSatisfaction}
                  lowLabel="Not at all"
                  highLabel="Very much"
                />
                
                {/* Difficulty */}
                <RatingScale
                  label="How difficult was this task?"
                  value={perceivedDifficulty}
                  onChange={setPerceivedDifficulty}
                  lowLabel="Very easy"
                  highLabel="Very hard"
                />
              </div>

              {/* Continue button */}
              <button
                onClick={handleRatingsComplete}
                disabled={confidence === null || satisfaction === null || perceivedDifficulty === null}
                className="w-full p-4 rounded-xl bg-cyan-600 hover:bg-cyan-500 disabled:bg-slate-700 disabled:text-slate-500 text-white font-medium transition-all"
              >
                {currentTaskIndex + 1 >= tasks.length ? 'Complete & Continue' : 'Next Task'}
              </button>
            </>
          )}
        </div>
      </div>

      {/* Skip all option */}
      <div className="p-4 text-center">
        <button
          onClick={handleSkipAll}
          className="text-slate-600 hover:text-slate-500 text-xs transition-colors"
        >
          Skip all experiential tasks
        </button>
      </div>
    </main>
  );
}


// ============================================================================
// TASK RENDERER - Routes to correct UI based on task type
// ============================================================================

interface TaskRendererProps {
  task: ExperientialTask;
  response: Record<string, any>;
  onResponseChange: (response: Record<string, any>) => void;
}

function TaskRenderer({ task, response, onResponseChange }: TaskRendererProps) {
  // Route to correct component based on task type
  switch (task.task_type) {
    case 'ESTIMATION':
      return (
        <EstimationTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    case 'PROOFREAD':
      return (
        <ProofreadTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    case 'SCENARIO_JUDGE':
      return (
        <ScenarioTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    case 'PATTERN':
      return (
        <PatternTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    case 'CATEGORISATION':
      return (
        <CategorisationTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    case 'PRIORITISATION':
      return (
        <PrioritisationTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    case 'DATA_INTERPRET':
      return (
        <DataInterpretTask
          stimulus={task.stimulus as any}
          response={response}
          onResponseChange={onResponseChange}
        />
      );
    
    default:
      return <div className="text-red-400">Unknown task type: {task.task_type}</div>;
  }
}


// ============================================================================
// TASK-SPECIFIC COMPONENTS (Basic implementations)
// ============================================================================

// --- ESTIMATION ---
function EstimationTask({ stimulus, response, onResponseChange }: any) {
  return (
    <div>
      <p className="text-slate-200 mb-4">{stimulus.question}</p>
      {stimulus.context && (
        <p className="text-slate-400 text-sm mb-4">{stimulus.context}</p>
      )}
      <div className="flex items-center gap-3">
        <input
          type="number"
          value={response.estimate || ''}
          onChange={(e) => onResponseChange({ estimate: parseFloat(e.target.value) || 0 })}
          placeholder="Enter your estimate"
          className="flex-1 p-3 bg-slate-900 border border-slate-700 rounded-lg text-slate-100 focus:border-cyan-500 focus:outline-none"
        />
        <span className="text-slate-400">{stimulus.unit}</span>
      </div>
    </div>
  );
}

// --- PROOFREAD ---
function ProofreadTask({ stimulus, response, onResponseChange }: any) {
  const [markedPositions, setMarkedPositions] = useState<number[]>(response.marked_positions || []);
  
  const handleTextClick = (e: React.MouseEvent<HTMLDivElement>) => {
    const selection = window.getSelection();
    if (!selection || selection.rangeCount === 0) return;
    
    const range = selection.getRangeAt(0);
    const position = range.startOffset;
    
    // Toggle this position
    const newPositions = markedPositions.includes(position)
      ? markedPositions.filter(p => p !== position)
      : [...markedPositions, position];
    
    setMarkedPositions(newPositions);
    onResponseChange({ marked_positions: newPositions });
  };
  
  return (
    <div>
      <p className="text-slate-400 text-sm mb-3">Click on words you think contain errors:</p>
      <div
        onClick={handleTextClick}
        className="p-4 bg-slate-900 border border-slate-700 rounded-lg text-slate-200 leading-relaxed cursor-text select-text"
      >
        {stimulus.text}
      </div>
      <p className="text-slate-500 text-xs mt-2">
        {markedPositions.length} position(s) marked
      </p>
    </div>
  );
}

// --- SCENARIO JUDGE ---
function ScenarioTask({ stimulus, response, onResponseChange }: any) {
  const selected = response.selected_options || [];
  
  const toggleOption = (optionId: string) => {
    const newSelected = selected.includes(optionId)
      ? selected.filter((id: string) => id !== optionId)
      : stimulus.allow_multiple 
        ? [...selected, optionId]
        : [optionId];
    onResponseChange({ selected_options: newSelected });
  };
  
  return (
    <div>
      <div className="bg-slate-900 p-4 rounded-lg mb-4">
        <p className="text-slate-400 text-sm mb-2">{stimulus.role}</p>
        <p className="text-slate-200">{stimulus.scenario}</p>
      </div>
      <div className="space-y-2">
        {stimulus.options.map((option: any) => (
          <button
            key={option.id}
            onClick={() => toggleOption(option.id)}
            className={`w-full p-3 text-left rounded-lg border transition-all ${
              selected.includes(option.id)
                ? 'bg-cyan-500/20 border-cyan-500 text-cyan-200'
                : 'bg-slate-900 border-slate-700 text-slate-300 hover:border-slate-600'
            }`}
          >
            {option.text}
          </button>
        ))}
      </div>
    </div>
  );
}

// --- PATTERN ---
function PatternTask({ stimulus, response, onResponseChange }: any) {
  return (
    <div>
      <div className="flex items-center gap-3 mb-6 justify-center">
        {stimulus.sequence.map((item: any, i: number) => (
          <div
            key={i}
            className={`w-12 h-12 flex items-center justify-center rounded-lg border ${
              i === stimulus.missing_position
                ? 'border-cyan-500 border-dashed bg-cyan-500/10 text-cyan-400'
                : 'border-slate-700 bg-slate-800 text-slate-200'
            }`}
          >
            {i === stimulus.missing_position ? '?' : item}
          </div>
        ))}
      </div>
      <div className="grid grid-cols-4 gap-2">
        {stimulus.options.map((option: any) => (
          <button
            key={option}
            onClick={() => onResponseChange({ selected_answer: option })}
            className={`p-3 rounded-lg border transition-all ${
              response.selected_answer === option
                ? 'bg-cyan-500/20 border-cyan-500 text-cyan-200'
                : 'bg-slate-900 border-slate-700 text-slate-300 hover:border-slate-600'
            }`}
          >
            {option}
          </button>
        ))}
      </div>
    </div>
  );
}

// --- CATEGORISATION (simplified) ---
function CategorisationTask({ stimulus, response, onResponseChange }: any) {
  const placements = response.placements || [];
  
  const setPlacement = (itemId: string, categoryId: string) => {
    const existing = placements.filter((p: any) => p.item_id !== itemId);
    onResponseChange({ placements: [...existing, { item_id: itemId, category_id: categoryId }] });
  };
  
  return (
    <div>
      <div className="space-y-3">
        {stimulus.items.map((item: any) => (
          <div key={item.id} className="flex items-center gap-3">
            <span className="text-slate-200 flex-1">{item.label}</span>
            <select
              value={placements.find((p: any) => p.item_id === item.id)?.category_id || ''}
              onChange={(e) => setPlacement(item.id, e.target.value)}
              className="p-2 bg-slate-900 border border-slate-700 rounded text-slate-200"
            >
              <option value="">Select category</option>
              {stimulus.categories.map((cat: any) => (
                <option key={cat.id} value={cat.id}>{cat.label}</option>
              ))}
            </select>
          </div>
        ))}
      </div>
    </div>
  );
}

// --- PRIORITISATION (simplified) ---
function PrioritisationTask({ stimulus, response, onResponseChange }: any) {
  const ranking = response.ranking || stimulus.items.map((i: any) => i.id);
  
  const moveUp = (index: number) => {
    if (index === 0) return;
    const newRanking = [...ranking];
    [newRanking[index], newRanking[index - 1]] = [newRanking[index - 1], newRanking[index]];
    onResponseChange({ ranking: newRanking });
  };
  
  const moveDown = (index: number) => {
    if (index === ranking.length - 1) return;
    const newRanking = [...ranking];
    [newRanking[index], newRanking[index + 1]] = [newRanking[index + 1], newRanking[index]];
    onResponseChange({ ranking: newRanking });
  };
  
  return (
    <div>
      <p className="text-slate-400 text-sm mb-3">{stimulus.scenario}</p>
      <p className="text-slate-500 text-xs mb-3">Rank from highest priority (top) to lowest (bottom):</p>
      <div className="space-y-2">
        {ranking.map((itemId: string, index: number) => {
          const item = stimulus.items.find((i: any) => i.id === itemId);
          return (
            <div key={itemId} className="flex items-center gap-2 bg-slate-900 p-3 rounded-lg border border-slate-700">
              <span className="text-slate-500 w-6">{index + 1}.</span>
              <span className="text-slate-200 flex-1">{item?.label}</span>
              <button onClick={() => moveUp(index)} className="text-slate-500 hover:text-slate-300">↑</button>
              <button onClick={() => moveDown(index)} className="text-slate-500 hover:text-slate-300">↓</button>
            </div>
          );
        })}
      </div>
    </div>
  );
}

// --- DATA INTERPRET (placeholder) ---
function DataInterpretTask({ stimulus, response, onResponseChange }: any) {
  const answers = response.answers || [];
  
  const setAnswer = (questionId: string, answer: string) => {
    const existing = answers.filter((a: any) => a.question_id !== questionId);
    onResponseChange({ answers: [...existing, { question_id: questionId, answer }] });
  };
  
  return (
    <div>
      <p className="text-slate-400 text-sm mb-4">Data visualisation would render here based on data_type</p>
      <div className="space-y-4">
        {stimulus.questions.map((q: any) => (
          <div key={q.id}>
            <p className="text-slate-200 mb-2">{q.question}</p>
            {q.options ? (
              <div className="flex gap-2 flex-wrap">
                {q.options.map((opt: string) => (
                  <button
                    key={opt}
                    onClick={() => setAnswer(q.id, opt)}
                    className={`px-3 py-1 rounded border ${
                      answers.find((a: any) => a.question_id === q.id)?.answer === opt
                        ? 'bg-cyan-500/20 border-cyan-500 text-cyan-200'
                        : 'border-slate-700 text-slate-300'
                    }`}
                  >
                    {opt}
                  </button>
                ))}
              </div>
            ) : (
              <input
                type="text"
                value={answers.find((a: any) => a.question_id === q.id)?.answer || ''}
                onChange={(e) => setAnswer(q.id, e.target.value)}
                className="w-full p-2 bg-slate-900 border border-slate-700 rounded text-slate-200"
              />
            )}
          </div>
        ))}
      </div>
    </div>
  );
}


// ============================================================================
// RATING SCALE COMPONENT
// ============================================================================

interface RatingScaleProps {
  label: string;
  value: number | null;
  onChange: (value: number) => void;
  lowLabel: string;
  highLabel: string;
}

function RatingScale({ label, value, onChange, lowLabel, highLabel }: RatingScaleProps) {
  return (
    <div>
      <p className="text-slate-200 mb-3">{label}</p>
      <div className="flex items-center gap-2">
        <span className="text-slate-500 text-xs w-20">{lowLabel}</span>
        <div className="flex gap-1 flex-1 justify-center">
          {[1, 2, 3, 4, 5].map((n) => (
            <button
              key={n}
              onClick={() => onChange(n)}
              className={`w-10 h-10 rounded-full border-2 transition-all ${
                value === n
                  ? 'bg-cyan-500 border-cyan-500 text-white'
                  : 'border-slate-600 text-slate-400 hover:border-slate-500'
              }`}
            >
              {n}
            </button>
          ))}
        </div>
        <span className="text-slate-500 text-xs w-20 text-right">{highLabel}</span>
      </div>
    </div>
  );
}


// ============================================================================
// UTILITIES
// ============================================================================

function formatTaskType(type: string): string {
  const labels: Record<string, string> = {
    PROOFREAD: 'Proofreading',
    ESTIMATION: 'Estimation',
    CATEGORISATION: 'Categorisation',
    PRIORITISATION: 'Prioritisation',
    PATTERN: 'Pattern Recognition',
    DATA_INTERPRET: 'Data Interpretation',
    SCENARIO_JUDGE: 'Scenario Judgement',
  };
  return labels[type] || type;
}

function formatTime(seconds: number): string {
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  return `${mins}:${secs.toString().padStart(2, '0')}`;
}
