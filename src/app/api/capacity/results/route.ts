// /api/capacity/results/route.ts
// Returns capacity benchmark results for a session

import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const session_id = searchParams.get('session_id');
    const capacity_type = searchParams.get('capacity_type');

    if (!session_id) {
      return NextResponse.json({ error: 'session_id required' }, { status: 400 });
    }

    // Get capacity results
    const { data: results, error: resultsError } = await supabase
      .from('bo_v1_capacity_results')
      .select('*')
      .eq('session_id', session_id)
      .single();

    if (resultsError && resultsError.code !== 'PGRST116') {
      console.error('Error fetching results:', resultsError);
      return NextResponse.json({ error: 'Failed to fetch results' }, { status: 500 });
    }

    // Get profile data for capacity scores
    const { data: profile } = await supabase
      .from('bo_v1_profiles')
      .select('vrb_value, vrb_sigma, vrb_provenance, qnt_value, qnt_sigma, qnt_provenance, spd_value, spd_sigma, spd_provenance')
      .eq('session_id', session_id)
      .single();

    // If specific capacity type requested
    if (capacity_type) {
      const prefix = capacity_type.toLowerCase();
      
      if (!results || !results[`${prefix}_completed_at`]) {
        return NextResponse.json({ 
          status: 'not_started',
          capacity_type,
          message: `${capacity_type} benchmark not completed`
        });
      }

      return NextResponse.json({
        status: 'complete',
        capacity_type,
        results: {
          value: results[`${prefix}_value`],
          sigma: results[`${prefix}_sigma`],
          raw_score: results[`${prefix}_raw_score`],
          max_score: results[`${prefix}_max_score`],
          weighted_score: results[`${prefix}_weighted_score`],
          items_completed: results[`${prefix}_items_completed`],
          tier_distribution: results[`${prefix}_tier_distribution`],
          block_performance: results[`${prefix}_block_performance`],
          avg_response_time_ms: results[`${prefix}_avg_response_time_ms`],
          calibration_signal: results[`${prefix}_calibration_signal`],
          enjoyment_signal: results[`${prefix}_enjoyment_response`],
          flags: results[`${prefix}_flags`],
          completed_at: results[`${prefix}_completed_at`]
        }
      });
    }

    // Return all capacity results
    const capacities: Record<string, any> = {};

    for (const type of ['vrb', 'qnt', 'abs', 'spd']) {
      const isComplete = results?.[`${type}_completed_at`];
      
      if (isComplete) {
        capacities[type.toUpperCase()] = {
          status: 'complete',
          value: results[`${type}_value`],
          sigma: results[`${type}_sigma`],
          items_completed: results[`${type}_items_completed`],
          tier_distribution: results[`${type}_tier_distribution`],
          block_performance: results[`${type}_block_performance`],
          flags: results[`${type}_flags`],
          completed_at: results[`${type}_completed_at`]
        };
      } else if (profile?.[`${type}_provenance`] === 'PROXIED') {
        capacities[type.toUpperCase()] = {
          status: 'proxied',
          value: profile[`${type}_value`],
          sigma: profile[`${type}_sigma`],
          message: 'Estimated from disposition profile'
        };
      } else {
        capacities[type.toUpperCase()] = {
          status: 'not_started'
        };
      }
    }

    return NextResponse.json({
      session_id,
      capacities
    });

  } catch (error) {
    console.error('Capacity results error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

// POST: Record calibration/enjoyment signals
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { session_id, capacity_type, signal_type, signal_value } = body;

    if (!session_id || !capacity_type || !signal_type || !signal_value) {
      return NextResponse.json({ 
        error: 'Missing required fields' 
      }, { status: 400 });
    }

    if (!['calibration', 'enjoyment'].includes(signal_type)) {
      return NextResponse.json({ 
        error: 'signal_type must be "calibration" or "enjoyment"' 
      }, { status: 400 });
    }

    const prefix = capacity_type.toLowerCase();
    const field = signal_type === 'calibration' 
      ? `${prefix}_calibration_response`
      : `${prefix}_enjoyment_response`;

    // Update results table
    const { error } = await supabase
      .from('bo_v1_capacity_results')
      .update({ 
        [field]: signal_value,
        updated_at: new Date().toISOString()
      })
      .eq('session_id', session_id);

    if (error) {
      console.error('Error saving signal:', error);
      return NextResponse.json({ error: 'Failed to save signal' }, { status: 500 });
    }

    // If calibration signal, calculate calibration accuracy
    if (signal_type === 'calibration') {
      await calculateCalibrationSignal(session_id, capacity_type, signal_value);
    }

    return NextResponse.json({ success: true });

  } catch (error) {
    console.error('Signal recording error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

// Calculate whether user is over/under confident
async function calculateCalibrationSignal(
  session_id: string, 
  capacity_type: string,
  selfReport: string
): Promise<void> {
  const prefix = capacity_type.toLowerCase();

  // Get actual performance
  const { data: results } = await supabase
    .from('bo_v1_capacity_results')
    .select(`${prefix}_raw_score, ${prefix}_max_score`)
    .eq('session_id', session_id)
    .single();

  if (!results) return;

  const rawScore = results[`${prefix}_raw_score`];
  const maxScore = results[`${prefix}_max_score`];
  
  if (!maxScore) return;

  const actualPerformance = rawScore / maxScore;

  // Map self-report to expected performance
  const confidenceMap: Record<string, number> = {
    'SOLID': 0.75,
    'MIXED': 0.50,
    'STRUGGLING': 0.25
  };

  const expectedPerformance = confidenceMap[selfReport] || 0.5;

  // Determine calibration signal
  let signal: string;
  const diff = actualPerformance - expectedPerformance;

  if (diff > 0.2) {
    signal = 'UNDERCONFIDENT'; // Did better than they thought
  } else if (diff < -0.2) {
    signal = 'OVERCONFIDENT'; // Did worse than they thought
  } else {
    signal = 'CALIBRATED'; // Accurate self-assessment
  }

  // Update results
  await supabase
    .from('bo_v1_capacity_results')
    .update({ 
      [`${prefix}_calibration_signal`]: signal,
      updated_at: new Date().toISOString()
    })
    .eq('session_id', session_id);
}
