// ExamRizz Arena v9 - TypeScript Types (Overhauled Jan 4, 2025)

// ============================================================================
// DISPOSITIONS (10 dimensions measured via 20 forced-choice scenarios)
// ============================================================================

export type Disposition =
  | 'social'
  | 'receptivity'
  | 'transfer'
  | 'structure'
  | 'depth'
  | 'tolerance'
  | 'precision'
  | 'calibration'
  | 'retrieval'
  | 'consistency';

export const ALL_DISPOSITIONS: Disposition[] = [
  'social',
  'receptivity',
  'transfer',
  'structure',
  'depth',
  'tolerance',
  'precision',
  'calibration',
  'retrieval',
  'consistency',
];

// ============================================================================
// META-CLUSTERS (6 clusters measured via mini-sample tasks)
// ============================================================================

export type MetaCluster =
  | 'STEM_TECH'
  | 'STEM_SCI'
  | 'HUMANITIES'
  | 'SOCIAL_SCI'
  | 'PROFESSIONAL'
  | 'CREATIVE';

export const ALL_META_CLUSTERS: MetaCluster[] = [
  'STEM_TECH',
  'STEM_SCI',
  'HUMANITIES',
  'SOCIAL_SCI',
  'PROFESSIONAL',
  'CREATIVE',
];

// ============================================================================
// VIBE SWIPER (6 paired comparisons)
// ============================================================================

export interface VibePair {
  id: string;
  pair_number: number;
  dimension: 'environment' | 'teaching_style' | 'subject_lean' | 'focus' | 'assessment' | 'work_mode';
  option_a: {
    title: string;
    description: string;
    image_url: string;
    tags: string[];
  };
  option_b: {
    title: string;
    description: string;
    image_url: string;
    tags: string[];
  };
  active: boolean;
}

export interface VibeChoice {
  pair_id: string;
  option_chosen: 'A' | 'B';
  response_time_ms?: number;
}

export interface VibeProfile {
  environment: 'CAMPUS' | 'CITY' | 'NEUTRAL';
  teaching_style: 'LECTURE' | 'SEMINAR' | 'MIXED';
  subject_lean: 'STEM' | 'HUMANITIES' | 'MIXED';
  focus: 'THEORETICAL' | 'VOCATIONAL' | 'BALANCED';
  assessment: 'EXAM_HEAVY' | 'COURSEWORK_HEAVY' | 'MIXED';
  work_mode: 'INDEPENDENT' | 'COLLABORATIVE' | 'FLEXIBLE';
}

// Legacy support (single card swipe format - deprecated)
export type SwipeDirection = 'LEFT' | 'RIGHT' | 'SKIP';

export interface VibeCard {
  id: string;
  image_url: string;
  alt_text: string;
  right_tags: string[];
  left_tags: string[];
  disposition_nudge?: {
    dimension: string;
    right_delta: number;
    left_delta: number;
  };
  sort_order: number;
  active: boolean;
}

export interface VibeSwipe {
  card_id: string;
  direction: SwipeDirection;
}

// ============================================================================
// FORCED-CHOICE SCENARIOS (20 items, slider 0-100)
// ============================================================================

export interface Scenario {
  id: string;
  dimension: Disposition;
  scenario_context: string;
  option_a: string;
  option_b: string;
  a_indicates: 'high' | 'low';
  b_indicates: 'high' | 'low';
  sort_order: number;
  active: boolean;
}

export interface ScenarioResponse {
  scenario_id: string;
  position: number; // 0-100 slider position
  response_time_ms?: number;
}

// Slider scoring bands
export type SliderBand =
  | 'STRONG_A'    // 0-15
  | 'MODERATE_A'  // 16-35
  | 'LEAN_A'      // 36-50
  | 'LEAN_B'      // 51-65
  | 'MODERATE_B'  // 66-85
  | 'STRONG_B';   // 86-100

export function getSliderBand(position: number): SliderBand {
  if (position <= 15) return 'STRONG_A';
  if (position <= 35) return 'MODERATE_A';
  if (position <= 50) return 'LEAN_A';
  if (position <= 65) return 'LEAN_B';
  if (position <= 85) return 'MODERATE_B';
  return 'STRONG_B';
}

// ============================================================================
// MINI-SAMPLE TASKS (6 tasks, one per meta-cluster)
// ============================================================================

export type MiniSampleTaskType = 'MCQ' | 'SHORT_RESPONSE';

export interface MiniSampleTask {
  id: string;
  meta_cluster: MetaCluster;
  task_type: MiniSampleTaskType;
  title: string;
  stimulus: string;
  question: string;
  options?: string[];           // For MCQ
  correct_answer?: number;      // For MCQ (0-indexed option)
  grading_criteria?: string[];  // For SHORT_RESPONSE
  time_limit_seconds: number;   // Default 90
  sort_order: number;
  active: boolean;
}

export type EnjoymentRating = -1 | 0 | 1; // Hated / Fine / Loved

export interface MiniSampleResponse {
  task_id: string;
  response: string | number;    // MCQ option index or text response
  score: number;                // 0-3 scale
  time_taken_seconds: number;
  enjoyment_rating: EnjoymentRating;
  career_fit_rating: EnjoymentRating;
}

export interface EnjoymentProfile {
  STEM_TECH: EnjoymentRating;
  STEM_SCI: EnjoymentRating;
  HUMANITIES: EnjoymentRating;
  SOCIAL_SCI: EnjoymentRating;
  PROFESSIONAL: EnjoymentRating;
  CREATIVE: EnjoymentRating;
}

// ============================================================================
// PATHWAY INFERENCE
// ============================================================================

export type Pathway =
  | 'Healthcare'
  | 'Pure STEM'
  | 'Arts & Humanities'
  | 'Design & Architecture'
  | 'Law & Professional'
  | 'Quantitative Social Science'
  | null;

// ============================================================================
// DISPOSITION SCORES
// ============================================================================

export interface DispositionScore {
  value: number;   // 0-100 scale
  sigma: number;   // Uncertainty (lower = more confident)
}

export interface DispositionProfile {
  social: DispositionScore;
  receptivity: DispositionScore;
  transfer: DispositionScore;
  structure: DispositionScore;
  depth: DispositionScore;
  tolerance: DispositionScore;
  precision: DispositionScore;
  calibration: DispositionScore;
  retrieval: DispositionScore;
  consistency: DispositionScore;
}

// ============================================================================
// CAPACITIES (proxied from dispositions in MVP)
// ============================================================================

export type Capacity = 'vrb' | 'qnt' | 'spd';

export type Provenance = 'MEASURED' | 'PROXIED' | 'PRIOR';

export interface CapacityScore {
  value: number;
  sigma: number;
  provenance: Provenance;
}

export interface CapacityProfile {
  vrb: CapacityScore;
  qnt: CapacityScore;
  spd: CapacityScore;
}

// ============================================================================
// COURSE MATCHING
// ============================================================================

export type Importance = 'CRITICAL' | 'IMPORTANT' | 'BENEFICIAL';
export type Friction = 'LOW' | 'MODERATE' | 'HIGH' | 'VERY_HIGH' | 'EXTREME';

export interface Course {
  id: string;
  ukprn?: string;
  kis_course_id?: string;
  ucas_code?: string;
  course_url?: string;

  university: string;
  course_name: string;
  degree_type?: string;
  duration_years?: number;
  study_mode?: string;

  cah_code?: string;
  subject_area?: string;
  subject_tags: string[];
  region?: string;

  russell_group?: boolean;
  accredited?: boolean;

  sandwich?: boolean;
  year_abroad?: boolean;
  foundation?: boolean;

  nss_overall?: number;
  nss_teaching?: number;
  nss_feedback?: number;
  employment_rate?: number;
  continuation_rate?: number;
  median_salary_3yr?: number;
  median_salary_5yr?: number;

  assessment_exam_pct?: number;
  assessment_coursework_pct?: number;
  assessment_practical_pct?: number;
  scheduled_hours?: number;

  typical_offer?: string;
  ucas_points?: number;

  // Disposition demands (0-100)
  demand_social: number;
  demand_receptivity: number;
  demand_transfer: number;
  demand_structure: number;
  demand_depth: number;
  demand_tolerance: number;
  demand_precision: number;
  demand_calibration: number;
  demand_retrieval: number;
  demand_consistency: number;

  derivation_confidence?: number;
  data_completeness?: number;
  is_active?: boolean;

  [key: string]: any;
}

export interface MatchResult {
  course: Course;
  score: number;
  friction: Friction;
  enjoyment_score: number;
  disposition_score: number;
  quality_bonus: number;
  pathway_bonus: number;
  vibe_bonus: number;
  rank: number;
  reasons: string[];
  challenges: string[];
}

// ============================================================================
// GAMIFICATION (deferred for MVP)
// ============================================================================

export type FamiliarRarity = 'COMMON' | 'RARE' | 'LEGENDARY';
export type GuildId = 'FORGE' | 'FLOW' | 'FORCE' | 'FOUNDATION';

export interface Familiar {
  id: string;
  name: string;
  element: string;
  tagline: string;
  rarity: FamiliarRarity;
  rarity_percent: number;
  disposition_bias: string[];
  description: string;
  stage_names: string[];
}

export interface Guild {
  id: GuildId;
  name: string;
  motto: string;
  description: string;
  formula: Record<string, number>;
  color_primary: string;
  color_secondary: string;
}

// ============================================================================
// LEGACY COMPATIBILITY TYPES (for matching.ts and identity.ts)
// ============================================================================

// Cognitive dispositions (subset of all 10)
export type CognitiveDimension =
  | 'calibration'
  | 'tolerance'
  | 'transfer'
  | 'precision'
  | 'retrieval'
  | 'receptivity';

export const COGNITIVE_DIMENSIONS: CognitiveDimension[] = [
  'calibration',
  'tolerance',
  'transfer',
  'precision',
  'retrieval',
  'receptivity',
];

// Behavioral dispositions (subset of all 10)
export type BehavioralDimension = 'structure' | 'consistency' | 'social' | 'depth';

export const BEHAVIORAL_DIMENSIONS: BehavioralDimension[] = [
  'structure',
  'consistency',
  'social',
  'depth',
];

// Combined dimension type
export type Dimension = CognitiveDimension | BehavioralDimension;

// Profile types for matching algorithm
export interface CognitiveProfile {
  calibration: DispositionScore;
  tolerance: DispositionScore;
  transfer: DispositionScore;
  precision: DispositionScore;
  retrieval: DispositionScore;
  receptivity: DispositionScore;
}

export interface BehavioralProfile {
  structure: DispositionScore;
  consistency: DispositionScore;
  social: DispositionScore;
  depth: DispositionScore;
}

// ============================================================================
// CONSTANTS
// ============================================================================

export const IMPORTANCE_WEIGHTS: Record<Importance, number> = {
  CRITICAL: 1.0,
  IMPORTANT: 0.6,
  BENEFICIAL: 0.3,
};

export const QUALITY_THRESHOLDS = {
  NSS_HIGH: 80,
  EMPLOYMENT_HIGH: 90,
  SALARY_HIGH: 30000,
  CONTINUATION_LOW: 85,
};

export const QUALITY_BONUSES = {
  RUSSELL_GROUP: 15,
  NSS_HIGH: 2,
  EMPLOYMENT_HIGH: 3,
  SALARY_HIGH: 2,
};

export const PATHWAY_BONUS = 15;

// Sigma values by tier (uncertainty)
export const SIGMA_BY_TIER = {
  NONE: 25,
  CORE: 15,
  EXTENDED: 10,
  DEEP: 6,
  EXPERT: 3,
};
