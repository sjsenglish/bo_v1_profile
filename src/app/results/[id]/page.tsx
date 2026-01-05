// src/app/results/[id]/page.tsx
'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { getFamiliarById, getGuildById } from '@/lib/identity';

// ============================================================================
// INTERFACES
// ============================================================================

interface ProfileData {
  calibration: number;
  tolerance: number;
  transfer: number;
  precision: number;
  retrieval: number;
  receptivity: number;
  structure: number;
  consistency: number;
  social: number;
  depth: number;
  familiar_id: string;
  guild_id: string;
  dominant: string;
  nemesis: string;
  vrb_value: number;
  qnt_value: number;
  spd_value: number;
}

interface MatchData {
  course_id: string;
  score: number;
  fit_score: number;
  friction: string;
  rank: number;
  bo_v1_courses: {
    id: string;
    course_name: string;
    university: string;
    russell_group: boolean;
    employment_rate: number;
    median_salary_3yr: number;
    subject_area: string;
    ucas_points: number;
  };
}

// ============================================================================
// COMPONENTS
// ============================================================================

function ProfileCard({ profile }: { profile: ProfileData }) {
  const familiar = getFamiliarById(profile.familiar_id as any);
  const guild = getGuildById(profile.guild_id as any);

  // Calculate precision score (average of top dispositions)
  const dispositions = [
    profile.calibration, profile.tolerance, profile.transfer,
    profile.precision, profile.retrieval, profile.receptivity,
    profile.structure, profile.consistency, profile.social, profile.depth
  ];
  const avgScore = Math.round(dispositions.reduce((a, b) => a + b, 0) / dispositions.length);

  // Radar data for constellation
  const radarNodes = [
    { label: 'Analytical', value: profile.calibration, color: '#22d3ee' },
    { label: 'Creative', value: profile.transfer, color: '#a855f7' },
    { label: 'Detail', value: profile.precision, color: '#4ade80' },
    { label: 'Social', value: profile.social, color: '#fbbf24' },
    { label: 'Depth', value: profile.depth, color: '#f472b6' },
    { label: 'Structure', value: profile.structure, color: '#94a3b8' },
  ];

  const topTraits = [...radarNodes].sort((a, b) => b.value - a.value).slice(0, 2);

  return (
    <div className="w-full bg-[#0B0F19] rounded-xl border border-white/10 overflow-hidden">
      <div className="grid grid-cols-1 lg:grid-cols-3 min-h-[280px] divide-y lg:divide-y-0 lg:divide-x divide-white/5">

        {/* LEFT: Identity & Precision */}
        <div className="p-6 flex flex-col justify-between bg-gradient-to-b from-white/[0.02] to-transparent relative overflow-hidden">
          <div className="absolute top-0 right-0 p-4 opacity-10">
            <svg className="w-24 h-24" fill="currentColor" viewBox="0 0 24 24">
              <path d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>

          <div className="relative z-10">
            <div className="flex items-center justify-between mb-3">
              <span className="px-2 py-0.5 text-[10px] font-bold uppercase tracking-wider rounded border bg-indigo-900/50 border-indigo-500 text-indigo-300">
                {guild?.name || 'Foundation'}
              </span>
            </div>
            <h2 className="text-3xl font-bold text-white tracking-wide">Your Profile</h2>
            <p className="text-xs text-gray-500 mt-1">Assessment Complete</p>
          </div>

          <div className="relative z-10 mt-6">
            <span className="text-indigo-400 text-[10px] font-bold uppercase tracking-widest block mb-1 flex items-center">
              <svg className="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 24 24"><path d="M13 10V3L4 14h7v7l9-11h-7z" /></svg>
              Overall Score
            </span>
            <div className="flex items-baseline space-x-1">
              <span className="text-6xl font-bold text-white tracking-tighter">{avgScore}</span>
              <span className="text-2xl text-gray-600">%</span>
            </div>

            <div className="w-full bg-gray-800/50 h-1.5 mt-4 rounded-full overflow-hidden">
              <div
                className="h-full bg-gradient-to-r from-indigo-500 to-cyan-400 relative"
                style={{ width: `${avgScore}%` }}
              >
                <div className="absolute right-0 top-0 bottom-0 w-[2px] bg-white shadow-[0_0_10px_white]"></div>
              </div>
            </div>
          </div>
        </div>

        {/* CENTER: Spirit Familiar */}
        <div className="relative flex flex-col items-center justify-center overflow-hidden bg-[#0D111C] p-6">
          <div className="absolute top-0 right-0 w-32 h-32 bg-[#6366f1]/10 blur-[50px] rounded-full"></div>
          <div className="absolute bottom-0 left-0 w-full h-1/2 bg-gradient-to-t from-black/50 to-transparent z-0"></div>

          <div className="relative z-10 flex flex-col items-center w-full">
            <div className="w-full flex justify-between items-start mb-4">
              <div className="flex flex-col">
                <span className="text-[10px] text-gray-500 font-bold uppercase tracking-[0.2em]">Guild</span>
                <span className="text-xs font-bold text-indigo-400 uppercase tracking-wider">{guild?.name || '?'}</span>
              </div>
              <div className="w-6 h-6 border border-white/20 rounded-sm flex items-center justify-center bg-white/5">
                <svg className="w-4 h-4 text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                </svg>
              </div>
            </div>

            {/* Familiar Icon */}
            <div className="relative w-24 h-24 my-4">
              <svg viewBox="0 0 100 100" className="w-full h-full filter drop-shadow-[0_0_15px_rgba(99,102,241,0.4)]">
                <defs>
                  <linearGradient id="famGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" stopColor="#fff" />
                    <stop offset="100%" stopColor="#6366F1" />
                  </linearGradient>
                </defs>
                <path d="M50,20 L85,50 L50,80 L15,50 Z" fill="none" stroke="url(#famGrad)" strokeWidth="2" />
                <path d="M50,30 L70,50 L50,70 L30,50 Z" fill="#6366F1" opacity="0.3" />
                <circle cx="50" cy="50" r="12" fill="#fff" />
                <circle cx="50" cy="50" r="5" fill="#0B0F19" />
              </svg>
            </div>

            <div className="text-center w-full">
              <div className="uppercase tracking-[0.3em] text-[9px] text-gray-500 mb-1 font-bold">Familiar</div>
              <h3 className="text-xl font-black uppercase tracking-wide text-white">
                {familiar?.name || 'THE OBSERVER'}
              </h3>
              <div className="h-1 w-20 mx-auto mt-2 bg-[#6366f1]"></div>
            </div>
          </div>
        </div>

        {/* RIGHT: Disposition Radar */}
        <div className="flex flex-col bg-[#0A0C12] min-h-[280px] relative overflow-hidden">
          <div className="px-5 py-3 border-b border-white/5 flex items-center justify-between bg-white/[0.02]">
            <div className="flex items-center space-x-2 text-indigo-400">
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
              </svg>
              <span className="text-[10px] font-bold uppercase tracking-widest">Disposition Profile</span>
            </div>
          </div>

          <div className="flex-1 p-4">
            <div className="grid grid-cols-2 gap-3">
              {radarNodes.map((node) => (
                <div key={node.label} className="bg-white/[0.02] rounded-lg p-3 border border-white/5">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-[10px] text-gray-400 uppercase tracking-wider">{node.label}</span>
                    <span className="text-sm font-bold text-white">{node.value}</span>
                  </div>
                  <div className="w-full h-1 bg-gray-800 rounded-full overflow-hidden">
                    <div
                      className="h-full rounded-full"
                      style={{ width: `${node.value}%`, backgroundColor: node.color }}
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="w-full px-4 py-2 border-t border-white/5 bg-white/[0.02]">
            <div className="flex justify-between items-center text-[10px] text-gray-500">
              <span className="uppercase tracking-wider font-bold">Primary</span>
              <span className="text-white font-mono">{topTraits[0]?.label} & {topTraits[1]?.label}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

function ClusterCard({ title, score, icon, color }: { title: string; score: number; icon: string; color: string }) {
  return (
    <div className="bg-[#1a1a24] rounded-xl p-5 border border-white/5 relative overflow-hidden group hover:border-white/10 transition-all">
      <div className="absolute top-2 right-2 text-2xl opacity-20 group-hover:opacity-40 transition-opacity">
        {icon}
      </div>
      <div className="text-gray-400 text-xs font-bold uppercase tracking-widest mb-2">{title}</div>
      <div className="flex items-end space-x-2">
        <span className="text-3xl font-bold text-white">{score}%</span>
        <span className="text-sm text-gray-500 mb-1">Affinity</span>
      </div>
      <div className="w-full bg-gray-800 h-1.5 mt-4 rounded-full overflow-hidden">
        <div className="h-full rounded-full" style={{ width: `${score}%`, backgroundColor: color }}></div>
      </div>
    </div>
  );
}

function CourseCard({ match, rank }: { match: MatchData; rank: number }) {
  const course = match.bo_v1_courses;
  if (!course) return null;

  const scoreColor = match.score > 85 ? 'text-green-400' : match.score > 70 ? 'text-cyan-400' : 'text-indigo-400';

  return (
    <div className="bg-[#1a1a24] rounded-xl border border-white/5 p-5 hover:border-[#6366f1]/50 hover:-translate-y-1 transition-all duration-300 group cursor-pointer">
      <div className="flex justify-between items-start mb-3">
        <div className="flex items-center gap-2">
          <span className="text-gray-600 text-sm font-mono">#{rank}</span>
          {course.russell_group && (
            <span className="bg-amber-500/10 text-amber-500 text-[10px] font-bold px-2 py-0.5 rounded uppercase tracking-wider border border-amber-500/20">
              Russell Group
            </span>
          )}
        </div>
        <div className={`font-bold text-lg ${scoreColor}`}>{match.score}% Match</div>
      </div>

      <h3 className="text-white font-bold text-lg mb-1 group-hover:text-[#6366f1] transition-colors">
        {course.course_name}
      </h3>
      <p className="text-gray-400 text-sm mb-4">{course.university}</p>

      {course.subject_area && (
        <div className="flex flex-wrap gap-2 mb-4">
          <span className="text-xs text-gray-500 bg-black/20 px-2 py-0.5 rounded border border-white/5">
            {course.subject_area}
          </span>
        </div>
      )}

      <div className="flex justify-between items-center text-xs text-gray-500 border-t border-white/5 pt-3">
        <span>Employment: {course.employment_rate || 'N/A'}%</span>
        <span className="flex items-center text-[#6366f1] group-hover:translate-x-1 transition-transform">
          View
          <svg className="w-3 h-3 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
          </svg>
        </span>
      </div>
    </div>
  );
}

// ============================================================================
// MAIN PAGE
// ============================================================================

export default function ResultsPage() {
  const params = useParams();
  const router = useRouter();
  const sessionId = params?.id as string;

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [profile, setProfile] = useState<ProfileData | null>(null);
  const [matches, setMatches] = useState<MatchData[]>([]);

  useEffect(() => {
    const fetchResults = async () => {
      if (!sessionId) return;

      try {
        // Fetch profile
        const { data: profileData, error: profileError } = await supabase
          .from('bo_v1_profiles')
          .select('*')
          .eq('session_id', sessionId)
          .single();

        if (profileError) throw profileError;
        setProfile(profileData);

        // Fetch matches with course details
        const { data: matchData, error: matchError } = await supabase
          .from('bo_v1_matches')
          .select(`
            course_id,
            score,
            fit_score,
            friction,
            rank,
            bo_v1_courses (
              id,
              course_name,
              university,
              russell_group,
              employment_rate,
              median_salary_3yr,
              subject_area,
              ucas_points
            )
          `)
          .eq('session_id', sessionId)
          .order('score', { ascending: false })
          .limit(20);

        if (matchError) throw matchError;
        setMatches(matchData || []);

      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load');
      } finally {
        setLoading(false);
      }
    };

    fetchResults();
  }, [sessionId]);

  // Loading state
  if (loading) {
    return (
      <main className="min-h-screen bg-[#0a0a0f] flex items-center justify-center">
        <div className="fixed inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#06b6d4]/10 blur-[100px] rounded-full"></div>
        </div>
        <div className="relative z-10 text-center">
          <div className="w-8 h-8 border-2 border-[#6366f1]/30 border-t-[#6366f1] rounded-full animate-spin mx-auto mb-4" />
          <p className="text-gray-400 text-sm">Loading your results...</p>
        </div>
      </main>
    );
  }

  // Error state
  if (error || !profile) {
    return (
      <main className="min-h-screen bg-[#0a0a0f] flex items-center justify-center">
        <div className="fixed inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-[#6366f1]/10 blur-[120px] rounded-full"></div>
        </div>
        <div className="relative z-10 p-8 bg-[#1a1a24] border border-white/10 rounded-2xl text-center max-w-sm">
          <p className="text-gray-400 mb-4">Results not found</p>
          <a
            href="/"
            className="inline-block px-6 py-2 bg-[#6366f1] text-white rounded-lg font-medium hover:bg-[#6366f1]/90 transition-colors"
          >
            Start again
          </a>
        </div>
      </main>
    );
  }

  // Calculate cluster scores from dispositions
  const clusterScores = {
    stem: Math.round((profile.precision + profile.calibration + profile.structure) / 3),
    humanities: Math.round((profile.depth + profile.transfer + profile.receptivity) / 3),
    analytical: Math.round((profile.calibration + profile.precision + profile.tolerance) / 3),
  };

  const displayedCourses = matches.slice(0, 6);

  return (
    <main className="min-h-screen bg-[#0a0a0f]">
      {/* Background effects */}
      <div className="fixed inset-0 pointer-events-none">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-[#6366f1]/5 rounded-full blur-[100px]" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-[#06b6d4]/5 rounded-full blur-[100px]" />
      </div>

      {/* Header */}
      <header className="relative z-10 h-16 border-b border-white/5 flex items-center justify-between px-6 lg:px-12 bg-[#1a1a24]/50 backdrop-blur-md sticky top-0">
        <div className="flex items-center space-x-2 cursor-pointer" onClick={() => router.push('/')}>
          <div className="w-8 h-8 bg-[#6366f1] rounded-md flex items-center justify-center font-bold italic transform -skew-x-12">
            E
          </div>
          <span className="font-bold text-xl tracking-wide text-white">EXAMRIZZ</span>
        </div>
        <nav className="hidden md:flex space-x-8 text-sm font-medium text-gray-400">
          <button className="text-white border-b-2 border-[#6366f1] h-16 flex items-center">Dashboard</button>
          <button className="hover:text-white transition-colors h-16 flex items-center">Matches</button>
        </nav>
        <div className="flex items-center space-x-4">
          <button
            onClick={() => navigator.clipboard.writeText(window.location.href)}
            className="text-gray-400 hover:text-white text-sm transition-colors"
          >
            Share
          </button>
        </div>
      </header>

      <div className="relative z-10 max-w-7xl mx-auto px-4 md:px-6 lg:px-8 pt-8 pb-20 space-y-8">

        {/* Profile Banner */}
        <section>
          <ProfileCard profile={profile} />
        </section>

        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">

          {/* Left Column: Stats & Indicators */}
          <div className="lg:col-span-4 space-y-8">

            {/* Sharpen Profile CTA */}
            <div className="space-y-3">
              <div className="flex items-center justify-between px-1">
                <h3 className="text-xs font-bold text-gray-500 uppercase tracking-widest flex items-center">
                  <svg className="w-3 h-3 text-[#6366f1] mr-2" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M13 10V3L4 14h7v7l9-11h-7z" />
                  </svg>
                  Sharpen Profile
                </h3>
              </div>

              <div className="bg-[#1a1a24] border border-white/5 rounded-xl p-4">
                <p className="text-gray-400 text-sm mb-4">Complete additional activities to improve your profile accuracy.</p>
                <button className="w-full py-2.5 bg-[#6366f1]/10 border border-[#6366f1]/30 text-[#6366f1] rounded-lg text-sm font-medium hover:bg-[#6366f1]/20 transition-colors">
                  Take Capacity Benchmarks
                </button>
              </div>
            </div>

            {/* Early Indicators */}
            <div className="space-y-4">
              <h3 className="text-lg font-bold flex items-center text-gray-200">
                <svg className="w-5 h-5 mr-2 text-[#6366f1]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                </svg>
                Early Indicators
              </h3>
              <div className="grid grid-cols-1 gap-4">
                <ClusterCard
                  title="STEM Analysis"
                  score={clusterScores.stem}
                  icon="🔬"
                  color="#22d3ee"
                />
                <ClusterCard
                  title="Humanities"
                  score={clusterScores.humanities}
                  icon="📚"
                  color="#a855f7"
                />
                <ClusterCard
                  title="Analytical"
                  score={clusterScores.analytical}
                  icon="🧠"
                  color="#f472b6"
                />
              </div>
            </div>
          </div>

          {/* Right Column: Course Matches */}
          <div className="lg:col-span-8 space-y-10">
            <section>
              <div className="flex justify-between items-center mb-6">
                <div>
                  <h2 className="text-2xl font-bold text-white">Top Course Matches</h2>
                  <p className="text-gray-400 text-sm">Based on your cognitive profile and learning style.</p>
                </div>
                <div className="flex items-center gap-3">
                  <a
                    href="https://examrizz.com"
                    className="px-6 py-2 bg-[#6366f1] text-white text-sm font-medium rounded-full hover:bg-[#5558e3] transition-colors"
                  >
                    Return to Home
                  </a>
                  <button className="text-[#6366f1] text-sm font-medium flex items-center hover:underline">
                    See All
                    <svg className="w-4 h-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                    </svg>
                  </button>
                </div>
              </div>

              {matches.length > 0 ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                  {displayedCourses.map((match, index) => (
                    <CourseCard key={match.course_id} match={match} rank={index + 1} />
                  ))}
                </div>
              ) : (
                <div className="bg-[#1a1a24] border border-white/5 rounded-xl p-8 text-center">
                  <p className="text-gray-400">No course matches found. Complete more of the assessment for personalized recommendations.</p>
                </div>
              )}
            </section>
          </div>
        </div>
      </div>
    </main>
  );
}
