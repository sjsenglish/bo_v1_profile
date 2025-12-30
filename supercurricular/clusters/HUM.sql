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
