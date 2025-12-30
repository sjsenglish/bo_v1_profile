import {
  Course,
  MatchResult,
  CognitiveProfile,
  BehavioralProfile,
  CapacityProfile,
  Friction,
  COGNITIVE_DIMENSIONS,
  BEHAVIORAL_DIMENSIONS,
  IMPORTANCE_WEIGHTS,
  Importance,
  QUALITY_THRESHOLDS,
  QUALITY_BONUSES,
} from './types';

/**
 * Get effective disposition demand for a course, adjusting base CAH values
 * using per-course HESA data (assessment mix, continuation rate, etc.)
 */
function getEffectiveDemand(course: Course, dimension: string): number {
  const baseDemand = course[`demand_${dimension}`] as number;
  let adjustment = 0;

  switch (dimension) {
    case 'retrieval':
      // Higher exam % → higher retrieval demand
      if (course.assessment_exam_pct != null) {
        // Baseline assumption: 50% exam = neutral
        // Each 10% above adds +3 to retrieval demand
        adjustment += ((course.assessment_exam_pct - 50) / 10) * 3;
      }
      break;

    case 'precision':
      // Higher practical % → higher precision demand
      if (course.assessment_practical_pct != null) {
        // Each 10% practical adds +2 to precision demand
        adjustment += (course.assessment_practical_pct / 10) * 2;
      }
      break;

    case 'tolerance':
      // Low continuation rate → higher tolerance demand (course is harder)
      if (course.continuation_rate != null) {
        // Below 85% continuation = needs more tolerance
        if (course.continuation_rate < QUALITY_THRESHOLDS.CONTINUATION_LOW) {
          const deficit = QUALITY_THRESHOLDS.CONTINUATION_LOW - course.continuation_rate;
          adjustment += deficit * 0.5;  // +5 for 10% below threshold
        }
      }
      break;

    case 'structure':
      // Higher scheduled hours → higher structure demand
      if (course.scheduled_hours != null) {
        // Baseline: 15 hours/week = neutral
        // Each 5 hours above adds +3 to structure demand
        adjustment += ((course.scheduled_hours - 15) / 5) * 3;
      }
      break;

    case 'receptivity':
      // High NSS feedback score → course values receptivity
      if (course.nss_feedback != null) {
        // Above 75 feedback → slight boost to receptivity demand
        if (course.nss_feedback > 75) {
          adjustment += (course.nss_feedback - 75) * 0.3;
        }
      }
      break;

    case 'social':
      // High coursework % often indicates group work
      if (course.assessment_coursework_pct != null) {
        // Each 10% coursework above 30% adds +2 to social demand
        if (course.assessment_coursework_pct > 30) {
          adjustment += ((course.assessment_coursework_pct - 30) / 10) * 2;
        }
      }
      break;
  }

  // Clamp to valid range
  return Math.max(0, Math.min(100, baseDemand + adjustment));
}

/**
 * Calculate quality bonus based on institutional and outcome data
 */
function calculateQualityBonus(course: Course): number {
  let bonus = 0;

  // Russell Group bonus
  if (course.russell_group) {
    bonus += QUALITY_BONUSES.RUSSELL_GROUP;
  }

  // High NSS satisfaction bonus
  if (course.nss_overall != null && course.nss_overall >= QUALITY_THRESHOLDS.NSS_HIGH) {
    bonus += QUALITY_BONUSES.NSS_HIGH;
  }

  // High employment rate bonus
  if (course.employment_rate != null && course.employment_rate >= QUALITY_THRESHOLDS.EMPLOYMENT_HIGH) {
    bonus += QUALITY_BONUSES.EMPLOYMENT_HIGH;
  }

  // High salary bonus
  if (course.median_salary_3yr != null && course.median_salary_3yr >= QUALITY_THRESHOLDS.SALARY_HIGH) {
    bonus += QUALITY_BONUSES.SALARY_HIGH;
  }

  return bonus;
}

function calculateCognitiveFit(
  cognitive: CognitiveProfile,
  course: Course
): { score: number } {
  let totalPenalty = 0;
  let totalWeight = 0;

  for (const dim of COGNITIVE_DIMENSIONS) {
    const studentValue = cognitive[dim].value;
    // Use effective demand (base + per-course adjustment)
    const courseTarget = getEffectiveDemand(course, dim);
    const importanceKey = `importance_${dim}` as keyof Course;
    const importance = (course[importanceKey] as Importance) || 'IMPORTANT';
    const weight = IMPORTANCE_WEIGHTS[importance];
    const tolerance = 20;

    const gap = Math.abs(studentValue - courseTarget);
    const ratio = gap / tolerance;
    const penalty = 100 * Math.pow(ratio, 2) / (1 + Math.pow(ratio, 2));

    totalPenalty += penalty * weight;
    totalWeight += weight;
  }

  const avgPenalty = totalPenalty / totalWeight;
  return { score: Math.max(0, 100 - avgPenalty) };
}

function calculateBehavioralFit(
  behavioral: BehavioralProfile,
  course: Course
): { penalty: number } {
  let totalPenalty = 0;

  for (const dim of BEHAVIORAL_DIMENSIONS) {
    const studentValue = behavioral[dim].value;
    // Use effective demand for behavioral dimensions too
    const courseTarget = getEffectiveDemand(course, dim);
    const tolerance = 25;
    const weight = IMPORTANCE_WEIGHTS.BENEFICIAL;

    const gap = Math.abs(studentValue - courseTarget);
    const ratio = gap / tolerance;
    const penalty = 40 * Math.pow(ratio, 2) / (1 + Math.pow(ratio, 2));

    totalPenalty += penalty * weight;
  }

  return { penalty: totalPenalty };
}

function calculateVibeBonus(
  vibeTags: string[],
  course: Course
): { bonus: number } {
  const studentTags = new Set(vibeTags);
  let bonus = 0;

  for (const tag of course.subject_tags || []) {
    if (studentTags.has(tag)) {
      bonus += 5;
    }
  }

  return { bonus: Math.min(bonus, 15) };
}

function determineFriction(score: number): Friction {
  if (score >= 80) return 'LOW';
  if (score >= 65) return 'MODERATE';
  if (score >= 50) return 'HIGH';
  if (score >= 35) return 'VERY_HIGH';
  return 'EXTREME';
}

/**
 * Apply diversity constraint: max N courses per university
 * Iterates through sorted results, skipping universities that already have max courses
 */
function applyDiversityConstraint(
  sortedResults: MatchResult[],
  limit: number,
  maxPerUniversity: number = 3
): MatchResult[] {
  const universityCount = new Map<string, number>();
  const diverseResults: MatchResult[] = [];

  for (const result of sortedResults) {
    if (diverseResults.length >= limit) break;

    const university = result.course.university;
    const currentCount = universityCount.get(university) || 0;

    if (currentCount < maxPerUniversity) {
      diverseResults.push(result);
      universityCount.set(university, currentCount + 1);
    }
    // Skip this course if university already has max courses
  }

  return diverseResults;
}

export function matchCourse(
  cognitive: CognitiveProfile,
  behavioral: BehavioralProfile,
  capacities: CapacityProfile,
  vibeTags: string[],
  course: Course
): MatchResult {
  const cognitiveFit = calculateCognitiveFit(cognitive, course);
  const behavioralFit = calculateBehavioralFit(behavioral, course);
  const vibeBonus = calculateVibeBonus(vibeTags, course);
  const qualityBonus = calculateQualityBonus(course);

  // Base score from cognitive fit minus behavioral friction
  let score = cognitiveFit.score - behavioralFit.penalty;
  
  // Add bonuses
  score += vibeBonus.bonus;
  score += qualityBonus;
  
  // Clamp to valid range
  score = Math.max(0, Math.min(100, score));

  return {
    course,
    score: Math.round(score),
    friction: determineFriction(score),
    cognitive_score: Math.round(cognitiveFit.score),
    behavioral_penalty: Math.round(behavioralFit.penalty),
    vibe_bonus: vibeBonus.bonus,
    quality_bonus: qualityBonus,
    rank: 0,
  };
}

export function rankCourses(
  cognitive: CognitiveProfile,
  behavioral: BehavioralProfile,
  capacities: CapacityProfile,
  vibeTags: string[],
  courses: Course[],
  limit: number = 20,
  maxPerUniversity: number = 3
): MatchResult[] {
  const results = courses.map(course =>
    matchCourse(cognitive, behavioral, capacities, vibeTags, course)
  );

  // Sort by score descending
  results.sort((a, b) => b.score - a.score);

  // Apply diversity constraint
  const diverseResults = applyDiversityConstraint(results, limit, maxPerUniversity);

  // Assign ranks
  return diverseResults.map((result, index) => ({
    ...result,
    rank: index + 1,
  }));
}

export async function rankCoursesAsync(
  cognitive: CognitiveProfile,
  behavioral: BehavioralProfile,
  capacities: CapacityProfile,
  vibeTags: string[],
  courses: Course[],
  limit: number = 20,
  maxPerUniversity: number = 3,
  batchSize: number = 1000
): Promise<MatchResult[]> {
  const allResults: MatchResult[] = [];

  for (let i = 0; i < courses.length; i += batchSize) {
    const batch = courses.slice(i, i + batchSize);
    const batchResults = batch.map(course =>
      matchCourse(cognitive, behavioral, capacities, vibeTags, course)
    );
    allResults.push(...batchResults);

    if (i + batchSize < courses.length) {
      await new Promise(resolve => setTimeout(resolve, 0));
    }
  }

  // Sort by score descending
  allResults.sort((a, b) => b.score - a.score);

  // Apply diversity constraint
  const diverseResults = applyDiversityConstraint(allResults, limit, maxPerUniversity);

  // Assign ranks
  return diverseResults.map((result, index) => ({
    ...result,
    rank: index + 1,
  }));
}
