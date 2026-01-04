-- Add unique constraints needed for upserts

-- scenario_responses needs unique constraint for upsert
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'bo_v1_scenario_responses_session_scenario_unique'
  ) THEN
    ALTER TABLE bo_v1_scenario_responses
      ADD CONSTRAINT bo_v1_scenario_responses_session_scenario_unique
      UNIQUE (session_id, scenario_id);
  END IF;
END$$;

-- Ensure profiles.session_id has unique constraint
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'bo_v1_profiles_session_id_key'
  ) THEN
    -- First check if there's any existing unique constraint on session_id
    IF NOT EXISTS (
      SELECT 1 FROM pg_constraint c
      JOIN pg_attribute a ON a.attrelid = c.conrelid AND a.attnum = ANY(c.conkey)
      WHERE c.conrelid = 'bo_v1_profiles'::regclass
      AND c.contype = 'u'
      AND a.attname = 'session_id'
    ) THEN
      ALTER TABLE bo_v1_profiles
        ADD CONSTRAINT bo_v1_profiles_session_id_key
        UNIQUE (session_id);
    END IF;
  END IF;
END$$;

-- Ensure vibe_choices has unique constraint (should exist but verify)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'bo_v1_vibe_choices_session_id_pair_id_key'
  ) THEN
    -- Check if any unique constraint on (session_id, pair_id) exists
    IF NOT EXISTS (
      SELECT 1 FROM pg_constraint
      WHERE conrelid = 'bo_v1_vibe_choices'::regclass
      AND contype = 'u'
    ) THEN
      ALTER TABLE bo_v1_vibe_choices
        ADD CONSTRAINT bo_v1_vibe_choices_session_id_pair_id_key
        UNIQUE (session_id, pair_id);
    END IF;
  END IF;
END$$;

-- Verify constraints
SELECT
  tc.table_name,
  tc.constraint_name,
  tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_name IN ('bo_v1_profiles', 'bo_v1_vibe_choices', 'bo_v1_scenario_responses')
  AND tc.constraint_type = 'UNIQUE'
ORDER BY tc.table_name;
