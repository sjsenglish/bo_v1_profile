'use client';

import React from 'react';
import { GemIcon } from './decorations';
import { ARCANE_COLORS } from './colors';

/**
 * ARCANE LOADER
 * A dynamic, mystical loading state with chasing concentric rings.
 */
interface ArcaneLoaderProps {
  title?: string;
  subtitle?: string;
  size?: 'sm' | 'md' | 'lg';
}

export const ArcaneLoader: React.FC<ArcaneLoaderProps> = ({ 
  title = 'Loading',
  subtitle = 'Just a moment...',
  size = 'md'
}) => {
  const sizeStyles = {
    sm: { container: 'w-24 h-24', text: 'text-lg' },
    md: { container: 'w-48 h-48', text: 'text-2xl' },
    lg: { container: 'w-64 h-64', text: 'text-3xl' },
  };

  return (
    <div className="flex flex-col items-center justify-center space-y-8">
      <div className={`relative ${sizeStyles[size].container}`}>
        {/* Outer Chasing Ring */}
        <div 
          className="absolute inset-0 border-4 border-[#54acbf] border-t-transparent rounded-full animate-arcane-spin-chase arcane-glow-teal" 
        />
        
        {/* Inner Chasing Ring (Counter-rotating) */}
        <div 
          className="absolute inset-4 border-4 border-[#a7ebf2] border-b-transparent rounded-full animate-arcane-spin-chase-reverse arcane-glow-ice" 
        />
        
        {/* Centre Heartbeat Gem */}
        <div className="absolute inset-0 flex items-center justify-center">
          <GemIcon 
            glow 
            color={ARCANE_COLORS.teal} 
            size="lg"
            className="animate-arcane-pulse-glow" 
          />
        </div>
      </div>

      {/* Loading Text */}
      <div className="text-center space-y-2 max-w-sm">
        <h3 className={`${sizeStyles[size].text} font-bold uppercase tracking-widest text-white`}>
          {title.split(' ').map((word, i) => (
            <React.Fragment key={i}>
              {i > 0 && ' '}
              {i === title.split(' ').length - 1 ? (
                <span className="text-[#54acbf]">{word}</span>
              ) : (
                word
              )}
            </React.Fragment>
          ))}
        </h3>
        <p className="text-[#a7ebf2] text-sm leading-relaxed font-serif italic opacity-70">
          {subtitle}
        </p>
      </div>
    </div>
  );
};

/**
 * INLINE LOADER
 * Smaller loading indicator for inline use.
 */
export const InlineLoader: React.FC<{ className?: string }> = ({ className = '' }) => (
  <div className={`flex items-center gap-2 ${className}`}>
    <div className="w-4 h-4 border-2 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
    <span className="text-[#54acbf] text-xs uppercase tracking-widest">Loading...</span>
  </div>
);

/**
 * SKELETON LOADER
 * Placeholder shimmer effect for content loading states.
 */
interface SkeletonProps {
  className?: string;
  variant?: 'text' | 'circular' | 'rectangular';
}

export const Skeleton: React.FC<SkeletonProps> = ({ 
  className = '', 
  variant = 'text' 
}) => {
  const variantStyles = {
    text: 'h-4 rounded',
    circular: 'rounded-full aspect-square',
    rectangular: 'rounded-sm',
  };

  return (
    <div 
      className={`
        bg-[#26658c] bg-opacity-30 
        animate-pulse 
        ${variantStyles[variant]}
        ${className}
      `}
    />
  );
};
