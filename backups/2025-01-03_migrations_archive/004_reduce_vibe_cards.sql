-- Migration: Reduce Active Vibe Cards to 6
-- Created: 2025-01-03
-- Description: Mark 6 cards inactive, keeping 6 most diverse active for MVP

-- ROLLBACK:
-- UPDATE bo_v1_vibe_cards SET active = TRUE WHERE active = FALSE;

-- Strategy: Keep 6 cards with maximum subject coverage
-- Selected for diversity across:
-- - STEM Physical (Science Lab)
-- - STEM Life (Hospital/Healthcare)
-- - Social Sciences (Law/Courtroom)
-- - Business (Trading Floor)
-- - Humanities/Creative (Art Studio)
-- - Learning Environment (Collaborative vs Independent)

-- Mark 6 cards as INACTIVE (these will NOT show)
UPDATE bo_v1_vibe_cards
SET active = FALSE
WHERE id IN (
  'VIBE_01',  -- City vs Campus (covered by other location aspects)
  'VIBE_02',  -- Oxford quad (traditional vs modern covered elsewhere)
  'VIBE_04',  -- Solo study (redundant with VIBE_03 giving both options)
  'VIBE_10',  -- Lecture hall (exam vs coursework covered by VIBE_11)
  'VIBE_11',  -- Seminar room (keeping one collaborative option is enough)
  'VIBE_12'   -- Outdoor fieldwork (practical aspect covered by lab/hospital)
);

-- Keep these 6 ACTIVE (diverse subject + learning style coverage)
-- VIBE_03 - Collaborative Learning (social dimension)
-- VIBE_05 - Science Lab (STEM Physical, practical)
-- VIBE_06 - Courtroom/Law (Social Sciences, analytical)
-- VIBE_07 - Art Studio (Humanities, creative)
-- VIBE_08 - Hospital/Healthcare (STEM Life, vocational)
-- VIBE_09 - Trading Floor (Business, competitive)

-- Verify the active cards
SELECT 
  id,
  LEFT(alt_text, 40) as description,
  right_tags[1] as primary_tag,
  active,
  sort_order
FROM bo_v1_vibe_cards
ORDER BY active DESC, sort_order;

-- Count check
SELECT 
  COUNT(*) FILTER (WHERE active = TRUE) as active_cards,
  COUNT(*) FILTER (WHERE active = FALSE) as inactive_cards,
  COUNT(*) as total_cards
FROM bo_v1_vibe_cards;

-- Success message
SELECT 'Migration complete: 6 vibe cards active, 6 inactive' as status;
