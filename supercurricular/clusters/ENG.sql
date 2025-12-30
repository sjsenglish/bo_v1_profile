-- ============================================================================
-- SEED DATA: ENG CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:32.056Z
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
  'book_skunk_works', 'BOOK', 'PHYSICAL_BOOK',
  'Skunk Works', 'A Personal Memoir of My Years at Lockheed', 'Ben Rich''s insider account of Lockheed''s secret advanced development division. Chronicles the development of the U-2, SR-71 Blackbird, and F-117 stealth fighter. Demonstrates engineering innovation, project management, and the creative problem-solving culture that enables breakthrough technology.',
  'Ben R. Rich & Leo Janos', 'Director of Lockheed Skunk Works 1975-1991', 'Little, Brown and Company', 1994,
  '978-0316743006', NULL,
  true, 18, 540,
  'ENG', ARRAY['STEM_PHYS'], ARRAY['aerospace', 'engineering', 'innovation', 'project-management', 'stealth', 'aviation'], ARRAY['engineering', 'aerospace', 'mechanical'],
  'Insider account from legendary engineering division', 'INDUSTRY_STANDARD', 'Shows understanding of engineering culture and innovation process', 88,
  50, 55, 45,
  45, 35, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '9-11 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Widely available. Engaging read for any engineering-interested student.',
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
  'book_structures', 'BOOK', 'PHYSICAL_BOOK',
  'Structures', 'Or Why Things Don''t Fall Down', 'J.E. Gordon''s classic explaining structural engineering principles accessibly. Covers tension, compression, beams, arches, and why buildings and bridges stand (or don''t). Essential for understanding civil and mechanical engineering fundamentals.',
  'J.E. Gordon', 'Professor of Materials Technology, University of Reading', 'Penguin', 1978,
  '978-0140136289', NULL,
  true, 16, 600,
  'ENG', '{}', ARRAY['structural-engineering', 'materials', 'civil-engineering', 'mechanics', 'design'], ARRAY['engineering', 'civil', 'mechanical', 'structural'],
  'Classic engineering text; recommended by Cambridge Engineering', 'UNIVERSITY_READING_LIST', 'Standard pre-reading demonstrating engineering interest', 92,
  55, 55, 50,
  50, 35, 35,
  ARRAY['GCSE Maths', 'GCSE Physics helpful'], ARRAY['Y11', 'Y12', 'Y13'],
  '10-12 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available. Companion book ''The New Science of Strong Materials'' also recommended.',
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
  'book_to_engineer_is_human', 'BOOK', 'PHYSICAL_BOOK',
  'To Engineer Is Human', 'The Role of Failure in Successful Design', 'Henry Petroski examines engineering failures from the Tacoma Narrows Bridge to the Challenger disaster. Argues that understanding failure is essential to good design. Shows engineering as a process of learning from mistakes.',
  'Henry Petroski', 'Professor of Civil Engineering, Duke University', 'Vintage', 1985,
  '978-0679734161', NULL,
  true, 14, 480,
  'ENG', '{}', ARRAY['engineering-failure', 'design', 'safety', 'learning', 'bridges', 'structures'], ARRAY['engineering', 'civil', 'mechanical'],
  'Leading engineering scholar on design and failure', 'UNIVERSITY_READING_LIST', 'Shows understanding that engineering involves learning from failure', 85,
  50, 50, 40,
  50, 45, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 11.99, 'Available online. Petroski''s other books also excellent.',
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
  'book_the_design_of_everyday_things', 'BOOK', 'PHYSICAL_BOOK',
  'The Design of Everyday Things', NULL, 'Don Norman''s influential book on human-centred design. Explains why some products are intuitive and others frustrating. Essential for understanding the intersection of engineering and user experience. Applicable across all engineering disciplines.',
  'Don Norman', 'Professor Emeritus, UC San Diego; former Apple VP', 'Basic Books', 2013,
  '978-0465050659', NULL,
  true, 7, 480,
  'ENG', ARRAY['COMP'], ARRAY['design', 'human-factors', 'usability', 'product-design', 'psychology'], ARRAY['engineering', 'design', 'product'],
  'Foundational text in design thinking', 'INDUSTRY_STANDARD', 'Shows awareness of user-centred design in engineering', 90,
  55, 50, 30,
  50, 45, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Revised edition (2013) recommended. Widely available.',
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
  'book_ignition', 'BOOK', 'PHYSICAL_BOOK',
  'Ignition!', 'An Informal History of Liquid Rocket Propellants', 'John D. Clark''s witty history of rocket fuel development. Chronicles the dangerous, explosive early days of rocketry with humour and scientific insight. Cult classic among aerospace engineers. Shows experimental engineering at its most exciting.',
  'John Drury Clark', 'Rocket propellant chemist; worked on US rocket programmes', 'Rutgers University Press', 1972,
  '978-0813595832', NULL,
  true, 14, 420,
  'ENG', ARRAY['STEM_PHYS'], ARRAY['aerospace', 'chemistry', 'rockets', 'propulsion', 'history', 'experimental'], ARRAY['aerospace', 'chemical', 'engineering'],
  'Insider account; cult classic in aerospace community', 'INDUSTRY_STANDARD', 'Shows passion for experimental engineering and aerospace', 82,
  55, 45, 55,
  50, 40, 35,
  ARRAY['GCSE Chemistry helpful'], ARRAY['Y11', 'Y12', 'Y13'],
  '7-9 hours', 'ONE_OFF', NULL, false,
  false, 18.99, 'Recently reprinted. Also available as PDF online.',
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
  'course_engineering_principles', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Engineering Mechanics', NULL, 'Georgia Tech course covering statics and dynamics - the foundation of mechanical and civil engineering. Learn to analyse forces, moments, and equilibrium. Goes beyond A-level physics into real engineering analysis.',
  'Georgia Institute of Technology', 'Top US engineering school', 'Coursera', 2015,
  NULL, 'https://www.coursera.org/learn/engineering-mechanics-statics',
  true, 7, 1680,
  'ENG', ARRAY['STEM_PHYS'], ARRAY['mechanics', 'statics', 'forces', 'engineering-fundamentals', 'analysis'], ARRAY['engineering', 'mechanical', 'civil'],
  'Georgia Tech School of Engineering', 'UNIVERSITY_READING_LIST', 'Proactive engagement with university-level engineering', 88,
  65, 65, 70,
  50, 40, 55,
  ARRAY['A-level Maths (or studying)', 'A-level Physics helpful'], ARRAY['Y12', 'Y13'],
  '7 weeks, 4 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit on Coursera. Part of larger engineering specialisation.',
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
  'course_solidworks', 'COURSE', 'VIDEO_COURSE',
  'Introduction to CAD (SolidWorks)', NULL, 'Learn industry-standard CAD software used across mechanical, aerospace, and product engineering. Covers 3D modelling, assemblies, and technical drawings. Practical skill valued by engineering departments and employers.',
  'Dassault Systèmes', 'SolidWorks manufacturer', 'SolidWorks', 2023,
  NULL, 'https://my.solidworks.com/training',
  true, 10, 1200,
  'ENG', '{}', ARRAY['CAD', 'SolidWorks', '3D-modelling', 'design', 'technical-drawing'], ARRAY['engineering', 'mechanical', 'product', 'design'],
  'Official SolidWorks training', 'INDUSTRY_STANDARD', 'Practical CAD skills demonstrate hands-on engineering interest', 85,
  45, 55, 55,
  35, 30, 50,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '20 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free student licenses available. Also try Fusion 360 (free for students).',
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
  'course_circuits', 'COURSE', 'VIDEO_COURSE',
  'Circuits and Electronics', NULL, 'MIT course on circuit analysis - the foundation of electrical engineering. Covers resistors, capacitors, operational amplifiers, and digital logic. Rigorous but well-taught introduction to EE fundamentals.',
  'MIT', 'MIT Department of Electrical Engineering', 'edX', 2012,
  NULL, 'https://www.edx.org/learn/circuits/massachusetts-institute-of-technology-circuits-and-electronics-1-basic-circuit-analysis',
  true, 12, 2400,
  'ENG', ARRAY['COMP'], ARRAY['electrical-engineering', 'circuits', 'electronics', 'MIT', 'analysis'], ARRAY['electrical', 'electronic', 'engineering'],
  'MIT official course', 'UNIVERSITY_READING_LIST', 'Shows engagement with electrical engineering at university level', 92,
  70, 75, 75,
  50, 40, 60,
  ARRAY['A-level Maths (or studying)', 'A-level Physics (or studying)'], ARRAY['Y12', 'Y13'],
  '12 weeks, 4 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free on edX. Challenging but excellent preparation.',
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
  'test_engaa', 'ADMISSION_TEST', 'INTERACTIVE',
  'ENGAA (Engineering Admissions Assessment)', NULL, 'Required for Cambridge Engineering. Tests maths and physics problem-solving under time pressure. Section 1 covers maths and physics fundamentals; Section 2 tests advanced problem-solving. Dedicated preparation essential.',
  'Cambridge Assessment Admissions Testing', 'Cambridge University admissions', 'Cambridge Assessment', 2024,
  NULL, 'https://www.admissionstesting.org/for-test-takers/engaa/',
  true, 2, 4200,
  'ENG', ARRAY['STEM_PHYS'], ARRAY['admissions-test', 'ENGAA', 'cambridge', 'maths', 'physics', 'problem-solving'], ARRAY['engineering'],
  'Required for Cambridge Engineering', 'PROFESSIONAL_BODY', 'Strong ENGAA score essential for Cambridge Engineering offer', 98,
  80, 70, 85,
  45, 50, 60,
  ARRAY['A-level Maths (studying)', 'A-level Physics (studying)'], ARRAY['Y13'],
  '50-70 hours preparation', 'DEADLINE', 'October', true,
  true, NULL, 'Sit at school or test centre. Past papers free on Cambridge website.',
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
  'competition_arkwright', 'COMPETITION', 'MIXED',
  'Arkwright Engineering Scholarships', NULL, 'Prestigious scholarship programme for Y11 students pursuing engineering. Application includes design project and interview. Scholars receive funding, mentoring from industry sponsor, and networking opportunities. Highly regarded by universities.',
  'Arkwright Scholarships Trust', 'Established engineering scholarship programme since 1991', 'Arkwright Scholarships Trust', 2024,
  NULL, 'https://www.arkwright.org.uk',
  false, NULL, 2400,
  'ENG', '{}', ARRAY['scholarship', 'engineering', 'design', 'interview', 'mentoring', 'industry'], ARRAY['engineering'],
  'Established scholarship programme; industry partnerships', 'PROFESSIONAL_BODY', 'Arkwright Scholar status strongly recognised by engineering departments', 95,
  60, 60, 55,
  50, 55, 70,
  ARRAY['GCSEs including Maths and a science'], ARRAY['Y11'],
  'Application + project + interview', 'DEADLINE', 'January', true,
  true, NULL, 'Apply in Y11. School nomination may be required. Highly competitive.',
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
  'competition_f1_in_schools', 'COMPETITION', 'IN_PERSON',
  'F1 in Schools', NULL, 'Team competition to design, build, and race miniature F1 cars. Covers aerodynamics, CAD/CAM, manufacturing, marketing, and project management. Teams progress from regional to world finals. Excellent for demonstrating teamwork and practical engineering.',
  'F1 in Schools Ltd', 'Global STEM competition; Formula 1 partnership', 'F1 in Schools', 2024,
  NULL, 'https://www.f1inschools.co.uk',
  false, NULL, 6000,
  'ENG', ARRAY['BUS'], ARRAY['competition', 'F1', 'aerodynamics', 'CAD', 'teamwork', 'manufacturing'], ARRAY['engineering', 'mechanical', 'aerospace'],
  'Global STEM competition with F1 involvement', 'INDUSTRY_STANDARD', 'Team success demonstrates practical engineering and collaboration', 88,
  55, 75, 60,
  45, 50, 65,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '100+ hours across season', 'ONGOING', NULL, true,
  false, NULL, 'School must register team. Equipment costs apply. Check if school participates.',
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
  'video_practical_engineering', 'VIDEO', 'YOUTUBE',
  'Practical Engineering', NULL, 'Grady Hillhouse''s YouTube channel explaining civil engineering concepts through models and demonstrations. Covers infrastructure, water systems, construction, and engineering failures. Makes complex engineering accessible and visual.',
  'Grady Hillhouse', 'Civil engineer; professional engineer license', 'Practical Engineering', 2015,
  NULL, 'https://www.youtube.com/@PracticalEngineeringChannel',
  false, NULL, NULL,
  'ENG', ARRAY['ENV'], ARRAY['civil-engineering', 'infrastructure', 'youtube', 'demonstrations', 'construction'], ARRAY['civil', 'engineering'],
  'Practising civil engineer; 3M+ subscribers', 'COMMUNITY_RECOMMENDED', 'Shows interest in infrastructure and civil engineering', 82,
  45, 25, 45,
  40, 30, 25,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  'Variable - 10-20 mins per video', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube. Dam, bridge, and water system videos particularly good.',
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
  'video_smarter_every_day', 'VIDEO', 'YOUTUBE',
  'Smarter Every Day', NULL, 'Destin Sandlin''s engineering exploration channel. Uses high-speed cameras and experiments to investigate physics and engineering. Covers rockets, submarines, helicopters, and manufacturing. Shows engineering curiosity in action.',
  'Destin Sandlin', 'Aerospace engineer; worked on missile defence systems', 'Smarter Every Day', 2007,
  NULL, 'https://www.youtube.com/@smartereveryday',
  false, NULL, NULL,
  'ENG', ARRAY['STEM_PHYS'], ARRAY['aerospace', 'physics', 'experiments', 'youtube', 'curiosity', 'manufacturing'], ARRAY['engineering', 'aerospace', 'mechanical'],
  'Aerospace engineer; 11M+ subscribers', 'COMMUNITY_RECOMMENDED', 'Shows engineering curiosity and practical investigation', 85,
  50, 25, 45,
  40, 35, 25,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  'Variable - 15-25 mins per video', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube. Rocket and helicopter series particularly relevant.',
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
  'work_experience_engineering', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Engineering Work Experience', NULL, 'Placement at engineering firm, manufacturing company, or construction site. Exposure to real engineering projects, design processes, and professional practice. Essential for competitive engineering applications.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 2400,
  'ENG', '{}', ARRAY['work-experience', 'industry', 'professional', 'practical'], ARRAY['engineering'],
  NULL, NULL, 'Industry experience highly valued by engineering departments', 88,
  40, 50, 45,
  40, 45, 40,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Contact local firms directly. Try EDT (Engineering Development Trust) programmes.',
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
  'epq_idea_bridge_design', 'EPQ_IDEA', 'MIXED',
  'EPQ: Bridge Design Optimisation', NULL, 'Extended Project investigating bridge design principles. Could analyse historical failures, compare structural systems, or design and test model bridges. Combines structural theory with practical experimentation. Excellent for demonstrating engineering thinking.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 7200,
  'ENG', '{}', ARRAY['EPQ', 'bridges', 'structural', 'design', 'testing', 'analysis'], ARRAY['engineering', 'civil', 'structural'],
  NULL, NULL, 'Demonstrates independent engineering research and practical skills', 78,
  65, 85, 60,
  55, 55, 85,
  ARRAY['A-level Maths helpful', 'A-level Physics helpful'], ARRAY['Y12', 'Y13'],
  '120+ hours over 6-9 months', 'ONGOING', NULL, false,
  true, NULL, 'Requires school EPQ registration. Materials for model testing may have small cost.',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_skunk_works', 'CAH10', NULL, NULL, 85, true, 'Aerospace engineering innovation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_skunk_works', NULL, 'aerospace', NULL, 95, false, 'Aerospace focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_structures', 'CAH10', NULL, NULL, 95, true, 'Structural engineering classic');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_structures', NULL, 'civil', NULL, 95, false, 'Civil engineering focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_structures', NULL, 'mechanical', NULL, 85, false, 'Mechanics foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_to_engineer_is_human', 'CAH10', NULL, NULL, 85, true, 'Engineering failure analysis');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_design_of_everyday_things', 'CAH10', NULL, NULL, 85, true, 'Design engineering');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_design_of_everyday_things', NULL, 'design', NULL, 90, false, 'Human-centred design');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ignition', 'CAH10', NULL, NULL, 80, true, 'Aerospace propulsion');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ignition', NULL, 'aerospace', NULL, 90, false, 'Rocket engineering');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ignition', NULL, 'chemical', NULL, 85, false, 'Chemical engineering aspects');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_engineering_principles', 'CAH10', NULL, NULL, 90, true, 'Engineering mechanics foundation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_solidworks', 'CAH10', NULL, NULL, 85, true, 'CAD skills for engineering');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_solidworks', NULL, 'mechanical', NULL, 90, false, 'Mechanical CAD');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_circuits', 'CAH10', NULL, NULL, 85, true, 'Electrical engineering foundation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_circuits', NULL, 'electrical', NULL, 95, false, 'EE core content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_circuits', NULL, 'electronic', NULL, 95, false, 'Electronics content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_engaa', 'CAH10', NULL, NULL, 98, true, 'Required for Cambridge Engineering');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_arkwright', 'CAH10', NULL, NULL, 95, true, 'Engineering scholarship');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_f1_in_schools', 'CAH10', NULL, NULL, 85, true, 'Engineering team competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_f1_in_schools', NULL, 'aerospace', NULL, 80, false, 'Aerodynamics component');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_practical_engineering', 'CAH10', NULL, NULL, 80, true, 'Civil engineering content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_practical_engineering', NULL, 'civil', NULL, 90, false, 'Civil infrastructure focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_smarter_every_day', 'CAH10', NULL, NULL, 80, true, 'Engineering exploration');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_engineering', 'CAH10', NULL, NULL, 90, true, 'Industry experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_idea_bridge_design', 'CAH10', NULL, NULL, 85, true, 'Structural engineering project');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_idea_bridge_design', NULL, 'civil', NULL, 90, false, 'Civil engineering focus');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_skunk_works', 'examrizz_arena', '{"TRANSFER":3,"TOLERANCE":3,"CALIBRATION":2}'::JSONB, NULL, 250, 15, true, '{"notes":"Engaging entry point. Shows innovation culture."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_structures', 'examrizz_arena', '{"TRANSFER":3,"PRECISION":4,"CALIBRATION":2}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 10, true, '{"notes":"Essential pre-reading. Recommend for all civil/mechanical applicants."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_to_engineer_is_human', 'examrizz_arena', '{"TOLERANCE":2,"CALIBRATION":4,"RECEPTIVITY":3}'::JSONB, NULL, 230, 25, false, '{"notes":"Failure analysis perspective. Good for building CALIBRATION."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_the_design_of_everyday_things', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":2,"RECEPTIVITY":3}'::JSONB, NULL, 240, 20, true, '{"notes":"Design thinking. Cross-disciplinary relevance."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_ignition', 'examrizz_arena', '{"TRANSFER":2,"PRECISION":3,"TOLERANCE":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 220, 35, false, '{"notes":"Aerospace focus. Entertaining but technical."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_engineering_principles', 'examrizz_arena', '{"PRECISION":4,"RETRIEVAL":3,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":45}'::JSONB, 400, 20, true, '{"notes":"University-level mechanics. Essential foundation."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_solidworks', 'examrizz_arena', '{"PRECISION":3,"STRUCTURE":3}'::JSONB, '{"STRUCTURE":35}'::JSONB, 300, 30, false, '{"notes":"Practical CAD skills. Good for hands-on learners."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_circuits', 'examrizz_arena', '{"PRECISION":5,"RETRIEVAL":3,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":55,"CONSISTENCY":50}'::JSONB, 450, 25, false, '{"notes":"Demanding EE course. For electrical engineering interest."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_engaa', 'examrizz_arena', '{"PRECISION":5,"TOLERANCE":4,"CALIBRATION":4}'::JSONB, '{"PRECISION":55,"TOLERANCE":55}'::JSONB, 450, 1, true, '{"notes":"Essential for Cambridge Engineering. High priority."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_arkwright', 'examrizz_arena', '{"DEPTH":4,"TOLERANCE":3,"RECEPTIVITY":3}'::JSONB, '{"DEPTH":40}'::JSONB, 400, 5, true, '{"notes":"Prestigious scholarship. Y11 priority."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_f1_in_schools', 'examrizz_arena', '{"SOCIAL":4,"PRECISION":2,"TOLERANCE":3}'::JSONB, '{"SOCIAL":40}'::JSONB, 350, 30, false, '{"notes":"Team competition. Good for high SOCIAL students."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_practical_engineering', 'examrizz_arena', '{"TRANSFER":2,"CALIBRATION":1}'::JSONB, NULL, 80, 55, false, '{"notes":"Accessible civil engineering content."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_smarter_every_day', 'examrizz_arena', '{"TRANSFER":2,"RECEPTIVITY":2}'::JSONB, NULL, 80, 55, false, '{"notes":"Engineering curiosity. Accessible exploration."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_engineering', 'examrizz_arena', '{"SOCIAL":3,"CALIBRATION":2,"RECEPTIVITY":4}'::JSONB, '{"SOCIAL":30}'::JSONB, 350, 15, true, '{"notes":"Industry experience essential for top applications."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_idea_bridge_design', 'examrizz_arena', '{"DEPTH":5,"PRECISION":3,"TOLERANCE":4}'::JSONB, '{"DEPTH":55,"TOLERANCE":55}'::JSONB, 500, 50, false, '{"notes":"Major project. Only for high DEPTH students."}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'ENG' GROUP BY primary_cluster;
