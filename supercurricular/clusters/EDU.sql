-- ============================================================================
-- SEED DATA: EDU CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:35.644Z
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
  'course_child_development', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Child Development', NULL, 'Overview of cognitive, social, and emotional development from birth through adolescence. Understanding developmental stages essential for education applicants.',
  'Various universities', 'Developmental psychology departments', 'FutureLearn / edX', 2019,
  NULL, NULL,
  true, 8, 600,
  'EDU', ARRAY['SOC'], ARRAY['child-development', 'developmental-psychology', 'early-years'], ARRAY['education', 'psychology', 'childhood-studies'],
  'Psychology and education departments', 'UNIVERSITY_READING_LIST', 'Developmental understanding', 85,
  50, 55, 40,
  50, 45, 45,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '10 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Search MOOC platforms for child development courses',
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
  'course_sen_inclusion', 'COURSE', 'VIDEO_COURSE',
  'Understanding SEND and Inclusive Education', NULL, 'Introduction to Special Educational Needs and Disabilities, inclusive practice, and differentiation. Essential background for teaching in inclusive classrooms.',
  'Various', 'SEND specialists and education departments', 'FutureLearn', 2020,
  NULL, NULL,
  true, 6, 480,
  'EDU', ARRAY['SOC'], ARRAY['send', 'inclusion', 'differentiation', 'accessibility'], ARRAY['education', 'special-education'],
  'Education departments, SEND organisations', 'PROFESSIONAL_BODY', 'Awareness of inclusive education', 82,
  45, 45, 35,
  45, 50, 45,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Search FutureLearn for SEND/inclusion courses',
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
  'course_science_learning', 'COURSE', 'VIDEO_COURSE',
  'The Science of Learning', NULL, 'Learn how learning works - covering memory, attention, motivation, and effective study strategies. Applicable to your own studies and understanding how to teach others.',
  'Various universities', 'Learning science researchers', 'Coursera / FutureLearn', 2020,
  NULL, NULL,
  true, 6, 480,
  'EDU', ARRAY['SOC'], ARRAY['learning-science', 'memory', 'study-skills', 'metacognition'], ARRAY['education', 'psychology'],
  'University learning science departments', 'UNIVERSITY_READING_LIST', 'Evidence-based learning understanding', 85,
  50, 45, 40,
  45, 40, 45,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Multiple platforms offer similar courses',
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
  'competition_student_tutor_award', 'COMPETITION', 'MIXED',
  'Jack Petchey Speak Out Challenge / Youth Tutoring Awards', NULL, 'Public speaking competition or recognition for youth tutoring/mentoring. Demonstrates communication skills and commitment to supporting others'' learning. Strong evidence for education applications.',
  'Jack Petchey Foundation / Various', 'Youth education charities', 'Various', 2020,
  NULL, 'https://www.speakoutchallenge.com/',
  false, NULL, 600,
  'EDU', '{}', ARRAY['public-speaking', 'communication', 'youth-leadership'], ARRAY['education'],
  'Youth education organisations', 'PROFESSIONAL_BODY', 'Communication and leadership skills', 80,
  40, 45, 30,
  70, 50, 55,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '10+ hours', 'DEADLINE', 'Varies', true,
  true, NULL, 'Through school or local youth organisations',
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
  'volunteering_tutoring', 'VOLUNTEERING', 'IN_PERSON',
  'Volunteer Tutoring / Peer Mentoring', NULL, 'Regular tutoring younger students in school subjects, through school programmes, charities like The Access Project, or community organisations. Direct experience of supporting learning essential for education applications.',
  'Various organisations', 'Schools, tutoring charities', NULL, NULL,
  NULL, 'https://www.theaccessproject.org.uk/volunteer',
  false, NULL, 2400,
  'EDU', '{}', ARRAY['tutoring', 'mentoring', 'volunteering', 'teaching-experience'], ARRAY['education', 'teaching'],
  'Education applications standard', 'INDUSTRY_STANDARD', 'Essential teaching experience for applications', 95,
  45, 60, 35,
  55, 55, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '2+ hours/week ongoing', 'ONGOING', NULL, true,
  true, NULL, 'Through school, Tutor Trust, Access Project, local charities',
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
  'book_why_dont_students', 'BOOK', 'PHYSICAL_BOOK',
  'Why Don''t Students Like School?', 'A Cognitive Scientist Answers Questions About How the Mind Works and What It Means for the Classroom', 'Daniel Willingham applies cognitive science to education, explaining memory, learning, and motivation. Essential for understanding evidence-based teaching and how students actually learn.',
  'Daniel Willingham', 'Professor of Psychology at University of Virginia, cognitive scientist', 'Jossey-Bass', 2009,
  '978-0470591963', NULL,
  true, 9, 420,
  'EDU', ARRAY['SOC'], ARRAY['cognitive-science', 'learning', 'memory', 'pedagogy', 'educational-psychology'], ARRAY['education', 'teaching', 'psychology'],
  'Teacher training reading lists, educational psychology standard', 'UNIVERSITY_READING_LIST', 'Understanding of evidence-based teaching', 95,
  55, 45, 40,
  50, 40, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '7 hours', 'ONE_OFF', NULL, false,
  false, 14.99, 'Widely available',
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
  'book_visible_learning', 'BOOK', 'PHYSICAL_BOOK',
  'Visible Learning for Teachers', 'Maximizing Impact on Learning', 'John Hattie''s synthesis of educational research identifying what actually works in teaching. Effect sizes and evidence-based strategies. Foundational for understanding educational research.',
  'John Hattie', 'Professor of Education, University of Melbourne, meta-analysis pioneer', 'Routledge', 2012,
  '978-0415690157', NULL,
  true, 10, 600,
  'EDU', ARRAY['SOC'], ARRAY['educational-research', 'effect-sizes', 'pedagogy', 'teaching-strategies'], ARRAY['education', 'teaching'],
  'Teacher training standard, Ofsted referenced', 'UNIVERSITY_READING_LIST', 'Research literacy in education', 92,
  60, 60, 55,
  55, 50, 50,
  '{}', ARRAY['Y12', 'Y13'],
  '10 hours', 'ONE_OFF', NULL, false,
  false, 24.99, 'Academic text, widely available',
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
  'book_pedagogy_oppressed', 'BOOK', 'PHYSICAL_BOOK',
  'Pedagogy of the Oppressed', NULL, 'Paulo Freire''s influential critique of ''banking'' education and argument for critical pedagogy. Essential for understanding education''s social and political dimensions. Widely taught in education studies.',
  'Paulo Freire', 'Brazilian educator and philosopher, critical pedagogy pioneer', 'Penguin', 1968,
  '978-0140254037', NULL,
  true, 4, 420,
  'EDU', ARRAY['SOC'], ARRAY['critical-pedagogy', 'educational-philosophy', 'social-justice', 'liberation'], ARRAY['education', 'sociology'],
  'Education studies reading lists worldwide', 'UNIVERSITY_READING_LIST', 'Engagement with educational theory', 95,
  75, 45, 40,
  70, 70, 55,
  '{}', ARRAY['Y12', 'Y13'],
  '7 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Classic text, widely available',
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
  'book_teacher', 'BOOK', 'PHYSICAL_BOOK',
  'Teacher', NULL, 'Tom Bennett''s honest account of becoming a teacher in challenging London schools. Practical insights into behaviour management, school culture, and the realities of teaching. ResearchED founder.',
  'Tom Bennett', 'Teacher, behaviour advisor to DfE, ResearchED founder', 'Continuum', 2012,
  '978-1441140760', NULL,
  true, 8, 360,
  'EDU', '{}', ARRAY['teaching', 'behaviour-management', 'school-culture', 'memoir'], ARRAY['education', 'teaching'],
  'UK teacher training recommendations', 'PROFESSIONAL_BODY', 'Realistic understanding of teaching', 85,
  35, 40, 25,
  45, 40, 30,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '6 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Available in paperback',
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
  'book_cleverlands', 'BOOK', 'PHYSICAL_BOOK',
  'Cleverlands', 'The Secrets Behind the Success of the World''s Education Superpowers', 'Lucy Crehan visits top-performing education systems (Finland, Singapore, Japan, Shanghai, Canada) to understand what makes them successful. Comparative education with practical insights.',
  'Lucy Crehan', 'Former teacher, education researcher, international education consultant', 'Unbound', 2016,
  '978-1783522736', NULL,
  true, 10, 480,
  'EDU', ARRAY['SOC'], ARRAY['comparative-education', 'education-policy', 'international-education'], ARRAY['education', 'policy'],
  'Education policy discussions, teacher recommendations', 'ESTABLISHED_MEDIA', 'International perspective on education', 88,
  50, 50, 35,
  50, 45, 35,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available',
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
  'test_literacy_numeracy', 'ADMISSION_TEST', 'INTERACTIVE',
  'Professional Skills Tests (QTS Literacy & Numeracy)', NULL, 'While QTS skills tests are taken during teacher training, practising similar tests demonstrates readiness for teaching. Tests literacy and numeracy to teaching standards.',
  'Department for Education', 'UK Government', 'DfE', 2012,
  NULL, NULL,
  true, 4, 300,
  'EDU', '{}', ARRAY['literacy', 'numeracy', 'teacher-training', 'skills-test'], ARRAY['education', 'teaching'],
  'Department for Education', 'GOVERNMENT_BODY', 'Preparation for teacher training', 88,
  40, 35, 35,
  50, 30, 40,
  ARRAY['GCSE English', 'GCSE Maths'], ARRAY['Y12', 'Y13'],
  '5 hours practice', 'ONE_OFF', NULL, false,
  true, NULL, 'Practice materials available online',
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
  'podcast_teachers_talk_radio', 'PODCAST', 'PODCAST_AUDIO',
  'Teacher Talk Radio / Mr Barton Maths Podcast', NULL, 'Podcasts featuring teachers discussing pedagogy, research, and classroom practice. Craig Barton''s podcast particularly strong on evidence-based teaching and educational research.',
  'Craig Barton / Various', 'Experienced teachers, education researchers', 'Independent', 2016,
  NULL, 'https://www.mrbartonmaths.com/podcast/',
  true, 20, 600,
  'EDU', '{}', ARRAY['teaching', 'pedagogy', 'educational-research'], ARRAY['education', 'teaching'],
  'Teacher community, ResearchED', 'COMMUNITY_RECOMMENDED', 'Engagement with teaching discourse', 82,
  45, 40, 35,
  50, 45, 35,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '1 hour per episode', 'ONGOING', NULL, true,
  true, NULL, 'Available on podcast platforms',
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
  'video_ted_ed', 'VIDEO', 'YOUTUBE',
  'TED-Ed / Education-focused TED Talks', NULL, 'TED-Ed creates animated educational lessons; TED Talks feature educators like Ken Robinson, Sal Khan. Engaging content on learning, creativity, and educational innovation.',
  'TED', 'TED organisation, leading educators', 'YouTube / TED', 2012,
  NULL, 'https://ed.ted.com/',
  true, 15, 300,
  'EDU', '{}', ARRAY['education', 'learning', 'creativity', 'innovation'], ARRAY['education'],
  'TED', 'ESTABLISHED_MEDIA', 'Awareness of educational ideas', 85,
  40, 30, 25,
  45, 40, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '5-20 mins per video', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube and TED website',
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
  'work_experience_school', 'WORK_EXPERIENCE', 'IN_PERSON',
  'School Work Experience / Classroom Observation', NULL, 'Extended placement in a school observing teaching across subjects and year groups. Understanding of school operations, behaviour management, and different teaching approaches. Essential for education applications.',
  'Local schools', 'Schools', NULL, NULL,
  NULL, NULL,
  false, NULL, 2100,
  'EDU', '{}', ARRAY['work-experience', 'classroom-observation', 'school'], ARRAY['education', 'teaching'],
  'Teacher training requirements', 'PROFESSIONAL_BODY', 'Essential evidence of commitment', 98,
  40, 55, 30,
  45, 50, 50,
  '{}', ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Arrange with local schools, DBS check may be required',
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
  'epq_education_investigation', 'EPQ_IDEA', 'MIXED',
  'EPQ: Educational Research Project', NULL, 'Extended project investigating an educational question - effectiveness of homework, phonics vs whole language, impact of class size, technology in learning. Combines literature review with potential small-scale research.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'EDU', ARRAY['SOC'], ARRAY['epq', 'educational-research', 'independent-study'], ARRAY['education'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus research skills', 88,
  65, 85, 50,
  65, 70, 85,
  '{}', ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_child_development', 'CAH22', NULL, NULL, 90, true, 'Developmental understanding');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_child_development', 'CAH04', NULL, NULL, 80, false, 'Psychology crossover');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_sen_inclusion', 'CAH22', NULL, NULL, 85, true, 'Inclusive education');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_science_learning', 'CAH22', NULL, NULL, 88, true, 'Learning science foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_student_tutor_award', 'CAH22', NULL, NULL, 78, true, 'Communication and leadership');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_tutoring', 'CAH22', NULL, NULL, 98, true, 'Essential teaching experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_why_dont_students', 'CAH22', NULL, NULL, 95, true, 'Core educational psychology text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_why_dont_students', NULL, 'psychology', NULL, 80, false, 'Cognitive science foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_visible_learning', 'CAH22', NULL, NULL, 92, true, 'Evidence-based teaching research');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_pedagogy_oppressed', 'CAH22', NULL, NULL, 90, true, 'Foundational educational philosophy');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_pedagogy_oppressed', NULL, 'sociology', NULL, 75, false, 'Critical theory connections');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_teacher', 'CAH22', NULL, NULL, 85, true, 'Teaching practice insights');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_cleverlands', 'CAH22', NULL, NULL, 88, true, 'Comparative education');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_literacy_numeracy', 'CAH22', NULL, NULL, 85, true, 'Teacher training preparation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_teachers_talk_radio', 'CAH22', NULL, NULL, 82, true, 'Teaching discourse awareness');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_ted_ed', 'CAH22', NULL, NULL, 78, true, 'Educational ideas and innovation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_school', 'CAH22', NULL, NULL, 100, true, 'Required classroom experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_education_investigation', 'CAH22', NULL, NULL, 88, true, 'Independent educational research');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_child_development', 'examrizz_arena', '{"DEPTH":4,"CONSISTENCY":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 300, 9, false, '{"notes":"Developmental foundations"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_sen_inclusion', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 280, 11, false, '{"notes":"Important inclusion awareness"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_science_learning', 'examrizz_arena', '{"CALIBRATION":4,"CONSISTENCY":3}'::JSONB, '{"TOLERANCE":30}'::JSONB, 280, 8, false, '{"notes":"Practical learning science"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_student_tutor_award', 'examrizz_arena', '{"SOCIAL":5,"CALIBRATION":3}'::JSONB, '{"SOCIAL":40}'::JSONB, 250, 12, false, '{"notes":"Communication and leadership evidence"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_tutoring', 'examrizz_arena', '{"SOCIAL":5,"CALIBRATION":5,"CONSISTENCY":4}'::JSONB, '{"SOCIAL":40}'::JSONB, 450, 1, true, '{"notes":"Essential - must have for education applications"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_why_dont_students', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":5}'::JSONB, '{}'::JSONB, 280, 2, true, '{"notes":"Essential cognitive science for educators"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_visible_learning', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5}'::JSONB, '{"TOLERANCE":40}'::JSONB, 320, 5, true, '{"notes":"Research literacy for education"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_pedagogy_oppressed', 'examrizz_arena', '{"DEPTH":5,"TRANSFER":4,"TOLERANCE":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":45}'::JSONB, 300, 7, false, '{"notes":"Challenging philosophical text - for engaged students"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_teacher', 'examrizz_arena', '{"CALIBRATION":4,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 200, 10, false, '{"notes":"Accessible introduction to teaching realities"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_cleverlands', 'examrizz_arena', '{"TRANSFER":4,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 260, 6, false, '{"notes":"Engaging comparative education"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_literacy_numeracy', 'examrizz_arena', '{"PRECISION":4,"CALIBRATION":3}'::JSONB, '{}'::JSONB, 180, 13, false, '{"notes":"Teacher training preparation"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_teachers_talk_radio', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 100, 14, false, '{"notes":"Easy ongoing engagement"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_ted_ed', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 80, 15, false, '{"notes":"Accessible educational ideas"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_school', 'examrizz_arena', '{"SOCIAL":4,"CALIBRATION":5}'::JSONB, '{}'::JSONB, 420, 3, true, '{"notes":"Critical classroom observation experience"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_education_investigation', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"TOLERANCE":5}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 4, true, '{"notes":"Major independent project"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'EDU' GROUP BY primary_cluster;
