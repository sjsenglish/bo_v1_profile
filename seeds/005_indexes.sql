-- ExamRizz Arena v6.0 - Performance Indexes
-- Run this AFTER all other seeds

-- ============================================
-- INDEXES FOR QUERY PERFORMANCE
-- ============================================

-- Session lookups
CREATE INDEX IF NOT EXISTS idx_profiles_session ON bo_v1_profiles(session_id);
CREATE INDEX IF NOT EXISTS idx_vibe_swipes_session ON bo_v1_vibe_swipes(session_id);
CREATE INDEX IF NOT EXISTS idx_diagnostic_responses_session ON bo_v1_diagnostic_responses(session_id);
CREATE INDEX IF NOT EXISTS idx_benchmark_responses_session ON bo_v1_benchmark_responses(session_id);
CREATE INDEX IF NOT EXISTS idx_matches_session ON bo_v1_matches(session_id);
CREATE INDEX IF NOT EXISTS idx_matches_rank ON bo_v1_matches(session_id, rank);

-- Course filtering
CREATE INDEX IF NOT EXISTS idx_courses_cah ON bo_v1_courses(cah_code);
CREATE INDEX IF NOT EXISTS idx_courses_university ON bo_v1_courses(university);
CREATE INDEX IF NOT EXISTS idx_courses_region ON bo_v1_courses(region);
CREATE INDEX IF NOT EXISTS idx_courses_russell ON bo_v1_courses(russell_group) WHERE russell_group = true;
CREATE INDEX IF NOT EXISTS idx_courses_active ON bo_v1_courses(is_active) WHERE is_active = true;

-- Subject tags (GIN for array contains)
CREATE INDEX IF NOT EXISTS idx_courses_tags ON bo_v1_courses USING GIN(subject_tags);

-- Question lookups
CREATE INDEX IF NOT EXISTS idx_questions_dimension ON bo_v1_questions(dimension);
CREATE INDEX IF NOT EXISTS idx_questions_tier ON bo_v1_questions(tier);
CREATE INDEX IF NOT EXISTS idx_questions_active ON bo_v1_questions(active) WHERE active = true;

-- Profile progression
CREATE INDEX IF NOT EXISTS idx_profiles_level ON bo_v1_profiles(level DESC);
CREATE INDEX IF NOT EXISTS idx_profiles_xp ON bo_v1_profiles(total_xp DESC);

-- ============================================
-- VERIFY INDEXES CREATED
-- ============================================

SELECT 
  schemaname,
  tablename,
  indexname
FROM pg_indexes 
WHERE tablename LIKE 'bo_v1_%'
ORDER BY tablename, indexname;
