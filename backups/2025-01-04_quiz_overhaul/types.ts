// ExamRizz Arena v6.2 - TypeScript Types

export type CognitiveDimension = 
  | 'calibration' 
  | 'tolerance' 
  | 'transfer' 
  | 'precision' 
  | 'retrieval' 
  | 'receptivity';

export type BehavioralDimension = 
  | 'structure' 
  | 'consistency' 
  | 'social' 
  | 'depth';

export type Dimension = CognitiveDimension | BehavioralDimension;

export type Capacity = 'vrb' | 'qnt' | 'spd';

export type Importance = 'CRITICAL' | 'IMPORTANT' | 'BENEFICIAL';

export type Friction = 'LOW' | 'MODERATE' | 'HIGH' | 'VERY_HIGH' | 'EXTREME';

export type Provenance = 'MEASURED' | 'PROXIED' | 'PRIOR';

export type QuestionTier = 'CORE' | 'EXTENDED' | 'DEEP' | 'EXPERT';

export type SwipeDirection = 'LEFT' | 'RIGHT' | 'SKIP';

export type FamiliarRarity = 'COMMON' | 'RARE' | 'LEGENDARY';

export type GuildId = 'FORGE' | 'FLOW' | 'FORCE' | 'FOUNDATION';

export type CourseVariant = 'STANDARD' | 'SANDWICH' | 'YEAR_ABROAD' | 'JOINT_HONOURS';

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

export interface DispositionScore {
  value: number;
  sigma: number;
}

export interface CapacityScore {
  value: number;
  sigma: number;
  provenance: Provenance;
}

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

export interface CapacityProfile {
  vrb: CapacityScore;
  qnt: CapacityScore;
  spd: CapacityScore;
}

export interface Course {
  // Identifiers
  id: string;
  ukprn?: string;
  kis_course_id?: string;
  ucas_code?: string;
  course_url?: string;
  
  // Basic info
  university: string;
  course_name: string;
  degree_type?: string;
  duration_years?: number;
  study_mode?: string;
  
  // Classification
  cah_code?: string;
  subject_area?: string;
  subject_tags: string[];
  region?: string;
  
  // Quality indicators
  russell_group?: boolean;
  accredited?: boolean;
  
  // Course variants
  sandwich?: boolean;
  year_abroad?: boolean;
  foundation?: boolean;
  
  // Outcome data (HESA)
  nss_overall?: number;
  nss_teaching?: number;
  nss_feedback?: number;
  employment_rate?: number;
  continuation_rate?: number;
  median_salary_3yr?: number;
  median_salary_5yr?: number;
  
  // Teaching structure (HESA)
  assessment_exam_pct?: number;
  assessment_coursework_pct?: number;
  assessment_practical_pct?: number;
  scheduled_hours?: number;
  
  // Entry requirements
  typical_offer?: string;
  ucas_points?: number;
  
  // Disposition demands (0-100)
  demand_calibration: number;
  demand_tolerance: number;
  demand_transfer: number;
  demand_precision: number;
  demand_retrieval: number;
  demand_receptivity: number;
  demand_structure: number;
  demand_consistency: number;
  demand_social: number;
  demand_depth: number;
  
  // Importance levels
  importance_calibration: Importance;
  importance_tolerance: Importance;
  importance_transfer: Importance;
  importance_precision: Importance;
  importance_retrieval: Importance;
  importance_receptivity: Importance;
  
  // Metadata
  derivation_confidence?: number;
  data_completeness?: number;
  is_active?: boolean;
  
  // Allow additional fields from DB
  [key: string]: any;
}

export interface MatchResult {
  course: Course;
  score: number;
  friction: Friction;
  cognitive_score: number;
  behavioral_penalty: number;
  vibe_bonus: number;
  quality_bonus: number;
  rank: number;
}

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

// User preferences (for filtering and boosting)
export interface UserPreferences {
  // Vibe tags (from swiper, editable)
  vibe_tags: string[];
  
  // Entry requirements
  ucas_points_estimate?: number;
  a_level_grades?: string[];
  
  // University preferences
  target_universities?: string[];
  excluded_universities?: string[];
  preferred_regions?: string[];
  
  // Course variant preferences
  include_sandwich?: boolean;
  include_year_abroad?: boolean;
  include_foundation?: boolean;
  
  // Study mode
  study_mode?: 'full-time' | 'part-time' | 'both';
  
  // Quality filters
  min_nss_overall?: number;
  min_employment_rate?: number;
  russell_group_only?: boolean;
}

export const COGNITIVE_DIMENSIONS: CognitiveDimension[] = [
  'calibration', 'tolerance', 'transfer', 'precision', 'retrieval', 'receptivity'
];

export const BEHAVIORAL_DIMENSIONS: BehavioralDimension[] = [
  'structure', 'consistency', 'social', 'depth'
];

export const IMPORTANCE_WEIGHTS: Record<Importance, number> = {
  CRITICAL: 1.0,
  IMPORTANT: 0.6,
  BENEFICIAL: 0.3
};

export const SIGMA_BY_TIER: Record<QuestionTier | 'NONE', number> = {
  NONE: 25,
  CORE: 15,
  EXTENDED: 10,
  DEEP: 6,
  EXPERT: 3
};

// Quality bonus thresholds
export const QUALITY_THRESHOLDS = {
  NSS_HIGH: 80,
  EMPLOYMENT_HIGH: 90,
  SALARY_HIGH: 30000,
  CONTINUATION_LOW: 85,  // Below this suggests difficulty
};

// Quality bonus values (percentage points added to score)
export const QUALITY_BONUSES = {
  RUSSELL_GROUP: 5,
  NSS_HIGH: 3,
  EMPLOYMENT_HIGH: 2,
  SALARY_HIGH: 2,
};
