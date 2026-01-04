// src/app/assessment/processing/page.tsx
'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { getInitialState, saveState } from '@/lib/assessment';
import { supabase } from '@/lib/supabase';
import { calculateVibeProfile, collectVibeTags } from '@/lib/vibe-cards';
import { scoreScenarios, proxyCapacities, findDominant, findNemesis } from '@/lib/scoring';
import { assignIdentity } from '@/lib/identity';
import { rankCoursesAsync } from '@/lib/matching';
import { Course, Scenario, ScenarioResponse, VibeChoice, Disposition } from '@/lib/types';

const LOADING_MESSAGES = [
  'Analysing your responses...',
  'Building your cognitive profile...',
  'Mapping learning patterns...',
  'Calculating capacities...',
  'Scanning 28,520 UK courses...',
  'Ranking your matches...',
  'Finalising results...',
];

export default function ProcessingPage() {
  const router = useRouter();
  const [messageIndex, setMessageIndex] = useState(0);
  const [error, setError] = useState<string | null>(null);

  // Cycle through loading messages
  useEffect(() => {
    const interval = setInterval(() => {
      setMessageIndex((prev) => (prev + 1) % LOADING_MESSAGES.length);
    }, 2000);
    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    const process = async () => {
      const state = getInitialState();

      if (!state.sessionId) {
        router.push('/');
        return;
      }

      try {
        // Fetch scenarios from database
        const { data: scenariosData, error: scenariosError } = await supabase
          .from('bo_v1_scenarios')
          .select('*')
          .eq('active', true);

        if (scenariosError) throw scenariosError;

        const scenarios: Scenario[] = (scenariosData || []).map(s => ({
          id: s.id,
          dimension: s.dimension as Disposition,
          scenario_context: s.scenario_context,
          option_a: s.option_a,
          option_b: s.option_b,
          a_indicates: s.a_indicates as 'high' | 'low',
          b_indicates: s.b_indicates as 'high' | 'low',
          sort_order: s.sort_order || 0,
          active: s.active ?? true,
        }));

        // Fetch scenario responses from database
        const { data: responsesData, error: responsesError } = await supabase
          .from('bo_v1_scenario_responses')
          .select('scenario_id, position')
          .eq('session_id', state.sessionId);

        if (responsesError) throw responsesError;

        const responses: ScenarioResponse[] = (responsesData || []).map(r => ({
          scenario_id: r.scenario_id,
          position: r.position,
        }));

        // Score scenarios to get unified disposition profile (all 10 dimensions)
        const dispositionProfile = scoreScenarios(responses, scenarios);

        // Get vibe profile and tags from vibe choices (v9 format)
        const vibeChoices = (state.vibeChoices || []) as VibeChoice[];
        const vibeProfile = calculateVibeProfile(vibeChoices);
        const vibeTags = collectVibeTags(vibeChoices);

        // Split into cognitive and behavioral for compatibility with downstream functions
        const cognitive = {
          calibration: dispositionProfile.calibration,
          tolerance: dispositionProfile.tolerance,
          transfer: dispositionProfile.transfer,
          precision: dispositionProfile.precision,
          retrieval: dispositionProfile.retrieval,
          receptivity: dispositionProfile.receptivity,
        };
        const behavioral = {
          structure: dispositionProfile.structure,
          consistency: dispositionProfile.consistency,
          social: dispositionProfile.social,
          depth: dispositionProfile.depth,
        };
        const capacities = proxyCapacities(dispositionProfile);

        const dominant = findDominant(dispositionProfile);
        const nemesis = findNemesis(dispositionProfile);
        const identity = assignIdentity(state.sessionId, cognitive, behavioral, dominant, nemesis);

        const { data: courses, error: coursesError } = await supabase
          .from('bo_v1_courses')
          .select('*')
          .eq('is_active', true)
          .limit(5000);

        if (coursesError) throw coursesError;

        const matches = await rankCoursesAsync(
          cognitive,
          behavioral,
          capacities,
          vibeTags,
          courses as Course[],
          20
        );

        // Round all numeric values to integers (database columns are INTEGER)
        const profileData = {
          session_id: state.sessionId,
          vibe_tags: vibeTags,
          calibration: Math.round(cognitive.calibration.value),
          calibration_sigma: Math.round(cognitive.calibration.sigma),
          tolerance: Math.round(cognitive.tolerance.value),
          tolerance_sigma: Math.round(cognitive.tolerance.sigma),
          transfer: Math.round(cognitive.transfer.value),
          transfer_sigma: Math.round(cognitive.transfer.sigma),
          precision: Math.round(cognitive.precision.value),
          precision_sigma: Math.round(cognitive.precision.sigma),
          retrieval: Math.round(cognitive.retrieval.value),
          retrieval_sigma: Math.round(cognitive.retrieval.sigma),
          receptivity: Math.round(cognitive.receptivity.value),
          receptivity_sigma: Math.round(cognitive.receptivity.sigma),
          structure: Math.round(behavioral.structure.value),
          structure_sigma: Math.round(behavioral.structure.sigma),
          consistency: Math.round(behavioral.consistency.value),
          consistency_sigma: Math.round(behavioral.consistency.sigma),
          social: Math.round(behavioral.social.value),
          social_sigma: Math.round(behavioral.social.sigma),
          depth: Math.round(behavioral.depth.value),
          depth_sigma: Math.round(behavioral.depth.sigma),
          vrb_value: Math.round(capacities.vrb.value),
          vrb_sigma: Math.round(capacities.vrb.sigma),
          vrb_provenance: capacities.vrb.provenance,
          qnt_value: Math.round(capacities.qnt.value),
          qnt_sigma: Math.round(capacities.qnt.sigma),
          qnt_provenance: capacities.qnt.provenance,
          spd_value: Math.round(capacities.spd.value),
          spd_sigma: Math.round(capacities.spd.sigma),
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
          fit_score: m.disposition_score,
          friction: m.friction,
          cognitive_score: m.enjoyment_score,
          behavioral_penalty: 0,
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

        saveState({ ...state, stage: 'complete' });
        router.push(`/results/${state.sessionId}`);

      } catch (err) {
        console.error('Processing error:', err);
        setError(err instanceof Error ? err.message : 'An error occurred');
      }
    };

    process();
  }, [router]);

  if (error) {
    return (
      <div className="min-h-screen bg-[#0a0a0f] flex flex-col items-center justify-center relative overflow-hidden">
        {/* Background Blurs */}
        <div className="fixed inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-red-500/10 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
        </div>

        <div className="relative z-10 text-center px-6">
          <div className="w-20 h-20 mx-auto mb-8 rounded-full border-2 border-red-500/30 flex items-center justify-center bg-red-500/10">
            <svg className="w-10 h-10 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </div>
          <h2 className="text-2xl font-bold text-white mb-3">Something went wrong</h2>
          <p className="text-gray-400 text-sm max-w-md mb-8">{error}</p>
          <button
            onClick={() => router.push('/')}
            className="px-8 py-3 rounded-xl font-semibold bg-[#6366f1] text-white shadow-[0_0_20px_rgba(99,102,241,0.4)] hover:shadow-[0_0_30px_rgba(99,102,241,0.6)] transition-all duration-300"
          >
            Start Over
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#0a0a0f] flex flex-col items-center justify-center relative overflow-hidden">
      {/* Background Blurs */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
        <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
      </div>

      <div className="relative z-10 text-center px-6">
        {/* Spinner */}
        <div className="w-24 h-24 mx-auto mb-8 relative">
          {/* Outer ring */}
          <div className="absolute inset-0 rounded-full border-4 border-[#6366f1]/20"></div>
          <div className="absolute inset-0 rounded-full border-t-4 border-[#6366f1] animate-spin"></div>
          {/* Inner ring */}
          <div className="absolute inset-4 rounded-full border-4 border-[#06b6d4]/20"></div>
          <div
            className="absolute inset-4 rounded-full border-b-4 border-[#06b6d4]"
            style={{ animation: 'spin 1.5s linear infinite reverse' }}
          ></div>
          {/* Center dot */}
          <div className="absolute inset-0 flex items-center justify-center">
            <div className="w-3 h-3 rounded-full bg-white animate-pulse"></div>
          </div>
        </div>

        {/* Loading Message */}
        <h2 className="text-2xl md:text-3xl font-bold text-white mb-3 animate-pulse">
          {LOADING_MESSAGES[messageIndex]}
        </h2>
        <p className="text-gray-500 text-sm">Do not refresh the page.</p>

        {/* Progress dots */}
        <div className="flex justify-center gap-2 mt-8">
          {LOADING_MESSAGES.map((_, i) => (
            <div
              key={i}
              className={`w-2 h-2 rounded-full transition-all duration-300 ${
                i === messageIndex
                  ? 'bg-[#6366f1] scale-125'
                  : i < messageIndex
                    ? 'bg-[#6366f1]/50'
                    : 'bg-gray-700'
              }`}
            />
          ))}
        </div>

        {/* Footer Note */}
        <div className="mt-12 px-6 py-3 bg-[#1a1a24]/50 border border-white/5 rounded-xl inline-block">
          <p className="text-gray-500 text-xs uppercase tracking-widest">
            Matching against 28,520 UK courses
          </p>
        </div>
      </div>
    </div>
  );
}
