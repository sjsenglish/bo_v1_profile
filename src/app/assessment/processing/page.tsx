// src/app/assessment/processing/page.tsx
'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState } from '@/lib/assessment';
import { supabase } from '@/lib/supabase';
import { QUESTIONS } from '@/lib/questions';
import { VIBE_CARDS } from '@/lib/vibe-cards';
import { scoreCognitive, scoreBehavioral, proxyCapacities, processVibeSwipes, applyVibeNudges, findDominant, findNemesis } from '@/lib/scoring';
import { assignIdentity } from '@/lib/identity';
import { rankCoursesAsync } from '@/lib/matching';
import { Course } from '@/lib/types';

import {
  Atmosphere,
  GemIcon,
  ArcaneButton,
  ARCANE_COLORS,
} from '@/components/ui/arcane';

const STEPS = [
  { label: 'Analysing responses', description: 'Reading the patterns in your choices...' },
  { label: 'Building cognitive profile', description: 'Mapping your mental architecture...' },
  { label: 'Mapping behavioural patterns', description: 'Understanding how you learn...' },
  { label: 'Calculating capacities', description: 'Measuring your potential...' },
  { label: 'Summoning your familiar', description: 'A spirit emerges from the aether...' },
  { label: 'Scanning the archives', description: 'Searching 30,960 UK courses...' },
  { label: 'Ranking matches', description: 'Finding where you belong...' },
  { label: 'Finalising results', description: 'Your destiny awaits...' },
];

export default function ProcessingPage() {
  const router = useRouter();
  const [currentStep, setCurrentStep] = useState(0);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const process = async () => {
      const state = getInitialState();
      
      if (!state.sessionId) {
        router.push('/');
        return;
      }

      try {
        setCurrentStep(0);
        await delay(500);

        setCurrentStep(1);
        const cognitiveResponses = state.cognitiveResponses.map(r => ({
          ...r,
          value: r.value ?? 3,
        }));
        let cognitive = scoreCognitive(cognitiveResponses, QUESTIONS);
        await delay(400);

        setCurrentStep(2);
        const behavioralResponses = state.behavioralResponses.map(r => ({
          ...r,
          value: r.value ?? 3,
        }));
        const behavioral = scoreBehavioral(behavioralResponses, QUESTIONS);
        await delay(400);

        setCurrentStep(3);
        const vibeResult = processVibeSwipes(state.vibeSwipes, VIBE_CARDS);
        cognitive = applyVibeNudges(cognitive, vibeResult.dispositionNudges);
        const capacities = proxyCapacities(cognitive);
        await delay(400);

        setCurrentStep(4);
        const dominant = findDominant(cognitive, behavioral);
        const nemesis = findNemesis(cognitive, behavioral);
        const identity = assignIdentity(state.sessionId, cognitive, behavioral, dominant, nemesis);
        await delay(500);

        setCurrentStep(5);
        const { data: courses, error: coursesError } = await supabase
          .from('bo_v1_courses')
          .select('*')
          .eq('is_active', true)
          .limit(5000);

        if (coursesError) throw coursesError;
        await delay(300);

        setCurrentStep(6);
        const matches = await rankCoursesAsync(
          cognitive,
          behavioral,
          capacities,
          vibeResult.tags,
          courses as Course[],
          20
        );
        await delay(400);

        setCurrentStep(7);

        const profileData = {
          session_id: state.sessionId,
          vibe_tags: vibeResult.tags,
          calibration: cognitive.calibration.value,
          calibration_sigma: cognitive.calibration.sigma,
          tolerance: cognitive.tolerance.value,
          tolerance_sigma: cognitive.tolerance.sigma,
          transfer: cognitive.transfer.value,
          transfer_sigma: cognitive.transfer.sigma,
          precision: cognitive.precision.value,
          precision_sigma: cognitive.precision.sigma,
          retrieval: cognitive.retrieval.value,
          retrieval_sigma: cognitive.retrieval.sigma,
          receptivity: cognitive.receptivity.value,
          receptivity_sigma: cognitive.receptivity.sigma,
          structure: behavioral.structure.value,
          structure_sigma: behavioral.structure.sigma,
          consistency: behavioral.consistency.value,
          consistency_sigma: behavioral.consistency.sigma,
          social: behavioral.social.value,
          social_sigma: behavioral.social.sigma,
          depth: behavioral.depth.value,
          depth_sigma: behavioral.depth.sigma,
          vrb_value: capacities.vrb.value,
          vrb_sigma: capacities.vrb.sigma,
          vrb_provenance: capacities.vrb.provenance,
          qnt_value: capacities.qnt.value,
          qnt_sigma: capacities.qnt.sigma,
          qnt_provenance: capacities.qnt.provenance,
          spd_value: capacities.spd.value,
          spd_sigma: capacities.spd.sigma,
          spd_provenance: capacities.spd.provenance,
          familiar_id: identity.familiar_id,
          familiar_stage: identity.familiar_stage,
          guild_id: identity.guild_id,
          dominant: identity.dominant,
          nemesis: identity.nemesis,
        };

        const { error: profileError } = await supabase
          .from('bo_v1_profiles')
          .upsert(profileData, { onConflict: 'session_id' });

        if (profileError) throw profileError;

        const matchInserts = matches.map(m => ({
          session_id: state.sessionId,
          course_id: m.course.id,
          score: m.score,
          fit_score: m.cognitive_score,
          friction: m.friction,
          cognitive_score: m.cognitive_score,
          behavioral_penalty: m.behavioral_penalty,
          vibe_bonus: m.vibe_bonus,
          rank: m.rank,
        }));

        const { error: matchError } = await supabase
          .from('bo_v1_matches')
          .upsert(matchInserts, { 
            onConflict: 'session_id,course_id',
            ignoreDuplicates: false 
          });

        if (matchError) throw matchError;

        await delay(500);

        saveState({ ...state, stage: 'complete' });
        router.push(`/results/${state.sessionId}`);

      } catch (err) {
        console.error('Processing error:', err);
        setError(err instanceof Error ? err.message : 'An error occurred');
      }
    };

    process();
  }, [router]);

  const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

  if (error) {
    return (
      <main className="min-h-screen bg-[#011c40] relative overflow-hidden flex items-center justify-center p-6">
        <Atmosphere variant="subtle" />
        <div className="text-center space-y-6">
          <div className="w-16 h-16 mx-auto border-2 border-red-500/50 rounded-full flex items-center justify-center">
            <span className="text-red-400 text-2xl">✕</span>
          </div>
          <div>
            <h2 className="text-xl text-[#a7ebf2] font-bold mb-2">Something went wrong</h2>
            <p className="text-[#26658c] text-sm max-w-md">{error}</p>
          </div>
          <ArcaneButton onClick={() => router.push('/')} variant="secondary">
            Start Over
          </ArcaneButton>
        </div>
      </main>
    );
  }

  const currentStepData = STEPS[currentStep];

  return (
    <main className="min-h-screen bg-[#011c40] relative overflow-hidden flex items-center justify-center p-6">
      <Atmosphere variant="intense" />

      <div className="max-w-lg w-full text-center">
        
        {/* Arcane Loader */}
        <div className="mb-12">
          <div className="relative w-48 h-48 mx-auto">
            {/* Outer Ring */}
            <div 
              className="absolute inset-0 border-4 border-[#54acbf] border-t-transparent rounded-full arcane-glow-teal"
              style={{ animation: 'arcane-spin-chase 2s cubic-bezier(0.4, 0, 0.2, 1) infinite' }}
            />
            {/* Middle Ring (counter-rotate) */}
            <div 
              className="absolute inset-4 border-4 border-[#a7ebf2] border-b-transparent rounded-full arcane-glow-ice"
              style={{ animation: 'arcane-spin-chase-reverse 1.5s cubic-bezier(0.4, 0, 0.2, 1) infinite' }}
            />
            {/* Inner Ring */}
            <div 
              className="absolute inset-8 border-4 border-[#26658c] border-t-transparent rounded-full"
              style={{ animation: 'arcane-spin-chase 2.5s cubic-bezier(0.4, 0, 0.2, 1) infinite' }}
            />
            {/* Centre Gem */}
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="animate-arcane-pulse-glow">
                <GemIcon glow color={ARCANE_COLORS.teal} size="lg" />
              </div>
            </div>
          </div>
        </div>

        {/* Current Step Display */}
        <div className="mb-10 space-y-2">
          <h2 className="text-2xl font-bold uppercase tracking-widest text-[#a7ebf2]">
            {currentStepData.label}
          </h2>
          <p className="text-[#54acbf] font-serif italic text-sm opacity-80">
            {currentStepData.description}
          </p>
        </div>

        {/* Step List */}
        <div className="space-y-3 text-left max-w-sm mx-auto">
          {STEPS.map((step, i) => {
            const isComplete = i < currentStep;
            const isCurrent = i === currentStep;
            const isPending = i > currentStep;

            return (
              <div
                key={i}
                className={`
                  flex items-center gap-4 transition-all duration-500
                  ${isComplete ? 'opacity-50' : ''}
                  ${isCurrent ? 'opacity-100' : ''}
                  ${isPending ? 'opacity-20' : ''}
                `}
              >
                {/* Status Icon */}
                <div 
                  className={`
                    w-8 h-8 rounded-full flex items-center justify-center shrink-0
                    border-2 transition-all duration-500
                    ${isComplete 
                      ? 'border-[#54acbf] bg-[#54acbf]/20' 
                      : isCurrent 
                        ? 'border-[#54acbf] bg-[#011c40] arcane-glow-teal' 
                        : 'border-[#26658c] bg-[#011c40]'
                    }
                  `}
                >
                  {isComplete ? (
                    <svg className="w-4 h-4 text-[#54acbf]" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                  ) : isCurrent ? (
                    <div className="w-2 h-2 bg-[#54acbf] rounded-full animate-pulse" />
                  ) : (
                    <span className="text-[#26658c] text-xs font-mono">{i + 1}</span>
                  )}
                </div>

                {/* Label */}
                <span 
                  className={`
                    text-sm transition-colors duration-500
                    ${isCurrent ? 'text-[#a7ebf2]' : 'text-[#26658c]'}
                  `}
                >
                  {step.label}
                </span>
              </div>
            );
          })}
        </div>

        {/* Footer Info */}
        <div className="mt-12 py-4 px-6 bg-[#023859]/30 border border-[#26658c]/50 rounded-sm">
          <p className="text-[#26658c] text-xs uppercase tracking-widest">
            <GemIcon color={ARCANE_COLORS.ice} size="sm" className="inline-block mr-2 -mt-1" />
            Matching against 30,960 UK university courses
          </p>
        </div>

      </div>

      {/* Keyframe styles injected */}
      <style jsx>{`
        @keyframes arcane-spin-chase {
          0% { transform: rotate(0deg); }
          50% { transform: rotate(280deg); }
          100% { transform: rotate(360deg); }
        }
        @keyframes arcane-spin-chase-reverse {
          0% { transform: rotate(360deg); }
          50% { transform: rotate(80deg); }
          100% { transform: rotate(0deg); }
        }
      `}</style>
    </main>
  );
}