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
  vrb_provenance: string;
  qnt_value: number;
  qnt_provenance: string;
  spd_value: number;
  spd_provenance: string;
  level?: number;
  total_xp?: number;
}

interface SessionData {
  benchmarks_completed: number;
}

interface MatchData {
  rank: number;
  score: number;
  friction: string;
  cognitive_score: number;
  behavioral_penalty: number;
  vibe_bonus: number;
  course: {
    id: string;
    university: string;
    course_name: string;
    cah_code: string;
    nss_overall: number | null;
    employment_rate: number | null;
    median_salary_5yr: number | null;
    russell_group?: boolean;
  };
}

interface CapacityResults {
  vrb_items_completed?: number;
  qnt_items_completed?: number;
  spd_items_completed?: number;
}

interface Supercurricular {
  id: string;
  type: string;
  title: string;
  author: string | null;
  external_url: string | null;
}

// ============================================================================
// CONSTANTS
// ============================================================================

const FRICTION_LABELS: Record<string, { label: string; opacity: number }> = {
  LOW: { label: 'Great Fit', opacity: 1 },
  MODERATE: { label: 'Good Fit', opacity: 0.8 },
  HIGH: { label: 'Stretch', opacity: 0.6 },
  VERY_HIGH: { label: 'Challenge', opacity: 0.5 },
  EXTREME: { label: 'Reach', opacity: 0.4 },
};

const CAH_TO_CLUSTER: Record<string, string> = {
  'CAH01': 'MED', 'CAH02': 'MED', 'CAH05': 'MED',
  'CAH03': 'STEM_LIFE', 'CAH04': 'STEM_LIFE', 'CAH06': 'STEM_LIFE',
  'CAH07': 'STEM_PHYS', 'CAH09': 'STEM_PHYS', 'CAH08': 'ENV',
  'CAH10': 'ENG', 'CAH11': 'COMP', 'CAH12': 'LAW',
  'CAH14': 'HUM', 'CAH19': 'HUM', 'CAH20': 'HUM', 'CAH21': 'HUM',
  'CAH15': 'SOC', 'CAH16': 'SOC', 'CAH17': 'BUS', 'CAH18': 'SOC',
  'CAH22': 'EDU', 'CAH23': 'LANG', 'CAH24': 'LANG',
};

// ============================================================================
// CONFIDENCE GRADE
// ============================================================================

function calculateConfidenceGrade(
  session: SessionData | null,
  capacityResults: CapacityResults | null
): { grade: string; percentage: number; message: string } {
  const fullBenchmarks = [
    (capacityResults?.vrb_items_completed || 0) >= 12,
    (capacityResults?.qnt_items_completed || 0) >= 12,
    (capacityResults?.spd_items_completed || 0) >= 12,
  ].filter(Boolean).length;

  const introItems = [
    (capacityResults?.vrb_items_completed || 0) > 0 && (capacityResults?.vrb_items_completed || 0) < 12,
    (capacityResults?.qnt_items_completed || 0) > 0 && (capacityResults?.qnt_items_completed || 0) < 12,
    (capacityResults?.spd_items_completed || 0) > 0 && (capacityResults?.spd_items_completed || 0) < 12,
  ].filter(Boolean).length;

  if (fullBenchmarks >= 2) {
    return { grade: 'A', percentage: 95, message: 'High accuracy results' };
  }
  if (fullBenchmarks === 1) {
    return { grade: 'B', percentage: 75, message: 'Take another benchmark for Grade A' };
  }
  if (introItems > 0 || (session?.benchmarks_completed || 0) > 0) {
    return { grade: 'C', percentage: 50, message: 'Complete benchmarks for better accuracy' };
  }
  return { grade: 'D', percentage: 25, message: 'Take benchmarks to improve accuracy' };
}

// ============================================================================
// GLASS CARD COMPONENT
// ============================================================================

function GlassCard({ 
  children, 
  className = '' 
}: { 
  children: React.ReactNode; 
  className?: string;
}) {
  return (
    <div className={`
      bg-white/[0.03] 
      backdrop-blur-xl 
      border border-white/[0.08]
      rounded-2xl 
      ${className}
    `}>
      {children}
    </div>
  );
}

// ============================================================================
// MAIN PAGE
// ============================================================================

export default function ResultsPage() {
  const params = useParams();
  const router = useRouter();
  const sessionId = params.id as string;

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [profile, setProfile] = useState<ProfileData | null>(null);
  const [session, setSession] = useState<SessionData | null>(null);
  const [matches, setMatches] = useState<MatchData[]>([]);
  const [capacityResults, setCapacityResults] = useState<CapacityResults | null>(null);
  const [supercurriculars, setSupercurriculars] = useState<Supercurricular[]>([]);
  const [expandedCourse, setExpandedCourse] = useState<number | null>(null);
  const [showAllCourses, setShowAllCourses] = useState(false);
  const [pinnedCourses, setPinnedCourses] = useState<string[]>([]);

  useEffect(() => {
    const fetchResults = async () => {
      try {
        const { data: profileData, error: profileError } = await supabase
          .from('bo_v1_profiles')
          .select('*')
          .eq('session_id', sessionId)
          .single();

        if (profileError) throw profileError;
        setProfile(profileData);

        const { data: sessionData } = await supabase
          .from('bo_v1_sessions')
          .select('benchmarks_completed')
          .eq('id', sessionId)
          .single();
        setSession(sessionData);

        const { data: capData } = await supabase
          .from('bo_v1_capacity_results')
          .select('vrb_items_completed, qnt_items_completed, spd_items_completed')
          .eq('session_id', sessionId)
          .single();
        setCapacityResults(capData);

        const { data: matchData, error: matchError } = await supabase
          .from('bo_v1_matches')
          .select(`
            rank, score, friction, cognitive_score, behavioral_penalty, vibe_bonus,
            course:bo_v1_courses(id, university, course_name, cah_code, nss_overall, employment_rate, median_salary_5yr, russell_group)
          `)
          .eq('session_id', sessionId)
          .order('rank', { ascending: true })
          .limit(20);

        if (matchError) throw matchError;
        setMatches(matchData?.map(m => ({ ...m, course: m.course as any })) || []);

        if (matchData && matchData.length > 0) {
          const topClusters = [...new Set(
            matchData.slice(0, 5)
              .map(m => CAH_TO_CLUSTER[(m.course as any)?.cah_code?.substring(0, 5)])
              .filter(Boolean)
          )].slice(0, 3);

          if (topClusters.length > 0) {
            const { data: superData } = await supabase
              .from('bo_v1_supercurriculars')
              .select('id, type, title, author, external_url')
              .in('cluster', topClusters)
              .limit(6);
            if (superData) setSupercurriculars(superData);
          }
        }
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load');
      } finally {
        setLoading(false);
      }
    };
    fetchResults();
  }, [sessionId]);

  const handleTakeBenchmark = () => {
    router.push(`/assessment/capacity/full`);
  };

  const togglePin = (courseId: string) => {
    setPinnedCourses(prev => 
      prev.includes(courseId) 
        ? prev.filter(id => id !== courseId)
        : [...prev, courseId]
    );
  };

  if (loading) {
    return (
      <main className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-6 h-6 border-2 border-[#54acbf]/50 border-t-[#54acbf] rounded-full animate-spin" />
      </main>
    );
  }

  if (error || !profile) {
    return (
      <main className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="text-center text-[#54acbf]/60">
          <p className="mb-4">Results not found</p>
          <a href="/" className="text-[#54acbf] hover:underline">Start again</a>
        </div>
      </main>
    );
  }

  const familiar = getFamiliarById(profile.familiar_id as any);
  const guild = getGuildById(profile.guild_id as any);
  const confidence = calculateConfidenceGrade(session, capacityResults);
  const level = profile.level || Math.floor((profile.total_xp || 0) / 1000) + 1;
  const displayedCourses = showAllCourses ? matches : matches.slice(0, 6);

  const completedBenchmarks = {
    vrb: (capacityResults?.vrb_items_completed || 0) >= 12,
    qnt: (capacityResults?.qnt_items_completed || 0) >= 12,
    spd: (capacityResults?.spd_items_completed || 0) >= 12,
  };
  const benchmarkCount = Object.values(completedBenchmarks).filter(Boolean).length;

  return (
    <main className="min-h-screen bg-[#011c40]">
      {/* Subtle gradient overlay */}
      <div className="fixed inset-0 bg-gradient-to-br from-[#54acbf]/5 via-transparent to-[#54acbf]/5 pointer-events-none" />
      
      {/* Nav */}
      <nav className="relative z-10 flex justify-between items-center px-6 py-4 border-b border-white/[0.06]">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-lg bg-[#54acbf]/20 flex items-center justify-center">
            <span className="text-[#54acbf] text-sm">⬡</span>
          </div>
          <div>
            <span className="text-[#f8f5f0] text-sm font-medium">Level {level}</span>
            <span className="text-[#54acbf]/50 text-sm ml-2">{familiar?.name || 'Scholar'}</span>
          </div>
        </div>
        <div className="flex items-center gap-4">
          <button 
            onClick={() => navigator.clipboard.writeText(window.location.href)}
            className="text-[#54acbf]/50 hover:text-[#54acbf] text-sm transition-colors"
          >
            Share
          </button>
          <a href="/" className="text-[#54acbf]/50 hover:text-[#54acbf] text-sm transition-colors">
            New
          </a>
        </div>
      </nav>

      {/* Main Grid */}
      <div className="relative z-10 grid grid-cols-1 lg:grid-cols-[260px_1fr_260px] gap-5 p-5 max-w-[1500px] mx-auto">
        
        {/* ========== LEFT SIDEBAR ========== */}
        <aside className="space-y-4">
          
          {/* Confidence Grade */}
          <GlassCard className="p-4">
            <div className="flex items-center justify-between mb-3">
              <span className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider">Confidence</span>
              <span className="text-[#54acbf] text-2xl font-light">{confidence.grade}</span>
            </div>
            <div className="h-1.5 bg-white/[0.06] rounded-full overflow-hidden mb-3">
              <div 
                className="h-full bg-[#54acbf] rounded-full transition-all duration-700"
                style={{ width: `${confidence.percentage}%` }}
              />
            </div>
            <p className="text-[#f8f5f0]/40 text-xs mb-3">{confidence.message}</p>
            {confidence.grade !== 'A' && (
              <button
                onClick={handleTakeBenchmark}
                className="w-full py-2 text-[#54acbf] text-sm border border-[#54acbf]/30 rounded-lg hover:bg-[#54acbf]/10 transition-colors"
              >
                Improve Grade
              </button>
            )}
          </GlassCard>

          {/* Profile */}
          <GlassCard className="p-4">
            <div className="flex flex-col items-center text-center">
              <div className="w-16 h-16 rounded-xl bg-[#54acbf]/10 border border-[#54acbf]/20 flex items-center justify-center mb-3">
                <span className="text-3xl">{familiar?.emoji || '🎓'}</span>
              </div>
              <h3 className="text-[#f8f5f0] font-medium">{familiar?.name || 'Scholar'}</h3>
              <p className="text-[#54acbf]/50 text-sm">{familiar?.tagline || 'Knowledge Seeker'}</p>
            </div>
          </GlassCard>

          {/* Quest Log - Simplified */}
          <GlassCard className="p-4">
            <div className="flex items-center justify-between mb-3">
              <span className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider">Benchmarks</span>
              <span className="text-[#54acbf]/60 text-sm">{benchmarkCount}/3</span>
            </div>
            <div className="space-y-2">
              {[
                { id: 'vrb', label: 'Verbal', done: completedBenchmarks.vrb },
                { id: 'qnt', label: 'Quantitative', done: completedBenchmarks.qnt },
                { id: 'spd', label: 'Speed', done: completedBenchmarks.spd },
              ].map((b) => (
                <div 
                  key={b.id}
                  className={`flex items-center justify-between py-2 px-3 rounded-lg ${
                    b.done ? 'bg-[#54acbf]/10' : 'bg-white/[0.02]'
                  }`}
                >
                  <span className={`text-sm ${b.done ? 'text-[#54acbf]' : 'text-[#f8f5f0]/40'}`}>
                    {b.label}
                  </span>
                  {b.done ? (
                    <span className="text-[#54acbf] text-xs">✓</span>
                  ) : (
                    <span className="text-[#f8f5f0]/20 text-xs">—</span>
                  )}
                </div>
              ))}
            </div>
          </GlassCard>
        </aside>

        {/* ========== MAIN CONTENT ========== */}
        <div className="space-y-5">
          
          {/* Archetype */}
          <GlassCard className="p-6">
            <p className="text-[#54acbf]/60 text-xs uppercase tracking-wider mb-2">Your Archetype</p>
            <h1 className="text-3xl text-[#f8f5f0] font-light mb-3">
              The <span className="text-[#54acbf]">{guild?.name?.replace('The ', '') || 'Scholar'}</span>
            </h1>
            <p className="text-[#f8f5f0]/50 leading-relaxed">
              {guild?.motto || 'You synthesise complex information into clear understanding. Your path favours structured environments where analytical thinking thrives.'}
            </p>
          </GlassCard>

          {/* Disposition Bars */}
          <GlassCard className="p-5">
            <p className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider mb-4">Core Dispositions</p>
            <div className="grid grid-cols-2 gap-4">
              {[
                { key: 'calibration', label: 'Calibration' },
                { key: 'tolerance', label: 'Tolerance' },
                { key: 'transfer', label: 'Transfer' },
                { key: 'precision', label: 'Precision' },
                { key: 'retrieval', label: 'Retrieval' },
                { key: 'receptivity', label: 'Receptivity' },
              ].map((d) => (
                <div key={d.key}>
                  <div className="flex justify-between text-xs mb-1">
                    <span className="text-[#f8f5f0]/50">{d.label}</span>
                    <span className="text-[#54acbf]/70">{(profile as any)[d.key]}</span>
                  </div>
                  <div className="h-1.5 bg-white/[0.06] rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-[#54acbf]/70 rounded-full"
                      style={{ width: `${(profile as any)[d.key]}%` }}
                    />
                  </div>
                </div>
              ))}
            </div>
          </GlassCard>

          {/* Course Matches */}
          <div>
            <div className="flex items-center justify-between mb-3 px-1">
              <p className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider">Course Matches</p>
              <span className="text-[#54acbf]/40 text-xs">{matches.length} found</span>
            </div>
            
            <div className="space-y-3">
              {displayedCourses.map((match, idx) => {
                const friction = FRICTION_LABELS[match.friction] || FRICTION_LABELS.MODERATE;
                const isPinned = pinnedCourses.includes(match.course.id);
                const isExpanded = expandedCourse === idx;
                
                return (
                  <GlassCard 
                    key={match.course.id}
                    className={`p-4 cursor-pointer transition-all duration-200 ${
                      isExpanded ? 'ring-1 ring-[#54acbf]/30' : 'hover:bg-white/[0.04]'
                    }`}
                  >
                    <div 
                      className="flex items-start justify-between"
                      onClick={() => setExpandedCourse(isExpanded ? null : idx)}
                    >
                      <div className="flex-1 min-w-0">
                        <h3 className="text-[#f8f5f0] font-medium truncate">{match.course.course_name}</h3>
                        <p className="text-[#54acbf]/50 text-sm">{match.course.university}</p>
                      </div>
                      <div className="flex items-center gap-2 ml-3">
                        <span 
                          className="text-xs px-2 py-1 rounded-full bg-[#54acbf]/10 text-[#54acbf]"
                          style={{ opacity: friction.opacity }}
                        >
                          {friction.label}
                        </span>
                        <button
                          onClick={(e) => { e.stopPropagation(); togglePin(match.course.id); }}
                          className={`text-sm transition-colors ${isPinned ? 'text-[#54acbf]' : 'text-[#f8f5f0]/20 hover:text-[#54acbf]/50'}`}
                        >
                          {isPinned ? '★' : '☆'}
                        </button>
                      </div>
                    </div>

                    {isExpanded && (
                      <div className="mt-4 pt-4 border-t border-white/[0.06] grid grid-cols-3 gap-4 text-sm">
                        <div>
                          <p className="text-[#f8f5f0]/30 text-xs mb-1">Match</p>
                          <p className="text-[#f8f5f0]">{match.score}%</p>
                        </div>
                        {match.course.nss_overall && (
                          <div>
                            <p className="text-[#f8f5f0]/30 text-xs mb-1">Satisfaction</p>
                            <p className="text-[#f8f5f0]">{match.course.nss_overall}%</p>
                          </div>
                        )}
                        {match.course.median_salary_5yr && (
                          <div>
                            <p className="text-[#f8f5f0]/30 text-xs mb-1">Salary (5yr)</p>
                            <p className="text-[#f8f5f0]">£{(match.course.median_salary_5yr / 1000).toFixed(0)}k</p>
                          </div>
                        )}
                      </div>
                    )}
                  </GlassCard>
                );
              })}
            </div>

            {matches.length > 6 && (
              <button
                onClick={() => setShowAllCourses(!showAllCourses)}
                className="mt-4 text-[#54acbf]/60 hover:text-[#54acbf] text-sm transition-colors"
              >
                {showAllCourses ? 'Show less' : `Show ${matches.length - 6} more`}
              </button>
            )}
          </div>

          {/* Supercurriculars */}
          {supercurriculars.length > 0 && (
            <div>
              <p className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider mb-3 px-1">Recommended Activities</p>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {supercurriculars.slice(0, 4).map((item) => (
                  <GlassCard key={item.id} className="p-4 hover:bg-white/[0.04] transition-colors">
                    <a href={item.external_url || '#'} target="_blank" rel="noopener noreferrer">
                      <p className="text-[#54acbf]/50 text-xs uppercase mb-1">{item.type}</p>
                      <h4 className="text-[#f8f5f0] text-sm font-medium">{item.title}</h4>
                      {item.author && <p className="text-[#f8f5f0]/30 text-xs mt-1">{item.author}</p>}
                    </a>
                  </GlassCard>
                ))}
              </div>
            </div>
          )}
        </div>

        {/* ========== RIGHT SIDEBAR ========== */}
        <aside className="space-y-4">
          
          {/* Pinned */}
          <GlassCard className="p-4">
            <p className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider mb-3">Pinned</p>
            {pinnedCourses.length > 0 ? (
              <div className="space-y-2">
                {matches
                  .filter(m => pinnedCourses.includes(m.course.id))
                  .map(m => (
                    <div 
                      key={m.course.id}
                      className="p-2 bg-white/[0.03] rounded-lg"
                    >
                      <p className="text-[#f8f5f0] text-sm truncate">{m.course.course_name}</p>
                      <p className="text-[#54acbf]/40 text-xs truncate">{m.course.university}</p>
                    </div>
                  ))
                }
              </div>
            ) : (
              <p className="text-[#f8f5f0]/20 text-sm text-center py-6">
                Star courses to pin them
              </p>
            )}
          </GlassCard>

          {/* Recent */}
          <GlassCard className="p-4">
            <p className="text-[#f8f5f0]/40 text-xs uppercase tracking-wider mb-3">Top Matches</p>
            <div className="space-y-2">
              {matches.slice(0, 3).map((m, i) => (
                <div 
                  key={m.course.id}
                  className="flex items-center gap-3 p-2 bg-white/[0.02] rounded-lg"
                >
                  <span className="text-[#54acbf]/40 text-xs w-4">{i + 1}</span>
                  <div className="flex-1 min-w-0">
                    <p className="text-[#f8f5f0]/70 text-sm truncate">{m.course.course_name}</p>
                  </div>
                </div>
              ))}
            </div>
          </GlassCard>

        </aside>
      </div>
    </main>
  );
}