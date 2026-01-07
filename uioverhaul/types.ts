
export enum AppStage {
  LANDING = 'LANDING',
  ASSESSMENT_VIBE = 'ASSESSMENT_VIBE',
  ASSESSMENT_SCENARIO = 'ASSESSMENT_SCENARIO',
  ASSESSMENT_TASKS = 'ASSESSMENT_TASKS',
  PROCESSING = 'PROCESSING',
  DASHBOARD = 'DASHBOARD',
  MATCHES = 'MATCHES'
}

export interface CourseChallenge {
  skill: string;
  required: number;
  user: number;
  description: string;
}

export interface UniversityCourse {
  id: string;
  university: string;
  course: string;
  matchScore: number;
  tags: string[];
  isRussellGroup: boolean;
  employmentRate: number;
  // Analysis Fields
  matchReasons: string[];
  challenges: CourseChallenge[];
  details: {
    duration: string;
    entry: string;
    assessment: string;
    satisfaction: string;
    avgSalary: string;
  };
}

export interface CareerPath {
  id: string;
  title: string;
  matchScore: number;
  description: string;
  salary: string;
  growth: 'High' | 'Stable' | 'Declining';
  tags: string[];
}

export interface UserProfile {
  name: string;
  precision: number;
  tier: 'Foundation' | 'Standard' | 'Elite';
  familiarUnlocked: boolean;
  familiarName?: string;
  clusterStats: {
    stem: number;
    humanities: number;
    analytical: number;
  };
}

export interface Scenario {
  id: number;
  question: string;
  optionA: string;
  optionB: string;
}

export interface VibeOption {
  id: string; // 'A' or 'B'
  label: string;
  description: string;
  imageUrl: string;
}

export interface VibePair {
  id: number;
  dimension: string;
  question: string;
  options: [VibeOption, VibeOption];
}

export type TaskType = 'MCQ' | 'SHORT_RESPONSE';

export interface Task {
  id: number;
  metaCluster: string;
  type: TaskType;
  title: string; // e.g., "STEM-Scientific"
  timeLimit: number; // seconds
  stimulus: string | string[]; // Text content or code block
  question: string;
  options?: string[]; // For MCQ
}
