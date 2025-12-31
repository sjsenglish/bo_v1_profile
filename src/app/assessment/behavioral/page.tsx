// src/app/assessment/behavioral/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getBehavioralQuestions } from '@/lib/questions';
import { getInitialState, saveState } from '@/lib/assessment';
import { DiagnosticResponse } from '@/lib/types';
import { supabase } from '@/lib/supabase';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

const DIMENSION_LABELS: Record<string, { name: string; description: string }> = {
  structure: { name: 'Structure', description: 'Scaffolding Need' },
  consistency: { name: 'Consistency', description: 'Routine Stability' },
  social: { name: 'Social', description: 'Learning Mode' },
  depth: { name: 'Depth', description: 'Learning Orientation' },
};

// Diamond Button Component
function DiamondButton({ 
  value, 
  selected, 
  hovered,
  onClick, 
  onHover,
  onLeave,
  disabled 
}: { 
  value: number; 
  selected: boolean;
  hovered: boolean;
  onClick: () => void;
  onHover: () => void;
  onLeave: () => void;
  disabled: boolean;
}) {
  return (
    <button
      onClick={onClick}
      onMouseEnter={onHover}
      onMouseLeave={onLeave}
      disabled={disabled}
      className="group focus:outline-none disabled:opacity-50 disabled:cursor-not-allowed"
    >
      <div 
        className={`
          w-14 h-14 rotate-45 border-2 flex items-center justify-center
          transition-all duration-200
          ${selected
            ? 'bg-[#54acbf] border-[#54acbf] shadow-[0_0_20px_rgba(84,172,191,0.5)]'
            : hovered
              ? 'bg-[#54acbf]/30 border-[#54acbf]'
              : 'bg-transparent border-[#54acbf]/60 group-hover:border-[#54acbf]'
          }
        `}
      >
        <span 
          className={`
            -rotate-45 text-lg font-medium transition-colors duration-200
            ${selected 
              ? 'text-[#011c40]' 
              : 'text-[#54acbf]'
            }
          `}
        >
          {value}
        </span>
      </div>
    </button>
  );
}

// Likert Scale Component
function LikertScale({
  selectedValue,
  onSelect,
  disabled
}: {
  selectedValue: number | null;
  onSelect: (value: number) => void;
  disabled: boolean;
}) {
  const [hoveredValue, setHoveredValue] = useState<number | null>(null);

  return (
    <div className="flex flex-col items-center gap-4">
      {/* Scale Labels */}
      <div className="flex items-center justify-between w-full max-w-md px-2">
        <span className="text-[#54acbf]/70 text-sm uppercase tracking-[0.15em]">Never</span>
        <span className="text-[#54acbf]/70 text-sm uppercase tracking-[0.15em]">Always</span>
      </div>
      
      {/* Diamond Buttons */}
      <div className="flex items-center gap-4">
        {[1, 2, 3, 4, 5].map((value) => (
          <DiamondButton
            key={value}
            value={value}
            selected={selectedValue === value}
            hovered={hoveredValue === value}
            onClick={() => onSelect(value)}
            onHover={() => setHoveredValue(value)}
            onLeave={() => setHoveredValue(null)}
            disabled={disabled}
          />
        ))}
      </div>
      
      {/* Intensity Label */}
      <div className="h-6">
        {selectedValue && (
          <span className="text-[#54acbf]/70 text-sm uppercase tracking-[0.15em]">
            Intensity: {selectedValue}
          </span>
        )}
      </div>
    </div>
  );
}

export default function BehavioralQuestionsPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [responses, setResponses] = useState<DiagnosticResponse[]>([]);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [selectedValue, setSelectedValue] = useState<number | null>(null);
  const [animating, setAnimating] = useState(false);
  const startTimeRef = useRef<number>(Date.now());

  const questions = getBehavioralQuestions();
  const currentQuestion = questions[currentIndex];

  useEffect(() => {
    const state = getInitialState();
    if (!state.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(state.sessionId);
    setResponses(state.behavioralResponses);
    setCurrentIndex(state.behavioralResponses.length);
  }, [router]);

  useEffect(() => {
    startTimeRef.current = Date.now();
    setSelectedValue(null);
  }, [currentIndex]);

  const handleSelect = async (value: number) => {
    if (!currentQuestion || !sessionId || animating) return;

    setSelectedValue(value);
    setAnimating(true);

    const responseTime = Date.now() - startTimeRef.current;

    const newResponse: DiagnosticResponse = {
      question_id: currentQuestion.id,
      value,
      skipped: false,
      response_time_ms: responseTime,
    };

    await supabase.from('bo_v1_diagnostic_responses').insert({
      session_id: sessionId,
      question_id: currentQuestion.id,
      value,
      skipped: false,
      response_time_ms: responseTime,
    });

    const newResponses = [...responses, newResponse];
    setResponses(newResponses);

    const state = getInitialState();
    saveState({ ...state, behavioralResponses: newResponses });

    setTimeout(() => {
      setAnimating(false);
      if (currentIndex + 1 >= questions.length) {
        supabase.from('bo_v1_sessions').update({ 
          behavioral_completed: true,
          completed_at: new Date().toISOString()
        }).eq('id', sessionId);
        saveState({ ...state, behavioralResponses: newResponses, stage: 'experiential' });
        router.push('/assessment/capacity');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 400);
  };

  const handleSkip = async () => {
    if (!currentQuestion || !sessionId || animating) return;

    setAnimating(true);

    const newResponse: DiagnosticResponse = {
      question_id: currentQuestion.id,
      value: 3,
      skipped: true,
    };

    await supabase.from('bo_v1_diagnostic_responses').insert({
      session_id: sessionId,
      question_id: currentQuestion.id,
      value: null,
      skipped: true,
    });

    const newResponses = [...responses, newResponse];
    setResponses(newResponses);

    const state = getInitialState();
    saveState({ ...state, behavioralResponses: newResponses });

    setTimeout(() => {
      setAnimating(false);
      if (currentIndex + 1 >= questions.length) {
        supabase.from('bo_v1_sessions').update({ 
          behavioral_completed: true,
          completed_at: new Date().toISOString()
        }).eq('id', sessionId);
        saveState({ ...state, behavioralResponses: newResponses, stage: 'experiential' });
        router.push('/assessment/capacity');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 300);
  };

  const skipBehavioral = async () => {
    if (!sessionId) return;
    await supabase.from('bo_v1_sessions').update({ 
      behavioral_skipped: true,
      completed_at: new Date().toISOString()
    }).eq('id', sessionId);
    const state = getInitialState();
    saveState({ ...state, stage: 'experiential' });
    router.push('/assessment/capacity');
  };

  if (!currentQuestion) {
    return (
      <div className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  const dimensionInfo = DIMENSION_LABELS[currentQuestion.dimension] || { 
    name: 'Behavioural', 
    description: 'Assessment' 
  };

  return (
    <main className="min-h-screen relative overflow-hidden bg-[#011c40]">
      <Atmosphere variant="subtle" />
      <GradientFade position="bottom" />

      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 px-8 py-6 flex justify-between items-center z-50">
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2">
            <GemIcon glow color={ARCANE_COLORS.teal} />
            <span className="text-xs font-black uppercase tracking-[0.3em] text-[#a7ebf2]">ERA</span>
          </div>
        </div>
        <div className="flex items-center gap-6">
          <button
            onClick={skipBehavioral}
            className="text-[#26658c] hover:text-[#54acbf] text-[11px] uppercase tracking-[0.2em] transition-colors"
          >
            Skip Section →
          </button>
          <span className="text-[11px] uppercase tracking-[0.2em] text-[#26658c]">
            Lore
          </span>
          <span className="text-[11px] uppercase tracking-[0.2em] text-[#26658c]">
            Archives
          </span>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-6 min-h-screen flex items-center justify-center">
        
        {/* Question Card */}
        <div className="w-full max-w-3xl">
          <div className={`transition-all duration-300 ${animating ? 'opacity-0 scale-95' : 'opacity-100 scale-100'}`}>
            
            <CardFrame active={true} variant="elevated">
              <div className="p-12 lg:p-16 flex flex-col items-center">
                
                {/* Header */}
                <div className="mb-10 text-center">
                  <span className="text-[#54acbf] text-sm uppercase tracking-[0.3em]">
                    Behavioural{' '}
                    <span className="border-b border-[#54acbf] pb-0.5">Resonance</span>
                    {' '}{currentIndex + 1}/{questions.length}
                  </span>
                </div>

                {/* Question Text */}
                <p className="text-2xl lg:text-3xl text-[#a7ebf2] leading-relaxed text-center font-light italic mb-12">
                  "{currentQuestion.text}"
                </p>

                {/* Likert Scale */}
                <LikertScale
                  selectedValue={selectedValue}
                  onSelect={handleSelect}
                  disabled={animating}
                />

                {/* Skip */}
                <button
                  onClick={handleSkip}
                  disabled={animating}
                  className="mt-8 text-[#26658c] hover:text-[#54acbf] text-xs uppercase tracking-widest transition-colors disabled:opacity-50"
                >
                  Skip →
                </button>
              </div>
            </CardFrame>

          </div>
        </div>

      </div>
    </main>
  );
}