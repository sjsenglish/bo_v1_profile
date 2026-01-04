'use client';

import { useEffect, useState, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addMiniSampleResponse } from '@/lib/assessment';
import { supabase } from '@/lib/supabase';
import { MiniSampleResponse, EnjoymentRating } from '@/lib/types';
import { TASKS } from '@/data/mock';
import AssessmentTask from '@/components/uioverhaul/AssessmentTask';

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
                className={`flex flex-col items-center justify-center w-20 h-20 rounded-full border-2 transition-all duration-200 ${taskRating === opt.value
                  ? 'bg-white/10 border-[#54acbf] scale-110 shadow-[0_0_20px_rgba(84,172,191,0.3)]'
                  : 'bg-black/20 border-white/10 hover:border-white/30 hover:bg-white/5'
                  }`}
              >
                <span className="text-2xl mb-1">{opt.emoji}</span>
                <span className={`text-[10px] font-bold uppercase tracking-wide ${taskRating === opt.value ? 'text-white' : 'text-gray-500'
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
                className={`flex flex-col items-center justify-center w-20 h-20 rounded-full border-2 transition-all duration-200 ${dailyRating === opt.value
                  ? 'bg-white/10 border-[#54acbf] scale-110 shadow-[0_0_20px_rgba(84,172,191,0.3)]'
                  : 'bg-black/20 border-white/10 hover:border-white/30 hover:bg-white/5'
                  }`}
              >
                <span className="text-2xl mb-1">{opt.emoji}</span>
                <span className={`text-[10px] font-bold uppercase tracking-wide ${dailyRating === opt.value ? 'text-white' : 'text-gray-500'
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
          className={`w-full py-3 rounded-xl font-semibold transition-all ${taskRating !== null && dailyRating !== null
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
  const [showEnjoyment, setShowEnjoyment] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [userId, setUserId] = useState<string | null>(null);
  const [state, setState] = useState(getInitialState());
  const [tempResponse, setTempResponse] = useState<{ response: string; timeTaken: number } | null>(null);

  const currentTask = TASKS[currentTaskIndex];

  // Load session and user
  useEffect(() => {
    const initAuth = async () => {
      // Get authenticated user
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) {
        router.push('/');
        return;
      }
      setUserId(user.id);

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
    };

    initAuth();
  }, [router]);

  const handleTaskComplete = (data: { response: string; timeTaken: number }) => {
    setTempResponse(data);
    setShowEnjoyment(true);
  };

  const handleEnjoymentComplete = async (enjoyment: EnjoymentRating, careerFit: EnjoymentRating) => {
    if (submitting || !sessionId || !userId || !tempResponse) return;
    setSubmitting(true);

    const { response, timeTaken } = tempResponse;

    // Calculate score
    let score = 0;
    if (currentTask.type === 'MCQ' && currentTask.correctAnswerIndex !== undefined) {
      // For MCQ, response is the option string. We need to check if it matches the correct option.
      const correctOption = currentTask.options ? currentTask.options[currentTask.correctAnswerIndex] : '';
      score = response === correctOption ? 3 : 1;
    } else if (currentTask.type === 'SHORT_RESPONSE') {
      score = typeof response === 'string' && response.length >= 100 ? 2 : 1; // Placeholder scoring
    }

    const newResponse: MiniSampleResponse = {
      task_id: String(currentTask.id),
      response: response,
      score,
      time_taken_seconds: timeTaken,
      enjoyment_rating: enjoyment,
      career_fit_rating: careerFit,
    };

    // Save to database
    await supabase.from('bo_v1_mini_sample_responses').insert({
      session_id: sessionId,
      user_id: userId,
      task_id: String(currentTask.id),
      response_text: response,
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
    setTempResponse(null);

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
    <div className="bg-[#011c40] min-h-screen">
      <AssessmentTask
        task={currentTask}
        currentTaskIndex={currentTaskIndex}
        totalTasks={TASKS.length}
        onComplete={handleTaskComplete}
        onSkip={handleSkip}
      />
      {/* Enjoyment Modal */}
      {showEnjoyment && (
        <EnjoymentModal onContinue={handleEnjoymentComplete} />
      )}
    </div>
  );
}
