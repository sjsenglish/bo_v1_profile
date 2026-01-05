# Fix for 406 and 403 API Errors

## Problem Summary

The application is experiencing two critical errors:

1. **406 Error** on `/bo_v1_sessions?select=id&user_id=eq.[uuid]`
   - Cause: Code trying to query `user_id` column that doesn't exist in table

2. **403 Error** on `/bo_v1_profiles?on_conflict=session_id`
   - Cause: RLS policies blocking upsert due to missing session-user linkage

3. **Dashboard not generating**
   - Cause: Cascading failure from above errors

## Root Cause

The `bo_v1_sessions` table is missing a `user_id` column, but the application code in `src/app/page.tsx` assumes it exists (lines 61, 73). This was likely overlooked when implementing authentication.

## Solution Applied

### Files Modified:
1. **supabase/migrations/20250105000004_add_user_id_to_sessions.sql** (NEW)
   - Adds `user_id` column to `bo_v1_sessions`
   - Creates index for performance
   - Updates RLS policies to allow user-specific access

2. **supabase/migrations/20250105000005_fix_profiles_rls.sql** (NEW)
   - Updates `bo_v1_profiles` RLS policies
   - Ensures profile operations check session ownership

3. **seeds/001_schema.sql** (UPDATED)
   - Added `user_id` column to base schema
   - Updated RLS policies for consistency

## How to Apply the Fix

### Option 1: Via Supabase Dashboard (Recommended)
1. Log into Supabase Dashboard
2. Go to SQL Editor
3. Run the migrations in order:
   ```sql
   -- First, run: supabase/migrations/20250105000004_add_user_id_to_sessions.sql
   -- Then, run: supabase/migrations/20250105000005_fix_profiles_rls.sql
   ```

### Option 2: Via Supabase CLI
```bash
# Pull remote changes first (if any)
npx supabase db pull

# Push migrations
npx supabase db push

# Or apply individually
npx supabase migration up
```

### Option 3: Manual SQL Execution
Copy and execute the SQL from both migration files directly in your database.

## Verification

After applying the migrations, verify:

1. **Column exists:**
   ```sql
   SELECT column_name, data_type
   FROM information_schema.columns
   WHERE table_name = 'bo_v1_sessions' AND column_name = 'user_id';
   ```

2. **Policies updated:**
   ```sql
   SELECT policyname FROM pg_policies WHERE tablename = 'bo_v1_sessions';
   SELECT policyname FROM pg_policies WHERE tablename = 'bo_v1_profiles';
   ```

3. **Test the application:**
   - Start a new assessment
   - Check browser console for errors
   - Complete assessment and verify dashboard generates

## Rollback (if needed)

If issues occur, rollback:
```sql
-- Drop policies
DROP POLICY IF EXISTS "Allow insert for authenticated and anonymous" ON bo_v1_sessions;
DROP POLICY IF EXISTS "Allow select for own sessions" ON bo_v1_sessions;
DROP POLICY IF EXISTS "Allow update for own sessions" ON bo_v1_sessions;

-- Recreate old policies
CREATE POLICY "Allow anonymous insert" ON bo_v1_sessions FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous select" ON bo_v1_sessions FOR SELECT USING (true);
CREATE POLICY "Allow anonymous update" ON bo_v1_sessions FOR UPDATE USING (true);

-- Note: Don't drop user_id column if data exists
```

## Notes

- The `user_id` column is nullable to support anonymous sessions
- RLS policies allow both anonymous (`user_id IS NULL`) and authenticated access
- Existing anonymous sessions will continue to work
- Index on `user_id` improves query performance for authenticated users
