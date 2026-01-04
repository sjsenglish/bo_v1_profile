-- Ensure bo_v1_mini_samples table exists and has data
-- This may have been skipped if the v9 migration was marked as applied prematurely

CREATE TABLE IF NOT EXISTS bo_v1_mini_samples (
  id TEXT PRIMARY KEY,
  meta_cluster TEXT NOT NULL,
  task_type TEXT NOT NULL,
  title TEXT NOT NULL,
  stimulus TEXT NOT NULL,
  question TEXT NOT NULL,
  options TEXT[],
  correct_answer INTEGER,
  grading_criteria TEXT[],
  time_limit_seconds INTEGER DEFAULT 90,
  sort_order INTEGER,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE bo_v1_mini_samples ENABLE ROW LEVEL SECURITY;

-- Allow public read access
DROP POLICY IF EXISTS "Allow public read" ON bo_v1_mini_samples;
CREATE POLICY "Allow public read" ON bo_v1_mini_samples FOR SELECT USING (true);

-- Only insert if table is empty
INSERT INTO bo_v1_mini_samples (id, meta_cluster, task_type, title, stimulus, question, options, correct_answer, time_limit_seconds, sort_order, active)
SELECT * FROM (VALUES
  ('MS_V9_STEM_TECH', 'STEM_TECH', 'MCQ', 'Debug the Code',
   'A student wrote this Python function to check if a number is prime:

def is_prime(n):
    if n < 2:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

The function works correctly but is slow for large numbers.',
   'Which modification would make the function faster while still being correct?',
   ARRAY['Change range(2, n) to range(2, n//2)', 'Change range(2, n) to range(2, int(n**0.5) + 1)', 'Change range(2, n) to range(1, n)', 'Add break after return False'],
   1, 90, 1, true),

  ('MS_V9_STEM_SCI', 'STEM_SCI', 'MCQ', 'Lab Mystery',
   'A biology student is growing bacteria cultures. According to their textbook, E. coli should double every 20 minutes at 37°C with nutrients.

They set up the experiment correctly but notice the population is doubling every 45 minutes instead.',
   'What is the most likely explanation for this unexpected result?',
   ARRAY['The textbook is wrong', 'The student made a counting error', 'The bacteria strain has a mutation affecting growth rate', 'The thermometer is broken'],
   2, 90, 2, true),

  ('MS_V9_HUMANITIES', 'HUMANITIES', 'MCQ', 'Source Analysis',
   'A historian finds two accounts of the same medieval battle. Source A was written by a monk 50 years after the event. Source B was written by a soldier who fought in the battle but was on the losing side.',
   'Which statement best evaluates these sources?',
   ARRAY['Source A is more reliable because monks were educated', 'Source B is more reliable because it is an eyewitness account', 'Both sources have limitations that affect their reliability', 'Neither source can tell us anything useful about the battle'],
   2, 90, 3, true),

  ('MS_V9_SOCIAL_SCI', 'SOCIAL_SCI', 'MCQ', 'Data Interpretation',
   'A study finds that countries with more ice cream sales also have higher crime rates. The researchers collected data from 50 countries over 10 years.',
   'What is the most appropriate conclusion from this data?',
   ARRAY['Ice cream causes crime', 'Crime causes ice cream sales', 'A third variable likely explains both', 'The study methodology is flawed'],
   2, 90, 4, true),

  ('MS_V9_PROFESSIONAL', 'PROFESSIONAL', 'MCQ', 'Ethical Dilemma',
   'A junior doctor discovers that a senior colleague has been making small errors in patient records. No patients have been harmed, but the pattern is concerning.',
   'What should the junior doctor do first?',
   ARRAY['Report immediately to hospital management', 'Confront the senior colleague privately', 'Document the errors and seek advice from a mentor', 'Ignore it since no harm has occurred'],
   2, 90, 5, true),

  ('MS_V9_CREATIVE', 'CREATIVE', 'MCQ', 'Design Thinking',
   'A designer is creating a mobile app for elderly users. User testing reveals that people over 70 struggle with the small touch targets and complex navigation.',
   'Which design principle should take priority?',
   ARRAY['Visual aesthetics to appeal to younger family members', 'Accessibility with larger buttons and simpler navigation', 'Feature richness to compete with other apps', 'Modern design trends to appear up-to-date'],
   1, 90, 6, true)
) AS v(id, meta_cluster, task_type, title, stimulus, question, options, correct_answer, time_limit_seconds, sort_order, active)
WHERE NOT EXISTS (SELECT 1 FROM bo_v1_mini_samples LIMIT 1);

-- Verify
SELECT 'Mini-samples count:' as status, COUNT(*) as count FROM bo_v1_mini_samples;
