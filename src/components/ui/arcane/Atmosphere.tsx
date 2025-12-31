'use client';

import React from 'react';

/**
 * ATMOSPHERE
 * Non-blocking background blur orbs for depth and ambience.
 * Should be placed at the root level of each page.
 */
interface AtmosphereProps {
  variant?: 'default' | 'subtle' | 'intense';
  className?: string;
}

export const Atmosphere: React.FC<AtmosphereProps> = ({ 
  variant = 'default',
  className = '' 
}) => {
  const intensityMap = {
    subtle: {
      orb1: 'opacity-[0.05]',
      orb2: 'opacity-[0.1]',
      orb3: 'opacity-[0.03]',
    },
    default: {
      orb1: 'opacity-[0.1]',
      orb2: 'opacity-[0.2]',
      orb3: 'opacity-[0.05]',
    },
    intense: {
      orb1: 'opacity-[0.15]',
      orb2: 'opacity-[0.25]',
      orb3: 'opacity-[0.08]',
    },
  };

  const intensity = intensityMap[variant];

  return (
    <div 
      className={`fixed inset-0 pointer-events-none overflow-hidden z-[-1] ${className}`}
      aria-hidden="true"
    >
      {/* Primary Orb - Top Left */}
      <div 
        className={`
          absolute top-[-10%] left-[-10%] 
          w-[500px] h-[500px] 
          bg-[#54acbf] ${intensity.orb1} 
          blur-[100px] rounded-full
        `}
      />
      
      {/* Secondary Orb - Bottom Right */}
      <div 
        className={`
          absolute bottom-[-20%] right-[-10%] 
          w-[700px] h-[700px] 
          bg-[#023859] ${intensity.orb2} 
          blur-[150px] rounded-full
        `}
      />
      
      {/* Tertiary Orb - Centre Right */}
      <div 
        className={`
          absolute top-[40%] right-[20%] 
          w-[400px] h-[400px] 
          bg-[#a7ebf2] ${intensity.orb3} 
          blur-[120px] rounded-full
        `}
      />
    </div>
  );
};

/**
 * GRADIENT FADE
 * Edge fade effect for scroll containers.
 */
interface GradientFadeProps {
  position: 'top' | 'bottom' | 'left' | 'right';
  size?: 'sm' | 'md' | 'lg';
  className?: string;
}

export const GradientFade: React.FC<GradientFadeProps> = ({ 
  position, 
  size = 'md',
  className = '' 
}) => {
  const sizeMap = {
    sm: 'h-16',
    md: 'h-32',
    lg: 'h-48',
  };

  const positionStyles = {
    top: `top-0 left-0 right-0 ${sizeMap[size]} bg-gradient-to-b from-[#011c40] to-transparent`,
    bottom: `bottom-0 left-0 right-0 ${sizeMap[size]} bg-gradient-to-t from-[#011c40] to-transparent`,
    left: `top-0 bottom-0 left-0 w-32 bg-gradient-to-r from-[#011c40] to-transparent`,
    right: `top-0 bottom-0 right-0 w-32 bg-gradient-to-l from-[#011c40] to-transparent`,
  };

  return (
    <div 
      className={`fixed ${positionStyles[position]} pointer-events-none z-40 ${className}`}
      aria-hidden="true"
    />
  );
};

/**
 * PARTICLE FIELD
 * Animated floating particles for extra ambience (optional enhancement).
 */
export const ParticleField: React.FC<{ className?: string }> = ({ className = '' }) => (
  <div 
    className={`fixed inset-0 pointer-events-none overflow-hidden z-[-1] ${className}`}
    aria-hidden="true"
  >
    {Array.from({ length: 20 }).map((_, i) => (
      <div
        key={i}
        className="absolute w-1 h-1 bg-[#54acbf] rounded-full opacity-30 animate-arcane-float"
        style={{
          left: `${Math.random() * 100}%`,
          top: `${Math.random() * 100}%`,
          animationDelay: `${Math.random() * 5}s`,
          animationDuration: `${10 + Math.random() * 10}s`,
        }}
      />
    ))}
  </div>
);
