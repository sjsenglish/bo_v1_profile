const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

// Load environment variables from .env.local manually to avoid adding dotenv dependency
try {
    const envPath = path.resolve(__dirname, '../.env.local');
    if (fs.existsSync(envPath)) {
        const envConfig = fs.readFileSync(envPath, 'utf8');
        envConfig.split('\n').forEach(line => {
            const match = line.match(/^([^=]+)=(.*)$/);
            if (match) {
                const key = match[1].trim();
                const value = match[2].trim().replace(/^['"]|['"]$/g, ''); // Remove quotes if present
                process.env[key] = value;
            }
        });
    } else {
        console.warn('.env.local file not found. ensure environment variables are set.');
    }
} catch (e) {
    console.error('Error loading .env.local:', e);
}

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
// If user has a service role key, it would be better, but we only saw anon key in .env.local.
// Using anon key might limit access if RLS is strict. We will try with anon key. 
// If it fails, we will report it.

if (!supabaseUrl || !supabaseKey) {
    console.error('Error: NEXT_PUBLIC_SUPABASE_URL or NEXT_PUBLIC_SUPABASE_ANON_KEY not found in environment.');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const TABLES_TO_BACKUP = [
    // Core & Assessment
    'bo_v1_sessions',
    'bo_v1_profiles',
    'bo_v1_courses',
    'bo_v1_vibe_swipes',
    'bo_v1_diagnostic_responses',
    'bo_v1_benchmark_responses',
    'bo_v1_matches',
    'bo_v1_questions',
    'bo_v1_vibe_cards',
    'bo_v1_familiars',
    'bo_v1_guilds',
    'bo_v1_quests',
    'bo_v1_feed_items',

    // Capacity / Experiential
    'bo_v1_experiential_tasks',
    'bo_v1_experiential_responses',
    'bo_v1_capacity_items',
    'bo_v1_capacity_responses',
    'bo_v1_capacity_results',
    'bo_v1_cat_state',

    // New / Additions
    'bo_v1_mini_sample_items',
    'bo_v1_mini_sample_responses',
    'bo_v1_match_feedback',
    'bo_v1_assessment_state',

    // Supercurricular & Validation
    'bo_v1_supercurriculars',
    'bo_v1_supercurricular_staging',
    'bo_v1_validation_flags',
    'bo_v1_validation_batches',
    'bo_v1_supercurricular_curation'
];

async function backup() {
    console.log('Starting Supabase backup...');
    console.log(`URL: ${supabaseUrl}`);

    // Test connection
    const { data: testData, error: testError } = await supabase.from('bo_v1_sessions').select('count', { count: 'exact', head: true });

    if (testError) {
        console.error('Connection verification failed:', testError.message);
        // If table doesn't exist or RLS blocks counting, this might fail.
        // But we proceed to try backing up anyway.
    } else {
        console.log('Connection verified successfully.');
    }

    const backupData = {};
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const backupFile = path.resolve(__dirname, `../backups/${timestamp}_bo_v1_backup.json`);

    for (const table of TABLES_TO_BACKUP) {
        console.log(`Backing up table: ${table}...`);
        // Fetch all rows. Note: Supabase limits rows per request (default 1000). 
        // We should implement pagination for full backup if tables are large.
        // For now, assuming relatively small tables or test data, but let's do simple pagination loop just in case.

        let allRows = [];
        let page = 0;
        const pageSize = 1000;
        let hasMore = true;

        while (hasMore) {
            const { data, error } = await supabase
                .from(table)
                .select('*')
                .range(page * pageSize, (page + 1) * pageSize - 1);

            if (error) {
                console.error(`Error backing up ${table}:`, error.message);
                backupData[table] = { error: error.message };
                hasMore = false; // Skip to next table
            } else {
                if (data.length > 0) {
                    allRows = allRows.concat(data);
                    if (data.length < pageSize) {
                        hasMore = false;
                    } else {
                        page++;
                    }
                } else {
                    hasMore = false;
                }
            }
        }

        if (!backupData[table]?.error) {
            backupData[table] = allRows;
            console.log(`  -> Retrieved ${allRows.length} rows.`);
        }
    }

    fs.writeFileSync(backupFile, JSON.stringify(backupData, null, 2));
    console.log(`Backup completed. Saved to: ${backupFile}`);
}

backup().catch(err => {
    console.error('Backup script failed:', err);
    process.exit(1);
});
