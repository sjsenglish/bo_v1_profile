'use client';

import React from 'react';
import { OrnateCorner } from './decorations';
import { ARCANE_COLORS } from './colors';

/**
 * CARD FRAME
 * The core visual container with ornate corners and double borders.
 * Used for: vibe cards, result cards, familiar cards, info panels.
 */
interface CardFrameProps {
  children: React.ReactNode;
  className?: string;
  innerClassName?: string;
  active?: boolean;
  variant?: 'default' | 'elevated' | 'subtle';
}

export const CardFrame: React.FC<CardFrameProps> = ({ 
  children, 
  className = '', 
  innerClassName = '', 
  active = false,
  variant = 'default'
}) => {
  const variantStyles = {
    default: 'bg-[#023859] bg-opacity-80',
    elevated: 'bg-[#023859] bg-opacity-95',
    subtle: 'bg-[#011c40] bg-opacity-60',
  };

  return (
    <div 
      className={`
        relative p-4 rounded-sm transition-all duration-500 
        ${active ? 'arcane-glow-teal scale-[1.02] z-10' : 'opacity-80 grayscale-[0.1]'}
        ${className}
      `}
    >
      {/* Outer Border */}
      <div 
        className={`
          absolute inset-0 border-2 rounded-sm transition-colors duration-500 
          ${active ? 'border-[#54acbf]' : 'border-[#26658c]'}
        `} 
      />
      
      {/* Ornate Corner Accents */}
      <OrnateCorner 
        className="absolute top-0 left-0" 
        color={active ? ARCANE_COLORS.teal : ARCANE_COLORS.ice} 
      />
      <OrnateCorner 
        className="absolute top-0 right-0 rotate-90" 
        color={active ? ARCANE_COLORS.teal : ARCANE_COLORS.ice} 
      />
      <OrnateCorner 
        className="absolute bottom-0 right-0 rotate-180" 
        color={active ? ARCANE_COLORS.teal : ARCANE_COLORS.ice} 
      />
      <OrnateCorner 
        className="absolute bottom-0 left-0 -rotate-90" 
        color={active ? ARCANE_COLORS.teal : ARCANE_COLORS.ice} 
      />
      
      {/* Inner Border (subtle inset decoration) */}
      <div 
        className="absolute inset-2 border border-[#a7ebf2] border-opacity-10 rounded-sm pointer-events-none" 
      />
      
      {/* Content Area */}
      <div 
        className={`
          relative h-full w-full overflow-hidden rounded-sm
          ${variantStyles[variant]}
          ${innerClassName}
        `}
      >
        {children}
      </div>
    </div>
  );
};

/**
 * CARD FRAME STACK
 * A decorative stacked card effect for visual depth.
 */
interface CardFrameStackProps {
  children: React.ReactNode;
  className?: string;
}

export const CardFrameStack: React.FC<CardFrameStackProps> = ({ 
  children, 
  className = '' 
}) => (
  <div className={`relative ${className}`}>
    {/* Background shadow cards */}
    <div 
      className="absolute top-3 left-[-12px] w-full h-full bg-[#011c40] border-2 border-[#26658c] -z-20 rounded-sm opacity-30 -rotate-3" 
    />
    <div 
      className="absolute top-6 left-[-20px] w-full h-full bg-[#011c40] border-2 border-[#26658c] -z-30 rounded-sm opacity-15 -rotate-6" 
    />
    {children}
  </div>
);
