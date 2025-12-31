'use client';

import React from 'react';
import { GemIcon } from './decorations';
import { ARCANE_COLORS } from './colors';

/**
 * ARCANE BUTTON
 * Pill-shaped CTA with letter-spacing and glowing hover states.
 */
interface ArcaneButtonProps {
  onClick?: () => void;
  children: React.ReactNode;
  variant?: 'primary' | 'secondary' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
  loading?: boolean;
  icon?: 'gem' | 'arrow' | 'none';
  className?: string;
  type?: 'button' | 'submit' | 'reset';
}

export const ArcaneButton: React.FC<ArcaneButtonProps> = ({ 
  onClick, 
  children, 
  variant = 'primary', 
  size = 'md',
  disabled = false,
  loading = false,
  icon = 'none',
  className = '',
  type = 'button'
}) => {
  const baseStyles = `
    relative overflow-hidden
    rounded-full uppercase tracking-[0.2em] font-bold 
    transition-all duration-300 transform 
    active:scale-95 
    disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none
    flex items-center justify-center gap-2
    focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-2 focus:ring-offset-[#011c40]
  `;

  const sizeStyles = {
    sm: 'px-4 py-2 text-xs',
    md: 'px-8 py-3 text-sm',
    lg: 'px-10 py-4 text-base',
  };

  const variantStyles = {
    primary: `
      bg-[#54acbf] text-[#011c40] 
      hover:bg-[#a7ebf2] 
      arcane-glow-teal
    `,
    secondary: `
      border-2 border-[#26658c] text-[#a7ebf2] 
      hover:border-[#54acbf] hover:text-white
      bg-transparent
    `,
    ghost: `
      text-[#54acbf] 
      hover:text-[#a7ebf2] hover:bg-[#023859]
      bg-transparent
    `,
  };

  const renderIcon = () => {
    if (loading) {
      return (
        <div className="w-4 h-4 border-2 border-current border-t-transparent rounded-full animate-spin" />
      );
    }
    
    switch (icon) {
      case 'gem':
        return <GemIcon color="currentColor" size="sm" />;
      case 'arrow':
        return <span className="text-lg">→</span>;
      default:
        return null;
    }
  };

  return (
    <button 
      type={type}
      onClick={onClick} 
      disabled={disabled || loading} 
      className={`
        ${baseStyles} 
        ${sizeStyles[size]} 
        ${variantStyles[variant]} 
        ${className}
      `}
    >
      {/* Shimmer effect on hover */}
      <div 
        className="absolute inset-0 -translate-x-full hover:translate-x-full transition-transform duration-700 bg-gradient-to-r from-transparent via-white/10 to-transparent pointer-events-none" 
      />
      
      <span className="relative z-10">{children}</span>
      {(icon !== 'none' || loading) && (
        <span className="relative z-10">{renderIcon()}</span>
      )}
    </button>
  );
};

/**
 * ARCANE LINK BUTTON
 * Text-style button for navigation links.
 */
interface ArcaneLinkButtonProps {
  onClick?: () => void;
  children: React.ReactNode;
  className?: string;
}

export const ArcaneLinkButton: React.FC<ArcaneLinkButtonProps> = ({
  onClick,
  children,
  className = ''
}) => (
  <button
    onClick={onClick}
    className={`
      text-[10px] uppercase tracking-widest 
      text-[#54acbf] hover:text-[#a7ebf2] 
      transition-colors duration-300
      focus:outline-none focus:underline
      ${className}
    `}
  >
    {children}
  </button>
);
