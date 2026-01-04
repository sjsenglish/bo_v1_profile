import { VibeSwipe } from './types';

export interface AssessmentState {
  sessionId: string | null;
  stage: 'landing' | 'vibe' | 'scenarios' | 'mini-samples' | 'processing' | 'complete';
  vibeSwipes: VibeSwipe[];
  startedAt: number | null;
}

const STORAGE_KEY = 'examrizz_assessment';

export function getInitialState(): AssessmentState {
  if (typeof window === 'undefined') {
    return {
      sessionId: null,
      stage: 'landing',
      vibeSwipes: [],
      startedAt: null,
    };
  }

  const stored = localStorage.getItem(STORAGE_KEY);
  if (stored) {
    try {
      return JSON.parse(stored);
    } catch {
      // Invalid stored data, reset
    }
  }

  return {
    sessionId: null,
    stage: 'landing',
    vibeSwipes: [],
    startedAt: null,
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
  }
}
