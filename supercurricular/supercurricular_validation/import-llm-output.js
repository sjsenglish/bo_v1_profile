/**
 * IMPORT LLM OUTPUT TO STAGING
 * ============================
 * Loads JSON output from LLMs into the staging table for validation.
 * 
 * Usage:
 *   node import-llm-output.js --file=./claude-output.json --source=claude-3.5 --batch=batch_2024-12-30_med_01
 *   node import-llm-output.js --stdin --source=gpt-4o --batch=batch_2024-12-30_med_02
 */

import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';

const supabase = createClient(
  process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_ANON_KEY
);

async function importToStaging(entries, sourceLLM, batchId) {
  console.log(`Importing ${entries.length} entries from ${sourceLLM} to batch ${batchId}`);
  
  // Create batch record
  await supabase.from('bo_v1_validation_batches').upsert({
    batch_id: batchId,
    source_llms: [sourceLLM],
    total_entries: entries.length,
    pending_count: entries.length,
  }, { onConflict: 'batch_id' });
  
  let imported = 0;
  let failed = 0;
  
  for (const entry of entries) {
    try {
      // Map LLM output fields to staging table columns
      const stagingEntry = {
        generation_batch: batchId,
        source_llm: sourceLLM,
        raw_json: entry,
        
        // Core fields
        id: entry.id,
        type: entry.type,
        format: entry.format,
        title: entry.title,
        subtitle: entry.subtitle,
        description: entry.description,
        
        author: entry.author,
        author_credentials: entry.author_credentials,
        publisher: entry.publisher,
        publication_year: entry.publication_year,
        
        isbn: entry.isbn?.replace(/[-\s]/g, ''), // Normalise ISBN
        doi: entry.doi,
        external_url: entry.external_url,
        
        has_extractable_sections: entry.has_extractable_sections,
        section_count: entry.section_count,
        estimated_total_time_mins: entry.estimated_total_time_mins,
        
        primary_cluster: entry.primary_cluster,
        secondary_clusters: entry.secondary_clusters || [],
        subject_tags: entry.subject_tags || [],
        course_name_keywords: entry.course_name_keywords || [],
        
        authority_source: entry.authority_source,
        authority_type: entry.authority_type,
        success_signal: entry.success_signal,
        credibility_score: entry.credibility_score,
        
        difficulty_conceptual: entry.difficulty_conceptual,
        difficulty_volume: entry.difficulty_volume,
        difficulty_technical: entry.difficulty_technical,
        difficulty_verbal: entry.difficulty_verbal,
        difficulty_ambiguity: entry.difficulty_ambiguity,
        difficulty_self_direction: entry.difficulty_self_direction,
        
        prerequisite_knowledge: entry.prerequisite_knowledge || [],
        year_groups: entry.year_groups || [],
        
        time_estimate: entry.time_estimate,
        commitment_type: entry.commitment_type,
        deadline_month: entry.deadline_month,
        is_recurring: entry.is_recurring,
        
        is_free: entry.is_free,
        price_gbp: entry.price_gbp,
        availability_notes: entry.availability_notes,
        
        generation_confidence: entry.generation_confidence || 'MEDIUM',
        llm_notes: entry.llm_notes,
        
        // Initial status
        validation_status: 'PENDING',
      };
      
      const { error } = await supabase
        .from('bo_v1_supercurricular_staging')
        .insert(stagingEntry);
      
      if (error) {
        console.error(`Failed to import "${entry.title}":`, error.message);
        failed++;
      } else {
        imported++;
      }
    } catch (err) {
      console.error(`Error processing "${entry.title}":`, err.message);
      failed++;
    }
  }
  
  console.log(`Import complete: ${imported} imported, ${failed} failed`);
  
  // Update batch record
  await supabase
    .from('bo_v1_validation_batches')
    .update({ pending_count: imported })
    .eq('batch_id', batchId);
  
  return { imported, failed };
}

async function main() {
  const args = process.argv.slice(2);
  
  // Parse arguments
  const fileArg = args.find(a => a.startsWith('--file='));
  const sourceArg = args.find(a => a.startsWith('--source='));
  const batchArg = args.find(a => a.startsWith('--batch='));
  const useStdin = args.includes('--stdin');
  
  if (!sourceArg) {
    console.error('Error: --source is required (e.g., --source=claude-3.5)');
    process.exit(1);
  }
  
  const sourceLLM = sourceArg.split('=')[1];
  const batchId = batchArg?.split('=')[1] || `batch_${new Date().toISOString().slice(0,10)}_${sourceLLM}_${Date.now()}`;
  
  let jsonData;
  
  if (useStdin) {
    // Read from stdin
    const chunks = [];
    for await (const chunk of process.stdin) {
      chunks.push(chunk);
    }
    jsonData = Buffer.concat(chunks).toString('utf8');
  } else if (fileArg) {
    const filePath = fileArg.split('=')[1];
    jsonData = readFileSync(filePath, 'utf8');
  } else {
    console.error('Error: Provide --file=<path> or --stdin');
    process.exit(1);
  }
  
  let entries;
  try {
    entries = JSON.parse(jsonData);
    if (!Array.isArray(entries)) {
      entries = [entries]; // Wrap single object in array
    }
  } catch (err) {
    console.error('Error parsing JSON:', err.message);
    process.exit(1);
  }
  
  await importToStaging(entries, sourceLLM, batchId);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
