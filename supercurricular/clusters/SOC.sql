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
