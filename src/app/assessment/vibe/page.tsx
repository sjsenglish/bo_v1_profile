// src/app/assessment/vibe/page.tsx
'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addVibeChoice } from '@/lib/assessment';
import { VibeChoice } from '@/lib/types';
import { supabase } from '@/lib/supabase';
import { VIBE_PAIRS } from '@/data/mock';

export default function VibeSwiperPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [state, setState] = useState(getInitialState());
  const [startTime, setStartTime] = useState<number>(Date.now());

  const currentPair = VIBE_PAIRS[currentIndex];
  // Safe guard in case index is out of bounds (e.g. data length changed)
  const progressPercent = Math.round((currentIndex / VIBE_PAIRS.length) * 100);

  useEffect(() => {
    const initialState = getInitialState();
    if (!initialState.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(initialState.sessionId);
    setState(initialState);
    const completedCount = initialState.vibeChoices?.length || 0;
    if (completedCount > 0 && completedCount < VIBE_PAIRS.length) {
      setCurrentIndex(completedCount);
    }
  }, [router]);

  useEffect(() => {
    setStartTime(Date.now());
  }, [currentIndex]);

  const handleSelect = async (optionChosen: 'A' | 'B') => {
    if (!sessionId || !currentPair) return;

    const responseTime = Date.now() - startTime;

    // Use string IDs from new data, but VibeChoice expects pair_id as string (checked lib/types)
    const choice: VibeChoice = {
      pair_id: String(currentPair.id),
      option_chosen: optionChosen,
      response_time_ms: responseTime,
    };

    // Save to database (upsert to handle page refresh/back navigation)
    await supabase.from('bo_v1_vibe_choices').upsert({
      session_id: sessionId,
      pair_id: String(currentPair.id),
      option_chosen: optionChosen,
      response_time_ms: responseTime,
    }, { onConflict: 'session_id,pair_id' });

    // Update local state
    const newState = addVibeChoice(state, choice);
    setState(newState);
    saveState(newState);

    // Move to next or complete
    if (currentIndex + 1 >= VIBE_PAIRS.length) {
      await supabase
        .from('bo_v1_sessions')
        .update({ vibe_completed: true })
        .eq('id', sessionId);

      saveState({ ...newState, stage: 'scenarios' }); // Flow might need adjustment if scenarios are removed/changed, but sticking to existing flow for now.
      router.push('/assessment/scenarios');
    } else {
      setCurrentIndex((prev) => prev + 1);
    }
  };

  const handleSkip = () => {
    if (currentIndex + 1 >= VIBE_PAIRS.length) {
      saveState({ ...state, stage: 'scenarios' });
      router.push('/assessment/scenarios');
    } else {
      setCurrentIndex((prev) => prev + 1);
    }
  };

  if (!currentPair) return null;

  const renderCard = (option: 'A' | 'B') => {
    const data = option === 'A' ? currentPair.optionA : currentPair.optionB;
    const isTextOnly = !data.image;

    return (
      <button
        onClick={() => handleSelect(option)}
        className={`relative group cursor-pointer overflow-hidden rounded-2xl border-2 border-white/5 bg-[#1a1a24] hover:border-[#6366f1]/50 transition-all duration-300 w-full md:w-1/2 h-[320px] md:h-[450px] flex flex-col text-left`}
      >
        {isTextOnly ? (
          <div className="absolute inset-0 bg-gradient-to-br from-[#1a1a24] to-[#0f0f16] group-hover:from-[#2a2a35] group-hover:to-[#1a1a24] transition-colors duration-300 p-8 flex flex-col justify-center">
            {/* Large Letter Watermark */}
            <div className="absolute top-4 right-6 text-[120px] font-black text-white/5 leading-none select-none pointer-events-none">
              {option}
            </div>

            <div className="relative z-10">
              <h3 className="text-2xl md:text-3xl font-bold text-white mb-4 group-hover:text-[#6366f1] transition-colors leading-tight">
                {data.label}
              </h3>
              {data.description && (
                <p className="text-gray-400 text-lg">{data.description}</p>
              )}
            </div>
          </div>
        ) : (
          <>
            {/* Background Image */}
            <div className="absolute inset-0">
              <img
                src={data.image}
                alt={data.label}
                className="w-full h-full object-cover opacity-60 group-hover:opacity-80 transition-opacity duration-300"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent"></div>
            </div>

            {/* Content */}
            <div className="absolute bottom-0 left-0 w-full p-6 text-left">
              <h3 className="text-2xl font-bold text-white mb-1 group-hover:text-[#6366f1] transition-colors">
                {data.label}
              </h3>
              {data.description && <p className="text-gray-400 text-sm">{data.description}</p>}
            </div>
          </>
        )}

        <div className="absolute bottom-6 left-6 md:left-auto md:right-6 md:bottom-6 opacity-0 group-hover:opacity-100 transition-opacity transform translate-y-2 group-hover:translate-y-0 z-20">
          <span className="inline-block px-4 py-2 bg-[#6366f1]/20 border border-[#6366f1] text-[#6366f1] text-xs font-bold rounded-full uppercase tracking-widest">
            Select {option}
          </span>
        </div>

        {/* Hover Glow */}
        <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none border-2 border-[#6366f1] rounded-2xl shadow-[inset_0_0_40px_rgba(99,102,241,0.3)]"></div>
      </button>
    );
  };

  return (
    <div className="min-h-screen bg-[#0a0a0f] text-white flex flex-col">
      {/* Background Blurs */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
        <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
      </div>

      <div className="flex-1 flex flex-col w-full max-w-6xl mx-auto px-4 py-8 relative z-10">
        {/* Header */}
        <div className="flex justify-between items-end mb-8 border-b border-white/10 pb-4">
          <div>
            <div className="text-sm font-bold text-gray-400 uppercase tracking-widest mb-1">
              Question {currentIndex + 1} of {VIBE_PAIRS.length}
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-white max-w-3xl leading-snug">{currentPair.question}</h2>
          </div>
          <div className="text-right hidden md:block">
            <div className="flex items-center space-x-2 justify-end">
              <div className="w-32 h-2 bg-gray-800 rounded-full overflow-hidden">
                <div
                  className="h-full bg-gradient-to-r from-[#6366f1] to-[#06b6d4] transition-all duration-500"
                  style={{ width: `${progressPercent}%` }}
                />
              </div>
              <span className="text-xs font-mono text-gray-500 w-8">{progressPercent}%</span>
            </div>
          </div>
        </div>

        {/* Cards Container */}
        <div className="flex-1 flex flex-col md:flex-row gap-6 md:gap-8 items-stretch justify-center relative">
          {renderCard('A')}

          {/* VS Badge */}
          <div className="absolute left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 z-30 pointer-events-none hidden md:flex">
            <div className="w-14 h-14 rounded-full bg-[#0a0a0f] border-2 border-white/10 flex items-center justify-center shadow-2xl">
              <span className="font-black text-gray-500 text-lg italic">OR</span>
            </div>
          </div>

          {renderCard('B')}
        </div>

        {/* Footer Controls */}
        <div className="flex justify-center mt-8">
          <button
            onClick={handleSkip}
            className="text-gray-500 hover:text-white text-sm font-medium tracking-wide flex items-center transition-colors group px-6 py-3 rounded-full hover:bg-white/5"
          >
            Not sure? Skip this one
            <svg className="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  );
}
