// src/app/assessment/mini-samples/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState } from '@/lib/assessment';
import { supabase } from '@/lib/supabase';
import TaskTimer from '@/components/mini-samples/TaskTimer';
import EnjoymentRating from '@/components/mini-samples/EnjoymentRating';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  ProgressBar,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

interface MiniSampleItem {
  id: string;
  sample_type: 'CODE_TRACE' | 'SOURCE_ANALYSIS' | 'DATA_INTERPRETATION';
  difficulty: string;
  stimulus: string;
  questions: {
    part_id: string;
    text: string;
    type: 'MCQ' | 'SHORT_RESPONSE' | 'MULTI_SELECT';
    options?: string[];
    max_selections?: number;
  }[];
  correct_answers: Record<string, any>;
  time_limit_seconds: number;
  cluster_tags: string[];
}

const TASK_ORDER: MiniSampleItem['sample_type'][] = [
  'CODE_TRACE',
  'SOURCE_ANALYSIS',
  'DATA_INTERPRETATION'
];

const TASK_LABELS: Record<string, { title: string; cluster: string }> = {
  'CODE_TRACE': { title: 'Code Trace', cluster: 'STEM' },
  'SOURCE_ANALYSIS': { title: 'Source Analysis', cluster: 'Humanities' },
  'DATA_INTERPRETATION': { title: 'Data Interpretation', cluster: 'Analytical' },
};

export default function MiniSamplesPage() {
  const router = useRouter();
  const [tasks, setTasks] = useState<MiniSampleItem[]>([]);
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [responses, setResponses] = useState<Record<string, string | string[]>>({});
  const [showEnjoyment, setShowEnjoyment] = useState(false);
  const [timerRunning, setTimerRunning] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const secondsElapsedRef = useRef(0);

  const currentTask = tasks[currentTaskIndex];
  const progress = tasks.length > 0 ? Math.round((currentTaskIndex / tasks.length) * 100) : 0;

  // Load session and tasks
  useEffect(() => {
    const loadData = async () => {
      const state = getInitialState();
      if (!state.sessionId) {
        router.push('/');
        return;
      }
      setSessionId(state.sessionId);

      // Load mini-sample items in order
      const { data, error } = await supabase
        .from('bo_v1_mini_sample_items')
        .select('*')
        .eq('active', true);

      if (error) {
        console.error('Error loading tasks:', error);
        return;
      }

      // Sort by TASK_ORDER
      const sortedTasks = TASK_ORDER
        .map(type => data?.find(t => t.sample_type === type))
        .filter(Boolean) as MiniSampleItem[];

      setTasks(sortedTasks);
      setLoading(false);
      setTimerRunning(true);
    };

    loadData();
  }, [router]);

  // Reset state when task changes
  useEffect(() => {
    setResponses({});
    secondsElapsedRef.current = 0;
    setTimerRunning(true);
  }, [currentTaskIndex]);

  const handleResponseChange = (partId: string, value: string | string[]) => {
    setResponses(prev => ({ ...prev, [partId]: value }));
  };

  const handleTimeUpdate = (seconds: number) => {
    secondsElapsedRef.current = seconds;
  };

  const handleSubmitTask = () => {
    setTimerRunning(false);
    setShowEnjoyment(true);
  };

  const handleEnjoymentSubmit = async (rating: number, feedback?: string) => {
    if (!currentTask || !sessionId || submitting) return;

    setSubmitting(true);

    // Calculate scores
    const scores: Record<string, boolean> = {};
    let correctCount = 0;
    let totalQuestions = currentTask.questions.length;

    for (const q of currentTask.questions) {
      const answer = currentTask.correct_answers[q.part_id];
      const userResponse = responses[q.part_id];

      if (q.type === 'MCQ' && answer?.correct !== undefined) {
        const isCorrect = userResponse === String(answer.correct);
        scores[q.part_id] = isCorrect;
        if (isCorrect) correctCount++;
      } else if (q.type === 'SHORT_RESPONSE') {
        // For short response, we'll just mark as attempted
        scores[q.part_id] = !!userResponse;
        if (userResponse) correctCount += 0.5; // Partial credit for attempting
      } else if (q.type === 'MULTI_SELECT' && Array.isArray(answer?.correct)) {
        const selected = Array.isArray(userResponse) ? userResponse.map(Number) : [];
        const correct = answer.correct as number[];
        const isCorrect = correct.length === selected.length &&
          correct.every(c => selected.includes(c));
        scores[q.part_id] = isCorrect;
        if (isCorrect) correctCount++;
      }
    }

    const scorePercentage = Math.round((correctCount / totalQuestions) * 100);

    // Save response to database
    await supabase.from('bo_v1_mini_sample_responses').insert({
      session_id: sessionId,
      item_id: currentTask.id,
      responses: responses,
      scores: scores,
      total_score: scorePercentage / 100 * 5, // Max score is 5
      time_spent_ms: secondsElapsedRef.current * 1000,
      revision_count: 0,
      enjoyment_rating: rating,
      completed: true,
      skipped: false,
    });

    // Update session flags
    const sessionUpdate: Record<string, boolean> = {};
    if (currentTask.sample_type === 'CODE_TRACE') {
      sessionUpdate.mini_sample_code_completed = true;
    } else if (currentTask.sample_type === 'SOURCE_ANALYSIS') {
      sessionUpdate.mini_sample_source_completed = true;
    } else if (currentTask.sample_type === 'DATA_INTERPRETATION') {
      sessionUpdate.mini_sample_data_completed = true;
    }

    if (currentTaskIndex === tasks.length - 1) {
      sessionUpdate.mini_samples_completed = true;
    }

    await supabase
      .from('bo_v1_sessions')
      .update(sessionUpdate)
      .eq('id', sessionId);

    setShowEnjoyment(false);
    setSubmitting(false);

    // Move to next task or complete
    if (currentTaskIndex + 1 >= tasks.length) {
      const state = getInitialState();
      saveState({ ...state, stage: 'processing' });
      router.push('/assessment/processing');
    } else {
      setCurrentTaskIndex(currentTaskIndex + 1);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  if (!currentTask) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <p className="text-[#54acbf]">No tasks found</p>
      </div>
    );
  }

  const taskInfo = TASK_LABELS[currentTask.sample_type];
  const allQuestionsAnswered = currentTask.questions.every(
    q => responses[q.part_id] !== undefined && responses[q.part_id] !== ''
  );

  return (
    <main className="min-h-screen relative overflow-hidden bg-[#011c40]">
      <Atmosphere variant="subtle" />
      <GradientFade position="bottom" />

      {/* Enjoyment Rating Overlay */}
      {showEnjoyment && (
        <EnjoymentRating onSubmit={handleEnjoymentSubmit} />
      )}

      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 px-8 py-6 flex justify-between items-center z-40">
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2">
            <GemIcon glow color={ARCANE_COLORS.teal} />
            <span className="text-xs font-black uppercase tracking-[0.3em] text-[#a7ebf2]">ERA</span>
          </div>
        </div>
        <div className="flex items-center gap-6">
          <TaskTimer
            initialSeconds={currentTask.time_limit_seconds}
            onTimeUpdate={handleTimeUpdate}
            isRunning={timerRunning}
          />
          <span className="text-[11px] uppercase tracking-[0.2em] text-[#26658c]">
            {currentTaskIndex + 1} / {tasks.length}
          </span>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-6 min-h-screen flex flex-col pt-24 pb-12">

        {/* Header */}
        <div className="text-center mb-4">
          <span className="text-[#54acbf] text-xs uppercase tracking-[0.3em]">
            {taskInfo.cluster} Preview
          </span>
          <h1 className="text-2xl lg:text-3xl font-bold text-[#a7ebf2] mt-2">
            {taskInfo.title}
          </h1>
        </div>

        {/* Progress Bar */}
        <div className="max-w-md mx-auto w-full mb-6">
          <ProgressBar value={progress} showLabel />
        </div>

        {/* Task Content */}
        <div className="flex-1 flex flex-col lg:flex-row gap-6 max-w-6xl mx-auto w-full">

          {/* Stimulus Panel */}
          <div className="lg:w-1/2">
            <CardFrame active={true}>
              <div className="p-6 h-full">
                <h3 className="text-sm uppercase tracking-wider text-[#54acbf] mb-4">
                  {currentTask.sample_type === 'CODE_TRACE' ? 'Code' :
                   currentTask.sample_type === 'SOURCE_ANALYSIS' ? 'Passage' : 'Data'}
                </h3>
                <div className={`
                  ${currentTask.sample_type === 'CODE_TRACE'
                    ? 'font-mono text-sm bg-[#0a1628] p-4 rounded-lg overflow-x-auto'
                    : 'text-base leading-relaxed'}
                  text-[#a7ebf2] whitespace-pre-wrap
                `}>
                  {currentTask.stimulus}
                </div>
              </div>
            </CardFrame>
          </div>

          {/* Questions Panel */}
          <div className="lg:w-1/2">
            <CardFrame active={true}>
              <div className="p-6">
                <h3 className="text-sm uppercase tracking-wider text-[#54acbf] mb-4">
                  Questions
                </h3>

                <div className="space-y-6">
                  {currentTask.questions.map((q, idx) => (
                    <div key={q.part_id} className="border-b border-[#26658c]/30 pb-6 last:border-0">
                      <p className="text-[#a7ebf2] mb-4">
                        <span className="text-[#54acbf] font-bold mr-2">{idx + 1}.</span>
                        {q.text}
                      </p>

                      {q.type === 'MCQ' && q.options && (
                        <div className="space-y-2">
                          {q.options.map((option, optIdx) => (
                            <label
                              key={optIdx}
                              className={`
                                flex items-center gap-3 p-3 rounded-lg cursor-pointer
                                border-2 transition-all duration-200
                                ${responses[q.part_id] === String(optIdx)
                                  ? 'bg-[#54acbf]/20 border-[#54acbf]'
                                  : 'bg-transparent border-[#26658c] hover:border-[#54acbf]/50'}
                              `}
                            >
                              <input
                                type="radio"
                                name={q.part_id}
                                value={optIdx}
                                checked={responses[q.part_id] === String(optIdx)}
                                onChange={(e) => handleResponseChange(q.part_id, e.target.value)}
                                className="sr-only"
                              />
                              <span className={`
                                w-5 h-5 rounded-full border-2 flex items-center justify-center
                                ${responses[q.part_id] === String(optIdx)
                                  ? 'border-[#54acbf] bg-[#54acbf]'
                                  : 'border-[#54acbf]'}
                              `}>
                                {responses[q.part_id] === String(optIdx) && (
                                  <span className="w-2 h-2 rounded-full bg-[#011c40]" />
                                )}
                              </span>
                              <span className="text-[#a7ebf2] text-sm">{option}</span>
                            </label>
                          ))}
                        </div>
                      )}

                      {q.type === 'SHORT_RESPONSE' && (
                        <textarea
                          value={(responses[q.part_id] as string) || ''}
                          onChange={(e) => handleResponseChange(q.part_id, e.target.value)}
                          placeholder="Type your answer here..."
                          className="
                            w-full p-3 rounded-lg
                            bg-[#0a1628] border-2 border-[#26658c]
                            text-[#a7ebf2] placeholder-[#26658c]
                            focus:outline-none focus:border-[#54acbf]
                            resize-none
                          "
                          rows={3}
                        />
                      )}

                      {q.type === 'MULTI_SELECT' && q.options && (
                        <div className="space-y-2">
                          <p className="text-xs text-[#26658c] mb-2">
                            Select up to {q.max_selections || 2}
                          </p>
                          {q.options.map((option, optIdx) => {
                            const selected = Array.isArray(responses[q.part_id])
                              ? (responses[q.part_id] as string[]).includes(String(optIdx))
                              : false;
                            const currentSelections = Array.isArray(responses[q.part_id])
                              ? (responses[q.part_id] as string[]).length
                              : 0;
                            const maxReached = currentSelections >= (q.max_selections || 2);

                            return (
                              <label
                                key={optIdx}
                                className={`
                                  flex items-center gap-3 p-3 rounded-lg cursor-pointer
                                  border-2 transition-all duration-200
                                  ${selected
                                    ? 'bg-[#54acbf]/20 border-[#54acbf]'
                                    : maxReached && !selected
                                      ? 'bg-transparent border-[#26658c]/30 opacity-50 cursor-not-allowed'
                                      : 'bg-transparent border-[#26658c] hover:border-[#54acbf]/50'}
                                `}
                              >
                                <input
                                  type="checkbox"
                                  checked={selected}
                                  disabled={maxReached && !selected}
                                  onChange={() => {
                                    const current = Array.isArray(responses[q.part_id])
                                      ? [...(responses[q.part_id] as string[])]
                                      : [];
                                    if (selected) {
                                      handleResponseChange(
                                        q.part_id,
                                        current.filter(v => v !== String(optIdx))
                                      );
                                    } else if (current.length < (q.max_selections || 2)) {
                                      handleResponseChange(q.part_id, [...current, String(optIdx)]);
                                    }
                                  }}
                                  className="sr-only"
                                />
                                <span className={`
                                  w-5 h-5 rounded border-2 flex items-center justify-center
                                  ${selected
                                    ? 'border-[#54acbf] bg-[#54acbf]'
                                    : 'border-[#54acbf]'}
                                `}>
                                  {selected && (
                                    <svg className="w-3 h-3 text-[#011c40]" fill="currentColor" viewBox="0 0 20 20">
                                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                                    </svg>
                                  )}
                                </span>
                                <span className="text-[#a7ebf2] text-sm">{option}</span>
                              </label>
                            );
                          })}
                        </div>
                      )}
                    </div>
                  ))}
                </div>

                {/* Submit Button */}
                <button
                  onClick={handleSubmitTask}
                  disabled={!allQuestionsAnswered || submitting}
                  className={`
                    w-full mt-6 py-4 rounded-lg font-bold uppercase tracking-wider
                    transition-all duration-200
                    ${allQuestionsAnswered && !submitting
                      ? 'bg-[#54acbf] text-[#011c40] hover:bg-[#a7ebf2]'
                      : 'bg-[#26658c]/30 text-[#26658c] cursor-not-allowed'}
                  `}
                >
                  {submitting ? 'Submitting...' : 'Submit Answers'}
                </button>

              </div>
            </CardFrame>
          </div>

        </div>

      </div>
    </main>
  );
}
