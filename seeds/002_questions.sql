-- ExamRizz Arena v6.0 - Questions Seed
-- Run this AFTER 001_schema.sql

-- Clear existing questions
DELETE FROM bo_v1_questions WHERE tier = 'CORE';

-- ============================================
-- COGNITIVE DISPOSITIONS (24 Questions)
-- ============================================

-- CALIBRATION (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('CAL_01', 'CALIBRATION', 'CORE', 'Before getting my test back, I usually know roughly how well I did', false, 1.2),
('CAL_02', 'CALIBRATION', 'CORE', 'I''m often surprised by my test results — good or bad', true, 1.0),
('CAL_03', 'CALIBRATION', 'CORE', 'When a topic feels familiar, I assume I understand it well', true, 1.3),
('CAL_04', 'CALIBRATION', 'CORE', 'I can usually tell which questions I got wrong before seeing the mark', false, 1.0);

-- TOLERANCE (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('TOL_01', 'TOLERANCE', 'CORE', 'When I''m stuck on a problem for 10+ minutes, I feel energised rather than frustrated', false, 1.2),
('TOL_02', 'TOLERANCE', 'CORE', 'After a bad grade, I bounce back within hours rather than days', false, 1.0),
('TOL_03', 'TOLERANCE', 'CORE', 'I''d rather skip a difficult question and come back to it than struggle through', true, 1.1),
('TOL_04', 'TOLERANCE', 'CORE', 'When I encounter a problem I''ve never seen before, my first instinct is curiosity rather than anxiety', false, 1.2);

-- TRANSFER (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('TRF_01', 'TRANSFER', 'CORE', 'I often notice unexpected connections between different subjects', false, 1.2),
('TRF_02', 'TRANSFER', 'CORE', 'Each new topic feels like starting from scratch', true, 1.0),
('TRF_03', 'TRANSFER', 'CORE', 'I like using examples from one subject to explain another', false, 1.1),
('TRF_04', 'TRANSFER', 'CORE', 'People sometimes say my examples or analogies come from unexpected places', false, 1.0);

-- PRECISION (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('PRE_01', 'PRECISION', 'CORE', 'I double-check my work before submitting, even when time is tight', false, 1.0),
('PRE_02', 'PRECISION', 'CORE', 'When something doesn''t work, I systematically check each step rather than starting over', false, 1.2),
('PRE_03', 'PRECISION', 'CORE', 'Small errors in my work rarely affect my grades', true, 1.1),
('PRE_04', 'PRECISION', 'CORE', 'I notice typos and small mistakes in things I read', false, 1.0);

-- RETRIEVAL (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('RET_01', 'RETRIEVAL', 'CORE', 'In the past week, I tested myself on material rather than just re-reading', false, 1.3),
('RET_02', 'RETRIEVAL', 'CORE', 'I regularly go back to topics I learned weeks ago to check I still remember them', false, 1.2),
('RET_03', 'RETRIEVAL', 'CORE', 'I prefer re-reading notes to testing myself — it feels more thorough', true, 1.0),
('RET_04', 'RETRIEVAL', 'CORE', 'I use flashcards, quizzes, or practice questions as my main study method', false, 1.1);

-- RECEPTIVITY (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('REC_01', 'RECEPTIVITY', 'CORE', 'I actively ask teachers or peers to point out what I could improve', false, 1.2),
('REC_02', 'RECEPTIVITY', 'CORE', 'When someone criticises my work, my first instinct is to defend it', true, 1.1),
('REC_03', 'RECEPTIVITY', 'CORE', 'I find it useful when people find mistakes in my work', false, 1.0),
('REC_04', 'RECEPTIVITY', 'CORE', 'Getting things wrong feels more like useful information than failure', false, 1.3);

-- ============================================
-- BEHAVIORAL DISPOSITIONS (16 Questions)
-- ============================================

-- STRUCTURE (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('STR_01', 'STRUCTURE', 'CORE', 'I prefer having a detailed plan before starting work', false, 1.1),
('STR_02', 'STRUCTURE', 'CORE', 'I work best when I figure things out as I go', true, 1.0),
('STR_03', 'STRUCTURE', 'CORE', 'Clear instructions help me work more efficiently', false, 1.0),
('STR_04', 'STRUCTURE', 'CORE', 'I feel lost without a checklist or schedule', false, 1.2);

-- CONSISTENCY (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('CON_01', 'CONSISTENCY', 'CORE', 'I study roughly the same amount each day', false, 1.1),
('CON_02', 'CONSISTENCY', 'CORE', 'I often leave work until just before the deadline', true, 1.2),
('CON_03', 'CONSISTENCY', 'CORE', 'My productivity varies wildly day to day', true, 1.0),
('CON_04', 'CONSISTENCY', 'CORE', 'I maintain a regular study routine even when not pressured', false, 1.1);

-- SOCIAL (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('SOC_01', 'SOCIAL', 'CORE', 'I understand things better when I explain them to someone else', false, 1.2),
('SOC_02', 'SOCIAL', 'CORE', 'Other people distract me when I''m trying to learn', true, 1.0),
('SOC_03', 'SOCIAL', 'CORE', 'Group study sessions are more productive than solo study for me', false, 1.1),
('SOC_04', 'SOCIAL', 'CORE', 'I prefer to work through problems on my own before discussing', true, 1.0);

-- DEPTH (4 questions)
INSERT INTO bo_v1_questions (id, dimension, tier, text, reverse_scored, weight) VALUES
('DEP_01', 'DEPTH', 'CORE', 'I want to understand why something works, not just how', false, 1.2),
('DEP_02', 'DEPTH', 'CORE', 'I''m satisfied once I can apply a concept, even without fully understanding it', true, 1.1),
('DEP_03', 'DEPTH', 'CORE', 'I often go deeper into topics than required', false, 1.0),
('DEP_04', 'DEPTH', 'CORE', 'Getting the right answer is more important than understanding the method', true, 1.1);

-- Verify
SELECT dimension, COUNT(*) as count FROM bo_v1_questions GROUP BY dimension ORDER BY dimension;
