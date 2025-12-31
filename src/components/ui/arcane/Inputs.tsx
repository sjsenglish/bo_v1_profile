'use client';

import React from 'react';
import { GemIcon } from './decorations';
import { ARCANE_COLORS } from './colors';

/**
 * LIKERT SCALE
 * 5-point scale input with hover states.
 */
interface LikertScaleProps {
  value: number | null;
  onChange: (value: number) => void;
  leftLabel?: string;
  rightLabel?: string;
  hoverValue: number | null;
  onHover: (value: number | null) => void;
  className?: string;
}

export const LikertScale: React.FC<LikertScaleProps> = ({
  value,
  onChange,
  leftLabel = 'Disagree',
  rightLabel = 'Agree',
  hoverValue,
  onHover,
  className = ''
}) => (
  <div className={`space-y-4 ${className}`}>
    {/* Labels */}
    <div className="flex justify-between text-[10px] uppercase tracking-widest text-[#26658c]">
      <span>{leftLabel}</span>
      <span>{rightLabel}</span>
    </div>
    
    {/* Scale */}
    <div className="flex justify-between items-center gap-2">
      {[1, 2, 3, 4, 5].map((v) => {
        const isActive = value === v;
        const isHovered = hoverValue === v;
        const isInRange = hoverValue !== null && v <= hoverValue;

        return (
          <button
            key={v}
            onClick={() => onChange(v)}
            onMouseEnter={() => onHover(v)}
            onMouseLeave={() => onHover(null)}
            className={`
              flex-1 h-12 rounded-sm border-2 transition-all duration-300
              flex items-center justify-center
              focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-2 focus:ring-offset-[#011c40]
              ${isActive 
                ? 'border-[#54acbf] bg-[#54acbf] text-[#011c40] arcane-glow-teal scale-110 z-10' 
                : isHovered || isInRange
                  ? 'border-[#54acbf] bg-[#023859] text-[#a7ebf2]'
                  : 'border-[#26658c] bg-[#011c40] text-[#26658c] hover:border-[#54acbf]'
              }
            `}
          >
            <span className="font-bold text-lg">{v}</span>
          </button>
        );
      })}
    </div>
  </div>
);

/**
 * ARCANE INPUT
 * Text input with consistent styling.
 */
interface ArcaneInputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  error?: string;
}

export const ArcaneInput: React.FC<ArcaneInputProps> = ({
  label,
  error,
  className = '',
  ...props
}) => (
  <div className={`space-y-2 ${className}`}>
    {label && (
      <label className="block text-xs uppercase tracking-widest text-[#54acbf]">
        {label}
      </label>
    )}
    <input
      {...props}
      className={`
        w-full px-4 py-3 
        bg-[#011c40] border-2 rounded-sm
        text-[#a7ebf2] placeholder:text-[#26658c]
        transition-colors duration-300
        focus:outline-none focus:border-[#54acbf] focus:ring-2 focus:ring-[#54acbf] focus:ring-opacity-20
        ${error ? 'border-red-500' : 'border-[#26658c]'}
      `}
    />
    {error && (
      <p className="text-xs text-red-400">{error}</p>
    )}
  </div>
);

/**
 * SELECTION CARD
 * Clickable card for multiple choice selections (e.g., vibe swiper alternatives).
 */
interface SelectionCardProps {
  selected: boolean;
  onClick: () => void;
  children: React.ReactNode;
  className?: string;
}

export const SelectionCard: React.FC<SelectionCardProps> = ({
  selected,
  onClick,
  children,
  className = ''
}) => (
  <button
    onClick={onClick}
    className={`
      relative p-6 rounded-sm border-2 transition-all duration-300
      text-left w-full
      focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-2 focus:ring-offset-[#011c40]
      ${selected 
        ? 'border-[#54acbf] bg-[#023859] arcane-glow-teal' 
        : 'border-[#26658c] bg-[#011c40] hover:border-[#54acbf] hover:bg-[#023859]'
      }
      ${className}
    `}
  >
    {/* Selection Indicator */}
    <div 
      className={`
        absolute top-4 right-4 w-5 h-5 rounded-full border-2 
        flex items-center justify-center transition-all duration-300
        ${selected 
          ? 'border-[#54acbf] bg-[#54acbf]' 
          : 'border-[#26658c] bg-transparent'
        }
      `}
    >
      {selected && (
        <svg className="w-3 h-3 text-[#011c40]" fill="currentColor" viewBox="0 0 20 20">
          <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
        </svg>
      )}
    </div>
    
    {children}
  </button>
);

/**
 * SWIPE CARD
 * Card designed for swipe interactions (vibe swiper).
 */
interface SwipeCardProps {
  imageUrl: string;
  title: string;
  vibe: string;
  onClick: () => void;
  className?: string;
}

export const SwipeCard: React.FC<SwipeCardProps> = ({
  imageUrl,
  title,
  vibe,
  onClick,
  className = ''
}) => (
  <button
    onClick={onClick}
    className={`
      relative w-72 h-[450px] overflow-hidden rounded-sm
      border-2 border-[#26658c] 
      transition-all duration-500 
      hover:scale-105 hover:border-[#54acbf] hover:arcane-glow-teal
      active:scale-95
      focus:outline-none focus:ring-2 focus:ring-[#54acbf]
      group
      ${className}
    `}
  >
    <img 
      src={imageUrl} 
      alt={title}
      className="w-full h-full object-cover transition-all duration-500 group-hover:scale-110" 
    />
    <div className="absolute inset-0 bg-gradient-to-t from-[#011c40] via-transparent to-transparent" />
    <div className="absolute inset-0 flex flex-col justify-end p-8 text-left">
      <GemIcon color={ARCANE_COLORS.teal} glow className="mb-4" />
      <h4 className="text-xl font-bold uppercase text-white tracking-wide">{title}</h4>
      <p className="text-[10px] uppercase tracking-[0.4em] text-[#54acbf] mt-2">{vibe}</p>
    </div>
  </button>
);
