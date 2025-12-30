// ============================================================================
// EXPERIENTIAL TASKS - TYPE DEFINITIONS
// ============================================================================
// 
// These types define the structure of experiential tasks - career-anchored
// mini-challenges that measure OBJECTIVE PERFORMANCE (can you do this?)
// plus SUBJECTIVE EXPERIENCE (did you enjoy it? how hard did it feel?).
//
// Unlike disposition questions (which ask "do you prefer X?"), these tasks
// actually make you DO something and measure how well you did it.
//
// COPY THIS ENTIRE FILE'S CONTENTS AND ADD TO YOUR src/lib/types.ts
// (or keep as separate file and import where needed)
// ============================================================================


// ----------------------------------------------------------------------------
// TASK TYPES - What kind of challenge is this?
// ----------------------------------------------------------------------------
// Each task type has different UI, different inputs, different scoring.
// When rendering a task, you check task_type to know which component to show.

export type ExperientialTaskType =
  | 'PROOFREAD'       // Find errors in text (tests PRECISION)
  | 'ESTIMATION'      // Guess quantities without calculating (tests CALIBRATION)
  | 'CATEGORISATION'  // Sort items into groups (tests TRANSFER/pattern recognition)
  | 'PRIORITISATION'  // Rank items by importance (tests judgement)
  | 'PATTERN'         // Find the pattern in sequences (tests QNT/logic)
  | 'DATA_INTERPRET'  // Extract meaning from charts/tables (tests analysis)
  | 'SCENARIO_JUDGE'; // Make decisions in realistic scenarios (tests reasoning)


// ----------------------------------------------------------------------------
// DIFFICULTY TIERS - How hard is this task?
// ----------------------------------------------------------------------------
// Used to serve appropriate tasks based on user's profile.
// Mandatory flow uses FOUNDATION/INTERMEDIATE, optional uses all.

export type ExperientialDifficultyTier =
  | 'FOUNDATION'    // Anyone can attempt (GCSE level)
  | 'INTERMEDIATE'  // Requires some knowledge (A-level)
  | 'ADVANCED'      // Challenging (early undergrad)
  | 'EXPERT';       // Very difficult (specialist)


// ----------------------------------------------------------------------------
// SCORING METHODS - How do we calculate the score?
// ----------------------------------------------------------------------------
// Different task types need different scoring approaches.
// The scoring function checks this to know which algorithm to use.

export type ExperientialScoringMethod =
  | 'COUNT_CORRECT'      // Simple: how many right answers?
  | 'ACCURACY_WEIGHTED'  // Partial credit: closer = more points
  | 'RANK_CORRELATION'   // How similar is your ranking to ideal?
  | 'CATEGORICAL_MATCH'  // Did you put items in the right categories?
  | 'PROXIMITY_BANDS'    // How close to target value?
  | 'RUBRIC_BASED';      // Multi-criteria scoring


// ----------------------------------------------------------------------------
// STIMULUS TYPES - What does the user see/interact with?
// ----------------------------------------------------------------------------
// The "stimulus" field in a task is JSONB - it can hold different structures
// depending on task_type. These types define those structures.

/**
 * PROOFREAD stimulus: Text with hidden errors
 * User clicks on words they think are wrong
 */
export interface ProofreadStimulus {
  text: string;                    // The passage to proofread
  errors: {
    position: number;              // Character index where error starts
    length: number;                // How many characters the error spans
    error_type: 'spelling' | 'grammar' | 'punctuation' | 'word_choice';
    explanation?: string;          // Shown after task (optional)
  }[];
}

/**
 * ESTIMATION stimulus: Question requiring numerical estimate
 * User enters their best guess without calculating
 */
export interface EstimationStimulus {
  question: string;                // "How many piano tuners in London?"
  context?: string;                // Additional info (optional)
  unit: string;                    // "people", "£", "km", etc.
  actual_value: number;            // The correct answer
  acceptable_range: {              // For scoring bands
    perfect: number;               // Within this % = full marks
    good: number;                  // Within this % = partial marks
    acceptable: number;            // Within this % = minimal marks
  };
}

/**
 * CATEGORISATION stimulus: Items to sort into groups
 * User drags items into category buckets
 */
export interface CategorisationStimulus {
  items: {
    id: string;
    label: string;
    correct_category: string;      // Which bucket it belongs in
  }[];
  categories: {
    id: string;
    label: string;
    description?: string;
  }[];
}

/**
 * PRIORITISATION stimulus: Items to rank in order
 * User drags to reorder from most to least important
 */
export interface PrioritisationStimulus {
  scenario: string;                // Context explaining what to prioritise
  items: {
    id: string;
    label: string;
    correct_rank: number;          // 1 = highest priority
  }[];
  criteria?: string;               // "by urgency", "by impact", etc.
}

/**
 * PATTERN stimulus: Sequence with missing element
 * User identifies the pattern and predicts next item
 */
export interface PatternStimulus {
  sequence: (number | string)[];   // The visible elements
  missing_position: number;        // Which index is hidden
  options: (number | string)[];    // Multiple choice answers
  correct_answer: number | string;
  pattern_type: 'arithmetic' | 'geometric' | 'logical' | 'visual';
}

/**
 * DATA_INTERPRET stimulus: Chart/table with questions
 * User answers questions about the data
 */
export interface DataInterpretStimulus {
  data_type: 'table' | 'bar_chart' | 'line_chart' | 'pie_chart';
  data: Record<string, any>;       // The actual data to display
  questions: {
    id: string;
    question: string;
    type: 'multiple_choice' | 'numeric' | 'comparison';
    options?: string[];            // For multiple choice
    correct_answer: string | number;
  }[];
}

/**
 * SCENARIO_JUDGE stimulus: Realistic situation with decision
 * User chooses best course of action
 */
export interface ScenarioJudgeStimulus {
  scenario: string;                // The situation description
  role: string;                    // "You are a junior doctor..."
  options: {
    id: string;
    text: string;
    score: number;                 // How good is this choice (0-100)
    feedback?: string;             // Explain why (shown after)
  }[];
  allow_multiple?: boolean;        // Can select multiple options?
}

/**
 * Union type for any stimulus - use this when you don't know the task type
 */
export type ExperientialStimulus =
  | ProofreadStimulus
  | EstimationStimulus
  | CategorisationStimulus
  | PrioritisationStimulus
  | PatternStimulus
  | DataInterpretStimulus
  | ScenarioJudgeStimulus;


// ----------------------------------------------------------------------------
// TASK DEFINITION - What comes from the database
// ----------------------------------------------------------------------------
// This matches your bo_v1_experiential_tasks table exactly.

export interface ExperientialTask {
  // === IDENTITY ===
  id: string;                      // e.g., "proofread_legal_001"
  version: number;                 // For tracking updates
  
  // === CLASSIFICATION ===
  task_type: ExperientialTaskType;
  difficulty_tier: ExperientialDifficultyTier;
  
  // === CONTENT ===
  title: string;                   // "Legal Document Review"
  instruction: string;             // "Find and click on all errors..."
  stimulus: ExperientialStimulus;  // The actual task content (see types above)
  time_limit_secs: number | null;  // null = no time limit
  
  // === SCORING ===
  scoring_method: ExperientialScoringMethod;
  max_score: number;               // Maximum achievable points
  scoring_params: Record<string, any> | null;  // Extra scoring config
  
  // === CAREER LINKING ===
  career_ids: string[];            // Links to careers table (UUIDs as strings)
  
  // === SIGNALS ===
  capacity_proxies: {              // What capacities does this measure?
    [key: string]: number;         // e.g., { "vrb": 0.7, "precision": 0.8 }
  } | null;
  disposition_signals: {           // What dispositions does this reveal?
    [key: string]: number;
  } | null;
  
  // === POST-TASK QUESTIONS ===
  satisfaction_question: string;   // "How much did you enjoy this task?"
  
  // === METADATA ===
  is_active: boolean;
  created_at: string;
  updated_at: string;
}


// ----------------------------------------------------------------------------
// USER RESPONSE - What the user submitted
// ----------------------------------------------------------------------------
// This matches your bo_v1_experiential_responses table.

export interface ExperientialResponse {
  // === IDENTITY ===
  id?: string;                     // UUID, generated by database
  session_id: string;              // Links to bo_v1_sessions
  task_id: string;                 // Links to bo_v1_experiential_tasks
  
  // === PERFORMANCE DATA ===
  response: Record<string, any>;   // The actual answer (structure varies by task type)
  score: number | null;            // Calculated score (0 to max_score)
  score_breakdown: {               // Detailed scoring info
    [key: string]: any;
  } | null;
  time_taken_ms: number;           // How long they spent
  timed_out: boolean;              // Did timer expire?
  
  // === SUBJECTIVE DATA (user self-reports) ===
  confidence: number | null;       // 1-5: "How confident are you in your answer?"
  satisfaction: number | null;     // 1-5: "How much did you enjoy this task?"
  perceived_difficulty: number | null;  // 1-5: "How difficult was this?"
  
  // === DERIVED SIGNALS (calculated by database trigger) ===
  calibration_signal: number | null;     // -1 to +1: confidence vs actual accuracy
  career_affinity_signal: number | null; // -0.5 to +0.5: ability × interest
  
  // === METADATA ===
  created_at?: string;
}


// ----------------------------------------------------------------------------
// RESPONSE STRUCTURES BY TASK TYPE
// ----------------------------------------------------------------------------
// When saving a response, the `response` field structure depends on task_type.
// These types help ensure you're saving the right structure.

/**
 * PROOFREAD response: Which positions did user mark as errors?
 */
export interface ProofreadResponse {
  marked_positions: number[];      // Character indices user clicked
}

/**
 * ESTIMATION response: User's numerical guess
 */
export interface EstimationResponse {
  estimate: number;
}

/**
 * CATEGORISATION response: Where user placed each item
 */
export interface CategorisationResponse {
  placements: {
    item_id: string;
    category_id: string;
  }[];
}

/**
 * PRIORITISATION response: User's ordering
 */
export interface PrioritisationResponse {
  ranking: string[];               // Item IDs in user's order (first = highest priority)
}

/**
 * PATTERN response: User's answer
 */
export interface PatternResponse {
  selected_answer: number | string;
}

/**
 * DATA_INTERPRET response: Answers to each question
 */
export interface DataInterpretResponse {
  answers: {
    question_id: string;
    answer: string | number;
  }[];
}

/**
 * SCENARIO_JUDGE response: Which option(s) user chose
 */
export interface ScenarioJudgeResponse {
  selected_options: string[];      // Option IDs
}


// ----------------------------------------------------------------------------
// HELPER TYPE - Maps task type to its response structure
// ----------------------------------------------------------------------------
// Use this for type-safe response handling

export type ResponseForTaskType = {
  PROOFREAD: ProofreadResponse;
  ESTIMATION: EstimationResponse;
  CATEGORISATION: CategorisationResponse;
  PRIORITISATION: PrioritisationResponse;
  PATTERN: PatternResponse;
  DATA_INTERPRET: DataInterpretResponse;
  SCENARIO_JUDGE: ScenarioJudgeResponse;
};


// ----------------------------------------------------------------------------
// SCORE RESULT - What the scoring function returns
// ----------------------------------------------------------------------------

export interface ExperientialScoreResult {
  score: number;                   // Points earned
  max_score: number;               // Maximum possible
  percentage: number;              // score / max_score * 100
  breakdown: {                     // Detailed breakdown for display
    correct?: number;
    incorrect?: number;
    missed?: number;
    partial?: number;
    [key: string]: any;
  };
  feedback?: string;               // Optional explanation
}
