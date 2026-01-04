// /api/capacity/start/route.ts
// Initialises a capacity benchmark session and returns the first item

import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

function getSupabaseClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}

export async function POST(request: NextRequest) {
  const supabase = getSupabaseClient();

  try {
    const body = await request.json();
    const { session_id, capacity_type } = body;

    // Validate inputs
    if (!session_id) {
      return NextResponse.json({ error: 'session_id required' }, { status: 400 });
    }

    if (!capacity_type || !['VRB', 'QNT', 'ABS', 'SPD'].includes(capacity_type)) {
      return NextResponse.json({ error: 'Valid capacity_type required (VRB, QNT, ABS, SPD)' }, { status: 400 });
    }

    // Check session exists
    const { data: session, error: sessionError } = await supabase
      .from('bo_v1_sessions')
      .select('id')
      .eq('id', session_id)
      .single();

    if (sessionError || !session) {
      return NextResponse.json({ error: 'Invalid session_id' }, { status: 404 });
    }

    // Check if already started
    const { data: existingState } = await supabase
      .from('bo_v1_cat_state')
      .select('*')
      .eq('session_id', session_id)
      .eq('capacity_type', capacity_type)
      .single();

    if (existingState && existingState.total_count > 0) {
      // Resume existing session - return next item
      const nextItem = await getNextItem(session_id, capacity_type, existingState);
      
      return NextResponse.json({
        status: 'resumed',
        progress: {
          completed: existingState.total_count,
          remaining: existingState.items_remaining,
          current_tier: existingState.current_tier,
          tier_locked: existingState.tier_locked
        },
        item: nextItem
      });
    }

    // Initialise CAT state
    const { error: stateError } = await supabase
      .from('bo_v1_cat_state')
      .upsert({
        session_id,
        capacity_type,
        current_tier: 'STANDARD',
        tier_locked: false,
        items_administered: [],
        items_remaining: 12,
        correct_count: 0,
        total_count: 0,
        theta_estimate: 0.0,
        theta_se: 1.0,
        started_at: new Date().toISOString()
      }, {
        onConflict: 'session_id,capacity_type'
      });

    if (stateError) {
      console.error('Error creating CAT state:', stateError);
      return NextResponse.json({ error: 'Failed to initialise benchmark' }, { status: 500 });
    }

    // Initialise results row
    await supabase
      .from('bo_v1_capacity_results')
      .upsert({
        session_id,
        [`${capacity_type.toLowerCase()}_items_completed`]: 0
      }, {
        onConflict: 'session_id'
      });

    // Get first item (always STANDARD tier)
    const { data: firstItem, error: itemError } = await supabase
      .from('bo_v1_capacity_items')
      .select('id, tier, interaction_type, stimulus, question, options, time_limit_seconds')
      .eq('capacity_type', capacity_type)
      .eq('tier', 'STANDARD')
      .eq('active', true)
      .limit(1)
      .single();

    if (itemError || !firstItem) {
      console.error('Error fetching first item:', itemError);
      return NextResponse.json({ error: 'No items available' }, { status: 500 });
    }

    // Format item for frontend
    const formattedItem = formatItemForFrontend(firstItem);

    return NextResponse.json({
      status: 'started',
      capacity_type,
      total_items: 12,
      progress: {
        completed: 0,
        remaining: 12,
        current_tier: 'STANDARD',
        tier_locked: false
      },
      item: formattedItem
    });

  } catch (error) {
    console.error('Capacity start error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

// Helper: Get next item based on CAT state
async function getNextItem(
  session_id: string,
  capacity_type: string,
  state: any
): Promise<any> {
  const supabase = getSupabaseClient();

  const { data: item } = await supabase
    .from('bo_v1_capacity_items')
    .select('id, tier, interaction_type, stimulus, question, options, time_limit_seconds')
    .eq('capacity_type', capacity_type)
    .eq('tier', state.current_tier)
    .eq('active', true)
    .not('id', 'in', `(${state.items_administered.map((i: string) => `'${i}'`).join(',') || "''"})`)
    .limit(1)
    .single();

  if (!item) {
    // Fallback: try adjacent tier if current tier exhausted
    const fallbackTier = state.current_tier === 'CHALLENGE' ? 'STANDARD' : 
                         state.current_tier === 'FOUNDATION' ? 'STANDARD' : 'STANDARD';
    
    const { data: fallbackItem } = await supabase
      .from('bo_v1_capacity_items')
      .select('id, tier, interaction_type, stimulus, question, options, time_limit_seconds')
      .eq('capacity_type', capacity_type)
      .eq('tier', fallbackTier)
      .eq('active', true)
      .not('id', 'in', `(${state.items_administered.map((i: string) => `'${i}'`).join(',') || "''"})`)
      .limit(1)
      .single();

    return fallbackItem ? formatItemForFrontend(fallbackItem) : null;
  }

  return formatItemForFrontend(item);
}

// Helper: Format item for frontend consumption
function formatItemForFrontend(item: any): any {
  const formatted: any = {
    id: item.id,
    tier: item.tier,
    type: item.interaction_type,
    time_limit: item.time_limit_seconds,
    question: item.question
  };

  // Add stimulus if present
  if (item.stimulus) {
    formatted.stimulus = item.stimulus;
  }

  // Format options based on interaction type
  if (item.options) {
    const options = typeof item.options === 'string' ? JSON.parse(item.options) : item.options;
    
    switch (item.interaction_type) {
      case 'MCQ':
        // Options come as {"A": "text", "B": "text", ...}
        formatted.options = options;
        break;
      
      case 'BINARY_RAPID':
        // Options come as ["OPTION1", "OPTION2"]
        formatted.options = options;
        break;
      
      case 'HIGHLIGHT_SELECT':
        // Options are tappable words/phrases
        formatted.tappable_segments = options;
        break;
      
      case 'SENTENCE_ORDER':
        // Options are sentences to reorder
        formatted.sentences = options;
        break;
      
      case 'PRIORITISE_SELECT':
        // Options include items and select count
        formatted.options = options.options || options;
        formatted.select_count = options.select_count || 4;
        break;
      
      case 'SHORT_RESPONSE':
        // Options contain char limit
        formatted.char_limit = options.char_limit || 120;
        break;
      
      case 'TABLE_READ':
        // Options are selectable rows/values
        formatted.options = options;
        break;
      
      case 'ESTIMATION':
        // Options contain ranges
        formatted.ranges = options.ranges || options;
        break;
      
      default:
        formatted.options = options;
    }
  }

  return formatted;
}
