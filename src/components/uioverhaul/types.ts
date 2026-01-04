
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
    id: string; // Added id
    name: string;
    precision: number;
    tier: 'Foundation' | 'Standard' | 'Elite';
    familiarUnlocked: boolean;
    familiarName?: string;
    clusterStats: {
        stem: number;
        humanities: number;
        analytical: number;
        business?: number;
        creative?: number;
    };
}


export interface ScenarioOption {
    id: string;
    label: string;
    indicates?: string;
}

export interface Scenario {
    id: string;
    dimension: string;
    question: string;
    optionA: ScenarioOption;
    optionB: ScenarioOption;
}

export interface VibeOption {
    id: string;
    label: string;
    image?: string; // Made optional
    description?: string;
    indicates?: string; // Added for new tracking
}

export interface VibePair {
    id: string | number; // Support both for now to avoid breakage, but data is strings
    dimension: string; // Added dimension
    question: string;
    optionA: VibeOption;
    optionB: VibeOption;
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
    correctAnswerIndex?: number; // Added for scoring
    gradingCriteria?: Record<string, string>; // Added for AI grading (score -> criteria)
}
