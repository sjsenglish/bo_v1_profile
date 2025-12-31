// src/app/assessment/capacity/components/Timer.tsx
'use client';

import { useState, useEffect, useRef } from 'react';

interface TimerProps {
  seconds: number;
  onTimeout: () => void;
  running: boolean;
}

export default function Timer({ seconds, onTimeout, running }: TimerProps) {
  const [remaining, setRemaining] = useState(seconds);
  const [percentage, setPercentage] = useState(100);
  const intervalRef = useRef<NodeJS.Timeout | null>(null);
  const hasTimedOut = useRef(false);

  useEffect(() => {
    // Reset on mount
    setRemaining(seconds);
    setPercentage(100);
    hasTimedOut.current = false;

    if (!running) return;

    const startTime = Date.now();
    const endTime = startTime + seconds * 1000;

    intervalRef.current = setInterval(() => {
      const now = Date.now();
      const msRemaining = Math.max(0, endTime - now);
      const secondsRemaining = Math.ceil(msRemaining / 1000);
      const pct = (msRemaining / (seconds * 1000)) * 100;

      setRemaining(secondsRemaining);
      setPercentage(pct);

      if (msRemaining <= 0 && !hasTimedOut.current) {
        hasTimedOut.current = true;
        if (intervalRef.current) {
          clearInterval(intervalRef.current);
        }
        onTimeout();
      }
    }, 50); // Update frequently for smooth animation

    return () => {
      if (intervalRef.current) {
        clearInterval(intervalRef.current);
      }
    };
  }, [seconds, running, onTimeout]);

  // Determine urgency color
  const getBarColor = () => {
    if (percentage > 50) return 'bg-[#54acbf]';
    if (percentage > 25) return 'bg-yellow-500';
    return 'bg-red-500';
  };

  const getTextColor = () => {
    if (percentage > 50) return 'text-[#54acbf]';
    if (percentage > 25) return 'text-yellow-500';
    return 'text-red-500';
  };

  return (
    <div className="space-y-2">
      {/* Time display */}
      <div className="flex items-center justify-between">
        <span className="text-[#54acbf]/60 text-sm uppercase tracking-wider">Time</span>
        <span className={`text-2xl font-mono font-bold ${getTextColor()} transition-colors`}>
          {remaining}s
        </span>
      </div>

      {/* Progress bar */}
      <div className="h-2 bg-[#011c40] rounded-full overflow-hidden border border-[#54acbf]/20">
        <div
          className={`h-full ${getBarColor()} transition-all duration-100 ease-linear`}
          style={{ width: `${percentage}%` }}
        />
      </div>

      {/* Urgency warning */}
      {percentage <= 25 && percentage > 0 && (
        <p className="text-red-400 text-sm text-center animate-pulse">
          Hurry!
        </p>
      )}
    </div>
  );
}
