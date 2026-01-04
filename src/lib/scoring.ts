// ExamRizz Arena v9 - Scoring Logic (Overhauled Jan 4, 2025)

import {
  Disposition,
  ALL_DISPOSITIONS,
  DispositionScore,
  DispositionProfile,
  CapacityProfile,
  ScenarioResponse,
  Scenario,
  MiniSampleResponse,
  EnjoymentProfile,
  EnjoymentRating,
  MetaCluster,
  ALL_META_CLUSTERS,
  Pathway,
  SIGMA_BY_TIER,
  PATHWAY_BONUS,
} from './types';

// ============================================================================
// SCENARIO SCORING (20 forced-choice items with slider 0-100)
// ============================================================================

/**
 * Score scenarios based on slider positions (0-100).
 * Each scenario contributes to one disposition dimension.
 *
 * Scoring bands:
 * - Strong A (0-15): +40 to A-direction
 * - Moderate A (16-35): +25 to A-direction
 * - Lean A (36-50): +10 to A-direction
 * - Lean B (51-65): +10 to B-direction
 * - Moderate B (66-85): +25 to B-direction
 * - Strong B (86-100): +40 to B-direction
 *
 * With 2 items per dimension, scores range from ~20-80.
 */
export function scoreScenarios(
  responses: ScenarioResponse[],
  scenarios: Scenario[]
): DispositionProfile {
  // Initialize all dimensions at 50 (neutral)
  const profile: DispositionProfile = {
    social: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    receptivity: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    transfer: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    structure: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    depth: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    tolerance: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    precision: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    calibration: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    retrieval: { value: 50, sigma: SIGMA_BY_TIER.CORE },
    consistency: { value: 50, sigma: SIGMA_BY_TIER.CORE },
  };

  // Track item count per dimension for averaging
  const itemCounts: Record<Disposition, number> = {
    social: 0,
    receptivity: 0,
    transfer: 0,
    structure: 0,
    depth: 0,
    tolerance: 0,
    precision: 0,
    calibration: 0,
    retrieval: 0,
    consistency: 0,
  };

  // Process each response
  for (const response of responses) {
    const scenario = scenarios.find((s) => s.id === response.scenario_id);
    if (!scenario) continue;

    const dimension = scenario.dimension as Disposition;
    if (!ALL_DISPOSITIONS.includes(dimension)) continue;

    // Calculate delta based on slider position
    const position = response.position;
    let delta = 0;

    if (position <= 15) {
      // Strong A
      delta = scenario.a_indicates === 'high' ? 20 : -20;
    } else if (position <= 35) {
      // Moderate A
      delta = scenario.a_indicates === 'high' ? 12.5 : -12.5;
    } else if (position <= 50) {
      // Lean A
      delta = scenario.a_indicates === 'high' ? 5 : -5;
    } else if (position <= 65) {
      // Lean B
      delta = scenario.b_indicates === 'high' ? 5 : -5;
    } else if (position <= 85) {
      // Moderate B
      delta = scenario.b_indicates === 'high' ? 12.5 : -12.5;
    } else {
      // Strong B
      delta = scenario.b_indicates === 'high' ? 20 : -20;
    }

    // Apply delta
    profile[dimension] = {
      value: Math.max(0, Math.min(100, profile[dimension].value + delta)),
      sigma: profile[dimension].sigma,
    };
    itemCounts[dimension]++;
  }

  // Reduce sigma for dimensions with more items
  for (const dim of ALL_DISPOSITIONS) {
    if (itemCounts[dim] >= 2) {
      profile[dim].sigma = SIGMA_BY_TIER.EXTENDED;
    } else if (itemCounts[dim] === 1) {
      profile[dim].sigma = SIGMA_BY_TIER.CORE;
    }
  }

  return profile;
}

/**
 * Score scenarios from binary A/B choices (fallback for non-slider UI).
 * Each A/B choice contributes ±12 to the dimension.
 */
export function scoreScenariosFromBinary(
  responses: { scenario_id: string; choice: 'A' | 'B' }[],
  scenarios: Scenario[]
): DispositionProfile {
  // Convert binary choices to slider positions
  const sliderResponses: ScenarioResponse[] = responses.map((r) => ({
    scenario_id: r.scenario_id,
    position: r.choice === 'A' ? 25 : 75, // Moderate A or Moderate B
  }));

  return scoreScenarios(sliderResponses, scenarios);
}

// ============================================================================
// CAPACITY PROXYING
// ============================================================================

/**
 * Proxy cognitive capacities from disposition scores.
 * Used when actual benchmark tests haven't been completed.
 */
export function proxyCapacities(profile: DispositionProfile): CapacityProfile {
  const vrb = Math.round(
    profile.transfer.value * 0.4 +
      profile.calibration.value * 0.3 +
      profile.retrieval.value * 0.3
  );

  const qnt = Math.round(
    profile.precision.value * 0.5 +
      profile.calibration.value * 0.3 +
      profile.transfer.value * 0.2
  );

  const spd = Math.round(
    profile.calibration.value * 0.4 +
      profile.precision.value * 0.3 +
      profile.tolerance.value * 0.3
  );

  return {
    vrb: { value: vrb, sigma: 18, provenance: 'PROXIED' },
    qnt: { value: qnt, sigma: 18, provenance: 'PROXIED' },
    spd: { value: spd, sigma: 18, provenance: 'PROXIED' },
  };
}

// ============================================================================
// MINI-SAMPLE SCORING & ENJOYMENT
// ============================================================================

/**
 * Build enjoyment profile from mini-sample responses.
 * Uses the enjoyment_rating from each task.
 */
export function buildEnjoymentProfile(
  responses: MiniSampleResponse[]
): EnjoymentProfile {
  const profile: EnjoymentProfile = {
    STEM_TECH: 0,
    STEM_SCI: 0,
    HUMANITIES: 0,
    SOCIAL_SCI: 0,
    PROFESSIONAL: 0,
    CREATIVE: 0,
  };

  for (const response of responses) {
    // Map task_id to meta_cluster (assuming task_id contains cluster info)
    const cluster = inferClusterFromTaskId(response.task_id);
    if (cluster && ALL_META_CLUSTERS.includes(cluster)) {
      profile[cluster] = response.enjoyment_rating;
    }
  }

  return profile;
}

/**
 * Infer meta-cluster from task ID.
 * Task IDs should follow pattern like 'STEM_TECH_01', 'HUMANITIES_01', etc.
 */
function inferClusterFromTaskId(taskId: string): MetaCluster | null {
  const upper = taskId.toUpperCase();
  if (upper.includes('STEM_TECH') || upper.includes('CODE') || upper.includes('DEBUG')) {
    return 'STEM_TECH';
  }
  if (upper.includes('STEM_SCI') || upper.includes('OBSERVATION') || upper.includes('SCIENCE')) {
    return 'STEM_SCI';
  }
  if (upper.includes('HUMANITIES') || upper.includes('ARGUMENT') || upper.includes('HISTORY')) {
    return 'HUMANITIES';
  }
  if (upper.includes('SOCIAL_SCI') || upper.includes('ASSUMPTION') || upper.includes('POLICY')) {
    return 'SOCIAL_SCI';
  }
  if (upper.includes('PROFESSIONAL') || upper.includes('COMPETING') || upper.includes('DOCTOR')) {
    return 'PROFESSIONAL';
  }
  if (upper.includes('CREATIVE') || upper.includes('DESIGN') || upper.includes('POSTER')) {
    return 'CREATIVE';
  }
  return null;
}

/**
 * Calculate enjoyment score for a course based on cluster alignment.
 * Max enjoyment score: 60 points.
 */
export function calculateEnjoymentScore(
  enjoymentProfile: EnjoymentProfile,
  courseClusterTags: string[]
): number {
  let score = 0;
  const tags = new Set(courseClusterTags.map((t) => t.toUpperCase()));

  // Check each cluster's enjoyment rating against course tags
  if (enjoymentProfile.STEM_TECH === 1 && (tags.has('STEM') || tags.has('COMPUTING') || tags.has('ENGINEERING'))) {
    score += 10;
  } else if (enjoymentProfile.STEM_TECH === -1 && (tags.has('STEM') || tags.has('COMPUTING'))) {
    score -= 10;
  }

  if (enjoymentProfile.STEM_SCI === 1 && (tags.has('SCIENCE') || tags.has('BIOLOGY') || tags.has('CHEMISTRY') || tags.has('PHYSICS'))) {
    score += 10;
  } else if (enjoymentProfile.STEM_SCI === -1 && (tags.has('SCIENCE') || tags.has('BIOLOGY'))) {
    score -= 10;
  }

  if (enjoymentProfile.HUMANITIES === 1 && (tags.has('HUMANITIES') || tags.has('HISTORY') || tags.has('ENGLISH') || tags.has('PHILOSOPHY'))) {
    score += 10;
  } else if (enjoymentProfile.HUMANITIES === -1 && tags.has('HUMANITIES')) {
    score -= 10;
  }

  if (enjoymentProfile.SOCIAL_SCI === 1 && (tags.has('PSYCHOLOGY') || tags.has('ECONOMICS') || tags.has('SOCIOLOGY') || tags.has('POLITICS'))) {
    score += 10;
  } else if (enjoymentProfile.SOCIAL_SCI === -1 && tags.has('PSYCHOLOGY')) {
    score -= 10;
  }

  if (enjoymentProfile.PROFESSIONAL === 1 && (tags.has('LAW') || tags.has('BUSINESS') || tags.has('MEDICINE') || tags.has('EDUCATION'))) {
    score += 10;
  } else if (enjoymentProfile.PROFESSIONAL === -1 && (tags.has('LAW') || tags.has('BUSINESS'))) {
    score -= 10;
  }

  if (enjoymentProfile.CREATIVE === 1 && (tags.has('ART') || tags.has('DESIGN') || tags.has('ARCHITECTURE') || tags.has('MEDIA'))) {
    score += 10;
  } else if (enjoymentProfile.CREATIVE === -1 && (tags.has('ART') || tags.has('DESIGN'))) {
    score -= 10;
  }

  // Normalize to 0-60 range
  return Math.max(0, Math.min(60, score + 30));
}

// ============================================================================
// PATHWAY INFERENCE
// ============================================================================

/**
 * Detect career pathway from enjoyment profile.
 * Pathway is detected when ≥2 of the required clusters were loved (rating = 1)
 * and none were hated (rating = -1).
 */
export function detectPathway(enjoymentProfile: EnjoymentProfile): Pathway {
  const loved = new Set<MetaCluster>();
  const hated = new Set<MetaCluster>();

  for (const [cluster, rating] of Object.entries(enjoymentProfile)) {
    if (rating === 1) loved.add(cluster as MetaCluster);
    if (rating === -1) hated.add(cluster as MetaCluster);
  }

  // Healthcare: STEM_SCI + SOCIAL_SCI + PROFESSIONAL
  if (
    loved.has('STEM_SCI') &&
    loved.has('SOCIAL_SCI') &&
    loved.has('PROFESSIONAL') &&
    !hated.has('STEM_SCI') &&
    !hated.has('SOCIAL_SCI') &&
    !hated.has('PROFESSIONAL')
  ) {
    return 'Healthcare';
  }

  // Pure STEM: STEM_TECH + STEM_SCI
  if (
    loved.has('STEM_TECH') &&
    loved.has('STEM_SCI') &&
    !hated.has('STEM_TECH') &&
    !hated.has('STEM_SCI')
  ) {
    return 'Pure STEM';
  }

  // Quantitative Social Science: STEM_TECH + SOCIAL_SCI
  if (
    loved.has('STEM_TECH') &&
    loved.has('SOCIAL_SCI') &&
    !hated.has('STEM_TECH') &&
    !hated.has('SOCIAL_SCI')
  ) {
    return 'Quantitative Social Science';
  }

  // Design & Architecture: STEM_TECH + CREATIVE
  if (
    loved.has('STEM_TECH') &&
    loved.has('CREATIVE') &&
    !hated.has('STEM_TECH') &&
    !hated.has('CREATIVE')
  ) {
    return 'Design & Architecture';
  }

  // Arts & Humanities: HUMANITIES + SOCIAL_SCI + CREATIVE
  if (
    loved.has('HUMANITIES') &&
    (loved.has('SOCIAL_SCI') || loved.has('CREATIVE')) &&
    !hated.has('HUMANITIES')
  ) {
    return 'Arts & Humanities';
  }

  // Law & Professional: SOCIAL_SCI + PROFESSIONAL + HUMANITIES
  if (
    loved.has('SOCIAL_SCI') &&
    loved.has('PROFESSIONAL') &&
    (loved.has('HUMANITIES') || !hated.has('HUMANITIES'))
  ) {
    return 'Law & Professional';
  }

  return null;
}

/**
 * Check if course matches detected pathway.
 * Returns PATHWAY_BONUS (15) if match, 0 otherwise.
 */
export function calculatePathwayBonus(
  pathway: Pathway,
  courseCahCode: string | undefined
): number {
  if (!pathway || !courseCahCode) return 0;

  const cah = courseCahCode.toUpperCase();

  switch (pathway) {
    case 'Healthcare':
      // CAH01 = Medicine/Dentistry/Nursing
      if (cah.startsWith('CAH01')) return PATHWAY_BONUS;
      break;
    case 'Pure STEM':
      // CAH07 = Sciences, CAH09 = Engineering, CAH10 = Maths/Computing
      if (cah.startsWith('CAH07') || cah.startsWith('CAH09') || cah.startsWith('CAH10')) {
        return PATHWAY_BONUS;
      }
      break;
    case 'Quantitative Social Science':
      // CAH17 = Economics, CAH04 = Psychology
      if (cah.startsWith('CAH17') || cah.startsWith('CAH04')) return PATHWAY_BONUS;
      break;
    case 'Design & Architecture':
      // CAH13 = Architecture
      if (cah.startsWith('CAH13')) return PATHWAY_BONUS;
      break;
    case 'Arts & Humanities':
      // CAH14 = Languages, CAH20 = History, CAH21 = Arts
      if (cah.startsWith('CAH14') || cah.startsWith('CAH20') || cah.startsWith('CAH21')) {
        return PATHWAY_BONUS;
      }
      break;
    case 'Law & Professional':
      // CAH16 = Law
      if (cah.startsWith('CAH16')) return PATHWAY_BONUS;
      break;
  }

  return 0;
}

// ============================================================================
// DISPOSITION FRICTION
// ============================================================================

/**
 * Calculate disposition friction for a course.
 * Friction comes from gaps between student disposition and course demand.
 *
 * - FLOOR dimensions (calibration, tolerance, precision, retrieval):
 *   Student must meet or exceed course demand. Shortfall = friction.
 * - FIT dimensions (transfer, receptivity, structure, social, depth, consistency):
 *   Misalignment in either direction creates friction.
 */
export function calculateDispositionFriction(
  studentProfile: DispositionProfile,
  courseDemands: Record<string, number>
): number {
  let friction = 0;

  // FLOOR dimensions - student should meet or exceed demand
  const floorDims: Disposition[] = ['calibration', 'tolerance', 'precision', 'retrieval'];
  for (const dim of floorDims) {
    const studentValue = studentProfile[dim].value;
    const demand = courseDemands[`demand_${dim}`] || 50;
    const gap = demand - studentValue;
    if (gap > 0) {
      friction += gap * 0.3; // 30% of gap becomes friction
    }
  }

  // FIT dimensions - misalignment creates friction
  const fitDims: Disposition[] = ['transfer', 'receptivity', 'structure', 'social', 'depth', 'consistency'];
  for (const dim of fitDims) {
    const studentValue = studentProfile[dim].value;
    const demand = courseDemands[`demand_${dim}`] || 50;
    const gap = Math.abs(demand - studentValue);
    if (gap > 40) {
      // Only penalize large misalignments
      friction += (gap - 40) * 0.1;
    }
  }

  return friction;
}

// ============================================================================
// PROFILE ANALYSIS
// ============================================================================

/**
 * Find the dominant disposition (highest scoring).
 */
export function findDominant(profile: DispositionProfile): Disposition {
  let maxDim: Disposition = 'calibration';
  let maxValue = 0;

  for (const dim of ALL_DISPOSITIONS) {
    if (profile[dim].value > maxValue) {
      maxValue = profile[dim].value;
      maxDim = dim;
    }
  }

  return maxDim;
}

/**
 * Find the nemesis disposition (lowest scoring).
 */
export function findNemesis(profile: DispositionProfile): Disposition {
  let minDim: Disposition = 'calibration';
  let minValue = 100;

  for (const dim of ALL_DISPOSITIONS) {
    if (profile[dim].value < minValue) {
      minValue = profile[dim].value;
      minDim = dim;
    }
  }

  return minDim;
}

/**
 * Get disposition value by name.
 */
export function getDispositionValue(
  profile: DispositionProfile,
  dimension: Disposition
): number {
  return profile[dimension]?.value ?? 50;
}

/**
 * Calculate overall profile confidence.
 * Lower average sigma = higher confidence.
 */
export function calculateProfileConfidence(profile: DispositionProfile): number {
  let totalSigma = 0;
  for (const dim of ALL_DISPOSITIONS) {
    totalSigma += profile[dim].sigma;
  }
  const avgSigma = totalSigma / ALL_DISPOSITIONS.length;

  // Convert sigma to confidence percentage (lower sigma = higher confidence)
  // sigma=25 (no data) → ~20% confidence
  // sigma=15 (core) → ~40% confidence
  // sigma=10 (extended) → ~60% confidence
  // sigma=6 (deep) → ~76% confidence
  // sigma=3 (expert) → ~88% confidence
  return Math.max(0, Math.min(100, 100 - avgSigma * 3.2));
}
