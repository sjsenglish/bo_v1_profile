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
