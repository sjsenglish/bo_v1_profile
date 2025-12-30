-- ============================================================================
-- SEED DATA: STEM_PHYS CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:31.511Z
-- Sources: claude-3.5
-- Items: 15
-- ============================================================================

-- SUPERCURRICULARS

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'book_what_is_mathematics', 'BOOK', 'PHYSICAL_BOOK',
  'What Is Mathematics?', 'An Elementary Approach to Ideas and Methods', 'Courant and Robbins'' classic text covering number theory, geometry, topology, calculus, and more. Goes beyond school curriculum to show what university mathematics is really about. Challenging but essential for serious maths applicants.',
  'Richard Courant & Herbert Robbins', 'Courant: founder of Courant Institute, NYU; leading mathematician', 'Oxford University Press', 1941,
  '978-0195105193', NULL,
  true, 8, 1800,
  'STEM_PHYS', '{}', ARRAY['mathematics', 'number-theory', 'geometry', 'topology', 'calculus', 'rigorous'], ARRAY['mathematics', 'maths'],
  'Classic text recommended by Cambridge Maths Faculty', 'UNIVERSITY_READING_LIST', 'Demonstrates serious mathematical commitment and ability', 95,
  80, 85, 85,
  65, 55, 70,
  ARRAY['A-level Maths (or studying)', 'Strong GCSE foundation'], ARRAY['Y12', 'Y13'],
  '30+ hours (can be read selectively)', 'FLEXIBLE', NULL, false,
  false, 15.99, 'Dense - best read chapter by chapter. University libraries have copies.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'work_experience_physics_research', 'WORK_EXPERIENCE', 'IN_PERSON',
  'University Physics Research Experience', NULL, 'Summer research placements in university physics departments. Exposure to real research methods, laboratory work, or computational physics. Competitive but excellent for demonstrating genuine physics interest. Some universities offer structured programmes.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 4800,
  'STEM_PHYS', '{}', ARRAY['work-experience', 'research', 'laboratory', 'university', 'summer'], ARRAY['physics', 'natural sciences'],
  NULL, NULL, 'Research experience highly valued for competitive physics applications', 88,
  65, 70, 60,
  50, 60, 55,
  ARRAY['A-level Physics (or studying)', 'A-level Maths'], ARRAY['Y12', 'Y13'],
  '1-2 weeks typically', 'ONE_OFF', NULL, false,
  true, NULL, 'Competitive. Try Nuffield Research Placements, contact local universities directly, or look for departmental schemes.',
  TRUE, FALSE, 'MEDIUM'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'book_surely_youre_joking', 'BOOK', 'PHYSICAL_BOOK',
  'Surely You''re Joking, Mr Feynman!', 'Adventures of a Curious Character', 'Richard Feynman''s autobiography capturing his irreverent approach to physics and life. From safecracking at Los Alamos to Nobel Prize-winning work on QED. Inspires curiosity and unconventional thinking essential for physicists.',
  'Richard P. Feynman', 'Nobel Prize in Physics 1965; Professor at Caltech', 'Vintage', 1985,
  '978-0099173311', NULL,
  true, 45, 540,
  'STEM_PHYS', '{}', ARRAY['physics', 'memoir', 'curiosity', 'problem-solving', 'Nobel', 'Feynman'], ARRAY['physics', 'natural sciences'],
  'Written by Nobel laureate; widely recommended for physics applicants', 'AWARD_WINNER', 'Shows passion for physics beyond equations', 92,
  45, 55, 35,
  45, 40, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '9-11 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available. Audiobook excellent. Sequel ''What Do You Care What Other People Think?'' also recommended.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'book_brief_history_time', 'BOOK', 'PHYSICAL_BOOK',
  'A Brief History of Time', 'From the Big Bang to Black Holes', 'Stephen Hawking''s landmark popular science book on cosmology, black holes, and the nature of time. Accessible introduction to theoretical physics concepts. Shows ability to engage with fundamental questions about the universe.',
  'Stephen Hawking', 'Lucasian Professor of Mathematics, Cambridge; pioneering cosmologist', 'Bantam', 1988,
  '978-0857501004', NULL,
  true, 12, 420,
  'STEM_PHYS', '{}', ARRAY['cosmology', 'physics', 'black-holes', 'time', 'universe', 'theoretical'], ARRAY['physics', 'astrophysics', 'cosmology', 'natural sciences'],
  'Cambridge cosmologist; international bestseller', 'UNIVERSITY_READING_LIST', 'Classic physics text demonstrating interest in fundamental questions', 90,
  65, 45, 40,
  50, 55, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '7-9 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available in all formats. Illustrated edition helpful.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'book_fermats_last_theorem', 'BOOK', 'PHYSICAL_BOOK',
  'Fermat''s Last Theorem', NULL, 'Simon Singh''s gripping account of Andrew Wiles'' proof of Fermat''s Last Theorem. Weaves together mathematical history, biography, and the drama of mathematical discovery. Shows mathematics as a creative, human endeavour.',
  'Simon Singh', 'PhD in particle physics, Cambridge; BAFTA-winning science journalist', 'Fourth Estate', 1997,
  '978-1841157917', NULL,
  true, 7, 480,
  'STEM_PHYS', '{}', ARRAY['mathematics', 'history', 'proof', 'number-theory', 'Fermat', 'Wiles'], ARRAY['mathematics', 'maths'],
  'BAFTA-winning documentary companion; widely recommended for maths applicants', 'AWARD_WINNER', 'Demonstrates appreciation for mathematical beauty and persistence', 88,
  55, 50, 45,
  50, 45, 35,
  ARRAY['GCSE Maths'], ARRAY['Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available. BBC documentary also excellent.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'book_qed', 'BOOK', 'PHYSICAL_BOOK',
  'QED', 'The Strange Theory of Light and Matter', 'Feynman''s four lectures explaining quantum electrodynamics to a general audience. Demonstrates how complex physics can be communicated accessibly. Excellent preparation for understanding quantum mechanics at university level.',
  'Richard P. Feynman', 'Nobel Prize in Physics 1965 for work on QED', 'Penguin', 1985,
  '978-0140125054', NULL,
  true, 4, 300,
  'STEM_PHYS', '{}', ARRAY['quantum-mechanics', 'QED', 'physics', 'light', 'Feynman', 'theoretical'], ARRAY['physics', 'natural sciences'],
  'Nobel laureate explaining his prize-winning work', 'AWARD_WINNER', 'Shows engagement with quantum physics beyond A-level', 92,
  75, 35, 55,
  55, 65, 45,
  ARRAY['A-level Physics (or studying)'], ARRAY['Y12', 'Y13'],
  '5-6 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Short but dense. Video lectures also available online.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'course_intro_mathematical_thinking', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Mathematical Thinking', NULL, 'Stanford course teaching the transition from school maths to university maths. Focuses on proof, logic, and mathematical communication rather than calculation. Essential preparation for maths degrees.',
  'Stanford University', 'Keith Devlin, mathematician and NPR''s ''Math Guy''', 'Coursera', 2012,
  NULL, 'https://www.coursera.org/learn/mathematical-thinking',
  true, 10, 2400,
  'STEM_PHYS', '{}', ARRAY['mathematics', 'proof', 'logic', 'mathematical-thinking', 'university-prep'], ARRAY['mathematics', 'maths'],
  'Stanford University', 'UNIVERSITY_READING_LIST', 'Demonstrates readiness for university-level mathematical rigour', 92,
  75, 75, 70,
  60, 60, 60,
  ARRAY['A-level Maths (or studying)'], ARRAY['Y12', 'Y13'],
  '10 weeks, 4 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit on Coursera. Challenging but highly valuable.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'course_quantum_mechanics', 'COURSE', 'VIDEO_COURSE',
  'Quantum Mechanics for Everyone', NULL, 'Georgetown University course introducing quantum mechanics concepts without heavy mathematics. Covers superposition, entanglement, and quantum computing. Makes quantum physics accessible while maintaining rigour.',
  'Georgetown University', 'James Freericks, Professor of Physics', 'edX', 2017,
  NULL, 'https://www.edx.org/learn/quantum-mechanics/georgetown-university-quantum-mechanics-for-everyone',
  true, 4, 960,
  'STEM_PHYS', ARRAY['COMP'], ARRAY['quantum-mechanics', 'physics', 'quantum-computing', 'entanglement'], ARRAY['physics', 'quantum'],
  'Georgetown University', 'UNIVERSITY_READING_LIST', 'Shows engagement with cutting-edge physics', 82,
  70, 55, 50,
  55, 65, 50,
  ARRAY['GCSE Maths', 'Basic physics understanding'], ARRAY['Y11', 'Y12', 'Y13'],
  '4 weeks, 4 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit on edX. Conceptual rather than mathematical.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'course_mit_physics', 'COURSE', 'VIDEO_COURSE',
  'MIT OpenCourseWare: Physics I - Classical Mechanics', NULL, 'Full MIT undergraduate physics course with video lectures by Walter Lewin. Famous for dramatic demonstrations. Goes beyond A-level in depth and rigour. Shows what university physics teaching looks like.',
  'MIT', 'Walter Lewin, Professor of Physics, MIT', 'MIT OpenCourseWare', 2005,
  NULL, 'https://ocw.mit.edu/courses/8-01sc-classical-mechanics-fall-2016/',
  true, 35, 2100,
  'STEM_PHYS', ARRAY['ENG'], ARRAY['physics', 'mechanics', 'MIT', 'university-level', 'demonstrations'], ARRAY['physics', 'natural sciences', 'engineering'],
  'MIT official course materials', 'UNIVERSITY_READING_LIST', 'Demonstrates ability to engage with university-level physics', 95,
  70, 80, 75,
  55, 45, 65,
  ARRAY['A-level Maths (or studying)', 'A-level Physics (or studying)'], ARRAY['Y12', 'Y13'],
  'Semester-long - can watch selectively', 'FLEXIBLE', NULL, false,
  true, NULL, 'Completely free. Problem sets available. Can watch specific topics.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'competition_bpho', 'COMPETITION', 'MIXED',
  'British Physics Olympiad', NULL, 'National physics competition with multiple rounds. Tests problem-solving beyond A-level. Top performers invited to training camp for International Physics Olympiad selection. Gold awards highly valued by universities.',
  'British Physics Olympiad', 'Run by University of Oxford Physics Department', 'BPHO', 2024,
  NULL, 'https://www.bpho.org.uk',
  false, NULL, 3000,
  'STEM_PHYS', '{}', ARRAY['physics', 'olympiad', 'competition', 'problem-solving', 'award'], ARRAY['physics', 'natural sciences'],
  'University of Oxford Physics Department', 'UNIVERSITY_READING_LIST', 'Awards demonstrate exceptional physics ability', 95,
  85, 60, 85,
  50, 55, 70,
  ARRAY['A-level Physics (or studying)', 'Strong A-level Maths'], ARRAY['Y12', 'Y13'],
  '30-50 hours preparation + competition', 'DEADLINE', 'November', true,
  true, NULL, 'Enter through school. Past papers free on website.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'competition_ukmt', 'COMPETITION', 'MIXED',
  'UKMT Senior Mathematical Challenge', NULL, 'National maths competition for Y12-13 students. Multiple choice problems testing mathematical thinking. Top scorers qualify for British Mathematical Olympiad. Gold, Silver, Bronze certificates widely recognised.',
  'UK Mathematics Trust', 'Educational charity promoting mathematical enrichment', 'UKMT', 2024,
  NULL, 'https://www.ukmt.org.uk/competitions/solo/senior-mathematical-challenge',
  false, NULL, 1200,
  'STEM_PHYS', '{}', ARRAY['mathematics', 'competition', 'problem-solving', 'UKMT', 'olympiad'], ARRAY['mathematics', 'maths'],
  'UK Mathematics Trust', 'PROFESSIONAL_BODY', 'Gold/BMO qualification demonstrates strong mathematical ability', 92,
  75, 40, 80,
  45, 50, 55,
  ARRAY['A-level Maths (or studying)'], ARRAY['Y12', 'Y13'],
  '15-30 hours preparation + 90 min exam', 'DEADLINE', 'November', true,
  true, NULL, 'Enter through school. Past papers free on UKMT website.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'test_mat', 'ADMISSION_TEST', 'INTERACTIVE',
  'MAT (Mathematics Admissions Test)', NULL, 'Required for Mathematics, Computer Science, and joint honours at Oxford. Also used by Imperial and Warwick for some courses. Tests mathematical problem-solving and proof. Dedicated preparation essential.',
  'University of Oxford', 'Oxford Mathematical Institute', 'University of Oxford', 2024,
  NULL, 'https://www.maths.ox.ac.uk/study-here/undergraduate-study/maths-admissions-test',
  true, 2, 4800,
  'STEM_PHYS', ARRAY['COMP'], ARRAY['admissions-test', 'MAT', 'mathematics', 'oxford', 'proof', 'problem-solving'], ARRAY['mathematics', 'maths', 'computer science'],
  'Required by Oxford for Maths, CompSci; Imperial for some courses', 'PROFESSIONAL_BODY', 'Strong MAT score essential for Oxford Maths offer', 98,
  85, 75, 90,
  50, 55, 65,
  ARRAY['A-level Maths (studying)', 'Strong GCSE foundation'], ARRAY['Y13'],
  '50-80 hours preparation', 'DEADLINE', 'October', true,
  true, NULL, 'Sit at school or test centre. Past papers and solutions free on Oxford website.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'video_3blue1brown', 'VIDEO', 'YOUTUBE',
  '3Blue1Brown', 'Mathematics visualisation channel', 'Grant Sanderson''s acclaimed YouTube channel using animation to explain mathematical concepts. Series on linear algebra, calculus, and neural networks particularly valuable. Makes abstract maths visual and intuitive.',
  'Grant Sanderson', 'Stanford maths graduate; educator', '3Blue1Brown', 2015,
  NULL, 'https://www.youtube.com/@3blue1brown',
  true, NULL, NULL,
  'STEM_PHYS', ARRAY['COMP'], ARRAY['mathematics', 'visualisation', 'linear-algebra', 'calculus', 'youtube'], ARRAY['mathematics', 'maths', 'computer science'],
  '5M+ subscribers; widely used in university teaching', 'COMMUNITY_RECOMMENDED', 'Demonstrates engagement with mathematical intuition beyond calculation', 88,
  65, 30, 55,
  45, 50, 30,
  ARRAY['GCSE Maths for most videos'], ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  'Variable - 15-30 mins per video', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube. Linear algebra and calculus series particularly recommended.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'podcast_infinite_monkey_cage', 'PODCAST', 'PODCAST_AUDIO',
  'The Infinite Monkey Cage', 'BBC Radio 4', 'Brian Cox and Robin Ince''s witty science panel show. Physicists, mathematicians, and comedians discuss scientific topics accessibly. Good for staying engaged with physics and science communication.',
  'BBC Radio 4', 'Brian Cox, Professor of Physics, Manchester; particle physicist', 'BBC', 2009,
  NULL, 'https://www.bbc.co.uk/programmes/b00snr0w',
  false, NULL, NULL,
  'STEM_PHYS', ARRAY['STEM_LIFE'], ARRAY['physics', 'science', 'podcast', 'humour', 'Brian-Cox'], ARRAY['physics', 'natural sciences'],
  'BBC; hosted by particle physicist Brian Cox', 'ESTABLISHED_MEDIA', 'Shows ongoing interest in physics and science communication', 80,
  45, 20, 30,
  45, 40, 20,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '45 mins per episode, ongoing', 'ONGOING', NULL, false,
  true, NULL, 'Free on BBC Sounds. Large archive available.',
  TRUE, FALSE, 'HIGH'
);

INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  'epq_idea_dark_matter', 'EPQ_IDEA', 'MIXED',
  'EPQ: The Search for Dark Matter', NULL, 'Extended Project investigating dark matter - evidence for its existence, detection methods, and current experiments like LUX-ZEPLIN. Could include analysis of rotation curves, gravitational lensing data, or comparison of detection strategies.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 7200,
  'STEM_PHYS', '{}', ARRAY['EPQ', 'dark-matter', 'cosmology', 'particle-physics', 'research'], ARRAY['physics', 'astrophysics', 'natural sciences'],
  NULL, NULL, 'Demonstrates ability to research cutting-edge physics independently', 75,
  80, 85, 70,
  65, 70, 85,
  ARRAY['A-level Physics (or studying)', 'A-level Maths'], ARRAY['Y12', 'Y13'],
  '120+ hours over 6-9 months', 'ONGOING', NULL, false,
  true, NULL, 'Requires school EPQ registration. ArXiv papers freely available.',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_what_is_mathematics', 'CAH09', NULL, NULL, 95, true, 'Comprehensive maths introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_what_is_mathematics', NULL, 'mathematics', NULL, 98, false, 'Standard pre-reading for maths degrees');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_physics_research', 'CAH07', NULL, NULL, 90, true, 'Physics research experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_physics_research', NULL, 'physics', NULL, 90, false, 'Research placement');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_surely_youre_joking', 'CAH07', NULL, NULL, 90, true, 'Classic physics memoir');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_surely_youre_joking', NULL, 'physics', NULL, 90, false, 'Nobel physicist''s autobiography');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_brief_history_time', 'CAH07', NULL, NULL, 85, true, 'Cosmology and theoretical physics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_brief_history_time', NULL, 'astrophysics', NULL, 90, false, 'Cosmology focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_fermats_last_theorem', 'CAH09', NULL, NULL, 90, true, 'Mathematical history and proof');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_fermats_last_theorem', NULL, 'mathematics', NULL, 95, false, 'Number theory focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_qed', 'CAH07', NULL, NULL, 90, true, 'Quantum electrodynamics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_qed', NULL, 'physics', NULL, 90, false, 'Theoretical physics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_mathematical_thinking', 'CAH09', NULL, NULL, 95, true, 'Mathematical proof and reasoning');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_mathematical_thinking', NULL, 'mathematics', NULL, 95, false, 'Transition to university maths');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_quantum_mechanics', 'CAH07', NULL, NULL, 85, true, 'Quantum mechanics introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_quantum_mechanics', NULL, 'physics', NULL, 85, false, 'Quantum physics content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_mit_physics', 'CAH07', NULL, NULL, 90, true, 'University physics course');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_mit_physics', NULL, 'physics', NULL, 95, false, 'Classical mechanics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_mit_physics', NULL, 'engineering', NULL, 80, false, 'Foundation for engineering physics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_bpho', 'CAH07', NULL, NULL, 95, true, 'National physics competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_bpho', NULL, 'physics', NULL, 98, false, 'Physics olympiad');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_ukmt', 'CAH09', NULL, NULL, 95, true, 'National maths competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_ukmt', NULL, 'mathematics', NULL, 98, false, 'Maths challenge');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_mat', 'CAH09', NULL, NULL, 98, true, 'Required for Oxford Maths');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_mat', NULL, 'mathematics', NULL, 98, false, 'Maths admissions test');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_mat', 'CAH11', NULL, NULL, 90, false, 'Required for Oxford CompSci');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_3blue1brown', 'CAH09', NULL, NULL, 85, true, 'Mathematical visualisation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_3blue1brown', NULL, 'mathematics', NULL, 90, false, 'Maths explanation videos');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_infinite_monkey_cage', 'CAH07', NULL, NULL, 75, true, 'Physics and science discussion');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_idea_dark_matter', 'CAH07', NULL, NULL, 85, true, 'Cosmology research project');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_idea_dark_matter', NULL, 'astrophysics', NULL, 90, false, 'Astrophysics topic');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_what_is_mathematics', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"DEPTH":50,"PRECISION":50,"TOLERANCE":55}'::JSONB, 450, 40, false, '{"notes":"Demanding. Only for serious maths applicants with high DEPTH and TOLERANCE."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_physics_research', 'examrizz_arena', '{"TOLERANCE":3,"CALIBRATION":2,"RECEPTIVITY":4}'::JSONB, '{"TOLERANCE":45}'::JSONB, 350, 30, true, '{"notes":"Competitive placements. Essential for top physics applications."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_surely_youre_joking', 'examrizz_arena', '{"TRANSFER":3,"TOLERANCE":2,"RECEPTIVITY":2}'::JSONB, NULL, 250, 10, true, '{"notes":"Accessible entry point. Shows physics as creative endeavour."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_brief_history_time', 'examrizz_arena', '{"TRANSFER":3,"TOLERANCE":3,"CALIBRATION":2}'::JSONB, '{"TOLERANCE":30}'::JSONB, 220, 15, true, '{"notes":"Classic text. Accessible cosmology introduction."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_fermats_last_theorem', 'examrizz_arena', '{"DEPTH":3,"TRANSFER":2,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":35}'::JSONB, 250, 20, true, '{"notes":"Shows maths as human endeavour. Good for building TOLERANCE appreciation."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_qed', 'examrizz_arena', '{"TRANSFER":3,"PRECISION":4,"TOLERANCE":2}'::JSONB, '{"PRECISION":40,"TOLERANCE":45}'::JSONB, 200, 30, false, '{"notes":"More technical. For students ready for quantum concepts."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_intro_mathematical_thinking', 'examrizz_arena', '{"PRECISION":4,"TOLERANCE":3,"CALIBRATION":4}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":45}'::JSONB, 400, 15, true, '{"notes":"Essential maths preparation. Recommend for all serious maths applicants."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_quantum_mechanics', 'examrizz_arena', '{"TRANSFER":3,"TOLERANCE":3,"CALIBRATION":2}'::JSONB, '{"TOLERANCE":40}'::JSONB, 300, 35, false, '{"notes":"Conceptual quantum mechanics. Suits visual/conceptual learners."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_mit_physics', 'examrizz_arena', '{"PRECISION":4,"RETRIEVAL":3,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":45}'::JSONB, 450, 25, false, '{"notes":"University-level. For students wanting to preview degree content."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_bpho', 'examrizz_arena', '{"DEPTH":3,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"PRECISION":55,"TOLERANCE":50}'::JSONB, 350, 20, true, '{"notes":"Challenging. For students with strong physics problem-solving."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_ukmt', 'examrizz_arena', '{"TRANSFER":3,"PRECISION":5,"CALIBRATION":3}'::JSONB, '{"PRECISION":50}'::JSONB, 300, 20, true, '{"notes":"Accessible competition. Good stepping stone to BMO."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_mat', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"DEPTH":50,"PRECISION":60,"TOLERANCE":55}'::JSONB, 450, 1, true, '{"notes":"Essential for Oxford Maths/CompSci. High priority for relevant applicants."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_3blue1brown', 'examrizz_arena', '{"TRANSFER":3,"CALIBRATION":2}'::JSONB, NULL, 100, 50, false, '{"notes":"Visual learning. Good supplement to formal maths study."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_infinite_monkey_cage', 'examrizz_arena', '{"TRANSFER":1,"RECEPTIVITY":2}'::JSONB, NULL, 50, 65, false, '{"notes":"Light engagement. Good for maintaining interest."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_idea_dark_matter', 'examrizz_arena', '{"DEPTH":5,"PRECISION":3,"TOLERANCE":4}'::JSONB, '{"DEPTH":55,"TOLERANCE":55}'::JSONB, 500, 55, false, '{"notes":"Major project. Only for high DEPTH students with strong physics interest."}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'STEM_PHYS' GROUP BY primary_cluster;
