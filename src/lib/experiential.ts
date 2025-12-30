// ============================================================================
// EXPERIENTIAL TASKS - STATE MANAGEMENT & DATA FETCHING
// ============================================================================
//
// This file handles:
//   1. Loading tasks from Supabase
//   2. Managing experiential assessment state in localStorage
//   3. Saving responses to Supabase
//   4. Selecting which tasks to show (mandatory vs optional)
//
// PATTERN: Matches your existing assessment.ts approach
//
// USAGE IN COMPONENT:
//   import { getExperientialState, saveExperientialState, fetchTasks } from '@/lib/experiential';
//
// ============================================================================

import { supabase } from './supabase';
import { 
  ExperientialTask, 
  ExperientialResponse,
  ExperientialTaskType,
  ExperientialDifficultyTier 
} from './experiential-types';


// ============================================================================
// CONFIGURATION
// ============================================================================

/**
 * How many mandatory tasks to show in the main assessment flow.
 * These appear after behavioral questions but are still skippable.
 */
export const MANDATORY_TASK_COUNT = 3;

/**
 * Task types to prioritise for mandatory tasks.
 * We want variety - one analytical, one precision, one judgment.
 */
const MANDATORY_TASK_TYPE_MIX: ExperientialTaskType[] = [
  'ESTIMATION',      // Tests calibration
  'PROOFREAD',       // Tests precision
  'SCENARIO_JUDGE',  // Tests judgment
];

/**
 * Difficulty tiers allowed for mandatory tasks.
 * Keep them accessible - advanced/expert are optional only.
 */
const MANDATORY_DIFFICULTY_TIERS: ExperientialDifficultyTier[] = [
  'STANDARD',
  'STRETCH',
];


// ============================================================================
// STATE MANAGEMENT
// ============================================================================

/**
 * The shape of experiential assessment state stored in localStorage.
 * Tracks which tasks the user has seen and their responses.
 */
export interface ExperientialState {
  // Which mandatory tasks were selected for this session
  mandatoryTaskIds: string[];
  
  // Completed task responses (waiting to show results)
  completedResponses: ExperientialResponse[];
  
  // Current position in mandatory flow (0, 1, 2)
  currentMandatoryIndex: number;
  
  // Has user finished the mandatory portion?
  mandatoryComplete: boolean;
  
  // Has user skipped the entire experiential section?
  skipped: boolean;
  
  // Optional: IDs of extra tasks user has completed
  completedOptionalTaskIds: string[];
}

/**
 * Key for localStorage. Separate from main assessment state
 * so they don't interfere with each other.
 */
const STORAGE_KEY = 'examrizz_experiential';

/**
 * Returns the default state for a fresh session.
 * Called when no saved state exists.
 */
function getDefaultState(): ExperientialState {
  return {
    mandatoryTaskIds: [],
    completedResponses: [],
    currentMandatoryIndex: 0,
    mandatoryComplete: false,
    skipped: false,
    completedOptionalTaskIds: [],
  };
}

/**
 * Load experiential state from localStorage.
 * Returns default state if nothing saved or if running on server.
 * 
 * WHY CHECK typeof window?
 * Next.js runs code on both server and client. localStorage only exists
 * in browser (client). If we try to access it on server, it crashes.
 * The check ensures we only use localStorage when in browser.
 * 
 * @example
 * const state = getExperientialState();
 * console.log(state.currentMandatoryIndex); // 0, 1, or 2
 */
export function getExperientialState(): ExperientialState {
  // Server-side: return default (no localStorage available)
  if (typeof window === 'undefined') {
    return getDefaultState();
  }

  // Client-side: try to load from localStorage
  const stored = localStorage.getItem(STORAGE_KEY);
  
  if (stored) {
    try {
      // Parse the JSON string back into an object
      return JSON.parse(stored);
    } catch {
      // JSON was corrupted somehow - reset to default
      console.warn('Experiential state corrupted, resetting');
    }
  }

  // Nothing saved yet - return fresh state
  return getDefaultState();
}

/**
 * Save experiential state to localStorage.
 * Call this after any state change (completing a task, skipping, etc.)
 * 
 * @example
 * const state = getExperientialState();
 * state.currentMandatoryIndex += 1;
 * saveExperientialState(state);
 */
export function saveExperientialState(state: ExperientialState): void {
  if (typeof window !== 'undefined') {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
  }
}

/**
 * Clear all experiential state from localStorage.
 * Call this when starting a fresh assessment or on explicit reset.
 */
export function clearExperientialState(): void {
  if (typeof window !== 'undefined') {
    localStorage.removeItem(STORAGE_KEY);
  }
}


// ============================================================================
// DATA FETCHING
// ============================================================================

/**
 * Fetch all active tasks from the database.
 * Returns tasks sorted by difficulty (easier first).
 * 
 * @example
 * const tasks = await fetchAllTasks();
 * console.log(tasks.length); // e.g., 10
 */
export async function fetchAllTasks(): Promise<ExperientialTask[]> {
  const { data, error } = await supabase
    .from('bo_v1_experiential_tasks')
    .select('*')
    .eq('is_active', true)
    .order('difficulty_tier', { ascending: true });

  if (error) {
    console.error('Failed to fetch experiential tasks:', error);
    return [];
  }

  return data as ExperientialTask[];
}

/**
 * Fetch a single task by ID.
 * Used when loading a specific task for display.
 * 
 * @example
 * const task = await fetchTaskById('proofread_legal_001');
 */
export async function fetchTaskById(taskId: string): Promise<ExperientialTask | null> {
  const { data, error } = await supabase
    .from('bo_v1_experiential_tasks')
    .select('*')
    .eq('id', taskId)
    .single();

  if (error) {
    console.error('Failed to fetch task:', error);
    return null;
  }

  return data as ExperientialTask;
}

/**
 * Fetch multiple tasks by their IDs.
 * Preserves the order of the input IDs.
 * 
 * @example
 * const tasks = await fetchTasksByIds(['task_1', 'task_2', 'task_3']);
 */
export async function fetchTasksByIds(taskIds: string[]): Promise<ExperientialTask[]> {
  if (taskIds.length === 0) return [];

  const { data, error } = await supabase
    .from('bo_v1_experiential_tasks')
    .select('*')
    .in('id', taskIds);

  if (error) {
    console.error('Failed to fetch tasks:', error);
    return [];
  }

  // Supabase doesn't guarantee order matches input, so we reorder
  const taskMap = new Map(data.map(t => [t.id, t]));
  return taskIds
    .map(id => taskMap.get(id))
    .filter((t): t is ExperientialTask => t !== undefined);
}


// ============================================================================
// TASK SELECTION
// ============================================================================

/**
 * Select which tasks to use for mandatory portion of assessment.
 * 
 * LOGIC:
 * 1. Filter to only FOUNDATION/INTERMEDIATE difficulty
 * 2. Try to get one task of each type in MANDATORY_TASK_TYPE_MIX
 * 3. If not enough variety, fill with random tasks
 * 4. Shuffle final selection so order varies
 * 
 * WHY THIS APPROACH?
 * - Variety: Don't show 3 proofreading tasks
 * - Accessibility: Don't show EXPERT tasks to everyone
 * - Randomisation: Different users get different tasks
 * 
 * @param allTasks - All available tasks from database
 * @returns Array of exactly MANDATORY_TASK_COUNT task IDs
 */
export function selectMandatoryTasks(allTasks: ExperientialTask[]): string[] {
  // Step 1: Filter to appropriate difficulty
  const eligibleTasks = allTasks.filter(task => 
    MANDATORY_DIFFICULTY_TIERS.includes(task.difficulty_tier as ExperientialDifficultyTier)
  );

  if (eligibleTasks.length === 0) {
    console.warn('No eligible tasks for mandatory selection');
    return [];
  }

  const selectedIds: string[] = [];
  const usedTypes = new Set<ExperientialTaskType>();

  // Step 2: Try to get one of each preferred type
  for (const targetType of MANDATORY_TASK_TYPE_MIX) {
    if (selectedIds.length >= MANDATORY_TASK_COUNT) break;

    // Find tasks of this type that we haven't selected yet
    const candidates = eligibleTasks.filter(t => 
      t.task_type === targetType && !selectedIds.includes(t.id)
    );

    if (candidates.length > 0) {
      // Pick a random one from candidates
      const randomIndex = Math.floor(Math.random() * candidates.length);
      selectedIds.push(candidates[randomIndex].id);
      usedTypes.add(targetType);
    }
  }

  // Step 3: If we still need more, fill with any remaining tasks
  while (selectedIds.length < MANDATORY_TASK_COUNT) {
    const remaining = eligibleTasks.filter(t => !selectedIds.includes(t.id));
    if (remaining.length === 0) break;

    const randomIndex = Math.floor(Math.random() * remaining.length);
    selectedIds.push(remaining[randomIndex].id);
  }

  // Step 4: Shuffle the final selection
  return shuffleArray(selectedIds);
}

/**
 * Fisher-Yates shuffle - randomly reorders an array.
 * Creates a copy so original array isn't modified.
 */
function shuffleArray<T>(array: T[]): T[] {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

/**
 * Get tasks available for optional exploration.
 * Excludes tasks already completed in this session.
 * 
 * @param allTasks - All available tasks
 * @param completedIds - IDs of tasks already done
 */
export function getOptionalTasks(
  allTasks: ExperientialTask[],
  completedIds: string[]
): ExperientialTask[] {
  return allTasks.filter(task => !completedIds.includes(task.id));
}


// ============================================================================
// RESPONSE SAVING
// ============================================================================

/**
 * Save a task response to Supabase.
 * 
 * This saves the raw response data. The database has a trigger that
 * automatically calculates:
 *   - calibration_signal (based on confidence vs accuracy)
 *   - career_affinity_signal (based on score vs satisfaction)
 * 
 * @param sessionId - Current assessment session ID
 * @param taskId - ID of the task being answered
 * @param response - The user's answer (structure varies by task type)
 * @param score - Calculated score (from scoring functions)
 * @param scoreBreakdown - Detailed scoring info
 * @param timeTakenMs - How long user spent on task
 * @param timedOut - Whether timer expired before submission
 * @param confidence - User's self-reported confidence (1-5)
 * @param satisfaction - User's enjoyment rating (1-5)
 * @param perceivedDifficulty - User's difficulty rating (1-5)
 * 
 * @returns The created response record, or null on error
 * 
 * @example
 * const result = await saveExperientialResponse(
 *   sessionId,
 *   'proofread_legal_001',
 *   { marked_positions: [45, 123, 256] },
 *   85,
 *   { correct: 3, missed: 1, false_positives: 0 },
 *   45000,
 *   false,
 *   4,  // confident
 *   3,  // neutral satisfaction
 *   4   // found it hard
 * );
 */
export async function saveExperientialResponse(
  sessionId: string,
  taskId: string,
  response: Record<string, any>,
  score: number,
  scoreBreakdown: Record<string, any>,
  timeTakenMs: number,
  timedOut: boolean,
  confidence: number | null,
  satisfaction: number | null,
  perceivedDifficulty: number | null
): Promise<ExperientialResponse | null> {
  const { data, error } = await supabase
    .from('bo_v1_experiential_responses')
    .insert({
      session_id: sessionId,
      task_id: taskId,
      response,
      score,
      score_breakdown: scoreBreakdown,
      time_taken_ms: timeTakenMs,
      timed_out: timedOut,
      confidence,
      satisfaction,
      perceived_difficulty: perceivedDifficulty,
    })
    .select()
    .single();

  if (error) {
    console.error('Failed to save experiential response:', error);
    return null;
  }

  return data as ExperientialResponse;
}

/**
 * Fetch all responses for a session.
 * Used on results page to show experiential task performance.
 */
export async function fetchSessionResponses(sessionId: string): Promise<ExperientialResponse[]> {
  const { data, error } = await supabase
    .from('bo_v1_experiential_responses')
    .select('*')
    .eq('session_id', sessionId);

  if (error) {
    console.error('Failed to fetch responses:', error);
    return [];
  }

  return data as ExperientialResponse[];
}


// ============================================================================
// SESSION UPDATES
// ============================================================================

/**
 * Mark the experiential section as complete in the session record.
 * Call this when user finishes all mandatory tasks (or skips).
 */
export async function markExperientialComplete(
  sessionId: string,
  tasksCompleted: number,
  tasksSkipped: number
): Promise<void> {
  const { error } = await supabase
    .from('bo_v1_sessions')
    .update({
      experiential_completed: true,
      experiential_tasks_completed: tasksCompleted,
      experiential_tasks_skipped: tasksSkipped,
    })
    .eq('id', sessionId);

  if (error) {
    console.error('Failed to mark experiential complete:', error);
  }
}


// ============================================================================
// INITIALISATION HELPER
// ============================================================================

/**
 * Initialise experiential state for a new session.
 * 
 * Call this when starting the experiential section.
 * It fetches tasks, selects mandatory ones, and saves the state.
 * 
 * @param sessionId - Current session ID (to validate we have a session)
 * @returns The initialised state, or null if no tasks available
 * 
 * @example
 * // In your experiential page useEffect:
 * const state = getExperientialState();
 * if (state.mandatoryTaskIds.length === 0) {
 *   const newState = await initialiseExperientialState();
 *   // Now load first task...
 * }
 */
export async function initialiseExperientialState(): Promise<ExperientialState | null> {
  // Fetch all tasks
  const allTasks = await fetchAllTasks();
  
  if (allTasks.length === 0) {
    console.warn('No experiential tasks available');
    return null;
  }

  // Select mandatory tasks
  const mandatoryIds = selectMandatoryTasks(allTasks);
  
  if (mandatoryIds.length === 0) {
    console.warn('Could not select mandatory tasks');
    return null;
  }

  // Create new state
  const newState: ExperientialState = {
    mandatoryTaskIds: mandatoryIds,
    completedResponses: [],
    currentMandatoryIndex: 0,
    mandatoryComplete: false,
    skipped: false,
    completedOptionalTaskIds: [],
  };

  // Save and return
  saveExperientialState(newState);
  return newState;
}
