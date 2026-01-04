// src/app/assessment/scenarios/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState } from '@/lib/assessment';
import { supabase } from '@/lib/supabase';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  ProgressBar,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

interface Scenario {
  id: string;
  dimension: string;
  scenario_context: string;
  option_a: string;
  option_b: string;
  a_indicates: string;
  b_indicates: string;
  sort_order: number;
}

export default function QuickScenariosPage() {
  const router = useRouter();
  const [scenarios, setScenarios] = useState<Scenario[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [animating, setAnimating] = useState(false);
  const [selectedOption, setSelectedOption] = useState<'A' | 'B' | null>(null);
  const [loading, setLoading] = useState(true);
  const startTimeRef = useRef<number>(Date.now());

  const currentScenario = scenarios[currentIndex];
  const progress = scenarios.length > 0 ? Math.round(((currentIndex) / scenarios.length) * 100) : 0;

  // Load session and scenarios
  useEffect(() => {
    const loadData = async () => {
      const state = getInitialState();
      if (!state.sessionId) {
        router.push('/');
        return;
      }
      setSessionId(state.sessionId);

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
      setLoading(false);
    };

    loadData();
  }, [router]);

  // Reset timer on question change
  useEffect(() => {
    startTimeRef.current = Date.now();
    setSelectedOption(null);
  }, [currentIndex]);

  const handleChoice = async (choice: 'A' | 'B') => {
    if (!currentScenario || !sessionId || animating) return;

    setSelectedOption(choice);
    setAnimating(true);

    const responseTime = Date.now() - startTimeRef.current;

    // Save response to database
    // Using value 1 for A, 2 for B (to work with existing INTEGER column)
    await supabase.from('bo_v1_diagnostic_responses').insert({
      session_id: sessionId,
      question_id: currentScenario.id,
      value: choice === 'A' ? 1 : 2,
      skipped: false,
      response_time_ms: responseTime,
    });

    // Short delay for visual feedback
    setTimeout(async () => {
      setAnimating(false);

      if (currentIndex + 1 >= scenarios.length) {
        // All scenarios complete - update session and redirect
        await supabase
          .from('bo_v1_sessions')
          .update({
            scenarios_completed: true,
            questions_answered: scenarios.length
          })
          .eq('id', sessionId);

        const state = getInitialState();
        saveState({ ...state, stage: 'mini-samples' });
        router.push('/assessment/mini-samples');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 400);
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
            Choose what feels most natural to you
          </p>
        </div>

        {/* Progress Bar */}
        <div className="max-w-md mx-auto w-full mb-8">
          <ProgressBar value={progress} showLabel />
        </div>

        {/* Scenario Card */}
        <div className={`max-w-2xl mx-auto w-full transition-all duration-300 ${animating ? 'opacity-0 scale-95' : 'opacity-100 scale-100'}`}>
          <CardFrame active={true} variant="elevated">
            <div className="p-8 lg:p-12">

              {/* Context/Question */}
              <p className="text-xl lg:text-2xl text-[#a7ebf2] leading-relaxed text-center font-light mb-10">
                {currentScenario.scenario_context}
              </p>

              {/* Option Buttons */}
              <div className="flex flex-col gap-4">

                {/* Option A */}
                <button
                  onClick={() => handleChoice('A')}
                  disabled={animating}
                  className={`
                    relative w-full p-6 text-left
                    border-2 rounded-lg transition-all duration-200
                    ${selectedOption === 'A'
                      ? 'bg-[#54acbf]/20 border-[#54acbf] shadow-[0_0_20px_rgba(84,172,191,0.3)]'
                      : 'bg-[#011c40]/50 border-[#26658c] hover:border-[#54acbf] hover:bg-[#54acbf]/10'
                    }
                    disabled:opacity-50 disabled:cursor-not-allowed
                    focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-2 focus:ring-offset-[#011c40]
                  `}
                >
                  <div className="flex items-start gap-4">
                    <span className={`
                      flex-shrink-0 w-10 h-10 rounded-full border-2
                      flex items-center justify-center font-bold text-lg
                      ${selectedOption === 'A'
                        ? 'bg-[#54acbf] border-[#54acbf] text-[#011c40]'
                        : 'border-[#54acbf] text-[#54acbf]'
                      }
                    `}>
                      A
                    </span>
                    <span className="text-[#a7ebf2] text-lg leading-relaxed pt-1">
                      {currentScenario.option_a}
                    </span>
                  </div>
                </button>

                {/* Option B */}
                <button
                  onClick={() => handleChoice('B')}
                  disabled={animating}
                  className={`
                    relative w-full p-6 text-left
                    border-2 rounded-lg transition-all duration-200
                    ${selectedOption === 'B'
                      ? 'bg-[#54acbf]/20 border-[#54acbf] shadow-[0_0_20px_rgba(84,172,191,0.3)]'
                      : 'bg-[#011c40]/50 border-[#26658c] hover:border-[#54acbf] hover:bg-[#54acbf]/10'
                    }
                    disabled:opacity-50 disabled:cursor-not-allowed
                    focus:outline-none focus:ring-2 focus:ring-[#54acbf] focus:ring-offset-2 focus:ring-offset-[#011c40]
                  `}
                >
                  <div className="flex items-start gap-4">
                    <span className={`
                      flex-shrink-0 w-10 h-10 rounded-full border-2
                      flex items-center justify-center font-bold text-lg
                      ${selectedOption === 'B'
                        ? 'bg-[#54acbf] border-[#54acbf] text-[#011c40]'
                        : 'border-[#54acbf] text-[#54acbf]'
                      }
                    `}>
                      B
                    </span>
                    <span className="text-[#a7ebf2] text-lg leading-relaxed pt-1">
                      {currentScenario.option_b}
                    </span>
                  </div>
                </button>

              </div>

            </div>
          </CardFrame>
        </div>

        {/* Dimension indicator (subtle) */}
        <div className="text-center mt-6">
          <span className="text-[#26658c] text-xs uppercase tracking-widest">
            {currentScenario.dimension.toLowerCase()}
          </span>
        </div>

      </div>
    </main>
  );
}
