-- ExamRizz Arena — Schema Additions for Assessment Flow v2
-- Run AFTER existing schema (001_schema.sql)
-- 
-- Adds:
-- 1. Mini-sample items and responses
-- 2. Match feedback (wildcard validation)
-- 3. Assessment state updates
-- ============================================================================

-- ============================================================================
-- MINI-SAMPLE ITEMS (Task Definitions)
-- ============================================================================

CREATE TABLE IF NOT EXISTS bo_v1_mini_sample_items (
  id TEXT PRIMARY KEY,
  sample_type TEXT NOT NULL CHECK (sample_type IN ('CODE_TRACE', 'SOURCE_ANALYSIS', 'DATA_INTERPRETATION')),
  difficulty TEXT NOT NULL CHECK (difficulty IN ('FOUNDATION', 'STANDARD', 'CHALLENGE')),
  
  -- Content
  stimulus TEXT NOT NULL,
  questions JSONB NOT NULL,           -- Array of question parts
  correct_answers JSONB NOT NULL,     -- Keyed by part
  scoring_rubric JSONB NOT NULL,      -- How to score each part
  
  -- Metadata
  max_score DECIMAL DEFAULT 5,
  time_limit_seconds INTEGER DEFAULT 90,
  cluster_tags TEXT[] DEFAULT '{}',   -- Which course clusters this maps to
  
  -- Admin
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

COMMENT ON TABLE bo_v1_mini_sample_items IS 'Task definitions for uni work preview mini-samples';
COMMENT ON COLUMN bo_v1_mini_sample_items.questions IS 'Array of {part_id, text, type, options} objects';
COMMENT ON COLUMN bo_v1_mini_sample_items.cluster_tags IS 'Course clusters this task signals fit for, e.g. STEM, HUMANITIES';

-- ============================================================================
-- MINI-SAMPLE RESPONSES
-- ============================================================================

CREATE TABLE IF NOT EXISTS bo_v1_mini_sample_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  item_id TEXT NOT NULL REFERENCES bo_v1_mini_sample_items(id),
  
  -- Response data
  responses JSONB NOT NULL,           -- Keyed by part_id
  scores JSONB NOT NULL,              -- Per-part scores
  total_score DECIMAL,
  
  -- Behavioural signals
  time_spent_ms INTEGER,
  revision_count INTEGER DEFAULT 0,
  
  -- Post-task rating
  enjoyment_rating INTEGER CHECK (enjoyment_rating BETWEEN 1 AND 3),
  -- 1 = 😫 Not for me
  -- 2 = 😐 Okay  
  -- 3 = 😊 I liked this
  
  -- Completion
  completed BOOLEAN DEFAULT TRUE,
  skipped BOOLEAN DEFAULT FALSE,
  
  created_at TIMESTAMPTZ DEFAULT NOW()
);

COMMENT ON TABLE bo_v1_mini_sample_responses IS 'Student responses to mini-sample tasks';
COMMENT ON COLUMN bo_v1_mini_sample_responses.revision_count IS 'How many times student changed their answer';
COMMENT ON COLUMN bo_v1_mini_sample_responses.enjoyment_rating IS '1=disliked, 2=neutral, 3=enjoyed';

-- Index for session lookups
CREATE INDEX IF NOT EXISTS idx_mini_sample_responses_session 
ON bo_v1_mini_sample_responses(session_id);

-- ============================================================================
-- MATCH FEEDBACK (Wildcard Validation + General Feedback)
-- ============================================================================

CREATE TABLE IF NOT EXISTS bo_v1_match_feedback (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  course_id TEXT NOT NULL,
  
  -- Feedback
  is_wildcard BOOLEAN DEFAULT FALSE,
  rating TEXT NOT NULL CHECK (rating IN ('UP', 'DOWN')),
  reason TEXT,                        -- Optional: why they liked/disliked
  -- Reason options for DOWN: 'WRONG_SUBJECT', 'WRONG_LOCATION', 'WRONG_UNI_TYPE', 'NOT_INTERESTED', 'OTHER'
  
  created_at TIMESTAMPTZ DEFAULT NOW()
);

COMMENT ON TABLE bo_v1_match_feedback IS 'Thumbs up/down feedback on course recommendations, especially wildcards';
COMMENT ON COLUMN bo_v1_match_feedback.is_wildcard IS 'Whether this was a wildcard recommendation';

-- Index for analytics
CREATE INDEX IF NOT EXISTS idx_match_feedback_session 
ON bo_v1_match_feedback(session_id);

CREATE INDEX IF NOT EXISTS idx_match_feedback_wildcard 
ON bo_v1_match_feedback(is_wildcard) WHERE is_wildcard = TRUE;

-- ============================================================================
-- ASSESSMENT STATE UPDATES
-- ============================================================================

-- Add columns if table exists, create if not
DO $$
BEGIN
  -- Check if assessment_state table exists
  IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'bo_v1_assessment_state') THEN
    -- Add new columns
    ALTER TABLE bo_v1_assessment_state 
    ADD COLUMN IF NOT EXISTS mini_samples_completed INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS mini_sample_types_completed TEXT[] DEFAULT '{}';
  ELSE
    -- Create table
    CREATE TABLE bo_v1_assessment_state (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      profile_id UUID REFERENCES bo_v1_profiles(id) UNIQUE,
      
      -- Vibe
      vibe_completed BOOLEAN DEFAULT FALSE,
      vibe_cards_seen INTEGER DEFAULT 0,
      
      -- Forced-choice scenarios
      forced_choice_completed BOOLEAN DEFAULT FALSE,
      forced_choice_count INTEGER DEFAULT 0,
      
      -- Mini-samples
      mini_samples_completed INTEGER DEFAULT 0,
      mini_sample_types_completed TEXT[] DEFAULT '{}',
      
      -- Capacities (sharpening activities)
      vrb_tier TEXT DEFAULT 'NONE' CHECK (vrb_tier IN ('NONE', 'CORE', 'EXTENDED', 'DEEP')),
      vrb_items_completed INTEGER DEFAULT 0,
      qnt_tier TEXT DEFAULT 'NONE' CHECK (qnt_tier IN ('NONE', 'CORE', 'EXTENDED', 'DEEP')),
      qnt_items_completed INTEGER DEFAULT 0,
      spd_tier TEXT DEFAULT 'NONE' CHECK (spd_tier IN ('NONE', 'CORE', 'EXTENDED', 'DEEP')),
      spd_items_completed INTEGER DEFAULT 0,
      
      -- Enjoyment & calibration
      enjoyment_ratings_count INTEGER DEFAULT 0,
      confidence_ratings_count INTEGER DEFAULT 0,
      
      -- Timestamps
      initial_completed_at TIMESTAMPTZ,       -- When initial assessment finished
      last_activity_at TIMESTAMPTZ DEFAULT NOW(),
      
      created_at TIMESTAMPTZ DEFAULT NOW()
    );
    
    COMMENT ON TABLE bo_v1_assessment_state IS 'Tracks what each student has completed across sessions';
  END IF;
END $$;

-- ============================================================================
-- PROFILE UPDATES (Precision Score)
-- ============================================================================

-- Add computed precision columns if not exist
DO $$
BEGIN
  -- Add precision_score if not exists
  IF NOT EXISTS (
    SELECT FROM information_schema.columns 
    WHERE table_name = 'bo_v1_profiles' AND column_name = 'precision_score'
  ) THEN
    ALTER TABLE bo_v1_profiles ADD COLUMN precision_score INTEGER;
  END IF;
  
  -- Add precision_tier if not exists
  IF NOT EXISTS (
    SELECT FROM information_schema.columns 
    WHERE table_name = 'bo_v1_profiles' AND column_name = 'precision_tier'
  ) THEN
    ALTER TABLE bo_v1_profiles ADD COLUMN precision_tier TEXT;
  END IF;
  
  -- Add cluster preference columns
  IF NOT EXISTS (
    SELECT FROM information_schema.columns 
    WHERE table_name = 'bo_v1_profiles' AND column_name = 'cluster_preferences'
  ) THEN
    ALTER TABLE bo_v1_profiles ADD COLUMN cluster_preferences JSONB DEFAULT '{}';
  END IF;
  
  -- Add cluster capability columns
  IF NOT EXISTS (
    SELECT FROM information_schema.columns 
    WHERE table_name = 'bo_v1_profiles' AND column_name = 'cluster_capabilities'
  ) THEN
    ALTER TABLE bo_v1_profiles ADD COLUMN cluster_capabilities JSONB DEFAULT '{}';
  END IF;
END $$;

COMMENT ON COLUMN bo_v1_profiles.precision_score IS 'Overall profile confidence 0-100, calculated from sigmas';
COMMENT ON COLUMN bo_v1_profiles.precision_tier IS 'SKETCH/DRAFT/SOLID/SHARP based on precision_score';
COMMENT ON COLUMN bo_v1_profiles.cluster_preferences IS 'Subject cluster enjoyment from mini-samples, e.g. {"STEM": 3, "HUMANITIES": 1}';
COMMENT ON COLUMN bo_v1_profiles.cluster_capabilities IS 'Subject cluster performance from mini-samples, e.g. {"STEM": 72, "HUMANITIES": 85}';

-- ============================================================================
-- SEED: MINI-SAMPLE ITEMS (Foundation Tier)
-- ============================================================================

-- Code Trace (Foundation)
INSERT INTO bo_v1_mini_sample_items (id, sample_type, difficulty, stimulus, questions, correct_answers, scoring_rubric, cluster_tags) VALUES
('MS_CODE_01', 'CODE_TRACE', 'FOUNDATION',
'def mystery(items):
    result = []
    for i in range(len(items)):
        if i == 0:
            result.append(items[i])
        elif items[i] != items[i-1]:
            result.append(items[i])
    return result

output = mystery([3, 3, 3, 7, 7, 2, 2, 2, 2, 8])',
'[
  {
    "part_id": "p1",
    "text": "What does output contain after running this code?",
    "type": "MCQ",
    "options": ["[3, 7, 2, 8]", "[3, 3, 3, 7, 7, 2, 2, 2, 2, 8]", "[8, 2, 7, 3]", "[3, 7, 2, 2, 8]", "I''m not sure"]
  },
  {
    "part_id": "p2",
    "text": "In one sentence, what does this function do?",
    "type": "SHORT_RESPONSE",
    "options": null
  }
]'::JSONB,
'{
  "p1": {"correct": 0, "not_sure_partial": true},
  "p2": {"keywords": ["consecutive", "adjacent", "duplicates", "repeating"], "partial_keywords": ["duplicates", "removes", "unique"]}
}'::JSONB,
'{
  "p1": {"correct": 2, "not_sure": 0.5, "wrong": 0},
  "p2": {"full_match": 3, "partial_match": 1, "no_match": 0}
}'::JSONB,
ARRAY['COMPUTING', 'ENGINEERING', 'MATHS']
);

-- Source Analysis (Foundation)
INSERT INTO bo_v1_mini_sample_items (id, sample_type, difficulty, stimulus, questions, correct_answers, scoring_rubric, cluster_tags) VALUES
('MS_SOURCE_01', 'SOURCE_ANALYSIS', 'FOUNDATION',
'Extract from a university admissions debate:

"Contextual admissions — where universities lower grade requirements for students from disadvantaged backgrounds — are fundamentally unfair. A student who achieves AAB has demonstrably performed better than one who achieves BBB, regardless of their circumstances. By admitting the BBB student, we''re saying that grades don''t actually matter, which undermines the entire purpose of A-levels. Furthermore, the AAB student who loses their place may themselves come from a family that made significant sacrifices for their education. Contextual admissions simply replace one form of unfairness with another."',
'[
  {
    "part_id": "p1",
    "text": "What is the author''s main claim?",
    "type": "MCQ",
    "options": ["A-levels are not a reliable measure of ability", "Contextual admissions are unfair to higher-achieving applicants", "Universities should only consider grades in admissions", "Disadvantaged students cannot succeed at university", "I''m not sure"]
  },
  {
    "part_id": "p2",
    "text": "Which of these, if true, would most weaken the author''s argument?",
    "type": "MCQ",
    "options": ["Many universities already use contextual admissions successfully", "Students admitted with lower grades due to context perform equally well at university", "Some employers prefer graduates from universities that use contextual admissions", "The author attended a private school", "I''m not sure"]
  },
  {
    "part_id": "p3",
    "text": "The author assumes that... (select up to 2)",
    "type": "MULTI_SELECT",
    "max_selections": 2,
    "options": ["A-level grades accurately reflect student potential", "University places are zero-sum (one student''s gain is another''s loss)", "All students have equal access to A-level preparation", "Contextual admissions consider only socioeconomic background", "The AAB student will definitely not get a place elsewhere"]
  }
]'::JSONB,
'{
  "p1": {"correct": 1},
  "p2": {"correct": 1},
  "p3": {"correct": [0, 1], "trap": 2}
}'::JSONB,
'{
  "p1": {"correct": 1, "wrong": 0},
  "p2": {"correct": 2, "wrong": 0},
  "p3": {"both_correct": 2, "one_correct_no_trap": 1, "selected_trap": 0}
}'::JSONB,
ARRAY['HUMANITIES', 'LAW', 'SOCIAL_SCIENCES', 'POLITICS']
);

-- Data Interpretation (Foundation)
INSERT INTO bo_v1_mini_sample_items (id, sample_type, difficulty, stimulus, questions, correct_answers, scoring_rubric, cluster_tags) VALUES
('MS_DATA_01', 'DATA_INTERPRETATION', 'FOUNDATION',
'Study Summary:

Researchers investigated whether background music affects revision effectiveness. 120 A-level students were randomly assigned to three groups:

• Group A (40 students): Revised with classical music
• Group B (40 students): Revised with pop music with lyrics
• Group C (40 students): Revised in silence

After 45 minutes of revision, all students took the same test.

| Group      | Mean Score | Standard Deviation |
|------------|------------|-------------------|
| Classical  | 72%        | 12                |
| Pop/Lyrics | 61%        | 15                |
| Silence    | 70%        | 11                |

The researchers concluded: "Classical music significantly improves revision effectiveness compared to other conditions."',
'[
  {
    "part_id": "p1",
    "text": "Based on the data, which statement is best supported?",
    "type": "MCQ",
    "options": ["Classical music causes better test performance", "Pop music with lyrics may interfere with revision more than silence", "Students should always revise with classical music", "The study proves music improves memory", "I''m not sure"]
  },
  {
    "part_id": "p2",
    "text": "What is a problem with the researchers'' conclusion?",
    "type": "MCQ",
    "options": ["40 students per group is too few", "The difference between classical (72%) and silence (70%) is small and may not be meaningful", "They didn''t test other genres of music", "A-level students aren''t representative of all students", "I''m not sure"]
  },
  {
    "part_id": "p3",
    "text": "If advising a friend based on this study, what would you say?",
    "type": "MCQ",
    "options": ["Definitely revise with classical music — science proves it works", "Avoid pop music with lyrics, but silence or classical are probably similar", "This study is useless — ignore it completely", "Music doesn''t affect revision at all", "I''m not sure"]
  }
]'::JSONB,
'{
  "p1": {"correct": 1, "overclaim": 0},
  "p2": {"correct": 1},
  "p3": {"correct": 1}
}'::JSONB,
'{
  "p1": {"correct": 1.5, "overclaim": 0.5, "wrong": 0},
  "p2": {"correct": 2, "wrong": 0},
  "p3": {"correct": 1.5, "wrong": 0}
}'::JSONB,
ARRAY['SCIENCES', 'PSYCHOLOGY', 'ECONOMICS', 'BUSINESS']
);

-- ============================================================================
-- VERIFY
-- ============================================================================

SELECT 'Mini-sample items:' as check, COUNT(*) as count FROM bo_v1_mini_sample_items;
SELECT 'Sample types:' as check, sample_type, COUNT(*) as count FROM bo_v1_mini_sample_items GROUP BY sample_type;
