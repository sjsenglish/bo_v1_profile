-- Seed 20 forced-choice scenarios (2 per dimension, 10 dimensions)
-- This replaces the previous 5 scenarios

-- Clear existing scenarios
DELETE FROM bo_v1_scenarios;

-- Insert 20 scenarios
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order, active) VALUES

-- SOCIAL (2 items)
('social_1', 'social',
 'It''s 10pm and you''re stuck on a problem set that''s due tomorrow morning.',
 'Message the group chat to see if anyone''s figured it out.',
 'Grind through it alone — you''ll learn more that way.',
 'high', 'low', 1, true),

('social_2', 'social',
 'You''re revising for a big exam next week.',
 'Organise a study group to quiz each other.',
 'Find a quiet corner and work through past papers solo.',
 'high', 'low', 2, true),

-- RECEPTIVITY (2 items)
('receptivity_1', 'receptivity',
 'You receive harsh feedback on a draft essay from your teacher.',
 'Defend your approach and explain why you made those choices.',
 'Accept it immediately and rewrite the section completely.',
 'low', 'high', 3, true),

('receptivity_2', 'receptivity',
 'A classmate suggests your project approach is fundamentally flawed.',
 'Listen carefully and consider completely changing direction.',
 'Explain your reasoning — you''ve thought this through.',
 'high', 'low', 4, true),

-- TRANSFER (2 items)
('transfer_1', 'transfer',
 'You encounter a new type of problem you''ve never seen before.',
 'Look for patterns from other subjects that might apply.',
 'Find the specific formula or method for this exact problem type.',
 'high', 'low', 5, true),

('transfer_2', 'transfer',
 'Your biology teacher asks you to explain osmosis.',
 'Use an analogy from everyday life or another subject.',
 'Stick to the precise scientific definition and terminology.',
 'high', 'low', 6, true),

-- STRUCTURE (2 items)
('structure_1', 'structure',
 'You have to choose an EPQ topic.',
 'Pick something practical with a clear, definite answer.',
 'Pick something philosophical with multiple open interpretations.',
 'high', 'low', 7, true),

('structure_2', 'structure',
 'You''re given a choice between two essay questions.',
 'The one with a detailed marking rubric and clear expectations.',
 'The open-ended one where you can take it anywhere.',
 'high', 'low', 8, true),

-- DEPTH (2 items)
('depth_1', 'depth',
 'You have a free period in your schedule.',
 'Go to the library to get ahead on next week''s reading.',
 'Go to the common room to relax and socialise with friends.',
 'high', 'low', 9, true),

('depth_2', 'depth',
 'You''ve finished the required reading for an essay.',
 'Find additional sources to go beyond what''s expected.',
 'Move on to your other subjects — you''ve done enough here.',
 'high', 'low', 10, true),

-- TOLERANCE (2 items)
('tolerance_1', 'tolerance',
 'In a group project, two members aren''t pulling their weight.',
 'Confront them directly and demand they contribute.',
 'Do the work yourself to ensure you get a good grade.',
 'low', 'high', 11, true),

('tolerance_2', 'tolerance',
 'You''ve been working on a maths problem for 45 minutes with no progress.',
 'Keep pushing — the breakthrough will come eventually.',
 'Move on and come back to it later with fresh eyes.',
 'high', 'low', 12, true),

-- PRECISION (2 items)
('precision_1', 'precision',
 'You''re proofreading an essay before submission.',
 'Read it once for obvious errors, then submit.',
 'Go through multiple times checking spelling, grammar, and formatting separately.',
 'low', 'high', 13, true),

('precision_2', 'precision',
 'You''re doing a chemistry calculation.',
 'Work through carefully, double-checking each step.',
 'Get the rough answer quickly and move on.',
 'high', 'low', 14, true),

-- CALIBRATION (2 items)
('calibration_1', 'calibration',
 'After finishing an exam, your friend asks how you did.',
 'Give a confident prediction — you know how these usually go.',
 'Say you''re not sure — exams are unpredictable.',
 'high', 'low', 15, true),

('calibration_2', 'calibration',
 'You''re about to get your mock results back.',
 'You have a pretty accurate sense of what you''ll get.',
 'You genuinely have no idea — could be anything.',
 'high', 'low', 16, true),

-- RETRIEVAL (2 items)
('retrieval_1', 'retrieval',
 'You''re revising for an exam next month.',
 'Re-read your notes and highlight key points.',
 'Test yourself with flashcards and practice questions.',
 'low', 'high', 17, true),

('retrieval_2', 'retrieval',
 'You need to memorise a list of key dates for history.',
 'Write them out repeatedly until they stick.',
 'Cover the dates and try to recall them from memory.',
 'low', 'high', 18, true),

-- CONSISTENCY (2 items)
('consistency_1', 'consistency',
 'It''s the weekend and you have coursework due Monday.',
 'Stick to your study schedule — Saturday morning as planned.',
 'See how you feel — you work better under pressure anyway.',
 'high', 'low', 19, true),

('consistency_2', 'consistency',
 'You''ve set yourself a goal to read 30 pages every evening.',
 'You''ll hit that target most nights, no matter what.',
 'Some nights you''ll do more, some less — depends on the day.',
 'high', 'low', 20, true);

-- Verify
SELECT 'Scenarios seeded:' as status, COUNT(*) as count, COUNT(DISTINCT dimension) as dimensions FROM bo_v1_scenarios;
