// /api/capacity/intro/route.ts
// Handles the 3-item capacity intro flow with fixed showcase items
// Responses count towards full benchmarks taken later

import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

// Fixed showcase items - one per benchmark, curated for engagement
const INTRO_ITEMS: Record<string, string> = {
  VRB: 'VRB_F1_BIN',   // NHS claim + evidence - relatable, clear task
  QNT: 'QNT_F10_TBL',  // Train timetable - visual, quick win
  SPD: 'SPD_S2_BIN'    // Code comparison - feels like speed test
};

const INTRO_ORDER = ['VRB', 'QNT', 'SPD'];

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { session_id, action, capacity_type, response, response_time_ms } = body;

    if (!session_id) {
      return NextResponse.json({ error: 'session_id required' }, { status: 400 });
    }

    // Validate session exists
    const { data: session, error: sessionError } = await supabase
      .from('bo_v1_sessions')
      .select('id')
      .eq('id', session_id)
      .single();

    if (sessionError || !session) {
      return NextResponse.json({ error: 'Invalid session_id' }, { status: 404 });
    }

    switch (action) {
      case 'start':
        return handleStart(session_id);
      case 'respond':
        return handleRespond(session_id, capacity_type, response, response_time_ms);
      case 'skip':
        return handleSkip(session_id, capacity_type);
      case 'skip_all':
        return handleSkipAll(session_id);
      default:
        return NextResponse.json({ error: 'Invalid action. Use: start, respond, skip, skip_all' }, { status: 400 });
    }

  } catch (error) {
    console.error('Capacity intro error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

// Start intro flow - check what's already done, return first pending item
async function handleStart(session_id: string) {
  // Check which intro items have already been completed
  const { data: existingResponses } = await supabase
    .from('bo_v1_capacity_responses')
    .select('item_id, capacity_type')
    .eq('session_id', session_id)
    .in('item_id', Object.values(INTRO_ITEMS));

  const completedTypes = new Set(existingResponses?.map(r => r.capacity_type) || []);
  
  // Find first incomplete benchmark
  const nextType = INTRO_ORDER.find(type => !completedTypes.has(type));

  if (!nextType) {
    // All intro items completed
    return NextResponse.json({
      status: 'complete',
      message: 'All intro items completed',
      completed: INTRO_ORDER
    });
  }

  // Get the fixed item for this benchmark
  const item = await getIntroItem(nextType);
  
  if (!item) {
    return NextResponse.json({ error: `Intro item not found for ${nextType}` }, { status: 500 });
  }

  return NextResponse.json({
    status: 'continue',
    progress: {
      current: INTRO_ORDER.indexOf(nextType) + 1,
      total: 3,
      completed: Array.from(completedTypes),
      current_type: nextType
    },
    item
  });
}

// Handle response to an intro item
async function handleRespond(
  session_id: string, 
  capacity_type: string, 
  response: any, 
  response_time_ms?: number
) {
  if (!capacity_type || !INTRO_ITEMS[capacity_type]) {
    return NextResponse.json({ error: 'Invalid capacity_type' }, { status: 400 });
  }

  if (response === undefined || response === null) {
    return NextResponse.json({ error: 'response required' }, { status: 400 });
  }

  const itemId = INTRO_ITEMS[capacity_type];

  // Check if already answered
  const { data: existing } = await supabase
    .from('bo_v1_capacity_responses')
    .select('id')
    .eq('session_id', session_id)
    .eq('item_id', itemId)
    .single();

  if (existing) {
    return NextResponse.json({ error: 'Item already answered' }, { status: 400 });
  }

  // Get item details for scoring
  const { data: item, error: itemError } = await supabase
    .from('bo_v1_capacity_items')
    .select('*')
    .eq('id', itemId)
    .single();

  if (itemError || !item) {
    return NextResponse.json({ error: 'Item not found' }, { status: 500 });
  }

  // Score the response
  const scoreResult = scoreResponse(item, response);

  // Save response (counts towards full benchmark later)
  const { error: saveError } = await supabase
    .from('bo_v1_capacity_responses')
    .insert({
      session_id,
      item_id: itemId,
      response: JSON.stringify(response),
      score: scoreResult.score,
      max_score: item.max_score,
      response_time_ms: response_time_ms || null,
      capacity_type,
      tier: item.tier,
      block: item.block,
      interaction_type: item.interaction_type
    });

  if (saveError) {
    console.error('Error saving intro response:', saveError);
    return NextResponse.json({ error: 'Failed to save response' }, { status: 500 });
  }

  // Check what's completed now
  const { data: allResponses } = await supabase
    .from('bo_v1_capacity_responses')
    .select('capacity_type')
    .eq('session_id', session_id)
    .in('item_id', Object.values(INTRO_ITEMS));

  const completedTypes = new Set(allResponses?.map(r => r.capacity_type) || []);
  const nextType = INTRO_ORDER.find(type => !completedTypes.has(type));

  // If all done, update session
  if (!nextType) {
    await supabase
      .from('bo_v1_sessions')
      .update({ benchmarks_completed: 3 })
      .eq('id', session_id);

    return NextResponse.json({
      status: 'complete',
      score_feedback: {
        correct: scoreResult.score >= item.max_score * 0.5,
        score: scoreResult.score,
        max_score: item.max_score
      },
      progress: {
        current: 3,
        total: 3,
        completed: Array.from(completedTypes)
      }
    });
  }

  // Get next item
  const nextItem = await getIntroItem(nextType);

  return NextResponse.json({
    status: 'continue',
    score_feedback: {
      correct: scoreResult.score >= item.max_score * 0.5,
      score: scoreResult.score,
      max_score: item.max_score
    },
    progress: {
      current: INTRO_ORDER.indexOf(nextType) + 1,
      total: 3,
      completed: Array.from(completedTypes),
      current_type: nextType
    },
    item: nextItem
  });
}

// Skip a single benchmark in intro flow
async function handleSkip(session_id: string, capacity_type: string) {
  if (!capacity_type || !INTRO_ITEMS[capacity_type]) {
    return NextResponse.json({ error: 'Invalid capacity_type' }, { status: 400 });
  }

  // Check what's been completed (not skipped items, just actual responses)
  const { data: responses } = await supabase
    .from('bo_v1_capacity_responses')
    .select('capacity_type')
    .eq('session_id', session_id)
    .in('item_id', Object.values(INTRO_ITEMS));

  const completedTypes = new Set(responses?.map(r => r.capacity_type) || []);
  
  // Find next type after the skipped one
  const currentIndex = INTRO_ORDER.indexOf(capacity_type);
  const remainingTypes = INTRO_ORDER.slice(currentIndex + 1);
  const nextType = remainingTypes.find(type => !completedTypes.has(type));

  if (!nextType) {
    // No more items
    return NextResponse.json({
      status: 'complete',
      progress: {
        current: 3,
        total: 3,
        completed: Array.from(completedTypes),
        skipped: [capacity_type]
      }
    });
  }

  const nextItem = await getIntroItem(nextType);

  return NextResponse.json({
    status: 'continue',
    progress: {
      current: INTRO_ORDER.indexOf(nextType) + 1,
      total: 3,
      completed: Array.from(completedTypes),
      current_type: nextType
    },
    item: nextItem
  });
}

// Skip entire intro flow
async function handleSkipAll(session_id: string) {
  // Just mark as done with 0 benchmarks
  await supabase
    .from('bo_v1_sessions')
    .update({ benchmarks_completed: 0 })
    .eq('id', session_id);

  return NextResponse.json({
    status: 'skipped',
    message: 'Capacity intro skipped'
  });
}

// Get formatted intro item
async function getIntroItem(capacity_type: string) {
  const itemId = INTRO_ITEMS[capacity_type];
  
  const { data: item } = await supabase
    .from('bo_v1_capacity_items')
    .select('id, tier, interaction_type, stimulus, question, options, time_limit_seconds')
    .eq('id', itemId)
    .single();

  if (!item) return null;

  return formatItemForFrontend(item, capacity_type);
}

// Score response (simplified - only handles intro item types)
function scoreResponse(item: any, response: any): { score: number; reason?: string } {
  let correctAnswer: any;
  
  if (typeof item.correct_answer === 'string') {
    try {
      correctAnswer = JSON.parse(item.correct_answer);
    } catch {
      correctAnswer = item.correct_answer.replace(/^"|"$/g, '');
    }
  } else {
    correctAnswer = item.correct_answer;
  }

  switch (item.interaction_type) {
    case 'BINARY_RAPID':
      const binaryCorrect = String(response).toUpperCase() === String(correctAnswer).toUpperCase();
      return { score: binaryCorrect ? item.max_score : 0 };

    case 'TABLE_READ':
      const tableCorrect = response === correctAnswer || 
        String(response).toUpperCase() === String(correctAnswer).toUpperCase();
      return { score: tableCorrect ? item.max_score : 0 };

    default:
      return { score: 0, reason: 'Unknown interaction type' };
  }
}

// Format item for frontend
function formatItemForFrontend(item: any, capacity_type: string): any {
  const formatted: any = {
    id: item.id,
    capacity_type,
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
    formatted.options = options;
  }

  return formatted;
}