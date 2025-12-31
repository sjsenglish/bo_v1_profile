'use client';

import React from 'react';
import { CardFrame } from './CardFrame';

/**
 * REVEAL CARD
 * A 3D flipping card for dramatic result moments.
 */
interface RevealCardProps {
  front: React.ReactNode;
  back: React.ReactNode;
  flipped: boolean;
  onClick?: () => void;
  className?: string;
  size?: 'sm' | 'md' | 'lg';
}

const CARD_SIZES = {
  sm: 'w-60 h-80',
  md: 'w-80 h-[500px]',
  lg: 'w-96 h-[600px]',
};

export const RevealCard: React.FC<RevealCardProps> = ({ 
  front, 
  back, 
  flipped,
  onClick,
  className = '',
  size = 'md'
}) => (
  <div 
    onClick={onClick}
    className={`
      relative cursor-pointer
      ${CARD_SIZES[size]}
      ${className}
    `}
    style={{ perspective: '1000px' }}
  >
    <div 
      className={`
        relative w-full h-full transition-all duration-1000 ease-out
        ${flipped ? 'arcane-glow-teal' : 'animate-arcane-bounce-subtle'}
      `}
      style={{
        transformStyle: 'preserve-3d',
        transform: flipped ? 'rotateY(180deg) scale(1.05)' : 'rotateY(0deg) scale(1)',
      }}
    >
      {/* Front Face */}
      <div 
        className="absolute inset-0"
        style={{ backfaceVisibility: 'hidden' }}
      >
        <CardFrame 
          active={!flipped} 
          className="w-full h-full"
          innerClassName="bg-gradient-to-br from-[#011c40] to-[#26658c]"
        >
          {front}
        </CardFrame>
      </div>
      
      {/* Back Face */}
      <div 
        className="absolute inset-0"
        style={{ 
          backfaceVisibility: 'hidden',
          transform: 'rotateY(180deg)',
        }}
      >
        <CardFrame active={flipped} className="w-full h-full">
          {back}
        </CardFrame>
      </div>
    </div>
  </div>
);

/**
 * MYSTERY CARD FRONT
 * Pre-built front face design for mystery/reveal cards.
 */
interface MysteryCardFrontProps {
  label?: string;
}

export const MysteryCardFront: React.FC<MysteryCardFrontProps> = ({ 
  label = 'Click to Unveil' 
}) => (
  <div className="text-center p-8 flex flex-col items-center justify-center h-full">
    <div className="w-32 h-32 border-2 border-[#a7ebf2] transform rotate-45 flex items-center justify-center mb-8">
      <div className="transform -rotate-45 font-black text-4xl text-[#a7ebf2]">?</div>
    </div>
    <p className="text-sm uppercase tracking-[0.5em] text-[#26658c]">{label}</p>
  </div>
);

/**
 * FAMILIAR CARD BACK
 * Pre-built back face design for familiar reveal cards.
 */
interface FamiliarCardBackProps {
  imageUrl: string;
  name: string;
  species: string;
  trait: string;
}

export const FamiliarCardBack: React.FC<FamiliarCardBackProps> = ({ 
  imageUrl, 
  name, 
  species, 
  trait 
}) => (
  <div className="h-full relative overflow-hidden">
    <img 
      src={imageUrl} 
      alt={name}
      className="w-full h-full object-cover grayscale-[0.3] brightness-75" 
    />
    <div className="absolute inset-0 bg-gradient-to-t from-[#011c40] via-transparent to-transparent flex flex-col justify-end p-8">
      <p className="text-[#54acbf] text-[10px] uppercase font-bold tracking-[0.4em]">
        {trait}
      </p>
      <h3 className="text-2xl font-bold leading-tight uppercase text-white">
        {name}
      </h3>
      <p className="text-xs text-[#a7ebf2] mt-2 font-serif italic">
        {species}
      </p>
    </div>
  </div>
);
