-- Fix bo_v1_mini_sample_responses schema to match code expectations
-- The code expects: task_id, response_text, score, time_taken_ms, enjoyment_rating, career_fit_rating

ALTER TABLE bo_v1_mini_sample_responses
  ADD COLUMN IF NOT EXISTS response_text TEXT,
  ADD COLUMN IF NOT EXISTS score INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS time_taken_ms INTEGER,
  ADD COLUMN IF NOT EXISTS task_id TEXT,
  ADD COLUMN IF NOT EXISTS career_fit_rating INTEGER;

-- Convert old enjoyment_rating values (1,2,3) to new scale (-1,0,1)
UPDATE bo_v1_mini_sample_responses
SET enjoyment_rating = CASE
  WHEN enjoyment_rating = 1 THEN -1
  WHEN enjoyment_rating = 2 THEN 0
  WHEN enjoyment_rating = 3 THEN 1
  ELSE enjoyment_rating
END
WHERE enjoyment_rating IS NOT NULL AND enjoyment_rating > 1;

-- Remove old constraint if it exists
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'bo_v1_mini_sample_responses_enjoyment_rating_check') THEN
    ALTER TABLE bo_v1_mini_sample_responses DROP CONSTRAINT bo_v1_mini_sample_responses_enjoyment_rating_check;
  END IF;
END$$;

-- Add new constraint for enjoyment_rating
ALTER TABLE bo_v1_mini_sample_responses
  ADD CONSTRAINT bo_v1_mini_sample_responses_enjoyment_rating_check
  CHECK (enjoyment_rating BETWEEN -1 AND 1);

-- Add constraint for career_fit_rating
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'bo_v1_mini_sample_responses_career_fit_rating_check') THEN
    ALTER TABLE bo_v1_mini_sample_responses
      ADD CONSTRAINT bo_v1_mini_sample_responses_career_fit_rating_check
      CHECK (career_fit_rating BETWEEN -1 AND 1);
  END IF;
END$$;
