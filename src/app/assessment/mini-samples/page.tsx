// src/app/assessment/mini-samples/page.tsx
// ExamRizz Arena v9 - Mini-Sample Tasks (Overhauled Jan 4, 2025)
// 6 experiential tasks across meta-clusters with enjoyment + career fit ratings
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addMiniSampleResponse } from '@/lib/assessment';
import { MiniSampleTask, MiniSampleResponse, EnjoymentRating, MetaCluster } from '@/lib/types';
import { supabase } from '@/lib/supabase';
import TaskTimer from '@/components/mini-samples/TaskTimer';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  ProgressBar,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

// Meta-cluster display info
const CLUSTER_INFO: Record<MetaCluster, { title: string; description: string }> = {
  STEM_TECH: { title: 'Technical Challenge', description: 'Computing, Engineering, Maths' },
  STEM_SCI: { title: 'Scientific Observation', description: 'Biology, Chemistry, Physics' },
  HUMANITIES: { title: 'Argument Analysis', description: 'History, Philosophy, Languages' },
  SOCIAL_SCI: { title: 'Hidden Assumptions', description: 'Psychology, Economics, Politics' },
  PROFESSIONAL: { title: 'Competing Interests', description: 'Law, Business, Medicine' },
  CREATIVE: { title: 'Design Trade-offs', description: 'Art, Architecture, Media' },
};

export default function MiniSamplesPage() {
  const router = useRouter();
  const [tasks, setTasks] = useState<MiniSampleTask[]>([]);
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [state, setState] = useState(getInitialState());

  // Task response state
  const [response, setResponse] = useState<string | number>('');
  const [timerRunning, setTimerRunning] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  // Enjoyment rating state
  const [showEnjoymentRating, setShowEnjoymentRating] = useState(false);
  const [showCareerFitRating, setShowCareerFitRating] = useState(false);
  const [enjoymentRating, setEnjoymentRating] = useState<EnjoymentRating | null>(null);
  const [careerFitRating, setCareerFitRating] = useState<EnjoymentRating | null>(null);

  const secondsElapsedRef = useRef(0);
  const currentTask = tasks[currentTaskIndex];
  const progress = tasks.length > 0 ? Math.round((currentTaskIndex / tasks.length) * 100) : 0;

  // Load session and tasks
  useEffect(() => {
    const loadData = async () => {
      const initialState = getInitialState();
      if (!initialState.sessionId) {
        router.push('/');
        return;
      }
      setSessionId(initialState.sessionId);
      setState(initialState);

      // Load mini-sample tasks from database
      const { data, error } = await supabase
        .from('bo_v1_mini_samples')
        .select('*')
        .eq('active', true)
        .order('sort_order');

      if (error) {
        console.error('Error loading tasks:', error);
        return;
      }

      setTasks(data || []);
      setCurrentTaskIndex(initialState.miniSampleResponses.length);
      setLoading(false);
      setTimerRunning(true);
    };

    loadData();
  }, [router]);

  // Reset state when task changes
  useEffect(() => {
    setResponse('');
    secondsElapsedRef.current = 0;
    setTimerRunning(true);
    setShowEnjoymentRating(false);
    setShowCareerFitRating(false);
    setEnjoymentRating(null);
    setCareerFitRating(null);
  }, [currentTaskIndex]);

  const handleTimeUpdate = (seconds: number) => {
    secondsElapsedRef.current = seconds;
  };

  const handleSubmitTask = () => {
    if (!response && response !== 0) return;
    setTimerRunning(false);
    setShowEnjoymentRating(true);
  };

  const handleEnjoymentSelect = (rating: EnjoymentRating) => {
    setEnjoymentRating(rating);
    setShowEnjoymentRating(false);
    setShowCareerFitRating(true);
  };

  const handleCareerFitSelect = async (rating: EnjoymentRating) => {
    if (!currentTask || !sessionId || submitting || enjoymentRating === null) return;

    setCareerFitRating(rating);
    setSubmitting(true);

    // Calculate score for MCQ
    let score = 0;
    if (currentTask.task_type === 'MCQ' && currentTask.correct_answer !== undefined) {
      score = response === currentTask.correct_answer ? 3 : 0;
    } else if (currentTask.task_type === 'SHORT_RESPONSE') {
      // For short responses, give partial credit for attempting
      score = typeof response === 'string' && response.length > 20 ? 2 : 1;
    }

    const newResponse: MiniSampleResponse = {
      task_id: currentTask.id,
      response: response,
      score: score,
      time_taken_seconds: secondsElapsedRef.current,
      enjoyment_rating: enjoymentRating,
      career_fit_rating: rating,
    };

    // Save to database
    await supabase.from('bo_v1_mini_sample_responses').insert({
      session_id: sessionId,
      task_id: currentTask.id,
      response: typeof response === 'string' ? response : String(response),
      score: score,
      time_taken_seconds: secondsElapsedRef.current,
      enjoyment_rating: enjoymentRating,
      career_fit_rating: rating,
    });

    // Update local state
    const newState = addMiniSampleResponse(state, newResponse);
    setState(newState);
    saveState(newState);

    // Move to next task or complete
    if (currentTaskIndex + 1 >= tasks.length) {
      await supabase
        .from('bo_v1_sessions')
        .update({ mini_samples_completed: true })
        .eq('id', sessionId);

      saveState({ ...newState, stage: 'processing' });
      router.push('/assessment/processing');
    } else {
      setSubmitting(false);
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

  const clusterInfo = CLUSTER_INFO[currentTask.meta_cluster as MetaCluster] || {
    title: 'Task',
    description: '',
  };
  const hasResponse = response !== '' && response !== null;

  // Rating overlay component
  const RatingOverlay = ({
    title,
    onSelect,
  }: {
    title: string;
    onSelect: (rating: EnjoymentRating) => void;
  }) => (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-[#011c40]/90 backdrop-blur-sm">
      <div className="bg-[#011c40] border-2 border-[#26658c] rounded-2xl p-8 max-w-md w-full mx-4">
        <h3 className="text-xl font-bold text-[#a7ebf2] text-center mb-6">{title}</h3>
        <div className="flex justify-center gap-6">
          <button
            onClick={() => onSelect(-1)}
            className="flex flex-col items-center gap-2 p-4 rounded-xl border-2 border-[#26658c] hover:border-[#54acbf] hover:bg-[#54acbf]/10 transition-all"
          >
            <span className="text-4xl">😫</span>
            <span className="text-[#a7ebf2] text-sm">Not for me</span>
          </button>
          <button
            onClick={() => onSelect(0)}
            className="flex flex-col items-center gap-2 p-4 rounded-xl border-2 border-[#26658c] hover:border-[#54acbf] hover:bg-[#54acbf]/10 transition-all"
          >
            <span className="text-4xl">😐</span>
            <span className="text-[#a7ebf2] text-sm">It was okay</span>
          </button>
          <button
            onClick={() => onSelect(1)}
            className="flex flex-col items-center gap-2 p-4 rounded-xl border-2 border-[#26658c] hover:border-[#54acbf] hover:bg-[#54acbf]/10 transition-all"
          >
            <span className="text-4xl">😊</span>
            <span className="text-[#a7ebf2] text-sm">Loved it</span>
          </button>
        </div>
      </div>
    </div>
  );

  return (
    <main className="min-h-screen relative overflow-hidden bg-[#011c40]">
      <Atmosphere variant="subtle" />
      <GradientFade position="bottom" />

      {/* Enjoyment Rating Overlay */}
      {showEnjoymentRating && (
        <RatingOverlay title="How did you find that task?" onSelect={handleEnjoymentSelect} />
      )}

      {/* Career Fit Rating Overlay */}
      {showCareerFitRating && (
        <RatingOverlay
          title="Could you see yourself doing this daily?"
          onSelect={handleCareerFitSelect}
        />
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
            initialSeconds={currentTask.time_limit_seconds || 90}
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
            {clusterInfo.description}
          </span>
          <h1 className="text-2xl lg:text-3xl font-bold text-[#a7ebf2] mt-2">{clusterInfo.title}</h1>
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
                <h3 className="text-sm uppercase tracking-wider text-[#54acbf] mb-4">Scenario</h3>
                <div className="text-[#a7ebf2] text-base leading-relaxed whitespace-pre-wrap">
                  {currentTask.stimulus}
                </div>
              </div>
            </CardFrame>
          </div>

          {/* Question Panel */}
          <div className="lg:w-1/2">
            <CardFrame active={true}>
              <div className="p-6">
                <h3 className="text-sm uppercase tracking-wider text-[#54acbf] mb-4">Question</h3>

                <p className="text-[#a7ebf2] text-lg mb-6">{currentTask.question}</p>

                {/* MCQ Options */}
                {currentTask.task_type === 'MCQ' && currentTask.options && (
                  <div className="space-y-3">
                    {currentTask.options.map((option, idx) => (
                      <label
                        key={idx}
                        className={`
                          flex items-center gap-3 p-4 rounded-lg cursor-pointer
                          border-2 transition-all duration-200
                          ${response === idx
                            ? 'bg-[#54acbf]/20 border-[#54acbf]'
                            : 'bg-transparent border-[#26658c] hover:border-[#54acbf]/50'}
                        `}
                      >
                        <input
                          type="radio"
                          name="mcq"
                          value={idx}
                          checked={response === idx}
                          onChange={() => setResponse(idx)}
                          className="sr-only"
                        />
                        <span
                          className={`
                          w-6 h-6 rounded-full border-2 flex items-center justify-center flex-shrink-0
                          ${response === idx ? 'border-[#54acbf] bg-[#54acbf]' : 'border-[#54acbf]'}
                        `}
                        >
                          {response === idx && <span className="w-2 h-2 rounded-full bg-[#011c40]" />}
                        </span>
                        <span className="text-[#a7ebf2]">{option}</span>
                      </label>
                    ))}
                  </div>
                )}

                {/* Short Response */}
                {currentTask.task_type === 'SHORT_RESPONSE' && (
                  <textarea
                    value={response as string}
                    onChange={(e) => setResponse(e.target.value)}
                    placeholder="Type your answer here (2-3 sentences)..."
                    className="
                      w-full p-4 rounded-lg h-40
                      bg-[#0a1628] border-2 border-[#26658c]
                      text-[#a7ebf2] placeholder-[#26658c]
                      focus:outline-none focus:border-[#54acbf]
                      resize-none
                    "
                  />
                )}

                {/* Submit Button */}
                <button
                  onClick={handleSubmitTask}
                  disabled={!hasResponse || submitting}
                  className={`
                    w-full mt-6 py-4 rounded-lg font-bold uppercase tracking-wider
                    transition-all duration-200
                    ${hasResponse && !submitting
                      ? 'bg-[#54acbf] text-[#011c40] hover:bg-[#a7ebf2]'
                      : 'bg-[#26658c]/30 text-[#26658c] cursor-not-allowed'}
                  `}
                >
                  {submitting ? 'Submitting...' : 'Submit Answer'}
                </button>
              </div>
            </CardFrame>
          </div>
        </div>
      </div>
    </main>
  );
}
