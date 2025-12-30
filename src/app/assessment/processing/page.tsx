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

const STEPS = [
  'Analysing your responses...',
  'Building cognitive profile...',
  'Mapping behavioural patterns...',
  'Calculating capacities...',
  'Assigning your familiar...',
  'Matching to courses...',
  'Ranking your top matches...',
  'Finalising results...',
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
      <main className="min-h-screen bg-slate-900 flex items-center justify-center p-6">
        <div className="text-center">
          <div className="text-red-400 text-lg mb-4">Something went wrong</div>
          <p className="text-slate-500 mb-6">{error}</p>
          <button
            onClick={() => router.push('/')}
            className="px-6 py-2 bg-slate-800 text-slate-300 rounded-lg hover:bg-slate-700"
          >
            Start Over
          </button>
        </div>
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-950 to-slate-900 flex items-center justify-center p-6">
      <div className="max-w-md w-full text-center">
        <div className="mb-8">
          <div className="relative w-24 h-24 mx-auto">
            <div className="absolute inset-0 rounded-full border-4 border-slate-800" />
            <div className="absolute inset-0 rounded-full border-4 border-transparent border-t-purple-500 animate-spin" />
            <div className="absolute inset-2 rounded-full border-4 border-transparent border-t-pink-500 animate-spin" style={{ animationDirection: 'reverse', animationDuration: '1.5s' }} />
            <div className="absolute inset-4 rounded-full border-4 border-transparent border-t-cyan-500 animate-spin" style={{ animationDuration: '2s' }} />
          </div>
        </div>

        <h2 className="text-xl text-slate-100 font-medium mb-8">
          {STEPS[currentStep]}
        </h2>

        <div className="space-y-2">
          {STEPS.map((step, i) => (
            <div
              key={i}
              className={`flex items-center gap-3 transition-all duration-300 ${
                i < currentStep ? 'opacity-50' :
                i === currentStep ? 'opacity-100' :
                'opacity-30'
              }`}
            >
              <div className={`w-6 h-6 rounded-full flex items-center justify-center shrink-0 ${
                i < currentStep ? 'bg-green-500/20 text-green-400' :
                i === currentStep ? 'bg-purple-500/20 text-purple-400' :
                'bg-slate-800 text-slate-600'
              }`}>
                {i < currentStep ? (
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                  </svg>
                ) : i === currentStep ? (
                  <div className="w-2 h-2 bg-purple-400 rounded-full animate-pulse" />
                ) : (
                  <span className="text-xs">{i + 1}</span>
                )}
              </div>
              <span className={`text-sm ${
                i === currentStep ? 'text-slate-200' : 'text-slate-500'
              }`}>
                {step}
              </span>
            </div>
          ))}
        </div>

        <div className="mt-12 p-4 bg-slate-800/30 rounded-xl border border-slate-700/50">
          <p className="text-slate-500 text-sm">
            💡 Matching you against courses from UK universities
          </p>
        </div>
      </div>
    </main>
  );
}
