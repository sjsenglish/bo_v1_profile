-- ExamRizz Arena v6.0 - Identity Seed (Familiars + Guilds)
-- Run this AFTER 001_schema.sql

-- Clear existing
DELETE FROM bo_v1_familiars;
DELETE FROM bo_v1_guilds;

-- ============================================
-- FAMILIARS (14 Total: 10 Common + 4 Rare)
-- ============================================

-- Common Familiars (10)
INSERT INTO bo_v1_familiars (id, name, element, tagline, rarity, rarity_pct, bias_dimensions) VALUES
('OWL', 'The Owl', 'Air', 'The Night Scholar', 'COMMON', 9.0, ARRAY['CALIBRATION', 'PRECISION']),
('FOX', 'The Fox', 'Shadow', 'The Clever Path-Finder', 'COMMON', 9.0, ARRAY['TRANSFER', 'RECEPTIVITY']),
('WOLF', 'The Wolf', 'Earth', 'The Pack Strategist', 'COMMON', 9.0, ARRAY['TOLERANCE', 'RECEPTIVITY']),
('PANDA', 'The Panda', 'Earth', 'The Steady Climber', 'COMMON', 9.0, ARRAY['TOLERANCE']),
('RAVEN', 'The Raven', 'Shadow', 'The Pattern Seeker', 'COMMON', 9.0, ARRAY['TRANSFER', 'RETRIEVAL']),
('OCTOPUS', 'The Octopus', 'Water', 'The Multi-Threaded Mind', 'COMMON', 9.0, ARRAY['TRANSFER', 'RETRIEVAL']),
('BEAR', 'The Bear', 'Earth', 'The Burst Force', 'COMMON', 9.0, ARRAY['TOLERANCE']),
('TORTOISE', 'The Tortoise', 'Earth', 'The Patient Master', 'COMMON', 9.0, ARRAY['TOLERANCE', 'PRECISION']),
('CHEETAH', 'The Cheetah', 'Fire', 'The Sprint Specialist', 'COMMON', 9.0, ARRAY['CALIBRATION', 'PRECISION']),
('CROW', 'The Crow', 'Air', 'The Tool User', 'COMMON', 9.0, ARRAY['PRECISION']);

-- Rare Familiars (4)
INSERT INTO bo_v1_familiars (id, name, element, tagline, rarity, rarity_pct, bias_dimensions) VALUES
('PHOENIX', 'The Phoenix', 'Fire', 'The Eternal Learner', 'RARE', 3.0, ARRAY['TOLERANCE']),
('DRAGON', 'The Dragon', 'Fire', 'The Knowledge Hoarder', 'RARE', 3.0, ARRAY['PRECISION']),
('KITSUNE', 'The Kitsune', 'Shadow', 'The Nine-Tailed Trickster', 'RARE', 3.0, ARRAY['TRANSFER', 'RECEPTIVITY']),
('SPHINX', 'The Sphinx', 'Light', 'The Riddle Master', 'RARE', 1.0, ARRAY['CALIBRATION']);

-- ============================================
-- GUILDS (4)
-- ============================================

INSERT INTO bo_v1_guilds (id, name, motto, formula) VALUES
('FORGE', 
 'Forge Guild', 
 'We build systems',
 '{"PRECISION": 0.35, "RETRIEVAL": 0.35, "CALIBRATION": 0.30}'::jsonb),

('FLOW', 
 'Flow Guild', 
 'We adapt and connect',
 '{"TRANSFER": 0.35, "RECEPTIVITY": 0.35, "PRECISION_INVERSE": 0.30}'::jsonb),

('FORCE', 
 'Force Guild', 
 'We push through',
 '{"TOLERANCE": 0.45, "RECEPTIVITY": 0.30, "TRANSFER": 0.25}'::jsonb),

('FOUNDATION', 
 'Foundation Guild', 
 'We remember and endure',
 '{"RETRIEVAL": 0.40, "CALIBRATION": 0.35, "TOLERANCE": 0.25}'::jsonb);

-- Verify
SELECT 'Familiars:' as type, rarity, COUNT(*) as count FROM bo_v1_familiars GROUP BY rarity
UNION ALL
SELECT 'Guilds:', 'ALL', COUNT(*) FROM bo_v1_guilds;
