// src/app/assessment/vibe/page.tsx
'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { VIBE_CARDS, getActiveVibeCards } from '@/lib/vibe-cards';
import { getInitialState, saveState } from '@/lib/assessment';
import { VibeSwipe, SwipeDirection } from '@/lib/types';
import { supabase } from '@/lib/supabase';

export default function VibeSwiperPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [swipes, setSwipes] = useState<VibeSwipe[]>([]);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [animating, setAnimating] = useState<'left' | 'right' | null>(null);

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
      if (currentIndex + 1 >= cards.length) {
        // Complete vibe stage
        supabase.from('bo_v1_sessions').update({ vibe_completed: true }).eq('id', sessionId);
        saveState({ ...state, vibeSwipes: newSwipes, stage: 'cognitive' });
        router.push('/assessment/cognitive');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 300);
  };

  const skipVibe = async () => {
    if (!sessionId) return;
    await supabase.from('bo_v1_sessions').update({ vibe_skipped: true }).eq('id', sessionId);
    const state = getInitialState();
    saveState({ ...state, stage: 'cognitive' });
    router.push('/assessment/cognitive');
  };

  if (!currentCard) {
    return (
      <div className="min-h-screen bg-slate-900 flex items-center justify-center">
        <div className="animate-spin h-8 w-8 border-2 border-purple-500 border-t-transparent rounded-full" />
      </div>
    );
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-950 to-slate-900 flex flex-col">
      {/* Header */}
      <header className="p-4 flex items-center justify-between">
        <div className="text-slate-400 text-sm">
          Vibe Check
        </div>
        <div className="flex items-center gap-4">
          <div className="text-slate-500 text-sm">
            {currentIndex + 1} / {cards.length}
          </div>
          <button
            onClick={skipVibe}
            className="text-slate-500 hover:text-slate-300 text-sm transition-colors"
          >
            Skip →
          </button>
        </div>
      </header>

      {/* Progress bar */}
      <div className="px-4">
        <div className="h-1 bg-slate-800 rounded-full overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-purple-500 to-pink-500 transition-all duration-300"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      {/* Card area */}
      <div className="flex-1 flex items-center justify-center p-6">
        <div className="relative w-full max-w-md aspect-[3/4]">
          {/* Card */}
          <div
            className={`absolute inset-0 bg-slate-800 rounded-3xl overflow-hidden shadow-2xl transition-all duration-300 ${
              animating === 'left' ? '-translate-x-full rotate-[-20deg] opacity-0' :
              animating === 'right' ? 'translate-x-full rotate-[20deg] opacity-0' :
              ''
            }`}
          >
            {/* Placeholder image - in production, use actual images */}
            <div className="absolute inset-0 bg-gradient-to-br from-slate-700 to-slate-800 flex items-center justify-center">
              <div className="text-center p-6">
                <div className="text-6xl mb-4">
                  {currentCard.id === 'VIBE_01' ? '🌃' :
                   currentCard.id === 'VIBE_02' ? '🏛️' :
                   currentCard.id === 'VIBE_03' ? '👥' :
                   currentCard.id === 'VIBE_04' ? '📚' :
                   currentCard.id === 'VIBE_05' ? '🔬' :
                   currentCard.id === 'VIBE_06' ? '⚖️' :
                   currentCard.id === 'VIBE_07' ? '🎨' :
                   currentCard.id === 'VIBE_08' ? '🏥' :
                   currentCard.id === 'VIBE_09' ? '📈' :
                   currentCard.id === 'VIBE_10' ? '🎓' :
                   currentCard.id === 'VIBE_11' ? '💬' :
                   '🌿'}
                </div>
                <p className="text-slate-300 text-sm leading-relaxed">
                  {currentCard.alt_text}
                </p>
              </div>
            </div>

            {/* Gradient overlay */}
            <div className="absolute inset-x-0 bottom-0 h-32 bg-gradient-to-t from-slate-900/90 to-transparent" />

            {/* Labels */}
            <div className="absolute bottom-6 left-6 right-6 flex justify-between">
              <div className="bg-red-500/20 text-red-400 px-3 py-1 rounded-full text-sm font-medium backdrop-blur-sm border border-red-500/30">
                ← Not me
              </div>
              <div className="bg-green-500/20 text-green-400 px-3 py-1 rounded-full text-sm font-medium backdrop-blur-sm border border-green-500/30">
                This is me →
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Swipe buttons */}
      <div className="p-6 flex justify-center gap-6">
        <button
          onClick={() => handleSwipe('LEFT')}
          disabled={!!animating}
          className="w-16 h-16 rounded-full bg-slate-800 hover:bg-red-500/20 border-2 border-slate-700 hover:border-red-500/50 flex items-center justify-center transition-all disabled:opacity-50"
        >
          <svg className="w-8 h-8 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>

        <button
          onClick={() => handleSwipe('SKIP')}
          disabled={!!animating}
          className="w-12 h-12 rounded-full bg-slate-800 hover:bg-slate-700 border border-slate-700 flex items-center justify-center transition-all disabled:opacity-50 self-center"
        >
          <svg className="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 5l7 7-7 7M5 5l7 7-7 7" />
          </svg>
        </button>

        <button
          onClick={() => handleSwipe('RIGHT')}
          disabled={!!animating}
          className="w-16 h-16 rounded-full bg-slate-800 hover:bg-green-500/20 border-2 border-slate-700 hover:border-green-500/50 flex items-center justify-center transition-all disabled:opacity-50"
        >
          <svg className="w-8 h-8 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
          </svg>
        </button>
      </div>

      {/* Instructions */}
      <div className="pb-6 text-center">
        <p className="text-slate-600 text-sm">
          Swipe right if it resonates, left if it doesn't
        </p>
      </div>
    </main>
  );
}
