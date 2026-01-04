-- Create bo_v1_scenarios table if it doesn't exist
-- This was supposed to be created earlier but may have been missed

CREATE TABLE IF NOT EXISTS bo_v1_scenarios (
  id TEXT PRIMARY KEY,
  dimension TEXT NOT NULL,
  scenario_context TEXT NOT NULL,
  option_a TEXT NOT NULL,
  option_b TEXT NOT NULL,
  a_indicates TEXT NOT NULL DEFAULT 'high',
  b_indicates TEXT NOT NULL DEFAULT 'low',
  sort_order INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE bo_v1_scenarios ENABLE ROW LEVEL SECURITY;

-- Allow public read access
DROP POLICY IF EXISTS "Allow public read" ON bo_v1_scenarios;
CREATE POLICY "Allow public read" ON bo_v1_scenarios FOR SELECT USING (true);

-- Clear any existing scenarios
DELETE FROM bo_v1_scenarios;

-- Insert the 5 scenarios that match the hardcoded ones in the UI
INSERT INTO bo_v1_scenarios (id, dimension, scenario_context, option_a, option_b, a_indicates, b_indicates, sort_order) VALUES
('scenario_1', 'social',
 'It''s 10pm and you''re stuck on a problem set that''s due tomorrow morning.',
 'Message the group chat to see if anyone''s figured it out.',
 'Grind through it alone — you''ll learn more that way.',
 'high', 'low', 1),

('scenario_2', 'receptivity',
 'You receive harsh feedback on a draft essay from your teacher.',
 'Defend your approach and explain why you made those choices.',
 'Accept it immediately and rewrite the section completely.',
 'low', 'high', 2),

('scenario_3', 'depth',
 'You have a free period in your schedule.',
 'Go to the library to get ahead on next week''s reading.',
 'Go to the common room to relax and socialise with friends.',
 'high', 'low', 3),

('scenario_4', 'tolerance',
 'In a group project, two members aren''t pulling their weight.',
 'Confront them directly and demand they contribute.',
 'Do the work yourself to ensure you get a good grade.',
 'low', 'high', 4),

('scenario_5', 'structure',
 'You have to choose an EPQ topic.',
 'Pick something practical with a clear, definite answer.',
 'Pick something philosophical with multiple open interpretations.',
 'high', 'low', 5);

-- Verify
SELECT 'Scenarios created:' as status, COUNT(*) as count FROM bo_v1_scenarios;
