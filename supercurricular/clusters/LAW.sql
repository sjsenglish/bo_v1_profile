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
