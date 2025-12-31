// src/app/page.tsx
'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { saveState, clearState } from '@/lib/assessment';

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
      cognitiveResponses: [],
      behavioralResponses: [],
      startedAt: Date.now(),
    });

    router.push('/assessment/vibe');
  };

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-950 to-slate-900 flex items-center justify-center p-6">
      <div className="max-w-2xl w-full text-center">
        <div className="mb-8">
          <h1 className="text-5xl font-bold bg-gradient-to-r from-purple-400 via-pink-400 to-amber-400 bg-clip-text text-transparent mb-4">
            ExamRizz Arena
          </h1>
          <p className="text-slate-400 text-lg">
            Discover your perfect degree match
          </p>
        </div>

        <div className="grid grid-cols-3 gap-4 mb-12">
          <div className="bg-slate-800/50 rounded-xl p-4 border border-slate-700">
            <div className="text-3xl font-bold text-purple-400">30,960</div>
            <div className="text-sm text-slate-500">UK Courses</div>
          </div>
          <div className="bg-slate-800/50 rounded-xl p-4 border border-slate-700">
            <div className="text-3xl font-bold text-cyan-400">10</div>
            <div className="text-sm text-slate-500">Dispositions</div>
          </div>
          <div className="bg-slate-800/50 rounded-xl p-4 border border-slate-700">
            <div className="text-3xl font-bold text-amber-400">~10</div>
            <div className="text-sm text-slate-500">Minutes</div>
          </div>
        </div>

        <div className="bg-slate-800/30 rounded-2xl p-6 mb-8 border border-slate-700/50">
          <h2 className="text-lg font-semibold text-slate-200 mb-4">How it works</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-left">
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 rounded-full bg-purple-500/20 flex items-center justify-center text-purple-400 font-bold text-sm shrink-0">1</div>
              <div>
                <div className="text-slate-200 font-medium">Vibe Check</div>
                <div className="text-slate-500 text-sm">Swipe through 12 images</div>
              </div>
            </div>
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 rounded-full bg-cyan-500/20 flex items-center justify-center text-cyan-400 font-bold text-sm shrink-0">2</div>
              <div>
                <div className="text-slate-200 font-medium">40 Questions</div>
                <div className="text-slate-500 text-sm">Build your learning profile</div>
              </div>
            </div>
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 rounded-full bg-amber-500/20 flex items-center justify-center text-amber-400 font-bold text-sm shrink-0">3</div>
              <div>
                <div className="text-slate-200 font-medium">Get Matched</div>
                <div className="text-slate-500 text-sm">See your top 20 courses</div>
              </div>
            </div>
          </div>
        </div>

        <button
          onClick={startAssessment}
          disabled={loading}
          className="w-full md:w-auto px-12 py-4 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-500 hover:to-pink-500 text-white font-semibold rounded-xl text-lg transition-all disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-purple-500/25"
        >
          {loading ? (
            <span className="flex items-center justify-center gap-2">
              <svg className="animate-spin h-5 w-5" viewBox="0 0 24 24">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
              </svg>
              Starting...
            </span>
          ) : (
            'Start Assessment'
          )}
        </button>

        <p className="text-slate-600 text-sm mt-4">
          No account required • Results are shareable
        </p>
      </div>
    </main>
  );
}
