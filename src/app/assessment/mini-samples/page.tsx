// src/app/assessment/mini-samples/page.tsx
'use client';

import { useEffect, useState, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addMiniSampleResponse } from '@/lib/assessment';
import { supabase } from '@/lib/supabase';
import { MiniSampleResponse, EnjoymentRating, MetaCluster } from '@/lib/types';

// ============================================================================
// TYPES
// ============================================================================

interface MiniSampleTask {
  id: string;
  meta_cluster: MetaCluster;
  title: string;
  stimulus: string;
  question: string;
  task_type: 'MCQ' | 'SHORT_RESPONSE';
  options: string[];
  time_limit: number;
  correct_answer?: number;
}

// ============================================================================
// HARDCODED TASKS (from ArenaUIOverhaul spec)
// ============================================================================

const TASKS: MiniSampleTask[] = [
  {
    id: 'task_stem_tech',
    meta_cluster: 'STEM_TECH',
    title: 'System Debugging',
    task_type: 'MCQ',
    time_limit: 90,
    stimulus: `A smart plant watering system is failing.

Rules:
1. IF soil_moisture < 30% AND tank_level > 10% THEN activate_pump()
2. IF pump_is_active AND time > 60s THEN emergency_stop()

Current State:
soil_moisture = 25%
tank_level = 5%
pump_status = OFF`,
    question: 'Why didn\'t the pump activate?',
    options: [
      'Soil moisture is too high',
      'Tank level is too low',
      'Emergency stop was triggered',
      'Sensor malfunction'
    ],
    correct_answer: 1
  },
  {
    id: 'task_stem_sci',
    meta_cluster: 'STEM_SCI',
    title: 'Experimental Analysis',
    task_type: 'MCQ',
    time_limit: 90,
    stimulus: `You're growing bacteria in petri dishes. Dish A (control) should show normal growth. Dish B (experimental) should show reduced growth due to a new antibiotic.

Day 3 Results:
- Dish A: Dense bacterial colonies (expected)
- Dish B: Dense bacterial colonies (unexpected!)
- Dish B also has blue-green patches around edges`,
    question: 'What\'s the most scientifically interesting next step?',
    options: [
      'Conclude the antibiotic doesn\'t work',
      'Investigate what the blue-green patches are',
      'Repeat the experiment with fresh materials',
      'Increase the antibiotic concentration'
    ],
    correct_answer: 1
  },
  {
    id: 'task_humanities',
    meta_cluster: 'HUMANITIES',
    title: 'Argument Logic',
    task_type: 'MCQ',
    time_limit: 90,
    stimulus: `Historian A: "The Roman Empire fell primarily due to internal economic corruption."

Historian B: "That cannot be true; the Barbarian invasions of 476 AD were the definitive end point of the Western Empire."`,
    question: 'What is the main flaw in Historian B\'s counter-argument?',
    options: [
      'They confuse a symptom with a cause',
      'They rely on an arbitrary date to dismiss a long-term process',
      'They ignore the Eastern Roman Empire',
      'They provide no evidence for invasions'
    ],
    correct_answer: 1
  },
  {
    id: 'task_social_sci',
    meta_cluster: 'SOCIAL_SCI',
    title: 'Policy Analysis',
    task_type: 'SHORT_RESPONSE',
    time_limit: 90,
    stimulus: `A company mandates all employees work from office 5 days/week, claiming "remote work reduces productivity and team cohesion."`,
    question: 'In 2-3 sentences, identify one hidden assumption in this policy.',
    options: []
  },
  {
    id: 'task_professional',
    meta_cluster: 'PROFESSIONAL',
    title: 'Triage Scenario',
    task_type: 'SHORT_RESPONSE',
    time_limit: 90,
    stimulus: `You are a junior doctor. Two patients arrive simultaneously:

1. Elderly patient with chest pain (potential heart attack)
2. Child with a deep gash on their leg (bleeding heavily but stable)`,
    question: 'Who do you assess first and why? (2-3 sentences)',
    options: []
  },
  {
    id: 'task_creative',
    meta_cluster: 'CREATIVE',
    title: 'Design Trade-off',
    task_type: 'SHORT_RESPONSE',
    time_limit: 90,
    stimulus: `You are designing a sustainable smartphone. You must choose between:

A) Biodegradable casing (durability: 2 years)
B) Recycled Aluminum casing (durability: 6 years)`,
    question: 'Which do you choose for maximum sustainability? Justify considering user behaviour.',
    options: []
  }
];

// ============================================================================
// CIRCULAR TIMER COMPONENT
// ============================================================================

function CircularTimer({ duration, timeLeft }: { duration: number; timeLeft: number }) {
  const radius = 20;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (timeLeft / duration) * circumference;

  let colorClass = 'text-[#4ade80]';
  if (timeLeft < 30) colorClass = 'text-red-400';
  else if (timeLeft < 60) colorClass = 'text-amber-400';

  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60);
    const s = seconds % 60;
    return `${m}:${s.toString().padStart(2, '0')}`;
  };

  return (
    <div className="relative flex items-center justify-center">
      <svg className="transform -rotate-90 w-12 h-12">
        <circle
          cx="24"
          cy="24"
          r={radius}
          className="stroke-gray-700"
          strokeWidth="4"
          fill="transparent"
        />
        <circle
          cx="24"
          cy="24"
          r={radius}
          className={`${colorClass} transition-all duration-1000 ease-linear`}
          stroke="currentColor"
          strokeWidth="4"
          fill="transparent"
          strokeDasharray={circumference}
          strokeDashoffset={offset}
          strokeLinecap="round"
        />
      </svg>
      <span className={`absolute text-[10px] font-bold ${colorClass}`}>
        {timeLeft > 0 ? formatTime(timeLeft) : '0:00'}
      </span>
    </div>
  );
}

// ============================================================================
// ENJOYMENT MODAL COMPONENT
// ============================================================================

function EnjoymentModal({
  onContinue
}: {
  onContinue: (enjoyment: EnjoymentRating, careerFit: EnjoymentRating) => void;
}) {
  const [taskRating, setTaskRating] = useState<EnjoymentRating | null>(null);
  const [dailyRating, setDailyRating] = useState<EnjoymentRating | null>(null);

  const taskOptions: { value: EnjoymentRating; emoji: string; label: string }[] = [
    { value: -1, emoji: '😫', label: 'Hated it' },
    { value: 0, emoji: '😐', label: 'Fine' },
    { value: 1, emoji: '😊', label: 'Loved it' },
  ];

  const dailyOptions: { value: EnjoymentRating; emoji: string; label: string }[] = [
    { value: -1, emoji: '😫', label: 'No way' },
    { value: 0, emoji: '😐', label: 'Maybe' },
    { value: 1, emoji: '😊', label: 'Definitely' },
  ];

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/90 backdrop-blur-md p-4">
      <div className="bg-[#011c40] border border-white/10 rounded-3xl shadow-2xl p-8 max-w-md w-full text-center relative overflow-hidden animate-in fade-in zoom-in-95 duration-300">
        <div className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-transparent via-[#54acbf] to-transparent" />

        <h3 className="text-2xl font-bold text-white mb-8">Feedback</h3>

        {/* Task Rating */}
        <div className="mb-8">
          <h4 className="text-gray-300 font-medium mb-4">How did you find that task?</h4>
          <div className="flex justify-center space-x-3">
            {taskOptions.map((opt) => (
              <button
                key={opt.value}
                onClick={() => setTaskRating(opt.value)}
                className={`flex flex-col items-center justify-center w-20 h-20 rounded-full border-2 transition-all duration-200 ${
                  taskRating === opt.value
                    ? 'bg-white/10 border-[#54acbf] scale-110 shadow-[0_0_20px_rgba(84,172,191,0.3)]'
                    : 'bg-black/20 border-white/10 hover:border-white/30 hover:bg-white/5'
                }`}
              >
                <span className="text-2xl mb-1">{opt.emoji}</span>
                <span className={`text-[10px] font-bold uppercase tracking-wide ${
                  taskRating === opt.value ? 'text-white' : 'text-gray-500'
                }`}>
                  {opt.label}
                </span>
              </button>
            ))}
          </div>
        </div>

        <div className="w-full h-px bg-white/10 mb-8" />

        {/* Daily Rating */}
        <div className="mb-8">
          <h4 className="text-gray-300 font-medium mb-4">Could you see yourself doing this daily?</h4>
          <div className="flex justify-center space-x-3">
            {dailyOptions.map((opt) => (
              <button
                key={opt.value}
                onClick={() => setDailyRating(opt.value)}
                className={`flex flex-col items-center justify-center w-20 h-20 rounded-full border-2 transition-all duration-200 ${
                  dailyRating === opt.value
                    ? 'bg-white/10 border-[#54acbf] scale-110 shadow-[0_0_20px_rgba(84,172,191,0.3)]'
                    : 'bg-black/20 border-white/10 hover:border-white/30 hover:bg-white/5'
                }`}
              >
                <span className="text-2xl mb-1">{opt.emoji}</span>
                <span className={`text-[10px] font-bold uppercase tracking-wide ${
                  dailyRating === opt.value ? 'text-white' : 'text-gray-500'
                }`}>
                  {opt.label}
                </span>
              </button>
            ))}
          </div>
        </div>

        <button
          disabled={taskRating === null || dailyRating === null}
          onClick={() => onContinue(taskRating!, dailyRating!)}
          className={`w-full py-3 rounded-xl font-semibold transition-all ${
            taskRating !== null && dailyRating !== null
              ? 'bg-[#54acbf] text-[#011c40] hover:bg-[#54acbf]/90'
              : 'bg-gray-700 text-gray-500 cursor-not-allowed'
          }`}
        >
          Continue
        </button>
      </div>
    </div>
  );
}

// ============================================================================
// MAIN PAGE COMPONENT
// ============================================================================

export default function MiniSamplesPage() {
  const router = useRouter();
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [timeLeft, setTimeLeft] = useState(90);
  const [isOvertime, setIsOvertime] = useState(false);
  const [selectedOption, setSelectedOption] = useState<number | null>(null);
  const [textResponse, setTextResponse] = useState('');
  const [showEnjoyment, setShowEnjoyment] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [state, setState] = useState(getInitialState());
  const startTimeRef = useRef(Date.now());

  const currentTask = TASKS[currentTaskIndex];
  const progressPercent = Math.round((currentTaskIndex / TASKS.length) * 100);

  // Load session
  useEffect(() => {
    const initialState = getInitialState();
    if (!initialState.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(initialState.sessionId);
    setState(initialState);
    // Resume from where user left off
    const completedCount = initialState.miniSampleResponses?.length || 0;
    if (completedCount > 0 && completedCount < TASKS.length) {
      setCurrentTaskIndex(completedCount);
    }
  }, [router]);

  // Timer logic
  useEffect(() => {
    if (timeLeft <= 0) {
      setIsOvertime(true);
      return;
    }
    const timer = setInterval(() => {
      setTimeLeft((prev) => prev - 1);
    }, 1000);
    return () => clearInterval(timer);
  }, [timeLeft]);

  // Reset state when task changes
  useEffect(() => {
    setTimeLeft(currentTask.time_limit);
    setIsOvertime(false);
    setSelectedOption(null);
    setTextResponse('');
    startTimeRef.current = Date.now();
  }, [currentTaskIndex, currentTask.time_limit]);

  // Validation
  const isValid = currentTask.task_type === 'MCQ'
    ? selectedOption !== null
    : textResponse.length >= 50 && textResponse.length <= 300;

  const handleSubmit = () => {
    setShowEnjoyment(true);
  };

  const handleEnjoymentComplete = async (enjoyment: EnjoymentRating, careerFit: EnjoymentRating) => {
    if (submitting || !sessionId) return;
    setSubmitting(true);

    const timeTaken = Math.round((Date.now() - startTimeRef.current) / 1000);
    const answer = currentTask.task_type === 'MCQ'
      ? currentTask.options[selectedOption!]
      : textResponse;

    // Calculate score
    let score = 0;
    if (currentTask.task_type === 'MCQ' && currentTask.correct_answer !== undefined) {
      score = selectedOption === currentTask.correct_answer ? 3 : 1;
    } else if (currentTask.task_type === 'SHORT_RESPONSE') {
      score = textResponse.length >= 100 ? 2 : 1;
    }

    const newResponse: MiniSampleResponse = {
      task_id: currentTask.id,
      response: answer,
      score,
      time_taken_seconds: timeTaken,
      enjoyment_rating: enjoyment,
      career_fit_rating: careerFit,
    };

    // Save to database
    await supabase.from('bo_v1_mini_sample_responses').insert({
      session_id: sessionId,
      task_id: currentTask.id,
      response_text: answer,
      score,
      time_taken_ms: timeTaken * 1000,
      enjoyment_rating: enjoyment,
      career_fit_rating: careerFit,
    });

    // Update local state
    const newState = addMiniSampleResponse(state, newResponse);
    setState(newState);
    saveState(newState);

    setShowEnjoyment(false);

    if (currentTaskIndex < TASKS.length - 1) {
      setSubmitting(false);
      setCurrentTaskIndex((prev) => prev + 1);
    } else {
      // All tasks complete
      await supabase
        .from('bo_v1_sessions')
        .update({ mini_samples_completed: true })
        .eq('id', sessionId);

      saveState({ ...newState, stage: 'processing' });
      router.push('/assessment/processing');
    }
  };

  const handleSkip = async () => {
    if (currentTaskIndex < TASKS.length - 1) {
      setCurrentTaskIndex((prev) => prev + 1);
    } else {
      if (sessionId) {
        await supabase
          .from('bo_v1_sessions')
          .update({ mini_samples_completed: true })
          .eq('id', sessionId);
      }
      saveState({ ...state, stage: 'processing' });
      router.push('/assessment/processing');
    }
  };

  return (
    <div className="flex flex-col min-h-screen bg-[#011c40] text-white">
      {/* Header */}
      <div className="flex-none p-6 border-b border-white/10 bg-[#011c40]/80 backdrop-blur-md sticky top-0 z-30">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <div>
            <div className="text-gray-500 font-bold tracking-widest text-xs uppercase mb-1">
              Task {currentTaskIndex + 1} of {TASKS.length}: {currentTask.meta_cluster.replace('_', '-')}
            </div>
            <div className="w-48 h-1.5 bg-gray-800 rounded-full overflow-hidden">
              <div
                className="h-full bg-gradient-to-r from-[#54acbf] to-[#4ade80] transition-all duration-500"
                style={{ width: `${progressPercent}%` }}
              />
            </div>
          </div>

          <div className="flex items-center space-x-4">
            {isOvertime && (
              <span className="text-xs text-red-500 font-bold animate-pulse flex items-center border border-red-500/20 bg-red-500/10 px-2 py-1 rounded">
                <svg className="w-3 h-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                </svg>
                Overtime
              </span>
            )}
            <CircularTimer duration={currentTask.time_limit} timeLeft={timeLeft} />
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 overflow-y-auto">
        <div className="max-w-2xl mx-auto p-6 pb-32">
          {/* Stimulus Card */}
          <div className="bg-[#023859]/50 rounded-xl border border-white/10 overflow-hidden mb-8 shadow-lg">
            <div className="bg-white/5 px-6 py-3 border-b border-white/5 flex items-center space-x-2">
              {currentTask.task_type === 'MCQ' ? (
                <svg className="w-4 h-4 text-[#54acbf]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
                </svg>
              ) : (
                <svg className="w-4 h-4 text-[#4ade80]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
              )}
              <span className="text-xs font-bold text-gray-400 uppercase tracking-wider">Stimulus</span>
            </div>
            <div className="p-6">
              <div className="text-gray-200 leading-relaxed whitespace-pre-line text-lg font-medium">
                {currentTask.stimulus}
              </div>
            </div>
          </div>

          {/* Question Section */}
          <div className="mb-8">
            <h2 className="text-2xl font-bold text-white mb-6 leading-snug">{currentTask.question}</h2>

            {currentTask.task_type === 'MCQ' ? (
              <div className="space-y-3">
                {currentTask.options.map((opt, idx) => (
                  <label
                    key={idx}
                    className={`flex items-center p-4 rounded-xl border-2 cursor-pointer transition-all duration-200 ${
                      selectedOption === idx
                        ? 'bg-[#54acbf]/10 border-[#54acbf] shadow-[0_0_15px_rgba(84,172,191,0.2)]'
                        : 'bg-[#023859]/30 border-white/10 hover:border-white/30'
                    }`}
                  >
                    <div className={`w-6 h-6 rounded-full border-2 flex items-center justify-center mr-4 transition-colors ${
                      selectedOption === idx ? 'border-[#54acbf]' : 'border-gray-600'
                    }`}>
                      {selectedOption === idx && <div className="w-3 h-3 rounded-full bg-[#54acbf]" />}
                    </div>
                    <span className={`text-lg ${selectedOption === idx ? 'text-white' : 'text-gray-400'}`}>
                      <input
                        type="radio"
                        name="mcq-opt"
                        className="hidden"
                        value={idx}
                        onChange={() => setSelectedOption(idx)}
                      />
                      {opt}
                    </span>
                  </label>
                ))}
              </div>
            ) : (
              <div className="relative">
                <textarea
                  className="w-full bg-[#023859]/30 border border-white/10 rounded-xl p-4 text-white placeholder-gray-600 focus:border-[#54acbf] focus:ring-1 focus:ring-[#54acbf] outline-none transition-all resize-none min-h-[160px] text-lg"
                  placeholder="Type your response here..."
                  value={textResponse}
                  onChange={(e) => setTextResponse(e.target.value.slice(0, 300))}
                />
                <div className="flex justify-between mt-2 text-xs">
                  <span className={textResponse.length < 50 ? 'text-amber-400' : 'text-[#4ade80]'}>
                    Min 50 chars
                  </span>
                  <span className="text-gray-500">
                    {textResponse.length} / 300
                  </span>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Footer Actions */}
      <div className="flex-none p-6 border-t border-white/10 bg-[#011c40] z-40">
        <div className="max-w-2xl mx-auto flex items-center justify-between">
          <button
            onClick={handleSkip}
            className="text-gray-500 hover:text-white text-sm font-medium flex items-center gap-2 transition-colors"
          >
            Skip Task
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 5l7 7-7 7M5 5l7 7-7 7" />
            </svg>
          </button>

          <button
            disabled={!isValid || submitting}
            onClick={handleSubmit}
            className={`min-w-[160px] py-3 px-6 rounded-xl font-semibold transition-all ${
              isValid && !submitting
                ? 'bg-[#54acbf] text-[#011c40] hover:bg-[#54acbf]/90'
                : 'bg-gray-700 text-gray-500 cursor-not-allowed'
            }`}
          >
            {submitting ? 'Submitting...' : 'Submit'}
          </button>
        </div>
      </div>

      {/* Enjoyment Modal */}
      {showEnjoyment && (
        <EnjoymentModal onContinue={handleEnjoymentComplete} />
      )}
    </div>
  );
}
