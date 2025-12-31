// /api/capacity/respond/route.ts
// Processes a response, updates CAT state, and returns the next item

import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';
import Anthropic from '@anthropic-ai/sdk';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

// Anthropic client for LLM scoring (lazy init)
let anthropic: Anthropic | null = null;
function getAnthropic(): Anthropic {
  if (!anthropic) {
    anthropic = new Anthropic();
  }
  return anthropic;
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { session_id, capacity_type, item_id, response, response_time_ms } = body;

    // Validate inputs
    if (!session_id || !capacity_type || !item_id || response === undefined) {
      return NextResponse.json({ 
        error: 'Missing required fields: session_id, capacity_type, item_id, response' 
      }, { status: 400 });
    }

    // Get item details
    const { data: item, error: itemError } = await supabase
      .from('bo_v1_capacity_items')
      .select('*')
      .eq('id', item_id)
      .single();

    if (itemError || !item) {
      return NextResponse.json({ error: 'Invalid item_id' }, { status: 404 });
    }

    // Get current CAT state
    const { data: catState, error: stateError } = await supabase
      .from('bo_v1_cat_state')
      .select('*')
      .eq('session_id', session_id)
      .eq('capacity_type', capacity_type)
      .single();

    if (stateError || !catState) {
      return NextResponse.json({ error: 'Benchmark not started' }, { status: 400 });
    }

    // Check if item already answered
    if (catState.items_administered.includes(item_id)) {
      return NextResponse.json({ error: 'Item already answered' }, { status: 400 });
    }

    // Score the response
    const scoreResult = await scoreResponse(item, response);

    // Save response
    const { error: responseError } = await supabase
      .from('bo_v1_capacity_responses')
      .insert({
        session_id,
        item_id,
        response: JSON.stringify(response),
        score: scoreResult.score,
        max_score: item.max_score,
        response_time_ms: response_time_ms || null,
        capacity_type,
        tier: item.tier,
        block: item.block,
        interaction_type: item.interaction_type,
        llm_raw_response: scoreResult.llm_response || null,
        llm_score_reason: scoreResult.reason || null
      });

    if (responseError) {
      console.error('Error saving response:', responseError);
      return NextResponse.json({ error: 'Failed to save response' }, { status: 500 });
    }

    // Update CAT state
    const isCorrect = scoreResult.score >= item.max_score * 0.5; // 50% threshold for "correct"
    const newItemsAdministered = [...catState.items_administered, item_id];
    const newCorrectCount = catState.correct_count + (isCorrect ? 1 : 0);
    const newTotalCount = catState.total_count + 1;
    const newItemsRemaining = catState.items_remaining - 1;

    // Calculate new average response time
    const newAvgTime = catState.avg_response_time_ms 
      ? Math.round((catState.avg_response_time_ms * catState.total_count + (response_time_ms || 0)) / newTotalCount)
      : response_time_ms || 0;

    // Determine tier adjustment (only if not locked)
    let newTier = catState.current_tier;
    let tierLocked = catState.tier_locked;

    if (!tierLocked && newTotalCount <= 4) {
      const accuracy = newCorrectCount / newTotalCount;
      const isFast = newAvgTime < 35000;

      if (accuracy >= 0.75 && isFast) {
        newTier = 'CHALLENGE';
      } else if (accuracy <= 0.4) {
        newTier = 'FOUNDATION';
      } else {
        newTier = 'STANDARD';
      }
    }

    // Lock tier after 4 items
    if (newTotalCount >= 4) {
      tierLocked = true;
    }

    // Update CAT state in DB
    await supabase
      .from('bo_v1_cat_state')
      .update({
        items_administered: newItemsAdministered,
        items_remaining: newItemsRemaining,
        correct_count: newCorrectCount,
        total_count: newTotalCount,
        avg_response_time_ms: newAvgTime,
        current_tier: newTier,
        tier_locked: tierLocked,
        last_item_at: new Date().toISOString()
      })
      .eq('session_id', session_id)
      .eq('capacity_type', capacity_type);

    // Check if benchmark complete
    if (newItemsRemaining <= 0) {
      // Calculate final scores
      const finalScores = await calculateFinalScores(session_id, capacity_type);
      
      // Update profile with measured capacity
      await updateProfileCapacity(session_id, capacity_type, finalScores);

      return NextResponse.json({
        status: 'complete',
        score_feedback: {
          correct: isCorrect,
          score: scoreResult.score,
          max_score: item.max_score
        },
        progress: {
          completed: newTotalCount,
          remaining: 0,
          current_tier: newTier
        },
        results: finalScores
      });
    }

    // Get next item
    const nextItem = await getNextItem(session_id, capacity_type, newTier, newItemsAdministered);

    if (!nextItem) {
      // No more items available - complete early
      const finalScores = await calculateFinalScores(session_id, capacity_type);
      await updateProfileCapacity(session_id, capacity_type, finalScores);

      return NextResponse.json({
        status: 'complete',
        score_feedback: {
          correct: isCorrect,
          score: scoreResult.score,
          max_score: item.max_score
        },
        progress: {
          completed: newTotalCount,
          remaining: 0,
          current_tier: newTier
        },
        results: finalScores
      });
    }

    return NextResponse.json({
      status: 'continue',
      score_feedback: {
        correct: isCorrect,
        score: scoreResult.score,
        max_score: item.max_score
      },
      progress: {
        completed: newTotalCount,
        remaining: newItemsRemaining,
        current_tier: newTier,
        tier_locked: tierLocked
      },
      item: nextItem
    });

  } catch (error) {
    console.error('Capacity respond error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

// Score a response based on interaction type
async function scoreResponse(item: any, response: any): Promise<{
  score: number;
  reason?: string;
  llm_response?: any;
}> {
  // Safely parse correct_answer - handle both JSON and plain strings
  let correctAnswer: any;
  
  if (typeof item.correct_answer === 'string') {
    // Try parsing as JSON first
    try {
      correctAnswer = JSON.parse(item.correct_answer);
    } catch {
      // Not valid JSON - treat as plain string, strip quotes if present
      correctAnswer = item.correct_answer.replace(/^"|"$/g, '');
    }
  } else {
    correctAnswer = item.correct_answer;
  }

  switch (item.interaction_type) {
    case 'MCQ':
    case 'TABLE_READ':
      // Simple string match
      const isCorrect = response === correctAnswer || 
                        response === String(correctAnswer) ||
                        String(response).toUpperCase() === String(correctAnswer).toUpperCase();
      return { score: isCorrect ? item.max_score : 0 };

    case 'BINARY_RAPID':
      // String match for binary choices
      const binaryCorrect = String(response).toUpperCase() === String(correctAnswer).toUpperCase();
      return { score: binaryCorrect ? item.max_score : 0 };

    case 'HIGHLIGHT_SELECT':
      // Check if selected text matches
      const selectedCorrect = response === correctAnswer || 
        (Array.isArray(correctAnswer) && correctAnswer.includes(response));
      return { score: selectedCorrect ? item.max_score : 0 };

    case 'SENTENCE_ORDER':
      // Partial credit for ordering
      return scoreSentenceOrder(response, correctAnswer, item.max_score);

    case 'PRIORITISE_SELECT':
      // Weighted scoring for selection tasks
      return scorePrioritiseSelect(response, correctAnswer, item.max_score);

    case 'ESTIMATION':
      // Range-based scoring
      return scoreEstimation(response, correctAnswer, item.max_score);

    case 'SHORT_RESPONSE':
      // LLM scoring
      return await scoreLLM(item, response, correctAnswer);

    default:
      return { score: 0, reason: 'Unknown interaction type' };
  }
}

// Score sentence ordering with partial credit
function scoreSentenceOrder(response: number[], correct: number[], maxScore: number): {
  score: number;
  reason?: string;
} {
  if (!Array.isArray(response) || response.length !== correct.length) {
    return { score: 0, reason: 'Invalid response format' };
  }

  let correctPositions = 0;
  for (let i = 0; i < correct.length; i++) {
    if (response[i] === correct[i]) {
      correctPositions++;
    }
  }

  const accuracy = correctPositions / correct.length;
  
  // Scoring: 100% = full, 75%+ = 0.8, 50%+ = 0.5, else = 0.25 or 0
  let score: number;
  if (accuracy === 1) score = maxScore;
  else if (accuracy >= 0.75) score = maxScore * 0.8;
  else if (accuracy >= 0.5) score = maxScore * 0.5;
  else if (accuracy >= 0.25) score = maxScore * 0.25;
  else score = 0;

  return { 
    score, 
    reason: `${correctPositions}/${correct.length} positions correct` 
  };
}

// Score prioritise & select tasks
function scorePrioritiseSelect(response: number[], correct: any, maxScore: number): {
  score: number;
  reason?: string;
} {
  if (!Array.isArray(response)) {
    return { score: 0, reason: 'Invalid response format' };
  }

  const highValue = correct.high_value || [];
  const mediumValue = correct.medium_value || [];
  const lowValue = correct.low_value || [];

  let points = 0;
  let highSelected = 0;
  let lowSelected = 0;

  for (const idx of response) {
    if (highValue.includes(idx)) {
      points += 1.0;
      highSelected++;
    } else if (mediumValue.includes(idx)) {
      points += 0.3;
    } else if (lowValue.includes(idx)) {
      points -= 0.25;
      lowSelected++;
    }
  }

  // Normalise to max score
  const normalised = Math.max(0, Math.min(maxScore, (points / highValue.length) * maxScore));

  return { 
    score: normalised, 
    reason: `${highSelected} high-value, ${lowSelected} low-value selected` 
  };
}

// Score estimation tasks
function scoreEstimation(response: number, correct: any, maxScore: number): {
  score: number;
  reason?: string;
} {
  const correctRange = correct.correct_range;
  
  if (response === correctRange) {
    return { score: maxScore, reason: 'Correct range' };
  }
  
  // Adjacent range gets partial credit
  if (Math.abs(response - correctRange) === 1) {
    return { score: maxScore * 0.5, reason: 'Adjacent range' };
  }

  return { score: 0, reason: 'Outside acceptable range' };
}

// LLM scoring for short responses
async function scoreLLM(item: any, response: string, rubric: any): Promise<{
  score: number;
  reason?: string;
  llm_response?: any;
}> {
  // Skip LLM if response is empty or too short
  if (!response || response.trim().length < 10) {
    return { score: 0, reason: 'Response too short' };
  }

  const prompt = `You are scoring a verbal/quantitative reasoning response.

CONTEXT:
${item.stimulus || ''}

QUESTION:
${item.question}

STUDENT RESPONSE:
${response}

KEY CONCEPTS TO IDENTIFY:
${JSON.stringify(rubric.key_concepts || [])}

SCORING RUBRIC:
${JSON.stringify(rubric.rubric || {})}

Score this response. Respond with ONLY valid JSON:
{"score": 0|1|2, "reason": "brief explanation"}`;

  try {
    const client = getAnthropic();
    const message = await client.messages.create({
      model: 'claude-sonnet-4-20250514',
      max_tokens: 150,
      messages: [{ role: 'user', content: prompt }]
    });

    const content = message.content[0];
    if (content.type === 'text') {
      const result = JSON.parse(content.text);
      return {
        score: Math.min(result.score, item.max_score),
        reason: result.reason,
        llm_response: result
      };
    }
  } catch (error) {
    console.error('LLM scoring error:', error);
    // Fallback: give partial credit for any substantial response
    return { 
      score: item.max_score * 0.5, 
      reason: 'LLM scoring failed, partial credit awarded' 
    };
  }

  return { score: 0, reason: 'LLM scoring failed' };
}

// Get next item based on current state
async function getNextItem(
  session_id: string,
  capacity_type: string,
  tier: string,
  administered: string[]
): Promise<any> {
  // Build exclusion list
  const exclusionList = administered.length > 0 
    ? administered.map(id => `'${id}'`).join(',')
    : "''";

  const { data: item } = await supabase
    .from('bo_v1_capacity_items')
    .select('id, tier, interaction_type, stimulus, question, options, time_limit_seconds')
    .eq('capacity_type', capacity_type)
    .eq('tier', tier)
    .eq('active', true)
    .not('id', 'in', `(${exclusionList})`)
    .limit(1)
    .single();

  if (item) {
    return formatItemForFrontend(item);
  }

  // Try adjacent tier if exhausted
  const fallbackTier = tier === 'CHALLENGE' ? 'STANDARD' : 
                       tier === 'FOUNDATION' ? 'STANDARD' : null;
  
  if (fallbackTier) {
    const { data: fallbackItem } = await supabase
      .from('bo_v1_capacity_items')
      .select('id, tier, interaction_type, stimulus, question, options, time_limit_seconds')
      .eq('capacity_type', capacity_type)
      .eq('tier', fallbackTier)
      .eq('active', true)
      .not('id', 'in', `(${exclusionList})`)
      .limit(1)
      .single();

    if (fallbackItem) {
      return formatItemForFrontend(fallbackItem);
    }
  }

  return null;
}

// Calculate final scores
async function calculateFinalScores(session_id: string, capacity_type: string): Promise<any> {
  const tierWeights: Record<string, number> = {
    'FOUNDATION': 0.8,
    'STANDARD': 1.0,
    'CHALLENGE': 1.25
  };

  // Get all responses for this benchmark
  const { data: responses } = await supabase
    .from('bo_v1_capacity_responses')
    .select('score, max_score, tier, block, response_time_ms')
    .eq('session_id', session_id)
    .eq('capacity_type', capacity_type);

  if (!responses || responses.length === 0) {
    return { value: 50, sigma: 20, raw_score: 0, max_score: 0 };
  }

  let weightedSum = 0;
  let weightedMax = 0;
  let rawScore = 0;
  let maxScore = 0;
  let totalTime = 0;

  const tierDistribution: Record<string, number> = { FOUNDATION: 0, STANDARD: 0, CHALLENGE: 0 };
  const blockPerformance: Record<string, { score: number; max: number }> = {};

  for (const r of responses) {
    const weight = tierWeights[r.tier] || 1.0;
    weightedSum += r.score * weight;
    weightedMax += r.max_score * weight;
    rawScore += r.score;
    maxScore += r.max_score;
    totalTime += r.response_time_ms || 0;

    tierDistribution[r.tier] = (tierDistribution[r.tier] || 0) + 1;

    if (!blockPerformance[r.block]) {
      blockPerformance[r.block] = { score: 0, max: 0 };
    }
    blockPerformance[r.block].score += r.score;
    blockPerformance[r.block].max += r.max_score;
  }

  // Calculate 0-100 value
  const percentage = weightedMax > 0 ? weightedSum / weightedMax : 0.5;
  const value = Math.max(0, Math.min(100, Math.round(50 + (percentage - 0.5) * 80)));

  // Sigma reduces with more items
  const sigma = Math.max(8, 20 - responses.length);

  // Detect weak blocks (< 40% performance)
  const flags: string[] = [];
  for (const [block, perf] of Object.entries(blockPerformance)) {
    if (perf.max > 0 && perf.score / perf.max < 0.4) {
      flags.push(`WEAK_${block.toUpperCase()}`);
    }
  }

  return {
    value,
    sigma,
    raw_score: rawScore,
    max_score: maxScore,
    weighted_score: weightedSum,
    items_completed: responses.length,
    tier_distribution: tierDistribution,
    block_performance: blockPerformance,
    avg_response_time_ms: Math.round(totalTime / responses.length),
    flags
  };
}

// Update profile with measured capacity
async function updateProfileCapacity(session_id: string, capacity_type: string, scores: any): Promise<void> {
  const prefix = capacity_type.toLowerCase();
  
  const updateData: Record<string, any> = {
    [`${prefix}_value`]: scores.value,
    [`${prefix}_sigma`]: scores.sigma,
    [`${prefix}_provenance`]: 'MEASURED',
    updated_at: new Date().toISOString()
  };

  await supabase
    .from('bo_v1_profiles')
    .update(updateData)
    .eq('session_id', session_id);

  // Also update capacity results table
  const resultsData: Record<string, any> = {
    session_id,
    [`${prefix}_raw_score`]: scores.raw_score,
    [`${prefix}_max_score`]: scores.max_score,
    [`${prefix}_weighted_score`]: scores.weighted_score,
    [`${prefix}_value`]: scores.value,
    [`${prefix}_sigma`]: scores.sigma,
    [`${prefix}_items_completed`]: scores.items_completed,
    [`${prefix}_tier_distribution`]: scores.tier_distribution,
    [`${prefix}_block_performance`]: scores.block_performance,
    [`${prefix}_avg_response_time_ms`]: scores.avg_response_time_ms,
    [`${prefix}_flags`]: scores.flags,
    [`${prefix}_completed_at`]: new Date().toISOString(),
    updated_at: new Date().toISOString()
  };

  await supabase
    .from('bo_v1_capacity_results')
    .upsert(resultsData, { onConflict: 'session_id' });
}

// Format item for frontend
function formatItemForFrontend(item: any): any {
  const formatted: any = {
    id: item.id,
    tier: item.tier,
    type: item.interaction_type,
    time_limit: item.time_limit_seconds,
    question: item.question
  };

  if (item.stimulus) {
    formatted.stimulus = item.stimulus;
  }

  if (item.options) {
    const options = typeof item.options === 'string' ? JSON.parse(item.options) : item.options;
    
    switch (item.interaction_type) {
      case 'MCQ':
        formatted.options = options;
        break;
      case 'BINARY_RAPID':
        formatted.options = options;
        break;
      case 'HIGHLIGHT_SELECT':
        formatted.tappable_segments = options;
        break;
      case 'SENTENCE_ORDER':
        formatted.sentences = options;
        break;
      case 'PRIORITISE_SELECT':
        formatted.options = options.options || options;
        formatted.select_count = options.select_count || 4;
        break;
      case 'SHORT_RESPONSE':
        formatted.char_limit = options.char_limit || 120;
        break;
      case 'TABLE_READ':
        formatted.options = options;
        break;
      case 'ESTIMATION':
        formatted.ranges = options.ranges || options;
        break;
      default:
        formatted.options = options;
    }
  }

  return formatted;
}
