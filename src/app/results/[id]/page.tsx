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
  precision_score?: number;
  precision_tier?: string;
  cluster_preferences?: Record<string, number>;
  cluster_capabilities?: Record<string, number>;
}

interface SessionData {
  benchmarks_completed: number;
  mini_samples_completed: boolean;
  scenarios_completed: boolean;
}

interface MiniSampleResponse {
  task_id: string;
  score: number;
  enjoyment_rating: number;
  career_fit_rating: number;
  bo_v1_mini_samples: {
    meta_cluster: string;
    title: string;
  } | null;
}

// Early Indicators Component
function EarlyIndicators({ miniSampleResults }: { miniSampleResults: MiniSampleResponse[] }) {
  if (!miniSampleResults || miniSampleResults.length === 0) return null;

  const CLUSTER_CONFIG = [
    { type: 'STEM_TECH', label: 'STEM-Technical', emoji: '🔬', description: 'Computing, Engineering, Maths' },
    { type: 'STEM_SCI', label: 'STEM-Scientific', emoji: '🧪', description: 'Sciences, Research' },
    { type: 'HUMANITIES', label: 'Humanities', emoji: '📚', description: 'Law, History, Politics' },
    { type: 'SOCIAL_SCI', label: 'Social Sciences', emoji: '📊', description: 'Psychology, Economics, Sociology' },
    { type: 'PROFESSIONAL', label: 'Professional', emoji: '💼', description: 'Business, Medicine, Law' },
    { type: 'CREATIVE', label: 'Creative', emoji: '🎨', description: 'Arts, Design, Media' },
  ];

  const ENJOYMENT_LABELS = ['😫 Challenging', '😐 Okay', '😊 Enjoyed'];

  return (
    <GlassCard className="p-6">
      <div className="flex items-center justify-between mb-4">
        <span className="text-[white]/40 text-xs uppercase tracking-wider">Early Indicators</span>
        <span className="text-[#6366f1] text-xs">from Mini-Samples</span>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {CLUSTER_CONFIG.map(cluster => {
          const result = miniSampleResults.find(
            r => r.bo_v1_mini_samples?.meta_cluster === cluster.type
          );

          if (!result) return (
            <div key={cluster.type} className="p-4 rounded-xl bg-white/[0.02] border border-white/[0.05] opacity-50">
              <div className="text-2xl mb-2">{cluster.emoji}</div>
              <h4 className="text-[white] font-medium">{cluster.label}</h4>
              <p className="text-[white]/30 text-xs mt-1">Not completed</p>
            </div>
          );

          const scorePercent = Math.round((result.score / 3) * 100);
          const enjoymentLabel = ENJOYMENT_LABELS[result.enjoyment_rating + 1] || '😐 Okay';

          return (
            <div key={cluster.type} className="p-4 rounded-xl bg-[#6366f1]/5 border border-[#6366f1]/20">
              <div className="flex items-center justify-between mb-3">
                <span className="text-2xl">{cluster.emoji}</span>
                <span className={`text-sm font-medium ${
                  scorePercent >= 70 ? 'text-[#4ade80]' :
                  scorePercent >= 40 ? 'text-[#6366f1]' : 'text-[#f97316]'
                }`}>
                  {scorePercent}%
                </span>
              </div>
              <h4 className="text-[white] font-medium mb-1">{cluster.label}</h4>
              <p className="text-[white]/40 text-xs mb-3">{cluster.description}</p>
              <div className="flex items-center gap-2">
                <span className="text-xs">{enjoymentLabel}</span>
              </div>
            </div>
          );
        })}
      </div>
    </GlassCard>
  );
}

// Sharpening CTAs Component
function SharpeningCTAs({ precisionScore }: { precisionScore: number }) {
  const activities = [
    { name: 'Reasoning Challenges', time: '~4 min', precision: '+15%', icon: '🧩', available: true },
    { name: 'Speed Challenge', time: '~3 min', precision: '+10%', icon: '⚡', available: false },
    { name: 'More Scenarios', time: '~4 min', precision: '+12%', icon: '🎯', available: false },
    { name: 'Challenge Mini-Samples', time: '~3 min', precision: '+8%', icon: '🔥', available: false },
  ];

  return (
    <GlassCard className="p-5">
      <div className="flex items-center justify-between mb-4">
        <span className="text-[white]/40 text-xs uppercase tracking-wider">Sharpen Profile</span>
        <span className="text-[#6366f1] text-xs">{precisionScore || 40}% precision</span>
      </div>

      <div className="space-y-2">
        {activities.map((activity, i) => (
          <div
            key={i}
            className={`
              p-3 rounded-xl border transition-all
              ${activity.available
                ? 'bg-[#6366f1]/10 border-[#6366f1]/30 cursor-pointer hover:bg-[#6366f1]/20'
                : 'bg-white/[0.02] border-white/[0.05] opacity-60'}
            `}
          >
            <div className="flex items-center gap-3">
              <span className="text-lg">{activity.icon}</span>
              <div className="flex-1">
                <p className={`text-sm font-medium ${activity.available ? 'text-[white]' : 'text-[white]/50'}`}>
                  {activity.name}
                </p>
                <p className="text-[white]/30 text-xs">{activity.time}</p>
              </div>
              <span className={`text-xs font-medium ${activity.available ? 'text-[#4ade80]' : 'text-[white]/30'}`}>
                {activity.precision}
              </span>
            </div>
            {!activity.available && (
              <p className="text-[white]/20 text-xs mt-2 ml-8">Coming soon</p>
            )}
          </div>
        ))}
      </div>

      {precisionScore < 70 && (
        <p className="text-[#6366f1]/60 text-xs text-center mt-4">
          Reach 70% to unlock your Familiar & Guild
        </p>
      )}
    </GlassCard>
  );
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
    location?: string;
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
  description?: string;
}

// ============================================================================
// CONSTANTS
// ============================================================================

const FRICTION_LABELS: Record<string, { label: string; color: string }> = {
  LOW: { label: 'Great Fit', color: '#4ade80' },
  MODERATE: { label: 'Good Fit', color: '#6366f1' },
  HIGH: { label: 'Stretch', color: '#d4a55a' },
  VERY_HIGH: { label: 'Challenge', color: '#f97316' },
  EXTREME: { label: 'Reach', color: '#ef4444' },
};

const TYPE_ICONS: Record<string, string> = {
  BOOK: '📖',
  COURSE: '💻',
  COMPETITION: '🏆',
  WORK_EXPERIENCE: '💼',
  VOLUNTEERING: '🤝',
  EPQ: '📝',
  SUMMER_SCHOOL: '🎓',
  PODCAST: '🎧',
  VIDEO: '🎬',
  RESEARCH: '🔬',
  ARTICLE: '📄',
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

const DISPOSITION_CONFIG = [
  { key: 'calibration', label: 'Calibration', description: 'Self-awareness accuracy' },
  { key: 'tolerance', label: 'Tolerance', description: 'Persistence through difficulty' },
  { key: 'transfer', label: 'Transfer', description: 'Cross-domain thinking' },
  { key: 'precision', label: 'Precision', description: 'Attention to detail' },
  { key: 'retrieval', label: 'Retrieval', description: 'Active recall ability' },
  { key: 'receptivity', label: 'Receptivity', description: 'Openness to feedback' },
];

// ============================================================================
// UTILITY FUNCTIONS
// ============================================================================

function calculateConfidenceGrade(
  session: SessionData | null,
  capacityResults: CapacityResults | null
): { grade: string; percentage: number; message: string; color: string } {
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
    return { grade: 'A', percentage: 95, message: 'High accuracy results', color: '#4ade80' };
  }
  if (fullBenchmarks === 1) {
    return { grade: 'B', percentage: 75, message: 'Take another benchmark for Grade A', color: '#6366f1' };
  }
  if (introItems > 0 || (session?.benchmarks_completed || 0) > 0) {
    return { grade: 'C', percentage: 50, message: 'Complete benchmarks for better accuracy', color: '#d4a55a' };
  }
  return { grade: 'D', percentage: 25, message: 'Take benchmarks to improve accuracy', color: '#ef4444' };
}

function generateTutorMessage(profile: ProfileData): string {
  // Placeholder — will be replaced with API call
  const dominant = profile.dominant?.toLowerCase() || 'analytical';
  const topDisposition = DISPOSITION_CONFIG
    .map(d => ({ ...d, value: (profile as any)[d.key] || 0 }))
    .sort((a, b) => b.value - a.value)[0];
  
  return `Your ${topDisposition.label.toLowerCase()} scores suggest you'd thrive in environments that reward ${topDisposition.description.toLowerCase()}. The courses below have been selected to match your cognitive profile — pay attention to the "Great Fit" matches for the smoothest academic transition.`;
}

// ============================================================================
// COMPONENTS
// ============================================================================

function GlassCard({
  children,
  className = '',
  hover = false,
}: {
  children: React.ReactNode;
  className?: string;
  hover?: boolean;
}) {
  return (
    <div className={`
      bg-[#1a1a24]/80
      backdrop-blur-xl
      border border-white/10
      rounded-2xl
      ${hover ? 'hover:bg-[#1a1a24] hover:border-[#6366f1]/30 transition-all duration-300' : ''}
      ${className}
    `}>
      {children}
    </div>
  );
}

// Constellation Map Component
function ConstellationMap({ profile }: { profile: ProfileData }) {
  const centerX = 150;
  const centerY = 150;
  const radius = 100;
  
  const nodes = DISPOSITION_CONFIG.map((d, i) => {
    const angle = (i * 60 - 90) * (Math.PI / 180); // Start from top, 60° apart
    const value = (profile as any)[d.key] || 50;
    const nodeRadius = 12 + (value / 100) * 18; // 12-30px based on score
    
    return {
      ...d,
      value,
      x: centerX + radius * Math.cos(angle),
      y: centerY + radius * Math.sin(angle),
      radius: nodeRadius,
    };
  });

  return (
    <div className="relative w-full aspect-square max-w-[300px] mx-auto">
      <svg viewBox="0 0 300 300" className="w-full h-full">
        {/* Connecting lines */}
        {nodes.map((node, i) => (
          <line
            key={`line-${i}`}
            x1={centerX}
            y1={centerY}
            x2={node.x}
            y2={node.y}
            stroke="#6366f1"
            strokeWidth="1"
            strokeOpacity="0.3"
          />
        ))}
        
        {/* Outer ring (decorative) */}
        <circle
          cx={centerX}
          cy={centerY}
          r={radius + 30}
          fill="none"
          stroke="#6366f1"
          strokeWidth="1"
          strokeOpacity="0.1"
          strokeDasharray="4 4"
        />
        
        {/* Center node - YOU */}
        <circle
          cx={centerX}
          cy={centerY}
          r={24}
          fill="#6366f1"
          fillOpacity="0.3"
        />
        <circle
          cx={centerX}
          cy={centerY}
          r={20}
          fill="#6366f1"
        />
        <text
          x={centerX}
          y={centerY + 4}
          textAnchor="middle"
          fill="#0a0a0f"
          fontSize="10"
          fontWeight="600"
        >
          YOU
        </text>
        
        {/* Disposition nodes */}
        {nodes.map((node, i) => (
          <g key={`node-${i}`}>
            {/* Glow effect */}
            <circle
              cx={node.x}
              cy={node.y}
              r={node.radius + 4}
              fill="#6366f1"
              fillOpacity="0.15"
            />
            {/* Main node */}
            <circle
              cx={node.x}
              cy={node.y}
              r={node.radius}
              fill="#0a0a0f"
              stroke="#6366f1"
              strokeWidth="2"
            />
            {/* Label */}
            <text
              x={node.x}
              y={node.y + node.radius + 16}
              textAnchor="middle"
              fill="white"
              fontSize="9"
              fontWeight="500"
              opacity="0.7"
            >
              {node.label.toUpperCase()}
            </text>
            {/* Value inside node */}
            <text
              x={node.x}
              y={node.y + 4}
              textAnchor="middle"
              fill="#6366f1"
              fontSize="11"
              fontWeight="600"
            >
              {node.value}
            </text>
          </g>
        ))}
      </svg>
    </div>
  );
}

// Tutor Message Component
function TutorMessage({ message }: { message: string }) {
  return (
    <GlassCard className="p-5 border-l-2 border-l-[#6366f1]">
      <div className="flex items-start gap-4">
        <div className="w-10 h-10 rounded-full bg-[#6366f1]/20 flex items-center justify-center flex-shrink-0">
          <span className="text-[#6366f1] font-semibold">SJ</span>
        </div>
        <div>
          <div className="flex items-center gap-2 mb-2">
            <span className="text-[#6366f1] text-sm font-medium">Academic Advisor</span>
            <span className="text-[white]/30 text-xs">• Initial Assessment</span>
          </div>
          <p className="text-[white]/70 text-sm leading-relaxed italic">
            "{message}"
          </p>
        </div>
      </div>
    </GlassCard>
  );
}

// Course Card Component
function CourseCard({ 
  match, 
  isExpanded, 
  onToggle,
  isPinned,
  onTogglePin,
}: { 
  match: MatchData;
  isExpanded: boolean;
  onToggle: () => void;
  isPinned: boolean;
  onTogglePin: () => void;
}) {
  const [activeTab, setActiveTab] = useState<'vibe' | 'grind' | 'payoff'>('vibe');
  const friction = FRICTION_LABELS[match.friction] || FRICTION_LABELS.MODERATE;
  
  // Generate initials from university name
  const initials = match.course.university
    .split(' ')
    .filter(w => !['of', 'the', 'and'].includes(w.toLowerCase()))
    .slice(0, 2)
    .map(w => w[0])
    .join('')
    .toUpperCase();

  return (
    <GlassCard className={`overflow-hidden transition-all duration-300 ${isExpanded ? 'ring-1 ring-[#6366f1]/40' : ''}`}>
      {/* Header */}
      <div 
        className="p-5 cursor-pointer hover:bg-white/[0.02] transition-colors"
        onClick={onToggle}
      >
        <div className="flex items-start gap-4">
          {/* University badge */}
          <div className="w-14 h-14 rounded-xl bg-gradient-to-br from-[#6366f1]/30 to-[#6366f1]/10 flex items-center justify-center flex-shrink-0 border border-[#6366f1]/20">
            <span className="text-[#6366f1] font-bold text-sm">{initials}</span>
          </div>
          
          <div className="flex-1 min-w-0">
            <div className="flex items-start justify-between gap-3">
              <div className="min-w-0">
                <h3 className="text-[white] font-medium truncate">{match.course.course_name}</h3>
                <p className="text-[#6366f1]/60 text-sm truncate mt-0.5">{match.course.university}</p>
              </div>
              <div className="flex items-center gap-2 flex-shrink-0">
                <span 
                  className="text-xs px-3 py-1.5 rounded-full font-medium"
                  style={{ 
                    backgroundColor: `${friction.color}15`,
                    color: friction.color,
                    border: `1px solid ${friction.color}30`
                  }}
                >
                  {friction.label}
                </span>
                <button
                  onClick={(e) => { e.stopPropagation(); onTogglePin(); }}
                  className={`p-1.5 rounded-lg transition-colors ${
                    isPinned 
                      ? 'text-[#6366f1] bg-[#6366f1]/10' 
                      : 'text-[white]/20 hover:text-[#6366f1]/50 hover:bg-white/[0.03]'
                  }`}
                >
                  {isPinned ? '★' : '☆'}
                </button>
              </div>
            </div>
            
            {/* Quick stats row */}
            <div className="flex items-center gap-4 mt-3">
              <div className="flex items-center gap-1.5">
                <span className="text-[white]/30 text-xs">Match</span>
                <span className="text-[#6366f1] text-sm font-medium">{match.score}%</span>
              </div>
              {match.course.russell_group && (
                <span className="text-xs px-2 py-0.5 rounded-full bg-[#6366f1]/10 text-[#6366f1]/70 border border-[#6366f1]/20">
                  Russell Group
                </span>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Expanded Content */}
      {isExpanded && (
        <div className="border-t border-white/[0.06]">
          {/* Tabs */}
          <div className="flex border-b border-white/[0.06]">
            {(['vibe', 'grind', 'payoff'] as const).map((tab) => (
              <button
                key={tab}
                onClick={() => setActiveTab(tab)}
                className={`flex-1 py-3 text-xs font-semibold uppercase tracking-wider transition-colors relative ${
                  activeTab === tab 
                    ? 'text-[#6366f1]' 
                    : 'text-[white]/40 hover:text-[white]/60'
                }`}
              >
                {tab}
                {activeTab === tab && (
                  <div className="absolute bottom-0 left-0 right-0 h-0.5 bg-[#6366f1]" />
                )}
              </button>
            ))}
          </div>

          {/* Tab Content */}
          <div className="p-5">
            {activeTab === 'vibe' && (
              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div className="p-3 bg-white/[0.02] rounded-lg">
                    <p className="text-[white]/30 text-xs mb-1">Student Satisfaction</p>
                    <p className="text-[white] font-medium">
                      {match.course.nss_overall ? `${match.course.nss_overall}%` : 'N/A'}
                    </p>
                  </div>
                  <div className="p-3 bg-white/[0.02] rounded-lg">
                    <p className="text-[white]/30 text-xs mb-1">Vibe Bonus</p>
                    <p className="text-[#6366f1] font-medium">+{match.vibe_bonus}</p>
                  </div>
                </div>
                {match.course.russell_group && (
                  <div className="flex items-center gap-2 p-3 bg-[#6366f1]/5 rounded-lg border border-[#6366f1]/10">
                    <span className="text-[#6366f1]">✓</span>
                    <span className="text-[white]/70 text-sm">Russell Group university — research-intensive environment</span>
                  </div>
                )}
              </div>
            )}

            {activeTab === 'grind' && (
              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div className="p-3 bg-white/[0.02] rounded-lg">
                    <p className="text-[white]/30 text-xs mb-1">Cognitive Demand</p>
                    <p className="text-[white] font-medium">{match.cognitive_score}</p>
                  </div>
                  <div className="p-3 bg-white/[0.02] rounded-lg">
                    <p className="text-[white]/30 text-xs mb-1">Behavioural Fit</p>
                    <p className={`font-medium ${match.behavioral_penalty > 10 ? 'text-[#d4a55a]' : 'text-[#4ade80]'}`}>
                      {match.behavioral_penalty > 0 ? `-${match.behavioral_penalty}` : 'Aligned'}
                    </p>
                  </div>
                </div>
                <div className="p-3 bg-white/[0.02] rounded-lg">
                  <p className="text-[white]/30 text-xs mb-2">Friction Level</p>
                  <div className="flex items-center gap-3">
                    <div className="flex-1 h-2 bg-white/[0.06] rounded-full overflow-hidden">
                      <div 
                        className="h-full rounded-full transition-all"
                        style={{ 
                          width: `${match.friction === 'LOW' ? 20 : match.friction === 'MODERATE' ? 40 : match.friction === 'HIGH' ? 60 : match.friction === 'VERY_HIGH' ? 80 : 100}%`,
                          backgroundColor: friction.color
                        }}
                      />
                    </div>
                    <span className="text-[white]/50 text-xs">{friction.label}</span>
                  </div>
                </div>
              </div>
            )}

            {activeTab === 'payoff' && (
              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div className="p-4 bg-white/[0.02] rounded-lg text-center">
                    <p className="text-2xl font-bold text-[#4ade80] mb-1">
                      {match.course.employment_rate ? `${match.course.employment_rate}%` : 'N/A'}
                    </p>
                    <p className="text-[white]/30 text-xs uppercase tracking-wider">Employment Rate</p>
                  </div>
                  <div className="p-4 bg-white/[0.02] rounded-lg text-center">
                    <p className="text-2xl font-bold text-[#4ade80] mb-1">
                      {match.course.median_salary_5yr 
                        ? `£${(match.course.median_salary_5yr / 1000).toFixed(0)}k` 
                        : 'N/A'}
                    </p>
                    <p className="text-[white]/30 text-xs uppercase tracking-wider">Salary (5yr)</p>
                  </div>
                </div>
              </div>
            )}
          </div>

          {/* Actions */}
          <div className="px-5 pb-5 flex gap-3">
            <button className="flex-1 py-2.5 bg-[#6366f1] text-[#0a0a0f] rounded-xl text-sm font-semibold hover:bg-[#6366f1]/90 transition-colors">
              Shortlist
            </button>
            <button className="flex-1 py-2.5 bg-white/[0.05] text-[white]/70 rounded-xl text-sm font-medium border border-white/[0.08] hover:border-[#6366f1]/30 hover:text-[#6366f1] transition-colors">
              View on UCAS
            </button>
          </div>
        </div>
      )}
    </GlassCard>
  );
}

// Supercurricular Card Component
function SupercurricularCard({ item }: { item: Supercurricular }) {
  const icon = TYPE_ICONS[item.type] || '📚';
  
  return (
    <GlassCard className="p-4 hover:bg-white/[0.05] transition-colors" hover>
      <a 
        href={item.external_url || '#'} 
        target="_blank" 
        rel="noopener noreferrer"
        className="block"
      >
        <div className="flex items-start gap-3">
          <div className="w-10 h-10 rounded-lg bg-[#6366f1]/10 flex items-center justify-center flex-shrink-0">
            <span className="text-lg">{icon}</span>
          </div>
          <div className="flex-1 min-w-0">
            <p className="text-[#6366f1]/60 text-xs uppercase tracking-wider mb-1">{item.type.replace('_', ' ')}</p>
            <h4 className="text-[white] text-sm font-medium leading-snug">{item.title}</h4>
            {item.author && (
              <p className="text-[white]/40 text-xs mt-1">{item.author}</p>
            )}
          </div>
          <span className="text-[white]/20 text-sm">→</span>
        </div>
      </a>
    </GlassCard>
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
  const [miniSampleResults, setMiniSampleResults] = useState<MiniSampleResponse[]>([]);
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
          .select('benchmarks_completed, mini_samples_completed, scenarios_completed')
          .eq('id', sessionId)
          .single();
        setSession(sessionData);

        // Fetch mini-sample results for Early Indicators
        const { data: miniSampleData } = await supabase
          .from('bo_v1_mini_sample_responses')
          .select(`
            task_id,
            score,
            enjoyment_rating,
            career_fit_rating,
            bo_v1_mini_samples (meta_cluster, title)
          `)
          .eq('session_id', sessionId);
        if (miniSampleData) {
          // Transform the data to flatten the join result
          const transformed = miniSampleData.map((item: any) => ({
            task_id: item.task_id,
            score: item.score,
            enjoyment_rating: item.enjoyment_rating,
            career_fit_rating: item.career_fit_rating,
            bo_v1_mini_samples: Array.isArray(item.bo_v1_mini_samples)
              ? item.bo_v1_mini_samples[0]
              : item.bo_v1_mini_samples
          }));
          setMiniSampleResults(transformed);
        }

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
              .select('id, type, title, author, external_url, description')
              .in('primary_cluster', topClusters)
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

  // Loading state
  if (loading) {
    return (
      <main className="min-h-screen bg-[#0a0a0f] flex items-center justify-center">
        <div className="text-center">
          <div className="w-8 h-8 border-2 border-[#6366f1]/30 border-t-[#6366f1] rounded-full animate-spin mx-auto mb-4" />
          <p className="text-[white]/40 text-sm">Loading your results...</p>
        </div>
      </main>
    );
  }

  // Error state
  if (error || !profile) {
    return (
      <main className="min-h-screen bg-[#0a0a0f] flex items-center justify-center">
        <GlassCard className="p-8 text-center max-w-sm">
          <p className="text-[white]/60 mb-4">Results not found</p>
          <a 
            href="/" 
            className="inline-block px-6 py-2 bg-[#6366f1] text-[#0a0a0f] rounded-lg font-medium hover:bg-[#6366f1]/90 transition-colors"
          >
            Start again
          </a>
        </GlassCard>
      </main>
    );
  }

  const familiar = getFamiliarById(profile.familiar_id as any);
  const guild = getGuildById(profile.guild_id as any);
  const confidence = calculateConfidenceGrade(session, capacityResults);
  const level = profile.level || Math.floor((profile.total_xp || 0) / 1000) + 1;
  const tutorMessage = generateTutorMessage(profile);
  const displayedCourses = showAllCourses ? matches : matches.slice(0, 6);

  const completedBenchmarks = {
    vrb: (capacityResults?.vrb_items_completed || 0) >= 12,
    qnt: (capacityResults?.qnt_items_completed || 0) >= 12,
    spd: (capacityResults?.spd_items_completed || 0) >= 12,
  };
  const benchmarkCount = Object.values(completedBenchmarks).filter(Boolean).length;

  return (
    <main className="min-h-screen bg-[#0a0a0f]">
      {/* Background effects */}
      <div className="fixed inset-0 pointer-events-none">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-[#6366f1]/5 rounded-full blur-[100px]" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-[#6366f1]/5 rounded-full blur-[100px]" />
      </div>
      
      {/* Nav */}
      <nav className="relative z-10 flex justify-between items-center px-6 py-4 border-b border-white/[0.06]">
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 rounded-lg bg-[#6366f1]/20 flex items-center justify-center border border-[#6366f1]/30">
            <span className="text-[#6366f1] font-bold text-sm">E</span>
          </div>
          <span className="text-[white] font-semibold">ExamRizz Arena</span>
        </div>
        <div className="flex items-center gap-6">
          <button 
            onClick={() => navigator.clipboard.writeText(window.location.href)}
            className="text-[white]/50 hover:text-[#6366f1] text-sm transition-colors"
          >
            Share Results
          </button>
          <a href="/" className="text-[white]/50 hover:text-[#6366f1] text-sm transition-colors">
            New Assessment
          </a>
        </div>
      </nav>

      {/* Main Grid */}
      <div className="relative z-10 grid grid-cols-1 lg:grid-cols-[280px_1fr_280px] gap-6 p-6 max-w-[1600px] mx-auto">
        
        {/* ========== LEFT SIDEBAR ========== */}
        <aside className="space-y-5 lg:sticky lg:top-6 lg:self-start">
          
          {/* Confidence Grade */}
          <GlassCard className="p-5">
            <div className="flex items-center justify-between mb-4">
              <span className="text-[white]/40 text-xs uppercase tracking-wider">Match Confidence</span>
              <div 
                className="w-12 h-12 rounded-xl flex items-center justify-center text-xl font-bold"
                style={{ backgroundColor: `${confidence.color}15`, color: confidence.color }}
              >
                {confidence.grade}
              </div>
            </div>
            <div className="h-2 bg-white/[0.06] rounded-full overflow-hidden mb-3">
              <div 
                className="h-full rounded-full transition-all duration-700"
                style={{ width: `${confidence.percentage}%`, backgroundColor: confidence.color }}
              />
            </div>
            <p className="text-[white]/40 text-xs mb-4">{confidence.message}</p>
            {confidence.grade !== 'A' && (
              <button
                onClick={handleTakeBenchmark}
                className="w-full py-2.5 text-[#6366f1] text-sm font-medium border border-[#6366f1]/30 rounded-xl hover:bg-[#6366f1]/10 transition-colors"
              >
                Improve Grade
              </button>
            )}
          </GlassCard>

          {/* Profile Card - with locked state at low precision */}
          <GlassCard className="p-5">
            <div className="flex flex-col items-center text-center">
              {(profile.precision_score || 40) >= 70 ? (
                <>
                  <div className="w-20 h-20 rounded-2xl bg-gradient-to-br from-[#6366f1]/20 to-[#6366f1]/5 border border-[#6366f1]/20 flex items-center justify-center mb-4">
                    <span className="text-4xl">🎓</span>
                  </div>
                  <h3 className="text-[white] font-semibold text-lg">{familiar?.name || 'Scholar'}</h3>
                  <p className="text-[#6366f1]/60 text-sm mt-1">{familiar?.tagline || 'Knowledge Seeker'}</p>
                  <div className="mt-4 px-3 py-1.5 bg-[#6366f1]/10 rounded-full border border-[#6366f1]/20">
                    <span className="text-[#6366f1] text-xs font-medium">Level {level}</span>
                  </div>
                </>
              ) : (
                <>
                  <div className="w-20 h-20 rounded-2xl bg-white/[0.03] border border-white/[0.08] flex items-center justify-center mb-4 relative">
                    <span className="text-4xl opacity-30 blur-sm">🎓</span>
                    <div className="absolute inset-0 flex items-center justify-center">
                      <span className="text-2xl">🔒</span>
                    </div>
                  </div>
                  <h3 className="text-[white]/50 font-semibold text-lg">Familiar Locked</h3>
                  <p className="text-[white]/30 text-sm mt-1">Reach 70% precision to unlock</p>
                  <div className="mt-4 px-3 py-1.5 bg-white/[0.03] rounded-full border border-white/[0.08]">
                    <span className="text-[white]/30 text-xs font-medium">{profile.precision_score || 40}% precision</span>
                  </div>
                </>
              )}
            </div>
          </GlassCard>

          {/* Benchmarks Progress */}
          <GlassCard className="p-5">
            <div className="flex items-center justify-between mb-4">
              <span className="text-[white]/40 text-xs uppercase tracking-wider">Benchmarks</span>
              <span className="text-[#6366f1] text-sm font-medium">{benchmarkCount}/3</span>
            </div>
            <div className="space-y-2">
              {[
                { id: 'vrb', label: 'Verbal', done: completedBenchmarks.vrb },
                { id: 'qnt', label: 'Quantitative', done: completedBenchmarks.qnt },
                { id: 'spd', label: 'Processing Speed', done: completedBenchmarks.spd },
              ].map((b) => (
                <div 
                  key={b.id}
                  className={`flex items-center justify-between py-2.5 px-3 rounded-lg transition-colors ${
                    b.done ? 'bg-[#6366f1]/10 border border-[#6366f1]/20' : 'bg-white/[0.02]'
                  }`}
                >
                  <span className={`text-sm ${b.done ? 'text-[#6366f1]' : 'text-[white]/40'}`}>
                    {b.label}
                  </span>
                  {b.done ? (
                    <span className="text-[#4ade80] text-sm">✓</span>
                  ) : (
                    <span className="text-[white]/20 text-xs">Pending</span>
                  )}
                </div>
              ))}
            </div>
          </GlassCard>

          {/* Sharpening CTAs */}
          <SharpeningCTAs precisionScore={profile.precision_score || 40} />
        </aside>

        {/* ========== MAIN CONTENT ========== */}
        <div className="space-y-6">
          
          {/* Constellation + Tutor Message */}
          <GlassCard className="p-6">
            <p className="text-[#6366f1]/60 text-xs uppercase tracking-wider mb-2">Disposition Profile</p>
            <h2 className="text-2xl text-[white] font-light mb-6">
              The <span className="text-[#6366f1] font-medium">{guild?.name?.replace('The ', '') || 'Scholar'}</span>
            </h2>
            
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 items-center">
              <ConstellationMap profile={profile} />
              <div className="space-y-4">
                {DISPOSITION_CONFIG.map((d) => (
                  <div key={d.key}>
                    <div className="flex justify-between text-xs mb-1.5">
                      <span className="text-[white]/60">{d.label}</span>
                      <span className="text-[#6366f1]">{(profile as any)[d.key]}</span>
                    </div>
                    <div className="h-1.5 bg-white/[0.06] rounded-full overflow-hidden">
                      <div 
                        className="h-full bg-[#6366f1] rounded-full transition-all duration-500"
                        style={{ width: `${(profile as any)[d.key]}%` }}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </GlassCard>

          {/* Tutor Message */}
          <TutorMessage message={tutorMessage} />

          {/* Early Indicators from Mini-Samples */}
          <EarlyIndicators miniSampleResults={miniSampleResults} />

          {/* Course Matches */}
          <div>
            <div className="flex items-center justify-between mb-4 px-1">
              <div>
                <h2 className="text-[white] font-semibold text-lg">Course Matches</h2>
                <p className="text-[white]/40 text-sm mt-0.5">{matches.length} courses matched to your profile</p>
              </div>
            </div>
            
            <div className="space-y-4">
              {displayedCourses.map((match, idx) => (
                <CourseCard
                  key={match.course.id}
                  match={match}
                  isExpanded={expandedCourse === idx}
                  onToggle={() => setExpandedCourse(expandedCourse === idx ? null : idx)}
                  isPinned={pinnedCourses.includes(match.course.id)}
                  onTogglePin={() => togglePin(match.course.id)}
                />
              ))}
            </div>

            {matches.length > 6 && (
              <button
                onClick={() => setShowAllCourses(!showAllCourses)}
                className="mt-5 w-full py-3 text-[#6366f1] text-sm font-medium border border-[#6366f1]/20 rounded-xl hover:bg-[#6366f1]/5 transition-colors"
              >
                {showAllCourses ? 'Show fewer courses' : `Show ${matches.length - 6} more courses`}
              </button>
            )}
          </div>

          {/* Supercurriculars */}
          {supercurriculars.length > 0 && (
            <div>
              <div className="mb-4 px-1">
                <h2 className="text-[white] font-semibold text-lg">Recommended Activities</h2>
                <p className="text-[white]/40 text-sm mt-0.5">Build your application with these resources</p>
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {supercurriculars.map((item) => (
                  <SupercurricularCard key={item.id} item={item} />
                ))}
              </div>
            </div>
          )}
        </div>

        {/* ========== RIGHT SIDEBAR ========== */}
        <aside className="space-y-5 lg:sticky lg:top-6 lg:self-start">
          
          {/* Pinned Courses */}
          <GlassCard className="p-5">
            <p className="text-[white]/40 text-xs uppercase tracking-wider mb-4">Pinned Courses</p>
            {pinnedCourses.length > 0 ? (
              <div className="space-y-3">
                {matches
                  .filter(m => pinnedCourses.includes(m.course.id))
                  .map(m => (
                    <div 
                      key={m.course.id}
                      className="p-3 bg-white/[0.03] rounded-lg border border-white/[0.06]"
                    >
                      <p className="text-[white] text-sm font-medium truncate">{m.course.course_name}</p>
                      <p className="text-[#6366f1]/50 text-xs truncate mt-1">{m.course.university}</p>
                    </div>
                  ))
                }
              </div>
            ) : (
              <div className="text-center py-8">
                <p className="text-[white]/20 text-sm">Star courses to pin them here</p>
              </div>
            )}
          </GlassCard>

          {/* Top 3 Matches */}
          <GlassCard className="p-5">
            <p className="text-[white]/40 text-xs uppercase tracking-wider mb-4">Top Matches</p>
            <div className="space-y-3">
              {matches.slice(0, 3).map((m, i) => {
                const friction = FRICTION_LABELS[m.friction] || FRICTION_LABELS.MODERATE;
                return (
                  <div 
                    key={m.course.id}
                    className="flex items-center gap-3 p-3 bg-white/[0.02] rounded-lg"
                  >
                    <span 
                      className="w-6 h-6 rounded-full flex items-center justify-center text-xs font-bold"
                      style={{ backgroundColor: `${friction.color}20`, color: friction.color }}
                    >
                      {i + 1}
                    </span>
                    <div className="flex-1 min-w-0">
                      <p className="text-[white]/80 text-sm font-medium truncate">{m.course.course_name}</p>
                      <p className="text-[white]/30 text-xs truncate">{m.course.university}</p>
                    </div>
                  </div>
                );
              })}
            </div>
          </GlassCard>

          {/* Quick Actions */}
          <GlassCard className="p-5">
            <p className="text-[white]/40 text-xs uppercase tracking-wider mb-4">Actions</p>
            <div className="space-y-2">
              <button 
                onClick={() => navigator.clipboard.writeText(window.location.href)}
                className="w-full py-2.5 text-[white]/60 text-sm bg-white/[0.03] rounded-lg hover:bg-white/[0.06] transition-colors text-left px-4"
              >
                📋 Copy results link
              </button>
              <button className="w-full py-2.5 text-[white]/60 text-sm bg-white/[0.03] rounded-lg hover:bg-white/[0.06] transition-colors text-left px-4">
                📄 Export as PDF
              </button>
              <button className="w-full py-2.5 text-[white]/60 text-sm bg-white/[0.03] rounded-lg hover:bg-white/[0.06] transition-colors text-left px-4">
                🔄 Retake assessment
              </button>
            </div>
          </GlassCard>
        </aside>
      </div>
    </main>
  );
}