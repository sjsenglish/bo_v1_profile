# Database Migrations - Onboarding MVP

**Date:** 3 January 2025  
**Purpose:** Update database for new onboarding flow (Vibe → Scenarios → Mini-Samples → Results)

---

## Quick Start

**Run all migrations at once:**
```sql
-- Copy contents of RUN_ALL_MIGRATIONS.sql
-- Paste into Supabase SQL Editor
-- Run
```

Done! Verify with the checks at the end.

---

## What These Migrations Do

| File | Changes | Reason |
|------|---------|--------|
| `001_add_session_tracking.sql` | Add 6 columns to `bo_v1_sessions` | Track mini-sample progress + precision |
| `002_create_scenarios_table.sql` | Create `bo_v1_scenarios` table | Store forced-choice questions |
| `003_seed_scenarios.sql` | Insert 8 scenarios | Seed content for Quick Scenarios component |
| `004_reduce_vibe_cards.sql` | Mark 6 cards inactive | Reduce to 6 most diverse cards |

---

## New Columns in bo_v1_sessions

| Column | Type | Default | Purpose |
|--------|------|---------|---------|
| `scenarios_completed` | BOOLEAN | FALSE | Quick Scenarios (8 forced-choice) done? |
| `mini_samples_completed` | BOOLEAN | FALSE | All 3 mini-samples done? |
| `mini_sample_code_completed` | BOOLEAN | FALSE | Code Trace task done? |
| `mini_sample_source_completed` | BOOLEAN | FALSE | Source Analysis task done? |
| `mini_sample_data_completed` | BOOLEAN | FALSE | Data Interpretation task done? |
| `precision_score` | INTEGER | 40 | Assessment precision 0-100 |

---

## New Table: bo_v1_scenarios

**Purpose:** Store forced-choice scenario questions (replacing Likert scale)

**Schema:**
```sql
CREATE TABLE bo_v1_scenarios (
  id TEXT PRIMARY KEY,
  dimension TEXT NOT NULL,     -- Which disposition
  scenario_context TEXT,        -- Situation description
  option_a TEXT,                -- First choice
  option_b TEXT,                -- Second choice
  a_indicates TEXT,             -- What A means (e.g., 'high_transfer')
  b_indicates TEXT,             -- What B means
  active BOOLEAN DEFAULT TRUE,
  sort_order INTEGER,
  created_at TIMESTAMPTZ
);
```

**Seeded Scenarios (8 total):**
| ID | Dimension | Scenario Preview |
|----|-----------|------------------|
| TRA_01 | TRANSFER | Problem-solving instinct |
| STR_01 | STRUCTURE | Course format preference |
| REC_01 | RECEPTIVITY | Critical feedback response |
| SOC_01 | SOCIAL | Late-night help-seeking |
| DEP_01 | DEPTH | Free time learning |
| CAL_01 | CALIBRATION | Post-exam prediction |
| TOL_01 | TOLERANCE | Persistence threshold |
| PRE_01 | PRECISION | Small inconsistency decision |

---

## Vibe Cards Changes

**Before:** 12 active cards  
**After:** 6 active cards

**Kept Active (Diverse Coverage):**
- VIBE_03 - Collaborative Learning (social dimension)
- VIBE_05 - Science Lab (STEM Physical)
- VIBE_06 - Courtroom/Law (Social Sciences)
- VIBE_07 - Art Studio (Humanities/Creative)
- VIBE_08 - Hospital/Healthcare (STEM Life)
- VIBE_09 - Trading Floor (Business)

**Marked Inactive:**
- VIBE_01, VIBE_02, VIBE_04, VIBE_10, VIBE_11, VIBE_12

---

## Verification Queries

**After running migrations, verify:**

### 1. Check session columns exist
```sql
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'bo_v1_sessions'
  AND column_name LIKE '%mini_sample%'
ORDER BY column_name;
```
**Expected:** 5 columns returned

### 2. Check scenarios table
```sql
SELECT COUNT(*) as total, COUNT(DISTINCT dimension) as unique_dimensions
FROM bo_v1_scenarios;
```
**Expected:** total=8, unique_dimensions=8

### 3. Check vibe cards
```sql
SELECT 
  COUNT(*) FILTER (WHERE active = TRUE) as active,
  COUNT(*) FILTER (WHERE active = FALSE) as inactive
FROM bo_v1_vibe_cards;
```
**Expected:** active=6, inactive=6

---

## Rollback Procedures

### Rollback All
```sql
BEGIN;

-- Rollback Migration 4
UPDATE bo_v1_vibe_cards SET active = TRUE WHERE active = FALSE;

-- Rollback Migration 3
DELETE FROM bo_v1_scenarios WHERE id IN (
  'TRA_01', 'STR_01', 'REC_01', 'SOC_01', 
  'DEP_01', 'CAL_01', 'TOL_01', 'PRE_01'
);

-- Rollback Migration 2
DROP TABLE IF EXISTS bo_v1_scenarios CASCADE;

-- Rollback Migration 1
ALTER TABLE bo_v1_sessions 
  DROP COLUMN IF EXISTS scenarios_completed,
  DROP COLUMN IF EXISTS mini_samples_completed,
  DROP COLUMN IF EXISTS mini_sample_code_completed,
  DROP COLUMN IF EXISTS mini_sample_source_completed,
  DROP COLUMN IF EXISTS mini_sample_data_completed,
  DROP COLUMN IF EXISTS precision_score;

COMMIT;

SELECT 'All migrations rolled back' as status;
```

### Rollback Individual Migration
See rollback SQL commented at top of each migration file.

---

## Common Issues

### Issue: "column already exists"
**Cause:** Migration 1 already run  
**Solution:** Safe to ignore, or check with:
```sql
SELECT column_name FROM information_schema.columns 
WHERE table_name = 'bo_v1_sessions' AND column_name = 'scenarios_completed';
```

### Issue: "table already exists"
**Cause:** Migration 2 already run  
**Solution:** Safe to ignore, `IF NOT EXISTS` clause handles this

### Issue: "duplicate key value"
**Cause:** Migration 3 scenarios already seeded  
**Solution:** Safe to ignore, `ON CONFLICT DO NOTHING` handles this

### Issue: "no rows updated" on vibe cards
**Cause:** Migration 4 already run or cards already inactive  
**Solution:** Verify with count query above

---

## Next Steps After Migration

### 1. Code Updates Needed
- Update Vibe Swiper to load `WHERE active = TRUE` (should get 6 cards)
- Build Quick Scenarios component (reads from `bo_v1_scenarios`)
- Build Mini-Sample components (reads from `bo_v1_mini_sample_items`)
- Update session service to track new columns

### 2. Testing
```sql
-- Test inserting a session with new columns
INSERT INTO bo_v1_sessions (
  vibe_completed, 
  scenarios_completed, 
  mini_samples_completed,
  precision_score
) VALUES (
  TRUE,
  TRUE,
  TRUE,
  42
) RETURNING *;
```

### 3. UI Implementation Priority
1. Update Vibe Swiper (5 min - change query)
2. Build Quick Scenarios (1-2 hours)
3. Build Mini-Samples (2-3 hours)
4. Profile/Results page (2-3 hours)

---

## Migration History

| Date | Migration | Status |
|------|-----------|--------|
| 2025-01-03 | 001-004 | ✅ Ready to run |

---

## Support

**If migrations fail:**
1. Check Supabase logs for specific error
2. Run verification queries to see what's already applied
3. Use rollback scripts if needed
4. Re-run `RUN_ALL_MIGRATIONS.sql`

**Database size impact:** Negligible (~1KB added)

---

**End of README**
