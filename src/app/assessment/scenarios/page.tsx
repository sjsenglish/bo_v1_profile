// src/app/assessment/scenarios/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addScenarioResponse } from '@/lib/assessment';
import { ScenarioResponse } from '@/lib/types';
import { supabase } from '@/lib/supabase';
import { SCENARIOS } from '@/data/mock';

export default function ScenariosPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [sliderValue, setSliderValue] = useState(50);
  const [hasInteracted, setHasInteracted] = useState(false);
  const [state, setState] = useState(getInitialState());
  const startTimeRef = useRef<number>(Date.now());

  // Defensive check for empty data
  const currentScenario = SCENARIOS && SCENARIOS.length > 0 ? SCENARIOS[currentIndex] : null;
  const progressPercent = SCENARIOS && SCENARIOS.length > 0 ? Math.round((currentIndex / SCENARIOS.length) * 100) : 0;

  // Slider state calculations
  const isNeutral = Math.abs(sliderValue - 50) <= 10;
  const isLeft = sliderValue < 50;
  const isStrongLeft = sliderValue < 25;
  const isStrongRight = sliderValue > 75;

  useEffect(() => {
    const initialState = getInitialState();
    if (!initialState.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(initialState.sessionId);
    setState(initialState);
    const completedCount = initialState.scenarioResponses?.length || 0;
    if (completedCount > 0 && completedCount < SCENARIOS.length) {
      setCurrentIndex(completedCount);
    }
  }, [router]);

  useEffect(() => {
    setSliderValue(50);
    setHasInteracted(false);
    startTimeRef.current = Date.now();
  }, [currentIndex]);

  const handleSliderChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSliderValue(Number(e.target.value));
    setHasInteracted(true);
  };

  const handleNext = async () => {
    if (!hasInteracted || !sessionId || !currentScenario) return;

    const responseTime = Date.now() - startTimeRef.current;

    const response: ScenarioResponse = {
      scenario_id: String(currentScenario.id),
      position: sliderValue,
      response_time_ms: responseTime,
    };

    // Save to database (upsert to handle page refresh/back navigation)
    await supabase.from('bo_v1_scenario_responses').upsert({
      session_id: sessionId,
      scenario_id: String(currentScenario.id),
      position: sliderValue,
      response_time_ms: responseTime,
    }, { onConflict: 'session_id,scenario_id' });

    // Update local state
    const newState = addScenarioResponse(state, response);
    setState(newState);
    saveState(newState);

    // Move to next or complete
    if (currentIndex + 1 >= SCENARIOS.length) {
      await supabase
        .from('bo_v1_sessions')
        .update({ scenarios_completed: true })
        .eq('id', sessionId);

      saveState({ ...newState, stage: 'mini-samples' });
      router.push('/assessment/mini-samples');
    } else {
      setCurrentIndex((prev) => prev + 1);
    }
  };

  const handleSkipSection = async () => {
    if (!sessionId) return;

    // Mark scenarios as completed (skipped)
    await supabase
      .from('bo_v1_sessions')
      .update({ scenarios_completed: true })
      .eq('id', sessionId);

    saveState({ ...state, stage: 'mini-samples' });
    router.push('/assessment/mini-samples');
  };

  if (!currentScenario) return null;

  return (
    <div className="min-h-screen bg-[#0a0a0f] text-white flex flex-col items-center justify-center relative">
      {/* Background Blurs */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
        <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
      </div>

      <div className="w-full max-w-2xl mx-auto px-6 flex flex-col min-h-[600px] justify-center relative z-10">
        {/* Header Info */}
        <div className="flex justify-between items-end mb-8">
          <div>
            <span className="text-gray-500 font-bold tracking-widest text-sm uppercase">
              Question {currentIndex + 1} of {SCENARIOS.length}
            </span>
          </div>
          <div className="flex items-center space-x-2">
            <div className="w-32 h-2 bg-[#1a1a24] rounded-full overflow-hidden border border-white/5">
              <div
                className="h-full bg-gradient-to-r from-[#6366f1] to-[#06b6d4] transition-all duration-500"
                style={{ width: `${progressPercent}%` }}
              />
            </div>
            <span className="text-xs font-mono text-gray-500">{progressPercent}%</span>
          </div>
        </div>

        {/* Scenario Question */}
        <h2 className="text-2xl md:text-3xl font-bold text-white leading-relaxed text-center mb-8">
          {currentScenario.question}
        </h2>

        {/* Option A Box */}
        <div
          className={`p-6 rounded-xl border-2 transition-all duration-300 text-center transform mb-6 ${hasInteracted && isLeft && !isNeutral
              ? 'bg-gradient-to-br from-[#FF4D6D]/20 to-transparent border-[#FF4D6D] shadow-[0_0_20px_rgba(255,77,109,0.2)] scale-105'
              : 'bg-[#1a1a24] border-white/10 scale-100'
            }`}
        >
          <p className={`text-lg transition-colors ${hasInteracted && isLeft && !isNeutral ? 'text-white font-medium' : 'text-gray-300'}`}>
            {currentScenario.optionA.label}
          </p>
        </div>

        {/* Slider */}
        <div className="relative py-6 px-2 mb-6">
          <style>{`
            input[type=range]::-webkit-slider-thumb {
              -webkit-appearance: none;
              height: 40px;
              width: 40px;
              border-radius: 50%;
              background: #FFFFFF;
              cursor: grab;
              margin-top: -14px;
              box-shadow: 0 4px 12px rgba(0,0,0,0.5);
              position: relative;
              z-index: 20;
            }
            input[type=range]::-moz-range-thumb {
              height: 40px;
              width: 40px;
              border-radius: 50%;
              background: #FFFFFF;
              cursor: grab;
              border: none;
              box-shadow: 0 4px 12px rgba(0,0,0,0.5);
              position: relative;
              z-index: 20;
            }
            input[type=range]:active::-webkit-slider-thumb {
              cursor: grabbing;
              transform: scale(1.1);
            }
          `}</style>

          {/* Track */}
          <div
            className="relative h-3 w-full rounded-full"
            style={{ background: 'linear-gradient(90deg, #FF4D6D 0%, #FFB800 50%, #00D9FF 100%)' }}
          >
            <div className="absolute left-[25%] top-1/2 -translate-y-1/2 w-0.5 h-4 bg-black/30 z-0"></div>
            <div className="absolute left-[50%] top-1/2 -translate-y-1/2 w-0.5 h-6 bg-white/50 z-0"></div>
            <div className="absolute left-[75%] top-1/2 -translate-y-1/2 w-0.5 h-4 bg-black/30 z-0"></div>
          </div>

          <input
            type="range"
            min="0"
            max="100"
            value={sliderValue}
            onChange={handleSliderChange}
            className="absolute top-1/2 left-0 -translate-y-1/2 w-full h-3 bg-transparent appearance-none cursor-pointer z-10 focus:outline-none m-0 p-0"
          />

          {/* Confidence Labels */}
          <div className="flex justify-between items-start mt-6 select-none px-1">
            <div className={`flex flex-col items-start transition-all duration-300 ${isLeft && !isNeutral ? 'opacity-100 transform scale-105' : 'opacity-40 grayscale'}`}>
              <span className={`text-[10px] md:text-xs font-bold uppercase tracking-widest ${isStrongLeft ? 'text-[#FF4D6D]' : 'text-gray-400'}`}>
                Strongly Prefer
              </span>
            </div>

            <div className={`flex flex-col items-center transition-all duration-300 ${isNeutral ? 'opacity-100 transform scale-110' : 'opacity-40 grayscale'}`}>
              <span className="text-[10px] md:text-xs font-bold uppercase tracking-widest text-[#FFB800]">Neutral</span>
            </div>

            <div className={`flex flex-col items-end transition-all duration-300 ${!isLeft && !isNeutral ? 'opacity-100 transform scale-105' : 'opacity-40 grayscale'}`}>
              <span className={`text-[10px] md:text-xs font-bold uppercase tracking-widest ${isStrongRight ? 'text-[#00D9FF]' : 'text-gray-400'}`}>
                Strongly Prefer
              </span>
            </div>
          </div>

          {/* Drag Hint */}
          {!hasInteracted && (
            <div className="absolute top-[50px] left-1/2 transform -translate-x-1/2 text-center pointer-events-none animate-bounce z-30">
              <div className="w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-b-[8px] border-b-white mx-auto mb-1"></div>
              <span className="text-xs text-[#0a0a0f] bg-white font-bold uppercase tracking-wider px-2 py-1 rounded shadow-lg">
                Drag to choose
              </span>
            </div>
          )}
        </div>

        {/* Option B Box */}
        <div
          className={`p-6 rounded-xl border-2 transition-all duration-300 text-center transform ${hasInteracted && !isLeft && !isNeutral
              ? 'bg-gradient-to-br from-[#00D9FF]/20 to-transparent border-[#00D9FF] shadow-[0_0_20px_rgba(0,217,255,0.2)] scale-105'
              : 'bg-[#1a1a24] border-white/10 scale-100'
            }`}
        >
          <p className={`text-lg transition-colors ${hasInteracted && !isLeft && !isNeutral ? 'text-white font-medium' : 'text-gray-300'}`}>
            {currentScenario.optionB.label}
          </p>
        </div>

        {/* Buttons */}
        <div className="mt-12 flex flex-col items-center gap-4">
          <button
            onClick={handleNext}
            disabled={!hasInteracted}
            className={`px-8 py-3 rounded-xl font-semibold flex items-center gap-2 transition-all duration-300 ${hasInteracted
                ? 'bg-[#6366f1] text-white shadow-[0_0_20px_rgba(99,102,241,0.4)] hover:shadow-[0_0_30px_rgba(99,102,241,0.6)]'
                : 'bg-gray-700 text-gray-500 cursor-not-allowed opacity-50'
              }`}
          >
            Next
            <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M14 5l7 7m0 0l-7 7m7-7H3" />
            </svg>
          </button>

          {/* Skip Section Button */}
          <button
            onClick={handleSkipSection}
            className="text-gray-500 hover:text-white text-sm font-medium tracking-wide flex items-center transition-colors group px-6 py-2 rounded-full hover:bg-white/5"
          >
            Skip this section
            <svg className="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 5l7 7-7 7M5 5l7 7-7 7" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  );
}
