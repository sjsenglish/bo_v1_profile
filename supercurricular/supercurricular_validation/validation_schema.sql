-- ============================================================================
-- SUPERCURRICULAR VALIDATION PIPELINE - SCHEMA EXTENSION
-- ============================================================================
-- Adds staging table, validation tracking, and deduplication support.
-- Run AFTER the main supercurricular_schema_v2.sql
-- ============================================================================


-- ============================================================================
-- 1. STAGING TABLE (LLM outputs land here first)
-- ============================================================================

CREATE TABLE bo_v1_supercurricular_staging (
  -- -------------------------------------------------------------------------
  -- TRACKING & SOURCE
  -- -------------------------------------------------------------------------
  staging_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  generation_batch TEXT NOT NULL,           -- e.g., 'batch_2024-12-30_med_01'
  source_llm TEXT NOT NULL,                 -- 'claude-3.5', 'gpt-4o', 'gemini-pro'
  generated_at TIMESTAMPTZ DEFAULT NOW(),
  raw_json JSONB,                           -- Original LLM output for debugging
  
  -- -------------------------------------------------------------------------
  -- SAME FIELDS AS MAIN TABLE (copied for staging)
  -- -------------------------------------------------------------------------
  id TEXT NOT NULL,                         -- Proposed ID
  version INTEGER DEFAULT 1,
  type TEXT NOT NULL,
  format TEXT,
  
  title TEXT NOT NULL,
  subtitle TEXT,
  description TEXT,
  
  author TEXT,
  author_credentials TEXT,
  publisher TEXT,
  publication_year INTEGER,
  
  isbn TEXT,
  doi TEXT,
  external_url TEXT,
  
  has_extractable_sections BOOLEAN DEFAULT FALSE,
  section_count INTEGER,
  estimated_total_time_mins INTEGER,
  
  primary_cluster TEXT NOT NULL,
  secondary_clusters TEXT[] DEFAULT '{}',
  subject_tags TEXT[] DEFAULT '{}',
  course_name_keywords TEXT[] DEFAULT '{}',
  
  authority_source TEXT,
  authority_type TEXT,
  success_signal TEXT,
  credibility_score INTEGER,
  
  difficulty_conceptual INTEGER,
  difficulty_volume INTEGER,
  difficulty_technical INTEGER,
  difficulty_verbal INTEGER,
  difficulty_ambiguity INTEGER,
  difficulty_self_direction INTEGER,
  
  prerequisite_knowledge TEXT[] DEFAULT '{}',
  year_groups TEXT[] DEFAULT '{}',
  
  time_estimate TEXT,
  commitment_type TEXT,
  deadline_month TEXT,
  is_recurring BOOLEAN DEFAULT FALSE,
  
  is_free BOOLEAN,
  price_gbp NUMERIC(10,2),
  availability_notes TEXT,
  
  -- LLM's self-reported confidence
  generation_confidence TEXT DEFAULT 'MEDIUM',
  llm_notes TEXT,                           -- LLM's uncertainty notes
  
  -- -------------------------------------------------------------------------
  -- VALIDATION STATUS
  -- -------------------------------------------------------------------------
  validation_status TEXT DEFAULT 'PENDING' 
    CHECK (validation_status IN ('PENDING', 'VALIDATING', 'PASSED', 'FAILED', 'REVIEW_REQUIRED')),
  validation_score INTEGER,                 -- 0-100
  validation_flags TEXT[] DEFAULT '{}',     -- Array of flag codes
  validation_details JSONB DEFAULT '{}',    -- Detailed validation results
  validated_at TIMESTAMPTZ,
  
  -- Individual field verification
  isbn_verified BOOLEAN,
  isbn_verification_source TEXT,            -- 'openlibrary', 'google_books', 'manual'
  isbn_verification_data JSONB,             -- API response data
  
  url_verified BOOLEAN,
  url_status_code INTEGER,
  url_verified_at TIMESTAMPTZ,
  
  doi_verified BOOLEAN,
  doi_verification_data JSONB,
  
  -- -------------------------------------------------------------------------
  -- DEDUPLICATION
  -- -------------------------------------------------------------------------
  title_normalised TEXT GENERATED ALWAYS AS (
    LOWER(REGEXP_REPLACE(TRIM(title), '[^a-z0-9]', '', 'g'))
  ) STORED,
  
  duplicate_of_staging_id UUID,             -- Points to earlier staging entry
  duplicate_of_production_id TEXT,          -- Points to existing production entry
  duplicate_confidence NUMERIC(3,2),        -- 0.00-1.00 similarity score
  duplicate_check_method TEXT,              -- 'exact', 'fuzzy_title', 'isbn_match'
  
  -- -------------------------------------------------------------------------
  -- REVIEW & PROMOTION
  -- -------------------------------------------------------------------------
  manual_review_status TEXT DEFAULT 'NOT_REQUIRED'
    CHECK (manual_review_status IN ('NOT_REQUIRED', 'PENDING', 'APPROVED', 'REJECTED', 'EDITED')),
  reviewer_id TEXT,                         -- Who reviewed
  reviewer_notes TEXT,
  reviewed_at TIMESTAMPTZ,
  
  -- Final disposition
  promoted_to_production BOOLEAN DEFAULT FALSE,
  promoted_at TIMESTAMPTZ,
  production_id TEXT,                       -- ID in main table after promotion
  
  rejected BOOLEAN DEFAULT FALSE,
  rejected_at TIMESTAMPTZ,
  rejection_reason TEXT,
  rejection_code TEXT                       -- 'DUPLICATE', 'INVALID_DATA', 'LOW_QUALITY', 'HALLUCINATION'
);

-- Indexes for staging table
CREATE INDEX idx_staging_batch ON bo_v1_supercurricular_staging(generation_batch);
CREATE INDEX idx_staging_status ON bo_v1_supercurricular_staging(validation_status);
CREATE INDEX idx_staging_review ON bo_v1_supercurricular_staging(manual_review_status) 
  WHERE manual_review_status = 'PENDING';
CREATE INDEX idx_staging_title_norm ON bo_v1_supercurricular_staging(title_normalised);
CREATE INDEX idx_staging_isbn ON bo_v1_supercurricular_staging(isbn) WHERE isbn IS NOT NULL;
CREATE INDEX idx_staging_cluster ON bo_v1_supercurricular_staging(primary_cluster);
CREATE INDEX idx_staging_source ON bo_v1_supercurricular_staging(source_llm);
CREATE INDEX idx_staging_not_processed ON bo_v1_supercurricular_staging(validation_status)
  WHERE validation_status = 'PENDING' AND rejected = FALSE;


-- ============================================================================
-- 2. VALIDATION FLAGS REFERENCE TABLE
-- ============================================================================

CREATE TABLE bo_v1_validation_flags (
  code TEXT PRIMARY KEY,
  severity TEXT NOT NULL CHECK (severity IN ('ERROR', 'WARNING', 'INFO')),
  category TEXT NOT NULL,                   -- 'ISBN', 'URL', 'CONSISTENCY', 'CONTENT', 'DUPLICATE'
  description TEXT NOT NULL,
  score_penalty INTEGER NOT NULL,           -- How much to deduct from 100
  auto_reject BOOLEAN DEFAULT FALSE,        -- If true, automatically reject entry
  requires_manual_review BOOLEAN DEFAULT FALSE
);

INSERT INTO bo_v1_validation_flags (code, severity, category, description, score_penalty, auto_reject, requires_manual_review) VALUES
-- ISBN issues
('MISSING_ISBN_BOOK', 'WARNING', 'ISBN', 'Book entry missing ISBN', 15, FALSE, FALSE),
('INVALID_ISBN_FORMAT', 'ERROR', 'ISBN', 'ISBN format invalid (not 10 or 13 digits)', 25, FALSE, TRUE),
('ISBN_NOT_FOUND', 'ERROR', 'ISBN', 'ISBN not found in any verification database', 30, FALSE, TRUE),
('ISBN_TITLE_MISMATCH', 'ERROR', 'ISBN', 'ISBN exists but title does not match', 35, TRUE, FALSE),
('ISBN_AUTHOR_MISMATCH', 'WARNING', 'ISBN', 'ISBN exists but author does not match', 20, FALSE, TRUE),

-- URL issues
('MISSING_URL', 'INFO', 'URL', 'No external URL provided', 5, FALSE, FALSE),
('URL_NOT_REACHABLE', 'WARNING', 'URL', 'URL returned non-200 status or timeout', 15, FALSE, FALSE),
('URL_DOMAIN_SUSPICIOUS', 'WARNING', 'URL', 'URL domain not recognised/trusted', 10, FALSE, TRUE),

-- DOI issues
('INVALID_DOI_FORMAT', 'ERROR', 'DOI', 'DOI format invalid', 20, FALSE, TRUE),
('DOI_NOT_FOUND', 'ERROR', 'DOI', 'DOI not found in CrossRef', 25, FALSE, TRUE),

-- Content consistency
('VOLUME_TIME_MISMATCH', 'WARNING', 'CONSISTENCY', 'High volume difficulty but low time estimate', 5, FALSE, FALSE),
('DIFFICULTY_RANGE_INVALID', 'ERROR', 'CONSISTENCY', 'Difficulty value outside 1-100 range', 15, FALSE, FALSE),
('MISSING_REQUIRED_FIELD', 'ERROR', 'CONSISTENCY', 'Required field is empty', 20, FALSE, FALSE),
('YEAR_FUTURE', 'ERROR', 'CONSISTENCY', 'Publication year is in the future', 25, TRUE, FALSE),
('YEAR_IMPLAUSIBLE', 'WARNING', 'CONSISTENCY', 'Publication year seems wrong for content type', 10, FALSE, TRUE),

-- Content quality
('HIGH_CREDIBILITY_NO_SOURCE', 'WARNING', 'CONTENT', 'Credibility score >85 but no authority source', 10, FALSE, TRUE),
('UNVERIFIED_CREDENTIAL_CLAIM', 'WARNING', 'CONTENT', 'Author credentials include unverifiable prestigious claim', 15, FALSE, TRUE),
('DESCRIPTION_TOO_SHORT', 'INFO', 'CONTENT', 'Description under 50 characters', 5, FALSE, FALSE),
('DESCRIPTION_TOO_GENERIC', 'WARNING', 'CONTENT', 'Description appears templated/generic', 10, FALSE, TRUE),
('LOW_CONFIDENCE_SELF_REPORT', 'INFO', 'CONTENT', 'LLM reported low confidence in this entry', 10, FALSE, TRUE),

-- Duplicates
('EXACT_DUPLICATE_STAGING', 'ERROR', 'DUPLICATE', 'Exact match found in staging table', 100, TRUE, FALSE),
('EXACT_DUPLICATE_PRODUCTION', 'ERROR', 'DUPLICATE', 'Exact match found in production table', 100, TRUE, FALSE),
('FUZZY_DUPLICATE_STAGING', 'WARNING', 'DUPLICATE', 'Similar entry found in staging (>0.85 match)', 50, FALSE, TRUE),
('FUZZY_DUPLICATE_PRODUCTION', 'WARNING', 'DUPLICATE', 'Similar entry found in production (>0.85 match)', 50, FALSE, TRUE),
('ISBN_DUPLICATE', 'ERROR', 'DUPLICATE', 'ISBN already exists in system', 100, TRUE, FALSE);


-- ============================================================================
-- 3. VALIDATION BATCH TRACKING
-- ============================================================================

CREATE TABLE bo_v1_validation_batches (
  batch_id TEXT PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  source_llms TEXT[] NOT NULL,              -- Which LLMs contributed
  cluster_target TEXT,                      -- Which cluster this batch was for
  
  -- Counts
  total_entries INTEGER DEFAULT 0,
  pending_count INTEGER DEFAULT 0,
  passed_count INTEGER DEFAULT 0,
  failed_count INTEGER DEFAULT 0,
  review_required_count INTEGER DEFAULT 0,
  promoted_count INTEGER DEFAULT 0,
  
  -- Timing
  validation_started_at TIMESTAMPTZ,
  validation_completed_at TIMESTAMPTZ,
  
  -- Summary stats
  avg_validation_score NUMERIC(5,2),
  common_flags JSONB,                       -- Most frequent flags
  
  notes TEXT
);


-- ============================================================================
-- 4. MANUAL REVIEW QUEUE VIEW
-- ============================================================================

CREATE VIEW v_supercurricular_review_queue AS
SELECT 
  staging_id,
  generation_batch,
  source_llm,
  id,
  title,
  author,
  type,
  primary_cluster,
  validation_score,
  validation_flags,
  generation_confidence,
  llm_notes,
  isbn,
  isbn_verified,
  external_url,
  url_verified,
  duplicate_of_staging_id,
  duplicate_of_production_id,
  duplicate_confidence,
  generated_at
FROM bo_v1_supercurricular_staging
WHERE manual_review_status = 'PENDING'
  AND rejected = FALSE
ORDER BY 
  validation_score DESC,  -- Higher scores first (easier to approve)
  generated_at ASC;       -- Older entries first


-- ============================================================================
-- 5. DEDUPLICATION HELPER FUNCTION
-- ============================================================================

-- Function to calculate title similarity (simplified Levenshtein-based)
CREATE OR REPLACE FUNCTION title_similarity(title1 TEXT, title2 TEXT)
RETURNS NUMERIC AS $$
DECLARE
  norm1 TEXT;
  norm2 TEXT;
  len_diff INTEGER;
  max_len INTEGER;
BEGIN
  -- Normalise: lowercase, remove non-alphanumeric
  norm1 := LOWER(REGEXP_REPLACE(TRIM(title1), '[^a-z0-9]', '', 'g'));
  norm2 := LOWER(REGEXP_REPLACE(TRIM(title2), '[^a-z0-9]', '', 'g'));
  
  -- Exact match
  IF norm1 = norm2 THEN
    RETURN 1.0;
  END IF;
  
  -- Use built-in similarity if available (requires pg_trgm extension)
  -- Falls back to simple length-based heuristic
  max_len := GREATEST(LENGTH(norm1), LENGTH(norm2));
  IF max_len = 0 THEN
    RETURN 0.0;
  END IF;
  
  len_diff := ABS(LENGTH(norm1) - LENGTH(norm2));
  
  -- Simple heuristic: if lengths very different, low similarity
  IF len_diff > max_len * 0.3 THEN
    RETURN 0.3;
  END IF;
  
  -- Check if one contains the other
  IF norm1 LIKE '%' || norm2 || '%' OR norm2 LIKE '%' || norm1 || '%' THEN
    RETURN 0.85;
  END IF;
  
  RETURN 0.5;  -- Default moderate similarity for manual check
END;
$$ LANGUAGE plpgsql IMMUTABLE;


-- ============================================================================
-- 6. PROMOTION FUNCTION
-- ============================================================================

CREATE OR REPLACE FUNCTION promote_to_production(p_staging_id UUID)
RETURNS TEXT AS $$
DECLARE
  v_entry RECORD;
  v_new_id TEXT;
BEGIN
  -- Get staging entry
  SELECT * INTO v_entry 
  FROM bo_v1_supercurricular_staging 
  WHERE staging_id = p_staging_id;
  
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Staging entry not found: %', p_staging_id;
  END IF;
  
  IF v_entry.promoted_to_production THEN
    RAISE EXCEPTION 'Entry already promoted: %', p_staging_id;
  END IF;
  
  IF v_entry.rejected THEN
    RAISE EXCEPTION 'Cannot promote rejected entry: %', p_staging_id;
  END IF;
  
  -- Insert into production
  INSERT INTO bo_v1_supercurriculars (
    id, version, type, format,
    title, subtitle, description,
    author, author_credentials, publisher, publication_year,
    isbn, doi, external_url,
    has_extractable_sections, section_count, estimated_total_time_mins,
    primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
    authority_source, authority_type, success_signal, credibility_score,
    difficulty_conceptual, difficulty_volume, difficulty_technical,
    difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
    prerequisite_knowledge, year_groups,
    time_estimate, commitment_type, deadline_month, is_recurring,
    is_free, price_gbp, availability_notes,
    is_active, is_verified, verification_notes, generation_confidence
  ) VALUES (
    v_entry.id, v_entry.version, v_entry.type, v_entry.format,
    v_entry.title, v_entry.subtitle, v_entry.description,
    v_entry.author, v_entry.author_credentials, v_entry.publisher, v_entry.publication_year,
    v_entry.isbn, v_entry.doi, v_entry.external_url,
    v_entry.has_extractable_sections, v_entry.section_count, v_entry.estimated_total_time_mins,
    v_entry.primary_cluster, v_entry.secondary_clusters, v_entry.subject_tags, v_entry.course_name_keywords,
    v_entry.authority_source, v_entry.authority_type, v_entry.success_signal, v_entry.credibility_score,
    v_entry.difficulty_conceptual, v_entry.difficulty_volume, v_entry.difficulty_technical,
    v_entry.difficulty_verbal, v_entry.difficulty_ambiguity, v_entry.difficulty_self_direction,
    v_entry.prerequisite_knowledge, v_entry.year_groups,
    v_entry.time_estimate, v_entry.commitment_type, v_entry.deadline_month, v_entry.is_recurring,
    v_entry.is_free, v_entry.price_gbp, v_entry.availability_notes,
    TRUE,  -- is_active
    v_entry.isbn_verified OR v_entry.url_verified,  -- is_verified
    'Promoted from staging ' || v_entry.staging_id::TEXT,
    v_entry.generation_confidence
  )
  RETURNING id INTO v_new_id;
  
  -- Update staging record
  UPDATE bo_v1_supercurricular_staging
  SET 
    promoted_to_production = TRUE,
    promoted_at = NOW(),
    production_id = v_new_id
  WHERE staging_id = p_staging_id;
  
  RETURN v_new_id;
END;
$$ LANGUAGE plpgsql;


-- ============================================================================
-- 7. BATCH REJECTION FUNCTION
-- ============================================================================

CREATE OR REPLACE FUNCTION reject_staging_entry(
  p_staging_id UUID,
  p_reason TEXT,
  p_code TEXT DEFAULT 'MANUAL_REJECTION'
)
RETURNS VOID AS $$
BEGIN
  UPDATE bo_v1_supercurricular_staging
  SET 
    rejected = TRUE,
    rejected_at = NOW(),
    rejection_reason = p_reason,
    rejection_code = p_code,
    validation_status = 'FAILED'
  WHERE staging_id = p_staging_id;
END;
$$ LANGUAGE plpgsql;


-- ============================================================================
-- 8. STATISTICS VIEW
-- ============================================================================

CREATE VIEW v_validation_statistics AS
SELECT 
  generation_batch,
  source_llm,
  primary_cluster,
  COUNT(*) as total_entries,
  COUNT(*) FILTER (WHERE validation_status = 'PASSED') as passed,
  COUNT(*) FILTER (WHERE validation_status = 'FAILED') as failed,
  COUNT(*) FILTER (WHERE validation_status = 'REVIEW_REQUIRED') as needs_review,
  COUNT(*) FILTER (WHERE promoted_to_production) as promoted,
  COUNT(*) FILTER (WHERE rejected) as rejected,
  ROUND(AVG(validation_score), 1) as avg_score,
  ROUND(AVG(validation_score) FILTER (WHERE validation_status = 'PASSED'), 1) as avg_passed_score,
  COUNT(*) FILTER (WHERE isbn_verified = TRUE) as isbn_verified_count,
  COUNT(*) FILTER (WHERE isbn_verified = FALSE) as isbn_failed_count,
  COUNT(*) FILTER (WHERE 'ISBN_NOT_FOUND' = ANY(validation_flags)) as isbn_not_found_count
FROM bo_v1_supercurricular_staging
GROUP BY generation_batch, source_llm, primary_cluster
ORDER BY generation_batch DESC, source_llm;


-- ============================================================================
-- VERIFY
-- ============================================================================

SELECT 'Staging schema created successfully' as status;
