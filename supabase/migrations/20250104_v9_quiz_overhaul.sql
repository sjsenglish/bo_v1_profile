-- ExamRizz Arena v9 - Quiz Overhaul Migration
-- Created: 2025-01-04
--
-- Run this AFTER existing schema (001_schema.sql + SCHEMA_ADDITIONS.sql)
--
-- Changes:
-- 1. NEW: bo_v1_vibe_choices (for paired comparisons)
-- 2. NEW: bo_v1_scenario_responses (for slider responses)
-- 3. NEW: bo_v1_mini_samples (6-task format with meta-clusters)
-- 4. UPDATE: bo_v1_sessions (new completion flags)
-- 5. UPDATE: bo_v1_mini_sample_responses (career_fit_rating)
-- 6. UPDATE: bo_v1_scenarios (lowercase dimensions)
-- ============================================================================

-- ============================================================================
-- 1. VIBE CHOICES (Paired Comparisons)
-- ============================================================================

CREATE TABLE IF NOT EXISTS bo_v1_vibe_choices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  pair_id TEXT NOT NULL,
  option_chosen TEXT NOT NULL CHECK (option_chosen IN ('A', 'B')),
  response_time_ms INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- Prevent duplicate choices for same pair in same session
  UNIQUE(session_id, pair_id)
);

COMMENT ON TABLE bo_v1_vibe_choices IS 'v9: Paired comparison choices (A/B) for vibe assessment';
COMMENT ON COLUMN bo_v1_vibe_choices.pair_id IS 'ID of the vibe pair, e.g. campus_vs_city, lecture_vs_seminar';

-- Indexes
CREATE INDEX IF NOT EXISTS idx_vibe_choices_session ON bo_v1_vibe_choices(session_id);

-- RLS
ALTER TABLE bo_v1_vibe_choices ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow anonymous insert" ON bo_v1_vibe_choices FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_vibe_choices FOR SELECT USING (true);

-- ============================================================================
-- 2. SCENARIO RESPONSES (Slider 0-100)
-- ============================================================================

CREATE TABLE IF NOT EXISTS bo_v1_scenario_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  scenario_id TEXT NOT NULL,
  position INTEGER NOT NULL CHECK (position BETWEEN 0 AND 100),
  response_time_ms INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- Prevent duplicate responses for same scenario in same session
  UNIQUE(session_id, scenario_id)
);

COMMENT ON TABLE bo_v1_scenario_responses IS 'v9: Slider position responses (0-100) for forced-choice scenarios';
COMMENT ON COLUMN bo_v1_scenario_responses.position IS '0 = Strong A, 50 = neutral, 100 = Strong B';

-- Indexes
CREATE INDEX IF NOT EXISTS idx_scenario_responses_session ON bo_v1_scenario_responses(session_id);

-- RLS
ALTER TABLE bo_v1_scenario_responses ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow anonymous insert" ON bo_v1_scenario_responses FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_scenario_responses FOR SELECT USING (true);

-- ============================================================================
-- 3. MINI-SAMPLES (6 Meta-Cluster Tasks)
-- ============================================================================

CREATE TABLE IF NOT EXISTS bo_v1_mini_samples (
  id TEXT PRIMARY KEY,
  meta_cluster TEXT NOT NULL CHECK (meta_cluster IN (
    'STEM_TECH', 'STEM_SCI', 'HUMANITIES', 'SOCIAL_SCI', 'PROFESSIONAL', 'CREATIVE'
  )),
  task_type TEXT NOT NULL CHECK (task_type IN ('MCQ', 'SHORT_RESPONSE')),

  -- Content
  title TEXT NOT NULL,
  stimulus TEXT NOT NULL,
  question TEXT NOT NULL,
  options TEXT[],                    -- For MCQ tasks
  correct_answer INTEGER,            -- For MCQ (0-indexed)
  grading_criteria TEXT[],           -- For SHORT_RESPONSE

  -- Metadata
  time_limit_seconds INTEGER DEFAULT 90,
  sort_order INTEGER,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

COMMENT ON TABLE bo_v1_mini_samples IS 'v9: 6 experiential mini-sample tasks across meta-clusters';
COMMENT ON COLUMN bo_v1_mini_samples.meta_cluster IS 'One of 6 meta-clusters: STEM_TECH, STEM_SCI, HUMANITIES, SOCIAL_SCI, PROFESSIONAL, CREATIVE';

-- Indexes
CREATE INDEX IF NOT EXISTS idx_mini_samples_cluster ON bo_v1_mini_samples(meta_cluster);
CREATE INDEX IF NOT EXISTS idx_mini_samples_active ON bo_v1_mini_samples(active);

-- RLS
ALTER TABLE bo_v1_mini_samples ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow public read" ON bo_v1_mini_samples FOR SELECT USING (true);

-- ============================================================================
-- 4. UPDATE SESSIONS TABLE
-- ============================================================================

-- Add new completion flags
ALTER TABLE bo_v1_sessions
  ADD COLUMN IF NOT EXISTS scenarios_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_samples_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_code_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_source_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_data_completed BOOLEAN DEFAULT FALSE;

COMMENT ON COLUMN bo_v1_sessions.scenarios_completed IS 'v9: True when all 20 scenario sliders completed';
COMMENT ON COLUMN bo_v1_sessions.mini_samples_completed IS 'v9: True when all 6 mini-sample tasks completed';

-- ============================================================================
-- 5. UPDATE MINI-SAMPLE RESPONSES
-- ============================================================================

-- Add career fit rating column
ALTER TABLE bo_v1_mini_sample_responses
  ADD COLUMN IF NOT EXISTS career_fit_rating INTEGER CHECK (career_fit_rating BETWEEN -1 AND 1),
  ADD COLUMN IF NOT EXISTS task_id TEXT;

-- Update enjoyment_rating to use -1/0/1 scale
-- Note: This changes from 1-3 to -1/0/1, existing data may need migration
COMMENT ON COLUMN bo_v1_mini_sample_responses.enjoyment_rating IS 'v9: -1=disliked, 0=neutral, 1=loved';
COMMENT ON COLUMN bo_v1_mini_sample_responses.career_fit_rating IS 'v9: Could see doing this daily? -1=no, 0=maybe, 1=yes';
COMMENT ON COLUMN bo_v1_mini_sample_responses.task_id IS 'v9: References bo_v1_mini_samples(id)';

-- ============================================================================
-- 6. UPDATE SCENARIOS TABLE
-- ============================================================================

-- Update dimension check constraint to allow lowercase
-- First drop existing constraint if it exists
DO $$
BEGIN
  ALTER TABLE bo_v1_scenarios DROP CONSTRAINT IF EXISTS bo_v1_scenarios_dimension_check;
EXCEPTION
  WHEN undefined_object THEN
    NULL;
END $$;

-- Add new constraint allowing both cases
ALTER TABLE bo_v1_scenarios
  ADD CONSTRAINT bo_v1_scenarios_dimension_check
  CHECK (UPPER(dimension) IN (
    'CALIBRATION', 'TOLERANCE', 'TRANSFER', 'PRECISION', 'RETRIEVAL', 'RECEPTIVITY',
    'STRUCTURE', 'CONSISTENCY', 'SOCIAL', 'DEPTH'
  ));

-- ============================================================================
-- 7. SEED: 6 MINI-SAMPLE TASKS
-- ============================================================================

-- Clear existing if any
DELETE FROM bo_v1_mini_samples WHERE id LIKE 'MS_V9_%';

-- STEM-Technical: Debugging/Diagnosis
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, options, correct_answer, time_limit_seconds, sort_order, active)
VALUES (
  'MS_V9_STEM_TECH',
  'STEM_TECH',
  'MCQ',
  'Debug the Code',
  'A student wrote this Python function to check if a number is prime:

def is_prime(n):
    if n < 2:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

The function works correctly but is slow for large numbers. Their teacher suggested checking only up to the square root of n.',
  'Which modification would make the function faster while still being correct?',
  ARRAY[
    'Change range(2, n) to range(2, n//2)',
    'Change range(2, n) to range(2, int(n**0.5) + 1)',
    'Change range(2, n) to range(1, n)',
    'Add break after return False'
  ],
  1,
  90,
  1,
  true
);

-- STEM-Scientific: Unexpected Observation
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, options, correct_answer, time_limit_seconds, sort_order, active)
VALUES (
  'MS_V9_STEM_SCI',
  'STEM_SCI',
  'MCQ',
  'Lab Mystery',
  'A biology student is growing bacteria cultures. According to their textbook, E. coli should double every 20 minutes at 37°C with nutrients.

They set up the experiment correctly but notice the population is doubling every 45 minutes instead. The incubator is confirmed at 37°C and nutrients are fresh.',
  'What is the most likely explanation for this unexpected result?',
  ARRAY[
    'The textbook is wrong about E. coli doubling time',
    'The student made a counting error',
    'Something in the environment is slowing growth (pH, oxygen, contamination)',
    'The bacteria have evolved to grow slower'
  ],
  2,
  90,
  2,
  true
);

-- Humanities: Argument Flaw
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, options, correct_answer, time_limit_seconds, sort_order, active)
VALUES (
  'MS_V9_HUMANITIES',
  'HUMANITIES',
  'MCQ',
  'Spot the Flaw',
  '"Shakespeare''s plays are clearly the greatest works in the English language. After all, they have been performed continuously for over 400 years, studied in every school, and quoted more than any other author. No other writer has achieved this level of lasting influence. Therefore, any student who claims to dislike Shakespeare simply doesn''t understand great literature."',
  'What is the main flaw in this argument?',
  ARRAY[
    'Shakespeare''s plays are not actually performed that often',
    'Popularity and longevity don''t prove quality, and disliking something doesn''t mean misunderstanding it',
    'Other writers have been equally influential',
    'The argument doesn''t provide enough evidence'
  ],
  1,
  90,
  3,
  true
);

-- Social Sciences: Hidden Assumption
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, grading_criteria, time_limit_seconds, sort_order, active)
VALUES (
  'MS_V9_SOCIAL_SCI',
  'SOCIAL_SCI',
  'SHORT_RESPONSE',
  'Policy Puzzle',
  'A government minister announces: "University tuition fees should be abolished because countries like Germany have free higher education and their economy is strong. Making university free would therefore boost our economy."',
  'Identify one hidden assumption in this argument and explain why it might be wrong. (2-3 sentences)',
  ARRAY[
    'Identifies causation vs correlation issue',
    'Notes differences between countries',
    'Questions whether Germany''s economy is strong because of free education',
    'Mentions other factors that differ between countries'
  ],
  90,
  4,
  true
);

-- Professional: Competing Interests
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, grading_criteria, time_limit_seconds, sort_order, active)
VALUES (
  'MS_V9_PROFESSIONAL',
  'PROFESSIONAL',
  'SHORT_RESPONSE',
  'Doctor''s Dilemma',
  'A doctor has two patients who both urgently need the only available kidney transplant:

Patient A: 65-year-old retired teacher, otherwise healthy, strong family support, likely to live 15+ years with transplant.

Patient B: 35-year-old single parent of two young children, has controlled diabetes, likely to live 20+ years with transplant but higher surgical risk.',
  'What factors should the doctor consider, and how would you approach this decision? (2-3 sentences)',
  ARRAY[
    'Considers medical factors (age, risk, life expectancy)',
    'Considers social factors (dependents, quality of life)',
    'Acknowledges difficulty of the decision',
    'Avoids claiming one clear answer exists'
  ],
  90,
  5,
  true
);

-- Creative: Design Trade-off
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, grading_criteria, time_limit_seconds, sort_order, active)
VALUES (
  'MS_V9_CREATIVE',
  'CREATIVE',
  'SHORT_RESPONSE',
  'Design Challenge',
  'You''re designing a poster for a school mental health awareness campaign. You want to include:
- The helpline number (must be very visible)
- A message that mental health struggles are common and nothing to be ashamed of
- Information about available support services

The poster is A4 size and must work both printed and on screens.',
  'What''s the main design trade-off you face, and how would you resolve it? (2-3 sentences)',
  ARRAY[
    'Identifies space/hierarchy trade-off',
    'Balances visibility with comprehensiveness',
    'Considers the two different formats (print vs screen)',
    'Proposes a practical solution'
  ],
  90,
  6,
  true
);

-- ============================================================================
-- 8. SEED: 20 SCENARIOS (Forced-Choice with Slider)
-- ============================================================================

-- Clear existing scenarios
DELETE FROM bo_v1_scenarios WHERE id LIKE 'SC_V9_%';

-- Transfer (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_TRA_01', 'transfer',
 'You''re learning a new maths technique in A-level. Your teacher shows one worked example.',
 'I want to see several more examples before trying problems myself',
 'I prefer to jump into problems and figure out how to apply the technique as I go',
 'low', 'high', 1, true),
('SC_V9_TRA_02', 'transfer',
 'You''re revising for an exam and encounter a question type you haven''t seen before.',
 'I look for similar past questions to see the expected approach',
 'I try to work out an approach using what I already know',
 'low', 'high', 2, true);

-- Receptivity (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_REC_01', 'receptivity',
 'Your essay comes back with a low mark and detailed critical feedback.',
 'I focus on the specific points to fix in my next essay',
 'I feel discouraged and question whether I''m good at this subject',
 'high', 'low', 3, true),
('SC_V9_REC_02', 'receptivity',
 'A classmate points out a mistake in your reasoning during a group discussion.',
 'I appreciate them catching something I missed',
 'I feel embarrassed and wish they''d mentioned it privately',
 'high', 'low', 4, true);

-- Tolerance (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_TOL_01', 'tolerance',
 'You''ve been working on a challenging problem for 30 minutes with no breakthrough.',
 'I find this frustrating and want to move on to something else',
 'I''m intrigued by the challenge and want to keep trying',
 'low', 'high', 5, true),
('SC_V9_TOL_02', 'tolerance',
 'You''re reading a dense academic text for your EPQ research.',
 'I skim for key points and move on if it gets too complex',
 'I slow down and re-read difficult sections until I understand them',
 'low', 'high', 6, true);

-- Precision (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_PRE_01', 'precision',
 'You''ve finished a piece of coursework with a day to spare.',
 'I proofread carefully and check all references and formatting',
 'I''m happy with it and submit it as is',
 'high', 'low', 7, true),
('SC_V9_PRE_02', 'precision',
 'You''re writing a lab report and your data has one anomalous result.',
 'I investigate why and consider whether to exclude it with justification',
 'I include it without comment—it''s what I measured',
 'high', 'low', 8, true);

-- Calibration (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_CAL_01', 'calibration',
 'Before getting your mock exam results back, you''re asked to predict your grade.',
 'I usually predict accurately—I know when I''ve done well or badly',
 'I''m often surprised—my predictions don''t match reality',
 'high', 'low', 9, true),
('SC_V9_CAL_02', 'calibration',
 'You''re unsure about an answer in a test.',
 'I can usually tell the difference between "not sure but probably right" and "genuinely guessing"',
 'When I''m unsure, I can''t really tell how likely I am to be right',
 'high', 'low', 10, true);

-- Structure (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_STR_01', 'structure',
 'You have a free Sunday with coursework due in two weeks.',
 'I prefer to make a plan and allocate time for specific tasks',
 'I prefer to see how I feel and work on whatever interests me',
 'high', 'low', 11, true),
('SC_V9_STR_02', 'structure',
 'You''re starting a research project for your extended essay.',
 'I create an outline and structure before I start writing',
 'I start exploring sources and let the structure emerge naturally',
 'high', 'low', 12, true);

-- Social (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_SOC_01', 'social',
 'You''re given a choice between a group project and an individual assignment (same topic, same marks).',
 'I''d rather work with others—we can share ideas and skills',
 'I''d rather work alone—I can control the quality and timing',
 'high', 'low', 13, true),
('SC_V9_SOC_02', 'social',
 'You''re stuck on a problem during revision.',
 'I message a friend or classmate to discuss it',
 'I prefer to work through it myself or look up resources online',
 'high', 'low', 14, true);

-- Depth (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_DEP_01', 'depth',
 'You''ve finished the required reading for a topic you found interesting.',
 'I want to explore beyond the syllabus—read more, watch documentaries, etc.',
 'I''m satisfied with understanding what I need for the exam',
 'high', 'low', 15, true),
('SC_V9_DEP_02', 'depth',
 'Your teacher mentions an advanced concept that won''t be on the exam.',
 'I''m curious and want to learn about it anyway',
 'I note it but focus on exam-relevant material',
 'high', 'low', 16, true);

-- Consistency (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_CON_01', 'consistency',
 'It''s the weekend and you have no imminent deadlines.',
 'I still do some study—it''s part of my routine',
 'I take the time off—I work better under pressure anyway',
 'high', 'low', 17, true),
('SC_V9_CON_02', 'consistency',
 'You''ve planned to study in the library but a friend invites you to do something fun.',
 'I stick to my plan—I''ll catch up with friends later',
 'I''m flexible—I can study tomorrow instead',
 'high', 'low', 18, true);

-- Retrieval (2 items)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active)
VALUES
('SC_V9_RET_01', 'retrieval',
 'You''re revising for an exam.',
 'I test myself with past papers and flashcards',
 'I re-read notes and textbooks until the information feels familiar',
 'high', 'low', 19, true),
('SC_V9_RET_02', 'retrieval',
 'You''ve just finished reading a chapter for homework.',
 'I close the book and try to recall the main points from memory',
 'I highlight key passages and keep the book open for reference',
 'high', 'low', 20, true);

-- ============================================================================
-- VERIFY
-- ============================================================================

SELECT 'New tables created:' as check,
  (SELECT COUNT(*) FROM bo_v1_vibe_choices) as vibe_choices,
  (SELECT COUNT(*) FROM bo_v1_scenario_responses) as scenario_responses,
  (SELECT COUNT(*) FROM bo_v1_mini_samples) as mini_samples;

SELECT 'Mini-samples by cluster:' as check, meta_cluster, task_type, title
FROM bo_v1_mini_samples ORDER BY sort_order;

SELECT 'Scenarios by dimension:' as check, dimension, COUNT(*) as count
FROM bo_v1_scenarios WHERE id LIKE 'SC_V9_%' GROUP BY dimension ORDER BY dimension;

SELECT 'Migration complete: v9 Quiz Overhaul' as status;
