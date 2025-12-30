import { Question } from './types';

export const QUESTIONS: Question[] = [
  // CALIBRATION
  { id: 'CAL_01', dimension: 'calibration', tier: 'CORE', text: 'Before getting my test back, I usually know roughly how well I did', reverse_scored: false, weight: 1.2, active: true },
  { id: 'CAL_02', dimension: 'calibration', tier: 'CORE', text: "I'm often surprised by my test results – good or bad", reverse_scored: true, weight: 1.0, active: true },
  { id: 'CAL_03', dimension: 'calibration', tier: 'CORE', text: 'When a topic feels familiar, I assume I understand it well', reverse_scored: true, weight: 1.3, active: true },
  { id: 'CAL_04', dimension: 'calibration', tier: 'CORE', text: 'I can usually tell which questions I got wrong before seeing the mark', reverse_scored: false, weight: 1.0, active: true },

  // TOLERANCE
  { id: 'TOL_01', dimension: 'tolerance', tier: 'CORE', text: "When I'm stuck on a problem for 10+ minutes, I feel energised rather than frustrated", reverse_scored: false, weight: 1.2, active: true },
  { id: 'TOL_02', dimension: 'tolerance', tier: 'CORE', text: 'After a bad grade, I bounce back within hours rather than days', reverse_scored: false, weight: 1.0, active: true },
  { id: 'TOL_03', dimension: 'tolerance', tier: 'CORE', text: "I'd rather skip a difficult question and come back to it than struggle through", reverse_scored: true, weight: 1.1, active: true },
  { id: 'TOL_04', dimension: 'tolerance', tier: 'CORE', text: "When I encounter a problem I've never seen before, my first instinct is curiosity rather than anxiety", reverse_scored: false, weight: 1.2, active: true },

  // TRANSFER
  { id: 'TRF_01', dimension: 'transfer', tier: 'CORE', text: 'I often notice unexpected connections between different subjects', reverse_scored: false, weight: 1.2, active: true },
  { id: 'TRF_02', dimension: 'transfer', tier: 'CORE', text: 'Each new topic feels like starting from scratch', reverse_scored: true, weight: 1.0, active: true },
  { id: 'TRF_03', dimension: 'transfer', tier: 'CORE', text: 'I like using examples from one subject to explain another', reverse_scored: false, weight: 1.1, active: true },
  { id: 'TRF_04', dimension: 'transfer', tier: 'CORE', text: 'People sometimes say my examples or analogies come from unexpected places', reverse_scored: false, weight: 1.0, active: true },

  // PRECISION
  { id: 'PRE_01', dimension: 'precision', tier: 'CORE', text: 'I double-check my work before submitting, even when time is tight', reverse_scored: false, weight: 1.0, active: true },
  { id: 'PRE_02', dimension: 'precision', tier: 'CORE', text: "When something doesn't work, I systematically check each step rather than starting over", reverse_scored: false, weight: 1.2, active: true },
  { id: 'PRE_03', dimension: 'precision', tier: 'CORE', text: 'Small errors in my work rarely affect my grades', reverse_scored: true, weight: 1.1, active: true },
  { id: 'PRE_04', dimension: 'precision', tier: 'CORE', text: 'I notice typos and small mistakes in things I read', reverse_scored: false, weight: 1.0, active: true },

  // RETRIEVAL
  { id: 'RET_01', dimension: 'retrieval', tier: 'CORE', text: 'In the past week, I tested myself on material rather than just re-reading', reverse_scored: false, weight: 1.3, active: true },
  { id: 'RET_02', dimension: 'retrieval', tier: 'CORE', text: 'I regularly go back to topics I learned weeks ago to check I still remember them', reverse_scored: false, weight: 1.2, active: true },
  { id: 'RET_03', dimension: 'retrieval', tier: 'CORE', text: 'I prefer re-reading notes to testing myself – it feels more thorough', reverse_scored: true, weight: 1.0, active: true },
  { id: 'RET_04', dimension: 'retrieval', tier: 'CORE', text: 'I use flashcards, quizzes, or practice questions as my main study method', reverse_scored: false, weight: 1.1, active: true },

  // RECEPTIVITY
  { id: 'REC_01', dimension: 'receptivity', tier: 'CORE', text: 'I actively ask teachers or peers to point out what I could improve', reverse_scored: false, weight: 1.2, active: true },
  { id: 'REC_02', dimension: 'receptivity', tier: 'CORE', text: 'When someone criticises my work, my first instinct is to defend it', reverse_scored: true, weight: 1.1, active: true },
  { id: 'REC_03', dimension: 'receptivity', tier: 'CORE', text: 'I find it useful when people find mistakes in my work', reverse_scored: false, weight: 1.0, active: true },
  { id: 'REC_04', dimension: 'receptivity', tier: 'CORE', text: 'Getting things wrong feels more like useful information than failure', reverse_scored: false, weight: 1.3, active: true },

  // STRUCTURE
  { id: 'STR_01', dimension: 'structure', tier: 'CORE', text: 'I prefer having a detailed plan before starting work', reverse_scored: false, weight: 1.1, active: true },
  { id: 'STR_02', dimension: 'structure', tier: 'CORE', text: 'I work best when I figure things out as I go', reverse_scored: true, weight: 1.0, active: true },
  { id: 'STR_03', dimension: 'structure', tier: 'CORE', text: 'Clear instructions help me work more efficiently', reverse_scored: false, weight: 1.0, active: true },
  { id: 'STR_04', dimension: 'structure', tier: 'CORE', text: 'I feel lost without a checklist or schedule', reverse_scored: false, weight: 1.2, active: true },

  // CONSISTENCY
  { id: 'CON_01', dimension: 'consistency', tier: 'CORE', text: 'I study roughly the same amount each day', reverse_scored: false, weight: 1.1, active: true },
  { id: 'CON_02', dimension: 'consistency', tier: 'CORE', text: 'I often leave work until just before the deadline', reverse_scored: true, weight: 1.2, active: true },
  { id: 'CON_03', dimension: 'consistency', tier: 'CORE', text: 'My productivity varies wildly day to day', reverse_scored: true, weight: 1.0, active: true },
  { id: 'CON_04', dimension: 'consistency', tier: 'CORE', text: 'I maintain a regular study routine even when not pressured', reverse_scored: false, weight: 1.1, active: true },

  // SOCIAL
  { id: 'SOC_01', dimension: 'social', tier: 'CORE', text: 'I understand things better when I explain them to someone else', reverse_scored: false, weight: 1.2, active: true },
  { id: 'SOC_02', dimension: 'social', tier: 'CORE', text: "Other people distract me when I'm trying to learn", reverse_scored: true, weight: 1.0, active: true },
  { id: 'SOC_03', dimension: 'social', tier: 'CORE', text: 'Group study sessions are more productive than solo study for me', reverse_scored: false, weight: 1.1, active: true },
  { id: 'SOC_04', dimension: 'social', tier: 'CORE', text: 'I prefer to work through problems on my own before discussing', reverse_scored: true, weight: 1.0, active: true },

  // DEPTH
  { id: 'DEP_01', dimension: 'depth', tier: 'CORE', text: 'I want to understand why something works, not just how', reverse_scored: false, weight: 1.2, active: true },
  { id: 'DEP_02', dimension: 'depth', tier: 'CORE', text: "I'm satisfied once I can apply a concept, even without fully understanding it", reverse_scored: true, weight: 1.1, active: true },
  { id: 'DEP_03', dimension: 'depth', tier: 'CORE', text: 'I often go deeper into topics than required', reverse_scored: false, weight: 1.0, active: true },
  { id: 'DEP_04', dimension: 'depth', tier: 'CORE', text: 'Getting the right answer is more important than understanding the method', reverse_scored: true, weight: 1.1, active: true },
];

export function getCognitiveQuestions(): Question[] {
  return QUESTIONS.filter(q => 
    ['calibration', 'tolerance', 'transfer', 'precision', 'retrieval', 'receptivity'].includes(q.dimension)
  );
}

export function getBehavioralQuestions(): Question[] {
  return QUESTIONS.filter(q => 
    ['structure', 'consistency', 'social', 'depth'].includes(q.dimension)
  );
}