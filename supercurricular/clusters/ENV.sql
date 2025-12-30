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
