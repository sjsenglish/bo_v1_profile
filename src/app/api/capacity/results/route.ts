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

const FRICTION_LABELS: Record<string, { label: string; color: string }> = {
  LOW: { label: 'Great Fit', color: '#4ade80' },
  MODERATE: { label: 'Good Fit', color: '#54acbf' },
  HIGH: { label: 'Stretch', color: '#d4a55a' },
  VERY_HIGH: { label: 'Challenge', color: '#f97316' },
  EXTREME: { label: 'Reach', color: '#ef4444' },
};

const TYPE_ICONS: Record<string, string> = {
  BOOK: '📖', COURSE: '💻', COMPETITION: '🏆', WORK_EXPERIENCE: '💼',
  VOLUNTEERING: '🤝', EPQ: '📝', SUMMER_SCHOOL: '🎓', PODCAST: '🎧',
  VIDEO: '🎬', RESEARCH: '🔬',
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

const DISPOSITION_LABELS: Record<string, { name: string; description: string }> = {
  calibration: { name: 'Calibration', description: 'Self-awareness accuracy' },
  tolerance: { name: 'Tolerance', description: 'Persistence through difficulty' },
  transfer: { name: 'Transfer', description: 'Cross-domain pattern recognition' },
  precision: { name: 'Precision', description: 'Attention to detail' },
  retrieval: { name: 'Retrieval', description: 'Active recall ability' },
  receptivity: { name: 'Receptivity', description: 'Openness to feedback' },
};

// ============================================================================
// CONFIDENCE GRADE CALCULATION
// ============================================================================

function calculateConfidenceGrade(
  session: SessionData | null,
  capacityResults: CapacityResults | null
): { grade: string; label: string; color: string; message: string; percentage: number } {
  // Count full benchmarks (12+ items each)
  const fullBenchmarks = [
    (capacityResults?.vrb_items_completed || 0) >= 12,
    (capacityResults?.qnt_items_completed || 0) >= 12,
    (capacityResults?.spd_items_completed || 0) >= 12,
  ].filter(Boolean).length;

  // Count intro items (1-11 items)
  const introItems = [
    (capacityResults?.vrb_items_completed || 0) > 0 && (capacityResults?.vrb_items_completed || 0) < 12,
    (capacityResults?.qnt_items_completed || 0) > 0 && (capacityResults?.qnt_items_completed || 0) < 12,
    (capacityResults?.spd_items_completed || 0) > 0 && (capacityResults?.spd_items_completed || 0) < 12,
  ].filter(Boolean).length;

  if (fullBenchmarks >= 2) {
    return {
      grade: 'A',
      label: 'High Confidence',
      color: '#4ade80',
      message: 'Your results are highly accurate',
      percentage: 95,
    };
  }

  if (fullBenchmarks === 1) {
    return {
      grade: 'B',
      label: 'Good Confidence',
      color: '#54acbf',
      message: 'Take another benchmark to reach Grade A',
      percentage: 75,
    };
  }

  if (introItems > 0 || (session?.benchmarks_completed || 0) > 0) {
    return {
      grade: 'C',
      label: 'Moderate Confidence',
      color: '#d4a55a',
      message: 'Complete full benchmarks for better accuracy',
      percentage: 50,
    };
  }

  return {
    grade: 'D',
    label: 'Low Confidence',
    color: '#ef4444',
    message: 'Take capacity benchmarks to improve accuracy',
    percentage: 25,
  };
}

// ============================================================================
// COMPONENTS
// ============================================================================

// Confidence Grade Card
function ConfidenceGradeCard({ 
  grade, 
  onTakeBenchmark 
}: { 
  grade: ReturnType<typeof calculateConfidenceGrade>;
  onTakeBenchmark: () => void;
}) {
  return (
    <div className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4 mb-4">
      <div className="flex items-center justify-between mb-3">
        <span className="text-[#54acbf]/70 text-xs uppercase tracking-wider">Match Confidence</span>
        <div 
          className="w-10 h-10 rounded-lg flex items-center justify-center text-xl font-bold"
          style={{ backgroundColor: `${grade.color}20`, color: grade.color }}
        >
          {grade.grade}
        </div>
      </div>
      
      <div className="mb-2">
        <div className="flex justify-between text-sm mb-1">
          <span style={{ color: grade.color }}>{grade.label}</span>
          <span className="text-[#f8f5f0]/60">{grade.percentage}%</span>
        </div>
        <div className="h-2 bg-[#011c40] rounded-full overflow-hidden">
          <div 
            className="h-full rounded-full transition-all duration-500"
            style={{ width: `${grade.percentage}%`, backgroundColor: grade.color }}
          />
        </div>
      </div>
      
      <p className="text-[#f8f5f0]/50 text-xs mb-3">{grade.message}</p>
      
      {grade.grade !== 'A' && (
        <button
          onClick={onTakeBenchmark}
          className="w-full py-2 bg-[#54acbf]/20 hover:bg-[#54acbf]/30 border border-[#54acbf]/50 rounded text-[#54acbf] text-sm transition-colors"
        >
          Improve Grade →
        </button>
      )}
    </div>
  );
}

// Profile Card
function ProfileCard({ 
  profile, 
  familiar,
  level,
  xp 
}: { 
  profile: ProfileData;
  familiar: any;
  level: number;
  xp: number;
}) {
  const xpToNext = 1000;
  const xpProgress = (xp % xpToNext) / xpToNext * 100;

  return (
    <div className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4">
      {/* Familiar Icon */}
      <div className="flex flex-col items-center mb-4">
        <div className="w-20 h-20 bg-[#011c40] border-2 border-[#54acbf]/50 rounded-xl flex items-center justify-center mb-2">
          <span className="text-4xl">{familiar?.emoji || '🎓'}</span>
        </div>
        <div className="bg-[#54acbf] text-[#011c40] text-xs font-bold px-2 py-0.5 rounded">
          LVL {level}
        </div>
      </div>

      {/* Name & Title */}
      <div className="text-center mb-4">
        <h3 className="text-[#f8f5f0] font-semibold">{familiar?.name || 'Scholar'}</h3>
        <p className="text-[#54acbf]/70 text-sm">{familiar?.tagline || 'Knowledge Seeker'}</p>
      </div>

      {/* XP Progress */}
      <div className="mb-2">
        <div className="flex justify-between text-xs mb-1">
          <span className="text-[#54acbf]/60">XP Progress</span>
          <span className="text-[#f8f5f0]/60">{xp} / {xpToNext}</span>
        </div>
        <div className="h-2 bg-[#011c40] rounded-full overflow-hidden">
          <div 
            className="h-full bg-gradient-to-r from-[#54acbf] to-[#4ade80] rounded-full"
            style={{ width: `${xpProgress}%` }}
          />
        </div>
      </div>
    </div>
  );
}

// Quest Log
function QuestLog({ 
  completedBenchmarks,
  onTakeBenchmark 
}: { 
  completedBenchmarks: { vrb: boolean; qnt: boolean; spd: boolean };
  onTakeBenchmark: (type: string) => void;
}) {
  const quests = [
    { id: 'vrb', name: 'Verbal Mastery', description: 'Complete VRB benchmark', xp: 100, done: completedBenchmarks.vrb },
    { id: 'qnt', name: 'Quantitative Edge', description: 'Complete QNT benchmark', xp: 100, done: completedBenchmarks.qnt },
    { id: 'spd', name: 'Speed Demon', description: 'Complete SPD benchmark', xp: 100, done: completedBenchmarks.spd },
  ];

  const completedCount = quests.filter(q => q.done).length;

  return (
    <div className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-2">
          <span className="text-lg">📋</span>
          <span className="text-[#f8f5f0] font-medium">Quest Log</span>
        </div>
        <span className="text-[#54acbf]/70 text-sm">{completedCount} / {quests.length}</span>
      </div>

      <div className="space-y-3">
        {quests.map((quest) => (
          <div 
            key={quest.id}
            className={`p-3 rounded-lg border transition-colors ${
              quest.done 
                ? 'bg-[#4ade80]/10 border-[#4ade80]/30' 
                : 'bg-[#011c40] border-[#54acbf]/20 hover:border-[#54acbf]/40 cursor-pointer'
            }`}
            onClick={() => !quest.done && onTakeBenchmark(quest.id)}
          >
            <div className="flex items-start gap-3">
              <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center flex-shrink-0 mt-0.5 ${
                quest.done ? 'bg-[#4ade80] border-[#4ade80]' : 'border-[#54acbf]/50'
              }`}>
                {quest.done && <span className="text-[#011c40] text-xs">✓</span>}
              </div>
              <div className="flex-1">
                <div className="flex items-center justify-between">
                  <span className={`text-sm font-medium ${quest.done ? 'text-[#4ade80]' : 'text-[#f8f5f0]'}`}>
                    {quest.name}
                  </span>
                  <span className="text-[#d4a55a] text-xs">+{quest.xp} XP</span>
                </div>
                <p className="text-[#f8f5f0]/50 text-xs">{quest.description}</p>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

// Archetype Card
function ArchetypeCard({ profile, guild, familiar }: { profile: ProfileData; guild: any; familiar: any }) {
  return (
    <div className="bg-gradient-to-br from-[#0a1628] to-[#011c40] border border-[#54acbf]/30 rounded-xl p-6">
      <p className="text-[#54acbf] text-xs uppercase tracking-wider mb-2">Archetype Identified</p>
      <h1 className="text-3xl lg:text-4xl text-[#f8f5f0] font-light mb-4">
        You are The<br />
        <span className="text-[#54acbf]">{guild?.name?.replace('The ', '') || 'Scholar'}</span>
      </h1>
      
      <p className="text-[#f8f5f0]/70 mb-6 leading-relaxed">
        {guild?.motto || 'You excel at synthesising complex data into actionable plans. Your path leans toward high-structure environments where strategic thinking is paramount.'}
      </p>

      <div className="flex flex-wrap gap-3">
        <div className="flex items-center gap-2 bg-[#54acbf]/10 border border-[#54acbf]/30 rounded-full px-3 py-1.5">
          <span className="text-sm">📚</span>
          <span className="text-[#54acbf] text-sm">
            Academics: <span className="text-[#f8f5f0]">{profile.calibration > 60 ? 'High' : profile.calibration > 40 ? 'Moderate' : 'Developing'}</span>
          </span>
        </div>
        <div className="flex items-center gap-2 bg-[#54acbf]/10 border border-[#54acbf]/30 rounded-full px-3 py-1.5">
          <span className="text-sm">💚</span>
          <span className="text-[#54acbf] text-sm">
            Well-being: <span className="text-[#f8f5f0]">{profile.tolerance > 60 ? 'Resilient' : 'Balanced'}</span>
          </span>
        </div>
        <div className="flex items-center gap-2 bg-[#54acbf]/10 border border-[#54acbf]/30 rounded-full px-3 py-1.5">
          <span className="text-sm">📈</span>
          <span className="text-[#54acbf] text-sm">
            Outlook: <span className="text-[#4ade80]">Growth</span>
          </span>
        </div>
      </div>
    </div>
  );
}

// Core Insights (Disposition Bars)
function CoreInsights({ profile }: { profile: ProfileData }) {
  const insights = [
    { 
      key: 'calibration', 
      label: 'Academic Alignment', 
      value: profile.calibration,
      status: profile.calibration > 70 ? 'Strong Match' : profile.calibration > 50 ? 'Good Fit' : 'Developing',
      statusColor: profile.calibration > 70 ? '#4ade80' : profile.calibration > 50 ? '#54acbf' : '#d4a55a',
      description: 'Your grade profile and predicted outcomes align well with high-structure analytical courses.'
    },
    { 
      key: 'tolerance', 
      label: 'Challenge Tolerance', 
      value: profile.tolerance,
      status: profile.tolerance > 60 ? 'High' : 'Balanced',
      statusColor: profile.tolerance > 60 ? '#4ade80' : '#54acbf',
      description: 'This path offers a moderate stress load, though exam periods will be intense.'
    },
    { 
      key: 'transfer', 
      label: 'Career Outlook', 
      value: profile.transfer,
      status: 'High Growth',
      statusColor: '#d4a55a',
      description: 'Projected market demand for this skillset is trending upward significantly over the next decade.'
    },
  ];

  return (
    <div className="space-y-4">
      <h2 className="text-[#54acbf] text-xs uppercase tracking-wider">Core Insights</h2>
      
      {insights.map((insight) => (
        <div key={insight.key} className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center gap-2">
              <div className="w-8 h-8 bg-[#54acbf]/20 rounded flex items-center justify-center">
                <span className="text-[#54acbf]">📊</span>
              </div>
              <span className="text-[#f8f5f0] font-medium">{insight.label}</span>
            </div>
            <span 
              className="text-sm px-2 py-1 rounded"
              style={{ backgroundColor: `${insight.statusColor}20`, color: insight.statusColor }}
            >
              {insight.status}
            </span>
          </div>
          
          <div className="mb-3">
            <div className="h-2 bg-[#011c40] rounded-full overflow-hidden">
              <div 
                className="h-full rounded-full transition-all duration-500"
                style={{ width: `${insight.value}%`, backgroundColor: insight.statusColor }}
              />
            </div>
          </div>
          
          <p className="text-[#f8f5f0]/60 text-sm">{insight.description}</p>
        </div>
      ))}
    </div>
  );
}

// Course Card
function CourseCard({ match, expanded, onToggle }: { match: MatchData; expanded: boolean; onToggle: () => void }) {
  const friction = FRICTION_LABELS[match.friction] || FRICTION_LABELS.MODERATE;
  
  return (
    <div 
      className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4 hover:border-[#54acbf]/50 transition-colors cursor-pointer"
      onClick={onToggle}
    >
      <div className="flex items-start justify-between mb-2">
        <div className="flex-1">
          <h3 className="text-[#f8f5f0] font-medium mb-1">{match.course.course_name}</h3>
          <p className="text-[#54acbf]/70 text-sm">{match.course.university}</p>
        </div>
        <span 
          className="text-xs px-2 py-1 rounded"
          style={{ backgroundColor: `${friction.color}20`, color: friction.color }}
        >
          {friction.label}
        </span>
      </div>

      {/* Stats Row */}
      <div className="flex items-center gap-4 text-xs text-[#f8f5f0]/50">
        {match.course.nss_overall && (
          <span>📊 {match.course.nss_overall}% satisfaction</span>
        )}
        {match.course.employment_rate && (
          <span>💼 {match.course.employment_rate}% employed</span>
        )}
        {match.course.russell_group && (
          <span className="text-[#d4a55a]">🏛 Russell Group</span>
        )}
      </div>

      {expanded && (
        <div className="mt-4 pt-4 border-t border-[#54acbf]/20">
          <div className="grid grid-cols-3 gap-4 text-sm">
            <div>
              <p className="text-[#54acbf]/60 text-xs mb-1">Match Score</p>
              <p className="text-[#f8f5f0]">{match.score}%</p>
            </div>
            <div>
              <p className="text-[#54acbf]/60 text-xs mb-1">Cognitive Fit</p>
              <p className="text-[#f8f5f0]">{match.cognitive_score}%</p>
            </div>
            {match.course.median_salary_5yr && (
              <div>
                <p className="text-[#54acbf]/60 text-xs mb-1">Salary (5yr)</p>
                <p className="text-[#f8f5f0]">£{(match.course.median_salary_5yr / 1000).toFixed(0)}k</p>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

// Right Sidebar Item
function SidebarItem({ title, subtitle, onClick }: { title: string; subtitle?: string; onClick?: () => void }) {
  return (
    <div 
      className="p-3 bg-[#011c40] hover:bg-[#0a1628] rounded-lg cursor-pointer transition-colors"
      onClick={onClick}
    >
      <p className="text-[#f8f5f0] text-sm">{title}</p>
      {subtitle && <p className="text-[#54acbf]/60 text-xs">{subtitle}</p>}
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

        // Fetch session
        const { data: sessionData } = await supabase
          .from('bo_v1_sessions')
          .select('benchmarks_completed')
          .eq('id', sessionId)
          .single();
        
        setSession(sessionData);

        // Fetch capacity results
        const { data: capData } = await supabase
          .from('bo_v1_capacity_results')
          .select('vrb_items_completed, qnt_items_completed, spd_items_completed')
          .eq('session_id', sessionId)
          .single();
        
        setCapacityResults(capData);

        // Fetch matches with course details
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

        // Fetch supercurriculars based on top course clusters
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

  const handleTakeBenchmark = (type?: string) => {
    // Navigate to full benchmark page
    router.push(`/assessment/capacity/full${type ? `?type=${type.toUpperCase()}` : ''}`);
  };

  if (loading) {
    return (
      <main className="min-h-screen bg-[#011c40] flex items-center justify-center">
        <div className="w-8 h-8 border-2 border-[#54acbf] border-t-transparent rounded-full animate-spin" />
      </main>
    );
  }

  if (error || !profile) {
    return (
      <main className="min-h-screen bg-[#011c40] flex items-center justify-center text-[#54acbf]/60">
        <div className="text-center">
          <p className="mb-4">Results not found</p>
          <a href="/" className="text-[#54acbf] hover:underline">Start again</a>
        </div>
      </main>
    );
  }

  const familiar = getFamiliarById(profile.familiar_id as any);
  const guild = getGuildById(profile.guild_id as any);
  const confidenceGrade = calculateConfidenceGrade(session, capacityResults);
  const level = profile.level || Math.floor((profile.total_xp || 0) / 1000) + 1;
  const xp = profile.total_xp || 450;

  const displayedCourses = showAllCourses ? matches : matches.slice(0, 6);

  const completedBenchmarks = {
    vrb: (capacityResults?.vrb_items_completed || 0) >= 12,
    qnt: (capacityResults?.qnt_items_completed || 0) >= 12,
    spd: (capacityResults?.spd_items_completed || 0) >= 12,
  };

  return (
    <main className="min-h-screen bg-[#011c40]">
      {/* Nav */}
      <nav className="flex justify-between items-center px-6 py-4 border-b border-[#54acbf]/20">
        <div className="flex items-center gap-3">
          <span className="text-[#54acbf] text-lg">🎓</span>
          <span className="text-[#f8f5f0] font-medium">LVL {level} Navigator</span>
          <span className="text-[#54acbf]/60 text-sm">Rank: {familiar?.tagline || 'Scholar'}</span>
        </div>
        <div className="flex items-center gap-6 text-sm">
          <button className="text-[#54acbf]/60 hover:text-[#54acbf] transition-colors">Paths</button>
          <button className="text-[#54acbf]/60 hover:text-[#54acbf] transition-colors">Active</button>
          <button className="text-[#54acbf]/60 hover:text-[#54acbf] transition-colors">Insights</button>
        </div>
      </nav>

      {/* Main Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-[280px_1fr_280px] gap-6 p-6 max-w-[1600px] mx-auto">
        
        {/* Left Sidebar */}
        <aside className="space-y-4">
          <ConfidenceGradeCard grade={confidenceGrade} onTakeBenchmark={handleTakeBenchmark} />
          <ProfileCard profile={profile} familiar={familiar} level={level} xp={xp} />
          <QuestLog completedBenchmarks={completedBenchmarks} onTakeBenchmark={handleTakeBenchmark} />
        </aside>

        {/* Main Content */}
        <div className="space-y-6">
          <ArchetypeCard profile={profile} guild={guild} familiar={familiar} />
          <CoreInsights profile={profile} />
          
          {/* Course Matches */}
          <div>
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-[#54acbf] text-xs uppercase tracking-wider">Compatible Paths</h2>
              <span className="text-[#f8f5f0]/50 text-sm">{matches.length} matches</span>
            </div>
            
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {displayedCourses.map((match, idx) => (
                <CourseCard
                  key={match.course.id}
                  match={match}
                  expanded={expandedCourse === idx}
                  onToggle={() => setExpandedCourse(expandedCourse === idx ? null : idx)}
                />
              ))}
            </div>

            {matches.length > 6 && (
              <button
                onClick={() => setShowAllCourses(!showAllCourses)}
                className="mt-4 text-[#54acbf] text-sm hover:underline"
              >
                {showAllCourses ? 'Show fewer' : `See ${matches.length - 6} more paths`}
              </button>
            )}
          </div>

          {/* Supercurriculars */}
          {supercurriculars.length > 0 && (
            <div>
              <h2 className="text-[#54acbf] text-xs uppercase tracking-wider mb-4">Recommended Activities</h2>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                {supercurriculars.map((item) => (
                  <a
                    key={item.id}
                    href={item.external_url || '#'}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4 hover:border-[#54acbf]/50 transition-colors"
                  >
                    <div className="flex items-center gap-2 mb-2">
                      <span>{TYPE_ICONS[item.type] || '📌'}</span>
                      <span className="text-[#54acbf]/60 text-xs uppercase">{item.type}</span>
                    </div>
                    <h3 className="text-[#f8f5f0] text-sm font-medium">{item.title}</h3>
                    {item.author && <p className="text-[#f8f5f0]/50 text-xs mt-1">{item.author}</p>}
                  </a>
                ))}
              </div>
            </div>
          )}
        </div>

        {/* Right Sidebar */}
        <aside className="space-y-4">
          <div className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4">
            <div className="flex items-center gap-2 mb-4">
              <span className="text-[#54acbf]/60">🕐</span>
              <span className="text-[#f8f5f0]/70 text-sm uppercase tracking-wider">Recently Viewed</span>
            </div>
            <div className="space-y-2">
              {matches.slice(0, 3).map((match) => (
                <SidebarItem 
                  key={match.course.id} 
                  title={match.course.course_name}
                  subtitle={match.course.university}
                />
              ))}
            </div>
          </div>

          <div className="bg-[#0a1628] border border-[#54acbf]/30 rounded-lg p-4">
            <div className="flex items-center gap-2 mb-4">
              <span className="text-[#54acbf]/60">📌</span>
              <span className="text-[#f8f5f0]/70 text-sm uppercase tracking-wider">Pinned</span>
            </div>
            <p className="text-[#f8f5f0]/40 text-sm text-center py-4">
              Click courses to pin them for comparison
            </p>
          </div>
        </aside>

      </div>
    </main>
  );
}