import React from 'react';
import { ARCANE_COLORS } from './colors';

/**
 * ORNATE CORNER
 * Reusable L-shaped corner accent for card frames.
 */
interface OrnateCornerProps {
  className?: string;
  color?: string;
}

export const OrnateCorner: React.FC<OrnateCornerProps> = ({ 
  className = '', 
  color = ARCANE_COLORS.ice 
}) => (
  <svg 
    width="24" 
    height="24" 
    viewBox="0 0 24 24" 
    fill="none" 
    className={className}
    aria-hidden="true"
  >
    <path 
      d="M2 2V12M2 2H12" 
      stroke={color} 
      strokeWidth="2" 
      strokeLinecap="square" 
    />
  </svg>
);

/**
 * GEM ICON
 * Signature diamond motif used throughout the UI.
 */
interface GemIconProps {
  color?: string;
  glow?: boolean;
  className?: string;
  size?: 'sm' | 'md' | 'lg';
}

const GEM_SIZES = {
  sm: 'w-3 h-3',
  md: 'w-4 h-4',
  lg: 'w-6 h-6',
};

export const GemIcon: React.FC<GemIconProps> = ({ 
  color = ARCANE_COLORS.ice, 
  glow = false, 
  className = '',
  size = 'md'
}) => (
  <div 
    className={`
      ${GEM_SIZES[size]} 
      transform rotate-45 
      border-2 border-opacity-50 
      transition-all duration-500 
      ${className}
    `}
    style={{ 
      borderColor: color,
      backgroundColor: glow ? color : 'transparent',
      boxShadow: glow ? `0 0 15px ${color}` : 'none'
    }}
    aria-hidden="true"
  />
);

/**
 * RUNE DIVIDER
 * Decorative horizontal rule with gem accent.
 */
interface RuneDividerProps {
  className?: string;
}

export const RuneDivider: React.FC<RuneDividerProps> = ({ className = '' }) => (
  <div className={`flex items-center gap-4 ${className}`}>
    <div className="flex-1 h-px bg-gradient-to-r from-transparent via-[#26658c] to-transparent" />
    <GemIcon color={ARCANE_COLORS.teal} size="sm" />
    <div className="flex-1 h-px bg-gradient-to-r from-transparent via-[#26658c] to-transparent" />
  </div>
);
