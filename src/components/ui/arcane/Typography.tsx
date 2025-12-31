'use client';

import React from 'react';

/**
 * ARCANE HEADING
 * Large display headings with optional accent colour on last word.
 */
interface ArcaneHeadingProps {
  children: string;
  level?: 1 | 2 | 3;
  accentLastWord?: boolean;
  className?: string;
}

export const ArcaneHeading: React.FC<ArcaneHeadingProps> = ({
  children,
  level = 1,
  accentLastWord = true,
  className = ''
}) => {
  const words = children.split(' ');
  const lastWord = words.pop();
  const restOfText = words.join(' ');

  const sizeStyles = {
    1: 'text-5xl md:text-7xl',
    2: 'text-3xl md:text-5xl',
    3: 'text-2xl md:text-3xl',
  };

  const Tag = `h${level}` as keyof JSX.IntrinsicElements;

  return (
    <Tag 
      className={`
        font-black uppercase leading-none tracking-tight text-[#a7ebf2]
        ${sizeStyles[level]}
        ${className}
      `}
    >
      {restOfText}{restOfText && ' '}
      {accentLastWord ? (
        <span className="text-[#54acbf]">{lastWord}</span>
      ) : (
        lastWord
      )}
    </Tag>
  );
};

/**
 * ARCANE LABEL
 * Small uppercase tracking-wide labels.
 */
interface ArcaneLabelProps {
  children: React.ReactNode;
  variant?: 'default' | 'muted' | 'accent';
  className?: string;
}

export const ArcaneLabel: React.FC<ArcaneLabelProps> = ({
  children,
  variant = 'default',
  className = ''
}) => {
  const variantStyles = {
    default: 'text-[#54acbf]',
    muted: 'text-[#26658c]',
    accent: 'text-[#a7ebf2]',
  };

  return (
    <p 
      className={`
        text-xs uppercase tracking-[0.4em] font-bold
        ${variantStyles[variant]}
        ${className}
      `}
    >
      {children}
    </p>
  );
};

/**
 * ARCANE QUOTE
 * Italic serif text for dramatic quotes/taglines.
 */
interface ArcaneQuoteProps {
  children: React.ReactNode;
  size?: 'sm' | 'md' | 'lg';
  className?: string;
}

export const ArcaneQuote: React.FC<ArcaneQuoteProps> = ({
  children,
  size = 'md',
  className = ''
}) => {
  const sizeStyles = {
    sm: 'text-sm',
    md: 'text-lg',
    lg: 'text-xl',
  };

  return (
    <p 
      className={`
        text-[#54acbf] leading-relaxed font-serif italic
        ${sizeStyles[size]}
        ${className}
      `}
    >
      "{children}"
    </p>
  );
};

/**
 * ARCANE BADGE
 * Small pill badge for tags and categories.
 */
interface ArcaneBadgeProps {
  children: React.ReactNode;
  variant?: 'default' | 'filled' | 'outline';
  className?: string;
}

export const ArcaneBadge: React.FC<ArcaneBadgeProps> = ({
  children,
  variant = 'default',
  className = ''
}) => {
  const variantStyles = {
    default: 'bg-[#26658c] text-white border-[#54acbf]',
    filled: 'bg-[#54acbf] text-[#011c40] border-transparent',
    outline: 'bg-transparent text-[#54acbf] border-[#54acbf]',
  };

  return (
    <span 
      className={`
        inline-block px-3 py-1 text-[10px] uppercase font-bold tracking-wider
        border rounded-full
        ${variantStyles[variant]}
        ${className}
      `}
    >
      {children}
    </span>
  );
};

/**
 * SECTION HEADER
 * Consistent section header with decorative line.
 */
interface SectionHeaderProps {
  label: string;
  title: string;
  className?: string;
}

export const SectionHeader: React.FC<SectionHeaderProps> = ({
  label,
  title,
  className = ''
}) => (
  <div className={`space-y-4 ${className}`}>
    <div className="flex items-center gap-3">
      <div className="h-[2px] w-12 bg-[#54acbf]" />
      <ArcaneLabel>{label}</ArcaneLabel>
    </div>
    <ArcaneHeading level={2}>{title}</ArcaneHeading>
  </div>
);
