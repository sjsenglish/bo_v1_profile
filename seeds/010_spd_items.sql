-- ExamRizz Arena - SPD (Processing Speed) Capacity Benchmark Items
-- 40 items across 3 difficulty tiers
-- Focus: Rapid accurate discrimination under time pressure
-- Run after 007_vrb_items.sql (uses same bo_v1_capacity_items table)

-- ============================================
-- SPD FOUNDATION TIER (F1-F15)
-- Simple discrimination, 5-8 second time limits
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- F1: Binary Rapid - Word meaning
('SPD_F1_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'HAPPY and JOYFUL — Same or different meaning?',
'["SAME", "DIFFERENT"]',
'"SAME"',
1.0, FALSE, 6, -1.2),

-- F2: Binary Rapid - Word meaning
('SPD_F2_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'EXPAND and CONTRACT — Same or different meaning?',
'["SAME", "DIFFERENT"]',
'"DIFFERENT"',
1.0, FALSE, 6, -1.1),

-- F3: Binary Rapid - Number comparison
('SPD_F3_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is 847 greater than 784?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 5, -1.3),

-- F4: Binary Rapid - Number comparison
('SPD_F4_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is 0.45 greater than 0.54?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 5, -1.0),

-- F5: Binary Rapid - Sequence match
('SPD_F5_BIN', 'SPD', 'FOUNDATION', 'PATTERN', 'BINARY_RAPID',
NULL,
'ABCDE and ABCDE — Identical?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 5, -1.4),

-- F6: Binary Rapid - Sequence match
('SPD_F6_BIN', 'SPD', 'FOUNDATION', 'PATTERN', 'BINARY_RAPID',
NULL,
'MNOPQ and MNOQP — Identical?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 6, -1.0),

-- F7: Binary Rapid - Spelling verification
('SPD_F7_BIN', 'SPD', 'FOUNDATION', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is "necessary" spelled correctly?',
'["CORRECT", "INCORRECT"]',
'"CORRECT"',
1.0, FALSE, 6, -0.9),

-- F8: Binary Rapid - Spelling verification
('SPD_F8_BIN', 'SPD', 'FOUNDATION', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is "recieve" spelled correctly?',
'["CORRECT", "INCORRECT"]',
'"INCORRECT"',
1.0, FALSE, 6, -0.8),

-- F9: Binary Rapid - Basic arithmetic check
('SPD_F9_BIN', 'SPD', 'FOUNDATION', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is 7 × 8 = 56 correct?',
'["CORRECT", "INCORRECT"]',
'"CORRECT"',
1.0, FALSE, 5, -1.2),

-- F10: Binary Rapid - Basic arithmetic check
('SPD_F10_BIN', 'SPD', 'FOUNDATION', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is 9 × 6 = 52 correct?',
'["CORRECT", "INCORRECT"]',
'"INCORRECT"',
1.0, FALSE, 5, -1.1),

-- F11: Binary Rapid - Category membership
('SPD_F11_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is SALMON a type of fish?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 5, -1.3),

-- F12: Binary Rapid - Category membership
('SPD_F12_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is PENGUIN a type of mammal?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 5, -1.2),

-- F13: Binary Rapid - Letter pattern
('SPD_F13_BIN', 'SPD', 'FOUNDATION', 'PATTERN', 'BINARY_RAPID',
NULL,
'In "ELEPHANT" — does E appear more than once?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 7, -0.9),

-- F14: Binary Rapid - Odd/even
('SPD_F14_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is 847 an odd number?',
'["ODD", "EVEN"]',
'"ODD"',
1.0, FALSE, 5, -1.1),

-- F15: Binary Rapid - UK geography
('SPD_F15_BIN', 'SPD', 'FOUNDATION', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is Manchester north of London?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 5, -1.0);

-- ============================================
-- SPD STANDARD TIER (S1-S15)
-- Pattern matching under pressure, 6-10 second limits
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- S1: Binary Rapid - Code comparison
('SPD_S1_BIN', 'SPD', 'STANDARD', 'PATTERN', 'BINARY_RAPID',
NULL,
'AB-7842-XY and AB-7842-XY — Identical codes?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 7, -0.5),

-- S2: Binary Rapid - Code comparison (subtle difference)
('SPD_S2_BIN', 'SPD', 'STANDARD', 'PATTERN', 'BINARY_RAPID',
NULL,
'CD-9156-MN and CD-9165-MN — Identical codes?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 8, -0.3),

-- S3: Binary Rapid - Percentage comparison
('SPD_S3_BIN', 'SPD', 'STANDARD', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is 3/8 greater than 40%?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 8, -0.2),

-- S4: Binary Rapid - Fraction comparison
('SPD_S4_BIN', 'SPD', 'STANDARD', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'Is 5/6 greater than 7/9?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 9, 0.0),

-- S5: Binary Rapid - Antonym check
('SPD_S5_BIN', 'SPD', 'STANDARD', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'VERBOSE and CONCISE — Are these opposites?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 7, -0.4),

-- S6: Binary Rapid - Antonym check
('SPD_S6_BIN', 'SPD', 'STANDARD', 'DISCRIMINATION', 'BINARY_RAPID',
NULL,
'ABUNDANT and SCARCE — Are these opposites?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 7, -0.5),

-- S7: Binary Rapid - Grammar verification
('SPD_S7_BIN', 'SPD', 'STANDARD', 'VERIFICATION', 'BINARY_RAPID',
'"The team have decided to postpone their meeting."',
'Is this sentence grammatically correct?',
'["CORRECT", "INCORRECT"]',
'"CORRECT"',
1.0, FALSE, 8, -0.1),

-- S8: Binary Rapid - Grammar verification
('SPD_S8_BIN', 'SPD', 'STANDARD', 'VERIFICATION', 'BINARY_RAPID',
'"Neither the students nor the teacher were present."',
'Is this sentence grammatically correct?',
'["CORRECT", "INCORRECT"]',
'"INCORRECT"',
1.0, FALSE, 8, 0.1),

-- S9: Binary Rapid - Sequence continuation
('SPD_S9_BIN', 'SPD', 'STANDARD', 'PATTERN', 'BINARY_RAPID',
'Sequence: 2, 6, 18, 54, ...',
'Is 162 the next number?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 9, 0.0),

-- S10: Binary Rapid - Sequence continuation
('SPD_S10_BIN', 'SPD', 'STANDARD', 'PATTERN', 'BINARY_RAPID',
'Sequence: 3, 7, 15, 31, ...',
'Is 62 the next number?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 9, 0.2),

-- S11: Binary Rapid - Postcode format
('SPD_S11_BIN', 'SPD', 'STANDARD', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is "SW1A 2AA" a valid UK postcode format?',
'["VALID", "INVALID"]',
'"VALID"',
1.0, FALSE, 6, -0.3),

-- S12: Binary Rapid - Postcode format
('SPD_S12_BIN', 'SPD', 'STANDARD', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is "123 ABC" a valid UK postcode format?',
'["VALID", "INVALID"]',
'"INVALID"',
1.0, FALSE, 6, -0.4),

-- S13: MCQ - Quick pattern
('SPD_S13_MCQ', 'SPD', 'STANDARD', 'PATTERN', 'MCQ',
'Pattern: ○●○○●○○○●○○○○...',
'How many ○ symbols appear before the next ●?',
'{"A": "3", "B": "4", "C": "5", "D": "6"}',
'"C"',
1.0, FALSE, 10, 0.3),

-- S14: Binary Rapid - Email format
('SPD_S14_BIN', 'SPD', 'STANDARD', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is "john.smith@university.ac.uk" a valid email format?',
'["VALID", "INVALID"]',
'"VALID"',
1.0, FALSE, 7, -0.2),

-- S15: Binary Rapid - Logical statement
('SPD_S15_BIN', 'SPD', 'STANDARD', 'DISCRIMINATION', 'BINARY_RAPID',
'"If all A are B, and all B are C, then all A are C."',
'Is this statement logically valid?',
'["VALID", "INVALID"]',
'"VALID"',
1.0, FALSE, 9, 0.1);

-- ============================================
-- SPD CHALLENGE TIER (C1-C10)
-- Complex rapid judgments, 8-12 second limits
-- ============================================

INSERT INTO bo_v1_capacity_items (id, capacity_type, tier, block, interaction_type, stimulus, question, options, correct_answer, max_score, partial_credit, time_limit_seconds, difficulty_irt) VALUES

-- C1: Binary Rapid - Complex code matching
('SPD_C1_BIN', 'SPD', 'CHALLENGE', 'PATTERN', 'BINARY_RAPID',
NULL,
'UK-2847-NW-X94 and UK-2847-NW-X94 — Identical?',
'["YES", "NO"]',
'"YES"',
1.0, FALSE, 8, 0.5),

-- C2: Binary Rapid - Complex code matching (subtle)
('SPD_C2_BIN', 'SPD', 'CHALLENGE', 'PATTERN', 'BINARY_RAPID',
NULL,
'REF-X7B2-Q9M4-LP and REF-X7B2-Q9N4-LP — Identical?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 9, 0.7),

-- C3: MCQ - Quick calculation
('SPD_C3_MCQ', 'SPD', 'CHALLENGE', 'VERIFICATION', 'MCQ',
NULL,
'What is 15% of 80?',
'{"A": "10", "B": "12", "C": "14", "D": "16"}',
'"B"',
1.0, FALSE, 10, 0.6),

-- C4: Binary Rapid - Logical validity
('SPD_C4_BIN', 'SPD', 'CHALLENGE', 'DISCRIMINATION', 'BINARY_RAPID',
'"Some doctors are researchers. All researchers publish papers. Therefore, some doctors publish papers."',
'Is this argument logically valid?',
'["VALID", "INVALID"]',
'"VALID"',
1.0, FALSE, 12, 0.8),

-- C5: Binary Rapid - Logical validity (invalid)
('SPD_C5_BIN', 'SPD', 'CHALLENGE', 'DISCRIMINATION', 'BINARY_RAPID',
'"All cats are mammals. Some mammals are pets. Therefore, all cats are pets."',
'Is this argument logically valid?',
'["VALID", "INVALID"]',
'"INVALID"',
1.0, FALSE, 12, 0.9),

-- C6: MCQ - Anagram detection
('SPD_C6_MCQ', 'SPD', 'CHALLENGE', 'PATTERN', 'MCQ',
NULL,
'Which word is an anagram of "LISTEN"?',
'{"A": "SILENT", "B": "ENLIST", "C": "TINSEL", "D": "All of the above"}',
'"D"',
1.0, FALSE, 12, 1.0),

-- C7: Binary Rapid - Statistical claim
('SPD_C7_BIN', 'SPD', 'CHALLENGE', 'VERIFICATION', 'BINARY_RAPID',
'"The mean of 3, 7, 8, 10, 12 is 8."',
'Is this statement correct?',
'["CORRECT", "INCORRECT"]',
'"CORRECT"',
1.0, FALSE, 10, 0.7),

-- C8: Binary Rapid - Statistical claim
('SPD_C8_BIN', 'SPD', 'CHALLENGE', 'VERIFICATION', 'BINARY_RAPID',
'"The median of 2, 5, 9, 11, 13, 17 is 10."',
'Is this statement correct?',
'["CORRECT", "INCORRECT"]',
'"CORRECT"',
1.0, FALSE, 11, 0.8),

-- C9: MCQ - Quick Roman numeral
('SPD_C9_MCQ', 'SPD', 'CHALLENGE', 'PATTERN', 'MCQ',
NULL,
'What is MCMXCIV in Arabic numerals?',
'{"A": "1994", "B": "1984", "C": "2004", "D": "1974"}',
'"A"',
1.0, FALSE, 12, 1.1),

-- C10: Binary Rapid - Prime verification
('SPD_C10_BIN', 'SPD', 'CHALLENGE', 'VERIFICATION', 'BINARY_RAPID',
NULL,
'Is 91 a prime number?',
'["YES", "NO"]',
'"NO"',
1.0, FALSE, 10, 1.0);

-- ============================================
-- VERIFY SPD ITEMS
-- ============================================

SELECT 
  capacity_type,
  tier,
  COUNT(*) as item_count,
  ROUND(AVG(time_limit_seconds), 1) as avg_time_limit
FROM bo_v1_capacity_items
WHERE capacity_type = 'SPD'
GROUP BY capacity_type, tier
ORDER BY 
  CASE tier 
    WHEN 'FOUNDATION' THEN 1 
    WHEN 'STANDARD' THEN 2 
    WHEN 'CHALLENGE' THEN 3 
  END;

-- Expected output:
-- SPD | FOUNDATION | 15 | 5.7
-- SPD | STANDARD   | 15 | 7.7
-- SPD | CHALLENGE  | 10 | 10.6

-- Full capacity items summary
SELECT 
  capacity_type,
  COUNT(*) as total_items,
  COUNT(*) FILTER (WHERE tier = 'FOUNDATION') as foundation,
  COUNT(*) FILTER (WHERE tier = 'STANDARD') as standard,
  COUNT(*) FILTER (WHERE tier = 'CHALLENGE') as challenge,
  ROUND(AVG(time_limit_seconds), 1) as avg_time_sec
FROM bo_v1_capacity_items
GROUP BY capacity_type
ORDER BY capacity_type;

-- Expected:
-- QNT | 36 | 12 | 12 | 12 | ~45
-- SPD | 40 | 15 | 15 | 10 | ~8
-- VRB | 36 | 12 | 12 | 12 | ~45
