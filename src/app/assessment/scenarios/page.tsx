// src/app/assessment/scenarios/page.tsx
// ExamRizz Arena v9 - Forced-Choice Scenarios with Slider (Overhauled Jan 4, 2025)
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addScenarioResponse } from '@/lib/assessment';
import { ScenarioResponse, Scenario } from '@/lib/types';
import { supabase } from '@/lib/supabase';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  ProgressBar,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

export default function QuickScenariosPage() {
  const router = useRouter();
  const [scenarios, setScenarios] = useState<Scenario[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [sliderValue, setSliderValue] = useState(50);
  const [hasInteracted, setHasInteracted] = useState(false);
  const [animating, setAnimating] = useState(false);
  const [state, setState] = useState(getInitialState());
  const startTimeRef = useRef<number>(Date.now());

  const currentScenario = scenarios[currentIndex];
  const progress = scenarios.length > 0 ? Math.round((currentIndex / scenarios.length) * 100) : 0;

  // Load session and scenarios
  useEffect(() => {
    const loadData = async () => {
      const initialState = getInitialState();
      if (!initialState.sessionId) {
        router.push('/');
        return;
      }
      setSessionId(initialState.sessionId);
      setState(initialState);

      // Load scenarios from database
      const { data, error } = await supabase
        .from('bo_v1_scenarios')
        .select('*')
        .eq('active', true)
        .order('sort_order');

      if (error) {
        console.error('Error loading scenarios:', error);
        return;
      }

      setScenarios(data || []);
      setCurrentIndex(initialState.scenarioResponses.length);
      setLoading(false);
    };

    loadData();
  }, [router]);

  // Reset slider and timer on question change
  useEffect(() => {
    startTimeRef.current = Date.now();
    setSliderValue(50);
    setHasInteracted(false);
  }, [currentIndex]);

  const handleSliderChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSliderValue(parseInt(e.target.value));
    setHasInteracted(true);
  };

  const handleSubmit = async () => {
    if (!currentScenario || !sessionId || animating || !hasInteracted) return;

    setAnimating(true);
    const responseTime = Date.now() - startTimeRef.current;

    const newResponse: ScenarioResponse = {
      scenario_id: currentScenario.id,
      position: sliderValue,
      response_time_ms: responseTime,
    };

    // Save response to database
    await supabase.from('bo_v1_scenario_responses').insert({
      session_id: sessionId,
      scenario_id: currentScenario.id,
      position: sliderValue,
      response_time_ms: responseTime,
    });

    // Update local state
    const newState = addScenarioResponse(state, newResponse);
    setState(newState);
    saveState(newState);

    // Short delay for visual feedback
    setTimeout(async () => {
      setAnimating(false);

      if (currentIndex + 1 >= scenarios.length) {
        // All scenarios complete - update session and redirect
        await supabase
          .from('bo_v1_sessions')
          .update({
            scenarios_completed: true,
            questions_answered: scenarios.length,
          })
          .eq('id', sessionId);

        saveState({ ...newState, stage: 'mini-samples' });
        router.push('/assessment/mini-samples');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 300);
  };

  // Get slider band label
  const getSliderLabel = (value: number): string => {
    if (value <= 15) return 'Strongly A';
    if (value <= 35) return 'Moderately A';
    if (value <= 50) return 'Lean A';
    if (value <= 65) return 'Lean B';
    if (value <= 85) return 'Moderately B';
    return 'Strongly B';
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  if (!currentScenario) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <p className="text-[#54acbf]">No scenarios found</p>
      </div>
    );
  }

  return (
    <main className="min-h-screen relative overflow-hidden bg-[#011c40]">
      <Atmosphere variant="subtle" />
      <GradientFade position="bottom" />

      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 px-8 py-6 flex justify-between items-center z-50">
        <div className="flex items-center gap-2">
          <GemIcon glow color={ARCANE_COLORS.teal} />
          <span className="text-xs font-black uppercase tracking-[0.3em] text-[#a7ebf2]">ERA</span>
        </div>
        <div className="flex items-center gap-8">
          <span className="text-[11px] uppercase tracking-[0.2em] text-[#26658c]">
            {currentIndex + 1} / {scenarios.length}
          </span>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-6 min-h-screen flex flex-col justify-center pt-20 pb-12">
        {/* Header */}
        <div className="text-center mb-6 space-y-2">
          <h1 className="text-3xl lg:text-4xl font-black uppercase tracking-tight">
            <span className="text-[#a7ebf2]">Quick</span>{' '}
            <span className="text-[#54acbf]">Scenarios</span>
          </h1>
          <p className="text-[#54acbf] uppercase tracking-[0.3em] text-xs">
            Slide towards what feels most natural
          </p>
        </div>

        {/* Progress Bar */}
        <div className="max-w-md mx-auto w-full mb-8">
          <ProgressBar value={progress} showLabel />
        </div>

        {/* Scenario Card */}
        <div
          className={`max-w-2xl mx-auto w-full transition-all duration-300 ${animating ? 'opacity-0 scale-95' : 'opacity-100 scale-100'}`}
        >
          <CardFrame active={true} variant="elevated">
            <div className="p-8 lg:p-12">
              {/* Context/Question */}
              <p className="text-xl lg:text-2xl text-[#a7ebf2] leading-relaxed text-center font-light mb-10">
                {currentScenario.scenario_context}
              </p>

              {/* Slider with Options */}
              <div className="space-y-6">
                {/* Option Labels */}
                <div className="flex justify-between items-start gap-4">
                  <div className="flex-1 text-left">
                    <p className="text-[#a7ebf2] text-sm lg:text-base leading-relaxed">
                      {currentScenario.option_a}
                    </p>
                  </div>
                  <div className="flex-1 text-right">
                    <p className="text-[#a7ebf2] text-sm lg:text-base leading-relaxed">
                      {currentScenario.option_b}
                    </p>
                  </div>
                </div>

                {/* Slider */}
                <div className="relative py-4">
                  <input
                    type="range"
                    min="0"
                    max="100"
                    value={sliderValue}
                    onChange={handleSliderChange}
                    className="
                      w-full h-3 rounded-full appearance-none cursor-pointer
                      bg-gradient-to-r from-[#54acbf] via-[#26658c] to-[#54acbf]
                      [&::-webkit-slider-thumb]:appearance-none
                      [&::-webkit-slider-thumb]:w-6
                      [&::-webkit-slider-thumb]:h-6
                      [&::-webkit-slider-thumb]:rounded-full
                      [&::-webkit-slider-thumb]:bg-[#a7ebf2]
                      [&::-webkit-slider-thumb]:border-2
                      [&::-webkit-slider-thumb]:border-[#011c40]
                      [&::-webkit-slider-thumb]:shadow-[0_0_15px_rgba(167,235,242,0.5)]
                      [&::-webkit-slider-thumb]:transition-all
                      [&::-webkit-slider-thumb]:hover:scale-110
                      [&::-moz-range-thumb]:w-6
                      [&::-moz-range-thumb]:h-6
                      [&::-moz-range-thumb]:rounded-full
                      [&::-moz-range-thumb]:bg-[#a7ebf2]
                      [&::-moz-range-thumb]:border-2
                      [&::-moz-range-thumb]:border-[#011c40]
                      focus:outline-none
                    "
                  />

                  {/* Tick marks */}
                  <div className="absolute top-full mt-2 w-full flex justify-between px-1">
                    <span className="text-[10px] text-[#26658c]">A</span>
                    <span className="text-[10px] text-[#26658c]">|</span>
                    <span className="text-[10px] text-[#26658c]">|</span>
                    <span className="text-[10px] text-[#26658c]">|</span>
                    <span className="text-[10px] text-[#26658c]">B</span>
                  </div>
                </div>

                {/* Current position indicator */}
                {hasInteracted && (
                  <div className="text-center mt-4">
                    <span className="text-[#54acbf] text-sm">{getSliderLabel(sliderValue)}</span>
                  </div>
                )}

                {/* Submit Button */}
                <button
                  onClick={handleSubmit}
                  disabled={!hasInteracted || animating}
                  className={`
                    w-full mt-8 py-4 rounded-lg font-bold uppercase tracking-wider
                    transition-all duration-200
                    ${hasInteracted && !animating
                      ? 'bg-[#54acbf] text-[#011c40] hover:bg-[#a7ebf2]'
                      : 'bg-[#26658c]/30 text-[#26658c] cursor-not-allowed'}
                  `}
                >
                  {animating ? 'Next...' : hasInteracted ? 'Confirm' : 'Move the slider'}
                </button>
              </div>
            </div>
          </CardFrame>
        </div>

        {/* Dimension indicator (subtle) */}
        <div className="text-center mt-6">
          <span className="text-[#26658c] text-xs uppercase tracking-widest">
            {currentScenario.dimension}
          </span>
        </div>
      </div>
    </main>
  );
}
