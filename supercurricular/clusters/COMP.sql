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
