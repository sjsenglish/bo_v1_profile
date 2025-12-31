-- ExamRizz Arena - Capacity Benchmark Response Tables
-- Run after 007_vrb_items.sql and 008_qnt_items.sql

-- ============================================
-- CAPACITY RESPONSES TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS bo_v1_capacity_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  item_id TEXT REFERENCES bo_v1_capacity_items(id),
  
  -- Response data
  response JSONB NOT NULL,              -- Flexible: string, array, object depending on type
  score NUMERIC(3,2) NOT NULL,
  max_score NUMERIC(3,2) NOT NULL,
  response_time_ms INTEGER,
  
  -- Item context (denormalised for analytics)
  capacity_type TEXT NOT NULL,
  tier TEXT NOT NULL,
  block TEXT NOT NULL,
  interaction_type TEXT NOT NULL,
  
  -- LLM scoring (for SHORT_RESPONSE items)
  llm_raw_response JSONB,               -- Full LLM response
  llm_score_reason TEXT,                -- LLM's explanation
  
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_capacity_responses_session 
ON bo_v1_capacity_responses(session_id);

CREATE INDEX IF NOT EXISTS idx_capacity_responses_item 
ON bo_v1_capacity_responses(item_id);

CREATE INDEX IF NOT EXISTS idx_capacity_responses_type 
ON bo_v1_capacity_responses(capacity_type, session_id);

-- ============================================
-- CAPACITY RESULTS TABLE (Aggregated)
-- ============================================

CREATE TABLE IF NOT EXISTS bo_v1_capacity_results (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE UNIQUE,
  
  -- VRB Results
  vrb_raw_score NUMERIC(5,2),
  vrb_max_score NUMERIC(5,2),
  vrb_weighted_score NUMERIC(5,2),
  vrb_value INTEGER,                    -- 0-100 final score
  vrb_sigma INTEGER,                    -- Uncertainty
  vrb_items_completed INTEGER DEFAULT 0,
  vrb_tier_distribution JSONB,          -- {"FOUNDATION": 4, "STANDARD": 6, "CHALLENGE": 2}
  vrb_block_performance JSONB,          -- {"INFERENCE": {"score": 3, "max": 4}, ...}
  vrb_avg_response_time_ms INTEGER,
  vrb_calibration_response TEXT,        -- SOLID, MIXED, STRUGGLING
  vrb_enjoyment_response TEXT,          -- TEDIOUS, FINE, ENJOYED
  vrb_calibration_signal TEXT,          -- OVERCONFIDENT, CALIBRATED, UNDERCONFIDENT
  vrb_flags TEXT[],                     -- ["WEAK_ARGUMENT"] etc.
  vrb_completed_at TIMESTAMPTZ,
  
  -- QNT Results
  qnt_raw_score NUMERIC(5,2),
  qnt_max_score NUMERIC(5,2),
  qnt_weighted_score NUMERIC(5,2),
  qnt_value INTEGER,
  qnt_sigma INTEGER,
  qnt_items_completed INTEGER DEFAULT 0,
  qnt_tier_distribution JSONB,
  qnt_block_performance JSONB,
  qnt_avg_response_time_ms INTEGER,
  qnt_calibration_response TEXT,
  qnt_enjoyment_response TEXT,
  qnt_calibration_signal TEXT,
  qnt_flags TEXT[],
  qnt_completed_at TIMESTAMPTZ,
  
  -- ABS Results (placeholder for future)
  abs_value INTEGER,
  abs_sigma INTEGER,
  abs_items_completed INTEGER DEFAULT 0,
  abs_completed_at TIMESTAMPTZ,
  
  -- SPD Results (placeholder for future)
  spd_value INTEGER,
  spd_sigma INTEGER,
  spd_items_completed INTEGER DEFAULT 0,
  spd_completed_at TIMESTAMPTZ,
  
  -- Meta
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- CAT STATE TABLE (Adaptive Testing State)
-- ============================================

CREATE TABLE IF NOT EXISTS bo_v1_cat_state (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id) ON DELETE CASCADE,
  capacity_type TEXT NOT NULL CHECK (capacity_type IN ('VRB', 'QNT', 'ABS', 'SPD')),
  
  -- Current state
  current_tier TEXT DEFAULT 'STANDARD',
  tier_locked BOOLEAN DEFAULT FALSE,
  items_administered TEXT[] DEFAULT '{}',   -- IDs of items already shown
  items_remaining INTEGER DEFAULT 12,
  
  -- Running performance
  correct_count INTEGER DEFAULT 0,
  total_count INTEGER DEFAULT 0,
  avg_response_time_ms INTEGER,
  
  -- Theta estimate (IRT ability estimate)
  theta_estimate NUMERIC(4,2) DEFAULT 0.0,
  theta_se NUMERIC(4,2) DEFAULT 1.0,        -- Standard error
  
  -- Timestamps
  started_at TIMESTAMPTZ DEFAULT NOW(),
  last_item_at TIMESTAMPTZ,
  
  UNIQUE(session_id, capacity_type)
);

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

-- Function to get next item based on CAT state
CREATE OR REPLACE FUNCTION bo_v1_get_next_capacity_item(
  p_session_id UUID,
  p_capacity_type TEXT
) RETURNS TABLE (
  item_id TEXT,
  tier TEXT,
  interaction_type TEXT,
  stimulus TEXT,
  question TEXT,
  options JSONB,
  time_limit_seconds INTEGER
) AS $$
DECLARE
  v_current_tier TEXT;
  v_items_administered TEXT[];
BEGIN
  -- Get current CAT state
  SELECT current_tier, items_administered 
  INTO v_current_tier, v_items_administered
  FROM bo_v1_cat_state
  WHERE session_id = p_session_id AND capacity_type = p_capacity_type;
  
  -- Default to STANDARD if no state exists
  IF v_current_tier IS NULL THEN
    v_current_tier := 'STANDARD';
    v_items_administered := '{}';
  END IF;
  
  -- Return next item from current tier that hasn't been administered
  RETURN QUERY
  SELECT 
    ci.id,
    ci.tier,
    ci.interaction_type,
    ci.stimulus,
    ci.question,
    ci.options,
    ci.time_limit_seconds
  FROM bo_v1_capacity_items ci
  WHERE ci.capacity_type = p_capacity_type
    AND ci.tier = v_current_tier
    AND ci.active = TRUE
    AND ci.id != ALL(v_items_administered)
  ORDER BY RANDOM()
  LIMIT 1;
END;
$$ LANGUAGE plpgsql;

-- Function to update CAT state after response
CREATE OR REPLACE FUNCTION bo_v1_update_cat_state(
  p_session_id UUID,
  p_capacity_type TEXT,
  p_item_id TEXT,
  p_is_correct BOOLEAN,
  p_response_time_ms INTEGER
) RETURNS VOID AS $$
DECLARE
  v_state RECORD;
  v_new_tier TEXT;
  v_item_tier TEXT;
BEGIN
  -- Get item tier
  SELECT tier INTO v_item_tier FROM bo_v1_capacity_items WHERE id = p_item_id;
  
  -- Get or create CAT state
  INSERT INTO bo_v1_cat_state (session_id, capacity_type)
  VALUES (p_session_id, p_capacity_type)
  ON CONFLICT (session_id, capacity_type) DO NOTHING;
  
  SELECT * INTO v_state FROM bo_v1_cat_state
  WHERE session_id = p_session_id AND capacity_type = p_capacity_type;
  
  -- Update counts
  UPDATE bo_v1_cat_state SET
    items_administered = array_append(items_administered, p_item_id),
    items_remaining = items_remaining - 1,
    correct_count = correct_count + CASE WHEN p_is_correct THEN 1 ELSE 0 END,
    total_count = total_count + 1,
    avg_response_time_ms = COALESCE(
      (COALESCE(avg_response_time_ms, 0) * total_count + p_response_time_ms) / (total_count + 1),
      p_response_time_ms
    ),
    last_item_at = NOW()
  WHERE session_id = p_session_id AND capacity_type = p_capacity_type;
  
  -- Refresh state
  SELECT * INTO v_state FROM bo_v1_cat_state
  WHERE session_id = p_session_id AND capacity_type = p_capacity_type;
  
  -- Adapt tier if not locked (first 4 items)
  IF NOT v_state.tier_locked AND v_state.total_count <= 4 THEN
    -- Calculate performance
    IF v_state.correct_count::float / v_state.total_count >= 0.75 
       AND COALESCE(v_state.avg_response_time_ms, 99999) < 35000 THEN
      v_new_tier := 'CHALLENGE';
    ELSIF v_state.correct_count::float / v_state.total_count <= 0.4 THEN
      v_new_tier := 'FOUNDATION';
    ELSE
      v_new_tier := 'STANDARD';
    END IF;
    
    UPDATE bo_v1_cat_state SET current_tier = v_new_tier
    WHERE session_id = p_session_id AND capacity_type = p_capacity_type;
  END IF;
  
  -- Lock tier after 4 items
  IF v_state.total_count >= 4 AND NOT v_state.tier_locked THEN
    UPDATE bo_v1_cat_state SET tier_locked = TRUE
    WHERE session_id = p_session_id AND capacity_type = p_capacity_type;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- Function to calculate final capacity score
CREATE OR REPLACE FUNCTION bo_v1_calculate_capacity_score(
  p_session_id UUID,
  p_capacity_type TEXT
) RETURNS TABLE (
  value INTEGER,
  sigma INTEGER,
  raw_score NUMERIC,
  max_score NUMERIC,
  weighted_score NUMERIC
) AS $$
DECLARE
  v_tier_weights JSONB := '{"FOUNDATION": 0.8, "STANDARD": 1.0, "CHALLENGE": 1.25}';
  v_weighted_sum NUMERIC := 0;
  v_weighted_max NUMERIC := 0;
  v_response RECORD;
  v_weight NUMERIC;
  v_percentage NUMERIC;
  v_raw NUMERIC := 0;
  v_max NUMERIC := 0;
BEGIN
  -- Calculate weighted scores
  FOR v_response IN 
    SELECT cr.score, cr.max_score, cr.tier
    FROM bo_v1_capacity_responses cr
    WHERE cr.session_id = p_session_id AND cr.capacity_type = p_capacity_type
  LOOP
    v_weight := (v_tier_weights->>v_response.tier)::NUMERIC;
    v_weighted_sum := v_weighted_sum + (v_response.score * v_weight);
    v_weighted_max := v_weighted_max + (v_response.max_score * v_weight);
    v_raw := v_raw + v_response.score;
    v_max := v_max + v_response.max_score;
  END LOOP;
  
  -- Calculate percentage and convert to 0-100
  IF v_weighted_max > 0 THEN
    v_percentage := v_weighted_sum / v_weighted_max;
    value := GREATEST(0, LEAST(100, ROUND(50 + (v_percentage - 0.5) * 80)));
  ELSE
    value := 50;
  END IF;
  
  -- Sigma based on item count (reduces with more items)
  sigma := GREATEST(8, 20 - (SELECT COUNT(*) FROM bo_v1_capacity_responses 
                             WHERE session_id = p_session_id AND capacity_type = p_capacity_type));
  
  raw_score := v_raw;
  max_score := v_max;
  weighted_score := v_weighted_sum;
  
  RETURN NEXT;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================

ALTER TABLE bo_v1_capacity_responses ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_capacity_results ENABLE ROW LEVEL SECURITY;
ALTER TABLE bo_v1_cat_state ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous insert" ON bo_v1_capacity_responses FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_capacity_responses FOR SELECT USING (true);

CREATE POLICY "Allow anonymous insert" ON bo_v1_capacity_results FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_capacity_results FOR SELECT USING (true);
CREATE POLICY "Allow anonymous update" ON bo_v1_capacity_results FOR UPDATE USING (true);

CREATE POLICY "Allow anonymous insert" ON bo_v1_cat_state FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_cat_state FOR SELECT USING (true);
CREATE POLICY "Allow anonymous update" ON bo_v1_cat_state FOR UPDATE USING (true);

-- ============================================
-- VERIFY
-- ============================================

SELECT 'Capacity benchmark schema created successfully!' as status;

-- Check tables exist
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_name IN (
    'bo_v1_capacity_items',
    'bo_v1_capacity_responses', 
    'bo_v1_capacity_results',
    'bo_v1_cat_state'
  );

-- Check functions exist
SELECT routine_name 
FROM information_schema.routines 
WHERE routine_schema = 'public' 
  AND routine_name LIKE 'bo_v1_%capacity%';
