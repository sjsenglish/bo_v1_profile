-- Migration: Create Scenarios Table
-- Created: 2025-01-03
-- Description: New table for forced-choice scenario questions (replacing Likert scale)

-- ROLLBACK:
-- DROP TABLE IF EXISTS bo_v1_scenarios CASCADE;

-- Create scenarios table for forced-choice questions
CREATE TABLE IF NOT EXISTS bo_v1_scenarios (
  id TEXT PRIMARY KEY,
  dimension TEXT NOT NULL CHECK (dimension IN (
    'CALIBRATION', 'TOLERANCE', 'TRANSFER', 'PRECISION', 'RETRIEVAL', 'RECEPTIVITY',
    'STRUCTURE', 'CONSISTENCY', 'SOCIAL', 'DEPTH'
  )),
  
  -- Scenario content
  scenario_context TEXT NOT NULL,  -- Situational framing
  option_a TEXT NOT NULL,          -- First choice
  option_b TEXT NOT NULL,          -- Second choice
  
  -- Scoring indicators
  a_indicates TEXT NOT NULL,       -- e.g., 'high_transfer', 'low_transfer'
  b_indicates TEXT NOT NULL,
  
  -- Metadata
  active BOOLEAN DEFAULT TRUE,
  sort_order INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create index for filtering
CREATE INDEX IF NOT EXISTS idx_scenarios_dimension ON bo_v1_scenarios(dimension);
CREATE INDEX IF NOT EXISTS idx_scenarios_active ON bo_v1_scenarios(active);

-- Enable RLS
ALTER TABLE bo_v1_scenarios ENABLE ROW LEVEL SECURITY;

-- Allow public read access
CREATE POLICY "Allow public read" ON bo_v1_scenarios
  FOR SELECT
  USING (true);

-- Add comment
COMMENT ON TABLE bo_v1_scenarios IS 'Forced-choice scenario questions for disposition assessment';

-- Verify creation
SELECT table_name, 
       (SELECT COUNT(*) FROM bo_v1_scenarios) as row_count
FROM information_schema.tables
WHERE table_name = 'bo_v1_scenarios';

-- Success message
SELECT 'Migration complete: Scenarios table created' as status;
