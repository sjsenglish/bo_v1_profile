-- ExamRizz Arena v6.0 - Sample Courses (for testing)
-- Run this AFTER 001_schema.sql
-- This provides 50 test courses. Replace with full HESA dataset later.

-- Clear existing courses
DELETE FROM bo_v1_courses;

-- ============================================
-- SAMPLE COURSES (50 across different CAH groups)
-- ============================================

INSERT INTO bo_v1_courses (
  id, ukprn, university, course_name, ucas_code, degree_type, duration_years,
  region, russell_group, cah_code, subject_area, subject_tags,
  ucas_points, nss_overall, employment_rate, median_salary_3yr,
  assessment_exam_pct, assessment_coursework_pct, assessment_practical_pct,
  demand_calibration, demand_tolerance, demand_transfer, demand_precision, demand_retrieval, demand_receptivity,
  demand_structure, demand_consistency, demand_social, demand_depth,
  importance_calibration, importance_tolerance, importance_precision
) VALUES

-- MEDICINE & DENTISTRY (CAH01)
('ox-med-a100', '10007774', 'University of Oxford', 'Medicine', 'A100', 'MBBS', 6,
 'South East', true, 'CAH01-01-01', 'Medicine', ARRAY['STEM_LIFE', 'HEALTHCARE', 'VOCATIONAL'],
 144, 85, 98, 52000,
 60, 20, 20,
 75, 80, 60, 85, 70, 75, 70, 80, 65, 80,
 'CRITICAL', 'CRITICAL', 'CRITICAL'),

('cam-med-a100', '10007788', 'University of Cambridge', 'Medicine', 'A100', 'MB BChir', 6,
 'East of England', true, 'CAH01-01-01', 'Medicine', ARRAY['STEM_LIFE', 'HEALTHCARE', 'VOCATIONAL'],
 144, 87, 99, 54000,
 65, 15, 20,
 78, 82, 62, 88, 72, 73, 68, 82, 60, 85,
 'CRITICAL', 'CRITICAL', 'CRITICAL'),

('ucl-dent-a200', '10007784', 'UCL', 'Dentistry', 'A200', 'BDS', 5,
 'London', true, 'CAH01-01-02', 'Dentistry', ARRAY['STEM_LIFE', 'HEALTHCARE', 'PRACTICAL'],
 136, 82, 97, 48000,
 50, 20, 30,
 72, 78, 55, 88, 68, 70, 72, 75, 55, 75,
 'CRITICAL', 'IMPORTANT', 'CRITICAL'),

-- COMPUTER SCIENCE (CAH10-01)
('ox-cs-g400', '10007774', 'University of Oxford', 'Computer Science', 'G400', 'BSc', 3,
 'South East', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL', 'ANALYTICAL'],
 144, 88, 92, 45000,
 70, 30, 0,
 70, 75, 70, 78, 65, 60, 60, 70, 45, 80,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('cam-cs-g400', '10007788', 'University of Cambridge', 'Computer Science', 'G400', 'BA', 3,
 'East of England', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL', 'ANALYTICAL'],
 144, 90, 94, 48000,
 75, 25, 0,
 72, 78, 72, 80, 68, 58, 55, 72, 40, 85,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('imperial-cs-g400', '10003270', 'Imperial College London', 'Computing', 'G400', 'MEng', 4,
 'London', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL', 'INTENSIVE'],
 144, 85, 95, 52000,
 60, 30, 10,
 68, 80, 68, 82, 65, 62, 65, 75, 50, 82,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('edinburgh-cs-g400', '10007790', 'University of Edinburgh', 'Computer Science', 'G400', 'BSc', 4,
 'Scotland', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL'],
 136, 80, 90, 42000,
 55, 35, 10,
 65, 72, 65, 75, 62, 65, 58, 68, 55, 75,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

-- ENGINEERING (CAH09)
('cam-eng-h100', '10007788', 'University of Cambridge', 'Engineering', 'H100', 'MEng', 4,
 'East of England', true, 'CAH09-01-01', 'Engineering', ARRAY['STEM_ENGINEERING', 'PRACTICAL', 'TECHNICAL'],
 144, 88, 93, 46000,
 70, 15, 15,
 70, 82, 68, 85, 65, 58, 65, 78, 55, 80,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('imperial-mech-h300', '10003270', 'Imperial College London', 'Mechanical Engineering', 'H300', 'MEng', 4,
 'London', true, 'CAH09-01-02', 'Mechanical Engineering', ARRAY['STEM_ENGINEERING', 'PRACTICAL'],
 136, 82, 92, 44000,
 65, 20, 15,
 68, 78, 62, 82, 62, 60, 68, 75, 50, 78,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

-- LAW (CAH16)
('ox-law-m100', '10007774', 'University of Oxford', 'Law', 'M100', 'BA', 3,
 'South East', true, 'CAH16-01-01', 'Law', ARRAY['LAW', 'ANALYTICAL', 'DEBATE'],
 144, 85, 88, 42000,
 80, 20, 0,
 80, 65, 70, 75, 85, 68, 70, 72, 60, 78,
 'CRITICAL', 'IMPORTANT', 'IMPORTANT'),

('cam-law-m100', '10007788', 'University of Cambridge', 'Law', 'M100', 'BA', 3,
 'East of England', true, 'CAH16-01-01', 'Law', ARRAY['LAW', 'ANALYTICAL', 'DEBATE'],
 144, 88, 90, 44000,
 85, 15, 0,
 82, 68, 72, 78, 88, 65, 68, 75, 55, 82,
 'CRITICAL', 'IMPORTANT', 'IMPORTANT'),

('lse-law-m100', '10004063', 'LSE', 'Law', 'M100', 'LLB', 3,
 'London', true, 'CAH16-01-01', 'Law', ARRAY['LAW', 'ANALYTICAL'],
 144, 78, 85, 40000,
 75, 25, 0,
 78, 62, 68, 72, 82, 70, 72, 70, 65, 75,
 'CRITICAL', 'IMPORTANT', 'IMPORTANT'),

-- ECONOMICS (CAH17)
('ox-econ-l100', '10007774', 'University of Oxford', 'Economics and Management', 'L100', 'BA', 3,
 'South East', true, 'CAH17-01-01', 'Economics', ARRAY['BUSINESS', 'ANALYTICAL', 'QUANTITATIVE'],
 144, 82, 92, 48000,
 70, 30, 0,
 72, 68, 75, 70, 70, 68, 60, 70, 60, 75,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('cam-econ-l100', '10007788', 'University of Cambridge', 'Economics', 'L100', 'BA', 3,
 'East of England', true, 'CAH17-01-01', 'Economics', ARRAY['BUSINESS', 'ANALYTICAL', 'QUANTITATIVE'],
 144, 85, 94, 50000,
 75, 25, 0,
 75, 70, 78, 72, 72, 65, 55, 72, 50, 80,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('lse-econ-l100', '10004063', 'LSE', 'Economics', 'L100', 'BSc', 3,
 'London', true, 'CAH17-01-01', 'Economics', ARRAY['BUSINESS', 'ANALYTICAL', 'QUANTITATIVE'],
 144, 75, 90, 45000,
 80, 20, 0,
 74, 72, 72, 75, 75, 65, 62, 75, 55, 78,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

-- PPE (CAH15/20)
('ox-ppe-v000', '10007774', 'University of Oxford', 'Philosophy, Politics and Economics', 'V000', 'BA', 3,
 'South East', true, 'CAH15-01-01', 'Politics', ARRAY['SOCIAL_ANALYTICAL', 'DEBATE', 'INTERDISCIPLINARY'],
 144, 86, 88, 42000,
 65, 35, 0,
 75, 65, 82, 65, 75, 72, 55, 68, 70, 82,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

-- PSYCHOLOGY (CAH04)
('ox-psych-c800', '10007774', 'University of Oxford', 'Psychology', 'C800', 'BA', 3,
 'South East', true, 'CAH04-01-01', 'Psychology', ARRAY['SOCIAL_ANALYTICAL', 'RESEARCH'],
 144, 84, 82, 32000,
 60, 30, 10,
 72, 65, 75, 68, 70, 72, 55, 65, 60, 78,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('ucl-psych-c800', '10007784', 'UCL', 'Psychology', 'C800', 'BSc', 3,
 'London', true, 'CAH04-01-01', 'Psychology', ARRAY['SOCIAL_ANALYTICAL', 'RESEARCH'],
 136, 80, 80, 30000,
 55, 35, 10,
 68, 62, 72, 65, 68, 75, 58, 62, 65, 72,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

-- ENGLISH (CAH14)
('ox-eng-q300', '10007774', 'University of Oxford', 'English Language and Literature', 'Q300', 'BA', 3,
 'South East', true, 'CAH14-01-01', 'English', ARRAY['HUMANITIES_CREATIVE', 'WRITING', 'ANALYSIS'],
 144, 88, 75, 28000,
 40, 60, 0,
 70, 55, 78, 60, 72, 78, 45, 60, 55, 85,
 'IMPORTANT', 'BENEFICIAL', 'BENEFICIAL'),

('cam-eng-q300', '10007788', 'University of Cambridge', 'English', 'Q300', 'BA', 3,
 'East of England', true, 'CAH14-01-01', 'English', ARRAY['HUMANITIES_CREATIVE', 'WRITING', 'ANALYSIS'],
 144, 90, 78, 30000,
 35, 65, 0,
 72, 58, 80, 62, 75, 80, 42, 58, 52, 88,
 'IMPORTANT', 'BENEFICIAL', 'BENEFICIAL'),

-- HISTORY (CAH20)
('ox-hist-v100', '10007774', 'University of Oxford', 'History', 'V100', 'BA', 3,
 'South East', true, 'CAH20-01-01', 'History', ARRAY['HUMANITIES', 'RESEARCH', 'ANALYSIS'],
 144, 87, 72, 28000,
 50, 50, 0,
 72, 58, 75, 62, 78, 75, 48, 62, 55, 82,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

('cam-hist-v100', '10007788', 'University of Cambridge', 'History', 'V100', 'BA', 3,
 'East of England', true, 'CAH20-01-01', 'History', ARRAY['HUMANITIES', 'RESEARCH', 'ANALYSIS'],
 144, 89, 75, 30000,
 55, 45, 0,
 74, 60, 78, 65, 80, 72, 45, 60, 50, 85,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

-- MATHS (CAH09)
('ox-maths-g100', '10007774', 'University of Oxford', 'Mathematics', 'G100', 'MMath', 4,
 'South East', true, 'CAH09-02-01', 'Mathematics', ARRAY['STEM_MATHS', 'ANALYTICAL', 'THEORETICAL'],
 144, 88, 85, 40000,
 90, 10, 0,
 75, 85, 72, 88, 70, 55, 50, 80, 40, 90,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('cam-maths-g100', '10007788', 'University of Cambridge', 'Mathematics', 'G100', 'BA/MMath', 4,
 'East of England', true, 'CAH09-02-01', 'Mathematics', ARRAY['STEM_MATHS', 'ANALYTICAL', 'THEORETICAL'],
 144, 90, 88, 42000,
 95, 5, 0,
 78, 88, 75, 90, 72, 52, 48, 82, 35, 92,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('imperial-maths-g100', '10003270', 'Imperial College London', 'Mathematics', 'G100', 'BSc', 3,
 'London', true, 'CAH09-02-01', 'Mathematics', ARRAY['STEM_MATHS', 'ANALYTICAL'],
 144, 82, 90, 45000,
 85, 15, 0,
 72, 82, 68, 85, 68, 58, 55, 78, 45, 85,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

-- PHYSICS (CAH07)
('ox-phys-f300', '10007774', 'University of Oxford', 'Physics', 'F300', 'MPhys', 4,
 'South East', true, 'CAH07-01-01', 'Physics', ARRAY['STEM_PHYSICAL', 'THEORETICAL', 'LAB'],
 144, 86, 88, 38000,
 75, 10, 15,
 72, 82, 70, 85, 68, 58, 55, 78, 45, 85,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

('cam-phys-f300', '10007788', 'University of Cambridge', 'Natural Sciences (Physical)', 'F300', 'BA/MSci', 4,
 'East of England', true, 'CAH07-01-01', 'Physics', ARRAY['STEM_PHYSICAL', 'THEORETICAL', 'LAB'],
 144, 88, 90, 40000,
 70, 10, 20,
 75, 85, 75, 88, 70, 60, 52, 80, 50, 88,
 'IMPORTANT', 'CRITICAL', 'CRITICAL'),

-- CHEMISTRY (CAH07)
('ox-chem-f100', '10007774', 'University of Oxford', 'Chemistry', 'F100', 'MChem', 4,
 'South East', true, 'CAH07-02-01', 'Chemistry', ARRAY['STEM_PHYSICAL', 'LAB', 'PRACTICAL'],
 144, 85, 87, 36000,
 65, 15, 20,
 70, 78, 68, 88, 68, 62, 60, 75, 50, 82,
 'IMPORTANT', 'IMPORTANT', 'CRITICAL'),

('imperial-chem-f100', '10003270', 'Imperial College London', 'Chemistry', 'F100', 'MSci', 4,
 'London', true, 'CAH07-02-01', 'Chemistry', ARRAY['STEM_PHYSICAL', 'LAB', 'PRACTICAL'],
 136, 78, 88, 38000,
 60, 15, 25,
 68, 75, 65, 85, 65, 65, 62, 72, 55, 78,
 'IMPORTANT', 'IMPORTANT', 'CRITICAL'),

-- BIOLOGY (CAH03)
('ox-bio-c100', '10007774', 'University of Oxford', 'Biological Sciences', 'C100', 'BA', 3,
 'South East', true, 'CAH03-01-01', 'Biology', ARRAY['STEM_LIFE', 'LAB', 'RESEARCH'],
 144, 84, 80, 32000,
 55, 25, 20,
 68, 70, 72, 78, 70, 68, 55, 68, 55, 80,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('cam-bio-c100', '10007788', 'University of Cambridge', 'Natural Sciences (Biological)', 'C100', 'BA/MSci', 4,
 'East of England', true, 'CAH03-01-01', 'Biology', ARRAY['STEM_LIFE', 'LAB', 'RESEARCH'],
 144, 87, 82, 34000,
 50, 25, 25,
 70, 72, 75, 80, 72, 70, 52, 70, 58, 82,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

-- ARCHITECTURE (CAH13)
('ucl-arch-k100', '10007784', 'UCL', 'Architecture', 'K100', 'BSc', 3,
 'London', true, 'CAH13-01-01', 'Architecture', ARRAY['DESIGN', 'CREATIVE', 'TECHNICAL'],
 136, 75, 78, 30000,
 20, 50, 30,
 65, 72, 78, 70, 55, 75, 55, 65, 68, 75,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('cam-arch-k100', '10007788', 'University of Cambridge', 'Architecture', 'K100', 'BA', 3,
 'East of England', true, 'CAH13-01-01', 'Architecture', ARRAY['DESIGN', 'CREATIVE', 'TECHNICAL'],
 136, 82, 82, 32000,
 15, 55, 30,
 68, 75, 80, 72, 58, 78, 52, 68, 65, 78,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

-- PHILOSOPHY (CAH20)
('ox-phil-v500', '10007774', 'University of Oxford', 'Philosophy', 'V500', 'BA', 3,
 'South East', true, 'CAH20-02-01', 'Philosophy', ARRAY['HUMANITIES', 'ANALYTICAL', 'THEORETICAL'],
 144, 85, 70, 28000,
 50, 50, 0,
 75, 62, 85, 60, 68, 72, 40, 55, 60, 88,
 'IMPORTANT', 'BENEFICIAL', 'BENEFICIAL'),

-- CLASSICS (CAH14)
('ox-class-q800', '10007774', 'University of Oxford', 'Classics', 'Q800', 'BA', 4,
 'South East', true, 'CAH14-02-01', 'Classics', ARRAY['HUMANITIES', 'LANGUAGES', 'TRADITIONAL'],
 144, 92, 72, 28000,
 55, 45, 0,
 72, 60, 75, 68, 80, 68, 50, 62, 50, 85,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

('cam-class-q800', '10007788', 'University of Cambridge', 'Classics', 'Q800', 'BA', 4,
 'East of England', true, 'CAH14-02-01', 'Classics', ARRAY['HUMANITIES', 'LANGUAGES', 'TRADITIONAL'],
 144, 94, 75, 30000,
 60, 40, 0,
 74, 62, 78, 70, 82, 65, 48, 60, 45, 88,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

-- MODERN LANGUAGES (CAH19)
('ox-modlang-r100', '10007774', 'University of Oxford', 'Modern Languages', 'R100', 'BA', 4,
 'South East', true, 'CAH19-01-01', 'Modern Languages', ARRAY['LANGUAGES', 'CULTURAL', 'YEAR_ABROAD'],
 144, 88, 78, 30000,
 45, 55, 0,
 68, 62, 75, 60, 75, 78, 50, 60, 62, 75,
 'IMPORTANT', 'BENEFICIAL', 'BENEFICIAL'),

-- GEOGRAPHY (CAH12)
('ox-geog-f800', '10007774', 'University of Oxford', 'Geography', 'F800', 'BA', 3,
 'South East', true, 'CAH12-01-01', 'Geography', ARRAY['FIELDWORK', 'INTERDISCIPLINARY', 'RESEARCH'],
 144, 85, 82, 32000,
 45, 40, 15,
 68, 65, 78, 62, 65, 72, 52, 62, 60, 75,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

('cam-geog-f800', '10007788', 'University of Cambridge', 'Geography', 'F800', 'BA', 3,
 'East of England', true, 'CAH12-01-01', 'Geography', ARRAY['FIELDWORK', 'INTERDISCIPLINARY', 'RESEARCH'],
 144, 88, 85, 34000,
 50, 35, 15,
 70, 68, 80, 65, 68, 70, 50, 65, 58, 78,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

-- MUSIC (CAH21)
('ox-music-w300', '10007774', 'University of Oxford', 'Music', 'W300', 'BA', 3,
 'South East', true, 'CAH21-01-02', 'Music', ARRAY['CREATIVE', 'PERFORMANCE', 'ACADEMIC'],
 144, 90, 68, 25000,
 35, 45, 20,
 65, 60, 80, 72, 65, 75, 45, 58, 55, 82,
 'IMPORTANT', 'BENEFICIAL', 'IMPORTANT'),

-- ART HISTORY (CAH21)
('ox-arthistory-v350', '10007774', 'University of Oxford', 'History of Art', 'V350', 'BA', 3,
 'South East', true, 'CAH21-02-01', 'Art History', ARRAY['HUMANITIES_CREATIVE', 'VISUAL', 'ANALYTICAL'],
 144, 88, 72, 26000,
 40, 60, 0,
 68, 55, 82, 58, 68, 78, 42, 55, 50, 80,
 'IMPORTANT', 'BENEFICIAL', 'BENEFICIAL'),

-- NON-RUSSELL GROUP EXAMPLES
('leeds-cs-g400', '10007795', 'University of Leeds', 'Computer Science', 'G400', 'BSc', 3,
 'Yorkshire', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL'],
 128, 78, 85, 35000,
 50, 40, 10,
 62, 68, 62, 72, 60, 65, 62, 65, 55, 70,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('manchester-cs-g400', '10007798', 'University of Manchester', 'Computer Science', 'G400', 'BSc', 3,
 'North West', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL'],
 136, 75, 88, 38000,
 55, 35, 10,
 65, 70, 65, 75, 62, 62, 60, 68, 52, 72,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('bristol-cs-g400', '10007786', 'University of Bristol', 'Computer Science', 'G400', 'BSc', 3,
 'South West', true, 'CAH10-01-01', 'Computer Science', ARRAY['STEM_COMPUTING', 'TECHNICAL'],
 136, 80, 90, 40000,
 55, 35, 10,
 66, 72, 66, 76, 63, 64, 58, 70, 50, 74,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('warwick-econ-l100', '10007163', 'University of Warwick', 'Economics', 'L100', 'BSc', 3,
 'West Midlands', true, 'CAH17-01-01', 'Economics', ARRAY['BUSINESS', 'ANALYTICAL', 'QUANTITATIVE'],
 144, 78, 88, 42000,
 70, 30, 0,
 70, 68, 70, 72, 70, 68, 60, 72, 55, 75,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('durham-law-m100', '10007143', 'Durham University', 'Law', 'M100', 'LLB', 3,
 'North East', true, 'CAH16-01-01', 'Law', ARRAY['LAW', 'ANALYTICAL'],
 144, 82, 85, 38000,
 70, 30, 0,
 75, 60, 65, 70, 78, 70, 68, 68, 58, 72,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT'),

('kcl-med-a100', '10003645', 'King''s College London', 'Medicine', 'A100', 'MBBS', 5,
 'London', true, 'CAH01-01-01', 'Medicine', ARRAY['STEM_LIFE', 'HEALTHCARE', 'VOCATIONAL'],
 136, 80, 96, 48000,
 55, 25, 20,
 72, 75, 58, 82, 68, 72, 68, 75, 62, 75,
 'CRITICAL', 'CRITICAL', 'CRITICAL'),

('exeter-law-m100', '10007792', 'University of Exeter', 'Law', 'M100', 'LLB', 3,
 'South West', true, 'CAH16-01-01', 'Law', ARRAY['LAW', 'ANALYTICAL'],
 136, 85, 82, 35000,
 65, 35, 0,
 72, 58, 62, 68, 75, 72, 65, 65, 60, 70,
 'IMPORTANT', 'IMPORTANT', 'IMPORTANT');

-- Verify
SELECT 
  cah_code,
  COUNT(*) as course_count,
  AVG(ucas_points) as avg_ucas,
  AVG(nss_overall) as avg_nss
FROM bo_v1_courses 
GROUP BY cah_code 
ORDER BY cah_code;
