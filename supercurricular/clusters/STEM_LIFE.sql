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
