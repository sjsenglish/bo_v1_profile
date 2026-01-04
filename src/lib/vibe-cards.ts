// ExamRizz Arena v9 - Vibe Paired Comparisons (Overhauled Jan 4, 2025)
// 6 paired comparisons replacing single-card swipes

import { VibePair, VibeChoice, VibeProfile } from './types';

// ============================================================================
// THE 6 VIBE PAIRS
// ============================================================================

export const VIBE_PAIRS: VibePair[] = [
  // Pair 1: Environment — Campus vs City
  {
    id: 'campus_vs_city',
    pair_number: 1,
    dimension: 'environment',
    option_a: {
      title: 'Traditional Campus',
      description: 'Historic quad, green space, students on lawn, library in background',
      image_url: 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['CAMPUS', 'TRADITIONAL', 'COLLEGIATE'],
    },
    option_b: {
      title: 'City Centre',
      description: 'Modern building, urban, street cafés, tube station nearby',
      image_url: 'https://images.unsplash.com/photo-1519677100203-a0e668c92439?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['CITY', 'MODERN', 'URBAN'],
    },
    active: true,
  },

  // Pair 2: Learning Style — Lecture vs Discussion
  {
    id: 'lecture_vs_seminar',
    pair_number: 2,
    dimension: 'teaching_style',
    option_a: {
      title: 'Large Lecture Theatre',
      description: '200+ students, tiered seats, professor at podium, PowerPoint visible',
      image_url: 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['LECTURE_HEAVY', 'LARGE_COHORT', 'PASSIVE_LEARNING'],
    },
    option_b: {
      title: 'Small Seminar Room',
      description: '10 students around table, discussion-based, Socratic method',
      image_url: 'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['SEMINAR_BASED', 'SMALL_GROUP', 'ACTIVE_DISCUSSION'],
    },
    active: true,
  },

  // Pair 3: Subject Domain — Lab vs Library
  {
    id: 'lab_vs_library',
    pair_number: 3,
    dimension: 'subject_lean',
    option_a: {
      title: 'Science Laboratory',
      description: 'Microscopes, lab equipment, experiments, practical work, hands-on science',
      image_url: 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['STEM_PRACTICAL', 'LAB_BASED', 'EXPERIMENTAL'],
    },
    option_b: {
      title: 'University Library',
      description: 'Rows of books, study desks, quiet reading, research materials, essay writing',
      image_url: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['HUMANITIES', 'TEXT_BASED', 'READING_HEAVY'],
    },
    active: true,
  },

  // Pair 4: Application — Theory vs Practice
  {
    id: 'theory_vs_practice',
    pair_number: 4,
    dimension: 'focus',
    option_a: {
      title: 'Academic Research',
      description: 'Chalkboard with equations, abstract theory, PhD student working on proof',
      image_url: 'https://images.unsplash.com/photo-1596496050827-8299e0220de1?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['THEORETICAL', 'ACADEMIC', 'RESEARCH_FOCUSED'],
    },
    option_b: {
      title: 'Professional Training',
      description: 'Hospital ward / law court / business office, real-world application, vocational',
      image_url: 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['VOCATIONAL', 'APPLIED', 'PROFESSIONAL'],
    },
    active: true,
  },

  // Pair 5: Assessment — Exams vs Coursework
  {
    id: 'exams_vs_coursework',
    pair_number: 5,
    dimension: 'assessment',
    option_a: {
      title: 'Exam Hall',
      description: 'Silent rows of desks, timed written exam, high-pressure, memory-based',
      image_url: 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['EXAM_HEAVY', 'TIME_PRESSURE', 'MEMORY_BASED'],
    },
    option_b: {
      title: 'Project Work',
      description: 'Student working on laptop, research project, extended essays, portfolio building',
      image_url: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['COURSEWORK_HEAVY', 'PROJECT_BASED', 'SUSTAINED_WORK'],
    },
    active: true,
  },

  // Pair 6: Work Mode — Independent vs Collaborative
  {
    id: 'solo_vs_group',
    pair_number: 6,
    dimension: 'work_mode',
    option_a: {
      title: 'Solo Study',
      description: 'Student alone in study room, books open, headphones on, focused individual work',
      image_url: 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['INDEPENDENT', 'SOLO_WORK', 'INDIVIDUAL_FOCUS'],
    },
    option_b: {
      title: 'Group Project',
      description: '4-5 students collaborating, whiteboard brainstorming, team discussion',
      image_url: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&q=80&w=600&h=400',
      tags: ['COLLABORATIVE', 'GROUP_WORK', 'TEAM_BASED'],
    },
    active: true,
  },
];

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

export function getActiveVibePairs(): VibePair[] {
  return VIBE_PAIRS.filter((p) => p.active).sort((a, b) => a.pair_number - b.pair_number);
}

/**
 * Calculate vibe profile from choices.
 * Returns preferences for environment, teaching style, subject, focus, assessment, work mode.
 */
export function calculateVibeProfile(choices: VibeChoice[]): VibeProfile {
  const choiceMap = new Map(choices.map((c) => [c.pair_id, c.option_chosen]));

  return {
    environment: choiceMap.get('campus_vs_city') === 'A' ? 'CAMPUS' : choiceMap.get('campus_vs_city') === 'B' ? 'CITY' : 'NEUTRAL',
    teaching_style: choiceMap.get('lecture_vs_seminar') === 'A' ? 'LECTURE' : choiceMap.get('lecture_vs_seminar') === 'B' ? 'SEMINAR' : 'MIXED',
    subject_lean: choiceMap.get('lab_vs_library') === 'A' ? 'STEM' : choiceMap.get('lab_vs_library') === 'B' ? 'HUMANITIES' : 'MIXED',
    focus: choiceMap.get('theory_vs_practice') === 'A' ? 'THEORETICAL' : choiceMap.get('theory_vs_practice') === 'B' ? 'VOCATIONAL' : 'BALANCED',
    assessment: choiceMap.get('exams_vs_coursework') === 'A' ? 'EXAM_HEAVY' : choiceMap.get('exams_vs_coursework') === 'B' ? 'COURSEWORK_HEAVY' : 'MIXED',
    work_mode: choiceMap.get('solo_vs_group') === 'A' ? 'INDEPENDENT' : choiceMap.get('solo_vs_group') === 'B' ? 'COLLABORATIVE' : 'FLEXIBLE',
  };
}

/**
 * Calculate vibe bonus for a course based on profile match.
 * Max bonus: 17 points.
 */
export function calculateVibeBonus(profile: VibeProfile, courseTags: string[]): number {
  let bonus = 0;
  const tags = new Set(courseTags.map((t) => t.toUpperCase()));

  // Environment match (+2)
  if (profile.environment === 'CAMPUS' && (tags.has('CAMPUS') || tags.has('TRADITIONAL') || tags.has('COLLEGIATE'))) {
    bonus += 2;
  } else if (profile.environment === 'CITY' && (tags.has('CITY') || tags.has('URBAN') || tags.has('MODERN'))) {
    bonus += 2;
  }

  // Teaching style match (+3)
  if (profile.teaching_style === 'LECTURE' && (tags.has('LECTURE_HEAVY') || tags.has('LARGE_COHORT'))) {
    bonus += 3;
  } else if (profile.teaching_style === 'SEMINAR' && (tags.has('SEMINAR_BASED') || tags.has('SMALL_GROUP'))) {
    bonus += 3;
  }

  // Subject lean match (+4)
  if (profile.subject_lean === 'STEM' && (tags.has('STEM') || tags.has('LAB_BASED') || tags.has('EXPERIMENTAL'))) {
    bonus += 4;
  } else if (profile.subject_lean === 'HUMANITIES' && (tags.has('HUMANITIES') || tags.has('TEXT_BASED') || tags.has('READING_HEAVY'))) {
    bonus += 4;
  }

  // Focus match (+3)
  if (profile.focus === 'THEORETICAL' && (tags.has('THEORETICAL') || tags.has('ACADEMIC') || tags.has('RESEARCH_FOCUSED'))) {
    bonus += 3;
  } else if (profile.focus === 'VOCATIONAL' && (tags.has('VOCATIONAL') || tags.has('APPLIED') || tags.has('PROFESSIONAL'))) {
    bonus += 3;
  }

  // Assessment match (+2)
  if (profile.assessment === 'EXAM_HEAVY' && (tags.has('EXAM_HEAVY') || tags.has('TIME_PRESSURE'))) {
    bonus += 2;
  } else if (profile.assessment === 'COURSEWORK_HEAVY' && (tags.has('COURSEWORK_HEAVY') || tags.has('PROJECT_BASED'))) {
    bonus += 2;
  }

  // Work mode match (+3)
  if (profile.work_mode === 'INDEPENDENT' && (tags.has('INDEPENDENT') || tags.has('SOLO_WORK'))) {
    bonus += 3;
  } else if (profile.work_mode === 'COLLABORATIVE' && (tags.has('COLLABORATIVE') || tags.has('GROUP_WORK') || tags.has('TEAM_BASED'))) {
    bonus += 3;
  }

  return bonus;
}

/**
 * Collect all tags from choices for course matching.
 */
export function collectVibeTags(choices: VibeChoice[]): string[] {
  const tags: string[] = [];

  for (const choice of choices) {
    const pair = VIBE_PAIRS.find((p) => p.id === choice.pair_id);
    if (!pair) continue;

    const option = choice.option_chosen === 'A' ? pair.option_a : pair.option_b;
    tags.push(...option.tags);
  }

  return tags;
}

// ============================================================================
// LEGACY SUPPORT (deprecated single-card swipes)
// ============================================================================

import { VibeCard, VibeSwipe } from './types';

export const VIBE_CARDS: VibeCard[] = [
  // Kept for backwards compatibility but marked inactive
  {
    id: 'VIBE_LEGACY_01',
    image_url: '/vibe/placeholder.jpg',
    alt_text: 'Legacy vibe card - deprecated',
    right_tags: [],
    left_tags: [],
    sort_order: 1,
    active: false,
  },
];

export function getActiveVibeCards(): VibeCard[] {
  // Legacy function - returns empty array as paired comparisons are now used
  return VIBE_CARDS.filter((c) => c.active).sort((a, b) => a.sort_order - b.sort_order);
}
