// src/app/results/[id]/page.tsx
'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { getFamiliarById, getGuildById } from '@/lib/identity';
import { COGNITIVE_DIMENSIONS, BEHAVIORAL_DIMENSIONS } from '@/lib/types';

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
  vibe_tags: string[];
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
    subject_area: string;
    cah_code: string;
    nss_overall: number | null;
    employment_rate: number | null;
    median_salary_5yr: number | null;
  };
}

interface Supercurricular {
  id: string;
  type: string;
  format: string | null;
  title: string;
  subtitle: string | null;
  description: string | null;
  author: string | null;
  time_estimate: string | null;
  difficulty_composite: number | null;
  difficulty_label: string | null;
  is_free: boolean;
  price_gbp: number | null;
  external_url: string | null;
  primary_cluster: string;
  credibility_score: number | null;
  // From quiz_mappings join
  disposition_boosts?: Record<string, number>;
  relevance_reason?: string;
}

// ============================================================================
// CONSTANTS
// ============================================================================

const FRICTION_COLORS: Record<string, string> = {
  LOW: 'text-green-400 bg-green-500/20 border-green-500/30',
  MODERATE: 'text-yellow-400 bg-yellow-500/20 border-yellow-500/30',
  HIGH: 'text-orange-400 bg-orange-500/20 border-orange-500/30',
  VERY_HIGH: 'text-red-400 bg-red-500/20 border-red-500/30',
  EXTREME: 'text-red-600 bg-red-600/20 border-red-600/30',
};

const FAMILIAR_EMOJIS: Record<string, string> = {
  OWL: '🦉', FOX: '🦊', WOLF: '🐺', PANDA: '🐼', RAVEN: '🐦‍⬛',
  OCTOPUS: '🐙', BEAR: '🐻', TORTOISE: '🐢', CHEETAH: '🐆', CROW: '🐦',
  PHOENIX: '🔥', DRAGON: '🐉', KITSUNE: '🦊', SPHINX: '🦁',
};

const TYPE_CONFIG: Record<string, { icon: string; color: string; label: string }> = {
  BOOK: { icon: '📚', color: 'bg-blue-500/20 text-blue-400 border-blue-500/30', label: 'Book' },
  COURSE: { icon: '🎓', color: 'bg-purple-500/20 text-purple-400 border-purple-500/30', label: 'Course' },
  VIDEO: { icon: '🎬', color: 'bg-red-500/20 text-red-400 border-red-500/30', label: 'Video' },
  PODCAST: { icon: '🎙️', color: 'bg-green-500/20 text-green-400 border-green-500/30', label: 'Podcast' },
  COMPETITION: { icon: '🏆', color: 'bg-amber-500/20 text-amber-400 border-amber-500/30', label: 'Competition' },
  ADMISSION_TEST: { icon: '📝', color: 'bg-rose-500/20 text-rose-400 border-rose-500/30', label: 'Admission Test' },
  VOLUNTEERING: { icon: '🤝', color: 'bg-teal-500/20 text-teal-400 border-teal-500/30', label: 'Volunteering' },
  WORK_EXPERIENCE: { icon: '💼', color: 'bg-indigo-500/20 text-indigo-400 border-indigo-500/30', label: 'Work Experience' },
  ARTICLE: { icon: '📄', color: 'bg-slate-500/20 text-slate-400 border-slate-500/30', label: 'Article' },
  EPQ_IDEA: { icon: '💡', color: 'bg-yellow-500/20 text-yellow-400 border-yellow-500/30', label: 'EPQ Idea' },
  SOCIETY: { icon: '👥', color: 'bg-cyan-500/20 text-cyan-400 border-cyan-500/30', label: 'Society' },
  CERTIFICATION: { icon: '🏅', color: 'bg-orange-500/20 text-orange-400 border-orange-500/30', label: 'Certification' },
};

const CLUSTER_LABELS: Record<string, string> = {
  MED: 'Medicine & Healthcare',
  SOC: 'Social Sciences',
  LAW: 'Law',
  STEM_PHYS: 'Physical Sciences',
  ENG: 'Engineering',
  COMP: 'Computing',
  HUM: 'Humanities',
  BUS: 'Business',
  STEM_LIFE: 'Life Sciences',
  LANG: 'Languages',
  ENV: 'Environment',
  EDU: 'Education',
  CREATIVE: 'Creative Arts',
};

// Map CAH codes to clusters
const CAH_TO_CLUSTER: Record<string, string> = {
  'CAH01': 'MED', 'CAH02': 'MED', 'CAH05': 'MED',
  'CAH03': 'STEM_LIFE', 'CAH06': 'STEM_LIFE',
  'CAH04': 'SOC', 'CAH15': 'SOC', 'CAH20': 'SOC',
  'CAH07': 'STEM_PHYS', 'CAH09': 'STEM_PHYS',
  'CAH10': 'ENG',
  'CAH11': 'COMP',
  'CAH12': 'ENV', 'CAH13': 'ENV',
  'CAH14': 'HUM', 'CAH18': 'HUM', 'CAH21': 'HUM',
  'CAH16': 'LAW',
  'CAH17': 'BUS',
  'CAH19': 'LANG',
  'CAH22': 'EDU',
};

// ============================================================================
// COMPONENT
// ============================================================================

export default function ResultsPage() {
  const params = useParams();
  const sessionId = params.id as string;
  
  const [profile, setProfile] = useState<ProfileData | null>(null);
  const [matches, setMatches] = useState<MatchData[]>([]);
  const [supercurriculars, setSupercurriculars] = useState<Supercurricular[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [expandedMatch, setExpandedMatch] = useState<number | null>(null);
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    const fetchResults = async () => {
      try {
        // Fetch profile
        const { data: profileData, error: profileError } = await supabase
          .from('bo_v1_profiles')
          .select('*')
          .eq('session_id', sessionId)
          .single();

        if (profileError) throw profileError;
        setProfile(profileData);

        // Fetch matches with course data
        const { data: matchData, error: matchError } = await supabase
          .from('bo_v1_matches')
          .select(`
            rank,
            score,
            friction,
            cognitive_score,
            behavioral_penalty,
            vibe_bonus,
            course:bo_v1_courses (
              id,
              university,
              course_name,
              subject_area,
              cah_code,
              nss_overall,
              employment_rate,
              median_salary_5yr
            )
          `)
          .eq('session_id', sessionId)
          .order('rank', { ascending: true });

        if (matchError) throw matchError;
        setMatches(matchData as any);

        // Extract unique clusters from top 10 matches
        const topCahCodes = (matchData as any[])
          .slice(0, 10)
          .map(m => m.course?.cah_code)
          .filter(Boolean);
        
        const clusters = [...new Set(
          topCahCodes.map(cah => {
            // Get CAH level 1 (e.g., CAH01-01-01 -> CAH01)
            const level1 = cah?.split('-')[0];
            return CAH_TO_CLUSTER[level1] || null;
          }).filter(Boolean)
        )];

        // Fetch recommended supercurriculars
        if (clusters.length > 0) {
          const { data: supData, error: supError } = await supabase
            .from('bo_v1_supercurriculars')
            .select(`
              id,
              type,
              format,
              title,
              subtitle,
              description,
              author,
              time_estimate,
              difficulty_composite,
              difficulty_label,
              is_free,
              price_gbp,
              external_url,
              primary_cluster,
              credibility_score,
              bo_v1_supercurricular_quiz_mappings!inner (
                disposition_boosts,
                display_priority,
                featured_in_quiz,
                custom_description
              )
            `)
            .in('primary_cluster', clusters)
            .eq('is_active', true)
            .eq('bo_v1_supercurricular_quiz_mappings.quiz_system', 'examrizz_arena')
            .eq('bo_v1_supercurricular_quiz_mappings.is_active', true)
            .order('credibility_score', { ascending: false })
            .limit(20);

          if (!supError && supData) {
            // Process and rank supercurriculars
            const nemesis = profileData.nemesis?.toUpperCase();
            
            const ranked = supData
              .map((s: any) => {
                const mapping = s.bo_v1_supercurricular_quiz_mappings?.[0];
                const boosts = mapping?.disposition_boosts || {};
                
                // Score: boost items that help nemesis disposition
                let relevanceScore = s.credibility_score || 50;
                if (nemesis && boosts[nemesis]) {
                  relevanceScore += boosts[nemesis] * 10;
                }
                
                return {
                  ...s,
                  disposition_boosts: boosts,
                  relevanceScore,
                  display_priority: mapping?.display_priority || 100,
                };
              })
              .sort((a, b) => {
                // Featured first, then by relevance score
                const aFeatured = a.bo_v1_supercurricular_quiz_mappings?.[0]?.featured_in_quiz ? 1 : 0;
                const bFeatured = b.bo_v1_supercurricular_quiz_mappings?.[0]?.featured_in_quiz ? 1 : 0;
                if (bFeatured !== aFeatured) return bFeatured - aFeatured;
                return b.relevanceScore - a.relevanceScore;
              })
              .slice(0, 8);

            setSupercurriculars(ranked);
          }
        }

      } catch (err) {
        console.error('Error fetching results:', err);
        setError(err instanceof Error ? err.message : 'Failed to load results');
      } finally {
        setLoading(false);
      }
    };

    fetchResults();
  }, [sessionId]);

  const copyShareLink = () => {
    navigator.clipboard.writeText(window.location.href);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  if (loading) {
    return (
      <main className="min-h-screen bg-slate-900 flex items-center justify-center">
        <div className="animate-spin h-8 w-8 border-2 border-purple-500 border-t-transparent rounded-full" />
      </main>
    );
  }

  if (error || !profile) {
    return (
      <main className="min-h-screen bg-slate-900 flex items-center justify-center p-6">
        <div className="text-center">
          <div className="text-red-400 text-lg mb-4">Results not found</div>
          <p className="text-slate-500 mb-6">{error || 'This assessment may have expired'}</p>
          <a
            href="/"
            className="px-6 py-2 bg-slate-800 text-slate-300 rounded-lg hover:bg-slate-700 inline-block"
          >
            Start New Assessment
          </a>
        </div>
      </main>
    );
  }

  const familiar = getFamiliarById(profile.familiar_id);
  const guild = getGuildById(profile.guild_id as any);

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-950 to-slate-900">
      {/* Header */}
      <header className="p-4 flex items-center justify-between border-b border-slate-800">
        <a href="/" className="text-slate-400 hover:text-slate-200 transition-colors">
          ← New Assessment
        </a>
        <button
          onClick={copyShareLink}
          className="flex items-center gap-2 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg transition-colors"
        >
          {copied ? (
            <>
              <svg className="w-4 h-4 text-green-400" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
              </svg>
              Copied!
            </>
          ) : (
            <>
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
              </svg>
              Share
            </>
          )}
        </button>
      </header>

      <div className="max-w-4xl mx-auto p-6">
        {/* Identity Card */}
        <section className="mb-8">
          <div className="bg-slate-800/50 rounded-2xl p-6 border border-slate-700/50">
            <div className="flex flex-col md:flex-row items-center gap-6">
              {/* Familiar */}
              <div className="text-center">
                <div className="text-6xl mb-2">
                  {FAMILIAR_EMOJIS[profile.familiar_id] || '🎭'}
                </div>
                <div className="text-slate-200 font-semibold">{familiar?.name || profile.familiar_id}</div>
                <div className="text-slate-500 text-sm">{familiar?.tagline}</div>
              </div>

              {/* Divider */}
              <div className="hidden md:block w-px h-24 bg-slate-700" />

              {/* Stats */}
              <div className="flex-1 grid grid-cols-2 gap-4">
                <div>
                  <div className="text-slate-500 text-sm">Guild</div>
                  <div className="text-lg font-medium" style={{ color: guild?.color_primary }}>
                    {guild?.name || profile.guild_id}
                  </div>
                  <div className="text-slate-600 text-xs">{guild?.motto}</div>
                </div>
                <div>
                  <div className="text-slate-500 text-sm">Dominant</div>
                  <div className="text-lg font-medium text-green-400 capitalize">{profile.dominant}</div>
                  <div className="text-slate-600 text-xs">Your superpower</div>
                </div>
                <div>
                  <div className="text-slate-500 text-sm">Nemesis</div>
                  <div className="text-lg font-medium text-amber-400 capitalize">{profile.nemesis}</div>
                  <div className="text-slate-600 text-xs">Growth area</div>
                </div>
                <div>
                  <div className="text-slate-500 text-sm">Top Match</div>
                  <div className="text-lg font-medium text-purple-400">{matches[0]?.score || '-'}%</div>
                  <div className="text-slate-600 text-xs">Best fit score</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Disposition Profile */}
        <section className="mb-8">
          <h2 className="text-lg font-semibold text-slate-200 mb-4">Your Disposition Profile</h2>
          <div className="bg-slate-800/50 rounded-2xl p-6 border border-slate-700/50">
            {/* Cognitive */}
            <div className="mb-6">
              <div className="text-cyan-400 text-sm font-medium mb-3">Cognitive Dispositions</div>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                {COGNITIVE_DIMENSIONS.map(dim => (
                  <div key={dim} className="bg-slate-900/50 rounded-xl p-3">
                    <div className="flex justify-between items-center mb-2">
                      <span className="text-slate-400 text-sm capitalize">{dim}</span>
                      <span className="text-cyan-400 font-semibold">{profile[dim as keyof ProfileData]}</span>
                    </div>
                    <div className="h-2 bg-slate-700 rounded-full overflow-hidden">
                      <div 
                        className="h-full bg-gradient-to-r from-cyan-500 to-blue-500 rounded-full transition-all"
                        style={{ width: `${profile[dim as keyof ProfileData]}%` }}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Behavioral */}
            <div>
              <div className="text-pink-400 text-sm font-medium mb-3">Behavioral Dispositions</div>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {BEHAVIORAL_DIMENSIONS.map(dim => (
                  <div key={dim} className="bg-slate-900/50 rounded-xl p-3">
                    <div className="flex justify-between items-center mb-2">
                      <span className="text-slate-400 text-sm capitalize">{dim}</span>
                      <span className="text-pink-400 font-semibold">{profile[dim as keyof ProfileData]}</span>
                    </div>
                    <div className="h-2 bg-slate-700 rounded-full overflow-hidden">
                      <div 
                        className="h-full bg-gradient-to-r from-pink-500 to-rose-500 rounded-full transition-all"
                        style={{ width: `${profile[dim as keyof ProfileData]}%` }}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Course Matches */}
        <section className="mb-8">
          <h2 className="text-lg font-semibold text-slate-200 mb-4">Your Top 20 Course Matches</h2>
          <div className="space-y-3">
            {matches.map((match, index) => (
              <div
                key={match.course.id}
                className="bg-slate-800/50 rounded-xl border border-slate-700/50 overflow-hidden"
              >
                <button
                  onClick={() => setExpandedMatch(expandedMatch === index ? null : index)}
                  className="w-full p-4 flex items-center gap-4 text-left hover:bg-slate-800/70 transition-colors"
                >
                  {/* Rank */}
                  <div className="w-10 h-10 rounded-lg bg-slate-900 flex items-center justify-center text-slate-400 font-bold shrink-0">
                    {match.rank}
                  </div>

                  {/* Score */}
                  <div className={`w-14 h-14 rounded-xl flex items-center justify-center font-bold text-lg shrink-0 ${
                    match.score >= 80 ? 'bg-green-500/20 text-green-400' :
                    match.score >= 65 ? 'bg-yellow-500/20 text-yellow-400' :
                    match.score >= 50 ? 'bg-orange-500/20 text-orange-400' :
                    'bg-red-500/20 text-red-400'
                  }`}>
                    {match.score}
                  </div>

                  {/* Course info */}
                  <div className="flex-1 min-w-0">
                    <div className="text-slate-200 font-medium truncate">{match.course.course_name}</div>
                    <div className="text-slate-500 text-sm truncate">{match.course.university}</div>
                  </div>

                  {/* Friction badge */}
                  <div className={`px-3 py-1 rounded-full text-xs font-medium border shrink-0 ${FRICTION_COLORS[match.friction]}`}>
                    {match.friction.replace('_', ' ')}
                  </div>

                  {/* Expand icon */}
                  <svg 
                    className={`w-5 h-5 text-slate-500 transition-transform ${expandedMatch === index ? 'rotate-180' : ''}`} 
                    fill="none" 
                    stroke="currentColor" 
                    viewBox="0 0 24 24"
                  >
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                  </svg>
                </button>

                {/* Expanded details */}
                {expandedMatch === index && (
                  <div className="px-4 pb-4 border-t border-slate-700/50">
                    <div className="pt-4 grid grid-cols-2 md:grid-cols-4 gap-4">
                      <div>
                        <div className="text-slate-500 text-xs">Cognitive Fit</div>
                        <div className="text-cyan-400 font-semibold">{match.cognitive_score}%</div>
                      </div>
                      <div>
                        <div className="text-slate-500 text-xs">Behavioral Penalty</div>
                        <div className="text-pink-400 font-semibold">-{match.behavioral_penalty}</div>
                      </div>
                      <div>
                        <div className="text-slate-500 text-xs">Vibe Bonus</div>
                        <div className="text-amber-400 font-semibold">+{match.vibe_bonus}</div>
                      </div>
                      <div>
                        <div className="text-slate-500 text-xs">Subject</div>
                        <div className="text-slate-300 font-medium truncate">{match.course.subject_area || 'N/A'}</div>
                      </div>
                    </div>
                    
                    {(match.course.nss_overall || match.course.employment_rate || match.course.median_salary_5yr) && (
                      <div className="mt-4 pt-4 border-t border-slate-700/50 flex flex-wrap gap-4">
                        {match.course.nss_overall && (
                          <div className="text-slate-500 text-sm">
                            NSS: <span className="text-slate-300">{match.course.nss_overall}%</span>
                          </div>
                        )}
                        {match.course.employment_rate && (
                          <div className="text-slate-500 text-sm">
                            Employment: <span className="text-slate-300">{match.course.employment_rate}%</span>
                          </div>
                        )}
                        {match.course.median_salary_5yr && (
                          <div className="text-slate-500 text-sm">
                            Salary (5yr): <span className="text-slate-300">£{match.course.median_salary_5yr.toLocaleString()}</span>
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                )}
              </div>
            ))}
          </div>
        </section>

        {/* Supercurriculars Section */}
        {supercurriculars.length > 0 && (
          <section className="mb-8">
            <div className="flex items-center justify-between mb-4">
              <div>
                <h2 className="text-lg font-semibold text-slate-200">Strengthen Your Application</h2>
                <p className="text-slate-500 text-sm">
                  Based on your profile and target courses
                  {profile.nemesis && (
                    <span> • Boosting <span className="text-amber-400 capitalize">{profile.nemesis}</span></span>
                  )}
                </p>
              </div>
              <a 
                href="/supercurriculars" 
                className="text-purple-400 hover:text-purple-300 text-sm transition-colors"
              >
                View all →
              </a>
            </div>
            
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {supercurriculars.map((item) => {
                const typeConfig = TYPE_CONFIG[item.type] || TYPE_CONFIG.ARTICLE;
                const nemesis = profile.nemesis?.toUpperCase();
                const boostsNemesis = nemesis && item.disposition_boosts?.[nemesis];
                
                return (
                  <div
                    key={item.id}
                    className="bg-slate-800/50 rounded-xl border border-slate-700/50 p-4 hover:border-slate-600/50 transition-colors"
                  >
                    {/* Header */}
                    <div className="flex items-start gap-3 mb-3">
                      <div className="text-2xl">{typeConfig.icon}</div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-1">
                          <span className={`px-2 py-0.5 rounded text-xs font-medium border ${typeConfig.color}`}>
                            {typeConfig.label}
                          </span>
                          {boostsNemesis && (
                            <span className="px-2 py-0.5 rounded text-xs font-medium bg-amber-500/20 text-amber-400 border border-amber-500/30">
                              +{item.disposition_boosts![nemesis]} {profile.nemesis}
                            </span>
                          )}
                        </div>
                        <h3 className="text-slate-200 font-medium leading-tight">{item.title}</h3>
                        {item.author && (
                          <p className="text-slate-500 text-sm truncate">{item.author}</p>
                        )}
                      </div>
                    </div>

                    {/* Description */}
                    {item.description && (
                      <p className="text-slate-400 text-sm mb-3 line-clamp-2">{item.description}</p>
                    )}

                    {/* Footer */}
                    <div className="flex items-center justify-between text-sm">
                      <div className="flex items-center gap-3 text-slate-500">
                        {item.time_estimate && (
                          <span className="flex items-center gap-1">
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            {item.time_estimate}
                          </span>
                        )}
                        {item.difficulty_label && (
                          <span className={`capitalize ${
                            item.difficulty_label === 'FOUNDATION' ? 'text-green-500' :
                            item.difficulty_label === 'DEVELOPING' ? 'text-blue-500' :
                            item.difficulty_label === 'PROFICIENT' ? 'text-yellow-500' :
                            item.difficulty_label === 'ADVANCED' ? 'text-orange-500' :
                            'text-red-500'
                          }`}>
                            {item.difficulty_label.toLowerCase()}
                          </span>
                        )}
                      </div>
                      <div className="flex items-center gap-2">
                        {item.is_free ? (
                          <span className="text-green-400 font-medium">Free</span>
                        ) : item.price_gbp ? (
                          <span className="text-slate-400">£{item.price_gbp}</span>
                        ) : null}
                        {item.external_url && (
                          <a
                            href={item.external_url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="p-1.5 rounded-lg bg-slate-700/50 hover:bg-slate-700 text-slate-400 hover:text-slate-200 transition-colors"
                          >
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                            </svg>
                          </a>
                        )}
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </section>
        )}

        {/* Footer */}
        <footer className="mt-12 text-center text-slate-600 text-sm">
          <p>Results based on {matches.length > 0 ? 'your unique profile' : 'assessment data'}</p>
          <p className="mt-1">ExamRizz Arena • {new Date().getFullYear()}</p>
        </footer>
      </div>
    </main>
  );
}
