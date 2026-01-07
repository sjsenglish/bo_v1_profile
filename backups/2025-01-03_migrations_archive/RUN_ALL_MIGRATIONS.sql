-- Master Migration Runner
-- Run this file to apply all onboarding flow updates
-- Created: 2025-01-03

-- Instructions:
-- 1. Copy this entire file
-- 2. Open Supabase SQL Editor
-- 3. Paste and run
-- 4. Check output for "Migration complete" messages

BEGIN;

-- ============================================
-- MIGRATION 1: Session Tracking Columns
-- ============================================

ALTER TABLE bo_v1_sessions
  ADD COLUMN IF NOT EXISTS scenarios_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_samples_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_code_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_source_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_data_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS precision_score INTEGER DEFAULT 40;

SELECT '✅ Migration 1: Session tracking columns added' as status;

-- ============================================
-- MIGRATION 2: Scenarios Table
-- ============================================

CREATE TABLE IF NOT EXISTS bo_v1_scenarios (
  id TEXT PRIMARY KEY,
  dimension TEXT NOT NULL CHECK (dimension IN (
    'CALIBRATION', 'TOLERANCE', 'TRANSFER', 'PRECISION', 'RETRIEVAL', 'RECEPTIVITY',
    'STRUCTURE', 'CONSISTENCY', 'SOCIAL', 'DEPTH'
  )),
  scenario_context TEXT NOT NULL,
  option_a TEXT NOT NULL,
  option_b TEXT NOT NULL,
  a_indicates TEXT NOT NULL,
  b_indicates TEXT NOT NULL,
  active BOOLEAN DEFAULT TRUE,
  sort_order INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_scenarios_dimension ON bo_v1_scenarios(dimension);
CREATE INDEX IF NOT EXISTS idx_scenarios_active ON bo_v1_scenarios(active);

ALTER TABLE bo_v1_scenarios ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read" ON bo_v1_scenarios;
CREATE POLICY "Allow public read" ON bo_v1_scenarios FOR SELECT USING (true);

SELECT '✅ Migration 2: Scenarios table created' as status;

-- ============================================
-- MIGRATION 3: Seed Scenarios
-- ============================================

INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order) VALUES

('TRA_01', 'TRANSFER', 'You''re solving a new problem. What''s your instinct?', 
 'This reminds me of something from another subject...', 
 'Let me find the specific method for this type of problem',
 'high_transfer', 'low_transfer', 1),

('STR_01', 'STRUCTURE', 'Two courses cover the same content. Which sounds better?',
 'Weekly problem sets, clear rubric, structured lectures',
 'One final project, open brief, find your own sources',
 'high_structure', 'low_structure', 2),

('REC_01', 'RECEPTIVITY', 'Your teacher gives unexpected critical feedback on work you thought was good.',
 'Ask them to explain what you missed — probably a blind spot',
 'Defend your approach — you had good reasons',
 'high_receptivity', 'low_receptivity', 3),

('SOC_01', 'SOCIAL', 'It''s 10pm and you''re stuck on a problem that''s due tomorrow.',
 'Message the group chat to see if anyone''s figured it out',
 'Grind through it alone — you''ll learn more that way',
 'high_social', 'low_social', 4),

('DEP_01', 'DEPTH', 'You have a free afternoon to learn something new.',
 'Deep-dive one rabbit hole for 3 hours',
 'Skim 10 different interesting topics',
 'high_depth', 'low_depth', 5),

('CAL_01', 'CALIBRATION', 'After finishing an exam, a friend asks how you did.',
 'I usually have a pretty good sense before results come out',
 'Honestly no idea — I''m often surprised by my grade',
 'high_calibration', 'low_calibration', 6),

('TOL_01', 'TOLERANCE', 'You''ve been stuck on something for 45 minutes with no progress.',
 'Keep going — breakthroughs often come right after the frustration',
 'Switch to something else — diminishing returns',
 'high_tolerance', 'low_tolerance', 7),

('PRE_01', 'PRECISION', 'You''re nearly done with an assignment but spot a small inconsistency.',
 'Fix it properly — details matter',
 'Leave it — it''s not worth the time for something minor',
 'high_precision', 'low_precision', 8)

ON CONFLICT (id) DO NOTHING;

SELECT '✅ Migration 3: 8 scenarios seeded' as status;

-- ============================================
-- MIGRATION 4: Reduce Vibe Cards
-- ============================================

UPDATE bo_v1_vibe_cards
SET active = FALSE
WHERE id IN ('VIBE_01', 'VIBE_02', 'VIBE_04', 'VIBE_10', 'VIBE_11', 'VIBE_12');

SELECT '✅ Migration 4: 6 vibe cards kept active, 6 marked inactive' as status;

-- ============================================
-- VERIFICATION
-- ============================================

-- Check sessions columns
SELECT '📊 Sessions columns:' as check_type,
       COUNT(*) FILTER (WHERE column_name = 'scenarios_completed') as has_scenarios,
       COUNT(*) FILTER (WHERE column_name = 'mini_samples_completed') as has_mini_samples,
       COUNT(*) FILTER (WHERE column_name = 'precision_score') as has_precision
FROM information_schema.columns
WHERE table_name = 'bo_v1_sessions';

-- Check scenarios table
SELECT '📊 Scenarios:' as check_type,
       COUNT(*) as total_scenarios,
       COUNT(DISTINCT dimension) as unique_dimensions
FROM bo_v1_scenarios;

-- Check vibe cards
SELECT '📊 Vibe cards:' as check_type,
       COUNT(*) FILTER (WHERE active = TRUE) as active_cards,
       COUNT(*) FILTER (WHERE active = FALSE) as inactive_cards
FROM bo_v1_vibe_cards;

COMMIT;

-- ============================================
-- FINAL STATUS
-- ============================================

SELECT '
╔═══════════════════════════════════════╗
║   ALL MIGRATIONS COMPLETED ✅          ║
╚═══════════════════════════════════════╝

Next steps:
1. Build Quick Scenarios UI component
2. Build Mini-Sample UI components  
3. Update Vibe Swiper to load 6 cards
4. Build Profile/Results page

Database is ready for onboarding MVP!
' as final_status;
