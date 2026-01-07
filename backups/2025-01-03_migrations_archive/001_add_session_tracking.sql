-- Migration: Add Mini-Sample Session Tracking
-- Created: 2025-01-03
-- Description: Add columns to bo_v1_sessions for tracking new onboarding flow

-- ROLLBACK:
-- ALTER TABLE bo_v1_sessions 
--   DROP COLUMN IF EXISTS scenarios_completed,
--   DROP COLUMN IF EXISTS mini_samples_completed,
--   DROP COLUMN IF EXISTS mini_sample_code_completed,
--   DROP COLUMN IF EXISTS mini_sample_source_completed,
--   DROP COLUMN IF EXISTS mini_sample_data_completed,
--   DROP COLUMN IF EXISTS precision_score;

-- Add new tracking columns for onboarding flow
ALTER TABLE bo_v1_sessions
  ADD COLUMN IF NOT EXISTS scenarios_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_samples_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_code_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_source_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS mini_sample_data_completed BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS precision_score INTEGER DEFAULT 40;

-- Add comment for documentation
COMMENT ON COLUMN bo_v1_sessions.scenarios_completed IS 'Quick Scenarios (8 forced-choice questions) completed';
COMMENT ON COLUMN bo_v1_sessions.mini_samples_completed IS 'All 3 mini-sample tasks completed';
COMMENT ON COLUMN bo_v1_sessions.mini_sample_code_completed IS 'Code Trace mini-sample completed';
COMMENT ON COLUMN bo_v1_sessions.mini_sample_source_completed IS 'Source Analysis mini-sample completed';
COMMENT ON COLUMN bo_v1_sessions.mini_sample_data_completed IS 'Data Interpretation mini-sample completed';
COMMENT ON COLUMN bo_v1_sessions.precision_score IS 'Overall assessment precision 0-100, starts at 40% after onboarding';

-- Verify changes
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'bo_v1_sessions'
  AND column_name IN ('scenarios_completed', 'mini_samples_completed', 'precision_score')
ORDER BY column_name;

-- Success message
SELECT 'Migration complete: Session tracking columns added' as status;
