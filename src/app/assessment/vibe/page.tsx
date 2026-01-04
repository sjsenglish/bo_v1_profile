// src/app/assessment/vibe/page.tsx
'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Image from 'next/image';
import { getActiveVibePairs } from '@/lib/vibe-cards';
import { getInitialState, saveState, addVibeChoice } from '@/lib/assessment';
import { VibeChoice, VibePair } from '@/lib/types';
import { supabase } from '@/lib/supabase';

// Vibe pair data with images
const VIBE_PAIRS = [
  {
    id: 'campus_vs_city',
    dimension: 'Environment',
    question: 'Which environment appeals to you more?',
    options: [
      { id: 'A', label: 'Traditional Campus', description: 'Quads, green spaces, collegiate feel', imageUrl: 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?q=80&w=600&auto=format&fit=crop' },
      { id: 'B', label: 'City University', description: 'Urban, modern, metropolitan', imageUrl: 'https://images.unsplash.com/photo-1550601977-9c5938c82ebc?q=80&w=600&auto=format&fit=crop' }
    ]
  },
  {
    id: 'lecture_vs_seminar',
    dimension: 'Teaching Style',
    question: 'How do you prefer to learn?',
    options: [
      { id: 'A', label: 'Large Lecture', description: '200+ students, expert delivery', imageUrl: 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?q=80&w=600&auto=format&fit=crop' },
      { id: 'B', label: 'Small Seminar', description: '10-15 students, discussion-based', imageUrl: 'https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?q=80&w=600&auto=format&fit=crop' }
    ]
  },
  {
    id: 'lab_vs_library',
    dimension: 'Subject Domain',
    question: 'Where do you feel most at home?',
    options: [
      { id: 'A', label: 'Science Laboratory', description: 'Experiments, equipment, discovery', imageUrl: 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=600&auto=format&fit=crop' },
      { id: 'B', label: 'University Library', description: 'Books, research, quiet study', imageUrl: 'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?q=80&w=600&auto=format&fit=crop' }
    ]
  },
  {
    id: 'theory_vs_practice',
    dimension: 'Application',
    question: 'What excites you more?',
    options: [
      { id: 'A', label: 'Academic Research', description: 'Theory, equations, pure knowledge', imageUrl: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?q=80&w=600&auto=format&fit=crop' },
      { id: 'B', label: 'Professional Training', description: 'Hands-on, vocational, applied', imageUrl: 'https://images.unsplash.com/photo-1537462713205-e5126c84206c?q=80&w=600&auto=format&fit=crop' }
    ]
  },
  {
    id: 'exams_vs_coursework',
    dimension: 'Assessment',
    question: 'How do you prove your knowledge?',
    options: [
      { id: 'A', label: 'Exam Hall', description: 'Timed tests, high pressure', imageUrl: 'https://images.unsplash.com/photo-1560960500-1175658e4bd5?q=80&w=600&auto=format&fit=crop' },
      { id: 'B', label: 'Project Work', description: 'Coursework, portfolios, research', imageUrl: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?q=80&w=600&auto=format&fit=crop' }
    ]
  },
  {
    id: 'solo_vs_group',
    dimension: 'Work Mode',
    question: 'How do you do your best work?',
    options: [
      { id: 'A', label: 'Solo Study', description: 'Independent, focused, self-paced', imageUrl: 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?q=80&w=600&auto=format&fit=crop' },
      { id: 'B', label: 'Group Project', description: 'Collaborative, team-based', imageUrl: 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=600&auto=format&fit=crop' }
    ]
  }
];

export default function VibeSwiperPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [state, setState] = useState(getInitialState());
  const [startTime, setStartTime] = useState<number>(Date.now());

  const currentPair = VIBE_PAIRS[currentIndex];
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
    if (!sessionId) return;

    const responseTime = Date.now() - startTime;

    const choice: VibeChoice = {
      pair_id: currentPair.id,
      option_chosen: optionChosen,
      response_time_ms: responseTime,
    };

    // Save to database
    await supabase.from('bo_v1_vibe_choices').insert({
      session_id: sessionId,
      pair_id: currentPair.id,
      option_chosen: optionChosen,
      response_time_ms: responseTime,
    });

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

      saveState({ ...newState, stage: 'scenarios' });
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

  return (
    <div className="min-h-screen bg-[#0a0a0f] text-white flex flex-col">
      {/* Background Blurs */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
        <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
      </div>

      <div className="flex-1 flex flex-col w-full max-w-5xl mx-auto px-4 py-8 relative z-10">
        {/* Header */}
        <div className="flex justify-between items-end mb-8 border-b border-white/10 pb-4">
          <div>
            <div className="text-sm font-bold text-gray-400 uppercase tracking-widest mb-1">
              Pair {currentIndex + 1} of {VIBE_PAIRS.length}
            </div>
            <h2 className="text-xl md:text-2xl font-bold text-white">{currentPair.question}</h2>
          </div>
          <div className="text-right">
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
        <div className="flex-1 flex flex-col md:flex-row gap-6 md:gap-12 items-center justify-center relative">
          {/* Option A */}
          <button
            onClick={() => handleSelect('A')}
            className="relative group cursor-pointer overflow-hidden rounded-2xl border-2 border-white/5 bg-[#1a1a24] hover:border-[#6366f1]/50 transition-all duration-300 w-full md:w-1/2 h-[280px] md:h-[400px]"
          >
            {/* Background Image */}
            <div className="absolute inset-0">
              <img
                src={currentPair.options[0].imageUrl}
                alt={currentPair.options[0].label}
                className="w-full h-full object-cover opacity-60 group-hover:opacity-80 transition-opacity duration-300"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent"></div>
            </div>

            {/* Content */}
            <div className="absolute bottom-0 left-0 w-full p-6 text-left">
              <h3 className="text-2xl font-bold text-white mb-1 group-hover:text-[#6366f1] transition-colors">
                {currentPair.options[0].label}
              </h3>
              <p className="text-gray-400 text-sm">{currentPair.options[0].description}</p>
              <div className="mt-4 opacity-0 group-hover:opacity-100 transition-opacity transform translate-y-2 group-hover:translate-y-0">
                <span className="inline-block px-4 py-2 bg-[#6366f1]/20 border border-[#6366f1] text-[#6366f1] text-xs font-bold rounded-full uppercase tracking-widest">
                  Tap to Select
                </span>
              </div>
            </div>

            {/* Hover Glow */}
            <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none border-2 border-[#6366f1] rounded-2xl shadow-[inset_0_0_40px_rgba(99,102,241,0.3)]"></div>
          </button>

          {/* VS Badge */}
          <div className="absolute left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 z-10 pointer-events-none hidden md:flex">
            <div className="w-16 h-16 rounded-full bg-[#0a0a0f] border-2 border-white/10 flex items-center justify-center shadow-2xl">
              <span className="font-black text-gray-500 text-lg italic">VS</span>
            </div>
          </div>

          {/* Option B */}
          <button
            onClick={() => handleSelect('B')}
            className="relative group cursor-pointer overflow-hidden rounded-2xl border-2 border-white/5 bg-[#1a1a24] hover:border-[#6366f1]/50 transition-all duration-300 w-full md:w-1/2 h-[280px] md:h-[400px]"
          >
            {/* Background Image */}
            <div className="absolute inset-0">
              <img
                src={currentPair.options[1].imageUrl}
                alt={currentPair.options[1].label}
                className="w-full h-full object-cover opacity-60 group-hover:opacity-80 transition-opacity duration-300"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent"></div>
            </div>

            {/* Content */}
            <div className="absolute bottom-0 left-0 w-full p-6 text-left">
              <h3 className="text-2xl font-bold text-white mb-1 group-hover:text-[#6366f1] transition-colors">
                {currentPair.options[1].label}
              </h3>
              <p className="text-gray-400 text-sm">{currentPair.options[1].description}</p>
              <div className="mt-4 opacity-0 group-hover:opacity-100 transition-opacity transform translate-y-2 group-hover:translate-y-0">
                <span className="inline-block px-4 py-2 bg-[#6366f1]/20 border border-[#6366f1] text-[#6366f1] text-xs font-bold rounded-full uppercase tracking-widest">
                  Tap to Select
                </span>
              </div>
            </div>

            {/* Hover Glow */}
            <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none border-2 border-[#6366f1] rounded-2xl shadow-[inset_0_0_40px_rgba(99,102,241,0.3)]"></div>
          </button>
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
