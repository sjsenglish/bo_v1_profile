-- Migration: Seed Forced-Choice Scenarios
-- Created: 2025-01-03
-- Description: Insert 8 forced-choice scenarios covering key dispositions

-- ROLLBACK:
-- DELETE FROM bo_v1_scenarios WHERE id IN (
--   'TRA_01', 'STR_01', 'REC_01', 'SOC_01', 
--   'DEP_01', 'CAL_01', 'TOL_01', 'PRE_01'
-- );

-- Insert 8 scenarios (covering 8 different dispositions)
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order) VALUES

-- TRANSFER (cross-domain thinking)
('TRA_01', 'TRANSFER', 'You''re solving a new problem. What''s your instinct?', 
 'This reminds me of something from another subject...', 
 'Let me find the specific method for this type of problem',
 'high_transfer', 'low_transfer', 1),

-- STRUCTURE (need for guidance)
('STR_01', 'STRUCTURE', 'Two courses cover the same content. Which sounds better?',
 'Weekly problem sets, clear rubric, structured lectures',
 'One final project, open brief, find your own sources',
 'high_structure', 'low_structure', 2),

-- RECEPTIVITY (openness to feedback)
('REC_01', 'RECEPTIVITY', 'Your teacher gives unexpected critical feedback on work you thought was good.',
 'Ask them to explain what you missed — probably a blind spot',
 'Defend your approach — you had good reasons',
 'high_receptivity', 'low_receptivity', 3),

-- SOCIAL (collaborative vs independent)
('SOC_01', 'SOCIAL', 'It''s 10pm and you''re stuck on a problem that''s due tomorrow.',
 'Message the group chat to see if anyone''s figured it out',
 'Grind through it alone — you''ll learn more that way',
 'high_social', 'low_social', 4),

-- DEPTH (specialist vs generalist)
('DEP_01', 'DEPTH', 'You have a free afternoon to learn something new.',
 'Deep-dive one rabbit hole for 3 hours',
 'Skim 10 different interesting topics',
 'high_depth', 'low_depth', 5),

-- CALIBRATION (self-awareness)
('CAL_01', 'CALIBRATION', 'After finishing an exam, a friend asks how you did.',
 'I usually have a pretty good sense before results come out',
 'Honestly no idea — I''m often surprised by my grade',
 'high_calibration', 'low_calibration', 6),

-- TOLERANCE (persistence through difficulty)
('TOL_01', 'TOLERANCE', 'You''ve been stuck on something for 45 minutes with no progress.',
 'Keep going — breakthroughs often come right after the frustration',
 'Switch to something else — diminishing returns',
 'high_tolerance', 'low_tolerance', 7),

-- PRECISION (attention to detail)
('PRE_01', 'PRECISION', 'You''re nearly done with an assignment but spot a small inconsistency.',
 'Fix it properly — details matter',
 'Leave it — it''s not worth the time for something minor',
 'high_precision', 'low_precision', 8)

ON CONFLICT (id) DO NOTHING;

-- Verify insertion
SELECT id, dimension, 
       LEFT(scenario_context, 50) || '...' as context_preview,
       sort_order
FROM bo_v1_scenarios
ORDER BY sort_order;

-- Success message
SELECT 'Migration complete: 8 forced-choice scenarios seeded' as status,
       COUNT(*) as total_scenarios
FROM bo_v1_scenarios;
