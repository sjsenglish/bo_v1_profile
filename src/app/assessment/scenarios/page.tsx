// src/app/assessment/scenarios/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState, addScenarioResponse } from '@/lib/assessment';
import { ScenarioResponse, Scenario } from '@/lib/types';
import { supabase } from '@/lib/supabase';

// 20 scenarios - 2 per dimension (10 dimensions)
const SCENARIOS = [
  // SOCIAL (2 items)
  {
    id: 'social_1',
    question: "It's 10pm and you're stuck on a problem set that's due tomorrow morning.",
    option_a: "Message the group chat to see if anyone's figured it out.",
    option_b: "Grind through it alone — you'll learn more that way.",
    dimension: 'social',
    a_indicates: 'high',
    b_indicates: 'low',
  },
  {
    id: 'social_2',
    question: "You're revising for a big exam next week.",
    option_a: "Organise a study group to quiz each other.",
    option_b: "Find a quiet corner and work through past papers solo.",
    dimension: 'social',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // RECEPTIVITY (2 items)
  {
    id: 'receptivity_1',
    question: "You receive harsh feedback on a draft essay from your teacher.",
    option_a: "Defend your approach and explain why you made those choices.",
    option_b: "Accept it immediately and rewrite the section completely.",
    dimension: 'receptivity',
    a_indicates: 'low',
    b_indicates: 'high',
  },
  {
    id: 'receptivity_2',
    question: "A classmate suggests your project approach is fundamentally flawed.",
    option_a: "Listen carefully and consider completely changing direction.",
    option_b: "Explain your reasoning — you've thought this through.",
    dimension: 'receptivity',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // TRANSFER (2 items)
  {
    id: 'transfer_1',
    question: "You encounter a new type of problem you've never seen before.",
    option_a: "Look for patterns from other subjects that might apply.",
    option_b: "Find the specific formula or method for this exact problem type.",
    dimension: 'transfer',
    a_indicates: 'high',
    b_indicates: 'low',
  },
  {
    id: 'transfer_2',
    question: "Your biology teacher asks you to explain osmosis.",
    option_a: "Use an analogy from everyday life or another subject.",
    option_b: "Stick to the precise scientific definition and terminology.",
    dimension: 'transfer',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // STRUCTURE (2 items)
  {
    id: 'structure_1',
    question: "You have to choose an EPQ topic.",
    option_a: "Pick something practical with a clear, definite answer.",
    option_b: "Pick something philosophical with multiple open interpretations.",
    dimension: 'structure',
    a_indicates: 'high',
    b_indicates: 'low',
  },
  {
    id: 'structure_2',
    question: "You're given a choice between two essay questions.",
    option_a: "The one with a detailed marking rubric and clear expectations.",
    option_b: "The open-ended one where you can take it anywhere.",
    dimension: 'structure',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // DEPTH (2 items)
  {
    id: 'depth_1',
    question: "You have a free period in your schedule.",
    option_a: "Go to the library to get ahead on next week's reading.",
    option_b: "Go to the common room to relax and socialise with friends.",
    dimension: 'depth',
    a_indicates: 'high',
    b_indicates: 'low',
  },
  {
    id: 'depth_2',
    question: "You've finished the required reading for an essay.",
    option_a: "Find additional sources to go beyond what's expected.",
    option_b: "Move on to your other subjects — you've done enough here.",
    dimension: 'depth',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // TOLERANCE (2 items)
  {
    id: 'tolerance_1',
    question: "In a group project, two members aren't pulling their weight.",
    option_a: "Confront them directly and demand they contribute.",
    option_b: "Do the work yourself to ensure you get a good grade.",
    dimension: 'tolerance',
    a_indicates: 'low',
    b_indicates: 'high',
  },
  {
    id: 'tolerance_2',
    question: "You've been working on a maths problem for 45 minutes with no progress.",
    option_a: "Keep pushing — the breakthrough will come eventually.",
    option_b: "Move on and come back to it later with fresh eyes.",
    dimension: 'tolerance',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // PRECISION (2 items)
  {
    id: 'precision_1',
    question: "You're proofreading an essay before submission.",
    option_a: "Read it once for obvious errors, then submit.",
    option_b: "Go through multiple times checking spelling, grammar, and formatting separately.",
    dimension: 'precision',
    a_indicates: 'low',
    b_indicates: 'high',
  },
  {
    id: 'precision_2',
    question: "You're doing a chemistry calculation.",
    option_a: "Work through carefully, double-checking each step.",
    option_b: "Get the rough answer quickly and move on.",
    dimension: 'precision',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // CALIBRATION (2 items)
  {
    id: 'calibration_1',
    question: "After finishing an exam, your friend asks how you did.",
    option_a: "Give a confident prediction — you know how these usually go.",
    option_b: "Say you're not sure — exams are unpredictable.",
    dimension: 'calibration',
    a_indicates: 'high',
    b_indicates: 'low',
  },
  {
    id: 'calibration_2',
    question: "You're about to get your mock results back.",
    option_a: "You have a pretty accurate sense of what you'll get.",
    option_b: "You genuinely have no idea — could be anything.",
    dimension: 'calibration',
    a_indicates: 'high',
    b_indicates: 'low',
  },

  // RETRIEVAL (2 items)
  {
    id: 'retrieval_1',
    question: "You're revising for an exam next month.",
    option_a: "Re-read your notes and highlight key points.",
    option_b: "Test yourself with flashcards and practice questions.",
    dimension: 'retrieval',
    a_indicates: 'low',
    b_indicates: 'high',
  },
  {
    id: 'retrieval_2',
    question: "You need to memorise a list of key dates for history.",
    option_a: "Write them out repeatedly until they stick.",
    option_b: "Cover the dates and try to recall them from memory.",
    dimension: 'retrieval',
    a_indicates: 'low',
    b_indicates: 'high',
  },

  // CONSISTENCY (2 items)
  {
    id: 'consistency_1',
    question: "It's the weekend and you have coursework due Monday.",
    option_a: "Stick to your study schedule — Saturday morning as planned.",
    option_b: "See how you feel — you work better under pressure anyway.",
    dimension: 'consistency',
    a_indicates: 'high',
    b_indicates: 'low',
  },
  {
    id: 'consistency_2',
    question: "You've set yourself a goal to read 30 pages every evening.",
    option_a: "You'll hit that target most nights, no matter what.",
    option_b: "Some nights you'll do more, some less — depends on the day.",
    dimension: 'consistency',
    a_indicates: 'high',
    b_indicates: 'low',
  },
];

export default function ScenariosPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [sliderValue, setSliderValue] = useState(50);
  const [hasInteracted, setHasInteracted] = useState(false);
  const [state, setState] = useState(getInitialState());
  const startTimeRef = useRef<number>(Date.now());

  const currentScenario = SCENARIOS[currentIndex];
  const progressPercent = Math.round((currentIndex / SCENARIOS.length) * 100);

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
    if (!hasInteracted || !sessionId) return;

    const responseTime = Date.now() - startTimeRef.current;

    const response: ScenarioResponse = {
      scenario_id: currentScenario.id,
      position: sliderValue,
      response_time_ms: responseTime,
    };

    // Save to database (upsert to handle page refresh/back navigation)
    await supabase.from('bo_v1_scenario_responses').upsert({
      session_id: sessionId,
      scenario_id: currentScenario.id,
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
          className={`p-6 rounded-xl border-2 transition-all duration-300 text-center transform mb-6 ${
            hasInteracted && isLeft && !isNeutral
              ? 'bg-gradient-to-br from-[#FF4D6D]/20 to-transparent border-[#FF4D6D] shadow-[0_0_20px_rgba(255,77,109,0.2)] scale-105'
              : 'bg-[#1a1a24] border-white/10 scale-100'
          }`}
        >
          <p className={`text-lg transition-colors ${hasInteracted && isLeft && !isNeutral ? 'text-white font-medium' : 'text-gray-300'}`}>
            {currentScenario.option_a}
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
          className={`p-6 rounded-xl border-2 transition-all duration-300 text-center transform ${
            hasInteracted && !isLeft && !isNeutral
              ? 'bg-gradient-to-br from-[#00D9FF]/20 to-transparent border-[#00D9FF] shadow-[0_0_20px_rgba(0,217,255,0.2)] scale-105'
              : 'bg-[#1a1a24] border-white/10 scale-100'
          }`}
        >
          <p className={`text-lg transition-colors ${hasInteracted && !isLeft && !isNeutral ? 'text-white font-medium' : 'text-gray-300'}`}>
            {currentScenario.option_b}
          </p>
        </div>

        {/* Buttons */}
        <div className="mt-12 flex flex-col items-center gap-4">
          <button
            onClick={handleNext}
            disabled={!hasInteracted}
            className={`px-8 py-3 rounded-xl font-semibold flex items-center gap-2 transition-all duration-300 ${
              hasInteracted
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
