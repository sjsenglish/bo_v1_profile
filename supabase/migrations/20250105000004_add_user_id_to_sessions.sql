-- Add user_id column to bo_v1_sessions table
-- This links sessions to authenticated users for multi-device persistence

ALTER TABLE bo_v1_sessions
  ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE;

-- Create index for faster lookups by user_id
CREATE INDEX IF NOT EXISTS idx_bo_v1_sessions_user_id ON bo_v1_sessions(user_id);

-- Update RLS policies to allow users to access their own sessions
-- Drop existing policies
DROP POLICY IF EXISTS "Allow anonymous insert" ON bo_v1_sessions;
DROP POLICY IF EXISTS "Allow anonymous select" ON bo_v1_sessions;
DROP POLICY IF EXISTS "Allow anonymous update" ON bo_v1_sessions;

-- Create new policies that allow both anonymous and authenticated access
CREATE POLICY "Allow insert for authenticated and anonymous"
  ON bo_v1_sessions FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Allow select for own sessions"
  ON bo_v1_sessions FOR SELECT
  USING (
    user_id IS NULL OR -- Allow anonymous sessions
    user_id = auth.uid() -- Allow users to see their own sessions
  );

CREATE POLICY "Allow update for own sessions"
  ON bo_v1_sessions FOR UPDATE
  USING (
    user_id IS NULL OR -- Allow anonymous sessions
    user_id = auth.uid() -- Allow users to update their own sessions
  );
