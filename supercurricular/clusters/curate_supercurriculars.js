/**
 * SUPERCURRICULAR CURATION PIPELINE
 * ==================================
 * Merges, deduplicates, and curates outputs from multiple LLMs.
 * 
 * Workflow:
 *   1. Import JSON from each LLM → staging table
 *   2. Run duplicate detection
 *   3. Quality review (manual or automated)
 *   4. Export curated SQL
 * 
 * Usage:
 *   node curate_supercurriculars.js import --file=claude_soc.json --source=claude-3.5
 *   node curate_supercurriculars.js import --file=gpt4_soc.json --source=gpt-4o
 *   node curate_supercurriculars.js duplicates
 *   node curate_supercurriculars.js review
 *   node curate_supercurriculars.js export --cluster=SOC --output=005_soc.sql
 */

import { readFileSync, writeFileSync } from 'fs';
import { createClient } from '@supabase/supabase-js';

// ============================================================================
// CONFIGURATION
// ============================================================================

const CONFIG = {
  supabaseUrl: process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL,
  supabaseKey: process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_ANON_KEY,
};

const supabase = createClient(CONFIG.supabaseUrl, CONFIG.supabaseKey);

// ============================================================================
// STAGING SCHEMA (run once in Supabase)
// ============================================================================

const STAGING_SCHEMA = `
-- Staging table for multi-LLM curation
CREATE TABLE IF NOT EXISTS bo_v1_supercurricular_curation (
  id TEXT NOT NULL,
  source_llm TEXT NOT NULL,
  cluster TEXT NOT NULL,
  imported_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- Raw data
  raw_json JSONB NOT NULL,
  
  -- Extracted fields for querying
  title TEXT NOT NULL,
  type TEXT NOT NULL,
  author TEXT,
  confidence TEXT,
  
  -- Curation status
  status TEXT DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED', 'DUPLICATE')),
  duplicate_of TEXT,  -- ID of the preferred version
  quality_score INTEGER,  -- 1-100, manual or computed
  reviewer_notes TEXT,
  reviewed_at TIMESTAMPTZ,
  
  -- Composite primary key: same ID from different LLMs are separate rows
  PRIMARY KEY (id, source_llm)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_curation_cluster ON bo_v1_supercurricular_curation(cluster);
CREATE INDEX IF NOT EXISTS idx_curation_status ON bo_v1_supercurricular_curation(status);
CREATE INDEX IF NOT EXISTS idx_curation_title ON bo_v1_supercurricular_curation(title);

-- View: potential duplicates (same title, different sources)
CREATE OR REPLACE VIEW v_potential_duplicates AS
SELECT 
  title,
  COUNT(DISTINCT source_llm) as source_count,
  array_agg(DISTINCT source_llm) as sources,
  array_agg(DISTINCT id) as ids,
  array_agg(confidence) as confidences
FROM bo_v1_supercurricular_curation
WHERE status = 'PENDING'
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- View: curation dashboard
CREATE OR REPLACE VIEW v_curation_dashboard AS
SELECT 
  cluster,
  source_llm,
  COUNT(*) as total,
  COUNT(*) FILTER (WHERE status = 'PENDING') as pending,
  COUNT(*) FILTER (WHERE status = 'APPROVED') as approved,
  COUNT(*) FILTER (WHERE status = 'REJECTED') as rejected,
  COUNT(*) FILTER (WHERE status = 'DUPLICATE') as duplicates,
  COUNT(*) FILTER (WHERE confidence = 'HIGH') as high_confidence,
  COUNT(*) FILTER (WHERE confidence = 'LOW') as low_confidence
FROM bo_v1_supercurricular_curation
GROUP BY cluster, source_llm
ORDER BY cluster, source_llm;
`;

// ============================================================================
// IMPORT FUNCTION
// ============================================================================

async function importFromFile(filePath, sourceLLM) {
  console.log(`Importing from ${filePath} (source: ${sourceLLM})`);
  
  const rawContent = readFileSync(filePath, 'utf8');
  const data = JSON.parse(rawContent);
  
  const cluster = data.cluster;
  const supercurriculars = data.supercurriculars || [];
  const courseLinks = data.course_links || [];
  const quizMappings = data.quiz_mappings || [];
  
  console.log(`Found ${supercurriculars.length} supercurriculars in cluster ${cluster}`);
  
  let imported = 0;
  let skipped = 0;
  
  for (const item of supercurriculars) {
    // Find related links and mappings
    const links = courseLinks.filter(l => l.supercurricular_id === item.id);
    const mappings = quizMappings.filter(m => m.supercurricular_id === item.id);
    
    // Combine into single JSON
    const fullRecord = {
      ...item,
      _course_links: links,
      _quiz_mappings: mappings
    };
    
    const { error } = await supabase
      .from('bo_v1_supercurricular_curation')
      .upsert({
        id: item.id,
        source_llm: sourceLLM,
        cluster: cluster,
        raw_json: fullRecord,
        title: item.title,
        type: item.type,
        author: item.author,
        confidence: item.confidence || 'MEDIUM',
        status: 'PENDING'
      }, {
        onConflict: 'id,source_llm'
      });
    
    if (error) {
      console.error(`Failed to import ${item.id}: ${error.message}`);
      skipped++;
    } else {
      imported++;
    }
  }
  
  console.log(`Import complete: ${imported} imported, ${skipped} skipped`);
}

// ============================================================================
// DUPLICATE DETECTION
// ============================================================================

async function findDuplicates() {
  const { data, error } = await supabase
    .from('v_potential_duplicates')
    .select('*');
  
  if (error) {
    console.error('Error fetching duplicates:', error);
    return;
  }
  
  console.log('\n=== POTENTIAL DUPLICATES ===\n');
  
  if (data.length === 0) {
    console.log('No duplicates found.');
    return;
  }
  
  for (const dup of data) {
    console.log(`Title: "${dup.title}"`);
    console.log(`  Sources: ${dup.sources.join(', ')}`);
    console.log(`  IDs: ${dup.ids.join(', ')}`);
    console.log(`  Confidence: ${dup.confidences.join(', ')}`);
    console.log('');
  }
  
  console.log(`Total: ${data.length} titles with duplicates`);
}

// ============================================================================
// INTERACTIVE REVIEW (simplified)
// ============================================================================

async function reviewPending(cluster) {
  const { data, error } = await supabase
    .from('bo_v1_supercurricular_curation')
    .select('*')
    .eq('cluster', cluster)
    .eq('status', 'PENDING')
    .order('confidence', { ascending: false })  // HIGH confidence first
    .limit(10);
  
  if (error) {
    console.error('Error:', error);
    return;
  }
  
  console.log(`\n=== PENDING REVIEW: ${cluster} ===\n`);
  
  for (const item of data) {
    const json = item.raw_json;
    console.log(`ID: ${item.id} (${item.source_llm})`);
    console.log(`Title: ${json.title}`);
    console.log(`Type: ${json.type}`);
    console.log(`Author: ${json.author || 'N/A'}`);
    console.log(`Confidence: ${item.confidence}`);
    console.log(`ISBN: ${json.isbn || 'N/A'}`);
    console.log(`URL: ${json.external_url || 'N/A'}`);
    console.log(`Description: ${json.description?.substring(0, 100)}...`);
    console.log('---');
  }
}

// ============================================================================
// BULK APPROVE HIGH CONFIDENCE
// ============================================================================

async function approveHighConfidence(cluster) {
  const { data, error } = await supabase
    .from('bo_v1_supercurricular_curation')
    .update({ 
      status: 'APPROVED',
      reviewed_at: new Date().toISOString()
    })
    .eq('cluster', cluster)
    .eq('confidence', 'HIGH')
    .eq('status', 'PENDING')
    .select();
  
  if (error) {
    console.error('Error:', error);
    return;
  }
  
  console.log(`Approved ${data.length} high-confidence items in ${cluster}`);
}

// ============================================================================
// EXPORT TO SQL
// ============================================================================

async function exportToSQL(cluster, outputPath) {
  // Get all approved items for cluster
  const { data, error } = await supabase
    .from('bo_v1_supercurricular_curation')
    .select('*')
    .eq('cluster', cluster)
    .eq('status', 'APPROVED');
  
  if (error) {
    console.error('Error:', error);
    return;
  }
  
  console.log(`Exporting ${data.length} approved items for ${cluster}`);
  
  let sql = `-- ============================================================================
-- SEED DATA: ${cluster} CLUSTER (CURATED)
-- ============================================================================
-- Generated: ${new Date().toISOString()}
-- Sources: ${[...new Set(data.map(d => d.source_llm))].join(', ')}
-- Items: ${data.length}
-- ============================================================================

`;

  // Supercurriculars
  sql += `-- SUPERCURRICULARS\n\n`;
  
  for (const item of data) {
    const j = item.raw_json;
    sql += generateSupercurricularInsert(j) + '\n\n';
  }
  
  // Course links
  sql += `\n-- COURSE LINKS\n\n`;
  
  for (const item of data) {
    const links = item.raw_json._course_links || [];
    for (const link of links) {
      sql += generateCourseLinkInsert(link) + '\n';
    }
  }
  
  // Quiz mappings
  sql += `\n-- QUIZ MAPPINGS\n\n`;
  
  for (const item of data) {
    const mappings = item.raw_json._quiz_mappings || [];
    for (const mapping of mappings) {
      sql += generateQuizMappingInsert(mapping) + '\n';
    }
  }
  
  // Verification query
  sql += `
-- VERIFY
SELECT primary_cluster, COUNT(*) as count FROM bo_v1_supercurriculars WHERE primary_cluster = '${cluster}' GROUP BY primary_cluster;
`;

  writeFileSync(outputPath, sql);
  console.log(`Exported to ${outputPath}`);
}

// ============================================================================
// SQL GENERATORS
// ============================================================================

function escapeSQL(str) {
  if (str === null || str === undefined) return 'NULL';
  return `'${String(str).replace(/'/g, "''")}'`;
}

function arrayToSQL(arr) {
  if (!arr || arr.length === 0) return "'{}'";
  return `ARRAY[${arr.map(escapeSQL).join(', ')}]`;
}

function jsonToSQL(obj) {
  if (!obj) return 'NULL';
  return `'${JSON.stringify(obj).replace(/'/g, "''")}'::JSONB`;
}

function generateSupercurricularInsert(j) {
  return `INSERT INTO bo_v1_supercurriculars (
  id, type, format, title, subtitle, description,
  author, author_credentials, publisher, publication_year,
  isbn, external_url,
  has_extractable_sections, section_count, estimated_total_time_mins,
  primary_cluster, secondary_clusters, subject_tags, course_name_keywords,
  authority_source, authority_type, success_signal, credibility_score,
  difficulty_conceptual, difficulty_volume, difficulty_technical,
  difficulty_verbal, difficulty_ambiguity, difficulty_self_direction,
  prerequisite_knowledge, year_groups,
  time_estimate, commitment_type, deadline_month, is_recurring,
  is_free, price_gbp, availability_notes,
  is_active, is_verified, generation_confidence
) VALUES (
  ${escapeSQL(j.id)}, ${escapeSQL(j.type)}, ${escapeSQL(j.format)},
  ${escapeSQL(j.title)}, ${escapeSQL(j.subtitle)}, ${escapeSQL(j.description)},
  ${escapeSQL(j.author)}, ${escapeSQL(j.author_credentials)}, ${escapeSQL(j.publisher)}, ${j.publication_year || 'NULL'},
  ${escapeSQL(j.isbn)}, ${escapeSQL(j.external_url)},
  ${j.has_extractable_sections || false}, ${j.section_count || 'NULL'}, ${j.estimated_total_time_mins || 'NULL'},
  ${escapeSQL(j.primary_cluster)}, ${arrayToSQL(j.secondary_clusters)}, ${arrayToSQL(j.subject_tags)}, ${arrayToSQL(j.course_name_keywords)},
  ${escapeSQL(j.authority_source)}, ${escapeSQL(j.authority_type)}, ${escapeSQL(j.success_signal)}, ${j.credibility_score || 'NULL'},
  ${j.difficulty_conceptual || 'NULL'}, ${j.difficulty_volume || 'NULL'}, ${j.difficulty_technical || 'NULL'},
  ${j.difficulty_verbal || 'NULL'}, ${j.difficulty_ambiguity || 'NULL'}, ${j.difficulty_self_direction || 'NULL'},
  ${arrayToSQL(j.prerequisite_knowledge)}, ${arrayToSQL(j.year_groups)},
  ${escapeSQL(j.time_estimate)}, ${escapeSQL(j.commitment_type)}, ${escapeSQL(j.deadline_month)}, ${j.is_recurring || false},
  ${j.is_free || false}, ${j.price_gbp || 'NULL'}, ${escapeSQL(j.availability_notes)},
  TRUE, FALSE, ${escapeSQL(j.confidence)}
);`;
}

function generateCourseLinkInsert(link) {
  const linkType = link.link_type;
  const cah = linkType === 'cah_code' ? escapeSQL(link.link_value) : 'NULL';
  const keyword = linkType === 'keyword' ? escapeSQL(link.link_value) : 'NULL';
  const courseId = linkType === 'course_id' ? escapeSQL(link.link_value) : 'NULL';
  
  return `INSERT INTO bo_v1_supercurricular_course_links (supercurricular_id, cah_code, course_keyword, course_id, relevance_score, is_primary, relevance_reason) VALUES (${escapeSQL(link.supercurricular_id)}, ${cah}, ${keyword}, ${courseId}, ${link.relevance_score || 50}, ${link.is_primary || false}, ${escapeSQL(link.relevance_reason)});`;
}

function generateQuizMappingInsert(mapping) {
  return `INSERT INTO bo_v1_supercurricular_quiz_mappings (supercurricular_id, quiz_system, disposition_boosts, disposition_requirements, xp_reward_override, display_priority, featured_in_quiz, targeting_rules, is_active) VALUES (${escapeSQL(mapping.supercurricular_id)}, 'examrizz_arena', ${jsonToSQL(mapping.disposition_boosts)}, ${jsonToSQL(mapping.disposition_requirements)}, ${mapping.xp_reward || 'NULL'}, ${mapping.display_priority || 100}, ${mapping.featured || false}, ${jsonToSQL({ notes: mapping.targeting_notes })}, TRUE);`;
}

// ============================================================================
// DASHBOARD
// ============================================================================

async function showDashboard() {
  const { data, error } = await supabase
    .from('v_curation_dashboard')
    .select('*');
  
  if (error) {
    console.error('Error:', error);
    return;
  }
  
  console.log('\n=== CURATION DASHBOARD ===\n');
  console.table(data);
}

// ============================================================================
// CLI
// ============================================================================

async function main() {
  const args = process.argv.slice(2);
  const command = args[0];
  
  switch (command) {
    case 'schema':
      console.log(STAGING_SCHEMA);
      break;
      
    case 'import': {
      const fileArg = args.find(a => a.startsWith('--file='));
      const sourceArg = args.find(a => a.startsWith('--source='));
      if (!fileArg || !sourceArg) {
        console.log('Usage: node curate.js import --file=path.json --source=llm-name');
        return;
      }
      await importFromFile(fileArg.split('=')[1], sourceArg.split('=')[1]);
      break;
    }
    
    case 'duplicates':
      await findDuplicates();
      break;
      
    case 'review': {
      const clusterArg = args.find(a => a.startsWith('--cluster='));
      if (!clusterArg) {
        console.log('Usage: node curate.js review --cluster=SOC');
        return;
      }
      await reviewPending(clusterArg.split('=')[1]);
      break;
    }
    
    case 'approve-high': {
      const clusterArg = args.find(a => a.startsWith('--cluster='));
      if (!clusterArg) {
        console.log('Usage: node curate.js approve-high --cluster=SOC');
        return;
      }
      await approveHighConfidence(clusterArg.split('=')[1]);
      break;
    }
    
    case 'export': {
      const clusterArg = args.find(a => a.startsWith('--cluster='));
      const outputArg = args.find(a => a.startsWith('--output='));
      if (!clusterArg || !outputArg) {
        console.log('Usage: node curate.js export --cluster=SOC --output=005_soc.sql');
        return;
      }
      await exportToSQL(clusterArg.split('=')[1], outputArg.split('=')[1]);
      break;
    }
    
    case 'dashboard':
      await showDashboard();
      break;
      
    default:
      console.log(`
Supercurricular Curation Pipeline

Commands:
  schema                          Print staging table SQL
  import --file=X --source=Y      Import LLM output to staging
  duplicates                      Show potential duplicates
  review --cluster=X              Review pending items
  approve-high --cluster=X        Auto-approve HIGH confidence items
  export --cluster=X --output=Y   Export approved items to SQL
  dashboard                       Show curation statistics
      `);
  }
}

main().catch(console.error);
