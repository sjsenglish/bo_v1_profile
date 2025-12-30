# Supercurricular Validation Pipeline

Validates LLM-generated supercurricular entries before promoting to production.

## Overview

```
┌─────────────────┐     ┌──────────────────┐     ┌────────────────┐
│  LLM Outputs    │────▶│  Staging Table   │────▶│  Production    │
│  (JSON files)   │     │  (validation)    │     │  Table         │
└─────────────────┘     └──────────────────┘     └────────────────┘
        │                       │                        │
        │                       ▼                        │
        │               ┌──────────────┐                 │
        │               │  Validation  │                 │
        │               │  - ISBN API  │                 │
        │               │  - URL check │                 │
        │               │  - Dedup     │                 │
        │               └──────────────┘                 │
        │                       │                        │
        │                       ▼                        │
        │               ┌──────────────┐                 │
        │               │ Manual Review│                 │
        │               │ (if needed)  │                 │
        │               └──────────────┘                 │
        │                                                │
        └────────────────────────────────────────────────┘
```

## Setup

```bash
cd validation-pipeline
npm install

# Set environment variables
export SUPABASE_URL="https://xxx.supabase.co"
export SUPABASE_SERVICE_KEY="xxx"  # Use service key for full access
```

## Workflow

### 1. Generate Content with LLMs

Use `SUPERCURRICULAR_GENERATION_PROMPT.md` with multiple LLMs:

```bash
# Example: Send prompt to Claude, GPT-4, Gemini
# Save each output as JSON file
```

### 2. Import to Staging

```bash
# From file
node import-llm-output.js \
  --file=./claude-output.json \
  --source=claude-3.5 \
  --batch=batch_2024-12-30_med_01

# From stdin (for piping)
cat gpt4-output.json | node import-llm-output.js \
  --stdin \
  --source=gpt-4o \
  --batch=batch_2024-12-30_med_02
```

### 3. Run Validation

```bash
# Validate specific batch
node validate-supercurriculars.js --batch=batch_2024-12-30_med_01

# Validate all pending
node validate-supercurriculars.js --all-pending

# Check statistics
node validate-supercurriculars.js --stats
```

### 4. Review Flagged Entries

In Supabase dashboard or via SQL:

```sql
-- View items needing review
SELECT * FROM v_supercurricular_review_queue;

-- Approve an entry
UPDATE bo_v1_supercurricular_staging
SET manual_review_status = 'APPROVED'
WHERE staging_id = 'xxx';

-- Reject an entry
SELECT reject_staging_entry('staging-uuid', 'Hallucinated book', 'HALLUCINATION');
```

### 5. Promote to Production

```bash
# Auto-promote all passed entries in batch
node validate-supercurriculars.js --promote=batch_2024-12-30_med_01
```

Or promote individually:

```sql
SELECT promote_to_production('staging-uuid');
```

## Validation Checks

### ISBN Verification
- Format validation (ISBN-10 or ISBN-13 checksum)
- Lookup in OpenLibrary API
- Lookup in Google Books API
- Title matching against ISBN record
- Author matching against ISBN record

### URL Verification
- HTTP HEAD request (5s timeout)
- Domain trust check against whitelist
- Status code verification

### Consistency Checks
- Required fields present
- Difficulty values in 1-100 range
- Publication year not in future
- Volume/time estimate coherence
- High credibility requires authority source

### Deduplication
- Exact ISBN match
- Exact normalised title match
- Fuzzy title matching (>85% similarity)

## Validation Scores

| Score | Status | Action |
|-------|--------|--------|
| 85-100 | PASSED | Auto-promoted (if no review flags) |
| 70-84 | REVIEW_REQUIRED | Needs manual approval |
| 40-69 | REVIEW_REQUIRED | Likely issues, careful review |
| 0-39 | FAILED | Auto-rejected |

## Flag Reference

| Flag | Penalty | Action |
|------|---------|--------|
| ISBN_NOT_FOUND | -30 | Review |
| ISBN_TITLE_MISMATCH | -35 | Auto-reject |
| URL_NOT_REACHABLE | -15 | - |
| EXACT_DUPLICATE_PRODUCTION | -100 | Auto-reject |
| FUZZY_DUPLICATE_PRODUCTION | -50 | Review |
| HIGH_CREDIBILITY_NO_SOURCE | -10 | Review |
| UNVERIFIED_CREDENTIAL_CLAIM | -15 | Review |

See `validation_schema.sql` for complete flag list.

## File Structure

```
validation-pipeline/
├── package.json
├── validate-supercurriculars.js   # Main validation script
├── import-llm-output.js           # Import JSON to staging
├── README.md                      # This file
└── ...

Parent directory:
├── validation_schema.sql          # Database schema extension
├── SUPERCURRICULAR_GENERATION_PROMPT.md  # LLM prompt template
```

## Tips for Best Results

### LLM Prompting
1. Use the exact prompt template - it's optimised to reduce hallucination
2. Ask for HIGH confidence items first
3. Request ~15 items per cluster per LLM
4. Run same prompt on 3+ LLMs for diversity

### Validation
1. Process batches by cluster for easier review
2. Check ISBN_NOT_FOUND items manually - API may miss valid ISBNs
3. For fuzzy duplicates, keep the higher-scoring entry
4. Review UNVERIFIED_CREDENTIAL_CLAIM items - LLMs sometimes add fake awards

### Production
1. Only promote entries with verified ISBNs for books
2. Spot-check 10% of auto-promoted entries
3. Monitor for user reports of broken links

## Database Tables

| Table | Purpose |
|-------|---------|
| `bo_v1_supercurricular_staging` | Holds entries during validation |
| `bo_v1_validation_flags` | Reference table of all flag codes |
| `bo_v1_validation_batches` | Tracks import batches |
| `bo_v1_supercurriculars` | Production table (promoted entries) |

## Useful Queries

```sql
-- Validation statistics by LLM
SELECT source_llm, 
  COUNT(*) as total,
  AVG(validation_score) as avg_score,
  COUNT(*) FILTER (WHERE validation_status = 'PASSED') as passed
FROM bo_v1_supercurricular_staging
GROUP BY source_llm;

-- Most common flags
SELECT unnest(validation_flags) as flag, COUNT(*) as count
FROM bo_v1_supercurricular_staging
GROUP BY flag
ORDER BY count DESC;

-- Books missing ISBN verification
SELECT title, author, isbn, validation_flags
FROM bo_v1_supercurricular_staging
WHERE type = 'BOOK' AND isbn_verified = FALSE;
```
