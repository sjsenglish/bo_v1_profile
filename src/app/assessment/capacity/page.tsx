// src/app/assessment/capacity/page.tsx
'use client';

import { useState, useEffect, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState } from '@/lib/assessment';

import BinaryRapid from './components/BinaryRapid';
import TableRead from './components/TableRead';
import Timer from './components/Timer';

// Capacity type labels
const CAPACITY_LABELS: Record<string, { name: string; description: string; icon: string }> = {
  VRB: { name: 'Verbal Reasoning', description: 'Evaluate arguments and evidence', icon: '📖' },
  QNT: { name: 'Quantitative Reasoning', description: 'Interpret data and patterns', icon: '📊' },
  SPD: { name: 'Processing Speed', description: 'Quick accurate discrimination', icon: '⚡' },
};

type CapacityItem = {
  id: string;
  capacity_type: string;
  tier: string;
  type: string;
  time_limit: number;
  question: string;
  stimulus?: string;
  options: string[] | Record<string, string>;
};

type IntroState = 'loading' | 'intro' | 'item' | 'feedback' | 'complete' | 'skipped';

export default function CapacityIntroPage() {
  const router = useRouter();
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [state, setState] = useState<IntroState>('loading');
  const [currentItem, setCurrentItem] = useState<CapacityItem | null>(null);
  const [progress, setProgress] = useState({ current: 0, total: 3, completed: [] as string[] });
  const [lastFeedback, setLastFeedback] = useState<{ correct: boolean; score: number } | null>(null);
  const [responseStartTime, setResponseStartTime] = useState<number>(0);
  const [timerKey, setTimerKey] = useState(0);

  // Load session
  useEffect(() => {
    const savedState = getInitialState();
    if (savedState?.sessionId) {
      setSessionId(savedState.sessionId);
    } else {
      router.push('/');
    }
  }, [router]);

  // Start intro flow
  useEffect(() => {
    if (sessionId && state === 'loading') {
      startIntro();
    }
  }, [sessionId, state]);

  const startIntro = async () => {
    try {
      const res = await fetch('/api/capacity/intro', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ session_id: sessionId, action: 'start' }),
      });
      const data = await res.json();

      if (data.status === 'complete') {
        router.push(`/results/${sessionId}`);
        return;
      }

      if (data.item) {
        setCurrentItem(data.item);
        setProgress(data.progress);
        setState('intro');
      }
    } catch (error) {
      console.error('Failed to start capacity intro:', error);
    }
  };

  const beginItem = () => {
    setResponseStartTime(Date.now());
    setTimerKey(prev => prev + 1);
    setState('item');
  };

  const handleResponse = async (response: string) => {
    if (!currentItem || !sessionId) return;

    const responseTimeMs = Date.now() - responseStartTime;

    try {
      const res = await fetch('/api/capacity/intro', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          session_id: sessionId,
          action: 'respond',
          capacity_type: currentItem.capacity_type,
          response,
          response_time_ms: responseTimeMs,
        }),
      });
      const data = await res.json();

      setLastFeedback(data.score_feedback);
      setState('feedback');

      setTimeout(() => {
        if (data.status === 'complete') {
          setState('complete');
        } else if (data.item) {
          setCurrentItem(data.item);
          setProgress(data.progress);
          setState('intro');
        }
      }, 1500);
    } catch (error) {
      console.error('Failed to submit response:', error);
    }
  };

  const handleTimeout = () => {
    handleResponse('');
  };

  const handleSkip = async () => {
    if (!currentItem || !sessionId) return;

    try {
      const res = await fetch('/api/capacity/intro', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          session_id: sessionId,
          action: 'skip',
          capacity_type: currentItem.capacity_type,
        }),
      });
      const data = await res.json();

      if (data.status === 'complete') {
        setState('complete');
      } else if (data.item) {
        setCurrentItem(data.item);
        setProgress(data.progress);
        setState('intro');
      }
    } catch (error) {
      console.error('Failed to skip:', error);
    }
  };

  const handleSkipAll = async () => {
    if (!sessionId) return;

    try {
      await fetch('/api/capacity/intro', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ session_id: sessionId, action: 'skip_all' }),
      });
      setState('skipped');
      setTimeout(() => {
        router.push('/assessment/processing');
      }, 1000);
    } catch (error) {
      console.error('Failed to skip all:', error);
    }
  };

  const goToResults = () => {
    router.push('/assessment/processing');
  };

  // Render interaction based on type
  const renderInteraction = () => {
    if (!currentItem) return null;

    switch (currentItem.type) {
      case 'BINARY_RAPID':
        return (
          <BinaryRapid
            question={currentItem.question}
            stimulus={currentItem.stimulus}
            options={currentItem.options as string[]}
            onResponse={handleResponse}
            disabled={state !== 'item'}
          />
        );
      case 'TABLE_READ':
        return (
          <TableRead
            question={currentItem.question}
            stimulus={currentItem.stimulus}
            options={currentItem.options as string[]}
            onResponse={handleResponse}
            disabled={state !== 'item'}
          />
        );
      default:
        return <div className="text-red-400">Unknown interaction type: {currentItem.type}</div>;
    }
  };

  const progressPercent = Math.round((progress.current / progress.total) * 100);

  // Loading state
  if (state === 'loading') {
    return (
      <div className="min-h-screen bg-[#0a0a0f] flex items-center justify-center relative overflow-hidden">
        <div className="fixed inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
        </div>
        <div className="relative z-10 text-center">
          <div className="w-8 h-8 border-2 border-[#6366f1]/30 border-t-[#6366f1] rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-gray-400">Loading...</p>
        </div>
      </div>
    );
  }

  // Skipped state
  if (state === 'skipped') {
    return (
      <div className="min-h-screen bg-[#0a0a0f] flex items-center justify-center relative overflow-hidden">
        <div className="fixed inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
        </div>
        <div className="relative z-10 p-8 bg-[#1a1a24] border border-white/10 rounded-2xl text-center">
          <div className="text-xl text-white mb-4">Capacity benchmarks skipped</div>
          <div className="text-gray-500 text-sm">Redirecting to results...</div>
        </div>
      </div>
    );
  }

  // Complete state
  if (state === 'complete') {
    return (
      <div className="min-h-screen bg-[#0a0a0f] flex items-center justify-center relative overflow-hidden p-4">
        <div className="fixed inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
        </div>
        <div className="relative z-10 p-8 bg-[#1a1a24] border border-white/10 rounded-2xl max-w-lg text-center">
          <div className="text-4xl mb-4">✨</div>
          <h2 className="text-2xl text-white mb-4">Intro Complete</h2>
          <p className="text-gray-400 mb-6">
            You've completed the capacity preview. Your results now include preliminary cognitive scores.
          </p>
          <div className="bg-[#6366f1]/10 border border-[#6366f1]/30 rounded-xl p-4 mb-6">
            <p className="text-[#6366f1] text-sm">
              <strong>Want more accurate results?</strong> Take full benchmarks after viewing your matches
              to improve your confidence grade from C to A.
            </p>
          </div>
          <button
            onClick={goToResults}
            className="w-full px-8 py-3 rounded-xl font-semibold bg-[#6366f1] text-white shadow-[0_0_20px_rgba(99,102,241,0.4)] hover:shadow-[0_0_30px_rgba(99,102,241,0.6)] transition-all duration-300"
          >
            View Results
          </button>
        </div>
      </div>
    );
  }

  const capacityInfo = currentItem ? CAPACITY_LABELS[currentItem.capacity_type] : null;

  return (
    <div className="min-h-screen bg-[#0a0a0f] flex flex-col relative overflow-hidden">
      {/* Background */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
        <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
      </div>

      {/* Header */}
      <header className="relative z-10 p-4 flex items-center justify-between border-b border-white/10">
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 rounded-lg bg-[#6366f1]/20 flex items-center justify-center">
            <span className="text-[#6366f1] font-bold text-sm">C</span>
          </div>
          <span className="text-white font-medium">Capacity Preview</span>
        </div>
        <button
          onClick={handleSkipAll}
          className="text-gray-500 hover:text-white text-sm transition-colors"
        >
          Skip All →
        </button>
      </header>

      {/* Progress */}
      <div className="relative z-10 px-4 py-3">
        <div className="flex items-center justify-between mb-2">
          <span className="text-gray-500 text-sm">{progress.current} of {progress.total}</span>
          <span className="text-gray-500 text-sm">{progressPercent}%</span>
        </div>
        <div className="w-full h-2 bg-[#1a1a24] rounded-full overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-[#6366f1] to-[#06b6d4] transition-all duration-500"
            style={{ width: `${progressPercent}%` }}
          />
        </div>
      </div>

      {/* Main Content */}
      <main className="relative z-10 flex-1 flex items-center justify-center p-4">
        <div className="w-full max-w-2xl p-6 bg-[#1a1a24] border border-white/10 rounded-2xl">
          {/* Intro screen before starting item */}
          {state === 'intro' && capacityInfo && (
            <div className="text-center">
              <div className="text-4xl mb-4">{capacityInfo.icon}</div>
              <h2 className="text-2xl text-white mb-2">{capacityInfo.name}</h2>
              <p className="text-gray-400 mb-6">{capacityInfo.description}</p>

              <div className="bg-[#6366f1]/10 border border-[#6366f1]/30 rounded-xl p-4 mb-6">
                <div className="flex items-center justify-center gap-2 text-[#6366f1]">
                  <span className="text-lg">⏱</span>
                  <span>{currentItem?.time_limit} seconds</span>
                </div>
              </div>

              <div className="flex gap-4 justify-center">
                <button
                  onClick={beginItem}
                  className="px-8 py-3 rounded-xl font-semibold bg-[#6366f1] text-white shadow-[0_0_20px_rgba(99,102,241,0.4)] hover:shadow-[0_0_30px_rgba(99,102,241,0.6)] transition-all duration-300"
                >
                  Begin
                </button>
                <button
                  onClick={handleSkip}
                  className="text-gray-500 hover:text-white text-sm transition-colors px-4"
                >
                  Skip this one
                </button>
              </div>
            </div>
          )}

          {/* Active item */}
          {state === 'item' && currentItem && (
            <div>
              {/* Timer */}
              <div className="mb-6">
                <Timer
                  key={timerKey}
                  seconds={currentItem.time_limit}
                  onTimeout={handleTimeout}
                  running={state === 'item'}
                />
              </div>

              {/* Interaction */}
              {renderInteraction()}
            </div>
          )}

          {/* Feedback */}
          {state === 'feedback' && lastFeedback && (
            <div className="text-center py-8">
              <div className={`text-6xl mb-4 ${lastFeedback.correct ? 'animate-bounce' : ''}`}>
                {lastFeedback.correct ? '✓' : '✗'}
              </div>
              <div className={`text-2xl ${lastFeedback.correct ? 'text-green-400' : 'text-red-400'}`}>
                {lastFeedback.correct ? 'Correct!' : 'Not quite'}
              </div>
            </div>
          )}
        </div>
      </main>
    </div>
  );
}
