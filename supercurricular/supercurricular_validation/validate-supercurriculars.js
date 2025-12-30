/**
 * SUPERCURRICULAR VALIDATION PIPELINE
 * ====================================
 * Validates LLM-generated supercurricular entries.
 * 
 * Features:
 * - ISBN verification (OpenLibrary, Google Books)
 * - URL reachability checking
 * - Consistency validation
 * - Fuzzy deduplication
 * - Batch processing with rate limiting
 * 
 * Usage:
 *   node validate-supercurriculars.js --batch=batch_2024-12-30_med_01
 *   node validate-supercurriculars.js --all-pending
 *   node validate-supercurriculars.js --file=./llm-output.json --source=claude-3.5
 */

import { createClient } from '@supabase/supabase-js';
import Fuse from 'fuse.js';

// ============================================================================
// CONFIGURATION
// ============================================================================

const CONFIG = {
  // Supabase
  supabaseUrl: process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL,
  supabaseKey: process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_ANON_KEY,
  
  // Validation thresholds
  autoApproveThreshold: 85,      // Auto-promote if score >= this
  autoRejectThreshold: 40,       // Auto-reject if score <= this
  reviewThreshold: 70,           // Require manual review if score < this
  
  // Deduplication
  fuzzyMatchThreshold: 0.85,     // Title similarity threshold
  
  // Rate limiting (requests per second)
  isbnRateLimit: 2,
  urlRateLimit: 5,
  
  // Timeouts (ms)
  urlTimeout: 5000,
  apiTimeout: 10000,
};

// ============================================================================
// VALIDATION FLAGS
// ============================================================================

const FLAGS = {
  // ISBN
  MISSING_ISBN_BOOK: { penalty: 15, severity: 'WARNING' },
  INVALID_ISBN_FORMAT: { penalty: 25, severity: 'ERROR' },
  ISBN_NOT_FOUND: { penalty: 30, severity: 'ERROR', requiresReview: true },
  ISBN_TITLE_MISMATCH: { penalty: 35, severity: 'ERROR', autoReject: true },
  ISBN_AUTHOR_MISMATCH: { penalty: 20, severity: 'WARNING', requiresReview: true },
  
  // URL
  MISSING_URL: { penalty: 5, severity: 'INFO' },
  URL_NOT_REACHABLE: { penalty: 15, severity: 'WARNING' },
  URL_DOMAIN_SUSPICIOUS: { penalty: 10, severity: 'WARNING', requiresReview: true },
  
  // Consistency
  VOLUME_TIME_MISMATCH: { penalty: 5, severity: 'WARNING' },
  DIFFICULTY_RANGE_INVALID: { penalty: 15, severity: 'ERROR' },
  MISSING_REQUIRED_FIELD: { penalty: 20, severity: 'ERROR' },
  YEAR_FUTURE: { penalty: 25, severity: 'ERROR', autoReject: true },
  YEAR_IMPLAUSIBLE: { penalty: 10, severity: 'WARNING', requiresReview: true },
  
  // Content
  HIGH_CREDIBILITY_NO_SOURCE: { penalty: 10, severity: 'WARNING', requiresReview: true },
  UNVERIFIED_CREDENTIAL_CLAIM: { penalty: 15, severity: 'WARNING', requiresReview: true },
  DESCRIPTION_TOO_SHORT: { penalty: 5, severity: 'INFO' },
  LOW_CONFIDENCE_SELF_REPORT: { penalty: 10, severity: 'INFO', requiresReview: true },
  
  // Duplicates
  EXACT_DUPLICATE_STAGING: { penalty: 100, severity: 'ERROR', autoReject: true },
  EXACT_DUPLICATE_PRODUCTION: { penalty: 100, severity: 'ERROR', autoReject: true },
  FUZZY_DUPLICATE_STAGING: { penalty: 50, severity: 'WARNING', requiresReview: true },
  FUZZY_DUPLICATE_PRODUCTION: { penalty: 50, severity: 'WARNING', requiresReview: true },
  ISBN_DUPLICATE: { penalty: 100, severity: 'ERROR', autoReject: true },
};

// Trusted URL domains (partial match)
const TRUSTED_DOMAINS = [
  'amazon.co.uk', 'amazon.com', 'penguin.co.uk', 'penguin.com',
  'oxford.ac.uk', 'cam.ac.uk', 'harvard.edu', 'mit.edu', 'yale.edu',
  'futurelearn.com', 'edx.org', 'coursera.org', 'khanacademy.org',
  'bbc.co.uk', 'bbc.com', 'gov.uk', 'nhs.uk',
  'rsc.org', 'iop.org', 'rsb.org.uk',
  'youtube.com', 'youtu.be',
  'github.com', 'freecodecamp.org',
  'admissionstesting.org', 'ucat.ac.uk', 'lnat.ac.uk',
];

// Suspicious credential claims that need verification
const SUSPICIOUS_CREDENTIALS = [
  'nobel', 'pulitzer', 'booker prize', 'fields medal',
  'prime minister', 'president of', 'ceo of google', 'ceo of apple',
];

// ============================================================================
// SUPABASE CLIENT
// ============================================================================

const supabase = createClient(CONFIG.supabaseUrl, CONFIG.supabaseKey);

// ============================================================================
// ISBN VERIFICATION
// ============================================================================

/**
 * Validate ISBN format (ISBN-10 or ISBN-13)
 */
function isValidISBNFormat(isbn) {
  if (!isbn) return false;
  const cleaned = isbn.replace(/[-\s]/g, '');
  
  // ISBN-10
  if (cleaned.length === 10) {
    if (!/^[0-9]{9}[0-9X]$/.test(cleaned)) return false;
    let sum = 0;
    for (let i = 0; i < 9; i++) {
      sum += parseInt(cleaned[i]) * (10 - i);
    }
    const check = cleaned[9] === 'X' ? 10 : parseInt(cleaned[9]);
    sum += check;
    return sum % 11 === 0;
  }
  
  // ISBN-13
  if (cleaned.length === 13) {
    if (!/^[0-9]{13}$/.test(cleaned)) return false;
    let sum = 0;
    for (let i = 0; i < 12; i++) {
      sum += parseInt(cleaned[i]) * (i % 2 === 0 ? 1 : 3);
    }
    const check = (10 - (sum % 10)) % 10;
    return check === parseInt(cleaned[12]);
  }
  
  return false;
}

/**
 * Look up ISBN in OpenLibrary
 */
async function verifyISBNOpenLibrary(isbn) {
  const cleaned = isbn.replace(/[-\s]/g, '');
  const url = `https://openlibrary.org/api/books?bibkeys=ISBN:${cleaned}&format=json&jscmd=data`;
  
  try {
    const response = await fetch(url, { 
      timeout: CONFIG.apiTimeout,
      headers: { 'User-Agent': 'ExamRizzArena/1.0 (supercurricular-validation)' }
    });
    
    if (!response.ok) return null;
    
    const data = await response.json();
    const key = `ISBN:${cleaned}`;
    
    if (data[key]) {
      return {
        found: true,
        source: 'openlibrary',
        title: data[key].title,
        authors: data[key].authors?.map(a => a.name) || [],
        publisher: data[key].publishers?.[0]?.name,
        publishDate: data[key].publish_date,
        raw: data[key],
      };
    }
    
    return { found: false, source: 'openlibrary' };
  } catch (error) {
    console.error(`OpenLibrary lookup failed for ${isbn}:`, error.message);
    return null;
  }
}

/**
 * Look up ISBN in Google Books
 */
async function verifyISBNGoogleBooks(isbn) {
  const cleaned = isbn.replace(/[-\s]/g, '');
  const url = `https://www.googleapis.com/books/v1/volumes?q=isbn:${cleaned}`;
  
  try {
    const response = await fetch(url, { timeout: CONFIG.apiTimeout });
    
    if (!response.ok) return null;
    
    const data = await response.json();
    
    if (data.totalItems > 0) {
      const book = data.items[0].volumeInfo;
      return {
        found: true,
        source: 'google_books',
        title: book.title,
        authors: book.authors || [],
        publisher: book.publisher,
        publishDate: book.publishedDate,
        raw: book,
      };
    }
    
    return { found: false, source: 'google_books' };
  } catch (error) {
    console.error(`Google Books lookup failed for ${isbn}:`, error.message);
    return null;
  }
}

/**
 * Verify ISBN against multiple sources
 */
async function verifyISBN(isbn) {
  // Try OpenLibrary first
  const olResult = await verifyISBNOpenLibrary(isbn);
  if (olResult?.found) return olResult;
  
  // Fall back to Google Books
  await sleep(500); // Rate limit
  const gbResult = await verifyISBNGoogleBooks(isbn);
  if (gbResult?.found) return gbResult;
  
  // Neither found it
  return { found: false, source: 'none' };
}

/**
 * Compare titles for similarity (case-insensitive, ignoring punctuation)
 */
function titlesMatch(title1, title2, threshold = 0.8) {
  const norm1 = title1.toLowerCase().replace(/[^a-z0-9]/g, '');
  const norm2 = title2.toLowerCase().replace(/[^a-z0-9]/g, '');
  
  if (norm1 === norm2) return true;
  
  // Check if one contains the other
  if (norm1.includes(norm2) || norm2.includes(norm1)) return true;
  
  // Simple Jaccard similarity on words
  const words1 = new Set(title1.toLowerCase().split(/\s+/).filter(w => w.length > 2));
  const words2 = new Set(title2.toLowerCase().split(/\s+/).filter(w => w.length > 2));
  
  const intersection = [...words1].filter(w => words2.has(w)).length;
  const union = new Set([...words1, ...words2]).size;
  
  return union > 0 && (intersection / union) >= threshold;
}

// ============================================================================
// URL VERIFICATION
// ============================================================================

/**
 * Check if URL is reachable
 */
async function verifyURL(url) {
  if (!url) return { reachable: null, reason: 'no_url' };
  
  try {
    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), CONFIG.urlTimeout);
    
    const response = await fetch(url, {
      method: 'HEAD',
      signal: controller.signal,
      redirect: 'follow',
      headers: { 'User-Agent': 'ExamRizzArena/1.0 (link-checker)' }
    });
    
    clearTimeout(timeout);
    
    return {
      reachable: response.ok,
      statusCode: response.status,
      finalUrl: response.url,
    };
  } catch (error) {
    if (error.name === 'AbortError') {
      return { reachable: false, reason: 'timeout' };
    }
    return { reachable: false, reason: error.message };
  }
}

/**
 * Check if URL domain is trusted
 */
function isTrustedDomain(url) {
  if (!url) return false;
  try {
    const domain = new URL(url).hostname.toLowerCase();
    return TRUSTED_DOMAINS.some(trusted => domain.includes(trusted));
  } catch {
    return false;
  }
}

// ============================================================================
// CONSISTENCY CHECKS
// ============================================================================

/**
 * Run all consistency validations on an entry
 */
function validateConsistency(entry) {
  const flags = [];
  const details = {};
  
  // Required fields
  const requiredFields = ['title', 'type', 'primary_cluster'];
  for (const field of requiredFields) {
    if (!entry[field]) {
      flags.push('MISSING_REQUIRED_FIELD');
      details.missingField = field;
    }
  }
  
  // Difficulty range (1-100)
  const difficultyFields = [
    'difficulty_conceptual', 'difficulty_volume', 'difficulty_technical',
    'difficulty_verbal', 'difficulty_ambiguity', 'difficulty_self_direction'
  ];
  for (const field of difficultyFields) {
    if (entry[field] !== null && entry[field] !== undefined) {
      if (entry[field] < 1 || entry[field] > 100) {
        flags.push('DIFFICULTY_RANGE_INVALID');
        details.invalidDifficulty = { field, value: entry[field] };
      }
    }
  }
  
  // Publication year
  const currentYear = new Date().getFullYear();
  if (entry.publication_year) {
    if (entry.publication_year > currentYear) {
      flags.push('YEAR_FUTURE');
    } else if (entry.publication_year < 1900 && entry.type === 'BOOK') {
      flags.push('YEAR_IMPLAUSIBLE');
    }
  }
  
  // Volume vs time consistency
  if (entry.difficulty_volume > 75 && entry.estimated_total_time_mins < 180) {
    flags.push('VOLUME_TIME_MISMATCH');
    details.volumeTimeMismatch = {
      volume: entry.difficulty_volume,
      time: entry.estimated_total_time_mins
    };
  }
  
  // High credibility without source
  if (entry.credibility_score > 85 && !entry.authority_source) {
    flags.push('HIGH_CREDIBILITY_NO_SOURCE');
  }
  
  // Suspicious credentials
  if (entry.author_credentials) {
    const credLower = entry.author_credentials.toLowerCase();
    for (const suspicious of SUSPICIOUS_CREDENTIALS) {
      if (credLower.includes(suspicious)) {
        flags.push('UNVERIFIED_CREDENTIAL_CLAIM');
        details.suspiciousCredential = suspicious;
        break;
      }
    }
  }
  
  // Description length
  if (entry.description && entry.description.length < 50) {
    flags.push('DESCRIPTION_TOO_SHORT');
  }
  
  // LLM self-reported low confidence
  if (entry.generation_confidence === 'LOW') {
    flags.push('LOW_CONFIDENCE_SELF_REPORT');
  }
  
  return { flags, details };
}

// ============================================================================
// DEDUPLICATION
// ============================================================================

/**
 * Check for duplicates in staging and production tables
 */
async function checkDuplicates(entry, stagingId) {
  const flags = [];
  const details = {};
  
  // Normalise title for comparison
  const normTitle = entry.title.toLowerCase().replace(/[^a-z0-9]/g, '');
  
  // Check exact ISBN match
  if (entry.isbn) {
    const cleanISBN = entry.isbn.replace(/[-\s]/g, '');
    
    // Check staging
    const { data: stagingISBN } = await supabase
      .from('bo_v1_supercurricular_staging')
      .select('staging_id, title')
      .eq('isbn', cleanISBN)
      .neq('staging_id', stagingId)
      .eq('rejected', false)
      .limit(1);
    
    if (stagingISBN?.length > 0) {
      flags.push('ISBN_DUPLICATE');
      details.duplicateOf = { staging_id: stagingISBN[0].staging_id };
      return { flags, details, duplicateId: stagingISBN[0].staging_id };
    }
    
    // Check production
    const { data: prodISBN } = await supabase
      .from('bo_v1_supercurriculars')
      .select('id, title')
      .eq('isbn', cleanISBN)
      .limit(1);
    
    if (prodISBN?.length > 0) {
      flags.push('ISBN_DUPLICATE');
      details.duplicateOf = { production_id: prodISBN[0].id };
      return { flags, details, duplicateProductionId: prodISBN[0].id };
    }
  }
  
  // Check exact title match in staging
  const { data: stagingExact } = await supabase
    .from('bo_v1_supercurricular_staging')
    .select('staging_id, title, author')
    .eq('title_normalised', normTitle)
    .neq('staging_id', stagingId)
    .eq('rejected', false)
    .limit(1);
  
  if (stagingExact?.length > 0) {
    flags.push('EXACT_DUPLICATE_STAGING');
    details.duplicateOf = { staging_id: stagingExact[0].staging_id };
    return { flags, details, duplicateId: stagingExact[0].staging_id };
  }
  
  // Check exact title match in production
  const { data: prodExact } = await supabase
    .from('bo_v1_supercurriculars')
    .select('id, title, author')
    .ilike('title', entry.title)
    .limit(1);
  
  if (prodExact?.length > 0 && titlesMatch(prodExact[0].title, entry.title, 0.95)) {
    flags.push('EXACT_DUPLICATE_PRODUCTION');
    details.duplicateOf = { production_id: prodExact[0].id };
    return { flags, details, duplicateProductionId: prodExact[0].id };
  }
  
  // Fuzzy title matching - get candidates from same cluster
  const { data: candidates } = await supabase
    .from('bo_v1_supercurriculars')
    .select('id, title, author')
    .eq('primary_cluster', entry.primary_cluster)
    .eq('type', entry.type)
    .limit(100);
  
  if (candidates?.length > 0) {
    for (const candidate of candidates) {
      if (titlesMatch(candidate.title, entry.title, CONFIG.fuzzyMatchThreshold)) {
        flags.push('FUZZY_DUPLICATE_PRODUCTION');
        details.similarTo = { 
          production_id: candidate.id, 
          title: candidate.title,
          similarity: 'high'
        };
        return { flags, details, duplicateProductionId: candidate.id, confidence: 0.85 };
      }
    }
  }
  
  return { flags, details };
}

// ============================================================================
// MAIN VALIDATION FUNCTION
// ============================================================================

/**
 * Validate a single entry
 */
async function validateEntry(entry, stagingId) {
  const result = {
    score: 100,
    flags: [],
    details: {},
    isbn_verified: null,
    url_verified: null,
    requiresManualReview: false,
    autoReject: false,
  };
  
  // 1. Consistency checks
  const consistency = validateConsistency(entry);
  result.flags.push(...consistency.flags);
  Object.assign(result.details, consistency.details);
  
  // 2. ISBN verification (for books)
  if (entry.type === 'BOOK') {
    if (!entry.isbn) {
      result.flags.push('MISSING_ISBN_BOOK');
    } else if (!isValidISBNFormat(entry.isbn)) {
      result.flags.push('INVALID_ISBN_FORMAT');
      result.isbn_verified = false;
    } else {
      const isbnResult = await verifyISBN(entry.isbn);
      result.details.isbnVerification = isbnResult;
      
      if (!isbnResult.found) {
        result.flags.push('ISBN_NOT_FOUND');
        result.isbn_verified = false;
      } else {
        result.isbn_verified = true;
        
        // Check title match
        if (!titlesMatch(entry.title, isbnResult.title, 0.6)) {
          result.flags.push('ISBN_TITLE_MISMATCH');
          result.details.titleMismatch = {
            provided: entry.title,
            found: isbnResult.title
          };
        }
        
        // Check author match (if authors available)
        if (entry.author && isbnResult.authors?.length > 0) {
          const authorMatch = isbnResult.authors.some(a => 
            a.toLowerCase().includes(entry.author.split(' ').pop().toLowerCase())
          );
          if (!authorMatch) {
            result.flags.push('ISBN_AUTHOR_MISMATCH');
            result.details.authorMismatch = {
              provided: entry.author,
              found: isbnResult.authors
            };
          }
        }
      }
    }
  }
  
  // 3. URL verification
  if (entry.external_url) {
    const urlResult = await verifyURL(entry.external_url);
    result.details.urlVerification = urlResult;
    result.url_verified = urlResult.reachable;
    
    if (!urlResult.reachable) {
      result.flags.push('URL_NOT_REACHABLE');
    }
    
    if (!isTrustedDomain(entry.external_url)) {
      result.flags.push('URL_DOMAIN_SUSPICIOUS');
    }
  } else {
    result.flags.push('MISSING_URL');
  }
  
  // 4. Deduplication
  const dupResult = await checkDuplicates(entry, stagingId);
  result.flags.push(...dupResult.flags);
  Object.assign(result.details, dupResult.details);
  if (dupResult.duplicateId) {
    result.details.duplicateStagingId = dupResult.duplicateId;
  }
  if (dupResult.duplicateProductionId) {
    result.details.duplicateProductionId = dupResult.duplicateProductionId;
  }
  
  // 5. Calculate final score and determine status
  for (const flag of result.flags) {
    const flagDef = FLAGS[flag];
    if (flagDef) {
      result.score -= flagDef.penalty;
      if (flagDef.autoReject) result.autoReject = true;
      if (flagDef.requiresReview) result.requiresManualReview = true;
    }
  }
  
  result.score = Math.max(0, result.score);
  
  // Determine final status
  if (result.autoReject) {
    result.status = 'FAILED';
  } else if (result.score < CONFIG.autoRejectThreshold) {
    result.status = 'FAILED';
  } else if (result.score >= CONFIG.autoApproveThreshold && !result.requiresManualReview) {
    result.status = 'PASSED';
  } else {
    result.status = 'REVIEW_REQUIRED';
    result.requiresManualReview = true;
  }
  
  return result;
}

// ============================================================================
// BATCH PROCESSING
// ============================================================================

/**
 * Process all pending entries in a batch
 */
async function processBatch(batchId) {
  console.log(`Processing batch: ${batchId}`);
  
  // Get pending entries
  const { data: entries, error } = await supabase
    .from('bo_v1_supercurricular_staging')
    .select('*')
    .eq('generation_batch', batchId)
    .eq('validation_status', 'PENDING')
    .eq('rejected', false);
  
  if (error) {
    console.error('Failed to fetch entries:', error);
    return;
  }
  
  console.log(`Found ${entries.length} pending entries`);
  
  const stats = { passed: 0, failed: 0, review: 0 };
  
  for (const entry of entries) {
    console.log(`Validating: ${entry.title}`);
    
    // Mark as validating
    await supabase
      .from('bo_v1_supercurricular_staging')
      .update({ validation_status: 'VALIDATING' })
      .eq('staging_id', entry.staging_id);
    
    // Run validation
    const result = await validateEntry(entry, entry.staging_id);
    
    // Update staging entry
    await supabase
      .from('bo_v1_supercurricular_staging')
      .update({
        validation_status: result.status,
        validation_score: result.score,
        validation_flags: result.flags,
        validation_details: result.details,
        validated_at: new Date().toISOString(),
        isbn_verified: result.isbn_verified,
        isbn_verification_data: result.details.isbnVerification,
        url_verified: result.url_verified,
        manual_review_status: result.requiresManualReview ? 'PENDING' : 'NOT_REQUIRED',
        rejected: result.autoReject,
        rejected_at: result.autoReject ? new Date().toISOString() : null,
        rejection_code: result.autoReject ? result.flags.find(f => FLAGS[f]?.autoReject) : null,
      })
      .eq('staging_id', entry.staging_id);
    
    // Update stats
    if (result.status === 'PASSED') stats.passed++;
    else if (result.status === 'FAILED') stats.failed++;
    else stats.review++;
    
    // Rate limiting
    await sleep(200);
  }
  
  console.log(`Batch complete: ${stats.passed} passed, ${stats.failed} failed, ${stats.review} need review`);
  
  // Update batch record
  await supabase
    .from('bo_v1_validation_batches')
    .update({
      validation_completed_at: new Date().toISOString(),
      passed_count: stats.passed,
      failed_count: stats.failed,
      review_required_count: stats.review,
    })
    .eq('batch_id', batchId);
}

/**
 * Auto-promote all passed entries in a batch
 */
async function autoPromoteBatch(batchId) {
  const { data: entries } = await supabase
    .from('bo_v1_supercurricular_staging')
    .select('staging_id, title')
    .eq('generation_batch', batchId)
    .eq('validation_status', 'PASSED')
    .eq('promoted_to_production', false);
  
  console.log(`Auto-promoting ${entries?.length || 0} entries`);
  
  for (const entry of entries || []) {
    try {
      const { data, error } = await supabase.rpc('promote_to_production', {
        p_staging_id: entry.staging_id
      });
      
      if (error) {
        console.error(`Failed to promote ${entry.title}:`, error);
      } else {
        console.log(`Promoted: ${entry.title}`);
      }
    } catch (err) {
      console.error(`Error promoting ${entry.title}:`, err);
    }
  }
}

// ============================================================================
// UTILITIES
// ============================================================================

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// ============================================================================
// CLI
// ============================================================================

async function main() {
  const args = process.argv.slice(2);
  
  if (args.includes('--help')) {
    console.log(`
Supercurricular Validation Pipeline

Usage:
  node validate-supercurriculars.js --batch=<batch_id>     Process specific batch
  node validate-supercurriculars.js --all-pending          Process all pending
  node validate-supercurriculars.js --promote=<batch_id>   Auto-promote passed entries
  node validate-supercurriculars.js --stats                Show validation statistics
    `);
    return;
  }
  
  const batchArg = args.find(a => a.startsWith('--batch='));
  if (batchArg) {
    const batchId = batchArg.split('=')[1];
    await processBatch(batchId);
    return;
  }
  
  const promoteArg = args.find(a => a.startsWith('--promote='));
  if (promoteArg) {
    const batchId = promoteArg.split('=')[1];
    await autoPromoteBatch(batchId);
    return;
  }
  
  if (args.includes('--all-pending')) {
    const { data: batches } = await supabase
      .from('bo_v1_supercurricular_staging')
      .select('generation_batch')
      .eq('validation_status', 'PENDING')
      .eq('rejected', false);
    
    const uniqueBatches = [...new Set(batches?.map(b => b.generation_batch) || [])];
    
    for (const batchId of uniqueBatches) {
      await processBatch(batchId);
    }
    return;
  }
  
  if (args.includes('--stats')) {
    const { data } = await supabase.from('v_validation_statistics').select('*');
    console.table(data);
    return;
  }
  
  console.log('No action specified. Use --help for usage.');
}

main().catch(console.error);
