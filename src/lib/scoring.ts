import {
  Question,
  DiagnosticResponse,
  DispositionScore,
  CognitiveProfile,
  BehavioralProfile,
  CapacityProfile,
  VibeCard,
  VibeSwipe,
  COGNITIVE_DIMENSIONS,
  BEHAVIORAL_DIMENSIONS,
  SIGMA_BY_TIER,
  CognitiveDimension,
} from './types';

function groupByDimension(
  responses: DiagnosticResponse[],
  questions: Question[]
): Map<string, { value: number; weight: number; reverse: boolean }[]> {
  const grouped = new Map<string, { value: number; weight: number; reverse: boolean }[]>();

  for (const response of responses) {
    if (response.skipped) continue;

    const question = questions.find(q => q.id === response.question_id);
    if (!question) continue;

    const dim = question.dimension.toLowerCase();
    if (!grouped.has(dim)) {
      grouped.set(dim, []);
    }

    grouped.get(dim)!.push({
      value: response.value,
      weight: question.weight,
      reverse: question.reverse_scored,
    });
  }

  return grouped;
}

function calculateDimensionScore(
  responses: { value: number; weight: number; reverse: boolean }[]
): DispositionScore {
  if (responses.length === 0) {
    return { value: 50, sigma: SIGMA_BY_TIER.NONE };
  }

  let weightedSum = 0;
  let totalWeight = 0;

  for (const r of responses) {
    let score = (r.value - 1) * 25;
    if (r.reverse) {
      score = 100 - score;
    }
    weightedSum += score * r.weight;
    totalWeight += r.weight;
  }

  const value = Math.round(weightedSum / totalWeight);

  let sigma: number;
  if (responses.length >= 4) {
    sigma = SIGMA_BY_TIER.CORE;
  } else if (responses.length >= 2) {
    sigma = 18;
  } else {
    sigma = 22;
  }

  return { value, sigma };
}

export function scoreCognitive(
  responses: DiagnosticResponse[],
  questions: Question[]
): CognitiveProfile {
  const grouped = groupByDimension(responses, questions);

  const profile: CognitiveProfile = {
    calibration: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    tolerance: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    transfer: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    precision: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    retrieval: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    receptivity: { value: 50, sigma: SIGMA_BY_TIER.NONE },
  };

  for (const dim of COGNITIVE_DIMENSIONS) {
    const dimData = grouped.get(dim);
    if (dimData) {
      profile[dim] = calculateDimensionScore(dimData);
    }
  }

  return profile;
}

export function scoreBehavioral(
  responses: DiagnosticResponse[],
  questions: Question[]
): BehavioralProfile {
  const grouped = groupByDimension(responses, questions);

  const profile: BehavioralProfile = {
    structure: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    consistency: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    social: { value: 50, sigma: SIGMA_BY_TIER.NONE },
    depth: { value: 50, sigma: SIGMA_BY_TIER.NONE },
  };

  for (const dim of BEHAVIORAL_DIMENSIONS) {
    const dimData = grouped.get(dim);
    if (dimData) {
      profile[dim] = calculateDimensionScore(dimData);
    }
  }

  return profile;
}

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

export interface VibeResult {
  tags: string[];
  dispositionNudges: Record<string, number>;
}

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

  for (const dim in nudges) {
    nudges[dim] = Math.max(-15, Math.min(15, nudges[dim]));
  }

  return { tags: sortedTags, dispositionNudges: nudges };
}

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