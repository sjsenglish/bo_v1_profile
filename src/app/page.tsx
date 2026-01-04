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
      vibeChoices: [],
      scenarioResponses: [],
      miniSampleResponses: [],
      startedAt: Date.now(),
    });

    router.push('/assessment/vibe');
  };

  return (
    <div className="min-h-screen bg-[#0a0a0f] text-white overflow-hidden relative font-sans">
      {/* Abstract Background Blurs */}
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden z-0">
        <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/20 blur-[120px] rounded-full"></div>
        <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
      </div>

      {/* Navigation */}
      <nav className="relative z-10 flex justify-between items-center p-6 lg:px-12">
        <div className="text-2xl font-bold italic tracking-wider">EXAMRIZZ</div>
        <div className="flex items-center gap-4">
          <span className="text-xs text-gray-500 hidden sm:inline">Russell Group Optimised</span>
        </div>
      </nav>

      {/* Main Content */}
      <main className="relative z-10 flex flex-col items-center justify-center text-center mt-12 lg:mt-20 px-4">
        <div className="animate-fade-in">
          {/* Badge */}
          <div className="inline-block px-3 py-1 mb-6 border border-white/10 rounded-full bg-white/5 text-xs tracking-widest uppercase text-indigo-300">
            Official HESA Data &bull; 28,520 UK Courses
          </div>

          {/* Headline */}
          <h1 className="text-5xl lg:text-7xl font-bold leading-tight mb-6 drop-shadow-2xl">
            Find where you'll{' '}
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#6366f1] to-[#06b6d4]">
              thrive
            </span>
            , not just survive.
          </h1>

          {/* Subheadline */}
          <p className="text-lg text-gray-400 max-w-2xl mx-auto mb-10 leading-relaxed">
            AI-powered university matching based on your cognitive capacity, learning dispositions, and true potential.
          </p>

          {/* CTA Button */}
          <button
            onClick={startAssessment}
            disabled={loading}
            className={`
              text-lg px-12 py-4 rounded-xl font-semibold
              bg-[#6366f1] text-white
              shadow-[0_0_30px_rgba(99,102,241,0.4)]
              hover:shadow-[0_0_50px_rgba(99,102,241,0.6)]
              hover:bg-[#5558e3]
              transition-all duration-300
              disabled:opacity-50 disabled:cursor-not-allowed
            `}
          >
            {loading ? (
              <span className="flex items-center gap-2">
                <svg className="animate-spin h-5 w-5" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                </svg>
                Loading...
              </span>
            ) : (
              'Start Assessment'
            )}
          </button>
        </div>

        {/* Feature Cards */}
        <div className="mt-24 grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl w-full text-left">
          {[
            { step: '01', title: 'Complete Profile', desc: 'Psychometric assessment takes ~6 minutes.' },
            { step: '02', title: 'Unlock Archetype', desc: 'Discover your cognitive strengths & style.' },
            { step: '03', title: 'Get Matched', desc: 'Instantly compare 28,000+ UK courses.' },
          ].map((item, i) => (
            <div
              key={i}
              className="bg-[#1a1a24]/50 border border-white/5 p-6 rounded-xl hover:bg-[#1a1a24]/80 transition-colors"
              style={{ animationDelay: `${0.2 + i * 0.1}s` }}
            >
              <div className="text-[#06b6d4] font-bold text-xl mb-2">{item.step}</div>
              <h3 className="text-xl font-bold text-white mb-2">{item.title}</h3>
              <p className="text-gray-400 text-sm">{item.desc}</p>
            </div>
          ))}
        </div>

        {/* Footer Note */}
        <div className="mt-16 mb-8 text-center">
          <p className="text-gray-600 text-xs">
            Powered by official HESA data &bull; No account required
          </p>
        </div>
      </main>
    </div>
  );
}
