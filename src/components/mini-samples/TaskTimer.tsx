// src/components/mini-samples/TaskTimer.tsx
'use client';

import { useState, useEffect, useCallback } from 'react';

interface TaskTimerProps {
  initialSeconds: number;
  onTimeUpdate?: (secondsElapsed: number) => void;
  isRunning: boolean;
}

export default function TaskTimer({ initialSeconds, onTimeUpdate, isRunning }: TaskTimerProps) {
  const [timeLeft, setTimeLeft] = useState(initialSeconds);
  const [overtime, setOvertime] = useState(false);
  const [secondsElapsed, setSecondsElapsed] = useState(0);

  useEffect(() => {
    if (!isRunning) return;

    const interval = setInterval(() => {
      setSecondsElapsed(prev => {
        const newElapsed = prev + 1;
        onTimeUpdate?.(newElapsed);
        return newElapsed;
      });

      setTimeLeft(prev => {
        if (prev <= 1) {
          setOvertime(true);
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(interval);
  }, [isRunning, onTimeUpdate]);

  const formatTime = useCallback((seconds: number) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  }, []);

  const isWarning = timeLeft <= 10 && timeLeft > 0;

  return (
    <div className={`
      inline-flex items-center gap-2 px-4 py-2 rounded-lg
      border-2 transition-all duration-300
      ${overtime
        ? 'bg-amber-500/20 border-amber-500 text-amber-400'
        : isWarning
          ? 'bg-red-500/20 border-red-500 text-red-400 animate-pulse'
          : 'bg-[#011c40]/80 border-[#26658c] text-[#54acbf]'
      }
    `}>
      <svg
        className={`w-5 h-5 ${isWarning && !overtime ? 'animate-bounce' : ''}`}
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeWidth={2}
          d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
        />
      </svg>

      <span className="font-mono text-lg font-bold tracking-wider">
        {overtime ? 'OVERTIME' : formatTime(timeLeft)}
      </span>
    </div>
  );
}
