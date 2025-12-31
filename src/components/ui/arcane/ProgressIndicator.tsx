'use client';

import React from 'react';
import { GemIcon } from './decorations';
import { ARCANE_COLORS } from './colors';

/**
 * PROGRESS INDICATOR
 * Pill-shaped dots that reflect the current journey state.
 */
interface ProgressIndicatorProps {
  total: number;
  current: number;
  variant?: 'dots' | 'pills' | 'gems';
  className?: string;
}

export const ProgressIndicator: React.FC<ProgressIndicatorProps> = ({ 
  total, 
  current,
  variant = 'pills',
  className = ''
}) => {
  if (variant === 'gems') {
    return (
      <div className={`flex gap-4 justify-center items-center ${className}`}>
        {Array.from({ length: total }).map((_, i) => (
          <GemIcon
            key={i}
            color={i === current ? ARCANE_COLORS.teal : ARCANE_COLORS.muted}
            glow={i === current}
            size="sm"
            className={`transition-all duration-500 ${i === current ? 'scale-125' : 'scale-100 opacity-50'}`}
          />
        ))}
      </div>
    );
  }

  return (
    <div className={`flex gap-3 justify-center items-center ${className}`}>
      {Array.from({ length: total }).map((_, i) => (
        <div 
          key={i}
          className={`
            h-2 rounded-full transition-all duration-500
            ${variant === 'pills' 
              ? (i === current ? 'w-8 bg-[#54acbf] arcane-glow-teal' : 'w-2 bg-[#26658c]')
              : (i === current ? 'w-3 h-3 bg-[#54acbf] arcane-glow-teal' : 'w-2 h-2 bg-[#26658c]')
            }
            ${i < current ? 'bg-[#54acbf] opacity-60' : ''}
          `}
        />
      ))}
    </div>
  );
};

/**
 * PROGRESS BAR
 * Linear progress indicator with gradient fill.
 */
interface ProgressBarProps {
  value: number; // 0-100
  showLabel?: boolean;
  className?: string;
}

export const ProgressBar: React.FC<ProgressBarProps> = ({ 
  value, 
  showLabel = false,
  className = '' 
}) => {
  const clampedValue = Math.max(0, Math.min(100, value));

  return (
    <div className={`space-y-2 ${className}`}>
      <div className="h-2 bg-[#011c40] rounded-full overflow-hidden border border-[#26658c]">
        <div 
          className="h-full bg-gradient-to-r from-[#54acbf] to-[#a7ebf2] rounded-full transition-all duration-700 ease-out"
          style={{ width: `${clampedValue}%` }}
        />
      </div>
      {showLabel && (
        <div className="flex justify-between text-[10px] uppercase tracking-widest">
          <span className="text-[#26658c]">Progress</span>
          <span className="text-[#54acbf]">{Math.round(clampedValue)}%</span>
        </div>
      )}
    </div>
  );
};

/**
 * STEP INDICATOR
 * Numbered step progression with connecting lines.
 */
interface StepIndicatorProps {
  steps: string[];
  currentStep: number;
  className?: string;
}

export const StepIndicator: React.FC<StepIndicatorProps> = ({ 
  steps, 
  currentStep,
  className = '' 
}) => (
  <div className={`flex items-center justify-center ${className}`}>
    {steps.map((step, i) => (
      <React.Fragment key={i}>
        {/* Step Circle */}
        <div className="flex flex-col items-center gap-2">
          <div 
            className={`
              w-8 h-8 rounded-full flex items-center justify-center
              border-2 transition-all duration-500
              ${i <= currentStep 
                ? 'border-[#54acbf] bg-[#54acbf] text-[#011c40]' 
                : 'border-[#26658c] bg-transparent text-[#26658c]'
              }
              ${i === currentStep ? 'arcane-glow-teal scale-110' : ''}
            `}
          >
            <span className="text-xs font-bold">{i + 1}</span>
          </div>
          <span 
            className={`
              text-[10px] uppercase tracking-widest whitespace-nowrap
              ${i <= currentStep ? 'text-[#a7ebf2]' : 'text-[#26658c]'}
            `}
          >
            {step}
          </span>
        </div>
        
        {/* Connecting Line */}
        {i < steps.length - 1 && (
          <div 
            className={`
              w-12 h-[2px] mx-2 transition-colors duration-500
              ${i < currentStep ? 'bg-[#54acbf]' : 'bg-[#26658c]'}
            `}
          />
        )}
      </React.Fragment>
    ))}
  </div>
);
