// src/app/page.tsx
'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { saveState, clearState } from '@/lib/assessment';

import {
  Atmosphere,
  GradientFade,
  CardFrame,
  CardFrameStack,
  ArcaneButton,
  GemIcon,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

export default function LandingPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);

  const startAssessment = async () => {
    setLoading(true);
    
    clearState();

    const { data, error } = await supabase
      .from('bo_v1_sessions')
      .insert({})
      .select('id')
      .single();

    if (error) {
      console.error('Failed to create session:', error);
      setLoading(false);
      return;
    }

    saveState({
      sessionId: data.id,
      stage: 'vibe',
      vibeSwipes: [],
      startedAt: Date.now(),
    });

    router.push('/assessment/vibe');
  };

  return (
    <main className="min-h-screen relative overflow-hidden">
      <Atmosphere variant="default" />
      <GradientFade position="bottom" />

      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 px-8 py-6 flex justify-between items-center z-50">
        <div className="flex items-center gap-2 cursor-pointer">
          <GemIcon glow color={ARCANE_COLORS.teal} />
          <span className="text-xs font-black uppercase tracking-[0.3em] text-[#a7ebf2]">ERA</span>
        </div>
        <div className="flex items-center gap-8">
          <button className="text-[11px] uppercase tracking-[0.2em] text-[#54acbf] hover:text-[#a7ebf2] transition-colors">
            Lore
          </button>
          <button className="text-[11px] uppercase tracking-[0.2em] text-[#54acbf] hover:text-[#a7ebf2] transition-colors">
            Archives
          </button>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-6 min-h-screen flex items-center">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-24 items-center w-full pt-20 lg:pt-0">
          
          {/* Left: Hero Text */}
          <div className="space-y-8 animate-arcane-fade-in">
            <div className="space-y-4">
              <p className="text-[#54acbf] uppercase tracking-[0.4em] text-xs font-bold">
                The Great Assessment Begins
              </p>
              
              <h1 className="text-6xl lg:text-8xl font-black uppercase leading-[0.9] tracking-tight">
                <span className="text-[#a7ebf2]">ExamRizz</span>
                <br />
                <span className="text-[#54acbf]">Arena</span>
              </h1>
            </div>

            <div className="space-y-2 max-w-lg">
              <p className="text-xl lg:text-2xl text-[#a7ebf2] font-medium">
                Find where you'll thrive, not just survive.
              </p>
              <p className="text-[#54acbf] text-sm lg:text-base leading-relaxed opacity-80">
                A data-driven assessment to help forge your future beyond guesswork.
              </p>
            </div>

            {/* Feature Pills */}
            <div className="flex flex-wrap gap-3">
              <div className="px-4 py-2 border border-[#26658c] rounded-sm flex items-center gap-2 bg-[#023859]/50">
                <GemIcon color={ARCANE_COLORS.ice} size="sm" />
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#54acbf]">30,960 UK Courses</span>
              </div>
              <div className="px-4 py-2 border border-[#26658c] rounded-sm flex items-center gap-2 bg-[#023859]/50">
                <GemIcon color={ARCANE_COLORS.teal} size="sm" />
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#54acbf]">10 Dispositions</span>
              </div>
              <div className="px-4 py-2 border border-[#26658c] rounded-sm flex items-center gap-2 bg-[#023859]/50">
                <GemIcon color={ARCANE_COLORS.gold} size="sm" />
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#54acbf]">~10 Minutes</span>
              </div>
            </div>

            {/* CTA */}
            <div className="pt-4">
              <ArcaneButton 
                onClick={startAssessment}
                disabled={loading}
                loading={loading}
                size="lg"
                icon="arrow"
              >
                Begin
              </ArcaneButton>
            </div>
          </div>

          {/* Right: Mystery Card */}
          <div className="hidden lg:flex justify-center lg:justify-end">
            <CardFrameStack className="w-80 h-[500px]">
              <CardFrame active={true} className="w-full h-full">
                <div className="absolute inset-0 bg-gradient-to-br from-[#011c40] to-[#023859]" />
                <div className="absolute inset-0 flex flex-col items-center justify-center p-8 text-center space-y-6">
                  {/* Spinning Dashed Circle */}
                  <div className="w-24 h-24 rounded-full border-2 border-dashed border-[#a7ebf2] opacity-50 animate-[spin_12s_linear_infinite]" />
                  <p className="text-[#a7ebf2] font-serif italic tracking-wider text-xl">
                    Your Spirit Awaits
                  </p>
                </div>
              </CardFrame>
            </CardFrameStack>
          </div>

        </div>
      </div>
    </main>
  );
}