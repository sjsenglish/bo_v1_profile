-- ExamRizz Arena - QNT Capacity Benchmark Items
-- 36 items across 3 difficulty tiers
-- Run after 007_vrb_items.sql (uses same table)

-- ============================================
-- QNT FOUNDATION TIER (F1-F12)
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- F1: Table Read
('QNT_F1_TBL', 'QNT', 'FOUNDATION', 'INTERPRETATION', 'TABLE_READ',
'| A&E Department | Average Wait (mins) | Patients Seen |
|----------------|---------------------|---------------|
| Bristol Royal | 187 | 4,200 |
| Southampton General | 203 | 3,800 |
| Plymouth Derriford | 156 | 2,900 |
| Exeter RD&E | 142 | 3,100 |',
'Which hospital saw the most patients?',
'["Bristol Royal", "Southampton General", "Plymouth Derriford", "Exeter RD&E"]',
'"Bristol Royal"',
1.0, FALSE, 35, -0.9),

-- F2: Binary Rapid
('QNT_F2_BIN', 'QNT', 'FOUNDATION', 'INTERPRETATION', 'BINARY_RAPID',
'**Last year:** 400 students applied
**This year:** 480 students applied',
'Did applications INCREASE or DECREASE?',
'["INCREASE", "DECREASE"]',
'"INCREASE"',
1.0, FALSE, 12, -1.0),

-- F3: MCQ
('QNT_F3_MCQ', 'QNT', 'FOUNDATION', 'CALCULATION', 'MCQ',
'A university has 15,000 students. The student-to-staff ratio is 15:1.',
'Approximately how many staff does the university have?',
'{"A": "100", "B": "500", "C": "1,000", "D": "15,000"}',
'"C"',
1.0, FALSE, 40, -0.7),

-- F4: Estimation
('QNT_F4_EST', 'QNT', 'FOUNDATION', 'CALCULATION', 'ESTIMATION',
'The average UK house price is £290,000. A "starter home" scheme offers 20% below market value.',
'Roughly what price would a starter home cost?',
'{"ranges": ["£180,000 - £200,000", "£200,000 - £240,000", "£240,000 - £280,000", "£280,000+"]}',
'{"correct_range": 1, "exact_answer": 232000}',
1.0, TRUE, 35, -0.6),

-- F5: Binary Rapid
('QNT_F5_BIN', 'QNT', 'FOUNDATION', 'INTERPRETATION', 'BINARY_RAPID',
'**2022:** 12,400 students enrolled
**2023:** 11,800 students enrolled',
'Did enrolment INCREASE or DECREASE?',
'["INCREASE", "DECREASE"]',
'"DECREASE"',
1.0, FALSE, 10, -1.0),

-- F6: Table Read
('QNT_F6_TBL', 'QNT', 'FOUNDATION', 'INTERPRETATION', 'TABLE_READ',
'| City | Average Rent (pcm) | Change from 2022 |
|------|-------------------|------------------|
| London | £2,100 | +8% |
| Manchester | £1,150 | +12% |
| Birmingham | £980 | +6% |
| Leeds | £920 | +9% |',
'Which city saw the biggest percentage increase in rent?',
'["London", "Manchester", "Birmingham", "Leeds"]',
'"Manchester"',
1.0, FALSE, 30, -0.8),

-- F7: Estimation
('QNT_F7_EST', 'QNT', 'FOUNDATION', 'CALCULATION', 'ESTIMATION',
'A shop has a 25% off sale. A jacket originally costs £80.',
'Roughly what is the sale price?',
'{"ranges": ["£40-50", "£50-60", "£60-70", "£70+"]}',
'{"correct_range": 1, "exact_answer": 60}',
1.0, TRUE, 30, -0.7),

-- F8: MCQ
('QNT_F8_MCQ', 'QNT', 'FOUNDATION', 'CALCULATION', 'MCQ',
'In a class of 30 students, 18 are female.',
'What percentage of the class is female?',
'{"A": "18%", "B": "40%", "C": "60%", "D": "80%"}',
'"C"',
1.0, FALSE, 35, -0.8),

-- F9: Binary Rapid
('QNT_F9_BIN', 'QNT', 'FOUNDATION', 'INTERPRETATION', 'BINARY_RAPID',
'**Hospital A:** 94% patient satisfaction
**Hospital B:** 89% patient satisfaction',
'Which hospital has HIGHER patient satisfaction?',
'["Hospital A", "Hospital B"]',
'"Hospital A"',
1.0, FALSE, 12, -1.0),

-- F10: Table Read
('QNT_F10_TBL', 'QNT', 'FOUNDATION', 'INTERPRETATION', 'TABLE_READ',
'| Train | Depart | Arrive | Changes |
|-------|--------|--------|---------|
| 08:15 | London | 10:45 | 0 |
| 08:30 | London | 10:30 | 1 |
| 09:00 | London | 11:00 | 0 |
| 09:15 | London | 11:15 | 2 |',
'Which direct train (0 changes) arrives earliest?',
'["08:15 train", "08:30 train", "09:00 train", "09:15 train"]',
'"08:15 train"',
1.0, FALSE, 35, -0.6),

-- F11: Estimation
('QNT_F11_EST', 'QNT', 'FOUNDATION', 'CALCULATION', 'ESTIMATION',
'The UK population is about 67 million. About 15% are under 18.',
'Roughly how many under-18s are in the UK?',
'{"ranges": ["5-7 million", "8-12 million", "13-17 million", "18+ million"]}',
'{"correct_range": 1, "exact_answer": 10050000}',
1.0, TRUE, 35, -0.5),

-- F12: Short Response
('QNT_F12_SHT', 'QNT', 'FOUNDATION', 'REASONING', 'SHORT_RESPONSE',
'A graph shows ice cream sales and drowning deaths both increase in summer.',
'Why doesn''t this mean ice cream causes drowning? (One sentence)',
'{"char_limit": 80}',
'{"key_concepts": ["hot weather causes both", "coincidence", "correlation not causation", "third variable"], "rubric": {"2": "Identifies confounding variable (weather/summer)", "1": "Says correlation not causation but no explanation", "0": "Misses point"}}',
2.0, FALSE, 45, -0.4);

-- ============================================
-- QNT STANDARD TIER (S1-S12)
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- S1: MCQ
('QNT_S1_MCQ', 'QNT', 'STANDARD', 'REASONING', 'MCQ',
'| Quarter | Revenue | Costs |
|---------|---------|-------|
| Q1 | £2.4M | £1.8M |
| Q2 | £2.8M | £2.1M |
| Q3 | £2.6M | £2.0M |

The CEO claims "profit is trending upward."',
'Is this claim accurate?',
'{"A": "Yes — Q2 profit was highest", "B": "No — Q3 profit declined from Q2", "C": "Misleading — profit is volatile, no clear trend", "D": "Cannot determine from this data"}',
'"C"',
1.0, FALSE, 45, 0.3),

-- S2: Table Read
('QNT_S2_TBL', 'QNT', 'STANDARD', 'INTERPRETATION', 'TABLE_READ',
'| University | Graduate Salary (median) | Employment Rate | Student Satisfaction |
|------------|--------------------------|-----------------|---------------------|
| Bristol | £32,000 | 89% | 78% |
| Exeter | £29,500 | 92% | 84% |
| Bath | £34,500 | 87% | 81% |
| Cardiff | £27,000 | 85% | 82% |',
'Which university has the best employment rate?',
'["Bristol", "Exeter", "Bath", "Cardiff"]',
'"Exeter"',
1.0, FALSE, 40, 0.1),

-- S3: Short Response
('QNT_S3_SHT', 'QNT', 'STANDARD', 'REASONING', 'SHORT_RESPONSE',
'Bristol has 85% graduate employment (200 students surveyed).
Exeter has 82% graduate employment (50 students surveyed).
Your friend says "Bristol is clearly better for jobs."',
'Why might this comparison be unreliable? (One sentence)',
'{"char_limit": 120}',
'{"key_concepts": ["sample size", "smaller sample less reliable", "could be chance", "margin of error"], "rubric": {"2": "Identifies sample size AND explains why it matters", "1": "Mentions sample size without explanation", "0": "Misses the statistical point"}}',
2.0, FALSE, 55, 0.4),

-- S4: Binary Rapid
('QNT_S4_BIN', 'QNT', 'STANDARD', 'REASONING', 'BINARY_RAPID',
'**Data:** Countries that spend more on education have higher GDPs.
**Claim:** "Increasing education spending will grow the economy."',
'Does this data PROVE or NOT PROVE the claim?',
'["PROVE", "NOT PROVE"]',
'"NOT PROVE"',
1.0, FALSE, 15, 0.2),

-- S5: MCQ
('QNT_S5_MCQ', 'QNT', 'STANDARD', 'CALCULATION', 'MCQ',
'A company''s revenue grew from £2 million to £2.5 million.',
'What was the percentage increase?',
'{"A": "5%", "B": "20%", "C": "25%", "D": "50%"}',
'"C"',
1.0, FALSE, 45, 0.2),

-- S6: Table Read
('QNT_S6_TBL', 'QNT', 'STANDARD', 'INTERPRETATION', 'TABLE_READ',
'| Course | Applications | Offers | Acceptance Rate |
|--------|--------------|--------|-----------------|
| Medicine | 23,000 | 8,100 | 35% |
| Law | 42,000 | 29,400 | 70% |
| Engineering | 31,000 | 24,800 | 80% |
| English | 18,000 | 15,300 | 85% |',
'Which course had the most applicants NOT receiving offers?',
'["Medicine", "Law", "Engineering", "English"]',
'"Medicine"',
1.0, FALSE, 45, 0.5),

-- S7: Binary Rapid
('QNT_S7_BIN', 'QNT', 'STANDARD', 'REASONING', 'BINARY_RAPID',
'**Data:** Average house price rose from £250k to £275k (10% increase). Average salary rose from £30k to £31.5k (5% increase).
**Claim:** "Housing became more affordable this year."',
'Is this claim SUPPORTED or CONTRADICTED by the data?',
'["SUPPORTED", "CONTRADICTED"]',
'"CONTRADICTED"',
1.0, FALSE, 15, 0.3),

-- S8: Estimation
('QNT_S8_EST', 'QNT', 'STANDARD', 'CALCULATION', 'ESTIMATION',
'A university has 25,000 students. 40% live in university accommodation. The university charges £150/week for accommodation over a 40-week year.',
'Roughly what is the university''s total accommodation revenue?',
'{"ranges": ["£30-45 million", "£50-70 million", "£75-100 million", "£100M+"]}',
'{"correct_range": 1, "exact_answer": 60000000}',
1.0, TRUE, 40, 0.5),

-- S9: Short Response
('QNT_S9_SHT', 'QNT', 'STANDARD', 'REASONING', 'SHORT_RESPONSE',
'A university reports "95% graduate employment" but only surveyed graduates who responded to emails 6 months after graduation.',
'Why might this figure be misleading? (One sentence)',
'{"char_limit": 120}',
'{"key_concepts": ["non-response bias", "employed more likely to respond", "unemployed harder to reach", "selection bias"], "rubric": {"2": "Identifies non-response/selection bias with explanation", "1": "Mentions bias without clear explanation", "0": "Misses the point"}}',
2.0, FALSE, 55, 0.4),

-- S10: MCQ
('QNT_S10_MCQ', 'QNT', 'STANDARD', 'REASONING', 'MCQ',
'Hospital A has a 5% mortality rate and treats mostly high-risk patients.
Hospital B has a 3% mortality rate and treats mostly low-risk patients.',
'What can we conclude?',
'{"A": "Hospital B provides better care", "B": "Hospital A provides better care", "C": "We cannot compare quality without adjusting for patient risk", "D": "Both hospitals are equally good"}',
'"C"',
1.0, FALSE, 45, 0.4),

-- S11: Prioritise & Select
('QNT_S11_PRI', 'QNT', 'STANDARD', 'REASONING', 'PRIORITISE_SELECT',
'You''re choosing a mobile phone contract. You care about value for money.',
'Select the 3 most relevant data points:',
'{"options": ["Monthly cost", "Company''s stock price", "Data allowance included", "Number of retail stores", "Cost per GB of data", "Company founding year", "Celebrity endorsements"], "select_count": 3}',
'{"high_value": [0, 2, 4], "medium_value": [], "low_value": [1, 3, 5, 6]}',
2.0, TRUE, 55, 0.3),

-- S12: Table Read
('QNT_S12_TBL', 'QNT', 'STANDARD', 'INTERPRETATION', 'TABLE_READ',
'| Year | Applications | Acceptances | Rate |
|------|--------------|-------------|------|
| 2020 | 10,000 | 8,500 | 85% |
| 2021 | 12,000 | 9,600 | 80% |
| 2022 | 15,000 | 11,250 | 75% |
| 2023 | 18,000 | 12,600 | 70% |',
'What trend do the acceptance rates show?',
'{"A": "Increasing steadily", "B": "Decreasing steadily", "C": "Fluctuating randomly", "D": "Staying constant"}',
'"B"',
1.0, FALSE, 45, 0.2);

-- ============================================
-- QNT CHALLENGE TIER (C1-C12)
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- C1: MCQ
('QNT_C1_MCQ', 'QNT', 'CHALLENGE', 'REASONING', 'MCQ',
'| Year | Inflation | Wage Growth |
|------|-----------|-------------|
| 2021 | 2.5% | 3.0% |
| 2022 | 9.1% | 5.5% |
| 2023 | 6.7% | 6.2% |
| 2024 | 3.4% | 5.8% |',
'In which year did workers'' purchasing power improve the most?',
'{"A": "2021", "B": "2022", "C": "2023", "D": "2024"}',
'"D"',
1.0, FALSE, 50, 1.0),

-- C2: Estimation
('QNT_C2_EST', 'QNT', 'CHALLENGE', 'CALCULATION', 'ESTIMATION',
'The NHS employs approximately 1.5 million people. About 8% are doctors.',
'Roughly how many NHS doctors are there?',
'{"ranges": ["10,000 - 50,000", "50,000 - 100,000", "100,000 - 150,000", "150,000 - 250,000"]}',
'{"correct_range": 2, "exact_answer": 120000}',
1.0, TRUE, 40, 0.8),

-- C3: Prioritise & Select
('QNT_C3_PRI', 'QNT', 'CHALLENGE', 'REASONING', 'PRIORITISE_SELECT',
'You''re advising a student choosing between Computer Science degrees. They care most about career outcomes.',
'Select the 3 most relevant data points:',
'{"options": ["University ranking in national league table", "Graduate salary 5 years after completion", "Number of students on the course", "Percentage of graduates in professional employment", "Student satisfaction with teaching quality", "University''s founding date", "Salary premium vs non-graduates in same field", "Number of Nobel laureates at the university"], "select_count": 3}',
'{"high_value": [1, 3, 6], "medium_value": [0, 4], "low_value": [2, 5, 7]}',
2.0, TRUE, 65, 1.1),

-- C4: Short Response
('QNT_C4_SHT', 'QNT', 'CHALLENGE', 'REASONING', 'SHORT_RESPONSE',
'A headline reads: "Private school students are 3x more likely to attend Oxford than state school students."

A politician concludes: "Private schools must be better at preparing students for elite universities."',
'What alternative explanation might account for this data? (One sentence)',
'{"char_limit": 140}',
'{"key_concepts": ["wealth/resources", "selection effect", "tutors/test prep", "family advantages", "confounding variables"], "rubric": {"2": "Identifies confounding variable with mechanism", "1": "Mentions alternative factor without explanation", "0": "Restates claim or misses point"}}',
2.0, FALSE, 60, 1.2),

-- C5: MCQ (Simpson's Paradox)
('QNT_C5_MCQ', 'QNT', 'CHALLENGE', 'REASONING', 'MCQ',
'**University A:** 40% of male applicants admitted, 35% of female applicants admitted.
**University B:** 45% of male applicants admitted, 40% of female applicants admitted.

When data from both universities is combined, female applicants have a higher overall admission rate than males.',
'How is this possible?',
'{"A": "The data must be wrong", "B": "Females may apply more to the university with higher overall admission rates", "C": "Universities discriminate against males", "D": "Sample sizes were too small"}',
'"B"',
1.0, FALSE, 55, 1.4),

-- C6: Estimation
('QNT_C6_EST', 'QNT', 'CHALLENGE', 'CALCULATION', 'ESTIMATION',
'The UK has ~32 million households. About 25% have solar panels. A typical solar installation saves £400/year on electricity.',
'Roughly how much do UK households save in total from solar annually?',
'{"ranges": ["£1-2 billion", "£2.5-4 billion", "£5-8 billion", "£10B+"]}',
'{"correct_range": 1, "exact_answer": 3200000000}',
1.0, TRUE, 45, 1.0),

-- C7: Short Response
('QNT_C7_SHT', 'QNT', 'CHALLENGE', 'REASONING', 'SHORT_RESPONSE',
'A clinical trial reports a drug reduced heart attacks by 50% (from 2 in 1,000 patients to 1 in 1,000). The headline reads: "Wonder drug halves heart attack risk!"',
'Why might "50% reduction" be misleading here? (One sentence)',
'{"char_limit": 130}',
'{"key_concepts": ["absolute vs relative risk", "tiny absolute difference", "0.1% vs 50%", "1 in 1000 change"], "rubric": {"2": "Distinguishes absolute from relative risk with numbers", "1": "Mentions the distinction vaguely", "0": "Misses the point"}}',
2.0, FALSE, 60, 1.3),

-- C8: MCQ (Base Rate)
('QNT_C8_MCQ', 'QNT', 'CHALLENGE', 'REASONING', 'MCQ',
'A disease affects 1 in 1,000 people. A test for the disease is 99% accurate (correctly identifies 99% of sick people and 99% of healthy people). You test positive.',
'What is the approximate probability you actually have the disease?',
'{"A": "99%", "B": "90%", "C": "50%", "D": "About 10%"}',
'"D"',
1.0, FALSE, 50, 1.5),

-- C9: Binary Rapid
('QNT_C9_BIN', 'QNT', 'CHALLENGE', 'REASONING', 'BINARY_RAPID',
'**Data:** Jan: £10k revenue, Feb: £12k, Mar: £11k, Apr: £13k, May: £12k
**Claim:** "Revenue is on a clear upward trend."',
'Is this claim JUSTIFIED or UNJUSTIFIED?',
'["JUSTIFIED", "UNJUSTIFIED"]',
'"UNJUSTIFIED"',
1.0, FALSE, 15, 0.9),

-- C10: Prioritise & Select
('QNT_C10_PRI', 'QNT', 'CHALLENGE', 'REASONING', 'PRIORITISE_SELECT',
'You''re evaluating whether to invest in a startup.',
'Select the 4 most important metrics:',
'{"options": ["Revenue growth rate", "Founder''s university degree", "Customer acquisition cost", "Office location", "Monthly burn rate", "Number of social media followers", "Runway (months until cash runs out)", "Logo design quality", "Number of employees"], "select_count": 4}',
'{"high_value": [0, 2, 4, 6], "medium_value": [8], "low_value": [1, 3, 5, 7]}',
2.0, TRUE, 65, 1.2),

-- C11: Table Read (Weighted)
('QNT_C11_TBL', 'QNT', 'CHALLENGE', 'INTERPRETATION', 'TABLE_READ',
'| School | Maths (40%) | English (30%) | Science (30%) |
|--------|-------------|---------------|---------------|
| Academy A | 72 | 68 | 75 |
| Academy B | 65 | 78 | 70 |
| Academy C | 70 | 70 | 72 |',
'If you weight subjects as shown, which school has the highest weighted average?',
'["Academy A", "Academy B", "Academy C"]',
'"Academy A"',
1.0, FALSE, 50, 1.1),

-- C12: Short Response
('QNT_C12_SHT', 'QNT', 'CHALLENGE', 'REASONING', 'SHORT_RESPONSE',
'A study found people who drink wine daily live longer than non-drinkers. Researchers concluded moderate alcohol consumption improves longevity.',
'What major flaw exists in jumping to this conclusion? (One sentence)',
'{"char_limit": 140}',
'{"key_concepts": ["sick quitter effect", "non-drinkers include ex-alcoholics", "selection bias", "unhealthy comparison group", "wealth/lifestyle confound"], "rubric": {"2": "Identifies selection/confounding issue with mechanism", "1": "Mentions correlation vs causation generically", "0": "Misses the point"}}',
2.0, FALSE, 60, 1.3);

-- ============================================
-- VERIFY
-- ============================================

SELECT 
  capacity_type,
  tier,
  COUNT(*) as item_count
FROM bo_v1_capacity_items
WHERE capacity_type = 'QNT'
GROUP BY capacity_type, tier
ORDER BY tier;

-- Expected output:
-- QNT | FOUNDATION | 12
-- QNT | STANDARD   | 12
-- QNT | CHALLENGE  | 12

-- Full summary
SELECT 
  capacity_type,
  COUNT(*) as total_items,
  COUNT(*) FILTER (WHERE tier = 'FOUNDATION') as foundation,
  COUNT(*) FILTER (WHERE tier = 'STANDARD') as standard,
  COUNT(*) FILTER (WHERE tier = 'CHALLENGE') as challenge
FROM bo_v1_capacity_items
GROUP BY capacity_type;

-- Expected:
-- VRB | 36 | 12 | 12 | 12
-- QNT | 36 | 12 | 12 | 12
