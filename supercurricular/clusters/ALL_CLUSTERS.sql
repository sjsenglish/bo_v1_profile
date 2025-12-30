-- ============================================================================
-- SEED DATA: SOC CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:30.015Z
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
  'book_thinking_fast_slow', 'BOOK', 'PHYSICAL_BOOK',
  'Thinking, Fast and Slow', NULL, 'Daniel Kahneman''s seminal exploration of cognitive biases and the two systems governing human thought. Essential reading for psychology, economics, and PPE applicants. Demonstrates understanding of behavioural science that underpins modern economics and policy.',
  'Daniel Kahneman', 'Nobel Prize in Economics 2002, Professor Emeritus Princeton University', 'Penguin', 2011,
  '978-0141033570', NULL,
  true, 5, 900,
  'SOC', ARRAY['BUS', 'MED'], ARRAY['psychology', 'economics', 'decision-making', 'cognitive-bias', 'behavioural-economics', 'heuristics'], ARRAY['psychology', 'economics', 'PPE', 'behavioural', 'cognitive'],
  'Oxford PPE reading list, Cambridge Economics reading list', 'UNIVERSITY_READING_LIST', 'Frequently cited in successful PPE, Economics, and Psychology personal statements', 95,
  70, 75, 45,
  65, 55, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '15-20 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available in bookshops and libraries. Excellent audiobook version.',
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
  'book_justice', 'BOOK', 'PHYSICAL_BOOK',
  'Justice', 'What''s the Right Thing to Do?', 'Michael Sandel''s exploration of major theories of justice through real-world dilemmas. Based on his famous Harvard course. Essential for philosophy, politics, and law applicants. Develops critical thinking about ethics and policy.',
  'Michael Sandel', 'Professor of Government, Harvard University', 'Penguin', 2009,
  '978-0141041339', NULL,
  true, 10, 540,
  'SOC', ARRAY['LAW', 'HUM'], ARRAY['philosophy', 'ethics', 'justice', 'political-philosophy', 'morality'], ARRAY['philosophy', 'politics', 'PPE', 'ethics'],
  'Based on Harvard''s most popular course; Oxford PPE reading list', 'UNIVERSITY_READING_LIST', 'Demonstrates engagement with fundamental questions in political philosophy', 92,
  70, 55, 20,
  60, 75, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '9-12 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available. Companion Harvard lecture series free on YouTube.',
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
  'course_moral_foundations_politics', 'COURSE', 'VIDEO_COURSE',
  'Moral Foundations of Politics', NULL, 'Yale course examining major political theories: utilitarianism, Marxism, social contract theory, and democracy. Taught by Professor Ian Shapiro. Excellent preparation for PPE and politics applicants.',
  'Yale University', 'Ian Shapiro, Sterling Professor of Political Science, Yale University', 'Coursera', 2014,
  NULL, 'https://www.coursera.org/learn/moral-politics',
  true, 8, 1200,
  'SOC', ARRAY['HUM', 'LAW'], ARRAY['political-theory', 'philosophy', 'democracy', 'utilitarianism', 'marxism'], ARRAY['politics', 'PPE', 'political', 'philosophy'],
  'Yale University official course', 'UNIVERSITY_READING_LIST', 'Strong preparation for Oxbridge PPE interviews', 90,
  75, 70, 25,
  65, 70, 55,
  '{}', ARRAY['Y12', 'Y13'],
  '8 weeks, 3 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit on Coursera.',
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
  'podcast_thinking_allowed', 'PODCAST', 'PODCAST_AUDIO',
  'Thinking Allowed', 'BBC Radio 4', 'Laurie Taylor''s weekly sociology podcast examining research on society, culture, and human behaviour. Academic guests discuss their latest research. Excellent for staying current with sociological thinking.',
  'BBC Radio 4', 'Laurie Taylor, Emeritus Professor of Sociology, University of York', 'BBC', 1998,
  NULL, 'https://www.bbc.co.uk/programmes/b006qy05',
  false, NULL, NULL,
  'SOC', '{}', ARRAY['sociology', 'podcast', 'research', 'society', 'culture'], ARRAY['sociology', 'social'],
  'BBC Radio 4', 'ESTABLISHED_MEDIA', 'Demonstrates ongoing engagement with sociological research', 80,
  55, 20, 35,
  55, 50, 25,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '30 mins per episode, ongoing', 'ONGOING', NULL, false,
  true, NULL, 'Free on BBC Sounds. Archive of episodes available.',
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
  'work_experience_local_council', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Local Council Work Experience', NULL, 'Work experience placement with local government. Exposure to policy implementation, democratic processes, and public services. Departments include planning, social services, education, and economic development. Excellent for politics and public policy applicants.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 2400,
  'SOC', '{}', ARRAY['work-experience', 'government', 'policy', 'local-government', 'politics'], ARRAY['politics', 'policy', 'government', 'PPE'],
  NULL, NULL, 'Direct experience of government and policy-making', 80,
  35, 50, 25,
  45, 40, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '1-2 weeks typically', 'ONE_OFF', NULL, false,
  true, NULL, 'Apply directly to local council. Availability varies by area. Summer typically best.',
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
  'book_the_spirit_level', 'BOOK', 'PHYSICAL_BOOK',
  'The Spirit Level', 'Why Equality is Better for Everyone', 'Wilkinson and Pickett''s data-driven argument that more equal societies perform better on almost every measure. Essential for sociology, politics, and economics applicants interested in inequality and public policy.',
  'Richard Wilkinson & Kate Pickett', 'Professors of Epidemiology, University of Nottingham and University of York', 'Penguin', 2009,
  '978-0141032061', NULL,
  true, 16, 600,
  'SOC', '{}', ARRAY['inequality', 'sociology', 'public-health', 'policy', 'data', 'society'], ARRAY['sociology', 'politics', 'social', 'policy', 'economics'],
  'Bristol Prize for Social Science Book of the Year', 'AWARD_WINNER', 'Excellent for discussing inequality with evidence in interviews', 85,
  55, 60, 45,
  55, 50, 35,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '10-12 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Available in most libraries. Some data now dated but arguments still relevant.',
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
  'course_economics_money_banking', 'COURSE', 'VIDEO_COURSE',
  'Economics of Money and Banking', NULL, 'Columbia University course on how the financial system works, from basic banking to central bank policy. Taught by Perry Mehrling. Provides depth beyond A-level economics on monetary systems.',
  'Columbia University', 'Perry Mehrling, Professor of Economics, Boston University (formerly Columbia)', 'Coursera', 2012,
  NULL, 'https://www.coursera.org/learn/money-banking',
  true, 13, 1500,
  'SOC', ARRAY['BUS'], ARRAY['economics', 'finance', 'banking', 'monetary-policy', 'central-banks'], ARRAY['economics', 'finance', 'banking'],
  'Columbia University', 'UNIVERSITY_READING_LIST', 'Demonstrates serious engagement with monetary economics beyond A-level', 85,
  70, 80, 55,
  60, 50, 60,
  ARRAY['A-level Economics or equivalent'], ARRAY['Y12', 'Y13'],
  '13 weeks, 3-4 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free on Coursera. Challenging but rewarding.',
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
  'competition_john_locke_essay', 'COMPETITION', 'MIXED',
  'John Locke Institute Essay Competition', NULL, 'Prestigious essay competition in philosophy, politics, economics, history, psychology, theology, and law. Essays up to 2000 words on challenging questions. Winners invited to Oxford for awards ceremony. Highly regarded by universities.',
  'John Locke Institute', 'Independent educational organisation focused on academic excellence', 'John Locke Institute', 2024,
  NULL, 'https://www.johnlockeinstitute.com/essay-competition',
  false, NULL, 1200,
  'SOC', ARRAY['LAW', 'HUM'], ARRAY['essay', 'competition', 'philosophy', 'politics', 'economics', 'history'], ARRAY['PPE', 'philosophy', 'politics', 'economics', 'history'],
  'Recognised by Oxford and Cambridge admissions', 'ADMISSIONS_TUTOR', 'Shortlisting or prize demonstrates exceptional academic ability', 92,
  85, 50, 30,
  80, 85, 90,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '15-20 hours research and writing', 'DEADLINE', 'June', true,
  true, NULL, 'Free to enter. Questions released in spring, deadline typically late June.',
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
  'video_justice_harvard', 'VIDEO', 'YOUTUBE',
  'Justice: What''s The Right Thing To Do?', 'Harvard Lecture Series', 'Michael Sandel''s complete Harvard lecture course on justice and moral reasoning. 24 episodes covering major philosophical frameworks through real-world dilemmas. Companion to his book of the same name.',
  'Harvard University', 'Michael Sandel, Professor of Government, Harvard University', 'Harvard University', 2009,
  NULL, 'https://www.youtube.com/playlist?list=PL30C13C91CFFEFEA6',
  true, 24, 720,
  'SOC', ARRAY['LAW', 'HUM'], ARRAY['philosophy', 'ethics', 'justice', 'lectures', 'harvard'], ARRAY['philosophy', 'PPE', 'politics', 'ethics'],
  'Harvard University''s most popular course', 'UNIVERSITY_READING_LIST', 'Excellent preparation for discussing ethical dilemmas in interviews', 92,
  65, 60, 15,
  55, 70, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '12 hours total', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube. Can watch individual episodes on topics of interest.',
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
  'volunteering_citizens_advice', 'VOLUNTEERING', 'IN_PERSON',
  'Citizens Advice Volunteer', NULL, 'Volunteer with Citizens Advice helping people navigate benefits, housing, employment, and debt issues. Provides direct experience of social policy in practice. Training provided. Excellent for sociology, politics, and social work applicants.',
  'Citizens Advice', 'National charity network providing free advice since 1939', 'Citizens Advice', 2024,
  NULL, 'https://www.citizensadvice.org.uk/about-us/support-us/volunteering/',
  false, NULL, NULL,
  'SOC', ARRAY['LAW'], ARRAY['volunteering', 'social-policy', 'advice', 'welfare', 'community'], ARRAY['sociology', 'social', 'policy', 'politics'],
  'Established national charity', 'PROFESSIONAL_BODY', 'Demonstrates practical engagement with social issues', 85,
  40, 60, 35,
  50, 55, 45,
  '{}', ARRAY['Y12', 'Y13'],
  'Ongoing, typically 8+ hours/month', 'ONGOING', NULL, false,
  true, NULL, 'Must be 18+ for most roles. Some bureaux have younger volunteer programmes.',
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
  'book_sapiens', 'BOOK', 'PHYSICAL_BOOK',
  'Sapiens', 'A Brief History of Humankind', 'Yuval Noah Harari''s sweeping narrative of human history from the cognitive revolution to the present. Ideal for history, anthropology, and social science applicants. Demonstrates ability to synthesise ideas across disciplines.',
  'Yuval Noah Harari', 'Professor of History, Hebrew University of Jerusalem', 'Vintage', 2014,
  '978-0099590088', NULL,
  true, 4, 720,
  'SOC', ARRAY['HUM'], ARRAY['history', 'anthropology', 'evolution', 'society', 'civilisation', 'interdisciplinary'], ARRAY['history', 'anthropology', 'human', 'social'],
  'Sunday Times bestseller, widely recommended by university tutors', 'COMMUNITY_RECOMMENDED', 'Popular choice for demonstrating interdisciplinary thinking in personal statements', 88,
  65, 70, 25,
  55, 60, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '12-15 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available. Good audiobook narrated by Derek Perkins.',
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
  'book_freakonomics', 'BOOK', 'PHYSICAL_BOOK',
  'Freakonomics', 'A Rogue Economist Explores the Hidden Side of Everything', 'Levitt and Dubner apply economic thinking to unconventional questions, from crime rates to baby names. Accessible introduction to economic reasoning. Shows how economics applies beyond finance to everyday life.',
  'Steven D. Levitt & Stephen J. Dubner', 'Levitt: Professor of Economics, University of Chicago; John Bates Clark Medal winner', 'Penguin', 2005,
  '978-0141019017', NULL,
  true, 6, 360,
  'SOC', ARRAY['BUS'], ARRAY['economics', 'statistics', 'incentives', 'unconventional', 'data-analysis'], ARRAY['economics', 'social', 'policy'],
  'New York Times bestseller, popular economics introduction', 'ESTABLISHED_MEDIA', 'Good entry point for students new to economic thinking', 82,
  45, 40, 30,
  40, 45, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12'],
  '6-8 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available. Accessible starting point before heavier economics texts.',
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
  'course_intro_psychology', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Psychology', NULL, 'Yale University''s comprehensive introduction to psychology covering perception, cognition, emotion, development, and mental illness. Taught by Professor Paul Bloom. Rigorous academic content freely accessible.',
  'Yale University', 'Paul Bloom, Professor of Psychology, Yale University', 'Coursera', 2017,
  NULL, 'https://www.coursera.org/learn/introduction-psychology',
  true, 6, 900,
  'SOC', ARRAY['MED'], ARRAY['psychology', 'cognitive', 'developmental', 'social-psychology', 'mental-health'], ARRAY['psychology', 'cognitive', 'behavioural'],
  'Yale University official course', 'UNIVERSITY_READING_LIST', 'Demonstrates proactive engagement with university-level psychology content', 90,
  60, 65, 40,
  55, 45, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '6 weeks, 3 hours/week', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit on Coursera. Certificate available for fee.',
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
  'test_tsa', 'ADMISSION_TEST', 'INTERACTIVE',
  'TSA (Thinking Skills Assessment)', NULL, 'Admissions test for PPE, Psychology, and other courses at Oxford. Tests critical thinking and problem-solving rather than subject knowledge. Section 1: multiple choice reasoning. Section 2: essay. Essential preparation for relevant applicants.',
  'Cambridge Assessment Admissions Testing', 'Official test provider for Oxford University', 'Cambridge Assessment', 2024,
  NULL, 'https://www.admissionstesting.org/for-test-takers/thinking-skills-assessment/',
  true, 2, 3600,
  'SOC', ARRAY['LAW'], ARRAY['admissions-test', 'critical-thinking', 'oxford', 'reasoning', 'essay'], ARRAY['PPE', 'psychology', 'geography'],
  'Required by Oxford for PPE, Psychology, E&M, Geography', 'PROFESSIONAL_BODY', 'Strong TSA score significantly improves Oxford application', 98,
  75, 70, 50,
  70, 65, 60,
  ARRAY['GCSE Maths', 'GCSE English'], ARRAY['Y12', 'Y13'],
  '30-60 hours preparation', 'DEADLINE', 'October', true,
  false, NULL, 'Test fee covered by Oxford. Free past papers on official website.',
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
  'epq_idea_inequality', 'EPQ_IDEA', 'MIXED',
  'EPQ: Regional Inequality in the UK', NULL, 'Extended Project investigating economic and social inequality between UK regions. Could analyse data on wages, health outcomes, education, or levelling up policies. Demonstrates research skills and engagement with major policy debates.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 7200,
  'SOC', '{}', ARRAY['EPQ', 'inequality', 'policy', 'research', 'data', 'regional'], ARRAY['economics', 'politics', 'sociology', 'geography'],
  NULL, NULL, 'Demonstrates independent research capability and engagement with UK policy', 75,
  65, 85, 50,
  65, 60, 85,
  ARRAY['Basic statistics helpful'], ARRAY['Y12', 'Y13'],
  '120+ hours over 6-9 months', 'ONGOING', NULL, false,
  true, NULL, 'Requires school EPQ registration. ONS and government data freely available.',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_thinking_fast_slow', 'CAH04', NULL, NULL, 95, true, 'Core behavioural psychology text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_thinking_fast_slow', NULL, 'economics', NULL, 90, false, 'Foundational behavioural economics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_thinking_fast_slow', NULL, 'PPE', NULL, 90, false, 'Core PPE reading list text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_justice', 'CAH20', NULL, NULL, 95, true, 'Core political philosophy text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_justice', NULL, 'philosophy', NULL, 95, false, 'Major theories of justice covered');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_justice', NULL, 'PPE', NULL, 90, false, 'Essential PPE preparation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_moral_foundations_politics', 'CAH15', NULL, NULL, 90, true, 'Political theory fundamentals');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_moral_foundations_politics', NULL, 'PPE', NULL, 95, false, 'Core PPE preparation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_thinking_allowed', 'CAH15', NULL, NULL, 85, true, 'Sociology research discussions');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_thinking_allowed', NULL, 'sociology', NULL, 90, false, 'Direct subject match');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_local_council', 'CAH15', NULL, NULL, 80, true, 'Government and policy experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_local_council', NULL, 'politics', NULL, 85, false, 'Direct political experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_spirit_level', 'CAH15', NULL, NULL, 85, true, 'Social science research on inequality');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_spirit_level', NULL, 'sociology', NULL, 90, false, 'Core inequality research');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_economics_money_banking', 'CAH15', NULL, NULL, 85, true, 'Advanced economics content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_economics_money_banking', NULL, 'economics', NULL, 90, false, 'Monetary economics focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_economics_money_banking', NULL, 'finance', NULL, 85, false, 'Financial systems content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_john_locke_essay', 'CAH20', NULL, NULL, 90, true, 'Philosophy and humanities essay competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_john_locke_essay', NULL, 'PPE', NULL, 90, false, 'PPE-relevant categories');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_john_locke_essay', 'CAH16', NULL, NULL, 85, false, 'Law category available');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_justice_harvard', 'CAH20', NULL, NULL, 90, true, 'Political philosophy lectures');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_justice_harvard', NULL, 'philosophy', NULL, 90, false, 'Ethics and justice focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_citizens_advice', 'CAH15', NULL, NULL, 80, true, 'Social policy in practice');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_citizens_advice', NULL, 'sociology', NULL, 75, false, 'Direct community experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_sapiens', 'CAH20', NULL, NULL, 85, true, 'Historical and philosophical overview of humanity');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_sapiens', NULL, 'history', NULL, 85, false, 'Broad historical narrative');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_sapiens', NULL, 'anthropology', NULL, 80, false, 'Human evolution and society focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_freakonomics', 'CAH15', NULL, NULL, 80, true, 'Accessible economics introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_freakonomics', NULL, 'economics', NULL, 85, false, 'Economic thinking applied unconventionally');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_psychology', 'CAH04', NULL, NULL, 95, true, 'Comprehensive psychology introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_psychology', NULL, 'psychology', NULL, 95, false, 'Direct subject match');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_tsa', NULL, 'PPE', NULL, 98, true, 'Required for Oxford PPE');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_tsa', 'CAH04', NULL, NULL, 95, false, 'Required for Oxford Psychology');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_idea_inequality', 'CAH15', NULL, NULL, 85, true, 'Social science research project');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_idea_inequality', NULL, 'economics', NULL, 80, false, 'Economic inequality focus');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_thinking_fast_slow', 'examrizz_arena', '{"TRANSFER":3,"CALIBRATION":5,"RECEPTIVITY":2}'::JSONB, '{"TOLERANCE":35}'::JSONB, 300, 5, true, '{"notes":"Recommend to students weak in CALIBRATION. Strong match for PPE, Economics, Psychology."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_justice', 'examrizz_arena', '{"TOLERANCE":2,"CALIBRATION":4,"RECEPTIVITY":3}'::JSONB, '{"TOLERANCE":30}'::JSONB, 250, 10, true, '{"notes":"Essential for PPE and philosophy. Boost for students weak in ethical reasoning."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_moral_foundations_politics', 'examrizz_arena', '{"TRANSFER":4,"TOLERANCE":2,"CALIBRATION":3}'::JSONB, '{"TOLERANCE":40,"CONSISTENCY":35}'::JSONB, 400, 15, true, '{"notes":"Challenging course. Recommend for serious PPE/Politics applicants."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_thinking_allowed', 'examrizz_arena', '{"TRANSFER":1,"RECEPTIVITY":2}'::JSONB, NULL, 50, 60, false, '{"notes":"Low commitment. Good for maintaining engagement. Ongoing listening."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_local_council', 'examrizz_arena', '{"SOCIAL":2,"RECEPTIVITY":3}'::JSONB, NULL, 250, 50, false, '{"notes":"Practical politics experience. Availability varies. Good for interview material."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_the_spirit_level', 'examrizz_arena', '{"TRANSFER":3,"PRECISION":2,"CALIBRATION":2}'::JSONB, '{"TOLERANCE":30}'::JSONB, 200, 30, false, '{"notes":"Data-driven approach suits students with some PRECISION. Good for policy interest."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_economics_money_banking', 'examrizz_arena', '{"PRECISION":3,"RETRIEVAL":2,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":45,"CONSISTENCY":40}'::JSONB, 450, 35, false, '{"notes":"Advanced. Only recommend to committed economics students with high TOLERANCE."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_john_locke_essay', 'examrizz_arena', '{"DEPTH":3,"TRANSFER":4,"CALIBRATION":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":50}'::JSONB, 400, 20, true, '{"notes":"High-achieving students. Boost if dominant DEPTH or TRANSFER."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_justice_harvard', 'examrizz_arena', '{"TRANSFER":2,"CALIBRATION":3,"RECEPTIVITY":3}'::JSONB, NULL, 200, 20, true, '{"notes":"Accessible philosophy. Good visual learners. Pairs with Justice book."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_citizens_advice', 'examrizz_arena', '{"SOCIAL":3,"TOLERANCE":2,"RECEPTIVITY":4}'::JSONB, '{"SOCIAL":35}'::JSONB, 300, 40, false, '{"notes":"Practical experience. Suits students with decent SOCIAL. Age restriction applies."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_sapiens', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":2}'::JSONB, '{"TOLERANCE":30}'::JSONB, 250, 15, true, '{"notes":"Good for students interested in big-picture thinking. Accessible entry point."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_freakonomics', 'examrizz_arena', '{"TRANSFER":3,"CALIBRATION":2}'::JSONB, NULL, 150, 25, false, '{"notes":"Entry-level economics. Good for Year 10-11 or those new to economics."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_intro_psychology', 'examrizz_arena', '{"RETRIEVAL":3,"CALIBRATION":4,"CONSISTENCY":2}'::JSONB, '{"CONSISTENCY":30}'::JSONB, 350, 10, true, '{"notes":"Structured course suits students needing CONSISTENCY. Core psychology preparation."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_tsa', 'examrizz_arena', '{"PRECISION":3,"TOLERANCE":3,"CALIBRATION":5}'::JSONB, '{"TOLERANCE":40,"CONSISTENCY":40}'::JSONB, 400, 1, true, '{"notes":"Essential for Oxford PPE/Psychology applicants. High priority."}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_idea_inequality', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":4,"CALIBRATION":3}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 45, false, '{"notes":"Major commitment. Only for students with high DEPTH and TOLERANCE."}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'SOC' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: LAW CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:30.523Z
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
  'course_contract_law', 'COURSE', 'VIDEO_COURSE',
  'Contract Law: From Trust to Promise to Contract', NULL, 'Harvard course exploring how contracts work, why they matter, and the principles underlying contract enforcement. Provides taste of substantive legal study and case analysis methods.',
  'Charles Fried', 'Harvard Law School Professor, former US Solicitor General', 'edX', 2019,
  NULL, 'https://www.edx.org/learn/law/harvard-university-contract-law-from-trust-to-promise-to-contract',
  true, 6, 600,
  'LAW', ARRAY['BUS'], ARRAY['contract-law', 'obligations', 'commercial-law'], ARRAY['law', 'business'],
  'Harvard Law School', 'UNIVERSITY_READING_LIST', 'Shows engagement with core law module content', 90,
  65, 55, 55,
  60, 50, 55,
  '{}', ARRAY['Y12', 'Y13'],
  '10 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on edX',
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
  'course_human_rights', 'COURSE', 'VIDEO_COURSE',
  'International Human Rights Law', NULL, 'UCLouvain course examining the international framework for human rights protection, including key treaties, institutions, and enforcement mechanisms. Relevant for public law and human rights interests.',
  'UCLouvain', 'Belgian university law faculty', 'edX', 2020,
  NULL, NULL,
  true, 8, 720,
  'LAW', ARRAY['SOC'], ARRAY['human-rights', 'international-law', 'public-law'], ARRAY['law', 'human-rights', 'politics'],
  'UCLouvain', 'UNIVERSITY_READING_LIST', 'Demonstrates interest in public international law', 82,
  60, 60, 50,
  55, 55, 55,
  '{}', ARRAY['Y12', 'Y13'],
  '12 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit',
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
  'competition_law_essay', 'COMPETITION', 'MIXED',
  'Cambridge Law Faculty Essay Competition', NULL, 'Annual essay competition for Year 12 students interested in law. Requires engaging with a substantive legal question and developing a structured argument. Winners receive book prizes and recognition.',
  'University of Cambridge Faculty of Law', 'Cambridge University Law Faculty', 'University of Cambridge', 2023,
  NULL, NULL,
  false, NULL, 600,
  'LAW', '{}', ARRAY['essay-competition', 'legal-writing', 'legal-reasoning'], ARRAY['law'],
  'Cambridge University Faculty of Law', 'UNIVERSITY_READING_LIST', 'Direct engagement with Cambridge Law, prize winner status', 95,
  75, 50, 55,
  75, 70, 70,
  ARRAY['GCSE English'], ARRAY['Y12'],
  '10+ hours', 'DEADLINE', 'March', true,
  true, NULL, 'Check Cambridge Law website for current year details',
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
  'book_letters_young_lawyer', 'BOOK', 'PHYSICAL_BOOK',
  'Letters to a Young Lawyer', NULL, 'Alan Dershowitz shares candid advice on legal ethics, career choices, and the realities of legal practice. Accessible introduction to the profession that helps applicants articulate why they want to study law beyond surface-level reasons.',
  'Alan Dershowitz', 'Harvard Law School Professor Emeritus, prominent constitutional lawyer', 'Basic Books', 2001,
  '978-0465016334', NULL,
  true, 8, 240,
  'LAW', ARRAY['SOC'], ARRAY['legal-ethics', 'legal-career', 'professional-advice', 'criminal-law'], ARRAY['law', 'legal'],
  'Widely recommended introduction to legal profession', 'ESTABLISHED_MEDIA', 'Helps articulate genuine interest in law beyond TV portrayals', 78,
  35, 30, 25,
  45, 40, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12'],
  '4-5 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available in paperback and ebook',
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
  'book_just_mercy', 'BOOK', 'PHYSICAL_BOOK',
  'Just Mercy', 'A Story of Justice and Redemption', 'Bryan Stevenson''s memoir about defending wrongly condemned prisoners on death row. Demonstrates the human impact of criminal justice systems and raises questions about equality before the law. Adapted into a major film.',
  'Bryan Stevenson', 'Founder of Equal Justice Initiative, NYU Law Professor, MacArthur Fellow', 'One World', 2014,
  '978-0812994520', NULL,
  true, 6, 540,
  'LAW', ARRAY['SOC'], ARRAY['criminal-justice', 'death-penalty', 'racial-justice', 'human-rights', 'legal-ethics'], ARRAY['law', 'criminology', 'human-rights'],
  'Oxford Law reading list, numerous university recommendations', 'UNIVERSITY_READING_LIST', 'Frequently cited in successful law personal statements', 92,
  45, 55, 30,
  50, 55, 35,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available, audiobook narrated by author',
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
  'book_english_legal_system', 'BOOK', 'PHYSICAL_BOOK',
  'The English Legal System', NULL, 'Comprehensive textbook covering the structure of English courts, legal personnel, civil and criminal processes, and sources of law. Essential foundation for understanding how UK law actually operates before starting a law degree.',
  'Gary Slapper and David Kelly', 'Gary Slapper was Professor of Law at NYU London; David Kelly is former Principal Lecturer in Law', 'Routledge', 2017,
  '978-1138284258', NULL,
  true, 12, 1200,
  'LAW', '{}', ARRAY['english-law', 'legal-system', 'courts', 'civil-procedure', 'criminal-procedure'], ARRAY['law'],
  'Standard A-Level Law and undergraduate textbook', 'UNIVERSITY_READING_LIST', 'Demonstrates serious engagement with legal structures', 88,
  55, 75, 60,
  60, 35, 50,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '20+ hours (selective reading)', 'FLEXIBLE', NULL, false,
  false, 36.99, 'Academic textbook, check for newer editions',
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
  'book_rule_of_law', 'BOOK', 'PHYSICAL_BOOK',
  'The Rule of Law', NULL, 'Lord Bingham examines the fundamental principle underlying democratic societies. Explores what the rule of law means, why it matters, and how it applies to contemporary issues. Written by one of Britain''s most distinguished judges.',
  'Tom Bingham', 'Lord Chief Justice of England and Wales, Senior Law Lord', 'Penguin', 2010,
  '978-0141034539', NULL,
  true, 8, 420,
  'LAW', ARRAY['SOC'], ARRAY['rule-of-law', 'constitutional-law', 'jurisprudence', 'human-rights', 'legal-philosophy'], ARRAY['law', 'politics'],
  'Cambridge and Oxford Law faculty recommendations', 'UNIVERSITY_READING_LIST', 'Shows understanding of foundational legal principles', 95,
  65, 45, 50,
  65, 60, 40,
  '{}', ARRAY['Y12', 'Y13'],
  '7-8 hours', 'ONE_OFF', NULL, false,
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
  'book_bleak_house', 'BOOK', 'PHYSICAL_BOOK',
  'Bleak House', NULL, 'Dickens'' satirical masterpiece centred on the interminable Jarndyce v Jarndyce case. Offers literary perspective on law''s delays and the human cost of legal processes. Demonstrates wider reading beyond pure law texts.',
  'Charles Dickens', 'Canonical English novelist, worked as law clerk', 'Penguin Classics', 1853,
  '978-0141439723', NULL,
  true, 10, 1800,
  'LAW', ARRAY['HUM'], ARRAY['legal-fiction', 'victorian', 'court-of-chancery', 'social-criticism'], ARRAY['law', 'english'],
  'Classic text on law and literature', 'ESTABLISHED_MEDIA', 'Shows breadth of engagement with law in society', 85,
  55, 90, 25,
  75, 50, 45,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '25-30 hours', 'ONE_OFF', NULL, false,
  false, 8.99, 'Multiple editions available, also free on Project Gutenberg',
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
  'course_intro_english_law', 'COURSE', 'VIDEO_COURSE',
  'Introduction to English Common Law', NULL, 'University of London course covering the foundations of English common law, including its historical development, court structure, and key legal principles. Taught by academics from London law schools.',
  'University of London', 'University of London law faculty', 'Coursera', 2020,
  NULL, 'https://www.coursera.org/learn/intro-common-law',
  true, 5, 720,
  'LAW', '{}', ARRAY['common-law', 'english-law', 'legal-history', 'court-system'], ARRAY['law'],
  'University of London', 'UNIVERSITY_READING_LIST', 'Certificate demonstrates proactive learning', 88,
  55, 60, 50,
  55, 40, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '12 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit, certificate requires payment',
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
  'test_lnat', 'ADMISSION_TEST', 'INTERACTIVE',
  'LNAT (Law National Aptitude Test)', NULL, 'Required admissions test for law at Oxford, UCL, Durham, and other top universities. Tests critical reading, interpretation, and essay writing skills. Essential preparation for competitive law applications.',
  'LNAT Consortium', 'Consortium of UK university law faculties', 'Pearson VUE', 2004,
  NULL, 'https://lnat.ac.uk',
  true, 4, 1200,
  'LAW', '{}', ARRAY['admissions-test', 'critical-thinking', 'essay-writing', 'legal-reasoning'], ARRAY['law'],
  'Required by Oxford, UCL, Durham, Bristol, Glasgow, etc.', 'UNIVERSITY_READING_LIST', 'Required for top law programmes', 100,
  70, 60, 40,
  80, 65, 50,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '20+ hours preparation', 'DEADLINE', 'January', true,
  false, 75, 'Register via lnat.ac.uk, test window September-January',
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
  'podcast_law_in_action', 'PODCAST', 'PODCAST_AUDIO',
  'Law in Action', NULL, 'BBC Radio 4''s long-running legal affairs programme examining current legal issues, landmark cases, and law reform. Provides accessible insight into how law operates in practice and contemporary legal debates.',
  'Joshua Rozenberg', 'Britain''s most distinguished legal journalist, former BBC Legal Correspondent', 'BBC Radio 4', 1984,
  NULL, 'https://www.bbc.co.uk/programmes/b006tgy1',
  true, 20, 600,
  'LAW', ARRAY['SOC'], ARRAY['legal-affairs', 'current-affairs', 'uk-law', 'legal-reform'], ARRAY['law'],
  'BBC', 'ESTABLISHED_MEDIA', 'Demonstrates awareness of current legal developments', 90,
  50, 40, 45,
  55, 50, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '30 mins per episode', 'ONGOING', NULL, true,
  true, NULL, 'Available on BBC Sounds, extensive archive',
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
  'video_supreme_court', 'VIDEO', 'YOUTUBE',
  'UK Supreme Court YouTube Channel', NULL, 'Official channel hosting footage of Supreme Court hearings and judgment summaries. Watch real legal argument at the highest level. Essential for understanding appellate advocacy and constitutional cases.',
  'UK Supreme Court', 'Official Supreme Court of the United Kingdom', 'YouTube', 2009,
  NULL, 'https://www.youtube.com/@UKSupremeCourt',
  true, 15, 600,
  'LAW', ARRAY['SOC'], ARRAY['supreme-court', 'appellate-advocacy', 'constitutional-law', 'case-law'], ARRAY['law', 'politics'],
  'UK Supreme Court', 'GOVERNMENT_BODY', 'Demonstrates engagement with real legal proceedings', 100,
  70, 50, 65,
  70, 60, 55,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  'Variable - 1hr+ per case', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube, continuously updated',
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
  'volunteering_cab', 'VOLUNTEERING', 'IN_PERSON',
  'Citizens Advice Bureau Volunteer', NULL, 'Volunteer with local Citizens Advice providing information on legal rights, benefits, housing, and consumer issues. Direct experience of how law affects ordinary people. Excellent for understanding access to justice.',
  'Citizens Advice', 'National charity providing free legal and financial advice', 'Citizens Advice', 1939,
  NULL, 'https://www.citizensadvice.org.uk/about-us/support-us/volunteering/',
  false, NULL, 2400,
  'LAW', ARRAY['SOC'], ARRAY['volunteering', 'legal-advice', 'access-to-justice', 'social-welfare'], ARRAY['law', 'social-work'],
  'Citizens Advice', 'PROFESSIONAL_BODY', 'Direct client-facing legal experience', 92,
  50, 70, 45,
  55, 60, 55,
  '{}', ARRAY['Y12', 'Y13'],
  '4+ hours/week ongoing', 'ONGOING', NULL, true,
  true, NULL, 'Contact local CAB, minimum age usually 16-18',
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
  'work_experience_law_firm', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Law Firm Work Experience / Mini-Pupillage', NULL, 'Structured work experience at a solicitors'' firm or barristers'' chambers. Observe legal work, attend client meetings, and understand different practice areas. Many firms offer formal schemes for sixth formers.',
  'Various law firms and chambers', 'Legal profession', NULL, NULL,
  NULL, NULL,
  false, NULL, 2100,
  'LAW', '{}', ARRAY['work-experience', 'legal-practice', 'solicitors', 'barristers'], ARRAY['law'],
  'Legal profession standard', 'INDUSTRY_STANDARD', 'Essential evidence of genuine commitment to law', 95,
  45, 55, 40,
  50, 55, 65,
  '{}', ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Apply directly to firms/chambers, check Pathways to Law scheme',
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
  'epq_legal_reform', 'EPQ_IDEA', 'MIXED',
  'EPQ: Evaluating a Legal Reform Proposal', NULL, 'Extended project examining a current legal reform debate (e.g., assisted dying legislation, reform of the House of Lords'' judicial function, Online Safety Act implications). Demonstrates independent research and critical analysis of law in society.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'LAW', ARRAY['SOC'], ARRAY['epq', 'legal-reform', 'independent-research', 'dissertation'], ARRAY['law', 'politics'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus evidence of sustained legal research', 88,
  70, 85, 55,
  70, 75, 85,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_contract_law', 'CAH16', NULL, NULL, 88, true, 'Core law module preview');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_contract_law', NULL, 'business', NULL, 70, false, 'Commercial law foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_human_rights', 'CAH16', NULL, NULL, 85, true, 'Public international law');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_human_rights', NULL, 'human-rights', NULL, 90, false, 'Direct human rights focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_law_essay', 'CAH16', NULL, NULL, 95, true, 'Direct engagement with university law faculty');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_letters_young_lawyer', 'CAH16', NULL, NULL, 85, true, 'Direct introduction to legal profession');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_just_mercy', 'CAH16', NULL, NULL, 90, true, 'Criminal justice and legal ethics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_just_mercy', NULL, 'criminology', NULL, 80, false, 'Criminal justice system critique');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_english_legal_system', 'CAH16', NULL, NULL, 95, true, 'Core legal system textbook');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_rule_of_law', 'CAH16', NULL, NULL, 92, true, 'Foundational legal philosophy');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_rule_of_law', NULL, 'politics', NULL, 75, false, 'Constitutional principles');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_bleak_house', 'CAH16', NULL, NULL, 70, true, 'Law and literature perspective');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_bleak_house', NULL, 'english', NULL, 85, false, 'Canonical Victorian literature');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_english_law', 'CAH16', NULL, NULL, 90, true, 'Foundation course in English law');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_lnat', 'CAH16', NULL, NULL, 100, true, 'Required admissions test for top law schools');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_law_in_action', 'CAH16', NULL, NULL, 85, true, 'Current legal affairs');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_supreme_court', 'CAH16', NULL, NULL, 92, true, 'Real appellate proceedings');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_cab', 'CAH16', NULL, NULL, 88, true, 'Practical legal advice experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_law_firm', 'CAH16', NULL, NULL, 95, true, 'Direct legal profession exposure');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_legal_reform', 'CAH16', NULL, NULL, 90, true, 'Independent legal research project');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_legal_reform', NULL, 'politics', NULL, 75, false, 'Legislative reform analysis');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_contract_law', 'examrizz_arena', '{"DEPTH":3,"PRECISION":4}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 12, false, '{"notes":"Taste of substantive law module, good for testing commitment"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_human_rights', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 14, false, '{"notes":"For students interested in public law and international dimensions"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_law_essay', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":45}'::JSONB, 350, 6, true, '{"notes":"High-achieving students targeting Cambridge Law"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_letters_young_lawyer', 'examrizz_arena', '{"CALIBRATION":3,"RECEPTIVITY":2}'::JSONB, '{}'::JSONB, 150, 15, false, '{"notes":"Good starting point for students exploring law"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_just_mercy', 'examrizz_arena', '{"TRANSFER":3,"TOLERANCE":3,"CALIBRATION":4}'::JSONB, '{"TOLERANCE":30}'::JSONB, 280, 5, true, '{"notes":"Essential for law applicants, especially those interested in criminal justice"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_english_legal_system', 'examrizz_arena', '{"PRECISION":4,"STRUCTURE":3}'::JSONB, '{"STRUCTURE":35,"TOLERANCE":40}'::JSONB, 350, 10, false, '{"notes":"For serious applicants ready for academic legal text"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_rule_of_law', 'examrizz_arena', '{"DEPTH":4,"TRANSFER":4,"CALIBRATION":5}'::JSONB, '{"TOLERANCE":35}'::JSONB, 300, 3, true, '{"notes":"Essential for Oxbridge law applicants, strong on jurisprudence"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_bleak_house', 'examrizz_arena', '{"DEPTH":4,"TRANSFER":3,"TOLERANCE":5}'::JSONB, '{"DEPTH":40,"TOLERANCE":50}'::JSONB, 400, 20, false, '{"notes":"For students with strong reading stamina wanting law + literature angle"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_intro_english_law', 'examrizz_arena', '{"STRUCTURE":4,"CONSISTENCY":3}'::JSONB, '{"STRUCTURE":30}'::JSONB, 300, 8, true, '{"notes":"Great structured introduction, good for those who prefer guided learning"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_lnat', 'examrizz_arena', '{"PRECISION":5,"TOLERANCE":3,"CALIBRATION":4}'::JSONB, '{"TOLERANCE":40}'::JSONB, 400, 1, true, '{"notes":"Essential for Oxford, UCL, Durham applicants - must prepare"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_law_in_action', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":2}'::JSONB, '{}'::JSONB, 100, 18, false, '{"notes":"Easy entry point, good for building current awareness"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_supreme_court', 'examrizz_arena', '{"DEPTH":4,"TOLERANCE":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 200, 16, false, '{"notes":"For students wanting to see real legal argument"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_cab', 'examrizz_arena', '{"SOCIAL":5,"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{"SOCIAL":40}'::JSONB, 450, 4, true, '{"notes":"Essential practical experience, shows genuine commitment"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_law_firm', 'examrizz_arena', '{"SOCIAL":3,"CALIBRATION":5}'::JSONB, '{}'::JSONB, 400, 2, true, '{"notes":"Critical for demonstrating commitment, apply early"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_legal_reform', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"TOLERANCE":5}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 7, true, '{"notes":"For committed students wanting substantial independent project"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'LAW' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: MED CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:31.039Z
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
  'book_this_is_going_to_hurt', 'BOOK', 'PHYSICAL_BOOK',
  'This is Going to Hurt', 'Secret Diaries of a Junior Doctor', 'Adam Kay''s bestselling memoir of life as a junior doctor in the NHS. Provides authentic insight into the realities of medical training, work-life balance challenges, and emotional demands of medicine. Essential reading for understanding what a medical career truly involves.',
  'Adam Kay', 'Former NHS Junior Doctor, BAFTA-winning writer', 'Picador', 2017,
  '978-1509858637', NULL,
  true, 6, 300,
  'MED', '{}', ARRAY['medicine', 'nhs', 'junior-doctor', 'memoir', 'healthcare'], ARRAY['medicine', 'medical'],
  'Sunday Times Bestseller, recommended by medical school applicants', 'ESTABLISHED_MEDIA', 'Frequently referenced in medicine personal statements for demonstrating awareness of NHS realities', 88,
  25, 35, 20,
  30, 25, 20,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '5-6 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available in bookshops and libraries, audiobook narrated by author',
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
  'book_do_no_harm', 'BOOK', 'PHYSICAL_BOOK',
  'Do No Harm', 'Stories of Life, Death and Brain Surgery', 'Henry Marsh''s candid account of life as a neurosurgeon. Explores medical ethics, decision-making under uncertainty, and the emotional weight of high-stakes surgery. Demonstrates understanding of surgical careers and medical ethics for applications.',
  'Henry Marsh', 'Consultant Neurosurgeon at St George''s Hospital London, CBE', 'Weidenfeld & Nicolson', 2014,
  '978-1780225920', NULL,
  true, 25, 480,
  'MED', '{}', ARRAY['neurosurgery', 'medical-ethics', 'surgery', 'memoir', 'decision-making'], ARRAY['medicine', 'surgery', 'neuroscience'],
  'Guardian First Book Award winner, Cambridge Medicine reading suggestions', 'AWARD_WINNER', 'Demonstrates engagement with surgical ethics and medical humanities', 92,
  45, 50, 35,
  50, 55, 30,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Available in most bookshops, audiobook available',
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
  'course_futurelearn_heart_anatomy', 'COURSE', 'VIDEO_COURSE',
  'The Heart: Pair of Pumps', NULL, 'University of Nottingham course on cardiac anatomy and physiology. Explores how the heart works, common cardiovascular conditions, and clinical examination. Directly relevant A-level content with clinical context.',
  'University of Nottingham', 'Medical School with strong clinical teaching reputation', 'FutureLearn', 2023,
  NULL, 'https://www.futurelearn.com/courses/the-heart',
  true, 2, 120,
  'MED', ARRAY['STEM_LIFE'], ARRAY['cardiology', 'anatomy', 'physiology', 'heart'], ARRAY['medicine', 'biomedical', 'anatomy'],
  'University of Nottingham via FutureLearn', 'UNIVERSITY_READING_LIST', 'Shows engagement with clinical anatomy beyond A-level', 82,
  45, 25, 50,
  40, 20, 35,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '2 hours', 'ONE_OFF', NULL, false,
  true, NULL, 'Free to access on FutureLearn',
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
  'epq_nhs_policy', 'EPQ_IDEA', 'MIXED',
  'EPQ: NHS Funding and Healthcare Outcomes', NULL, 'Extended Project Qualification investigating the relationship between NHS funding models and patient outcomes. Combines health economics, policy analysis, and statistical evaluation. Demonstrates analytical skills and understanding of healthcare systems.',
  'Self-directed', NULL, 'AQA/Pearson EPQ', 2024,
  NULL, NULL,
  true, 5, 7200,
  'MED', ARRAY['SOC', 'BUS'], ARRAY['epq', 'nhs', 'health-economics', 'policy', 'research'], ARRAY['medicine', 'healthcare', 'public-health'],
  'EPQ valued by medical schools for independent research skills', 'UNIVERSITY_READING_LIST', 'Demonstrates independent research capability and interest in healthcare systems', 82,
  65, 85, 50,
  60, 70, 90,
  ARRAY['GCSE Maths', 'Interest in health policy'], ARRAY['Y12', 'Y13'],
  '120+ hours over academic year', 'ONGOING', 'March', false,
  true, NULL, 'Delivered through school sixth form, requires supervisor',
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
  'book_being_mortal', 'BOOK', 'PHYSICAL_BOOK',
  'Being Mortal', 'Illness, Medicine and What Matters in the End', 'Atul Gawande examines how medicine handles ageing and death. Explores end-of-life care, patient autonomy, and what constitutes a good death. Essential for understanding holistic patient care and medical ethics beyond treatment.',
  'Atul Gawande', 'Professor at Harvard Medical School, Surgeon at Brigham and Women''s Hospital', 'Profile Books', 2014,
  '978-1846685828', NULL,
  true, 8, 420,
  'MED', ARRAY['SOC'], ARRAY['geriatrics', 'palliative-care', 'medical-ethics', 'end-of-life', 'patient-care'], ARRAY['medicine', 'nursing', 'healthcare'],
  'New York Times Bestseller, widely recommended on medical school reading lists', 'UNIVERSITY_READING_LIST', 'Shows understanding of patient-centred care beyond clinical treatment', 90,
  50, 45, 25,
  45, 60, 30,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '7-8 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available, excellent audiobook',
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
  'book_the_man_who_mistook_his_wife', 'BOOK', 'PHYSICAL_BOOK',
  'The Man Who Mistook His Wife for a Hat', NULL, 'Oliver Sacks presents fascinating neurological case studies exploring how brain disorders affect perception and identity. Demonstrates the intersection of medicine, psychology, and philosophy. Excellent for showing breadth of medical interest.',
  'Oliver Sacks', 'Professor of Neurology at NYU School of Medicine, Fellow of the Royal College of Physicians', 'Picador', 1985,
  '978-0330523622', NULL,
  true, 24, 480,
  'MED', ARRAY['SOC'], ARRAY['neurology', 'psychology', 'case-studies', 'brain', 'perception'], ARRAY['medicine', 'neuroscience', 'psychology'],
  'Classic medical humanities text, frequently on university reading lists', 'UNIVERSITY_READING_LIST', 'Demonstrates interest in neurological sciences and patient narratives', 94,
  55, 50, 40,
  50, 45, 30,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Classic text, widely available in libraries and bookshops',
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
  'book_when_breath_becomes_air', 'BOOK', 'PHYSICAL_BOOK',
  'When Breath Becomes Air', NULL, 'Paul Kalanithi''s memoir of facing terminal lung cancer as a neurosurgery resident. Explores what makes life meaningful and the doctor-patient relationship from both perspectives. Deeply moving exploration of mortality and vocation.',
  'Paul Kalanithi', 'Neurosurgery Resident at Stanford University Medical Center', 'Vintage', 2016,
  '978-1784701994', NULL,
  true, 3, 300,
  'MED', ARRAY['HUM'], ARRAY['memoir', 'neurosurgery', 'mortality', 'meaning', 'doctor-patient'], ARRAY['medicine', 'medical'],
  'New York Times Bestseller, Wellcome Book Prize shortlist', 'AWARD_WINNER', 'Shows deep reflection on medical vocation and meaning', 89,
  45, 35, 20,
  55, 50, 25,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '5-6 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available, powerful audiobook',
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
  'course_futurelearn_good_brain_bad_brain', 'COURSE', 'VIDEO_COURSE',
  'Good Brain, Bad Brain: Basics', NULL, 'University of Birmingham course exploring how the brain works and what happens when it goes wrong. Covers neuroscience fundamentals, neurological conditions, and current research. Excellent foundation for medicine and neuroscience applications.',
  'University of Birmingham', 'Russell Group University, Strong Neuroscience Department', 'FutureLearn', 2023,
  NULL, 'https://www.futurelearn.com/courses/good-brain-bad-brain-basics',
  true, 3, 180,
  'MED', ARRAY['SOC', 'STEM_LIFE'], ARRAY['neuroscience', 'brain', 'neurology', 'psychology'], ARRAY['medicine', 'neuroscience', 'biomedical'],
  'University of Birmingham via FutureLearn', 'UNIVERSITY_READING_LIST', 'Certificate demonstrates proactive engagement with neuroscience', 85,
  50, 30, 45,
  45, 30, 40,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '3 hours', 'ONE_OFF', NULL, false,
  true, NULL, 'Free to access, certificate upgrade available',
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
  'course_futurelearn_dementia', 'COURSE', 'VIDEO_COURSE',
  'Understanding Dementia', NULL, 'University of Tasmania course covering dementia types, symptoms, diagnosis, and care approaches. Highly relevant for understanding ageing populations and person-centred care. Demonstrates interest in geriatrics and long-term conditions.',
  'University of Tasmania', 'Wicking Dementia Research and Education Centre', 'FutureLearn', 2023,
  NULL, 'https://www.futurelearn.com/courses/understanding-dementia',
  true, 7, 420,
  'MED', ARRAY['SOC'], ARRAY['dementia', 'geriatrics', 'neurology', 'patient-care', 'ageing'], ARRAY['medicine', 'nursing', 'healthcare'],
  'University of Tasmania Wicking Centre via FutureLearn', 'UNIVERSITY_READING_LIST', 'Demonstrates understanding of major healthcare challenge and person-centred care', 84,
  40, 45, 35,
  40, 35, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '7 hours', 'WEEKLY', NULL, false,
  true, NULL, 'Free, one of FutureLearn''s most popular health courses',
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
  'test_ucat', 'ADMISSION_TEST', 'INTERACTIVE',
  'UCAT (University Clinical Aptitude Test)', NULL, 'Required admissions test for most UK medical and dental schools. Tests verbal reasoning, decision making, quantitative reasoning, abstract reasoning, and situational judgement. Essential preparation for medicine and dentistry applications.',
  'UCAT Consortium', 'Consortium of UK medical and dental schools', 'Pearson VUE', 2024,
  NULL, 'https://www.ucat.ac.uk',
  true, 5, 6000,
  'MED', '{}', ARRAY['admissions-test', 'medicine', 'dentistry', 'aptitude', 'reasoning'], ARRAY['medicine', 'dentistry'],
  'Required by 40+ UK medical and dental schools', 'UNIVERSITY_READING_LIST', 'Strong UCAT score directly impacts application success', 98,
  65, 80, 50,
  70, 60, 70,
  ARRAY['GCSE Maths', 'GCSE English'], ARRAY['Y12', 'Y13'],
  '100+ hours preparation', 'DEADLINE', 'September', true,
  false, 75, 'Test taken July-September, bursaries available for eligible students',
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
  'test_bmat', 'ADMISSION_TEST', 'INTERACTIVE',
  'BMAT (BioMedical Admissions Test)', NULL, 'Admissions test required by select medical schools including Cambridge, Oxford, Imperial, and UCL. Tests scientific knowledge, critical thinking, and writing ability. More academically focused than UCAT.',
  'Cambridge Assessment Admissions Testing', 'Part of Cambridge Assessment, University of Cambridge', 'Cambridge Assessment', 2024,
  NULL, 'https://www.admissionstesting.org/for-test-takers/bmat/',
  true, 3, 4800,
  'MED', ARRAY['STEM_LIFE', 'STEM_PHYS'], ARRAY['admissions-test', 'medicine', 'science', 'critical-thinking', 'writing'], ARRAY['medicine', 'biomedical'],
  'Required by Cambridge, Oxford, Imperial, UCL medicine', 'UNIVERSITY_READING_LIST', 'Required for top medical schools, demonstrates academic rigour', 96,
  75, 75, 70,
  65, 55, 65,
  ARRAY['GCSE Science', 'GCSE Maths', 'A-level sciences helpful'], ARRAY['Y12', 'Y13'],
  '80+ hours preparation', 'DEADLINE', 'November', true,
  false, 75, 'Test typically in late October/early November, check current requirements as some universities changing',
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
  'podcast_bbc_inside_health', 'PODCAST', 'PODCAST_AUDIO',
  'BBC Inside Health', NULL, 'BBC Radio 4 programme exploring medical issues, NHS policy, and health research. Hosted by practising GPs who explain complex health topics accessibly. Demonstrates awareness of current healthcare debates and NHS challenges.',
  'BBC Radio 4', 'BBC flagship health programme, presented by practising doctors', 'BBC', 2024,
  NULL, 'https://www.bbc.co.uk/programmes/b019dl1b',
  true, 50, 1500,
  'MED', ARRAY['SOC'], ARRAY['nhs', 'healthcare-policy', 'medical-research', 'public-health'], ARRAY['medicine', 'healthcare', 'public-health'],
  'BBC Radio 4', 'ESTABLISHED_MEDIA', 'Shows engagement with current NHS issues and evidence-based medicine', 88,
  40, 25, 35,
  40, 35, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '30 mins per episode', 'ONGOING', NULL, true,
  true, NULL, 'Free on BBC Sounds, weekly episodes',
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
  'video_crashcourse_anatomy', 'VIDEO', 'YOUTUBE',
  'Crash Course Anatomy & Physiology', NULL, 'Comprehensive YouTube series covering human anatomy and physiology in 47 episodes. Engaging presentation style makes complex biological systems accessible. Excellent A-level supplement and medical school preparation.',
  'Hank Green', 'Science communicator, co-creator of Crash Course educational series', 'Crash Course / Complexly', 2015,
  NULL, 'https://www.youtube.com/playlist?list=PL8dPuuaLjXtOAKed_MxxWBNaPno5h3Zs8',
  true, 47, 470,
  'MED', ARRAY['STEM_LIFE'], ARRAY['anatomy', 'physiology', 'biology', 'body-systems'], ARRAY['medicine', 'biomedical', 'anatomy', 'biology'],
  'Crash Course educational series, widely used by teachers', 'COMMUNITY_RECOMMENDED', 'Strong foundation in anatomy supports medicine interview discussions', 80,
  45, 50, 50,
  40, 20, 35,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '8 hours total', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube',
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
  'volunteering_nhs_hospital', 'VOLUNTEERING', 'IN_PERSON',
  'NHS Hospital Volunteering', NULL, 'Volunteer roles in NHS hospitals including ward support, patient befriending, and administrative assistance. Provides direct exposure to hospital environments, patient interaction, and multidisciplinary team working. Essential for understanding healthcare delivery.',
  'NHS Trusts', 'National Health Service', 'Local NHS Hospital Trusts', 2024,
  NULL, NULL,
  false, NULL, 2400,
  'MED', '{}', ARRAY['nhs', 'volunteering', 'hospital', 'patient-care', 'work-experience'], ARRAY['medicine', 'nursing', 'healthcare'],
  'NHS, medical school admissions guidance', 'PROFESSIONAL_BODY', 'Direct NHS experience highly valued by all medical schools', 95,
  30, 60, 20,
  40, 45, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '4+ hours weekly over several months', 'ONGOING', NULL, true,
  true, NULL, 'Apply through local NHS Trust volunteer services, DBS check required, minimum age varies',
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
  'work_experience_care_home', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Care Home Work Experience', NULL, 'Practical experience in residential care settings working with elderly residents. Develops communication skills, understanding of chronic conditions, and insight into social care integration. Often more accessible than hospital placements.',
  'Care Homes UK', 'Regulated care providers', 'Local care homes', 2024,
  NULL, NULL,
  false, NULL, 1200,
  'MED', '{}', ARRAY['care', 'elderly', 'social-care', 'work-experience', 'communication'], ARRAY['medicine', 'nursing', 'healthcare'],
  'Medical school admissions tutors', 'ADMISSIONS_TUTOR', 'Demonstrates commitment to caring roles and understanding of continuity of care', 85,
  25, 50, 15,
  45, 40, 45,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '1-2 weeks or regular weekly visits', 'FLEXIBLE', NULL, false,
  true, NULL, 'Contact local care homes directly, DBS may be required',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_this_is_going_to_hurt', 'CAH01', NULL, NULL, 95, true, 'Direct insight into junior doctor experience in NHS');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_this_is_going_to_hurt', NULL, 'medicine', NULL, 95, false, 'Core medicine application reading');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_do_no_harm', 'CAH01', NULL, NULL, 90, true, 'Surgical career insight and medical ethics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_do_no_harm', NULL, 'surgery', NULL, 85, false, 'Neurosurgery focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_futurelearn_heart_anatomy', 'CAH01', NULL, NULL, 85, true, 'Clinical anatomy for medicine');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_nhs_policy', 'CAH01', NULL, NULL, 80, true, 'Healthcare systems understanding');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_nhs_policy', NULL, 'health economics', NULL, 75, false, 'Health economics focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_being_mortal', 'CAH01', NULL, NULL, 85, true, 'End-of-life care and patient autonomy');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_being_mortal', 'CAH02', NULL, NULL, 80, false, 'Relevant to nursing and allied health');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_man_who_mistook_his_wife', 'CAH01', NULL, NULL, 85, true, 'Neurology and patient narratives');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_man_who_mistook_his_wife', 'CAH04', NULL, NULL, 80, false, 'Strong psychology crossover');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_when_breath_becomes_air', 'CAH01', NULL, NULL, 90, true, 'Medical vocation and mortality');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_futurelearn_good_brain_bad_brain', 'CAH01', NULL, NULL, 80, true, 'Neuroscience foundations for medicine');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_futurelearn_good_brain_bad_brain', 'CAH03', NULL, NULL, 75, false, 'Relevant to biological sciences');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_futurelearn_dementia', 'CAH01', NULL, NULL, 80, true, 'Geriatric medicine and patient care');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_futurelearn_dementia', 'CAH02', NULL, NULL, 85, false, 'Highly relevant to nursing');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_ucat', 'CAH01', NULL, NULL, 100, true, 'Required for most UK medical schools');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_ucat', NULL, 'dentistry', NULL, 100, false, 'Required for dental schools');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_bmat', 'CAH01', NULL, NULL, 95, true, 'Required by top medical schools');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_bbc_inside_health', 'CAH01', NULL, NULL, 85, true, 'NHS and healthcare current affairs');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_bbc_inside_health', NULL, 'public health', NULL, 80, false, 'Covers public health topics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_crashcourse_anatomy', 'CAH01', NULL, NULL, 80, true, 'Anatomy foundation for medicine');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_crashcourse_anatomy', 'CAH03', NULL, NULL, 75, false, 'Biological sciences content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_nhs_hospital', 'CAH01', NULL, NULL, 98, true, 'Essential work experience for medicine');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_nhs_hospital', 'CAH02', NULL, NULL, 95, false, 'Valuable for nursing and allied health');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_care_home', 'CAH01', NULL, NULL, 85, true, 'Caring experience for medicine');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_care_home', 'CAH02', NULL, NULL, 90, false, 'Directly relevant to nursing');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_this_is_going_to_hurt', 'examrizz_arena', '{"CALIBRATION":4,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 200, 5, true, '{"notes":"Recommend early in application journey, accessible entry point to medical realities"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_do_no_harm', 'examrizz_arena', '{"DEPTH":3,"TOLERANCE":3,"CALIBRATION":5}'::JSONB, '{"TOLERANCE":30}'::JSONB, 280, 8, true, '{"notes":"For students interested in surgery, strong in TOLERANCE"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_futurelearn_heart_anatomy', 'examrizz_arena', '{"PRECISION":3,"STRUCTURE":3}'::JSONB, '{}'::JSONB, 120, 18, false, '{"notes":"Short, focused - good for building momentum"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_nhs_policy', 'examrizz_arena', '{"DEPTH":5,"TRANSFER":4,"TOLERANCE":4}'::JSONB, '{"DEPTH":45,"TOLERANCE":45}'::JSONB, 400, 9, false, '{"notes":"Ambitious students interested in health policy, requires strong self-direction"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_being_mortal', 'examrizz_arena', '{"DEPTH":4,"CALIBRATION":4,"RECEPTIVITY":3}'::JSONB, '{"DEPTH":35}'::JSONB, 260, 10, false, '{"notes":"For reflective students interested in ethics and patient-centred care"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_the_man_who_mistook_his_wife', 'examrizz_arena', '{"DEPTH":4,"TRANSFER":5}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 12, true, '{"notes":"Cross-disciplinary appeal, suits psychology-medicine intersection"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_when_breath_becomes_air', 'examrizz_arena', '{"CALIBRATION":5,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 200, 6, false, '{"notes":"Emotionally impactful, suits students exploring medical vocation deeply"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_futurelearn_good_brain_bad_brain', 'examrizz_arena', '{"RETRIEVAL":3,"STRUCTURE":3}'::JSONB, '{}'::JSONB, 150, 15, false, '{"notes":"Structured intro for students needing guided learning"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_futurelearn_dementia', 'examrizz_arena', '{"CONSISTENCY":3,"RECEPTIVITY":4}'::JSONB, '{"CONSISTENCY":25}'::JSONB, 250, 14, false, '{"notes":"Longer commitment, suits students with steady work habits"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_ucat', 'examrizz_arena', '{"PRECISION":5,"RETRIEVAL":5,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":40,"CONSISTENCY":40}'::JSONB, 500, 1, true, '{"notes":"Essential for medicine applicants, requires significant commitment"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_bmat', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":45}'::JSONB, 450, 2, true, '{"notes":"For Oxbridge/top medical school applicants, academically demanding"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_bbc_inside_health', 'examrizz_arena', '{"TRANSFER":3,"CALIBRATION":2}'::JSONB, '{}'::JSONB, 100, 20, false, '{"notes":"Low commitment, good for building awareness alongside other activities"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_crashcourse_anatomy', 'examrizz_arena', '{"RETRIEVAL":3,"STRUCTURE":4}'::JSONB, '{}'::JSONB, 200, 16, false, '{"notes":"Visual learners, students wanting structured A-level support"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_nhs_hospital', 'examrizz_arena', '{"SOCIAL":5,"CALIBRATION":4,"RECEPTIVITY":4}'::JSONB, '{"SOCIAL":30,"CONSISTENCY":35}'::JSONB, 400, 3, true, '{"notes":"Essential for serious medicine applicants, requires social confidence"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_care_home', 'examrizz_arena', '{"SOCIAL":4,"RECEPTIVITY":4}'::JSONB, '{"SOCIAL":25}'::JSONB, 300, 7, false, '{"notes":"More accessible than hospital, good stepping stone"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'MED' GROUP BY primary_cluster;
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
-- ============================================================================
-- SEED DATA: COMP CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:32.572Z
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
  'book_code', 'BOOK', 'PHYSICAL_BOOK',
  'Code', 'The Hidden Language of Computer Hardware and Software', 'Charles Petzold builds understanding of computers from first principles - Morse code to logic gates to processors. Exceptional for developing intuition about how computers actually work at the hardware level.',
  'Charles Petzold', 'Windows programming author, Microsoft MVP', 'Microsoft Press', 2000,
  '978-0137909100', NULL,
  true, 12, 720,
  'COMP', ARRAY['ENG'], ARRAY['computer-architecture', 'digital-logic', 'hardware', 'binary', 'fundamentals'], ARRAY['computer-science', 'computing', 'software-engineering'],
  'Widely recommended CS foundation text', 'COMMUNITY_RECOMMENDED', 'Demonstrates understanding beyond just coding', 90,
  65, 65, 55,
  50, 30, 45,
  ARRAY['GCSE Maths'], ARRAY['Y11', 'Y12', 'Y13'],
  '12-15 hours', 'ONE_OFF', NULL, false,
  false, 25.99, '2nd edition (2022) available',
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
  'book_clean_code', 'BOOK', 'PHYSICAL_BOOK',
  'Clean Code', 'A Handbook of Agile Software Craftsmanship', 'Robert Martin''s guide to writing readable, maintainable code. Covers naming, functions, comments, error handling, and testing. Industry standard for professional software development practices.',
  'Robert C. Martin', 'Software engineer, author of SOLID principles, Agile Manifesto signatory', 'Prentice Hall', 2008,
  '978-0132350884', NULL,
  true, 10, 900,
  'COMP', '{}', ARRAY['software-engineering', 'code-quality', 'best-practices', 'agile'], ARRAY['computer-science', 'software-engineering'],
  'Industry standard text', 'INDUSTRY_STANDARD', 'Shows awareness of professional development practices', 88,
  55, 70, 65,
  50, 40, 55,
  ARRAY['Programming experience in any language'], ARRAY['Y12', 'Y13'],
  '15-20 hours', 'ONE_OFF', NULL, false,
  false, 35.99, 'Java examples but principles apply universally',
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
  'book_grokking_algorithms', 'BOOK', 'PHYSICAL_BOOK',
  'Grokking Algorithms', 'An Illustrated Guide for Programmers and Other Curious People', 'Visually-driven introduction to algorithms including search, sort, graphs, and dynamic programming. Accessible entry point to algorithmic thinking with Python examples. Excellent preparation for CS interviews and study.',
  'Aditya Bhargava', 'Software engineer at Etsy', 'Manning', 2016,
  '978-1617292231', NULL,
  true, 11, 600,
  'COMP', ARRAY['STEM_PHYS'], ARRAY['algorithms', 'data-structures', 'python', 'complexity'], ARRAY['computer-science', 'software-engineering', 'data-science'],
  'Popular introductory algorithms text', 'COMMUNITY_RECOMMENDED', 'Foundation for technical interview preparation', 85,
  60, 50, 55,
  40, 25, 40,
  ARRAY['Basic Python or programming'], ARRAY['Y11', 'Y12', 'Y13'],
  '10-12 hours', 'ONE_OFF', NULL, false,
  false, 31.99, 'Illustrated format, very accessible',
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
  'book_designing_data', 'BOOK', 'PHYSICAL_BOOK',
  'Designing Data-Intensive Applications', 'The Big Ideas Behind Reliable, Scalable, and Maintainable Systems', 'Martin Kleppmann''s comprehensive guide to distributed systems, databases, and data processing. Advanced but invaluable for understanding modern software architecture and big data systems.',
  'Martin Kleppmann', 'Former engineer at LinkedIn, researcher at Cambridge', 'O''Reilly Media', 2017,
  '978-1449373320', NULL,
  true, 12, 1500,
  'COMP', '{}', ARRAY['distributed-systems', 'databases', 'data-engineering', 'systems-design'], ARRAY['computer-science', 'data-science', 'software-engineering'],
  'Industry standard systems design text', 'INDUSTRY_STANDARD', 'Advanced reading demonstrating serious interest', 92,
  80, 85, 75,
  60, 50, 65,
  ARRAY['A-level Computing or equivalent', 'Programming experience'], ARRAY['Y13'],
  '25+ hours (selective reading)', 'FLEXIBLE', NULL, false,
  false, 44.99, 'Dense but exceptionally well-written',
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
  'book_hackers_painters', 'BOOK', 'PHYSICAL_BOOK',
  'Hackers & Painters', 'Big Ideas from the Computer Age', 'Paul Graham''s essays on programming, startups, and the hacker mindset. Thought-provoking perspectives on software development as a creative endeavour and the culture of technology innovation.',
  'Paul Graham', 'Y Combinator co-founder, Lisp programmer, essayist', 'O''Reilly Media', 2004,
  '978-1449389550', NULL,
  true, 15, 420,
  'COMP', ARRAY['BUS'], ARRAY['programming-culture', 'startups', 'software-philosophy', 'essays'], ARRAY['computer-science', 'software-engineering'],
  'Influential tech industry essays', 'ESTABLISHED_MEDIA', 'Shows broader thinking about technology and society', 82,
  55, 45, 35,
  55, 60, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '7-8 hours', 'ONE_OFF', NULL, false,
  false, 14.99, 'Essays also available free at paulgraham.com',
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
  'course_cs50', 'COURSE', 'VIDEO_COURSE',
  'CS50: Introduction to Computer Science', NULL, 'Harvard''s legendary intro CS course covering C, Python, SQL, web development, and computational thinking. Gold standard for demonstrating serious CS engagement. Certificate available.',
  'David Malan', 'Harvard Professor of Computer Science', 'edX', 2012,
  NULL, 'https://cs50.harvard.edu/x/',
  true, 11, 3600,
  'COMP', '{}', ARRAY['programming', 'c', 'python', 'algorithms', 'web-development'], ARRAY['computer-science', 'software-engineering'],
  'Harvard University', 'UNIVERSITY_READING_LIST', 'Completion demonstrates serious commitment and ability', 98,
  65, 80, 70,
  45, 35, 55,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '60+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on edX and cs50.harvard.edu, certificate optional',
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
  'course_nand2tetris', 'COURSE', 'VIDEO_COURSE',
  'Nand to Tetris', 'Building a Modern Computer From First Principles', 'Build a complete computer from NAND gates through CPU, assembler, compiler, and operating system. Unparalleled for understanding full computing stack. Available on Coursera as two parts.',
  'Noam Nisan and Shimon Schocken', 'Hebrew University and IDC Herzliya professors', 'Coursera', 2015,
  NULL, 'https://www.nand2tetris.org/',
  true, 12, 2400,
  'COMP', ARRAY['ENG'], ARRAY['computer-architecture', 'compilers', 'operating-systems', 'hardware'], ARRAY['computer-science', 'computer-engineering'],
  'Acclaimed CS education course', 'UNIVERSITY_READING_LIST', 'Deep understanding of computing fundamentals', 95,
  75, 80, 80,
  50, 35, 65,
  ARRAY['Basic programming'], ARRAY['Y12', 'Y13'],
  '40+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on nand2tetris.org and Coursera',
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
  'course_missing_semester', 'COURSE', 'VIDEO_COURSE',
  'The Missing Semester of Your CS Education', NULL, 'MIT course covering practical developer tools: shell, version control, debugging, security. Fills gaps between academic CS and real-world development skills. Highly practical.',
  'MIT CSAIL', 'MIT Computer Science and AI Lab', 'MIT', 2020,
  NULL, 'https://missing.csail.mit.edu/',
  true, 11, 720,
  'COMP', '{}', ARRAY['developer-tools', 'shell', 'git', 'debugging', 'command-line'], ARRAY['computer-science', 'software-engineering'],
  'MIT CSAIL', 'UNIVERSITY_READING_LIST', 'Practical skills valued by industry', 90,
  50, 55, 60,
  45, 30, 50,
  ARRAY['Basic programming'], ARRAY['Y11', 'Y12', 'Y13'],
  '12 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Completely free, lecture videos and notes online',
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
  'competition_boi', 'COMPETITION', 'INTERACTIVE',
  'British Informatics Olympiad', NULL, 'National programming competition testing algorithmic problem-solving. Three-hour paper with increasingly difficult problems. Top performers invited to training camp and potential selection for International Olympiad.',
  'UK Bebras / University of Oxford', 'Official UK informatics olympiad', 'British Informatics Olympiad', 1997,
  NULL, 'https://www.olympiad.org.uk/',
  true, 4, 1200,
  'COMP', ARRAY['STEM_PHYS'], ARRAY['competitive-programming', 'algorithms', 'olympiad'], ARRAY['computer-science'],
  'Official UK olympiad', 'PROFESSIONAL_BODY', 'Medals/certificates highly valued by top universities', 98,
  85, 60, 85,
  40, 40, 55,
  ARRAY['Strong programming skills', 'Algorithms knowledge'], ARRAY['Y11', 'Y12', 'Y13'],
  '20+ hours preparation', 'DEADLINE', 'December', true,
  true, NULL, 'Enter via school, Round 1 in December',
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
  'competition_bebras', 'COMPETITION', 'INTERACTIVE',
  'UK Bebras Computational Thinking Challenge', NULL, 'Accessible computational thinking competition for all ages. Multiple choice questions testing logical reasoning without requiring programming. Gateway to BIO for interested students.',
  'Bebras UK', 'International Bebras organisation, UK chapter at Oxford', 'University of Oxford', 2004,
  NULL, 'https://www.bebras.uk/',
  true, 3, 180,
  'COMP', ARRAY['STEM_PHYS'], ARRAY['computational-thinking', 'logic', 'problem-solving'], ARRAY['computer-science', 'computing'],
  'International computational thinking initiative', 'PROFESSIONAL_BODY', 'First step into CS competitions', 85,
  50, 25, 30,
  40, 35, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '45 mins (competition) + practice', 'DEADLINE', 'November', true,
  true, NULL, 'Enter via school in November',
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
  'video_computerphile', 'VIDEO', 'YOUTUBE',
  'Computerphile', NULL, 'YouTube channel featuring CS academics explaining algorithms, security, AI, and computing history. Accessible introductions to university-level topics. Regular uploads covering breadth of CS.',
  'Brady Haran / University of Nottingham', 'Produced by science communicator Brady Haran with CS academics', 'YouTube', 2013,
  NULL, 'https://www.youtube.com/@Computerphile',
  true, 20, 600,
  'COMP', '{}', ARRAY['cs-education', 'algorithms', 'security', 'ai', 'programming'], ARRAY['computer-science', 'software-engineering', 'cyber-security'],
  'University academics', 'ESTABLISHED_MEDIA', 'Broad CS awareness beyond syllabus', 88,
  55, 40, 50,
  45, 35, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '10-15 mins per video', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube, 800+ videos',
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
  'podcast_lex_fridman', 'PODCAST', 'PODCAST_AUDIO',
  'Lex Fridman Podcast', NULL, 'Long-form interviews with AI researchers, computer scientists, and technologists. Features guests like Yann LeCun, Donald Knuth, and Guido van Rossum. Deep dives into technical and philosophical aspects of computing.',
  'Lex Fridman', 'MIT AI researcher', 'Independent', 2018,
  NULL, 'https://lexfridman.com/podcast/',
  true, 15, 1800,
  'COMP', ARRAY['STEM_PHYS'], ARRAY['artificial-intelligence', 'machine-learning', 'tech-interviews', 'computer-science'], ARRAY['computer-science', 'artificial-intelligence', 'data-science'],
  'Features leading CS researchers', 'ESTABLISHED_MEDIA', 'Awareness of cutting-edge research and researchers', 82,
  65, 70, 55,
  55, 50, 40,
  '{}', ARRAY['Y12', 'Y13'],
  '2-3 hours per episode', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on all podcast platforms and YouTube',
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
  'work_experience_open_source', 'WORK_EXPERIENCE', 'MIXED',
  'Open Source Contribution', NULL, 'Contributing to open source projects demonstrates real-world development skills: version control, code review, collaboration. Start with ''good first issue'' labels. GitHub profile serves as portfolio.',
  NULL, NULL, 'GitHub', NULL,
  NULL, 'https://github.com/topics/good-first-issue',
  false, NULL, 1200,
  'COMP', '{}', ARRAY['open-source', 'git', 'collaboration', 'real-world-development'], ARRAY['computer-science', 'software-engineering'],
  'Industry standard practice', 'INDUSTRY_STANDARD', 'Merged PRs demonstrate real coding ability', 92,
  55, 60, 70,
  45, 65, 80,
  ARRAY['Programming proficiency', 'Git basics'], ARRAY['Y12', 'Y13'],
  '20+ hours', 'ONGOING', NULL, true,
  true, NULL, 'Start with beginner-friendly projects',
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
  'epq_software_project', 'EPQ_IDEA', 'MIXED',
  'EPQ: Building a Full-Stack Application', NULL, 'Extended project developing a complete software application solving a real problem. Document requirements, design decisions, implementation challenges, and testing. Demonstrates software engineering process.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'COMP', '{}', ARRAY['epq', 'software-development', 'full-stack', 'project-management'], ARRAY['computer-science', 'software-engineering'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus demonstrable technical project', 88,
  70, 85, 75,
  55, 65, 85,
  ARRAY['Programming proficiency'], ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
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
  'volunteering_code_club', 'VOLUNTEERING', 'IN_PERSON',
  'Code Club Volunteer', NULL, 'Volunteer teaching coding to children aged 9-13 at local Code Clubs. Develops communication skills, reinforces fundamentals, and demonstrates commitment to CS education. Run by Raspberry Pi Foundation.',
  'Raspberry Pi Foundation', 'UK educational charity', 'Raspberry Pi Foundation', 2012,
  NULL, 'https://codeclub.org/en/volunteer',
  false, NULL, 1200,
  'COMP', ARRAY['EDU'], ARRAY['volunteering', 'teaching', 'coding-education', 'youth-work'], ARRAY['computer-science', 'education'],
  'Raspberry Pi Foundation', 'PROFESSIONAL_BODY', 'Shows communication skills and commitment to CS', 88,
  35, 50, 40,
  55, 45, 50,
  ARRAY['Basic programming'], ARRAY['Y11', 'Y12', 'Y13'],
  '1-2 hours/week ongoing', 'ONGOING', NULL, true,
  true, NULL, 'Find local clubs at codeclub.org, DBS check required',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_code', 'CAH11', NULL, NULL, 92, true, 'Foundational computer architecture understanding');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_clean_code', 'CAH11', NULL, NULL, 88, true, 'Software engineering best practices');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_grokking_algorithms', 'CAH11', NULL, NULL, 90, true, 'Core algorithms and data structures');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_designing_data', 'CAH11', NULL, NULL, 85, true, 'Advanced systems design');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_designing_data', NULL, 'data-science', NULL, 80, false, 'Data engineering foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_hackers_painters', 'CAH11', NULL, NULL, 78, true, 'Programming culture and philosophy');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_cs50', 'CAH11', NULL, NULL, 98, true, 'Gold standard intro CS course');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_nand2tetris', 'CAH11', NULL, NULL, 95, true, 'Complete computing stack understanding');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_nand2tetris', NULL, 'computer-engineering', NULL, 85, false, 'Hardware-software interface');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_missing_semester', 'CAH11', NULL, NULL, 88, true, 'Practical developer tools');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_boi', 'CAH11', NULL, NULL, 98, true, 'National programming olympiad');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_bebras', 'CAH11', NULL, NULL, 85, true, 'Computational thinking competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_computerphile', 'CAH11', NULL, NULL, 85, true, 'Broad CS topic coverage');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_lex_fridman', 'CAH11', NULL, NULL, 80, true, 'AI and CS research interviews');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_open_source', 'CAH11', NULL, NULL, 92, true, 'Real-world development experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_software_project', 'CAH11', NULL, NULL, 90, true, 'Independent software development');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_code_club', 'CAH11', NULL, NULL, 82, true, 'CS education volunteering');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_code_club', NULL, 'education', NULL, 75, false, 'Teaching experience');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_code', 'examrizz_arena', '{"DEPTH":5,"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{"TOLERANCE":40}'::JSONB, 320, 5, true, '{"notes":"For students wanting deep understanding of how computers work"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_clean_code', 'examrizz_arena', '{"PRECISION":5,"STRUCTURE":3}'::JSONB, '{"TOLERANCE":45}'::JSONB, 350, 10, false, '{"notes":"For students with programming experience ready for professional practices"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_grokking_algorithms', 'examrizz_arena', '{"PRECISION":4,"RETRIEVAL":3,"STRUCTURE":4}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 6, true, '{"notes":"Accessible algorithms introduction, good for visual learners"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_designing_data', 'examrizz_arena', '{"DEPTH":5,"TRANSFER":4,"TOLERANCE":4}'::JSONB, '{"DEPTH":45,"TOLERANCE":55}'::JSONB, 450, 18, false, '{"notes":"Advanced - for highly committed Y13 students only"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_hackers_painters', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{}'::JSONB, 200, 15, false, '{"notes":"Thought-provoking essays, good for broader perspective"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_cs50', 'examrizz_arena', '{"PRECISION":4,"TOLERANCE":5,"CONSISTENCY":5}'::JSONB, '{"TOLERANCE":45,"CONSISTENCY":40}'::JSONB, 500, 1, true, '{"notes":"Gold standard - recommend to all serious CS applicants"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_nand2tetris', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"TOLERANCE":5}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 450, 4, true, '{"notes":"For students wanting complete understanding of computing stack"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_missing_semester', 'examrizz_arena', '{"PRECISION":4,"STRUCTURE":3}'::JSONB, '{}'::JSONB, 250, 12, false, '{"notes":"Practical skills, good complement to academic courses"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_boi', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"PRECISION":45,"TOLERANCE":50}'::JSONB, 400, 2, true, '{"notes":"For strong programmers targeting top universities"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_bebras', 'examrizz_arena', '{"TRANSFER":3,"PRECISION":3}'::JSONB, '{}'::JSONB, 100, 8, false, '{"notes":"Good starting point for CS competitions, accessible"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_computerphile', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 120, 14, false, '{"notes":"Easy entry point for broadening CS awareness"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_lex_fridman', 'examrizz_arena', '{"DEPTH":3,"TRANSFER":3,"TOLERANCE":3}'::JSONB, '{"TOLERANCE":40}'::JSONB, 180, 16, false, '{"notes":"Long-form content for students interested in AI research"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_open_source', 'examrizz_arena', '{"SOCIAL":4,"PRECISION":4,"TOLERANCE":5}'::JSONB, '{"TOLERANCE":50}'::JSONB, 400, 3, true, '{"notes":"Demonstrates real-world coding ability, highly valued"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_software_project', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":5,"CONSISTENCY":4}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":45}'::JSONB, 500, 7, true, '{"notes":"For committed students wanting substantial project"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_code_club', 'examrizz_arena', '{"SOCIAL":5,"RECEPTIVITY":3}'::JSONB, '{"SOCIAL":35}'::JSONB, 300, 9, false, '{"notes":"Good for students who enjoy teaching and communication"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'COMP' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: HUM CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:33.084Z
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
  'competition_olympiad_classics', 'COMPETITION', 'MIXED',
  'Classics Olympiad (ACO/GCSE Latin/Greek Translation Competition)', NULL, 'Translation and comprehension competitions for Latin and Greek students. Tests language skills and cultural understanding. Winners recognised by universities.',
  'Association for Latin Teaching / Classics organisations', 'UK Classics teaching associations', 'Various', NULL,
  NULL, NULL,
  false, NULL, 600,
  'HUM', '{}', ARRAY['classics', 'latin', 'greek', 'translation', 'competition'], ARRAY['classics'],
  'UK Classics teaching community', 'PROFESSIONAL_BODY', 'Achievement in national language competition', 82,
  65, 45, 70,
  65, 50, 45,
  ARRAY['GCSE Latin or Greek'], ARRAY['Y11', 'Y12', 'Y13'],
  '10+ hours preparation', 'DEADLINE', 'March', true,
  true, NULL, 'Enter via school Classics department',
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
  'book_how_to_read', 'BOOK', 'PHYSICAL_BOOK',
  'How to Read Literature Like a Professor', 'A Lively and Entertaining Guide to Reading Between the Lines', 'Thomas Foster reveals the patterns, symbols, and conventions underlying literary texts. Invaluable for developing critical reading skills and articulating literary analysis in essays and interviews.',
  'Thomas C. Foster', 'University of Michigan-Flint Professor of English', 'Harper Perennial', 2003,
  '978-0062301673', NULL,
  true, 12, 420,
  'HUM', '{}', ARRAY['literary-criticism', 'close-reading', 'symbolism', 'english-literature'], ARRAY['english', 'literature', 'creative-writing'],
  'Widely used in schools and universities', 'ESTABLISHED_MEDIA', 'Develops vocabulary for literary analysis', 88,
  50, 45, 30,
  55, 55, 35,
  ARRAY['GCSE English Literature'], ARRAY['Y11', 'Y12', 'Y13'],
  '7-8 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Revised edition available',
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
  'book_penguin_classics', 'BOOK', 'PHYSICAL_BOOK',
  'The Odyssey', NULL, 'Homer''s foundational epic of Odysseus''s journey home. Emily Wilson''s 2017 translation is acclaimed for accessibility and fidelity. Essential for Classics applicants but valuable for all humanities students.',
  'Homer (trans. Emily Wilson)', 'Emily Wilson is Professor of Classical Studies at University of Pennsylvania, first woman to translate Odyssey into English', 'W. W. Norton', 2017,
  '978-0393356250', NULL,
  true, 24, 900,
  'HUM', '{}', ARRAY['classics', 'greek-literature', 'epic-poetry', 'translation'], ARRAY['classics', 'english', 'ancient-history'],
  'Oxford and Cambridge Classics reading lists', 'UNIVERSITY_READING_LIST', 'Foundational classical text, Wilson translation highly praised', 95,
  55, 70, 35,
  60, 50, 45,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '15-18 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Wilson translation highly recommended',
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
  'book_the_essay', 'BOOK', 'PHYSICAL_BOOK',
  'The Art of the Personal Essay', 'An Anthology from the Classical Era to the Present', 'Phillip Lopate''s comprehensive anthology spanning Seneca to modern essayists. Demonstrates the essay form''s range and develops understanding of voice, argument, and style essential for humanities writing.',
  'Phillip Lopate (editor)', 'Professor at Columbia University School of the Arts, essayist', 'Anchor Books', 1994,
  '978-0385423397', NULL,
  true, 15, 1200,
  'HUM', '{}', ARRAY['essay-writing', 'anthology', 'creative-nonfiction', 'rhetoric'], ARRAY['english', 'creative-writing'],
  'Standard creative nonfiction anthology', 'UNIVERSITY_READING_LIST', 'Develops essay-writing voice and style awareness', 85,
  55, 75, 30,
  70, 60, 50,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '20+ hours (selective reading)', 'FLEXIBLE', NULL, false,
  false, 16.99, 'Large anthology - selective reading recommended',
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
  'book_ways_seeing', 'BOOK', 'PHYSICAL_BOOK',
  'Ways of Seeing', NULL, 'John Berger''s influential analysis of how we perceive art and images. Examines reproduction, advertising, gender, and ownership in visual culture. Essential for art history and cultural studies.',
  'John Berger', 'Art critic, novelist, Booker Prize winner', 'Penguin', 1972,
  '978-0140135152', NULL,
  true, 7, 240,
  'HUM', ARRAY['SOC'], ARRAY['art-criticism', 'visual-culture', 'media-studies', 'cultural-theory'], ARRAY['art-history', 'history-of-art', 'media', 'english'],
  'Cambridge History of Art reading list', 'UNIVERSITY_READING_LIST', 'Foundational visual culture text', 92,
  65, 35, 40,
  60, 65, 45,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '4-5 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Short, image-heavy, highly accessible',
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
  'book_ancient_world', 'BOOK', 'PHYSICAL_BOOK',
  'SPQR', 'A History of Ancient Rome', 'Mary Beard''s engaging history of Rome from founding to citizenship edict. Combines scholarly rigour with accessible prose. Demonstrates how to write popular history while maintaining academic standards.',
  'Mary Beard', 'Cambridge Professor of Classics, TV presenter, Dame', 'Profile Books', 2015,
  '978-1846683817', NULL,
  true, 12, 900,
  'HUM', ARRAY['SOC'], ARRAY['ancient-rome', 'classics', 'ancient-history', 'social-history'], ARRAY['classics', 'ancient-history', 'history'],
  'Cambridge and Oxford Classics/Ancient History lists', 'UNIVERSITY_READING_LIST', 'Frequently cited in successful Classics applications', 95,
  55, 70, 40,
  55, 45, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '15-18 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Widely available',
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
  'course_modern_poetry', 'COURSE', 'VIDEO_COURSE',
  'ModPo: Modern & Contemporary American Poetry', NULL, 'University of Pennsylvania''s acclaimed course on experimental poetry from Dickinson to present. Develops close reading skills and critical vocabulary. Vibrant community discussion forums.',
  'Al Filreis', 'University of Pennsylvania Kelly Professor of English', 'Coursera', 2012,
  NULL, 'https://www.coursera.org/learn/modpo',
  true, 10, 1800,
  'HUM', '{}', ARRAY['poetry', 'american-literature', 'close-reading', 'modernism'], ARRAY['english', 'literature', 'creative-writing'],
  'University of Pennsylvania', 'UNIVERSITY_READING_LIST', 'Develops sophisticated poetic analysis', 90,
  70, 75, 35,
  75, 75, 55,
  ARRAY['Interest in poetry'], ARRAY['Y12', 'Y13'],
  '30+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'course_greek_hero', 'COURSE', 'VIDEO_COURSE',
  'The Ancient Greek Hero', NULL, 'Harvard course examining heroism through Homer, Sophocles, and Plato. Close reading of ancient texts in translation with focus on cultural context. Excellent Classics preparation.',
  'Gregory Nagy', 'Harvard Professor of Classical Greek Literature', 'edX', 2013,
  NULL, 'https://www.edx.org/learn/literature/harvard-university-the-ancient-greek-hero',
  true, 12, 1500,
  'HUM', '{}', ARRAY['greek-literature', 'classics', 'homer', 'tragedy'], ARRAY['classics', 'ancient-history'],
  'Harvard University', 'UNIVERSITY_READING_LIST', 'Demonstrates engagement with classical literature', 92,
  65, 70, 40,
  65, 60, 55,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '25+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on edX',
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
  'course_music_theory', 'COURSE', 'VIDEO_COURSE',
  'Fundamentals of Music Theory', NULL, 'University of Edinburgh course covering notation, scales, chords, and basic analysis. Essential foundation for Music applicants. Includes practical exercises and assessments.',
  'University of Edinburgh', 'Edinburgh Reid School of Music faculty', 'Coursera', 2014,
  NULL, 'https://www.coursera.org/learn/edinburgh-music-theory',
  true, 8, 900,
  'HUM', '{}', ARRAY['music-theory', 'harmony', 'notation', 'analysis'], ARRAY['music'],
  'University of Edinburgh', 'UNIVERSITY_READING_LIST', 'Demonstrates theoretical foundation for music study', 88,
  55, 60, 55,
  45, 35, 50,
  ARRAY['Basic music reading helpful'], ARRAY['Y11', 'Y12', 'Y13'],
  '15+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'competition_tower_poetry', 'COMPETITION', 'MIXED',
  'Tower Poetry Competition', NULL, 'Christopher Tower Poetry Prize for 16-18 year olds. One of UK''s most prestigious young poets'' competitions. Judged by established poets, winners published and receive substantial cash prize.',
  'Christ Church, Oxford', 'Oxford University college', 'Christ Church, Oxford', 2000,
  NULL, 'https://www.towerpoetry.org.uk/prize/',
  false, NULL, 300,
  'HUM', '{}', ARRAY['poetry', 'creative-writing', 'competition'], ARRAY['english', 'creative-writing'],
  'Christ Church, Oxford', 'UNIVERSITY_READING_LIST', 'Prestigious poetry prize, direct Oxford connection', 95,
  75, 35, 40,
  85, 80, 75,
  '{}', ARRAY['Y12', 'Y13'],
  '5-10 hours', 'DEADLINE', 'February', true,
  true, NULL, 'Annual competition, theme announced each year',
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
  'podcast_in_our_time', 'PODCAST', 'PODCAST_AUDIO',
  'In Our Time', NULL, 'Melvyn Bragg''s BBC Radio 4 discussion programme covering philosophy, history, science, and culture. Expert academic panels explore topics in depth. Extensive archive spanning 25+ years.',
  'Melvyn Bragg', 'Broadcaster, author, Life Peer', 'BBC Radio 4', 1998,
  NULL, 'https://www.bbc.co.uk/programmes/b006qykl',
  true, 25, 750,
  'HUM', ARRAY['SOC', 'STEM_PHYS'], ARRAY['history', 'philosophy', 'culture', 'ideas', 'academia'], ARRAY['history', 'philosophy', 'english', 'classics'],
  'BBC', 'ESTABLISHED_MEDIA', 'Breadth of intellectual engagement', 95,
  65, 45, 40,
  65, 55, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '45 mins per episode', 'ONGOING', NULL, true,
  true, NULL, 'Free on BBC Sounds, 900+ episodes archived',
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
  'video_ntlive', 'VIDEO', 'VIDEO_COURSE',
  'National Theatre Collection / NT Live', NULL, 'Filmed productions of major National Theatre shows. Essential for Drama applicants to see professional productions. Available through schools and streaming services.',
  'National Theatre', 'UK''s leading theatre company', 'National Theatre', 2009,
  NULL, 'https://www.ntathome.com/',
  true, 10, 1500,
  'HUM', '{}', ARRAY['theatre', 'drama', 'performance', 'production'], ARRAY['drama', 'theatre'],
  'National Theatre', 'PROFESSIONAL_BODY', 'Demonstrates engagement with professional theatre', 92,
  50, 55, 30,
  55, 55, 40,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '2-3 hours per production', 'FLEXIBLE', NULL, false,
  false, 9.99, 'Subscription service, some free through schools/libraries',
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
  'volunteering_museum', 'VOLUNTEERING', 'IN_PERSON',
  'Museum or Heritage Site Volunteering', NULL, 'Volunteer at local museums, galleries, or heritage sites. Develops understanding of curation, public engagement, and cultural preservation. National Trust, English Heritage, and local museums offer programmes.',
  'Various', 'National Trust, English Heritage, local museums', NULL, NULL,
  NULL, NULL,
  false, NULL, 1800,
  'HUM', ARRAY['SOC'], ARRAY['volunteering', 'museums', 'heritage', 'curation'], ARRAY['history', 'art-history', 'classics', 'archaeology'],
  'Heritage sector', 'PROFESSIONAL_BODY', 'Direct engagement with cultural sector', 85,
  40, 60, 25,
  50, 45, 55,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '4+ hours/week ongoing', 'ONGOING', NULL, true,
  true, NULL, 'Contact local museums, National Trust, English Heritage',
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
  'work_experience_theatre', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Theatre Technical/Production Work Experience', NULL, 'Work experience in theatre production - lighting, sound, stage management, costume. Many regional theatres offer schemes. Essential for understanding theatre beyond performance.',
  'Various theatres', 'Regional and national theatres', NULL, NULL,
  NULL, NULL,
  false, NULL, 2400,
  'HUM', '{}', ARRAY['theatre', 'production', 'technical-theatre', 'work-experience'], ARRAY['drama', 'theatre', 'technical-theatre'],
  'Theatre industry', 'INDUSTRY_STANDARD', 'Professional theatre experience', 88,
  45, 65, 50,
  45, 55, 60,
  '{}', ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Contact regional theatres directly, competition for places',
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
  'epq_humanities_research', 'EPQ_IDEA', 'MIXED',
  'EPQ: Original Humanities Research Project', NULL, 'Extended project on humanities topic: literary analysis, historical investigation, artistic movement study, or cultural comparison. Demonstrates independent research and academic writing skills.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'HUM', ARRAY['SOC'], ARRAY['epq', 'independent-research', 'humanities', 'dissertation'], ARRAY['english', 'history', 'classics', 'art-history'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus evidence of sustained academic research', 88,
  70, 85, 45,
  75, 75, 85,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_olympiad_classics', NULL, 'classics', NULL, 95, true, 'Classics competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_how_to_read', 'CAH14', NULL, NULL, 90, true, 'Literary analysis skills');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_how_to_read', NULL, 'english', NULL, 92, false, 'Core English Literature skills');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_penguin_classics', 'CAH14', NULL, NULL, 95, true, 'Foundational classical text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_penguin_classics', NULL, 'classics', NULL, 98, false, 'Essential Classics reading');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_the_essay', 'CAH14', NULL, NULL, 85, true, 'Essay writing development');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ways_seeing', 'CAH21', NULL, NULL, 92, true, 'Visual culture analysis');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ways_seeing', NULL, 'art-history', NULL, 95, false, 'Foundational art criticism');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ancient_world', 'CAH20', NULL, NULL, 95, true, 'Roman history');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_ancient_world', NULL, 'classics', NULL, 92, false, 'Ancient world context');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_modern_poetry', 'CAH14', NULL, NULL, 88, true, 'Poetry analysis');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_greek_hero', 'CAH14', NULL, NULL, 92, true, 'Classical literature');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_music_theory', 'CAH21', NULL, NULL, 95, true, 'Music theory foundation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_tower_poetry', 'CAH14', NULL, NULL, 90, true, 'Creative writing competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_in_our_time', 'CAH20', NULL, NULL, 85, true, 'Intellectual breadth');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_ntlive', 'CAH21', NULL, NULL, 95, true, 'Theatre performance');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_museum', 'CAH20', NULL, NULL, 82, true, 'Heritage sector experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_theatre', 'CAH21', NULL, NULL, 90, true, 'Theatre industry experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_humanities_research', 'CAH14', NULL, NULL, 88, true, 'Independent humanities research');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_olympiad_classics', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5}'::JSONB, '{"TOLERANCE":45}'::JSONB, 350, 7, false, '{"notes":"For Latin/Greek students"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_how_to_read', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{}'::JSONB, 250, 5, true, '{"notes":"Essential for developing literary analysis vocabulary"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_penguin_classics', 'examrizz_arena', '{"DEPTH":4,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":40}'::JSONB, 350, 3, true, '{"notes":"Core Classics text, Wilson translation recommended"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_the_essay', 'examrizz_arena', '{"DEPTH":4,"TRANSFER":3}'::JSONB, '{"TOLERANCE":45}'::JSONB, 350, 12, false, '{"notes":"For students developing essay voice"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_ways_seeing', 'examrizz_arena', '{"TRANSFER":5,"CALIBRATION":4}'::JSONB, '{}'::JSONB, 200, 6, true, '{"notes":"Short, accessible, highly influential"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_ancient_world', 'examrizz_arena', '{"DEPTH":4,"TOLERANCE":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 320, 4, true, '{"notes":"Essential Classics/Ancient History reading"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_modern_poetry', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":45}'::JSONB, 400, 10, false, '{"notes":"For committed poetry enthusiasts"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_greek_hero', 'examrizz_arena', '{"DEPTH":4,"CONSISTENCY":3}'::JSONB, '{"TOLERANCE":40}'::JSONB, 380, 8, true, '{"notes":"Excellent Classics preparation"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_music_theory', 'examrizz_arena', '{"PRECISION":4,"STRUCTURE":4}'::JSONB, '{"STRUCTURE":35}'::JSONB, 300, 9, false, '{"notes":"Essential for Music applicants"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_tower_poetry', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":4}'::JSONB, '{"DEPTH":45}'::JSONB, 380, 2, true, '{"notes":"Prestigious Oxford poetry prize"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_in_our_time', 'examrizz_arena', '{"TRANSFER":4,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 150, 14, false, '{"notes":"Accessible intellectual breadth"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_ntlive', 'examrizz_arena', '{"DEPTH":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 200, 11, false, '{"notes":"Essential for Drama applicants"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_museum', 'examrizz_arena', '{"SOCIAL":4,"TRANSFER":3}'::JSONB, '{"SOCIAL":35}'::JSONB, 350, 13, false, '{"notes":"Heritage sector experience"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_theatre', 'examrizz_arena', '{"SOCIAL":4,"CALIBRATION":4}'::JSONB, '{"SOCIAL":40}'::JSONB, 400, 6, true, '{"notes":"Essential for Drama/Theatre applicants"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_humanities_research', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":5,"CONSISTENCY":4}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 1, true, '{"notes":"Major independent project"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'HUM' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: BUS CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:33.597Z
-- Sources: claude-3.5
-- Items: 14
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
  'book_intelligent_investor', 'BOOK', 'PHYSICAL_BOOK',
  'The Intelligent Investor', 'The Definitive Book on Value Investing', 'Benjamin Graham''s classic on value investing. Warren Buffett calls it ''the best book on investing ever written''. Essential for finance-focused business applicants.',
  'Benjamin Graham', 'Father of value investing, Columbia professor, Warren Buffett''s mentor', 'Harper Business', 1949,
  '978-0060555665', NULL,
  true, 12, 1200,
  'BUS', '{}', ARRAY['investing', 'finance', 'value-investing', 'markets'], ARRAY['finance', 'business', 'accounting'],
  'Finance industry standard', 'INDUSTRY_STANDARD', 'Classic investment text', 95,
  65, 80, 60,
  55, 50, 55,
  ARRAY['Basic maths'], ARRAY['Y12', 'Y13'],
  '20+ hours', 'FLEXIBLE', NULL, false,
  false, 16.99, 'Revised edition with Jason Zweig commentary recommended',
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
  'competition_essay_economics', 'COMPETITION', 'MIXED',
  'Marshall Society Essay Competition', NULL, 'Cambridge economics society essay competition for sixth formers. Engaging with economic arguments at university level. Winners invited to Cambridge, published on website.',
  'Cambridge Marshall Society', 'Cambridge University economics society', 'University of Cambridge', NULL,
  NULL, NULL,
  false, NULL, 600,
  'BUS', ARRAY['SOC'], ARRAY['economics', 'essay-writing', 'competition'], ARRAY['economics', 'business'],
  'Cambridge University', 'UNIVERSITY_READING_LIST', 'Direct Cambridge engagement', 92,
  75, 50, 55,
  70, 70, 70,
  ARRAY['A-level Economics or equivalent'], ARRAY['Y12', 'Y13'],
  '10+ hours', 'DEADLINE', 'January', true,
  true, NULL, 'Check Marshall Society website for current year details',
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
  'volunteering_charity', 'VOLUNTEERING', 'IN_PERSON',
  'Charity Trustee / Treasurer Role', NULL, 'Young trustees programmes at charities provide governance experience. Some charities specifically recruit young people. Develops understanding of non-profit management and fiduciary responsibility.',
  'Various charities', 'Charity sector', NULL, NULL,
  NULL, NULL,
  false, NULL, 1200,
  'BUS', ARRAY['SOC'], ARRAY['governance', 'non-profit', 'leadership', 'finance'], ARRAY['business', 'management'],
  'Charity sector', 'PROFESSIONAL_BODY', 'Leadership and governance experience', 85,
  55, 50, 45,
  55, 60, 65,
  '{}', ARRAY['Y12', 'Y13'],
  'Ongoing commitment', 'ONGOING', NULL, true,
  true, NULL, 'Search young trustees programmes, local charities',
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
  'epq_business_case', 'EPQ_IDEA', 'MIXED',
  'EPQ: Business Case Study Analysis', NULL, 'Extended project analysing a real company''s strategy, market position, or transformation. Apply business frameworks (Porter''s Five Forces, SWOT) to real-world context. Can include financial analysis.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'BUS', '{}', ARRAY['epq', 'case-study', 'strategy', 'business-analysis'], ARRAY['business', 'management'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus analytical business project', 88,
  65, 85, 55,
  65, 65, 85,
  ARRAY['GCSE Maths'], ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
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
  'book_lean_startup', 'BOOK', 'PHYSICAL_BOOK',
  'The Lean Startup', 'How Constant Innovation Creates Radically Successful Businesses', 'Eric Ries introduces lean methodology for building startups: validated learning, MVP, and pivoting. Foundational for understanding modern entrepreneurship and innovation management.',
  'Eric Ries', 'Entrepreneur, IMVU co-founder', 'Portfolio Penguin', 2011,
  '978-0670921607', NULL,
  true, 10, 480,
  'BUS', ARRAY['COMP'], ARRAY['entrepreneurship', 'startups', 'innovation', 'lean-methodology'], ARRAY['business', 'management', 'entrepreneurship'],
  'Business school reading lists worldwide', 'UNIVERSITY_READING_LIST', 'Standard entrepreneurship text', 90,
  50, 50, 35,
  45, 45, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
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
  'book_zero_to_one', 'BOOK', 'PHYSICAL_BOOK',
  'Zero to One', 'Notes on Startups, or How to Build the Future', 'Peter Thiel''s contrarian thinking on startups and monopoly. Argues for creating new things rather than copying. Provocative framework for thinking about business and innovation.',
  'Peter Thiel with Blake Masters', 'PayPal co-founder, Palantir co-founder, venture capitalist', 'Virgin Books', 2014,
  '978-0753555200', NULL,
  true, 14, 360,
  'BUS', ARRAY['COMP'], ARRAY['startups', 'entrepreneurship', 'innovation', 'venture-capital'], ARRAY['business', 'management', 'entrepreneurship'],
  'Silicon Valley standard reading', 'INDUSTRY_STANDARD', 'Demonstrates strategic thinking about business', 85,
  55, 40, 30,
  50, 55, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '6-7 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available',
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
  'book_good_to_great', 'BOOK', 'PHYSICAL_BOOK',
  'Good to Great', 'Why Some Companies Make the Leap... and Others Don''t', 'Jim Collins'' research into what makes companies outperform. Introduces concepts like Level 5 Leadership, Hedgehog Concept, and Flywheel. Standard business strategy reading.',
  'Jim Collins', 'Stanford business school lecturer, management researcher', 'Random House Business', 2001,
  '978-0712676090', NULL,
  true, 9, 540,
  'BUS', '{}', ARRAY['management', 'leadership', 'strategy', 'corporate-performance'], ARRAY['business', 'management'],
  'Business school classic', 'UNIVERSITY_READING_LIST', 'Demonstrates strategic thinking', 85,
  50, 55, 35,
  50, 45, 40,
  '{}', ARRAY['Y12', 'Y13'],
  '9-10 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Widely available',
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
  'course_financial_markets', 'COURSE', 'VIDEO_COURSE',
  'Financial Markets', NULL, 'Yale''s Robert Shiller (Nobel laureate) on how financial markets work. Covers stocks, bonds, derivatives, behavioural finance. University-level introduction to finance.',
  'Robert Shiller', 'Yale Professor, Nobel Prize in Economics 2013', 'Coursera', 2016,
  NULL, 'https://www.coursera.org/learn/financial-markets-global',
  true, 7, 1500,
  'BUS', ARRAY['SOC'], ARRAY['finance', 'markets', 'investing', 'behavioural-finance'], ARRAY['finance', 'business', 'economics'],
  'Yale University', 'UNIVERSITY_READING_LIST', 'Nobel laureate teaching, prestigious university', 95,
  60, 70, 55,
  55, 45, 50,
  ARRAY['GCSE Maths'], ARRAY['Y12', 'Y13'],
  '25+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'course_marketing', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Marketing', NULL, 'Wharton School introduction to marketing fundamentals: branding, customer centricity, go-to-market strategies. Practical framework for understanding business from customer perspective.',
  'Wharton School', 'University of Pennsylvania Wharton School faculty', 'Coursera', 2014,
  NULL, 'https://www.coursera.org/learn/wharton-marketing',
  true, 4, 600,
  'BUS', '{}', ARRAY['marketing', 'branding', 'customer-centricity', 'strategy'], ARRAY['business', 'marketing', 'management'],
  'Wharton School', 'UNIVERSITY_READING_LIST', 'Wharton credential', 90,
  50, 50, 35,
  50, 45, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '10 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'course_accounting', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Financial Accounting', NULL, 'Wharton course on reading and analysing financial statements. Essential foundation for understanding company performance. Covers income statements, balance sheets, cash flow.',
  'Wharton School', 'University of Pennsylvania Wharton School faculty', 'Coursera', 2014,
  NULL, 'https://www.coursera.org/learn/wharton-accounting',
  true, 4, 720,
  'BUS', '{}', ARRAY['accounting', 'financial-statements', 'finance'], ARRAY['accounting', 'finance', 'business'],
  'Wharton School', 'UNIVERSITY_READING_LIST', 'Essential finance/accounting foundation', 90,
  55, 55, 55,
  50, 35, 50,
  ARRAY['GCSE Maths'], ARRAY['Y12', 'Y13'],
  '12 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'competition_young_enterprise', 'COMPETITION', 'IN_PERSON',
  'Young Enterprise Company Programme', NULL, 'Run a real company for an academic year with fellow students. Develop product, manage finances, pitch to judges. UK''s flagship enterprise education programme with regional and national competitions.',
  'Young Enterprise', 'UK''s leading enterprise education charity', 'Young Enterprise', 1963,
  NULL, 'https://www.young-enterprise.org.uk/programmes/company-programme/',
  false, NULL, 4800,
  'BUS', '{}', ARRAY['entrepreneurship', 'enterprise', 'teamwork', 'business-skills'], ARRAY['business', 'management', 'entrepreneurship'],
  'Young Enterprise UK', 'PROFESSIONAL_BODY', 'Practical business experience, awards highly valued', 95,
  55, 80, 45,
  55, 65, 70,
  '{}', ARRAY['Y12', 'Y13'],
  '80+ hours over year', 'ONGOING', 'September', true,
  false, NULL, 'Through school, registration in autumn term',
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
  'podcast_how_i_built', 'PODCAST', 'PODCAST_AUDIO',
  'How I Built This', NULL, 'Guy Raz interviews founders about building their companies. Covers startups to global brands. Excellent for understanding entrepreneurial journeys and business challenges.',
  'Guy Raz', 'NPR journalist and podcast host', 'NPR', 2016,
  NULL, 'https://www.npr.org/series/490248027/how-i-built-this',
  true, 15, 900,
  'BUS', '{}', ARRAY['entrepreneurship', 'startups', 'founders', 'business-stories'], ARRAY['business', 'entrepreneurship', 'management'],
  'NPR', 'ESTABLISHED_MEDIA', 'Real founder stories and lessons', 85,
  40, 50, 25,
  45, 40, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '1 hour per episode', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on all podcast platforms',
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
  'video_shark_tank', 'VIDEO', 'YOUTUBE',
  'Dragons'' Den / Shark Tank Pitch Analysis', NULL, 'Analysing real business pitches teaches valuation, persuasion, and business model thinking. Many full episodes and clips available. Supplement with academic analysis of what makes pitches succeed.',
  'BBC / ABC', 'Major broadcasters', 'BBC / YouTube', 2005,
  NULL, NULL,
  true, 10, 600,
  'BUS', '{}', ARRAY['pitching', 'entrepreneurship', 'valuation', 'negotiation'], ARRAY['business', 'entrepreneurship'],
  'Popular business media', 'ESTABLISHED_MEDIA', 'Understanding of pitching and valuation', 75,
  45, 40, 40,
  45, 50, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '1 hour per episode', 'FLEXIBLE', NULL, false,
  true, NULL, 'BBC iPlayer, YouTube clips',
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
  'work_experience_business', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Business/Finance Work Experience', NULL, 'Work experience at banks, consulting firms, accountancies, or startups. Insight Programmes at major firms (Goldman Sachs, PwC, Deloitte) specifically target sixth formers from diverse backgrounds.',
  'Various', 'Major employers', NULL, NULL,
  NULL, NULL,
  false, NULL, 2400,
  'BUS', '{}', ARRAY['work-experience', 'finance', 'consulting', 'corporate'], ARRAY['business', 'finance', 'accounting', 'management'],
  'Industry standard', 'INDUSTRY_STANDARD', 'Direct professional experience', 92,
  45, 55, 40,
  50, 55, 60,
  '{}', ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Apply direct to firms, check Insight programmes',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_intelligent_investor', 'CAH17', NULL, NULL, 95, true, 'Finance/investing classic');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_essay_economics', 'CAH17', NULL, NULL, 85, true, 'Economics essay competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_charity', 'CAH17', NULL, NULL, 80, true, 'Governance experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_business_case', 'CAH17', NULL, NULL, 88, true, 'Business analysis project');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_lean_startup', 'CAH17', NULL, NULL, 92, true, 'Entrepreneurship foundation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_zero_to_one', 'CAH17', NULL, NULL, 88, true, 'Startup strategy');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_good_to_great', 'CAH17', NULL, NULL, 88, true, 'Management strategy');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_financial_markets', 'CAH17', NULL, NULL, 95, true, 'Finance foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_marketing', 'CAH17', NULL, NULL, 90, true, 'Marketing foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_accounting', 'CAH17', NULL, NULL, 92, true, 'Accounting foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_young_enterprise', 'CAH17', NULL, NULL, 98, true, 'Flagship enterprise programme');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_how_i_built', 'CAH17', NULL, NULL, 82, true, 'Entrepreneurship stories');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_shark_tank', 'CAH17', NULL, NULL, 75, true, 'Business pitching');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_business', 'CAH17', NULL, NULL, 95, true, 'Professional experience');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_intelligent_investor', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":45}'::JSONB, 400, 6, true, '{"notes":"For finance-focused students"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_essay_economics', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":45}'::JSONB, 380, 3, true, '{"notes":"For strong economics students"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_charity', 'examrizz_arena', '{"SOCIAL":4,"CALIBRATION":3}'::JSONB, '{"SOCIAL":40}'::JSONB, 350, 11, false, '{"notes":"Governance and leadership experience"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_business_case', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"TOLERANCE":5}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 4, true, '{"notes":"Substantial business analysis project"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_lean_startup', 'examrizz_arena', '{"TRANSFER":3,"CALIBRATION":4}'::JSONB, '{}'::JSONB, 280, 4, true, '{"notes":"Essential entrepreneurship text"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_zero_to_one', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{}'::JSONB, 220, 8, false, '{"notes":"Provocative startup thinking"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_good_to_great', 'examrizz_arena', '{"TRANSFER":4,"STRUCTURE":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 300, 9, false, '{"notes":"Management strategy classic"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_financial_markets', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"CONSISTENCY":3}'::JSONB, '{"TOLERANCE":45}'::JSONB, 450, 2, true, '{"notes":"Nobel laureate teaching, excellent finance prep"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_marketing', 'examrizz_arena', '{"TRANSFER":4,"STRUCTURE":3}'::JSONB, '{}'::JSONB, 280, 7, false, '{"notes":"Wharton marketing foundation"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_accounting', 'examrizz_arena', '{"PRECISION":5,"STRUCTURE":4}'::JSONB, '{"PRECISION":35}'::JSONB, 320, 5, true, '{"notes":"Essential for finance/accounting path"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_young_enterprise', 'examrizz_arena', '{"SOCIAL":5,"TOLERANCE":5,"CALIBRATION":4}'::JSONB, '{"SOCIAL":40,"TOLERANCE":40}'::JSONB, 550, 1, true, '{"notes":"Flagship practical business experience"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_how_i_built', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 150, 12, false, '{"notes":"Accessible entrepreneurship stories"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_shark_tank', 'examrizz_arena', '{"TRANSFER":3,"CALIBRATION":2}'::JSONB, '{}'::JSONB, 120, 14, false, '{"notes":"Engaging intro to pitching"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_business', 'examrizz_arena', '{"SOCIAL":4,"CALIBRATION":5}'::JSONB, '{}'::JSONB, 450, 2, true, '{"notes":"Essential professional exposure"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'BUS' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: STEM_LIFE CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:34.099Z
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
  'book_selfish_gene', 'BOOK', 'PHYSICAL_BOOK',
  'The Selfish Gene', NULL, 'Richard Dawkins'' revolutionary explanation of evolution from the gene''s perspective. Introduces memes, extended phenotype concepts. Foundational text for understanding modern evolutionary biology.',
  'Richard Dawkins', 'Oxford evolutionary biologist, former Simonyi Professor for Public Understanding of Science', 'Oxford University Press', 1976,
  '978-0198788607', NULL,
  true, 11, 720,
  'STEM_LIFE', ARRAY['SOC'], ARRAY['evolution', 'genetics', 'natural-selection', 'sociobiology'], ARRAY['biology', 'zoology', 'genetics', 'evolution'],
  'Oxford and Cambridge Biology reading lists', 'UNIVERSITY_READING_LIST', 'Classic evolutionary biology text', 95,
  65, 60, 50,
  60, 50, 45,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '12-15 hours', 'ONE_OFF', NULL, false,
  false, 10.99, '40th anniversary edition recommended',
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
  'book_gene', 'BOOK', 'PHYSICAL_BOOK',
  'The Gene', 'An Intimate History', 'Siddhartha Mukherjee traces genetics from Mendel to CRISPR. Combines science, history, and personal family narrative. Excellent for understanding genetics in medical and social context.',
  'Siddhartha Mukherjee', 'Columbia oncologist, Pulitzer Prize winner for The Emperor of All Maladies', 'Vintage', 2016,
  '978-0099584575', NULL,
  true, 10, 1080,
  'STEM_LIFE', ARRAY['MED'], ARRAY['genetics', 'gene-therapy', 'crispr', 'heredity', 'medical-history'], ARRAY['biology', 'genetics', 'biomedical-science', 'medicine'],
  'University reading lists, Pulitzer Prize winner', 'AWARD_WINNER', 'Demonstrates breadth of genetics understanding', 92,
  60, 75, 50,
  55, 45, 45,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '18-20 hours', 'ONE_OFF', NULL, false,
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
  'epq_biology_research', 'EPQ_IDEA', 'MIXED',
  'EPQ: Biological Research Question', NULL, 'Extended project investigating a biological question through literature review or practical investigation. Topics could include antibiotic resistance, CRISPR ethics, microbiome research, or local ecology survey.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'STEM_LIFE', '{}', ARRAY['epq', 'biological-research', 'independent-study'], ARRAY['biology', 'biochemistry', 'natural-sciences'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus independent research skills', 88,
  70, 85, 60,
  65, 70, 85,
  ARRAY['GCSE Biology'], ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
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
  'book_short_history', 'BOOK', 'PHYSICAL_BOOK',
  'A Short History of Nearly Everything', NULL, 'Bill Bryson''s accessible tour through science from Big Bang to human evolution. Excellent for contextualising biology within broader science. Engaging writing makes complex science approachable.',
  'Bill Bryson', 'Bestselling science writer', 'Black Swan', 2003,
  '978-0552997041', NULL,
  true, 12, 900,
  'STEM_LIFE', ARRAY['STEM_PHYS', 'ENV'], ARRAY['popular-science', 'evolution', 'earth-science', 'physics', 'chemistry'], ARRAY['biology', 'natural-sciences', 'geology'],
  'Bestselling science communication', 'ESTABLISHED_MEDIA', 'Broad scientific literacy', 85,
  50, 65, 35,
  50, 35, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '15+ hours', 'ONE_OFF', NULL, false,
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
  'book_origin_species', 'BOOK', 'PHYSICAL_BOOK',
  'On the Origin of Species', NULL, 'Darwin''s foundational text establishing natural selection. Still remarkably readable. Demonstrates historical scientific argumentation and the building of evidence-based theory.',
  'Charles Darwin', 'Founder of evolutionary theory', 'Penguin Classics', 1859,
  '978-0140439120', NULL,
  true, 14, 1200,
  'STEM_LIFE', ARRAY['HUM'], ARRAY['evolution', 'natural-selection', 'history-of-science', 'darwin'], ARRAY['biology', 'zoology', 'natural-sciences'],
  'Foundational scientific text', 'PEER_REVIEWED', 'Engagement with primary scientific literature', 98,
  60, 80, 45,
  70, 45, 55,
  ARRAY['GCSE Biology'], ARRAY['Y12', 'Y13'],
  '20+ hours', 'ONE_OFF', NULL, false,
  false, 8.99, 'Free on Project Gutenberg, many annotated editions',
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
  'book_power_sex_suicide', 'BOOK', 'PHYSICAL_BOOK',
  'Power, Sex, Suicide', 'Mitochondria and the Meaning of Life', 'Nick Lane explores how mitochondria shaped life''s evolution. Covers energy, ageing, and complexity. Advanced reading for students interested in biochemistry and evolutionary biology.',
  'Nick Lane', 'UCL Professor of Evolutionary Biochemistry, Royal Society Prize winner', 'Oxford University Press', 2005,
  '978-0199205646', NULL,
  true, 10, 840,
  'STEM_LIFE', '{}', ARRAY['biochemistry', 'mitochondria', 'evolution', 'cellular-biology'], ARRAY['biology', 'biochemistry', 'biomedical-science'],
  'Royal Society Prize winner', 'AWARD_WINNER', 'Advanced biochemistry engagement', 90,
  75, 65, 70,
  60, 50, 55,
  ARRAY['A-level Biology', 'A-level Chemistry helpful'], ARRAY['Y12', 'Y13'],
  '14-16 hours', 'ONE_OFF', NULL, false,
  false, 12.99, 'Updated edition available',
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
  'course_intro_biology', 'COURSE', 'VIDEO_COURSE',
  'Introduction to Biology - The Secret of Life', NULL, 'MIT course covering molecular biology, genetics, and biochemistry. University-level introduction from world-leading biology department. Strong foundation for undergraduate study.',
  'Eric Lander', 'MIT Professor, Human Genome Project leader', 'edX', 2014,
  NULL, 'https://www.edx.org/learn/biology/massachusetts-institute-of-technology-introduction-to-biology-the-secret-of-life',
  true, 12, 2400,
  'STEM_LIFE', ARRAY['MED'], ARRAY['molecular-biology', 'genetics', 'biochemistry', 'dna'], ARRAY['biology', 'biochemistry', 'biomedical-science'],
  'MIT', 'UNIVERSITY_READING_LIST', 'University-level biology foundation', 95,
  70, 80, 65,
  55, 40, 55,
  ARRAY['GCSE Biology', 'GCSE Chemistry'], ARRAY['Y12', 'Y13'],
  '40+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on edX',
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
  'course_ecology', 'COURSE', 'VIDEO_COURSE',
  'Ecology: Ecosystem Dynamics and Conservation', NULL, 'American Museum of Natural History course on ecosystem function, biodiversity, and conservation. Field-focused approach with real-world examples. Excellent for ecology and conservation applicants.',
  'American Museum of Natural History', 'Leading natural history institution', 'Coursera', 2017,
  NULL, 'https://www.coursera.org/learn/ecology-conservation',
  true, 6, 720,
  'STEM_LIFE', ARRAY['ENV'], ARRAY['ecology', 'conservation', 'biodiversity', 'ecosystems'], ARRAY['biology', 'ecology', 'zoology', 'environmental-science'],
  'American Museum of Natural History', 'PROFESSIONAL_BODY', 'Conservation science understanding', 88,
  55, 55, 45,
  50, 50, 50,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '12 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'course_neuroscience', 'COURSE', 'VIDEO_COURSE',
  'Understanding the Brain: The Neurobiology of Everyday Life', NULL, 'University of Chicago course on how the brain produces behaviour. Covers perception, memory, emotion, and disorders. Bridges biology and psychology.',
  'Peggy Mason', 'University of Chicago Professor of Neurobiology', 'Coursera', 2014,
  NULL, 'https://www.coursera.org/learn/neurobiology',
  true, 10, 1200,
  'STEM_LIFE', ARRAY['MED', 'SOC'], ARRAY['neuroscience', 'brain', 'neurobiology', 'behaviour'], ARRAY['biology', 'neuroscience', 'psychology', 'biomedical-science'],
  'University of Chicago', 'UNIVERSITY_READING_LIST', 'Neuroscience foundation', 90,
  65, 65, 55,
  55, 45, 50,
  ARRAY['GCSE Biology'], ARRAY['Y11', 'Y12', 'Y13'],
  '20 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'competition_biology_olympiad', 'COMPETITION', 'INTERACTIVE',
  'British Biology Olympiad', NULL, 'National biology competition testing knowledge beyond A-level. Multiple rounds leading to potential selection for International Biology Olympiad. Gold/silver/bronze certificates highly valued.',
  'Royal Society of Biology', 'UK''s professional body for biosciences', 'Royal Society of Biology', 1995,
  NULL, 'https://www.ukbiologycompetitions.org/british-biology-olympiad/',
  true, 4, 1200,
  'STEM_LIFE', '{}', ARRAY['biology-olympiad', 'competition', 'advanced-biology'], ARRAY['biology', 'biomedical-science', 'natural-sciences'],
  'Royal Society of Biology', 'PROFESSIONAL_BODY', 'Medals highly valued by top universities', 98,
  85, 60, 80,
  55, 45, 55,
  ARRAY['A-level Biology'], ARRAY['Y12', 'Y13'],
  '20+ hours preparation', 'DEADLINE', 'January', true,
  true, NULL, 'Enter via school, January/February',
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
  'competition_intermediate_bio', 'COMPETITION', 'INTERACTIVE',
  'Intermediate Biology Olympiad', NULL, 'Biology competition for Year 12 students. More accessible than BBO, tests beyond GCSE. Good stepping stone to British Biology Olympiad.',
  'Royal Society of Biology', 'UK''s professional body for biosciences', 'Royal Society of Biology', 2010,
  NULL, 'https://www.ukbiologycompetitions.org/intermediate-biology-olympiad/',
  true, 3, 600,
  'STEM_LIFE', '{}', ARRAY['biology-olympiad', 'competition'], ARRAY['biology'],
  'Royal Society of Biology', 'PROFESSIONAL_BODY', 'Early competition achievement', 90,
  65, 40, 60,
  50, 40, 45,
  ARRAY['GCSE Biology'], ARRAY['Y12'],
  '10+ hours preparation', 'DEADLINE', 'June', true,
  true, NULL, 'Enter via school',
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
  'podcast_naked_scientists', 'PODCAST', 'PODCAST_AUDIO',
  'The Naked Scientists', NULL, 'Cambridge University science radio show covering biology, medicine, and technology. Interviews with researchers, listener questions answered. Excellent for staying current with science news.',
  'Dr Chris Smith', 'Cambridge virologist and broadcaster', 'BBC / Cambridge University', 2001,
  NULL, 'https://www.thenakedscientists.com/',
  true, 15, 600,
  'STEM_LIFE', ARRAY['MED', 'STEM_PHYS'], ARRAY['science-communication', 'biology', 'medicine', 'research'], ARRAY['biology', 'medicine', 'natural-sciences'],
  'Cambridge University', 'ESTABLISHED_MEDIA', 'Current science awareness', 88,
  50, 40, 45,
  50, 40, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '30-60 mins per episode', 'ONGOING', NULL, true,
  true, NULL, 'Free podcast, extensive archive',
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
  'video_nature', 'VIDEO', 'YOUTUBE',
  'Nature Video', NULL, 'Nature journal''s video channel featuring research highlights and scientist interviews. Accessible explanations of cutting-edge research. Demonstrates awareness of current scientific literature.',
  'Nature', 'Leading scientific journal', 'YouTube / Springer Nature', 2011,
  NULL, 'https://www.youtube.com/@NatureVideoChannel',
  true, 15, 450,
  'STEM_LIFE', ARRAY['STEM_PHYS', 'MED'], ARRAY['research', 'science-communication', 'current-science'], ARRAY['biology', 'biochemistry', 'natural-sciences'],
  'Nature journal', 'PEER_REVIEWED', 'Awareness of current research', 95,
  60, 35, 55,
  55, 45, 35,
  ARRAY['GCSE Science'], ARRAY['Y11', 'Y12', 'Y13'],
  '5-10 mins per video', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free on YouTube',
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
  'volunteering_conservation', 'VOLUNTEERING', 'IN_PERSON',
  'Conservation Volunteering', NULL, 'Volunteer with wildlife trusts, RSPB, or conservation organisations. Practical experience with habitat management, species surveys, or public engagement. Essential for ecology and conservation applicants.',
  'Various', 'Wildlife Trusts, RSPB, local conservation groups', NULL, NULL,
  NULL, NULL,
  false, NULL, 2400,
  'STEM_LIFE', ARRAY['ENV'], ARRAY['conservation', 'ecology', 'volunteering', 'fieldwork'], ARRAY['biology', 'zoology', 'ecology', 'environmental-science'],
  'Conservation sector', 'PROFESSIONAL_BODY', 'Practical field experience', 90,
  40, 60, 35,
  40, 50, 55,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  'Ongoing, flexible', 'ONGOING', NULL, true,
  true, NULL, 'Contact local Wildlife Trust, RSPB, or conservation groups',
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
  'work_experience_lab', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Research Laboratory Work Experience', NULL, 'Work experience in university or industry research labs. Observe research methods, assist with experiments, understand scientific careers. Contact universities directly or use Nuffield Research Placements.',
  'Various', 'Universities and research institutions', NULL, NULL,
  NULL, NULL,
  false, NULL, 2400,
  'STEM_LIFE', ARRAY['STEM_PHYS'], ARRAY['research', 'laboratory', 'work-experience'], ARRAY['biology', 'biochemistry', 'biomedical-science'],
  'Research sector', 'INDUSTRY_STANDARD', 'Research environment exposure', 92,
  55, 55, 60,
  45, 55, 60,
  ARRAY['GCSE Science'], ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Contact university departments, check Nuffield Research Placements',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_selfish_gene', 'CAH03', NULL, NULL, 95, true, 'Foundational evolutionary biology');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_gene', 'CAH03', NULL, NULL, 92, true, 'Genetics history and science');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_biology_research', 'CAH03', NULL, NULL, 88, true, 'Independent biology research');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_short_history', 'CAH03', NULL, NULL, 80, true, 'Broad science context');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_origin_species', 'CAH03', NULL, NULL, 95, true, 'Primary scientific text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_power_sex_suicide', 'CAH03', NULL, NULL, 88, true, 'Advanced biochemistry');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_biology', 'CAH03', NULL, NULL, 98, true, 'MIT biology foundation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_ecology', 'CAH03', NULL, NULL, 90, true, 'Ecology and conservation');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_neuroscience', 'CAH03', NULL, NULL, 88, true, 'Neurobiology');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_biology_olympiad', 'CAH03', NULL, NULL, 98, true, 'National biology competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_intermediate_bio', 'CAH03', NULL, NULL, 90, true, 'Y12 biology competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_naked_scientists', 'CAH03', NULL, NULL, 82, true, 'Science communication');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_nature', 'CAH03', NULL, NULL, 90, true, 'Current research awareness');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_conservation', 'CAH03', NULL, NULL, 88, true, 'Practical ecology experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_lab', 'CAH03', NULL, NULL, 92, true, 'Research experience');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_selfish_gene', 'examrizz_arena', '{"DEPTH":5,"TRANSFER":4}'::JSONB, '{"TOLERANCE":40}'::JSONB, 350, 2, true, '{"notes":"Classic evolutionary biology, essential reading"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_gene', 'examrizz_arena', '{"DEPTH":4,"TOLERANCE":4}'::JSONB, '{"TOLERANCE":45}'::JSONB, 380, 4, true, '{"notes":"Excellent genetics overview"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_biology_research', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":5,"CONSISTENCY":4}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 6, true, '{"notes":"Major independent research project"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_short_history', 'examrizz_arena', '{"TRANSFER":4,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 300, 8, false, '{"notes":"Accessible broad science introduction"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_origin_species', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":5}'::JSONB, '{"DEPTH":40,"TOLERANCE":50}'::JSONB, 400, 6, true, '{"notes":"Primary source engagement"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_power_sex_suicide', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 380, 10, false, '{"notes":"Advanced biochemistry - for committed students"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_intro_biology', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"CONSISTENCY":4}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":40}'::JSONB, 500, 1, true, '{"notes":"MIT-level preparation, highly recommended"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_ecology', 'examrizz_arena', '{"DEPTH":3,"TRANSFER":4}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 9, false, '{"notes":"For ecology/conservation focus"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_neuroscience', 'examrizz_arena', '{"DEPTH":4,"TRANSFER":4}'::JSONB, '{"TOLERANCE":40}'::JSONB, 350, 7, false, '{"notes":"For neuroscience interests"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_biology_olympiad', 'examrizz_arena', '{"DEPTH":5,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"PRECISION":45,"TOLERANCE":50}'::JSONB, 450, 3, true, '{"notes":"Top competition, medals highly valued"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_intermediate_bio', 'examrizz_arena', '{"DEPTH":4,"PRECISION":4}'::JSONB, '{"TOLERANCE":40}'::JSONB, 300, 5, false, '{"notes":"Good stepping stone to BBO"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_naked_scientists', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 120, 13, false, '{"notes":"Easy current science engagement"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_nature', 'examrizz_arena', '{"DEPTH":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 150, 12, false, '{"notes":"Research awareness"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_conservation', 'examrizz_arena', '{"SOCIAL":4,"CALIBRATION":4}'::JSONB, '{"SOCIAL":35}'::JSONB, 400, 5, true, '{"notes":"Essential for ecology applicants"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_lab', 'examrizz_arena', '{"SOCIAL":3,"CALIBRATION":5}'::JSONB, '{}'::JSONB, 420, 4, true, '{"notes":"Research environment exposure"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'STEM_LIFE' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: LANG CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:34.604Z
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
  'book_through_language_glass', 'BOOK', 'PHYSICAL_BOOK',
  'Through the Language Glass', 'Why the World Looks Different in Other Languages', 'Guy Deutscher''s accessible exploration of how language shapes thought and perception. Examines colour terminology, spatial reasoning, and gender across languages. Ideal for demonstrating critical engagement with the Sapir-Whorf hypothesis.',
  'Guy Deutscher', 'Honorary Research Fellow at University of Manchester, former Fellow at St John''s College Cambridge', 'Arrow Books', 2010,
  '978-0099505570', NULL,
  true, 9, 540,
  'LANG', ARRAY['SOC', 'HUM'], ARRAY['linguistics', 'linguistic-relativity', 'colour-terms', 'sapir-whorf', 'cognitive-linguistics'], ARRAY['linguistics', 'modern-languages', 'language'],
  'Royal Society Science Book Prize longlist 2011', 'AWARD_WINNER', 'Demonstrates sophisticated understanding of language-thought relationship', 88,
  55, 55, 40,
  55, 60, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available',
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
  'course_spanish_vocabulary', 'COURSE', 'VIDEO_COURSE',
  'Spanish Vocabulary: Meeting People', NULL, 'University of California Davis MOOC building conversational Spanish skills. Practical language development beyond A-level curriculum. Demonstrates initiative in developing practical fluency alongside academic study.',
  'UC Davis Division of Continuing and Professional Education', 'UC Davis language faculty', 'Coursera / UC Davis', 2020,
  NULL, 'https://www.coursera.org/learn/spanish-vocabulary-meeting-people',
  true, 4, 480,
  'LANG', '{}', ARRAY['spanish', 'vocabulary', 'conversation', 'practical-language'], ARRAY['spanish', 'modern-languages'],
  'UC Davis language programme', 'UNIVERSITY_READING_LIST', 'Shows commitment to practical fluency beyond exams', 75,
  30, 40, 25,
  45, 25, 40,
  ARRAY['GCSE Spanish or equivalent'], ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '8 hours (4 weeks)', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit on Coursera',
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
  'course_intro_german', 'COURSE', 'VIDEO_COURSE',
  'German for Beginners 1: The Basics', NULL, 'FutureLearn course from Goldsmiths, University of London introducing German language fundamentals. Ideal for students wanting to demonstrate initiative by learning an additional language beyond A-level choices.',
  'Goldsmiths, University of London', 'Goldsmiths German department', 'FutureLearn', 2019,
  NULL, 'https://www.futurelearn.com/courses/german',
  true, 4, 360,
  'LANG', '{}', ARRAY['german', 'beginner', 'language-learning'], ARRAY['german', 'modern-languages'],
  'UK university language department', 'UNIVERSITY_READING_LIST', 'Demonstrates language-learning initiative and aptitude', 78,
  35, 35, 30,
  40, 25, 45,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '6 hours (4 weeks)', 'WEEKLY', NULL, false,
  true, NULL, 'Free access with FutureLearn account',
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
  'work_exp_translation', 'WORK_EXPERIENCE', 'MIXED',
  'Translation/Interpreting Work Shadowing', NULL, 'Shadow professional translators or interpreters to understand career applications of language skills. Options include literary translators, legal interpreters, NHS language services, or subtitling companies. Demonstrates awareness of professional linguistics careers.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 600,
  'LANG', ARRAY['HUM', 'LAW'], ARRAY['translation', 'interpreting', 'work-experience', 'careers'], ARRAY['modern-languages', 'translation', 'interpreting'],
  'Chartered Institute of Linguists recommends early exposure', 'PROFESSIONAL_BODY', 'Demonstrates understanding of language careers beyond teaching', 80,
  40, 40, 35,
  50, 50, 70,
  ARRAY['A-level language study recommended'], ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Contact CIOL, ITI, or local translation agencies directly',
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
  'epq_language_death', 'EPQ_IDEA', 'MIXED',
  'EPQ: Language Endangerment and Revitalisation', NULL, 'Research project investigating endangered languages and revitalisation efforts. Could focus on Welsh, Irish, Scots Gaelic, or global examples. Demonstrates research skills and engagement with sociolinguistic issues highly valued by linguistics departments.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 3000,
  'LANG', ARRAY['SOC', 'HUM'], ARRAY['epq', 'endangered-languages', 'sociolinguistics', 'language-revitalisation', 'research'], ARRAY['linguistics', 'modern-languages', 'language'],
  'EPQ qualification valued by universities', 'ADMISSIONS_TUTOR', 'Demonstrates independent research capability on linguistic topic', 88,
  65, 85, 50,
  70, 70, 90,
  ARRAY['GCSE English'], ARRAY['Y12', 'Y13'],
  '50-120 hours over academic year', 'ONGOING', 'May', false,
  true, NULL, 'Must be registered through school',
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
  'book_language_instinct', 'BOOK', 'PHYSICAL_BOOK',
  'The Language Instinct', 'How the Mind Creates Language', 'Steven Pinker''s foundational exploration of how language works and why humans are uniquely equipped for it. Essential reading for linguistics applicants, demonstrating understanding of universal grammar, language acquisition, and the cognitive science of language.',
  'Steven Pinker', 'Johnstone Professor of Psychology at Harvard, former Director of MIT Center for Cognitive Neuroscience', 'Penguin', 1994,
  '978-0141980775', NULL,
  true, 13, 720,
  'LANG', ARRAY['SOC'], ARRAY['linguistics', 'cognitive-science', 'language-acquisition', 'universal-grammar', 'psycholinguistics'], ARRAY['linguistics', 'language', 'cognitive'],
  'Cambridge Linguistics reading list, Oxford MML preparation', 'UNIVERSITY_READING_LIST', 'Frequently referenced in successful linguistics and MML personal statements', 95,
  65, 70, 55,
  60, 45, 35,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '12-15 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Widely available in bookshops and libraries',
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
  'book_babel', 'BOOK', 'PHYSICAL_BOOK',
  'Babel', 'Around the World in Twenty Languages', 'Gaston Dorren''s engaging tour of the world''s twenty most widely spoken languages. Covers linguistic features, history, and cultural context. Excellent for broadening perspective beyond European languages and demonstrating global linguistic awareness.',
  'Gaston Dorren', 'Linguist and polyglot, author of Lingo (European languages)', 'Profile Books', 2018,
  '978-1781256411', NULL,
  true, 20, 600,
  'LANG', ARRAY['HUM'], ARRAY['world-languages', 'language-diversity', 'sociolinguistics', 'language-history'], ARRAY['linguistics', 'modern-languages', 'language'],
  'Recommended by linguistics departments at multiple UK universities', 'COMMUNITY_RECOMMENDED', 'Shows breadth of linguistic interest beyond applicant''s studied languages', 82,
  45, 60, 35,
  50, 35, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '10-12 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Available in bookshops and libraries',
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
  'book_dont_sleep_subway', 'BOOK', 'PHYSICAL_BOOK',
  'Don''t Sleep, There Are Snakes', 'Life and Language in the Amazonian Jungle', 'Daniel Everett''s account of living with the Pirahã tribe and discovering their unique language that challenges Chomsky''s universal grammar. Provocative and accessible, perfect for demonstrating critical engagement with foundational linguistic theory.',
  'Daniel Everett', 'Former Chair of Languages at Bentley University, former Christian missionary turned atheist linguist', 'Profile Books', 2008,
  '978-1846680403', NULL,
  true, 17, 540,
  'LANG', ARRAY['SOC', 'HUM'], ARRAY['linguistics', 'universal-grammar', 'piraha', 'field-linguistics', 'language-diversity'], ARRAY['linguistics', 'anthropology', 'language'],
  'Featured in linguistics curricula for challenging established theory', 'PEER_REVIEWED', 'Demonstrates willingness to engage with controversial academic debates', 85,
  60, 55, 45,
  55, 70, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8-10 hours', 'ONE_OFF', NULL, false,
  false, 10.99, 'Available in bookshops and libraries',
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
  'book_word_by_word', 'BOOK', 'PHYSICAL_BOOK',
  'Word by Word', 'The Secret Life of Dictionaries', 'Kory Stamper''s insider account of lexicography at Merriam-Webster. Explores how dictionaries are made, word histories, and the evolution of English. Engaging introduction to applied linguistics and the descriptive vs prescriptive debate.',
  'Kory Stamper', 'Lexicographer at Merriam-Webster for nearly two decades', 'Vintage', 2017,
  '978-1101970263', NULL,
  true, 12, 480,
  'LANG', ARRAY['HUM'], ARRAY['lexicography', 'etymology', 'english-language', 'descriptive-linguistics'], ARRAY['linguistics', 'english', 'language'],
  'New York Times bestseller, widely cited in linguistics education', 'ESTABLISHED_MEDIA', 'Shows interest in practical applications of linguistics', 80,
  40, 50, 30,
  55, 35, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '7-9 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Available in bookshops, US spelling throughout',
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
  'course_miracles_human_language', 'COURSE', 'VIDEO_COURSE',
  'Miracles of Human Language: An Introduction to Linguistics', NULL, 'Leiden University''s comprehensive introduction to linguistics on Coursera. Covers phonetics, morphology, syntax, semantics, and language acquisition. Provides structured academic foundation ideal for demonstrating serious preparation for linguistics degrees.',
  'Marc van Oostendorp', 'Professor of Linguistics at Leiden University and Meertens Institute', 'Coursera / Leiden University', 2015,
  NULL, 'https://www.coursera.org/learn/human-language',
  true, 6, 1080,
  'LANG', ARRAY['SOC'], ARRAY['linguistics', 'phonetics', 'morphology', 'syntax', 'semantics'], ARRAY['linguistics', 'language'],
  'Leading European linguistics department', 'UNIVERSITY_READING_LIST', 'Certificate demonstrates structured academic engagement with linguistics', 90,
  55, 65, 50,
  55, 40, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '18 hours (6 weeks)', 'WEEKLY', NULL, false,
  true, NULL, 'Free to audit, certificate requires payment',
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
  'competition_linguistics_olympiad', 'COMPETITION', 'IN_PERSON',
  'UK Linguistics Olympiad (UKLO)', NULL, 'Annual puzzle-based competition testing logical reasoning about unfamiliar languages. No prior linguistics knowledge required—problems are self-contained. Highly valued by admissions tutors as evidence of linguistic aptitude and analytical thinking.',
  'UK Linguistics Olympiad Committee', 'Supported by British Academy, Linguistics Association of Great Britain', 'UKLO', 2010,
  NULL, 'https://www.uklo.org',
  false, NULL, 300,
  'LANG', ARRAY['COMP', 'STEM_PHYS'], ARRAY['linguistics', 'olympiad', 'problem-solving', 'logic'], ARRAY['linguistics', 'modern-languages', 'language'],
  'Cambridge and Oxford linguistics departments explicitly value UKLO participation', 'ADMISSIONS_TUTOR', 'Awards, participation in later rounds mentioned in successful applications', 95,
  75, 25, 60,
  50, 65, 30,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '2 hours exam + 5 hours practice', 'DEADLINE', 'January', true,
  true, NULL, 'Enter through school, Round 1 typically January',
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
  'test_mlat', 'ADMISSION_TEST', 'IN_PERSON',
  'Modern Languages Admissions Test (MLAT)', NULL, 'Oxford''s admissions test for Modern Languages and related courses. Tests linguistic aptitude through grammar analysis, translation, and comprehension in studied languages. Preparation demonstrates serious commitment to Oxford application.',
  'University of Oxford', 'Official Oxford admissions assessment', 'University of Oxford', 2016,
  NULL, 'https://www.ox.ac.uk/admissions/undergraduate/applying-to-oxford/guide/admissions-tests/mlat',
  true, 5, 600,
  'LANG', '{}', ARRAY['oxford', 'admissions-test', 'modern-languages', 'translation'], ARRAY['modern-languages', 'french', 'german', 'spanish', 'italian', 'russian'],
  'University of Oxford', 'ADMISSIONS_TUTOR', 'Required for Oxford MML applications', 98,
  70, 50, 65,
  75, 55, 60,
  ARRAY['A-level in at least one modern language'], ARRAY['Y13'],
  '10+ hours preparation', 'DEADLINE', 'October', true,
  true, NULL, 'Taken at test centres, past papers available online',
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
  'podcast_lexicon_valley', 'PODCAST', 'PODCAST_AUDIO',
  'Lexicon Valley', NULL, 'Long-running podcast exploring language history, etymology, grammar debates, and linguistic curiosities. Hosted by linguist John McWhorter. Episodes are accessible yet intellectually substantial, ideal for building wider linguistic awareness.',
  'John McWhorter', 'Associate Professor of Linguistics at Columbia University', 'Booksmart Studios / Slate (originally)', 2012,
  NULL, 'https://www.booksmartstudios.org/lexicon-valley',
  true, 200, 1800,
  'LANG', ARRAY['HUM'], ARRAY['linguistics', 'etymology', 'grammar', 'language-history'], ARRAY['linguistics', 'english', 'language'],
  'Columbia University linguistics faculty', 'ESTABLISHED_MEDIA', 'Demonstrates ongoing engagement with linguistic topics', 85,
  45, 30, 35,
  55, 40, 25,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '30-45 mins per episode, select 10-15 episodes', 'FLEXIBLE', NULL, false,
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
  'video_crash_course_linguistics', 'VIDEO', 'YOUTUBE',
  'Crash Course Linguistics', NULL, '16-episode YouTube series covering core linguistics topics: phonetics, morphology, syntax, semantics, sociolinguistics, and language acquisition. Highly accessible introduction with strong production values. Ideal starting point for linguistics exploration.',
  'Taylor Behnke (hosted), Complexly (produced)', 'Crash Course series known for academic accuracy, consulted with linguists', 'YouTube / Crash Course', 2020,
  NULL, 'https://www.youtube.com/playlist?list=PL8dPuuaLjXtP5mp25nStsuDzk2blncJDW',
  true, 16, 180,
  'LANG', ARRAY['SOC'], ARRAY['linguistics', 'introduction', 'phonetics', 'syntax', 'sociolinguistics'], ARRAY['linguistics', 'language'],
  'Crash Course educational series, widely used in schools', 'ESTABLISHED_MEDIA', 'Quick foundation for further exploration', 80,
  40, 25, 35,
  40, 25, 20,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '3 hours total', 'ONE_OFF', NULL, false,
  true, NULL, 'Free on YouTube',
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
  'volunteering_language_cafe', 'VOLUNTEERING', 'IN_PERSON',
  'Language Café / Conversation Exchange Volunteering', NULL, 'Volunteer at local language cafés or conversation exchanges helping refugees and migrants practice English, or practising your target language with native speakers. Many libraries and community centres host these. Demonstrates practical language use and cultural engagement.',
  NULL, NULL, NULL, NULL,
  NULL, NULL,
  false, NULL, 1200,
  'LANG', ARRAY['SOC', 'EDU'], ARRAY['volunteering', 'conversation', 'cultural-exchange', 'practical-language'], ARRAY['modern-languages', 'linguistics', 'language'],
  'Recommended by university outreach programmes', 'ADMISSIONS_TUTOR', 'Shows real-world language use and intercultural competence', 82,
  25, 50, 20,
  55, 45, 60,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '2 hours/week for 10+ weeks', 'WEEKLY', NULL, true,
  true, NULL, 'Search local libraries, refugee charities, universities for opportunities',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_through_language_glass', 'CAH19', NULL, NULL, 90, true, 'Explores relationship between language and cognition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_through_language_glass', NULL, 'modern-languages', NULL, 80, false, 'Comparative language analysis');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_spanish_vocabulary', 'CAH19', NULL, NULL, 80, true, 'Spanish language development');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_spanish_vocabulary', NULL, 'spanish', NULL, 90, false, 'Spanish-specific content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_german', 'CAH19', NULL, NULL, 80, true, 'German language introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_intro_german', NULL, 'german', NULL, 90, false, 'German-specific content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_exp_translation', 'CAH19', NULL, NULL, 85, true, 'Professional language careers exposure');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_exp_translation', NULL, 'translation', NULL, 90, false, 'Translation-specific career path');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_language_death', 'CAH19', NULL, NULL, 90, true, 'Sociolinguistics research project');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_language_death', NULL, 'linguistics', NULL, 85, false, 'Language endangerment is core sociolinguistics topic');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_language_instinct', 'CAH19', NULL, NULL, 95, true, 'Core text for linguistics and language science');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_language_instinct', NULL, 'linguistics', NULL, 95, false, 'Foundational linguistics text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_language_instinct', 'CAH04', NULL, NULL, 70, false, 'Cognitive psychology of language');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_babel', 'CAH19', NULL, NULL, 85, true, 'Survey of world languages');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_babel', NULL, 'linguistics', NULL, 80, false, 'Linguistic diversity overview');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_dont_sleep_subway', 'CAH19', NULL, NULL, 90, true, 'Field linguistics and universal grammar debate');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_dont_sleep_subway', NULL, 'anthropology', NULL, 75, false, 'Linguistic anthropology perspective');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_word_by_word', 'CAH19', NULL, NULL, 80, true, 'Lexicography and applied linguistics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_word_by_word', NULL, 'english', NULL, 75, false, 'English language focus');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_miracles_human_language', 'CAH19', NULL, NULL, 95, true, 'Comprehensive linguistics introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_miracles_human_language', NULL, 'linguistics', NULL, 95, false, 'Core linguistics curriculum');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_linguistics_olympiad', 'CAH19', NULL, NULL, 98, true, 'Prestigious linguistics competition explicitly valued by admissions');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_linguistics_olympiad', NULL, 'linguistics', NULL, 95, false, 'Core linguistics aptitude test');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_mlat', 'CAH19', NULL, NULL, 98, true, 'Required for Oxford MML applications');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_mlat', NULL, 'modern-languages', NULL, 98, false, 'Modern languages admissions test');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_lexicon_valley', 'CAH19', NULL, NULL, 80, true, 'Linguistics podcast for ongoing engagement');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_lexicon_valley', NULL, 'linguistics', NULL, 80, false, 'Linguistics content');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_crash_course_linguistics', 'CAH19', NULL, NULL, 85, true, 'Accessible linguistics introduction');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_crash_course_linguistics', NULL, 'linguistics', NULL, 85, false, 'Comprehensive linguistics overview');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_language_cafe', 'CAH19', NULL, NULL, 80, true, 'Practical language use and intercultural experience');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_language_cafe', NULL, 'modern-languages', NULL, 85, false, 'Real-world language application');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_through_language_glass', 'examrizz_arena', '{"TRANSFER":5,"CALIBRATION":3}'::JSONB, '{"TOLERANCE":30}'::JSONB, 250, 10, true, '{"notes":"Excellent for students interested in language-thought relationship, accessible entry point"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_spanish_vocabulary', 'examrizz_arena', '{"SOCIAL":2,"CONSISTENCY":3}'::JSONB, '{}'::JSONB, 180, 25, false, '{"notes":"For Spanish students wanting to build conversational skills"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_intro_german', 'examrizz_arena', '{"CONSISTENCY":3,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 180, 25, false, '{"notes":"For students wanting to add another language to their repertoire"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_exp_translation', 'examrizz_arena', '{"DEPTH":3,"CALIBRATION":3}'::JSONB, '{}'::JSONB, 250, 15, false, '{"notes":"For students interested in professional language careers"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_language_death', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":4,"CALIBRATION":4}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":45}'::JSONB, 500, 6, true, '{"notes":"For highly motivated students with strong independent work skills"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_language_instinct', 'examrizz_arena', '{"DEPTH":4,"TRANSFER":4,"CALIBRATION":3}'::JSONB, '{"TOLERANCE":40}'::JSONB, 300, 5, true, '{"notes":"Recommend to students strong in TRANSFER, aiming for linguistics or cognitive science"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_babel', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 250, 15, false, '{"notes":"Good for broadening linguistic horizons, suitable for all LANG applicants"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_dont_sleep_subway', 'examrizz_arena', '{"DEPTH":4,"TOLERANCE":3,"CALIBRATION":5}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 12, true, '{"notes":"For students comfortable with academic controversy, strong critical thinkers"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_word_by_word', 'examrizz_arena', '{"DEPTH":3,"PRECISION":4}'::JSONB, '{}'::JSONB, 220, 20, false, '{"notes":"Lighter read, good for students interested in applied linguistics"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_miracles_human_language', 'examrizz_arena', '{"DEPTH":3,"STRUCTURE":4,"CONSISTENCY":4}'::JSONB, '{"CONSISTENCY":40}'::JSONB, 350, 8, true, '{"notes":"Best for students who thrive with structured learning, provides solid foundation"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_linguistics_olympiad', 'examrizz_arena', '{"TRANSFER":5,"PRECISION":5,"CALIBRATION":4}'::JSONB, '{"TOLERANCE":45}'::JSONB, 400, 3, true, '{"notes":"Highly recommended for all linguistics applicants, tests pure linguistic aptitude"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_mlat', 'examrizz_arena', '{"PRECISION":4,"RETRIEVAL":4}'::JSONB, '{"TOLERANCE":50}'::JSONB, 350, 5, true, '{"notes":"Essential for Oxford MML applicants, recommend early preparation"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_lexicon_valley', 'examrizz_arena', '{"TRANSFER":2,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 150, 30, false, '{"notes":"Low-commitment way to build linguistic awareness, good for commutes"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_crash_course_linguistics', 'examrizz_arena', '{"STRUCTURE":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 120, 18, false, '{"notes":"Excellent starting point for students new to linguistics"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_language_cafe', 'examrizz_arena', '{"SOCIAL":5,"RECEPTIVITY":4}'::JSONB, '{"SOCIAL":35}'::JSONB, 280, 12, false, '{"notes":"Great for socially oriented students, provides practical experience"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'LANG' GROUP BY primary_cluster;
-- ============================================================================
-- SEED DATA: ENV CLUSTER (CURATED)
-- ============================================================================
-- Generated: 2025-12-30T15:10:35.127Z
-- Sources: claude-3.5
-- Items: 14
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
  'book_uninhabitable_earth', 'BOOK', 'PHYSICAL_BOOK',
  'The Uninhabitable Earth', 'A Story of the Future', 'David Wallace-Wells presents a comprehensive account of climate change impacts across systems - food, water, conflict, economics. Essential for understanding the urgency and interconnected nature of environmental challenges.',
  'David Wallace-Wells', 'Deputy editor of New York Magazine, climate journalist', 'Penguin', 2019,
  '978-0141988870', NULL,
  true, 12, 540,
  'ENV', ARRAY['SOC', 'STEM_LIFE'], ARRAY['climate-change', 'environmental-science', 'sustainability', 'future-studies'], ARRAY['geography', 'environmental-science', 'sustainability'],
  'Widely recommended environmental text', 'ESTABLISHED_MEDIA', 'Demonstrates understanding of climate science and policy', 88,
  55, 55, 40,
  60, 50, 40,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '9-10 hours', 'ONE_OFF', NULL, false,
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
  'book_prisoners_geography', 'BOOK', 'PHYSICAL_BOOK',
  'Prisoners of Geography', 'Ten Maps That Tell You Everything You Need to Know About Global Politics', 'Tim Marshall explains how physical geography shapes geopolitics - why Russia needs Ukraine, why China looks to the South China Sea. Essential for human geography and international relations.',
  'Tim Marshall', 'Former diplomatic editor for Sky News, foreign affairs specialist', 'Elliott & Thompson', 2015,
  '978-1783962433', NULL,
  true, 10, 480,
  'ENV', ARRAY['SOC'], ARRAY['geopolitics', 'human-geography', 'maps', 'international-relations'], ARRAY['geography', 'politics', 'international-relations'],
  'Bestselling geography text, university recommendations', 'ESTABLISHED_MEDIA', 'Shows understanding of geography-politics nexus', 90,
  50, 50, 30,
  50, 45, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '8 hours', 'ONE_OFF', NULL, false,
  false, 9.99, 'Widely available, illustrated edition recommended',
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
  'course_climate_science', 'COURSE', 'VIDEO_COURSE',
  'Climate Change: The Science and Global Impact', NULL, 'SDG Academy course covering climate science fundamentals, impacts, and solutions. Taught by leading climate scientists. Provides scientific grounding for environmental geography.',
  'SDG Academy', 'UN Sustainable Development Solutions Network', 'edX', 2020,
  NULL, 'https://www.edx.org/learn/climate-change',
  true, 8, 720,
  'ENV', ARRAY['STEM_PHYS', 'STEM_LIFE'], ARRAY['climate-science', 'global-warming', 'sustainability'], ARRAY['geography', 'environmental-science'],
  'UN SDG Academy', 'GOVERNMENT_BODY', 'Rigorous climate science understanding', 90,
  55, 60, 50,
  50, 45, 50,
  ARRAY['GCSE Science'], ARRAY['Y11', 'Y12', 'Y13'],
  '12 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit on edX',
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
  'course_sustainable_cities', 'COURSE', 'VIDEO_COURSE',
  'Sustainable Cities', NULL, 'SDG Academy course on urban sustainability challenges and solutions. Covers transport, housing, energy, and governance in cities. Relevant for geography and urban planning interests.',
  'SDG Academy', 'UN Sustainable Development Solutions Network', 'edX', 2019,
  NULL, NULL,
  true, 6, 600,
  'ENV', ARRAY['SOC'], ARRAY['urban-geography', 'sustainability', 'planning', 'cities'], ARRAY['geography', 'planning', 'architecture'],
  'UN SDG Academy', 'GOVERNMENT_BODY', 'Urban sustainability understanding', 85,
  50, 55, 40,
  50, 50, 50,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '10 hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit',
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
  'epq_environmental_investigation', 'EPQ_IDEA', 'MIXED',
  'EPQ: Local Environmental Investigation', NULL, 'Extended project investigating a local environmental issue - flood risk, urban heat islands, biodiversity surveys, or regeneration impacts. Combines fieldwork with research for authentic geographical inquiry.',
  NULL, NULL, 'Various exam boards (AQA, Pearson)', NULL,
  NULL, NULL,
  true, 6, 3000,
  'ENV', '{}', ARRAY['epq', 'fieldwork', 'environmental-research'], ARRAY['geography', 'environmental-science'],
  'UK exam boards', 'GOVERNMENT_BODY', 'UCAS points plus independent research', 88,
  65, 85, 60,
  60, 70, 85,
  ARRAY['GCSE Geography'], ARRAY['Y12', 'Y13'],
  '50+ hours', 'DEADLINE', 'May', false,
  false, NULL, 'Through school EPQ programme',
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
  'book_silent_spring', 'BOOK', 'PHYSICAL_BOOK',
  'Silent Spring', NULL, 'Rachel Carson''s landmark 1962 work documenting pesticide damage to ecosystems. Credited with launching the modern environmental movement. Essential historical context for environmental science.',
  'Rachel Carson', 'Marine biologist, conservationist', 'Penguin Classics', 1962,
  '978-0141184944', NULL,
  true, 8, 480,
  'ENV', ARRAY['STEM_LIFE'], ARRAY['environmental-history', 'ecology', 'pesticides', 'conservation'], ARRAY['environmental-science', 'biology', 'geography'],
  'Foundational environmental text', 'ESTABLISHED_MEDIA', 'Understanding of environmental movement history', 92,
  45, 50, 40,
  55, 40, 35,
  '{}', ARRAY['Y11', 'Y12', 'Y13'],
  '8 hours', 'ONE_OFF', NULL, false,
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
  'book_towards_new_architecture', 'BOOK', 'PHYSICAL_BOOK',
  'Towards a New Architecture', NULL, 'Le Corbusier''s manifesto that defined modernist architecture. ''A house is a machine for living in.'' Essential reading for architecture applicants to understand 20th-century architectural theory.',
  'Le Corbusier', 'Pioneering modernist architect', 'Dover Publications', 1923,
  '978-0486250236', NULL,
  true, 8, 360,
  'ENV', ARRAY['HUM'], ARRAY['architecture', 'modernism', 'design-theory', 'urban-planning'], ARRAY['architecture'],
  'Foundational architectural text', 'INDUSTRY_STANDARD', 'Engagement with architectural theory', 95,
  65, 45, 45,
  65, 60, 50,
  '{}', ARRAY['Y12', 'Y13'],
  '6 hours', 'ONE_OFF', NULL, false,
  false, 11.99, 'Dover edition widely available',
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
  'course_gis', 'COURSE', 'VIDEO_COURSE',
  'Geographic Information Systems (GIS) Specialization', NULL, 'UC Davis course introducing GIS software and spatial analysis. Practical skills in mapping, data visualization, and geographic analysis. Highly valued technical skill for geography degrees.',
  'UC Davis', 'University of California, Davis', 'Coursera', 2018,
  NULL, 'https://www.coursera.org/specializations/gis',
  true, 4, 2400,
  'ENV', ARRAY['COMP'], ARRAY['gis', 'mapping', 'spatial-analysis', 'data-visualization'], ARRAY['geography', 'environmental-science', 'data-science'],
  'UC Davis', 'UNIVERSITY_READING_LIST', 'Technical GIS skills highly valued', 92,
  55, 75, 65,
  45, 40, 55,
  ARRAY['GCSE Maths'], ARRAY['Y12', 'Y13'],
  '40 hours (full specialization)', 'FLEXIBLE', NULL, false,
  true, NULL, 'Free to audit, certificate requires subscription',
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
  'competition_geography_olympiad', 'COMPETITION', 'INTERACTIVE',
  'UK Geography Olympiad', NULL, 'National geography competition testing physical and human geography knowledge. Top performers represent UK at International Geography Olympiad (iGeo). Strong differentiator for competitive applications.',
  'Royal Geographical Society', 'Royal Geographical Society with IBG', 'RGS-IBG', 2010,
  NULL, 'https://www.rgs.org/schools/competitions/geography-olympiad/',
  false, NULL, 600,
  'ENV', '{}', ARRAY['geography-competition', 'olympiad'], ARRAY['geography'],
  'Royal Geographical Society', 'PROFESSIONAL_BODY', 'Medals/certificates highly valued by admissions', 95,
  70, 50, 55,
  55, 50, 45,
  ARRAY['GCSE Geography'], ARRAY['Y12', 'Y13'],
  '10+ hours preparation', 'DEADLINE', 'February', true,
  true, NULL, 'Enter through school, check RGS website for dates',
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
  'test_architecture_portfolio', 'ADMISSION_TEST', 'MIXED',
  'Architecture Portfolio Preparation', NULL, 'Most architecture courses require a portfolio demonstrating drawing skills, spatial awareness, and creative thinking. Should include observational drawings, design projects, and models. Start early to build quality work.',
  'Various architecture schools', 'UK architecture schools', NULL, NULL,
  NULL, NULL,
  true, 5, 6000,
  'ENV', ARRAY['HUM'], ARRAY['portfolio', 'architecture', 'drawing', 'design'], ARRAY['architecture'],
  'RIBA and architecture school requirements', 'PROFESSIONAL_BODY', 'Required for architecture applications', 100,
  65, 90, 70,
  40, 70, 80,
  ARRAY['Art/Design interest'], ARRAY['Y11', 'Y12', 'Y13'],
  '100+ hours over 1-2 years', 'ONGOING', 'January', false,
  false, 50, 'Materials costs vary; attend open days for guidance',
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
  'podcast_costing_planet', 'PODCAST', 'PODCAST_AUDIO',
  'Costing the Earth', NULL, 'BBC Radio 4''s environmental programme exploring sustainability, conservation, and environmental policy. UK-focused with global context. Regular updates on environmental issues and solutions.',
  'BBC Radio 4', 'BBC', 'BBC Radio 4', 2007,
  NULL, 'https://www.bbc.co.uk/programmes/b006r4wn',
  true, 20, 600,
  'ENV', ARRAY['STEM_LIFE'], ARRAY['environment', 'sustainability', 'conservation', 'policy'], ARRAY['geography', 'environmental-science'],
  'BBC', 'ESTABLISHED_MEDIA', 'Current environmental awareness', 88,
  45, 40, 35,
  50, 45, 35,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '30 mins per episode', 'ONGOING', NULL, true,
  true, NULL, 'BBC Sounds, extensive archive',
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
  'video_planet_earth', 'VIDEO', 'YOUTUBE',
  'BBC Planet Earth / Blue Planet Series', NULL, 'David Attenborough''s landmark nature documentaries. Stunning footage with scientific narration on ecosystems, biodiversity, and environmental change. Essential for ecology and environmental science interests.',
  'David Attenborough / BBC Natural History Unit', 'BBC Natural History Unit, world-leading nature documentaries', 'BBC', 2016,
  NULL, NULL,
  true, 8, 480,
  'ENV', ARRAY['STEM_LIFE'], ARRAY['ecology', 'biodiversity', 'conservation', 'documentary'], ARRAY['geography', 'environmental-science', 'biology'],
  'BBC Natural History Unit', 'ESTABLISHED_MEDIA', 'Understanding of global ecosystems', 95,
  40, 45, 30,
  45, 30, 25,
  '{}', ARRAY['Y10', 'Y11', 'Y12', 'Y13'],
  '8 hours per series', 'FLEXIBLE', NULL, false,
  false, NULL, 'BBC iPlayer, Netflix, DVD',
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
  'volunteering_rgs_fieldwork', 'VOLUNTEERING', 'IN_PERSON',
  'Geographical Fieldwork / Citizen Science', NULL, 'Participate in geographical fieldwork through citizen science projects, local environmental surveys, or RGS field studies. Practical experience collecting and analysing geographical data essential for applications.',
  'Various organisations', 'RGS, Field Studies Council, local groups', NULL, NULL,
  NULL, 'https://www.rgs.org/schools/teaching-resources/fieldwork/',
  false, NULL, 1200,
  'ENV', ARRAY['STEM_LIFE'], ARRAY['fieldwork', 'data-collection', 'citizen-science'], ARRAY['geography', 'environmental-science'],
  'Royal Geographical Society', 'PROFESSIONAL_BODY', 'Practical fieldwork experience', 90,
  45, 55, 50,
  40, 50, 55,
  ARRAY['GCSE Geography helpful'], ARRAY['Y11', 'Y12', 'Y13'],
  '20+ hours', 'FLEXIBLE', NULL, false,
  true, NULL, 'FSC courses, local wildlife trusts, university outreach',
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
  'work_experience_planning', 'WORK_EXPERIENCE', 'IN_PERSON',
  'Architecture / Planning Work Experience', NULL, 'Work experience at architecture practice, planning department, or surveying firm. Observe professional work, understand project processes, and build portfolio material. Essential for architecture applicants.',
  'Various practices', 'Architecture and planning profession', NULL, NULL,
  NULL, NULL,
  false, NULL, 2100,
  'ENV', '{}', ARRAY['work-experience', 'architecture', 'planning'], ARRAY['architecture', 'planning'],
  'RIBA', 'PROFESSIONAL_BODY', 'Essential for architecture applications', 95,
  45, 55, 50,
  45, 50, 60,
  '{}', ARRAY['Y12', 'Y13'],
  '1-2 weeks', 'ONE_OFF', NULL, false,
  true, NULL, 'Contact local practices directly, check RIBA for guidance',
  TRUE, FALSE, 'HIGH'
);


-- COURSE LINKS

INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_uninhabitable_earth', 'CAH12', NULL, NULL, 90, true, 'Climate geography and environmental science');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_uninhabitable_earth', NULL, 'environmental-science', NULL, 92, false, 'Core environmental text');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_prisoners_geography', 'CAH12', NULL, NULL, 92, true, 'Human geography and geopolitics');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_prisoners_geography', NULL, 'politics', NULL, 80, false, 'International relations context');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_climate_science', 'CAH12', NULL, NULL, 90, true, 'Climate science foundations');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_sustainable_cities', 'CAH12', NULL, NULL, 85, true, 'Urban geography');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_sustainable_cities', 'CAH13', NULL, NULL, 80, false, 'Urban planning context');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('epq_environmental_investigation', 'CAH12', NULL, NULL, 90, true, 'Independent geography research');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_silent_spring', 'CAH12', NULL, NULL, 88, true, 'Environmental history');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('book_towards_new_architecture', 'CAH13', NULL, NULL, 95, true, 'Foundational architecture theory');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('course_gis', 'CAH12', NULL, NULL, 95, true, 'Essential technical geography skill');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('competition_geography_olympiad', 'CAH12', NULL, NULL, 98, true, 'National geography competition');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('test_architecture_portfolio', 'CAH13', NULL, NULL, 100, true, 'Required for architecture entry');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('podcast_costing_planet', 'CAH12', NULL, NULL, 85, true, 'Environmental current affairs');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('video_planet_earth', 'CAH12', NULL, NULL, 82, true, 'Ecology and biodiversity');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('volunteering_rgs_fieldwork', 'CAH12', NULL, NULL, 92, true, 'Practical geography skills');
INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES ('work_experience_planning', 'CAH13', NULL, NULL, 95, true, 'Architecture profession exposure');

-- QUIZ MAPPINGS

INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_uninhabitable_earth', 'examrizz_arena', '{"TRANSFER":4,"CALIBRATION":4}'::JSONB, '{"TOLERANCE":35}'::JSONB, 280, 5, true, '{"notes":"Essential climate understanding"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_prisoners_geography', 'examrizz_arena', '{"TRANSFER":5,"RECEPTIVITY":3}'::JSONB, '{}'::JSONB, 250, 3, true, '{"notes":"Accessible, highly engaging geopolitics"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_climate_science', 'examrizz_arena', '{"PRECISION":4,"CONSISTENCY":3}'::JSONB, '{"TOLERANCE":35}'::JSONB, 320, 7, false, '{"notes":"Scientific grounding for geography"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_sustainable_cities', 'examrizz_arena', '{"TRANSFER":4,"RECEPTIVITY":3}'::JSONB, '{"TOLERANCE":30}'::JSONB, 280, 9, false, '{"notes":"Urban geography focus"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('epq_environmental_investigation', 'examrizz_arena', '{"DEPTH":5,"PRECISION":4,"TOLERANCE":5}'::JSONB, '{"DEPTH":45,"TOLERANCE":50}'::JSONB, 500, 6, true, '{"notes":"Independent research with fieldwork"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_silent_spring', 'examrizz_arena', '{"DEPTH":4,"CALIBRATION":3}'::JSONB, '{"TOLERANCE":30}'::JSONB, 250, 10, false, '{"notes":"Historical context for environmental movement"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('book_towards_new_architecture', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":4}'::JSONB, '{"DEPTH":40,"TOLERANCE":45}'::JSONB, 300, 8, false, '{"notes":"Architecture applicants - essential theory"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('course_gis', 'examrizz_arena', '{"DEPTH":4,"PRECISION":5,"CONSISTENCY":4}'::JSONB, '{"TOLERANCE":45,"CONSISTENCY":40}'::JSONB, 450, 4, true, '{"notes":"Technical skills highly valued"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('competition_geography_olympiad', 'examrizz_arena', '{"DEPTH":5,"PRECISION":5,"TOLERANCE":4}'::JSONB, '{"PRECISION":45,"TOLERANCE":50}'::JSONB, 450, 1, true, '{"notes":"Top competition - medals highly valued"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('test_architecture_portfolio', 'examrizz_arena', '{"DEPTH":5,"TOLERANCE":5,"CONSISTENCY":5}'::JSONB, '{"TOLERANCE":50,"CONSISTENCY":45}'::JSONB, 600, 2, true, '{"notes":"Essential for architecture - start early"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('podcast_costing_planet', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 100, 14, false, '{"notes":"Easy current awareness building"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('video_planet_earth', 'examrizz_arena', '{"TRANSFER":3,"RECEPTIVITY":4}'::JSONB, '{}'::JSONB, 120, 13, false, '{"notes":"Accessible ecosystem understanding"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('volunteering_rgs_fieldwork', 'examrizz_arena', '{"SOCIAL":4,"PRECISION":3,"CALIBRATION":4}'::JSONB, '{"SOCIAL":35}'::JSONB, 380, 5, true, '{"notes":"Essential fieldwork experience"}'::JSONB, TRUE);
INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES ('work_experience_planning', 'examrizz_arena', '{"SOCIAL":4,"CALIBRATION":5}'::JSONB, '{}'::JSONB, 400, 3, true, '{"notes":"Critical for architecture applicants"}'::JSONB, TRUE);

-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = 'ENV' GROUP BY primary_cluster;
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
