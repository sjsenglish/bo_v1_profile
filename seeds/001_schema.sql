-- ExamRizz Arena v6.0 - Database Schema
-- Run this FIRST in Supabase SQL Editor

-- ============================================
-- CORE TABLES
-- ============================================

-- Sessions (assessment state tracking)
CREATE TABLE IF NOT EXISTS bo_v1_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  completed_at TIMESTAMPTZ,

  -- Progress flags
  vibe_completed BOOLEAN DEFAULT FALSE,
  vibe_skipped BOOLEAN DEFAULT FALSE,
  cognitive_completed BOOLEAN DEFAULT FALSE,
  behavioral_completed BOOLEAN DEFAULT FALSE,
  behavioral_skipped BOOLEAN DEFAULT FALSE,

  -- Counts
  questions_answered INTEGER DEFAULT 0,
  questions_skipped INTEGER DEFAULT 0,
  benchmarks_completed INTEGER DEFAULT 0
);

-- Index for user_id lookups
CREATE INDEX IF NOT EXISTS idx_bo_v1_sessions_user_id ON bo_v1_sessions(user_id);

-- Profiles (computed student characteristics)
CREATE TABLE IF NOT EXISTS bo_v1_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE UNIQUE,
  
  -- Vibe output
  vibe_tags TEXT[] DEFAULT '{}',
  subject_weights JSONB DEFAULT '{}',
  environment_weights JSONB DEFAULT '{}',
  
  -- Cognitive dispositions (value + sigma)
  calibration INTEGER DEFAULT 50,
  calibration_sigma INTEGER DEFAULT 20,
  tolerance INTEGER DEFAULT 50,
  tolerance_sigma INTEGER DEFAULT 20,
  transfer INTEGER DEFAULT 50,
  transfer_sigma INTEGER DEFAULT 20,
  precision INTEGER DEFAULT 50,
  precision_sigma INTEGER DEFAULT 20,
  retrieval INTEGER DEFAULT 50,
  retrieval_sigma INTEGER DEFAULT 20,
  receptivity INTEGER DEFAULT 50,
  receptivity_sigma INTEGER DEFAULT 20,
  
  -- Behavioral dispositions (value + sigma)
  structure INTEGER DEFAULT 50,
  structure_sigma INTEGER DEFAULT 20,
  consistency INTEGER DEFAULT 50,
  consistency_sigma INTEGER DEFAULT 20,
  social INTEGER DEFAULT 50,
  social_sigma INTEGER DEFAULT 20,
  depth INTEGER DEFAULT 50,
  depth_sigma INTEGER DEFAULT 20,
  
  -- Capacities (value + sigma + provenance)
  vrb_value INTEGER DEFAULT 50,
  vrb_sigma INTEGER DEFAULT 20,
  vrb_provenance TEXT DEFAULT 'PRIOR',
  qnt_value INTEGER DEFAULT 50,
  qnt_sigma INTEGER DEFAULT 20,
  qnt_provenance TEXT DEFAULT 'PRIOR',
  spd_value INTEGER DEFAULT 50,
  spd_sigma INTEGER DEFAULT 20,
  spd_provenance TEXT DEFAULT 'PRIOR',
  
  -- Identity
  familiar_id TEXT,
  familiar_stage INTEGER DEFAULT 1,
  guild_id TEXT,
  dominant TEXT,
  nemesis TEXT,
  
  -- Progression
  level INTEGER DEFAULT 1,
  total_xp INTEGER DEFAULT 0,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  last_active_date DATE,
  
  -- Grade
  grade_letter TEXT DEFAULT 'F',
  grade_percentage INTEGER DEFAULT 0,
  precision_score INTEGER DEFAULT 0,
  completeness_score INTEGER DEFAULT 0,
  uniqueness_score INTEGER DEFAULT 0,
  
  -- Badges & preferences
  badges TEXT[] DEFAULT '{}',
  target_courses TEXT[] DEFAULT '{}',
  theme TEXT DEFAULT 'default',
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Courses (HESA Discover Uni dataset - 30,960 courses)
CREATE TABLE IF NOT EXISTS bo_v1_courses (
  -- HESA Standard Identifiers
  id TEXT PRIMARY KEY,
  ukprn TEXT,
  kis_course_id TEXT,
  course_url TEXT,
  university_ukprn TEXT,
  
  -- Basic info
  university TEXT NOT NULL,
  course_name TEXT NOT NULL,
  ucas_code TEXT,
  degree_type TEXT,
  duration_years INTEGER,
  study_mode TEXT,
  sandwich_year BOOLEAN DEFAULT false,
  year_abroad BOOLEAN DEFAULT false,
  
  -- Geographic & classification
  region TEXT,
  russell_group BOOLEAN DEFAULT false,
  subject_area TEXT,
  cah_code TEXT,
  course_type TEXT,
  subject_tags TEXT[] DEFAULT '{}',
  accredited BOOLEAN DEFAULT false,
  
  -- Entry requirements
  typical_offer TEXT,
  ucas_points INTEGER,
  
  -- Authentic outcome data (from HESA)
  nss_overall INTEGER,
  nss_teaching INTEGER,
  nss_feedback INTEGER,
  employment_rate INTEGER,
  continuation_rate INTEGER,
  median_salary_3yr INTEGER,
  median_salary_5yr INTEGER,
  
  -- Teaching structure
  assessment_exam_pct INTEGER,
  assessment_coursework_pct INTEGER,
  assessment_practical_pct INTEGER,
  scheduled_hours INTEGER,
  
  -- Derived disposition demands (0-100)
  demand_calibration INTEGER NOT NULL,
  demand_tolerance INTEGER NOT NULL,
  demand_transfer INTEGER NOT NULL,
  demand_precision INTEGER NOT NULL,
  demand_retrieval INTEGER NOT NULL,
  demand_receptivity INTEGER NOT NULL,
  demand_structure INTEGER DEFAULT 50,
  demand_consistency INTEGER DEFAULT 50,
  demand_social INTEGER DEFAULT 50,
  demand_depth INTEGER DEFAULT 50,
  
  -- Importance levels
  importance_calibration TEXT DEFAULT 'IMPORTANT',
  importance_tolerance TEXT DEFAULT 'IMPORTANT',
  importance_transfer TEXT DEFAULT 'IMPORTANT',
  importance_precision TEXT DEFAULT 'IMPORTANT',
  importance_retrieval TEXT DEFAULT 'IMPORTANT',
  importance_receptivity TEXT DEFAULT 'IMPORTANT',
  
  -- Derivation metadata
  derivation_confidence NUMERIC,
  data_completeness NUMERIC,
  academic_year TEXT,
  is_active BOOLEAN DEFAULT true,
  
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- RESPONSE TABLES
-- ============================================

-- Vibe swipes
CREATE TABLE IF NOT EXISTS bo_v1_vibe_swipes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  card_id TEXT NOT NULL,
  direction TEXT NOT NULL CHECK (direction IN ('LEFT', 'RIGHT', 'SKIP')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Diagnostic responses
CREATE TABLE IF NOT EXISTS bo_v1_diagnostic_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  question_id TEXT NOT NULL,
  value INTEGER CHECK (value BETWEEN 1 AND 5),
  skipped BOOLEAN DEFAULT FALSE,
  response_time_ms INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Benchmark responses
CREATE TABLE IF NOT EXISTS bo_v1_benchmark_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  capacity_id TEXT NOT NULL CHECK (capacity_id IN ('VRB', 'QNT', 'SPD')),
  item_id TEXT NOT NULL,
  response TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL,
  response_time_ms INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Match results (cached)
CREATE TABLE IF NOT EXISTS bo_v1_matches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  course_id TEXT REFERENCES bo_v1_courses(id),
  score INTEGER NOT NULL,
  fit_score INTEGER NOT NULL,
  friction TEXT NOT NULL,
  explanation JSONB,
  rank INTEGER NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(session_id, course_id)
);

-- ============================================
-- CONTENT TABLES
-- ============================================

-- Questions (infinite pool with tiers)
CREATE TABLE IF NOT EXISTS bo_v1_questions (
  id TEXT PRIMARY KEY,
  dimension TEXT NOT NULL,
  tier TEXT NOT NULL CHECK (tier IN ('CORE', 'EXTENDED', 'DEEP', 'EXPERT')),
  text TEXT NOT NULL,
  reverse_scored BOOLEAN DEFAULT FALSE,
  weight NUMERIC(3,2) DEFAULT 1.0,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Vibe cards
CREATE TABLE IF NOT EXISTS bo_v1_vibe_cards (
  id TEXT PRIMARY KEY,
  image_url TEXT NOT NULL,
  alt_text TEXT NOT NULL,
  right_tags TEXT[] NOT NULL,
  left_tags TEXT[] NOT NULL,
  disposition_nudge JSONB,
  sort_order INTEGER,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Familiars (spirit animals)
CREATE TABLE IF NOT EXISTS bo_v1_familiars (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  element TEXT NOT NULL,
  tagline TEXT NOT NULL,
  rarity TEXT NOT NULL CHECK (rarity IN ('COMMON', 'RARE')),
  rarity_pct NUMERIC(4,2),
  bias_dimensions TEXT[] DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Guilds
CREATE TABLE IF NOT EXISTS bo_v1_guilds (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  motto TEXT NOT NULL,
  formula JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Quest definitions (supercurricular tasks)
CREATE TABLE IF NOT EXISTS bo_v1_quests (
  id TEXT PRIMARY KEY,
  type TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  disposition_target TEXT,
  course_relevance TEXT[],
  difficulty TEXT DEFAULT 'MEDIUM',
  time_estimate TEXT,
  xp_reward INTEGER DEFAULT 50,
  badge_reward TEXT,
  content_url TEXT,
  content_metadata JSONB,
  min_level INTEGER DEFAULT 1,
  prerequisite_quests TEXT[],
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Feed items (academic resources)
CREATE TABLE IF NOT EXISTS bo_v1_feed_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type TEXT NOT NULL,
  title TEXT NOT NULL,
  body TEXT,
  url TEXT,
  thumbnail TEXT,
  author_type TEXT NOT NULL,
  author_profile_id UUID REFERENCES bo_v1_profiles(id),
  author_name TEXT,
  disposition_tags TEXT[] DEFAULT '{}',
  course_tags TEXT[] DEFAULT '{}',
  difficulty TEXT DEFAULT 'INTERMEDIATE',
  upvotes INTEGER DEFAULT 0,
  saves INTEGER DEFAULT 0,
  status TEXT DEFAULT 'PENDING',
  source TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================

-- Enable RLS on all tables
ALTER TABLE bo_v1_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_vibe_swipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_diagnostic_responses ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_benchmark_responses ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_matches ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_vibe_cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_familiars ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_guilds ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_quests ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_feed_items ENABLE ROW LEVEL SECURITY;

-- Allow access for both anonymous and authenticated users
CREATE POLICY "Allow insert for authenticated and anonymous" ON bo_v1_sessions FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow select for own sessions" ON bo_v1_sessions FOR SELECT USING (user_id IS NULL OR user_id = auth.uid());
CREATE POLICY "Allow update for own sessions" ON bo_v1_sessions FOR UPDATE USING (user_id IS NULL OR user_id = auth.uid());

CREATE POLICY "Allow insert for own profiles" ON bo_v1_profiles FOR INSERT WITH CHECK (
  EXISTS (
    SELECT 1 FROM bo_v1_sessions
    WHERE bo_v1_sessions.id = bo_v1_profiles.session_id
    AND (bo_v1_sessions.user_id IS NULL OR bo_v1_sessions.user_id = auth.uid())
  )
);
CREATE POLICY "Allow select for own profiles" ON bo_v1_profiles FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM bo_v1_sessions
    WHERE bo_v1_sessions.id = bo_v1_profiles.session_id
    AND (bo_v1_sessions.user_id IS NULL OR bo_v1_sessions.user_id = auth.uid())
  )
);
CREATE POLICY "Allow update for own profiles" ON bo_v1_profiles FOR UPDATE USING (
  EXISTS (
    SELECT 1 FROM bo_v1_sessions
    WHERE bo_v1_sessions.id = bo_v1_profiles.session_id
    AND (bo_v1_sessions.user_id IS NULL OR bo_v1_sessions.user_id = auth.uid())
  )
);

CREATE POLICY "Allow anonymous insert" ON bo_v1_vibe_swipes FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_vibe_swipes FOR SELECT USING (true);

CREATE POLICY "Allow anonymous insert" ON bo_v1_diagnostic_responses FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_diagnostic_responses FOR SELECT USING (true);

CREATE POLICY "Allow anonymous insert" ON bo_v1_benchmark_responses FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_benchmark_responses FOR SELECT USING (true);

CREATE POLICY "Allow anonymous insert" ON bo_v1_matches FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_matches FOR SELECT USING (true);

-- Read-only for content tables
CREATE POLICY "Allow public read" ON bo_v1_courses FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON bo_v1_questions FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON bo_v1_vibe_cards FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON bo_v1_familiars FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON bo_v1_guilds FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON bo_v1_quests FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON bo_v1_feed_items FOR SELECT USING (true);

-- Done!
SELECT 'Schema created successfully!' as status;
