-- ExamRizz Arena - VRB Capacity Benchmark Items
-- 36 items across 3 difficulty tiers
-- Run after main schema (001_schema.sql)

-- ============================================
-- VRB ITEMS TABLE (if not using existing bo_v1_experiential_tasks)
-- ============================================

CREATE TABLE IF NOT EXISTS bo_v1_capacity_items (
  id TEXT PRIMARY KEY,
  capacity_type TEXT NOT NULL CHECK (capacity_type IN ('VRB', 'QNT', 'ABS', 'SPD')),
  tier TEXT NOT NULL CHECK (tier IN ('FOUNDATION', 'STANDARD', 'CHALLENGE')),
  block TEXT NOT NULL,
  interaction_type TEXT NOT NULL CHECK (interaction_type IN (
    'MCQ', 'BINARY_RAPID', 'HIGHLIGHT_SELECT', 'SENTENCE_ORDER', 
    'SHORT_RESPONSE', 'PRIORITISE_SELECT', 'TABLE_READ', 'ESTIMATION'
  )),
  
  -- Content
  stimulus TEXT,                    -- Passage, setup text, or context
  question TEXT NOT NULL,
  options JSONB,                    -- For MCQ, prioritise, etc.
  correct_answer JSONB NOT NULL,    -- Flexible: string, array, object
  
  -- Scoring
  max_score NUMERIC(3,2) DEFAULT 1.0,
  partial_credit BOOLEAN DEFAULT FALSE,
  scoring_rubric JSONB,             -- For LLM-scored items
  
  -- Timing
  time_limit_seconds INTEGER NOT NULL,
  
  -- Metadata
  difficulty_irt NUMERIC(4,2),      -- IRT difficulty parameter
  discrimination NUMERIC(4,2),       -- IRT discrimination parameter
  uk_context BOOLEAN DEFAULT TRUE,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for CAT item selection
CREATE INDEX IF NOT EXISTS idx_capacity_items_selection 
ON bo_v1_capacity_items(capacity_type, tier, active);

-- ============================================
-- VRB FOUNDATION TIER (F1-F12)
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- F1: Binary Rapid
('VRB_F1_BIN', 'VRB', 'FOUNDATION', 'ARGUMENT', 'BINARY_RAPID',
'**Claim:** "The NHS is improving."

**Evidence:** "A&E waiting times fell from 4 hours 12 minutes to 3 hours 48 minutes last month."',
'Does this evidence STRENGTHEN or WEAKEN the claim?',
'["STRENGTHEN", "WEAKEN"]',
'"STRENGTHEN"',
1.0, FALSE, 12, -0.8),

-- F2: Highlight/Select
('VRB_F2_HLT', 'VRB', 'FOUNDATION', 'INFERENCE', 'HIGHLIGHT_SELECT',
'From September 2025, all new-build homes in England must include electric vehicle charging points. The Department for Transport said the move would "future-proof housing stock," though critics argue the grid cannot handle widespread EV adoption. Existing homes are **exempt** from the requirement.',
'Tap the word that tells you older houses won''t be affected.',
'["From", "September", "2025", "all", "new-build", "homes", "England", "must", "include", "electric", "vehicle", "charging", "points", "Department", "Transport", "future-proof", "housing", "stock", "critics", "argue", "grid", "cannot", "handle", "widespread", "EV", "adoption", "Existing", "homes", "exempt", "requirement"]',
'"exempt"',
1.0, FALSE, 25, -0.9),

-- F3: MCQ
('VRB_F3_MCQ', 'VRB', 'FOUNDATION', 'ARGUMENT', 'MCQ',
'Your school is debating whether to ban mobile phones. A student argues: "Phones should be banned because I saw someone using theirs to cheat on a test last week."',
'What is the main weakness in this argument?',
'{"A": "Cheating is acceptable in some circumstances", "B": "One incident doesn''t justify a blanket ban", "C": "The student might be lying", "D": "Teachers should monitor tests better"}',
'"B"',
1.0, FALSE, 35, -0.7),

-- F4: Sentence Ordering
('VRB_F4_ORD', 'VRB', 'FOUNDATION', 'SYNTHESIS', 'SENTENCE_ORDER',
'Arrange these sentences into a logical argument:',
'Put these in the correct order.',
'["Therefore, the railway should be built.", "HS2 will reduce journey times between London and Birmingham by 30 minutes.", "Faster journeys mean businesses can operate more efficiently.", "The government claims HS2 will boost the economy."]',
'[3, 1, 2, 0]',
1.0, TRUE, 40, -0.5),

-- F5: Binary Rapid
('VRB_F5_BIN', 'VRB', 'FOUNDATION', 'ARGUMENT', 'BINARY_RAPID',
'**Claim:** "Young people are reading less than previous generations."

**Evidence:** "Library borrowing by under-25s fell 34% between 2015 and 2023."',
'Does this evidence SUPPORT or NOT SUPPORT the claim?',
'["SUPPORT", "NOT SUPPORT"]',
'"NOT SUPPORT"',
1.0, FALSE, 12, -0.6),

-- F6: Highlight/Select
('VRB_F6_HLT', 'VRB', 'FOUNDATION', 'INFERENCE', 'HIGHLIGHT_SELECT',
'The government announced that NHS waiting lists had "stabilised" at 7.6 million. Health officials noted this was the first month without an increase since 2021, though opposition MPs argued that **stabilising** at record highs was not a success.',
'Tap the word being contested between the government and opposition.',
'["government", "announced", "NHS", "waiting", "lists", "stabilised", "7.6", "million", "Health", "officials", "noted", "first", "month", "without", "increase", "since", "2021", "opposition", "MPs", "argued", "stabilising", "record", "highs", "success"]',
'"stabilising"',
1.0, FALSE, 25, -0.8),

-- F7: MCQ
('VRB_F7_MCQ', 'VRB', 'FOUNDATION', 'INFERENCE', 'MCQ',
'Transport for London announced that the Elizabeth Line carried 350 million passengers in its first full year, exceeding forecasts by 40%. TfL said the line had "transformed east-west travel" across the capital.',
'What can be concluded from this passage?',
'{"A": "The Elizabeth Line is the busiest in London", "B": "More people used the line than TfL expected", "C": "Other tube lines lost passengers", "D": "The line will be extended soon"}',
'"B"',
1.0, FALSE, 35, -0.9),

-- F8: Sentence Ordering
('VRB_F8_ORD', 'VRB', 'FOUNDATION', 'SYNTHESIS', 'SENTENCE_ORDER',
'Arrange these sentences into a logical argument:',
'Put these in the correct order.',
'["Therefore, students should be taught financial literacy in schools.", "Many young people struggle to manage money after leaving home.", "Research shows that early financial education improves long-term outcomes.", "Currently, personal finance is not a compulsory subject."]',
'[1, 3, 2, 0]',
1.0, TRUE, 40, -0.5),

-- F9: Binary Rapid
('VRB_F9_BIN', 'VRB', 'FOUNDATION', 'ARGUMENT', 'BINARY_RAPID',
'"All doctors study biology. Sarah studies biology. Therefore, Sarah is a doctor."',
'Is this reasoning VALID or INVALID?',
'["VALID", "INVALID"]',
'"INVALID"',
1.0, FALSE, 12, -0.4),

-- F10: Highlight/Select
('VRB_F10_HLT', 'VRB', 'FOUNDATION', 'INFERENCE', 'HIGHLIGHT_SELECT',
'The proposed bypass would cut journey times by 12 minutes. Supporters call it "essential infrastructure," while critics dismiss it as an **expensive white elephant** that will simply shift congestion elsewhere.',
'Tap the phrase that reveals the critics'' view of the project.',
'["proposed bypass", "cut journey times", "12 minutes", "Supporters", "essential infrastructure", "critics", "expensive white elephant", "shift congestion", "elsewhere"]',
'"expensive white elephant"',
1.0, FALSE, 28, -0.7),

-- F11: MCQ
('VRB_F11_MCQ', 'VRB', 'FOUNDATION', 'ARGUMENT', 'MCQ',
'A student argues: "We shouldn''t have school uniforms because they''re uncomfortable and nobody likes wearing them."',
'What type of evidence would most strengthen this argument?',
'{"A": "A survey showing most students dislike uniforms", "B": "The student''s personal experience", "C": "A photo of an uncomfortable uniform", "D": "A quote from a fashion designer"}',
'"A"',
1.0, FALSE, 35, -0.6),

-- F12: Short Response
('VRB_F12_SHT', 'VRB', 'FOUNDATION', 'SYNTHESIS', 'SHORT_RESPONSE',
'**Headline A:** "Teen mental health crisis worsens"
**Headline B:** "More teens seeking mental health support than ever"',
'Why might both headlines be true at the same time? (One sentence)',
'{"char_limit": 100}',
'{"key_concepts": ["awareness increased", "both happening", "more problems AND more help-seeking"], "rubric": {"2": "Explains how both can coexist (awareness, parallel trends)", "1": "Partially correct idea", "0": "Says they contradict or misses point"}}',
2.0, FALSE, 50, -0.5);

-- ============================================
-- VRB STANDARD TIER (S1-S12)
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- S1: MCQ
('VRB_S1_MCQ', 'VRB', 'STANDARD', 'INFERENCE', 'MCQ',
'The Bank of England held interest rates at 5.25% for the fourth consecutive meeting, despite inflation falling to 3.4%. Governor Andrew Bailey stated the Monetary Policy Committee needed "more evidence that inflation is sustainably returning to target" before considering cuts. Markets had priced in a 60% chance of a reduction.',
'What does the passage suggest about the Bank''s approach?',
'{"A": "The Bank is ignoring inflation data entirely", "B": "The Bank prioritises sustained trends over single data points", "C": "The Bank always follows market expectations", "D": "Interest rates will definitely fall next month"}',
'"B"',
1.0, FALSE, 45, 0.2),

-- S2: Short Response
('VRB_S2_SHT', 'VRB', 'STANDARD', 'ARGUMENT', 'SHORT_RESPONSE',
'A study found that grammar school students achieve higher A-level grades than comprehensive school students. A newspaper headline reads: "Grammar schools proven to boost results."',
'In one sentence, explain why this headline may be misleading.',
'{"char_limit": 120}',
'{"key_concepts": ["selection bias", "confounding", "students already clever", "can''t tell if school caused it"], "rubric": {"2": "Identifies selection effect with clear reasoning", "1": "Mentions relevant factor vaguely", "0": "Misses the point"}}',
2.0, FALSE, 55, 0.3),

-- S3: Binary Rapid
('VRB_S3_BIN', 'VRB', 'STANDARD', 'ARGUMENT', 'BINARY_RAPID',
'**Argument:** "Our ancestors didn''t eat processed food and had no obesity. Therefore, processed food causes obesity."',
'Is this argument VALID or FLAWED?',
'["VALID", "FLAWED"]',
'"FLAWED"',
1.0, FALSE, 15, 0.1),

-- S4: Highlight/Select
('VRB_S4_HLT', 'VRB', 'STANDARD', 'INFERENCE', 'HIGHLIGHT_SELECT',
'The relationship between social media use and adolescent mental health remains contested. A 2023 meta-analysis found a statistically significant but small correlation (r = 0.12) between screen time and depressive symptoms. Effect sizes are comparable to those of eating potatoes.',
'Tap the phrase the author uses to suggest the correlation is trivial.',
'["relationship", "social media use", "adolescent mental health", "remains contested", "2023 meta-analysis", "statistically significant but small", "correlation", "r = 0.12", "screen time", "depressive symptoms", "Effect sizes", "comparable", "eating potatoes"]',
'"eating potatoes"',
1.0, FALSE, 30, 0.4),

-- S5: MCQ
('VRB_S5_MCQ', 'VRB', 'STANDARD', 'ARGUMENT', 'MCQ',
'A council argues: "Building a new leisure centre will improve public health in the area. The current facility is outdated and underused. A modern centre with better equipment will attract more visitors."',
'Which assumption is this argument most dependent on?',
'{"A": "The current centre is definitely outdated", "B": "People will use modern facilities more than old ones", "C": "Public health is important", "D": "The council has enough money"}',
'"B"',
1.0, FALSE, 45, 0.3),

-- S6: Sentence Ordering
('VRB_S6_ORD', 'VRB', 'STANDARD', 'SYNTHESIS', 'SENTENCE_ORDER',
'Arrange these sentences into a coherent paragraph:',
'Put these in the correct order.',
'["Nevertheless, the economic benefits may outweigh these concerns.", "Critics argue that airport expansion will increase noise pollution for local residents.", "A third runway at Heathrow has been debated for decades.", "Studies suggest the expansion could create 180,000 jobs across the UK.", "The question is whether growth should come at any cost."]',
'[2, 1, 3, 0, 4]',
1.0, TRUE, 45, 0.5),

-- S7: Highlight/Select
('VRB_S7_HLT', 'VRB', 'STANDARD', 'INFERENCE', 'HIGHLIGHT_SELECT',
'The minister defended the policy by claiming it would "level the playing field" for disadvantaged students. Critics responded that the changes amounted to little more than **rearranging deckchairs on the Titanic** — superficial adjustments that ignore fundamental inequalities.',
'Tap the phrase critics use to suggest the policy is inadequate.',
'["minister defended", "level the playing field", "disadvantaged students", "Critics responded", "changes amounted", "rearranging deckchairs on the Titanic", "superficial adjustments", "fundamental inequalities"]',
'"rearranging deckchairs on the Titanic"',
1.0, FALSE, 30, 0.2),

-- S8: Short Response
('VRB_S8_SHT', 'VRB', 'STANDARD', 'ARGUMENT', 'SHORT_RESPONSE',
'**Argument:** "University tuition fees should be abolished because they discourage students from low-income backgrounds from applying."',
'What evidence would most strengthen this argument? (One sentence)',
'{"char_limit": 120}',
'{"key_concepts": ["data on application rates", "comparison before/after fees", "comparison with countries without fees", "low-income application drop"], "rubric": {"2": "Specific evidence type that would test the causal claim", "1": "Relevant but vague", "0": "Restates premise or irrelevant"}}',
2.0, FALSE, 55, 0.4),

-- S9: Binary Rapid
('VRB_S9_BIN', 'VRB', 'STANDARD', 'ARGUMENT', 'BINARY_RAPID',
'**Debate:** Should the UK adopt a four-day working week?

**Statement:** "France has more public holidays than the UK."',
'Is this statement RELEVANT or IRRELEVANT to the debate?',
'["RELEVANT", "IRRELEVANT"]',
'"IRRELEVANT"',
1.0, FALSE, 15, 0.1),

-- S10: MCQ
('VRB_S10_MCQ', 'VRB', 'STANDARD', 'INFERENCE', 'MCQ',
'A study tracked 5,000 UK students and found those who ate breakfast daily scored on average 8% higher in GCSE exams than those who skipped breakfast. The researchers noted that "breakfast appears to be linked to academic performance" but cautioned that the study was observational.',
'Why did the researchers add a caution?',
'{"A": "The sample size was too small", "B": "They couldn''t prove breakfast caused better results", "C": "Some students lied about eating breakfast", "D": "GCSE exams are unreliable"}',
'"B"',
1.0, FALSE, 45, 0.2),

-- S11: Prioritise & Select
('VRB_S11_PRI', 'VRB', 'STANDARD', 'SYNTHESIS', 'PRIORITISE_SELECT',
'You''re evaluating whether a new teaching method works.',
'Select the 3 strongest types of evidence:',
'{"options": ["A randomised controlled trial comparing the method to standard teaching", "A teacher saying ''my students seemed more engaged''", "A meta-analysis of 30 studies on the method", "The method''s inventor claiming it works", "A longitudinal study tracking students for 5 years", "A newspaper article about a school using the method", "Student satisfaction surveys"], "select_count": 3}',
'{"high_value": [0, 2, 4], "medium_value": [6], "low_value": [1, 3, 5]}',
2.0, TRUE, 60, 0.5),

-- S12: Sentence Ordering
('VRB_S12_ORD', 'VRB', 'STANDARD', 'SYNTHESIS', 'SENTENCE_ORDER',
'Arrange these sentences into a coherent academic paragraph:',
'Put these in the correct order.',
'["This suggests that intrinsic motivation may matter more than external rewards.", "Students who reported enjoying the subject scored higher regardless of incentives.", "A recent study examined whether offering prizes improved student performance.", "Surprisingly, the prize group showed no significant improvement over the control."]',
'[2, 3, 1, 0]',
1.0, TRUE, 45, 0.4);

-- ============================================
-- VRB CHALLENGE TIER (C1-C12)
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- C1: Sentence Ordering
('VRB_C1_ORD', 'VRB', 'CHALLENGE', 'SYNTHESIS', 'SENTENCE_ORDER',
'Arrange these sentences into a coherent academic paragraph:',
'Put these in the correct order.',
'["However, longitudinal studies suggest the relationship may be bidirectional.", "This raises the possibility that adolescents with pre-existing difficulties gravitate toward social media, rather than social media causing harm.", "Cross-sectional research has linked social media use to increased anxiety in teenagers.", "Future research should therefore control for baseline mental health before drawing causal conclusions.", "The question of causation remains unresolved."]',
'[2, 0, 1, 4, 3]',
1.0, TRUE, 50, 1.2),

-- C2: MCQ
('VRB_C2_MCQ', 'VRB', 'CHALLENGE', 'ARGUMENT', 'MCQ',
'A libertarian philosopher argues: "Taxation is morally equivalent to forced labour. If I work for £100 and the government takes £40, I have effectively been forced to work 40% of my time for the state without consent. Forced labour is slavery. Therefore, taxation is a form of slavery."',
'Which response best challenges the argument''s reasoning?',
'{"A": "Most people don''t mind paying taxes", "B": "Taxes fund essential services like hospitals", "C": "The analogy fails because taxpayers can leave or vote, unlike slaves", "D": "The government doesn''t literally force people to work"}',
'"C"',
1.0, FALSE, 50, 1.0),

-- C3: Prioritise & Select
('VRB_C3_PRI', 'VRB', 'CHALLENGE', 'SYNTHESIS', 'PRIORITISE_SELECT',
'You''re writing an EPQ on whether social media harms teenage mental health. You have time to deeply analyse 4 sources.',
'Select the 4 most valuable sources:',
'{"options": ["A TikTok influencer''s video: ''Social media ruined my life''", "A 2023 meta-analysis of 50 longitudinal studies", "Your friend''s personal experience with Instagram", "A neuroscientist''s peer-reviewed paper on dopamine and notifications", "A Daily Mail headline: ''Phones are destroying our children''", "Meta''s internal research (leaked documents)", "A longitudinal study tracking 10,000 UK teenagers over 5 years", "An MP''s speech calling for smartphone bans in schools"], "select_count": 4}',
'{"high_value": [1, 3, 5, 6], "medium_value": [], "low_value": [0, 2, 4, 7]}',
2.0, TRUE, 70, 1.1),

-- C4: Short Response
('VRB_C4_SHT', 'VRB', 'CHALLENGE', 'INFERENCE', 'SHORT_RESPONSE',
'The Crown Prosecution Service announced it would not prosecute a doctor who administered a lethal dose of painkillers to a terminally ill patient who had repeatedly requested to die. The CPS stated that while the act was "technically unlawful," prosecution was "not in the public interest." Medical bodies warned the decision should not be seen as setting precedent.',
'What tension does this case reveal about how laws work in practice? (One sentence)',
'{"char_limit": 150}',
'{"key_concepts": ["law vs enforcement discretion", "gap between legal and prosecuted", "technical illegality vs practical application"], "rubric": {"2": "Clearly identifies law vs enforcement tension with articulation", "1": "Gets general idea but vague", "0": "Gives opinion or misses point"}}',
2.0, FALSE, 60, 1.3),

-- C5: MCQ
('VRB_C5_MCQ', 'VRB', 'CHALLENGE', 'INFERENCE', 'MCQ',
'Researchers found that countries with higher chocolate consumption per capita have more Nobel laureates per capita. Some journalists reported this as evidence that chocolate improves cognitive function. The original researchers called this interpretation "absurd" and noted the study was intended to illustrate the dangers of spurious correlations.',
'What was the researchers'' actual purpose?',
'{"A": "To prove chocolate makes people smarter", "B": "To warn against assuming correlation implies causation", "C": "To measure national intelligence levels", "D": "To encourage people to eat less chocolate"}',
'"B"',
1.0, FALSE, 50, 0.9),

-- C6: Short Response
('VRB_C6_SHT', 'VRB', 'CHALLENGE', 'ARGUMENT', 'SHORT_RESPONSE',
'**Argument:** "Standardised testing should be abolished because it causes student stress and doesn''t measure real-world skills."',
'Give the strongest counterargument in one sentence.',
'{"char_limit": 140}',
'{"key_concepts": ["objective comparison", "accountability", "identifies struggling students", "comparable data"], "rubric": {"2": "Strong counterargument with reasoning", "1": "Valid but weak counterargument", "0": "Not a counterargument or irrelevant"}}',
2.0, FALSE, 60, 1.0),

-- C7: Highlight/Select
('VRB_C7_HLT', 'VRB', 'CHALLENGE', 'INFERENCE', 'HIGHLIGHT_SELECT',
'The university announced it would be "reviewing" its diversity initiatives following government pressure. Senior staff privately acknowledged that "reviewing" in this context was **a euphemism** for scaling back programmes that had been in place for over a decade. Official communications emphasised the university''s "ongoing commitment to inclusion."',
'Tap the phrase that reveals what "reviewing" actually means.',
'["university announced", "reviewing", "diversity initiatives", "government pressure", "Senior staff", "privately acknowledged", "a euphemism", "scaling back programmes", "over a decade", "Official communications", "ongoing commitment", "inclusion"]',
'"a euphemism"',
1.0, FALSE, 35, 1.1),

-- C8: Sentence Ordering
('VRB_C8_ORD', 'VRB', 'CHALLENGE', 'SYNTHESIS', 'SENTENCE_ORDER',
'Arrange these sentences into a coherent academic paragraph:',
'Put these in the correct order.',
'["The implications for educational policy are significant but contested.", "However, critics argue that IQ tests measure test-taking ability rather than underlying intelligence.", "Intelligence research has long sought to identify factors that predict academic success.", "Meta-analyses consistently show IQ scores correlate with educational attainment.", "If the critics are correct, interventions targeting test preparation may be as effective as those targeting cognition.", "This debate remains unresolved despite decades of research."]',
'[2, 3, 1, 4, 0, 5]',
1.0, TRUE, 55, 1.4),

-- C9: Binary Rapid
('VRB_C9_BIN', 'VRB', 'CHALLENGE', 'ARGUMENT', 'BINARY_RAPID',
'"If the government cuts funding, the programme will fail. The programme failed. Therefore, the government cut funding."',
'Is this reasoning VALID or INVALID?',
'["VALID", "INVALID"]',
'"INVALID"',
1.0, FALSE, 15, 0.8),

-- C10: MCQ
('VRB_C10_MCQ', 'VRB', 'CHALLENGE', 'ARGUMENT', 'MCQ',
'A report on school discipline found that Black Caribbean students were three times more likely to be permanently excluded than white British students. The report noted this disparity persisted even after controlling for socioeconomic factors and prior behaviour. Some commentators attributed the gap to "cultural differences in family structure."',
'What is problematic about the commentators'' explanation?',
'{"A": "It contradicts the report''s data", "B": "It shifts focus from institutional factors to blaming a group", "C": "Family structure cannot affect behaviour", "D": "The data sample was too small"}',
'"B"',
1.0, FALSE, 50, 1.2),

-- C11: Prioritise & Select
('VRB_C11_PRI', 'VRB', 'CHALLENGE', 'SYNTHESIS', 'PRIORITISE_SELECT',
'The government claims a new housing policy has succeeded.',
'Select the 4 most important questions to evaluate this claim:',
'{"options": ["What were the policy''s stated objectives?", "Has the minister been in the role long?", "What metrics are being used to measure success?", "Did house prices go up or down?", "What would have happened without the policy?", "Do most people like the policy?", "Were there unintended negative consequences?", "How much did the policy cost?", "What do opposition MPs think?"], "select_count": 4}',
'{"high_value": [0, 2, 4, 6], "medium_value": [3, 7], "low_value": [1, 5, 8]}',
2.0, TRUE, 70, 1.3),

-- C12: Short Response
('VRB_C12_SHT', 'VRB', 'CHALLENGE', 'SYNTHESIS', 'SHORT_RESPONSE',
'**Source A:** "Grammar schools improve social mobility by giving bright poor children access to excellent education."

**Source B:** "Grammar schools reduce social mobility because middle-class families dominate the selection process."',
'What key information would help resolve this disagreement? (One sentence)',
'{"char_limit": 150}',
'{"key_concepts": ["socioeconomic data on who gets in", "outcomes compared to comprehensives", "tracking students over time", "controlling for prior ability"], "rubric": {"2": "Specific evidence that would test both claims", "1": "Relevant but vague", "0": "Doesn''t address resolution"}}',
2.0, FALSE, 65, 1.4);

-- ============================================
-- ENABLE RLS
-- ============================================

ALTER TABLE bo_v1_capacity_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow public read" ON bo_v1_capacity_items FOR SELECT USING (true);

-- ============================================
-- VERIFY
-- ============================================

SELECT 
  capacity_type,
  tier,
  COUNT(*) as item_count
FROM bo_v1_capacity_items
WHERE capacity_type = 'VRB'
GROUP BY capacity_type, tier
ORDER BY tier;

-- Expected output:
-- VRB | FOUNDATION | 12
-- VRB | STANDARD   | 12
-- VRB | CHALLENGE  | 12
