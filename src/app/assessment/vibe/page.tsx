// src/app/assessment/vibe/page.tsx
// ExamRizz Arena v9 - Vibe Paired Comparisons (Overhauled Jan 4, 2025)
'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Image from 'next/image';
import { getActiveVibePairs } from '@/lib/vibe-cards';
import { getInitialState, saveState, addVibeChoice } from '@/lib/assessment';
import { VibeChoice, VibePair } from '@/lib/types';
import { supabase } from '@/lib/supabase';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  ProgressBar,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

export default function VibeSwiperPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [animating, setAnimating] = useState<'A' | 'B' | null>(null);
  const [hoveredOption, setHoveredOption] = useState<'A' | 'B' | null>(null);
  const [startTime, setStartTime] = useState<number>(Date.now());
  const [state, setState] = useState(getInitialState());

  const pairs = getActiveVibePairs();
  const currentPair = pairs[currentIndex];
  const progress = Math.round((currentIndex / pairs.length) * 100);

  useEffect(() => {
    const initialState = getInitialState();
    if (!initialState.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(initialState.sessionId);
    setState(initialState);
    setCurrentIndex(initialState.vibeChoices.length);
  }, [router]);

  useEffect(() => {
    // Reset start time when pair changes
    setStartTime(Date.now());
  }, [currentIndex]);

  const handleChoice = async (choice: 'A' | 'B') => {
    if (!currentPair || !sessionId || animating) return;

    setAnimating(choice);

    const responseTime = Date.now() - startTime;
    const newChoice: VibeChoice = {
      pair_id: currentPair.id,
      option_chosen: choice,
      response_time_ms: responseTime,
    };

    // Save to Supabase
    await supabase.from('bo_v1_vibe_choices').insert({
      session_id: sessionId,
      pair_id: currentPair.id,
      option_chosen: choice,
      response_time_ms: responseTime,
    });

    // Update local state
    const newState = addVibeChoice(state, newChoice);
    setState(newState);
    saveState(newState);

    // Animate then move to next
    setTimeout(() => {
      setAnimating(null);
      setHoveredOption(null);

      if (currentIndex + 1 >= pairs.length) {
        // Complete vibe stage - redirect to scenarios
        supabase.from('bo_v1_sessions').update({ vibe_completed: true }).eq('id', sessionId);
        saveState({ ...newState, stage: 'scenarios' });
        router.push('/assessment/scenarios');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 400);
  };

  const skipVibe = async () => {
    if (!sessionId) return;
    await supabase.from('bo_v1_sessions').update({ vibe_skipped: true }).eq('id', sessionId);
    saveState({ ...state, stage: 'scenarios' });
    router.push('/assessment/scenarios');
  };

  if (!currentPair) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

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
            {currentIndex + 1} / {pairs.length}
          </span>
          <button
            onClick={skipVibe}
            className="text-[11px] uppercase tracking-[0.2em] text-[#54acbf] hover:text-[#a7ebf2] transition-colors"
          >
            Skip
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
            Which appeals more to you?
          </p>
        </div>

        {/* Progress Bar */}
        <div className="max-w-md mx-auto w-full mb-12">
          <ProgressBar value={progress} showLabel />
        </div>

        {/* Paired Comparison Cards */}
        <div className="flex flex-col lg:flex-row items-center justify-center gap-4 lg:gap-0 relative">
          {/* Option A */}
          <button
            onClick={() => handleChoice('A')}
            onMouseEnter={() => setHoveredOption('A')}
            onMouseLeave={() => setHoveredOption(null)}
            disabled={!!animating}
            className={`
              relative w-72 lg:w-80 h-[400px] lg:h-[480px]
              transition-all duration-500
              focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-4 focus:ring-offset-[#011c40]
              ${animating === 'A' ? 'scale-110 z-20' : ''}
              ${animating === 'B' ? 'opacity-30 scale-95' : ''}
              ${hoveredOption === 'A' && !animating ? 'scale-105 z-10' : ''}
              ${hoveredOption === 'B' && !animating ? 'opacity-60' : ''}
            `}
          >
            <CardFrame active={hoveredOption === 'A' || animating === 'A'} className="w-full h-full">
              <div className="relative w-full h-full overflow-hidden">
                <img
                  src={currentPair.option_a.image_url}
                  alt={currentPair.option_a.title}
                  className={`
                    w-full h-full object-cover
                    transition-transform duration-500
                    ${hoveredOption === 'A' ? 'scale-110' : 'scale-100'}
                  `}
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#011c40] via-[#011c40]/30 to-transparent" />

                {/* Label */}
                <div className="absolute bottom-0 left-0 right-0 p-6 lg:p-8">
                  <h3 className="text-white text-xl lg:text-2xl font-black uppercase leading-tight mb-2">
                    {currentPair.option_a.title}
                  </h3>
                  <p className="text-[#54acbf] text-sm leading-relaxed">
                    {currentPair.option_a.description}
                  </p>
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

          {/* Option B */}
          <button
            onClick={() => handleChoice('B')}
            onMouseEnter={() => setHoveredOption('B')}
            onMouseLeave={() => setHoveredOption(null)}
            disabled={!!animating}
            className={`
              relative w-72 lg:w-80 h-[400px] lg:h-[480px]
              transition-all duration-500
              focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-4 focus:ring-offset-[#011c40]
              ${animating === 'B' ? 'scale-110 z-20' : ''}
              ${animating === 'A' ? 'opacity-30 scale-95' : ''}
              ${hoveredOption === 'B' && !animating ? 'scale-105 z-10' : ''}
              ${hoveredOption === 'A' && !animating ? 'opacity-60' : ''}
            `}
          >
            <CardFrame active={hoveredOption === 'B' || animating === 'B'} className="w-full h-full">
              <div className="relative w-full h-full overflow-hidden">
                <img
                  src={currentPair.option_b.image_url}
                  alt={currentPair.option_b.title}
                  className={`
                    w-full h-full object-cover
                    transition-transform duration-500
                    ${hoveredOption === 'B' ? 'scale-110' : 'scale-100'}
                  `}
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#011c40] via-[#011c40]/30 to-transparent" />

                {/* Label */}
                <div className="absolute bottom-0 left-0 right-0 p-6 lg:p-8">
                  <h3 className="text-white text-xl lg:text-2xl font-black uppercase leading-tight mb-2">
                    {currentPair.option_b.title}
                  </h3>
                  <p className="text-[#54acbf] text-sm leading-relaxed">
                    {currentPair.option_b.description}
                  </p>
                </div>
              </div>
            </CardFrame>
          </button>
        </div>

        {/* Instructions */}
        <div className="text-center mt-8">
          <p className="text-[#26658c] text-xs uppercase tracking-widest">
            Click the option that appeals to you
          </p>
        </div>
      </div>
    </main>
  );
}
