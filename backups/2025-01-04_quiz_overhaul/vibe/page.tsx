// src/app/assessment/vibe/page.tsx
'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { getActiveVibeCards } from '@/lib/vibe-cards';
import { getInitialState, saveState } from '@/lib/assessment';
import { VibeSwipe, SwipeDirection } from '@/lib/types';
import { supabase } from '@/lib/supabase';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  ProgressBar,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

// Placeholder images - replace with your actual vibe card images
const CARD_IMAGES: Record<string, string> = {
  'VIBE_01': 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_02': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_03': 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_04': 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_05': 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_06': 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_07': 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_08': 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_09': 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_10': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_11': 'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&q=80&w=600&h=800',
  'VIBE_12': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&q=80&w=600&h=800',
};

export default function VibeSwiperPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [swipes, setSwipes] = useState<VibeSwipe[]>([]);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [animating, setAnimating] = useState<'left' | 'right' | null>(null);
  const [hoveredCard, setHoveredCard] = useState<'left' | 'right' | null>(null);

  const cards = getActiveVibeCards();
  const currentCard = cards[currentIndex];
  const progress = Math.round((currentIndex / cards.length) * 100);

  useEffect(() => {
    const state = getInitialState();
    if (!state.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(state.sessionId);
    setSwipes(state.vibeSwipes);
    setCurrentIndex(state.vibeSwipes.length);
  }, [router]);

  const handleSwipe = async (direction: SwipeDirection) => {
    if (!currentCard || !sessionId || animating) return;

    setAnimating(direction === 'RIGHT' ? 'right' : 'left');

    const newSwipe: VibeSwipe = {
      card_id: currentCard.id,
      direction,
    };

    // Save to Supabase
    await supabase.from('bo_v1_vibe_swipes').insert({
      session_id: sessionId,
      card_id: currentCard.id,
      direction,
    });

    const newSwipes = [...swipes, newSwipe];
    setSwipes(newSwipes);

    // Save state
    const state = getInitialState();
    saveState({ ...state, vibeSwipes: newSwipes });

    // Animate out then move to next
    setTimeout(() => {
      setAnimating(null);
      setHoveredCard(null);
      if (currentIndex + 1 >= cards.length) {
        // Complete vibe stage - redirect to scenarios (new flow)
        supabase.from('bo_v1_sessions').update({ vibe_completed: true }).eq('id', sessionId);
        saveState({ ...state, vibeSwipes: newSwipes, stage: 'scenarios' });
        router.push('/assessment/scenarios');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 400);
  };

  const skipVibe = async () => {
    if (!sessionId) return;
    await supabase.from('bo_v1_sessions').update({ vibe_skipped: true }).eq('id', sessionId);
    const state = getInitialState();
    saveState({ ...state, stage: 'scenarios' });
    router.push('/assessment/scenarios');
  };

  if (!currentCard) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  // For dimensional clash style, we show two options
  // Using left_tags[0] and right_tags[0] as the two choices
  const leftOption = {
    label: currentCard.left_tags?.[0] || 'Option A',
    title: currentCard.left_tags?.[1] || 'Path One',
  };
  const rightOption = {
    label: currentCard.right_tags?.[0] || 'Option B', 
    title: currentCard.right_tags?.[1] || 'Path Two',
  };

  return (
    <main className="min-h-screen relative overflow-hidden bg-[#011c40]">
      <Atmosphere variant="default" />
      <GradientFade position="bottom" />

      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 px-8 py-6 flex justify-between items-center z-50">
        <div className="flex items-center gap-2">
          <GemIcon glow color={ARCANE_COLORS.teal} />
          <span className="text-xs font-black uppercase tracking-[0.3em] text-[#a7ebf2]">ERA</span>
        </div>
        <div className="flex items-center gap-8">
          <span className="text-[11px] uppercase tracking-[0.2em] text-[#26658c]">
            {currentIndex + 1} / {cards.length}
          </span>
          <button 
            onClick={skipVibe}
            className="text-[11px] uppercase tracking-[0.2em] text-[#54acbf] hover:text-[#a7ebf2] transition-colors"
          >
            Skip →
          </button>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-6 min-h-screen flex flex-col justify-center pt-20 pb-12">
        
        {/* Header */}
        <div className="text-center mb-8 space-y-2">
          <h1 className="text-4xl lg:text-5xl font-black uppercase tracking-tight">
            <span className="text-[#a7ebf2]">Vibe</span>{' '}
            <span className="text-[#54acbf]">Check</span>
          </h1>
          <p className="text-[#54acbf] uppercase tracking-[0.3em] text-xs">
            Which resonates more with you?
          </p>
        </div>

        {/* Progress Bar */}
        <div className="max-w-md mx-auto w-full mb-12">
          <ProgressBar value={progress} showLabel />
        </div>

        {/* Dimensional Clash Cards */}
        <div className="flex flex-col lg:flex-row items-center justify-center gap-4 lg:gap-0 relative">
          
          {/* Left Card */}
          <button
            onClick={() => handleSwipe('LEFT')}
            onMouseEnter={() => setHoveredCard('left')}
            onMouseLeave={() => setHoveredCard(null)}
            disabled={!!animating}
            className={`
              relative w-72 lg:w-80 h-[450px] lg:h-[520px] 
              transition-all duration-500 
              focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-4 focus:ring-offset-[#011c40]
              ${animating === 'left' ? 'scale-110 z-20' : ''}
              ${animating === 'right' ? 'opacity-30 scale-95' : ''}
              ${hoveredCard === 'left' && !animating ? 'scale-105 z-10' : ''}
              ${hoveredCard === 'right' && !animating ? 'opacity-60' : ''}
            `}
          >
            <CardFrame 
              active={hoveredCard === 'left' || animating === 'left'} 
              className="w-full h-full"
            >
              <div className="relative w-full h-full overflow-hidden">
                <img 
                  src={CARD_IMAGES[currentCard.id] || CARD_IMAGES['VIBE_01']}
                  alt={leftOption.title}
                  className={`
                    w-full h-full object-cover 
                    transition-transform duration-500
                    ${hoveredCard === 'left' ? 'scale-110' : 'scale-100'}
                  `}
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#011c40] via-[#011c40]/30 to-transparent" />
                
                {/* Label */}
                <div className="absolute bottom-0 left-0 right-0 p-6 lg:p-8">
                  <p className="text-[#54acbf] text-[10px] lg:text-xs uppercase tracking-[0.3em] mb-2">
                    {leftOption.label}
                  </p>
                  <h3 className="text-white text-xl lg:text-2xl font-black uppercase leading-tight">
                    {leftOption.title}
                  </h3>
                </div>
              </div>
            </CardFrame>
          </button>

          {/* VS Badge */}
          <div className="relative z-30 lg:-mx-6">
            <div className="w-14 h-14 lg:w-16 lg:h-16 bg-[#011c40] border-2 border-[#26658c] rotate-45 flex items-center justify-center">
              <span className="text-[#54acbf] font-bold text-sm -rotate-45">VS</span>
            </div>
          </div>

          {/* Right Card */}
          <button
            onClick={() => handleSwipe('RIGHT')}
            onMouseEnter={() => setHoveredCard('right')}
            onMouseLeave={() => setHoveredCard(null)}
            disabled={!!animating}
            className={`
              relative w-72 lg:w-80 h-[450px] lg:h-[520px] 
              transition-all duration-500 
              focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-4 focus:ring-offset-[#011c40]
              ${animating === 'right' ? 'scale-110 z-20' : ''}
              ${animating === 'left' ? 'opacity-30 scale-95' : ''}
              ${hoveredCard === 'right' && !animating ? 'scale-105 z-10' : ''}
              ${hoveredCard === 'left' && !animating ? 'opacity-60' : ''}
            `}
          >
            <CardFrame 
              active={hoveredCard === 'right' || animating === 'right'} 
              className="w-full h-full"
            >
              <div className="relative w-full h-full overflow-hidden">
                <img 
                  src={CARD_IMAGES[`VIBE_${String(Number(currentCard.id.split('_')[1]) + 1).padStart(2, '0')}`] || CARD_IMAGES['VIBE_02']}
                  alt={rightOption.title}
                  className={`
                    w-full h-full object-cover 
                    transition-transform duration-500
                    ${hoveredCard === 'right' ? 'scale-110' : 'scale-100'}
                  `}
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#011c40] via-[#011c40]/30 to-transparent" />
                
                {/* Label */}
                <div className="absolute bottom-0 left-0 right-0 p-6 lg:p-8">
                  <p className="text-[#54acbf] text-[10px] lg:text-xs uppercase tracking-[0.3em] mb-2">
                    {rightOption.label}
                  </p>
                  <h3 className="text-white text-xl lg:text-2xl font-black uppercase leading-tight">
                    {rightOption.title}
                  </h3>
                </div>
              </div>
            </CardFrame>
          </button>

        </div>

        {/* Instructions */}
        <div className="text-center mt-8">
          <p className="text-[#26658c] text-xs uppercase tracking-widest">
            Click the card that speaks to you
          </p>
        </div>

      </div>
    </main>
  );
}