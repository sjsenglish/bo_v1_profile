// ExamRizz Arena v9 - Assessment State Management (Overhauled Jan 4, 2025)

import { VibeChoice, ScenarioResponse, MiniSampleResponse, VibeSwipe } from './types';

// ============================================================================
// ASSESSMENT STATE
// ============================================================================

export type AssessmentStage =
  | 'landing'
  | 'vibe'         // Paired comparisons (2 mins)
  | 'scenarios'    // Forced-choice slider (5 mins)
  | 'mini-samples' // 6 experiential tasks (9 mins)
  | 'processing'   // Score calculation (30 secs)
  | 'complete';

export interface AssessmentState {
  sessionId: string | null;
  stage: AssessmentStage;
  startedAt: number | null;

  // Vibe (new paired comparison format)
  vibeChoices: VibeChoice[];

  // Scenarios (20 slider responses)
  scenarioResponses: ScenarioResponse[];

  // Mini-samples (6 task responses)
  miniSampleResponses: MiniSampleResponse[];

  // Legacy support
  vibeSwipes: VibeSwipe[];
}

const STORAGE_KEY = 'examrizz_assessment_v9';

// ============================================================================
// STATE MANAGEMENT
// ============================================================================

export function getInitialState(): AssessmentState {
  if (typeof window === 'undefined') {
    return createEmptyState();
  }

  const stored = localStorage.getItem(STORAGE_KEY);
  if (stored) {
    try {
      const parsed = JSON.parse(stored);
      // Migrate old state if needed
      return migrateState(parsed);
    } catch {
      // Invalid stored data, reset
    }
  }

  return createEmptyState();
}

function createEmptyState(): AssessmentState {
  return {
    sessionId: null,
    stage: 'landing',
    startedAt: null,
    vibeChoices: [],
    scenarioResponses: [],
    miniSampleResponses: [],
    vibeSwipes: [], // Legacy
  };
}

/**
 * Migrate older state formats to v9 format.
 */
function migrateState(state: Partial<AssessmentState>): AssessmentState {
  const empty = createEmptyState();

  return {
    sessionId: state.sessionId ?? null,
    stage: state.stage ?? 'landing',
    startedAt: state.startedAt ?? null,
    vibeChoices: state.vibeChoices ?? [],
    scenarioResponses: state.scenarioResponses ?? [],
    miniSampleResponses: state.miniSampleResponses ?? [],
    vibeSwipes: state.vibeSwipes ?? [], // Keep legacy data if present
  };
}

export function saveState(state: AssessmentState): void {
  if (typeof window !== 'undefined') {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
  }
}

export function clearState(): void {
  if (typeof window !== 'undefined') {
    localStorage.removeItem(STORAGE_KEY);
    // Also clear old storage key
    localStorage.removeItem('examrizz_assessment');
  }
}

// ============================================================================
// STAGE NAVIGATION
// ============================================================================

export function getNextStage(currentStage: AssessmentStage): AssessmentStage {
  switch (currentStage) {
    case 'landing':
      return 'vibe';
    case 'vibe':
      return 'scenarios';
    case 'scenarios':
      return 'mini-samples';
    case 'mini-samples':
      return 'processing';
    case 'processing':
      return 'complete';
    default:
      return 'complete';
  }
}

export function getStageUrl(stage: AssessmentStage): string {
  switch (stage) {
    case 'landing':
      return '/';
    case 'vibe':
      return '/assessment/vibe';
    case 'scenarios':
      return '/assessment/scenarios';
    case 'mini-samples':
      return '/assessment/mini-samples';
    case 'processing':
      return '/assessment/processing';
    case 'complete':
      return '/results';
    default:
      return '/';
  }
}

// ============================================================================
// STAGE COMPLETION CHECKS
// ============================================================================

export function isVibeComplete(state: AssessmentState): boolean {
  // Need 6 vibe choices (one per pair)
  return state.vibeChoices.length >= 6;
}

export function isScenariosComplete(state: AssessmentState): boolean {
  // Need 20 scenario responses (or minimum 10 for partial)
  return state.scenarioResponses.length >= 20;
}

export function isScenariosPartialComplete(state: AssessmentState): boolean {
  // Minimum 10 scenarios for partial completion
  return state.scenarioResponses.length >= 10;
}

export function isMiniSamplesComplete(state: AssessmentState): boolean {
  // Need 6 mini-sample responses
  return state.miniSampleResponses.length >= 6;
}

export function isMiniSamplesPartialComplete(state: AssessmentState): boolean {
  // Minimum 3 mini-samples for partial completion
  return state.miniSampleResponses.length >= 3;
}

export function canGenerateResults(state: AssessmentState): boolean {
  // Need at least partial data from all stages
  return (
    state.vibeChoices.length >= 3 &&
    state.scenarioResponses.length >= 10 &&
    state.miniSampleResponses.length >= 3
  );
}

// ============================================================================
// PROGRESS CALCULATION
// ============================================================================

export function calculateOverallProgress(state: AssessmentState): number {
  const vibeProgress = Math.min(100, (state.vibeChoices.length / 6) * 100);
  const scenarioProgress = Math.min(100, (state.scenarioResponses.length / 20) * 100);
  const miniSampleProgress = Math.min(100, (state.miniSampleResponses.length / 6) * 100);

  // Weighted average (vibe is quick, scenarios and mini-samples are main content)
  return Math.round(vibeProgress * 0.15 + scenarioProgress * 0.35 + miniSampleProgress * 0.5);
}

export function calculateStageProgress(state: AssessmentState, stage: AssessmentStage): number {
  switch (stage) {
    case 'vibe':
      return Math.min(100, (state.vibeChoices.length / 6) * 100);
    case 'scenarios':
      return Math.min(100, (state.scenarioResponses.length / 20) * 100);
    case 'mini-samples':
      return Math.min(100, (state.miniSampleResponses.length / 6) * 100);
    case 'processing':
    case 'complete':
      return 100;
    default:
      return 0;
  }
}

// ============================================================================
// ESTIMATED TIME
// ============================================================================

export function getEstimatedTimeRemaining(state: AssessmentState): number {
  // Time in minutes
  const vibeRemaining = state.vibeChoices.length < 6 ? 2 : 0;
  const scenarioRemaining = Math.ceil((20 - state.scenarioResponses.length) * 0.25); // ~15 sec per item
  const miniSampleRemaining = Math.ceil((6 - state.miniSampleResponses.length) * 1.5); // ~90 sec per task

  return vibeRemaining + scenarioRemaining + miniSampleRemaining;
}

// ============================================================================
// RESPONSE MANAGEMENT
// ============================================================================

export function addVibeChoice(state: AssessmentState, choice: VibeChoice): AssessmentState {
  // Prevent duplicate choices for same pair
  const filtered = state.vibeChoices.filter((c) => c.pair_id !== choice.pair_id);
  return {
    ...state,
    vibeChoices: [...filtered, choice],
  };
}

export function addScenarioResponse(
  state: AssessmentState,
  response: ScenarioResponse
): AssessmentState {
  // Prevent duplicate responses for same scenario
  const filtered = state.scenarioResponses.filter((r) => r.scenario_id !== response.scenario_id);
  return {
    ...state,
    scenarioResponses: [...filtered, response],
  };
}

export function addMiniSampleResponse(
  state: AssessmentState,
  response: MiniSampleResponse
): AssessmentState {
  // Prevent duplicate responses for same task
  const filtered = state.miniSampleResponses.filter((r) => r.task_id !== response.task_id);
  return {
    ...state,
    miniSampleResponses: [...filtered, response],
  };
}
