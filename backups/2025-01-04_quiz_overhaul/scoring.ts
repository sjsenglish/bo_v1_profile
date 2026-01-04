import {
  DispositionScore,
  CognitiveProfile,
  BehavioralProfile,
  CapacityProfile,
  VibeCard,
  VibeSwipe,
  COGNITIVE_DIMENSIONS,
  BEHAVIORAL_DIMENSIONS,
  SIGMA_BY_TIER,
} from './types';

// ============================================================================
// SCENARIO TYPES
// ============================================================================

export interface Scenario {
  id: string;
  dimension: string;
  scenario_context: string;
  option_a: string;
  option_b: string;
  a_indicates: string; // 'high_<dimension>' or 'low_<dimension>'
  b_indicates: string;
}

export interface ScenarioResponse {
  scenario_id: string;
  choice: 'A' | 'B'; // or 1 | 2 from database
}

// ============================================================================
// SCENARIO SCORING (Forced-Choice A/B)
// ============================================================================

/**
 * Score scenarios based on forced-choice A/B responses.
 * Each scenario contributes to one disposition dimension.
 *
 * - Choosing the "high" option adds +12 to base 50
 * - Choosing the "low" option subtracts -12 from base 50
 *
 * With 8 scenarios (1 per dimension for most), scores range from ~38-62.
 */
export function scoreScenarios(
  responses: ScenarioResponse[],
  scenarios: Scenario[]
): { cognitive: CognitiveProfile; behavioral: BehavioralProfile } {
  // Initialize all dimensions at 50 (neutral)
  const cognitive: CognitiveProfile = {
    calibration: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    tolerance: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    transfer: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    precision: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    retrieval: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    receptivity: { value: 50, sigma: SIGMA_BY_TIER.CORE },
  };

  const behavioral: BehavioralProfile = {
    structure: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    consistency: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    social: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    depth: { value: 50, sigma: SIGMA_BY_TIER.CORE },
  };

  // Process each response
  for (const response of responses) {
    const scenario = scenarios.find(s => s.id === response.scenario_id);
    if (!scenario) continue;

    const dimension = scenario.dimension.toLowerCase();
    const choice = response.choice === 'A' || response.choice === 1 as any ? 'A' : 'B';

    // Determine if choice indicates high or low
    const indicator = choice === 'A' ? scenario.a_indicates : scenario.b_indicates;
    const isHigh = indicator.startsWith('high_');

    // Delta: +12 for high choice, -12 for low choice
    const delta = isHigh ? 12 : -12;

    // Apply to appropriate profile
    if (COGNITIVE_DIMENSIONS.includes(dimension as any)) {
      const current = cognitive[dimension as keyof CognitiveProfile];
      cognitive[dimension as keyof CognitiveProfile] = {
        value: Math.max(0, Math.min(100, current.value + delta)),
        sigma: SIGMA_BY_TIER.CORE,
      };
    } else if (BEHAVIORAL_DIMENSIONS.includes(dimension as any)) {
      const current = behavioral[dimension as keyof BehavioralProfile];
      behavioral[dimension as keyof BehavioralProfile] = {
        value: Math.max(0, Math.min(100, current.value + delta)),
        sigma: SIGMA_BY_TIER.CORE,
      };
    }
  }

  return { cognitive, behavioral };
}

// ============================================================================
// CAPACITY PROXYING
// ============================================================================

/**
 * Proxy cognitive capacities from disposition scores.
 * Used when actual benchmark tests haven't been completed.
 */
export function proxyCapacities(cognitive: CognitiveProfile): CapacityProfile {
  const vrb = Math.round(
    cognitive.transfer.value * 0.4 +
    cognitive.calibration.value * 0.3 +
    cognitive.retrieval.value * 0.3
  );

  const qnt = Math.round(
    cognitive.precision.value * 0.5 +
    cognitive.calibration.value * 0.3 +
    cognitive.transfer.value * 0.2
  );

  const spd = Math.round(
    cognitive.calibration.value * 0.4 +
    cognitive.precision.value * 0.3 +
    cognitive.tolerance.value * 0.3
  );

  return {
    vrb: { value: vrb, sigma: 18, provenance: 'PROXIED' },
    qnt: { value: qnt, sigma: 18, provenance: 'PROXIED' },
    spd: { value: spd, sigma: 18, provenance: 'PROXIED' },
  };
}

// ============================================================================
// VIBE PROCESSING
// ============================================================================

export interface VibeResult {
  tags: string[];
  dispositionNudges: Record<string, number>;
}

/**
 * Process vibe card swipes to extract:
 * - Subject/style tags (for course matching)
 * - Disposition nudges (adjustments to profile scores)
 */
export function processVibeSwipes(
  swipes: VibeSwipe[],
  cards: VibeCard[]
): VibeResult {
  const tagCounts = new Map<string, number>();
  const nudges: Record<string, number> = {};

  for (const swipe of swipes) {
    if (swipe.direction === 'SKIP') continue;

    const card = cards.find(c => c.id === swipe.card_id);
    if (!card) continue;

    const tags = swipe.direction === 'RIGHT' ? card.right_tags : card.left_tags;
    for (const tag of tags) {
      tagCounts.set(tag, (tagCounts.get(tag) || 0) + 1);
    }

    if (card.disposition_nudge) {
      const dim = card.disposition_nudge.dimension.toLowerCase();
      const delta = swipe.direction === 'RIGHT'
        ? card.disposition_nudge.right_delta
        : card.disposition_nudge.left_delta;
      nudges[dim] = (nudges[dim] || 0) + delta;
    }
  }

  const sortedTags = Array.from(tagCounts.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, 8)
    .map(([tag]) => tag);

  // Clamp nudges to reasonable range
  for (const dim in nudges) {
    nudges[dim] = Math.max(-15, Math.min(15, nudges[dim]));
  }

  return { tags: sortedTags, dispositionNudges: nudges };
}

/**
 * Apply vibe nudges to cognitive profile.
 * Nudges come from vibe card swipes that have disposition_nudge defined.
 */
export function applyVibeNudges(
  cognitive: CognitiveProfile,
  nudges: Record<string, number>
): CognitiveProfile {
  const result = { ...cognitive };

  for (const dim of COGNITIVE_DIMENSIONS) {
    if (nudges[dim]) {
      const current = result[dim];
      result[dim] = {
        value: Math.max(0, Math.min(100, current.value + nudges[dim])),
        sigma: current.sigma,
      };
    }
  }

  return result;
}

// ============================================================================
// PROFILE ANALYSIS
// ============================================================================

/**
 * Find the dominant disposition (highest scoring).
 */
export function findDominant(
  cognitive: CognitiveProfile,
  behavioral: BehavioralProfile
): string {
  let maxDim = 'calibration';
  let maxValue = 0;

  for (const dim of COGNITIVE_DIMENSIONS) {
    if (cognitive[dim].value > maxValue) {
      maxValue = cognitive[dim].value;
      maxDim = dim;
    }
  }

  for (const dim of BEHAVIORAL_DIMENSIONS) {
    if (behavioral[dim].value > maxValue) {
      maxValue = behavioral[dim].value;
      maxDim = dim;
    }
  }

  return maxDim;
}

/**
 * Find the nemesis disposition (lowest scoring).
 */
export function findNemesis(
  cognitive: CognitiveProfile,
  behavioral: BehavioralProfile
): string {
  let minDim = 'calibration';
  let minValue = 100;

  for (const dim of COGNITIVE_DIMENSIONS) {
    if (cognitive[dim].value < minValue) {
      minValue = cognitive[dim].value;
      minDim = dim;
    }
  }

  for (const dim of BEHAVIORAL_DIMENSIONS) {
    if (behavioral[dim].value < minValue) {
      minValue = behavioral[dim].value;
      minDim = dim;
    }
  }

  return minDim;
}
