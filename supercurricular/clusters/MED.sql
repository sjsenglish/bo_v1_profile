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
