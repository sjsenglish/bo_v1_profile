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
