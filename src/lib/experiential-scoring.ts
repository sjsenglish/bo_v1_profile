// ============================================================================
// EXPERIENTIAL TASKS - SCORING LOGIC
// ============================================================================
//
// Each task type has its own scoring algorithm. This file contains:
//   1. Individual scoring functions for each task type
//   2. A dispatcher that routes to the correct function
//   3. Helper functions for common calculations
//
// HOW SCORING WORKS:
// - User completes a task (their response is captured)
// - We call scoreTask(task, response) 
// - The function looks at task.task_type to pick the right scorer
// - Returns score, max_score, percentage, and detailed breakdown
//
// ============================================================================

import {
  ExperientialTask,
  ExperientialScoreResult,
  ExperientialTaskType,
  // Response types for each task
  ProofreadResponse,
  ProofreadStimulus,
  EstimationResponse,
  EstimationStimulus,
  CategorisationResponse,
  CategorisationStimulus,
  PrioritisationResponse,
  PrioritisationStimulus,
  PatternResponse,
  PatternStimulus,
  DataInterpretResponse,
  DataInterpretStimulus,
  ScenarioJudgeResponse,
  ScenarioJudgeStimulus,
} from './experiential-types';


// ============================================================================
// MAIN DISPATCHER
// ============================================================================

/**
 * Score a task response.
 * 
 * This is the main function you call. It routes to the correct
 * scoring function based on task_type.
 * 
 * @param task - The task definition (from database)
 * @param response - The user's response (what they submitted)
 * @returns Score result with points, percentage, and breakdown
 * 
 * @example
 * const result = scoreTask(task, userResponse);
 * console.log(result.percentage); // 85
 * console.log(result.breakdown.correct); // 3
 */
export function scoreTask(
  task: ExperientialTask,
  response: Record<string, any>
): ExperientialScoreResult {
  // Route to correct scoring function based on task type
  switch (task.task_type) {
    case 'PROOFREAD':
      return scoreProofread(task, response as ProofreadResponse);
    
    case 'ESTIMATION':
      return scoreEstimation(task, response as EstimationResponse);
    
    case 'CATEGORISATION':
      return scoreCategorisation(task, response as CategorisationResponse);
    
    case 'PRIORITISATION':
      return scorePrioritisation(task, response as PrioritisationResponse);
    
    case 'PATTERN':
      return scorePattern(task, response as PatternResponse);
    
    case 'DATA_INTERPRET':
      return scoreDataInterpret(task, response as DataInterpretResponse);
    
    case 'SCENARIO_JUDGE':
      return scoreScenarioJudge(task, response as ScenarioJudgeResponse);
    
    default:
      console.error(`Unknown task type: ${task.task_type}`);
      return {
        score: 0,
        max_score: task.max_score,
        percentage: 0,
        breakdown: { error: 'Unknown task type' },
      };
  }
}


// ============================================================================
// PROOFREAD SCORING
// ============================================================================

/**
 * Score a proofreading task.
 * 
 * SCORING LOGIC:
 * - +points for each correctly identified error
 * - -penalty for each false positive (clicking non-error)
 * - Missed errors don't add penalty but reduce score
 * 
 * EXAMPLE:
 * - Text has 4 errors
 * - User clicks 3 correct positions + 1 wrong position
 * - Score: 3 correct - 0.5 penalty = 2.5 (scaled to percentage)
 * 
 * @param task - Task with ProofreadStimulus
 * @param response - User's marked positions
 */
function scoreProofread(
  task: ExperientialTask,
  response: ProofreadResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as ProofreadStimulus;
  const errors = stimulus.errors;
  const marked = response.marked_positions || [];
  
  // Count correct identifications
  let correct = 0;
  let falsePositives = 0;
  const foundErrors = new Set<number>();
  
  // For each position the user marked...
  for (const markedPos of marked) {
    let isCorrect = false;
    
    // Check if it matches any actual error
    for (let i = 0; i < errors.length; i++) {
      const error = errors[i];
      // Allow some tolerance - clicking within the error span counts
      if (markedPos >= error.position && markedPos < error.position + error.length) {
        if (!foundErrors.has(i)) {
          correct++;
          foundErrors.add(i);
          isCorrect = true;
        }
        break;
      }
    }
    
    if (!isCorrect) {
      falsePositives++;
    }
  }
  
  const missed = errors.length - correct;
  
  // Scoring formula:
  // - Each correct = points_per_error
  // - Each false positive = -0.5 * points_per_error (penalise guessing)
  // - Score can't go below 0
  const pointsPerError = task.max_score / errors.length;
  const rawScore = (correct * pointsPerError) - (falsePositives * pointsPerError * 0.5);
  const score = Math.max(0, Math.round(rawScore));
  
  return {
    score,
    max_score: task.max_score,
    percentage: Math.round((score / task.max_score) * 100),
    breakdown: {
      total_errors: errors.length,
      correct,
      missed,
      false_positives: falsePositives,
    },
    feedback: generateProofreadFeedback(correct, missed, falsePositives, errors.length),
  };
}

function generateProofreadFeedback(
  correct: number, 
  missed: number, 
  falsePositives: number,
  total: number
): string {
  if (correct === total && falsePositives === 0) {
    return 'Perfect! You found all errors without any false positives.';
  }
  if (correct === total) {
    return `You found all ${total} errors, but marked ${falsePositives} non-errors.`;
  }
  if (falsePositives === 0) {
    return `You found ${correct} of ${total} errors with no false positives.`;
  }
  return `You found ${correct} of ${total} errors and marked ${falsePositives} non-errors.`;
}


// ============================================================================
// ESTIMATION SCORING
// ============================================================================

/**
 * Score an estimation task.
 * 
 * SCORING LOGIC:
 * - Uses "proximity bands" - closer to actual value = more points
 * - Perfect band: within X% = full marks
 * - Good band: within Y% = partial marks
 * - Acceptable band: within Z% = minimal marks
 * - Outside all bands = 0
 * 
 * WHY BANDS NOT LINEAR?
 * If actual value is 1000, guessing 990 vs 1000 shouldn't matter much.
 * But guessing 500 vs 1000 is a big miss. Bands capture this better.
 * 
 * @param task - Task with EstimationStimulus
 * @param response - User's numerical estimate
 */
function scoreEstimation(
  task: ExperientialTask,
  response: EstimationResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as EstimationStimulus;
  const actual = stimulus.actual_value;
  const estimate = response.estimate;
  const ranges = stimulus.acceptable_range;
  
  // Calculate percentage deviation from actual
  // Using absolute percentage error
  const percentError = Math.abs((estimate - actual) / actual) * 100;
  
  let score: number;
  let band: string;
  
  if (percentError <= ranges.perfect) {
    // Within perfect range - full marks
    score = task.max_score;
    band = 'perfect';
  } else if (percentError <= ranges.good) {
    // Within good range - scale between 70-99% of max
    const rangeSize = ranges.good - ranges.perfect;
    const positionInRange = (percentError - ranges.perfect) / rangeSize;
    score = Math.round(task.max_score * (0.99 - (positionInRange * 0.29)));
    band = 'good';
  } else if (percentError <= ranges.acceptable) {
    // Within acceptable range - scale between 30-69% of max
    const rangeSize = ranges.acceptable - ranges.good;
    const positionInRange = (percentError - ranges.good) / rangeSize;
    score = Math.round(task.max_score * (0.69 - (positionInRange * 0.39)));
    band = 'acceptable';
  } else {
    // Outside all bands
    score = 0;
    band = 'outside';
  }
  
  return {
    score,
    max_score: task.max_score,
    percentage: Math.round((score / task.max_score) * 100),
    breakdown: {
      estimate,
      actual_value: actual,
      percent_error: Math.round(percentError * 10) / 10,
      band,
    },
    feedback: generateEstimationFeedback(estimate, actual, band, stimulus.unit),
  };
}

function generateEstimationFeedback(
  estimate: number,
  actual: number,
  band: string,
  unit: string
): string {
  const formatted = (n: number) => n.toLocaleString();
  
  if (band === 'perfect') {
    return `Excellent! Your estimate of ${formatted(estimate)} ${unit} was very close to the actual ${formatted(actual)} ${unit}.`;
  }
  if (band === 'good') {
    return `Good estimate! The actual value was ${formatted(actual)} ${unit}.`;
  }
  if (band === 'acceptable') {
    return `Reasonable attempt. The actual value was ${formatted(actual)} ${unit}.`;
  }
  return `The actual value was ${formatted(actual)} ${unit}. Estimation is a skill that improves with practice!`;
}


// ============================================================================
// CATEGORISATION SCORING
// ============================================================================

/**
 * Score a categorisation task.
 * 
 * SCORING LOGIC:
 * - Each item placed in correct category = 1 point (scaled)
 * - Simple percentage: correct / total
 * 
 * @param task - Task with CategorisationStimulus
 * @param response - User's category placements
 */
function scoreCategorisation(
  task: ExperientialTask,
  response: CategorisationResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as CategorisationStimulus;
  const items = stimulus.items;
  const placements = response.placements || [];
  
  // Build lookup for correct answers
  const correctCategories = new Map(
    items.map(item => [item.id, item.correct_category])
  );
  
  // Build lookup for user's placements
  const userPlacements = new Map(
    placements.map(p => [p.item_id, p.category_id])
  );
  
  // Count correct
  let correct = 0;
  const details: { item: string; placed: string; correct: string; isCorrect: boolean }[] = [];
  
  for (const item of items) {
    const userCategory = userPlacements.get(item.id);
    const correctCategory = correctCategories.get(item.id);
    const isCorrect = userCategory === correctCategory;
    
    if (isCorrect) correct++;
    
    details.push({
      item: item.label,
      placed: userCategory || '(not placed)',
      correct: correctCategory || '',
      isCorrect,
    });
  }
  
  const score = Math.round((correct / items.length) * task.max_score);
  
  return {
    score,
    max_score: task.max_score,
    percentage: Math.round((correct / items.length) * 100),
    breakdown: {
      total_items: items.length,
      correct,
      incorrect: items.length - correct,
      details,
    },
    feedback: `You correctly categorised ${correct} of ${items.length} items.`,
  };
}


// ============================================================================
// PRIORITISATION SCORING
// ============================================================================

/**
 * Score a prioritisation task.
 * 
 * SCORING LOGIC:
 * Uses Spearman's rank correlation coefficient.
 * - Compares user's ranking to correct ranking
 * - +1.0 = perfect match
 * - 0.0 = no correlation
 * - -1.0 = completely reversed
 * 
 * We then scale this to 0-100.
 * 
 * WHY SPEARMAN?
 * It measures how well the relative ordering matches, not exact positions.
 * If the correct order is [A, B, C, D] and user says [A, C, B, D],
 * they got A and D right but swapped B and C. Spearman captures this nuance.
 * 
 * @param task - Task with PrioritisationStimulus
 * @param response - User's ranking (array of item IDs in their order)
 */
function scorePrioritisation(
  task: ExperientialTask,
  response: PrioritisationResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as PrioritisationStimulus;
  const items = stimulus.items;
  const userRanking = response.ranking || [];
  
  // Build correct ranking lookup
  const correctRanks = new Map(
    items.map(item => [item.id, item.correct_rank])
  );
  
  // Convert user ranking to ranks (1 = first position)
  const userRanks = new Map(
    userRanking.map((id, index) => [id, index + 1])
  );
  
  // Calculate Spearman correlation
  // Formula: 1 - (6 * sum(d^2)) / (n * (n^2 - 1))
  // where d is the difference between ranks for each item
  
  let sumSquaredDiff = 0;
  const n = items.length;
  
  for (const item of items) {
    const correctRank = correctRanks.get(item.id) || 0;
    const userRank = userRanks.get(item.id) || n; // If not ranked, assume last
    const diff = correctRank - userRank;
    sumSquaredDiff += diff * diff;
  }
  
  // Spearman coefficient
  const spearman = 1 - (6 * sumSquaredDiff) / (n * (n * n - 1));
  
  // Scale from [-1, 1] to [0, 100]
  // -1 -> 0, 0 -> 50, 1 -> 100
  const scaledScore = ((spearman + 1) / 2) * task.max_score;
  const score = Math.round(scaledScore);
  
  return {
    score,
    max_score: task.max_score,
    percentage: Math.round((score / task.max_score) * 100),
    breakdown: {
      spearman_coefficient: Math.round(spearman * 100) / 100,
      user_ranking: userRanking,
      correct_ranking: items
        .sort((a, b) => a.correct_rank - b.correct_rank)
        .map(i => i.id),
    },
    feedback: generatePrioritisationFeedback(spearman),
  };
}

function generatePrioritisationFeedback(spearman: number): string {
  if (spearman >= 0.9) return 'Excellent prioritisation! Your ranking closely matches the ideal.';
  if (spearman >= 0.7) return 'Good prioritisation. Most items were ranked correctly.';
  if (spearman >= 0.4) return 'Reasonable attempt. Some key items were out of order.';
  if (spearman >= 0) return 'Your ranking differed significantly from the ideal.';
  return 'Your ranking was nearly opposite to the ideal order.';
}


// ============================================================================
// PATTERN SCORING
// ============================================================================

/**
 * Score a pattern recognition task.
 * 
 * SCORING LOGIC:
 * - Binary: correct answer = full marks, wrong = 0
 * - No partial credit for patterns (you either see it or you don't)
 * 
 * @param task - Task with PatternStimulus
 * @param response - User's selected answer
 */
function scorePattern(
  task: ExperientialTask,
  response: PatternResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as PatternStimulus;
  const correct = stimulus.correct_answer;
  const userAnswer = response.selected_answer;
  
  const isCorrect = userAnswer === correct || 
    String(userAnswer) === String(correct); // Handle type mismatches
  
  const score = isCorrect ? task.max_score : 0;
  
  return {
    score,
    max_score: task.max_score,
    percentage: isCorrect ? 100 : 0,
    breakdown: {
      user_answer: userAnswer,
      correct_answer: correct,
      is_correct: isCorrect,
      pattern_type: stimulus.pattern_type,
    },
    feedback: isCorrect 
      ? 'Correct! You identified the pattern.'
      : `The correct answer was ${correct}.`,
  };
}


// ============================================================================
// DATA INTERPRETATION SCORING
// ============================================================================

/**
 * Score a data interpretation task.
 * 
 * SCORING LOGIC:
 * - Multiple questions about the same data
 * - Each question scored individually
 * - Total = sum of correct answers
 * 
 * @param task - Task with DataInterpretStimulus
 * @param response - User's answers to each question
 */
function scoreDataInterpret(
  task: ExperientialTask,
  response: DataInterpretResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as DataInterpretStimulus;
  const questions = stimulus.questions;
  const userAnswers = response.answers || [];
  
  // Build lookup for user answers
  const answerMap = new Map(
    userAnswers.map(a => [a.question_id, a.answer])
  );
  
  let correct = 0;
  const details: { question: string; correct: boolean }[] = [];
  
  for (const q of questions) {
    const userAnswer = answerMap.get(q.id);
    // Flexible comparison - handle string/number type differences
    const isCorrect = String(userAnswer).toLowerCase().trim() === 
      String(q.correct_answer).toLowerCase().trim();
    
    if (isCorrect) correct++;
    
    details.push({
      question: q.question,
      correct: isCorrect,
    });
  }
  
  const score = Math.round((correct / questions.length) * task.max_score);
  
  return {
    score,
    max_score: task.max_score,
    percentage: Math.round((correct / questions.length) * 100),
    breakdown: {
      total_questions: questions.length,
      correct,
      incorrect: questions.length - correct,
      details,
    },
    feedback: `You answered ${correct} of ${questions.length} questions correctly.`,
  };
}


// ============================================================================
// SCENARIO JUDGEMENT SCORING
// ============================================================================

/**
 * Score a scenario judgement task.
 * 
 * SCORING LOGIC:
 * - Each option has a quality score (0-100 in the stimulus)
 * - User selects one or more options
 * - Score = average quality of selected options
 * - Scaled to max_score
 * 
 * WHY AVERAGE?
 * In real scenarios, choosing multiple good options is better than
 * choosing one perfect option plus one terrible option.
 * Averaging penalises poor additional choices.
 * 
 * @param task - Task with ScenarioJudgeStimulus
 * @param response - User's selected option(s)
 */
function scoreScenarioJudge(
  task: ExperientialTask,
  response: ScenarioJudgeResponse
): ExperientialScoreResult {
  const stimulus = task.stimulus as ScenarioJudgeStimulus;
  const options = stimulus.options;
  const selected = response.selected_options || [];
  
  if (selected.length === 0) {
    return {
      score: 0,
      max_score: task.max_score,
      percentage: 0,
      breakdown: { error: 'No option selected' },
      feedback: 'Please select at least one option.',
    };
  }
  
  // Build lookup for option scores
  const optionScores = new Map(
    options.map(o => [o.id, o.score])
  );
  
  // Calculate average quality of selected options
  let totalQuality = 0;
  const selectedDetails: { option: string; quality: number }[] = [];
  
  for (const optionId of selected) {
    const quality = optionScores.get(optionId) || 0;
    totalQuality += quality;
    
    const option = options.find(o => o.id === optionId);
    selectedDetails.push({
      option: option?.text || optionId,
      quality,
    });
  }
  
  const averageQuality = totalQuality / selected.length;
  const score = Math.round((averageQuality / 100) * task.max_score);
  
  // Find best option for feedback
  const bestOption = options.reduce((best, current) => 
    current.score > best.score ? current : best
  );
  
  return {
    score,
    max_score: task.max_score,
    percentage: Math.round(averageQuality),
    breakdown: {
      selected_count: selected.length,
      average_quality: Math.round(averageQuality),
      selected_details: selectedDetails,
      best_option: bestOption.text,
      best_option_score: bestOption.score,
    },
    feedback: generateScenarioFeedback(averageQuality, bestOption),
  };
}

function generateScenarioFeedback(
  averageQuality: number,
  bestOption: { text: string; score: number; feedback?: string }
): string {
  if (averageQuality >= 90) {
    return 'Excellent judgement! Your choice(s) reflected strong professional reasoning.';
  }
  if (averageQuality >= 70) {
    return 'Good decision-making. ' + (bestOption.feedback || '');
  }
  if (averageQuality >= 50) {
    return 'Reasonable approach, though better options were available. ' + (bestOption.feedback || '');
  }
  return `Consider: ${bestOption.text}. ` + (bestOption.feedback || '');
}


// ============================================================================
// UTILITY: GET SCORING SUMMARY FOR RESULTS PAGE
// ============================================================================

/**
 * Generate a summary of experiential task performance.
 * Used on results page to show overall experiential stats.
 * 
 * @param responses - All experiential responses from the session
 * @param tasks - The tasks that were attempted
 */
export function getExperientialSummary(
  responses: { score: number | null; task_id: string; satisfaction: number | null; calibration_signal: number | null }[],
  tasks: ExperientialTask[]
): {
  totalTasks: number;
  completedTasks: number;
  averageScore: number;
  averageSatisfaction: number;
  averageCalibration: number;
  strongAreas: string[];
  growthAreas: string[];
} {
  const taskMap = new Map(tasks.map(t => [t.id, t]));
  
  const completed = responses.filter(r => r.score !== null);
  
  if (completed.length === 0) {
    return {
      totalTasks: tasks.length,
      completedTasks: 0,
      averageScore: 0,
      averageSatisfaction: 0,
      averageCalibration: 0,
      strongAreas: [],
      growthAreas: [],
    };
  }
  
  // Calculate averages
  const avgScore = completed.reduce((sum, r) => {
    const task = taskMap.get(r.task_id);
    const percentage = task ? ((r.score || 0) / task.max_score) * 100 : 0;
    return sum + percentage;
  }, 0) / completed.length;
  
  const withSatisfaction = completed.filter(r => r.satisfaction !== null);
  const avgSatisfaction = withSatisfaction.length > 0
    ? withSatisfaction.reduce((sum, r) => sum + (r.satisfaction || 0), 0) / withSatisfaction.length
    : 0;
  
  const withCalibration = completed.filter(r => r.calibration_signal !== null);
  const avgCalibration = withCalibration.length > 0
    ? withCalibration.reduce((sum, r) => sum + (r.calibration_signal || 0), 0) / withCalibration.length
    : 0;
  
  // Identify strong/growth areas by task type
  const byType = new Map<string, { scores: number[]; satisfactions: number[] }>();
  
  for (const r of completed) {
    const task = taskMap.get(r.task_id);
    if (!task) continue;
    
    if (!byType.has(task.task_type)) {
      byType.set(task.task_type, { scores: [], satisfactions: [] });
    }
    
    const entry = byType.get(task.task_type)!;
    const percentage = ((r.score || 0) / task.max_score) * 100;
    entry.scores.push(percentage);
    if (r.satisfaction) entry.satisfactions.push(r.satisfaction);
  }
  
  const strongAreas: string[] = [];
  const growthAreas: string[] = [];
  
  for (const [type, data] of byType) {
    const avgTypeScore = data.scores.reduce((a, b) => a + b, 0) / data.scores.length;
    if (avgTypeScore >= 75) strongAreas.push(type);
    if (avgTypeScore < 50) growthAreas.push(type);
  }
  
  return {
    totalTasks: tasks.length,
    completedTasks: completed.length,
    averageScore: Math.round(avgScore),
    averageSatisfaction: Math.round(avgSatisfaction * 10) / 10,
    averageCalibration: Math.round(avgCalibration * 100) / 100,
    strongAreas,
    growthAreas,
  };
}
