-- ExamRizz Arena v6.0 - Vibe Cards Seed
-- Run this AFTER 001_schema.sql

-- Clear existing cards
DELETE FROM bo_v1_vibe_cards;

-- ============================================
-- 12 VIBE SWIPER CARDS
-- ============================================

INSERT INTO bo_v1_vibe_cards (id, image_url, alt_text, right_tags, left_tags, disposition_nudge, sort_order) VALUES

-- Card 1: City vs Campus
('VIBE_01', 
 '/images/vibe/london-skyline.jpg',
 'London skyline at night with modern buildings',
 ARRAY['CITY', 'INTENSIVE', 'FAST_PACED', 'URBAN'],
 ARRAY['CAMPUS', 'RELAXED', 'TRADITIONAL'],
 NULL,
 1),

-- Card 2: Traditional Academic
('VIBE_02',
 '/images/vibe/oxford-quad.jpg',
 'Historic Oxford college quadrangle with stone architecture',
 ARRAY['CAMPUS', 'TRADITIONAL', 'ACADEMIC', 'HISTORIC'],
 ARRAY['MODERN', 'URBAN', 'CONTEMPORARY'],
 '{"dimension": "DEPTH", "right_delta": 3, "left_delta": -2}'::jsonb,
 2),

-- Card 3: Collaborative Learning
('VIBE_03',
 '/images/vibe/group-discussion.jpg',
 'Students engaged in lively group discussion',
 ARRAY['COLLABORATIVE', 'SEMINARS', 'SOCIAL', 'DISCUSSION'],
 ARRAY['INDEPENDENT', 'SOLO', 'QUIET'],
 '{"dimension": "SOCIAL", "right_delta": 4, "left_delta": -3}'::jsonb,
 3),

-- Card 4: Solo Study
('VIBE_04',
 '/images/vibe/library-desk.jpg',
 'Individual study desk in quiet library corner',
 ARRAY['INDEPENDENT', 'RESEARCH', 'QUIET', 'FOCUSED'],
 ARRAY['COLLABORATIVE', 'SOCIAL', 'GROUP'],
 '{"dimension": "SOCIAL", "right_delta": -3, "left_delta": 3}'::jsonb,
 4),

-- Card 5: Science Lab
('VIBE_05',
 '/images/vibe/science-lab.jpg',
 'Modern science laboratory with equipment',
 ARRAY['STEM_PHYSICAL', 'PRACTICAL', 'LAB', 'HANDS_ON'],
 ARRAY['THEORETICAL', 'DESK_BASED', 'HUMANITIES'],
 '{"dimension": "PRECISION", "right_delta": 3, "left_delta": -2}'::jsonb,
 5),

-- Card 6: Courtroom/Law
('VIBE_06',
 '/images/vibe/courtroom.jpg',
 'Formal courtroom with wood panelling',
 ARRAY['SOCIAL_ANALYTICAL', 'LAW', 'FORMAL', 'DEBATE'],
 ARRAY['CREATIVE', 'INFORMAL', 'ARTISTIC'],
 NULL,
 6),

-- Card 7: Art Studio
('VIBE_07',
 '/images/vibe/art-studio.jpg',
 'Creative art studio with paintings and materials',
 ARRAY['HUMANITIES_CREATIVE', 'EXPRESSIVE', 'ARTISTIC', 'DESIGN'],
 ARRAY['ANALYTICAL', 'QUANTITATIVE', 'TECHNICAL'],
 '{"dimension": "TRANSFER", "right_delta": 3, "left_delta": -2}'::jsonb,
 7),

-- Card 8: Hospital/Healthcare
('VIBE_08',
 '/images/vibe/hospital-ward.jpg',
 'Modern hospital ward with medical professionals',
 ARRAY['STEM_LIFE', 'CARE', 'VOCATIONAL', 'HEALTHCARE'],
 ARRAY['THEORETICAL', 'ACADEMIC_ONLY', 'DESK_BASED'],
 '{"dimension": "TOLERANCE", "right_delta": 3, "left_delta": -2}'::jsonb,
 8),

-- Card 9: Trading Floor/Business
('VIBE_09',
 '/images/vibe/trading-floor.jpg',
 'Busy trading floor with multiple screens',
 ARRAY['SOCIAL_ANALYTICAL', 'BUSINESS', 'COMPETITIVE', 'FINANCE'],
 ARRAY['ACADEMIC', 'SLOW_PACED', 'RESEARCH'],
 NULL,
 9),

-- Card 10: Lecture Hall
('VIBE_10',
 '/images/vibe/lecture-hall.jpg',
 'Traditional tiered lecture theatre',
 ARRAY['EXAM_HEAVY', 'LECTURES', 'TRADITIONAL', 'LARGE_GROUP'],
 ARRAY['COURSEWORK', 'SMALL_GROUP', 'SEMINARS'],
 NULL,
 10),

-- Card 11: Seminar Room
('VIBE_11',
 '/images/vibe/seminar-room.jpg',
 'Small seminar room with round table discussion',
 ARRAY['COURSEWORK_HEAVY', 'DISCUSSION', 'SEMINARS', 'INTERACTIVE'],
 ARRAY['EXAM_HEAVY', 'LECTURES', 'PASSIVE'],
 '{"dimension": "RECEPTIVITY", "right_delta": 3, "left_delta": -2}'::jsonb,
 11),

-- Card 12: Outdoor Fieldwork
('VIBE_12',
 '/images/vibe/fieldwork.jpg',
 'Students conducting outdoor fieldwork research',
 ARRAY['APPLIED_VOCATIONAL', 'PRACTICAL', 'OUTDOOR', 'FIELDWORK'],
 ARRAY['DESK_BASED', 'INDOOR', 'THEORETICAL'],
 '{"dimension": "TOLERANCE", "right_delta": 2, "left_delta": -1}'::jsonb,
 12);

-- Verify
SELECT id, alt_text, array_length(right_tags, 1) as right_count, array_length(left_tags, 1) as left_count 
FROM bo_v1_vibe_cards 
ORDER BY sort_order;
