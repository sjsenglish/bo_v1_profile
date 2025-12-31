// src/app/assessment/capacity/page.tsx
'use client';

import { useState, useEffect, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState } from '@/lib/assessment';
import {
  Atmosphere,
  CardFrame,
  ArcaneButton,
  ProgressIndicator,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

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
      // No session - redirect to start
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
        // Already done all intro items
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

      // After brief feedback, move to next or complete
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
    // Auto-submit empty response on timeout
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

  // Loading state
  if (state === 'loading') {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <Atmosphere />
        <div className="text-[#54acbf] text-xl">Loading...</div>
      </div>
    );
  }

  // Skipped state
  if (state === 'skipped') {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <Atmosphere />
        <CardFrame className="p-8 text-center">
          <div className="text-[#54acbf] text-xl mb-4">Capacity benchmarks skipped</div>
          <div className="text-[#54acbf]/60 text-sm">Redirecting to results...</div>
        </CardFrame>
      </div>
    );
  }

  // Complete state
  if (state === 'complete') {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center p-4">
        <Atmosphere />
        <CardFrame className="p-8 max-w-lg text-center">
          <div className="text-4xl mb-4">✨</div>
          <h2 className="text-2xl text-[#f8f5f0] mb-4">Intro Complete</h2>
          <p className="text-[#54acbf]/80 mb-6">
            You've completed the capacity preview. Your results now include preliminary cognitive scores.
          </p>
          <div className="bg-[#54acbf]/10 border border-[#54acbf]/30 rounded-lg p-4 mb-6">
            <p className="text-[#54acbf] text-sm">
              <strong>Want more accurate results?</strong> Take full benchmarks after viewing your matches 
              to improve your confidence grade from C to A.
            </p>
          </div>
          <ArcaneButton onClick={goToResults} className="w-full">
            View Results
          </ArcaneButton>
        </CardFrame>
      </div>
    );
  }

  const capacityInfo = currentItem ? CAPACITY_LABELS[currentItem.capacity_type] : null;

  return (
    <div className="min-h-screen bg-[#011c40] flex flex-col">
      <Atmosphere />
      
      {/* Header */}
      <header className="p-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <GemIcon className="w-6 h-6 text-[#54acbf]" />
          <span className="text-[#f8f5f0] font-medium">Capacity Preview</span>
        </div>
        <button
          onClick={handleSkipAll}
          className="text-[#54acbf]/60 hover:text-[#54acbf] text-sm transition-colors"
        >
          Skip All →
        </button>
      </header>

      {/* Progress */}
      <div className="px-4 mb-6">
        <ProgressIndicator 
          current={progress.current} 
          total={progress.total}
          label={`${progress.current} of ${progress.total}`}
        />
      </div>

      {/* Main Content */}
      <main className="flex-1 flex items-center justify-center p-4">
        <CardFrame className="w-full max-w-2xl p-6">
          {/* Intro screen before starting item */}
          {state === 'intro' && capacityInfo && (
            <div className="text-center">
              <div className="text-4xl mb-4">{capacityInfo.icon}</div>
              <h2 className="text-2xl text-[#f8f5f0] mb-2">{capacityInfo.name}</h2>
              <p className="text-[#54acbf]/80 mb-6">{capacityInfo.description}</p>
              
              <div className="bg-[#54acbf]/10 border border-[#54acbf]/30 rounded-lg p-4 mb-6">
                <div className="flex items-center justify-center gap-2 text-[#54acbf]">
                  <span className="text-lg">⏱</span>
                  <span>{currentItem?.time_limit} seconds</span>
                </div>
              </div>

              <div className="flex gap-4 justify-center">
                <ArcaneButton onClick={beginItem}>
                  Begin
                </ArcaneButton>
                <button
                  onClick={handleSkip}
                  className="text-[#54acbf]/60 hover:text-[#54acbf] text-sm transition-colors px-4"
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
        </CardFrame>
      </main>
    </div>
  );
}
