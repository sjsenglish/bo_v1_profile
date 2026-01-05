-- Fix RLS policies for bo_v1_profiles to work with authenticated users
-- This ensures profile upserts work correctly during the assessment flow

-- Drop existing policies
DROP POLICY IF EXISTS "Allow anonymous insert" ON bo_v1_profiles;
DROP POLICY IF EXISTS "Allow anonymous select" ON bo_v1_profiles;
DROP POLICY IF EXISTS "Allow anonymous update" ON bo_v1_profiles;

-- Create new policies that check session ownership
CREATE POLICY "Allow insert for own profiles"
  ON bo_v1_profiles FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM bo_v1_sessions
      WHERE bo_v1_sessions.id = bo_v1_profiles.session_id
      AND (bo_v1_sessions.user_id IS NULL OR bo_v1_sessions.user_id = auth.uid())
    )
  );

CREATE POLICY "Allow select for own profiles"
  ON bo_v1_profiles FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM bo_v1_sessions
      WHERE bo_v1_sessions.id = bo_v1_profiles.session_id
      AND (bo_v1_sessions.user_id IS NULL OR bo_v1_sessions.user_id = auth.uid())
    )
  );

CREATE POLICY "Allow update for own profiles"
  ON bo_v1_profiles FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM bo_v1_sessions
      WHERE bo_v1_sessions.id = bo_v1_profiles.session_id
      AND (bo_v1_sessions.user_id IS NULL OR bo_v1_sessions.user_id = auth.uid())
    )
  );
