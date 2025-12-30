import {
  CognitiveProfile,
  BehavioralProfile,
  Familiar,
  Guild,
  GuildId,
  Dimension,
  CognitiveDimension,
  COGNITIVE_DIMENSIONS,
} from './types';

export const FAMILIARS: Familiar[] = [
  { id: 'OWL', name: 'The Owl', element: 'Air', tagline: 'The Night Scholar', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['calibration', 'precision'], description: 'Wise and watchful, the Owl sees what others miss.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'FOX', name: 'The Fox', element: 'Shadow', tagline: 'The Clever Path-Finder', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['transfer', 'receptivity'], description: 'Quick-witted and adaptable.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'WOLF', name: 'The Wolf', element: 'Earth', tagline: 'The Pack Strategist', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['tolerance', 'receptivity'], description: 'Resilient and collaborative.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'PANDA', name: 'The Panda', element: 'Earth', tagline: 'The Steady Climber', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['tolerance'], description: 'Patient and persistent.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'RAVEN', name: 'The Raven', element: 'Shadow', tagline: 'The Pattern Seeker', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['transfer', 'retrieval'], description: 'Sharp and observant.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'OCTOPUS', name: 'The Octopus', element: 'Water', tagline: 'The Multi-Threaded Mind', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['transfer', 'retrieval'], description: 'Flexible and multi-talented.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'BEAR', name: 'The Bear', element: 'Earth', tagline: 'The Burst Force', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['tolerance'], description: 'Powerful and determined.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'TORTOISE', name: 'The Tortoise', element: 'Earth', tagline: 'The Patient Master', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['tolerance', 'precision'], description: 'Slow and steady wins.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'CHEETAH', name: 'The Cheetah', element: 'Fire', tagline: 'The Sprint Specialist', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['calibration', 'precision'], description: 'Fast and focused.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'CROW', name: 'The Crow', element: 'Air', tagline: 'The Tool User', rarity: 'COMMON', rarity_percent: 10, disposition_bias: ['precision'], description: 'Clever and resourceful.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'PHOENIX', name: 'The Phoenix', element: 'Fire', tagline: 'The Eternal Learner', rarity: 'RARE', rarity_percent: 3, disposition_bias: ['tolerance'], description: 'Rising from every failure.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'DRAGON', name: 'The Dragon', element: 'Fire', tagline: 'The Knowledge Hoarder', rarity: 'RARE', rarity_percent: 3, disposition_bias: ['precision'], description: 'Ancient and powerful.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'KITSUNE', name: 'The Kitsune', element: 'Shadow', tagline: 'The Nine-Tailed Trickster', rarity: 'RARE', rarity_percent: 3, disposition_bias: ['transfer', 'receptivity'], description: 'Mysterious and multi-faceted.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
  { id: 'SPHINX', name: 'The Sphinx', element: 'Light', tagline: 'The Riddle Master', rarity: 'LEGENDARY', rarity_percent: 1, disposition_bias: ['calibration'], description: 'Enigmatic and all-knowing.', stage_names: ['Hatchling', 'Juvenile', 'Adult', 'Elder', 'Mythic'] },
];

export const GUILDS: Guild[] = [
  { id: 'FORGE', name: 'Forge Guild', motto: 'We build systems', description: 'Methodical, precise, and dependable.', formula: { precision: 0.35, retrieval: 0.35, calibration: 0.30 }, color_primary: '#f97316', color_secondary: '#ea580c' },
  { id: 'FLOW', name: 'Flow Guild', motto: 'We adapt and connect', description: 'Flexible, creative, and open.', formula: { transfer: 0.35, receptivity: 0.35, precision_inverse: 0.30 }, color_primary: '#06b6d4', color_secondary: '#0891b2' },
  { id: 'FORCE', name: 'Force Guild', motto: 'We push through', description: 'Resilient, adaptive, and unstoppable.', formula: { tolerance: 0.45, receptivity: 0.30, transfer: 0.25 }, color_primary: '#a855f7', color_secondary: '#9333ea' },
  { id: 'FOUNDATION', name: 'Foundation Guild', motto: 'We remember and endure', description: 'Steady, grounded, and unshakeable.', formula: { retrieval: 0.40, calibration: 0.35, tolerance: 0.25 }, color_primary: '#22c55e', color_secondary: '#16a34a' },
];

function hashString(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    const char = str.charCodeAt(i);
    hash = ((hash << 5) - hash) + char;
    hash = hash & hash;
  }
  return Math.abs(hash);
}

export function assignFamiliar(
  sessionId: string,
  dominant: string
): { familiar: Familiar; stage: number } {
  const hash = hashString(sessionId);
  const isRare = (hash % 100) < 10;
  
  const commonPool = FAMILIARS.filter(f => f.rarity === 'COMMON');
  const rarePool = FAMILIARS.filter(f => f.rarity === 'RARE' || f.rarity === 'LEGENDARY');
  const pool = isRare ? rarePool : commonPool;
  
  const biasCheck = ((hash * 2654435761) >>> 0) % 100;
  
  let familiar: Familiar;
  
  if (biasCheck < 70) {
    familiar = pool[hash % pool.length];
  } else {
    const biased = pool.filter(f => f.disposition_bias.includes(dominant));
    familiar = biased.length > 0 ? biased[hash % biased.length] : pool[hash % pool.length];
  }
  
  return { familiar, stage: 1 };
}

function calculateGuildScore(guildId: GuildId, cognitive: CognitiveProfile): number {
  const guild = GUILDS.find(g => g.id === guildId)!;
  let score = 0;
  
  for (const [dim, weight] of Object.entries(guild.formula)) {
    if (dim === 'precision_inverse') {
      score += (100 - cognitive.precision.value) * weight;
    } else if (dim in cognitive) {
      score += cognitive[dim as CognitiveDimension].value * weight;
    }
  }
  
  return score;
}

export function assignGuild(cognitive: CognitiveProfile): Guild {
  const scores = GUILDS.map(guild => ({
    guild,
    score: calculateGuildScore(guild.id, cognitive),
  }));
  
  scores.sort((a, b) => b.score - a.score);
  return scores[0].guild;
}

export function assignIdentity(
  sessionId: string,
  cognitive: CognitiveProfile,
  behavioral: BehavioralProfile,
  dominant: string,
  nemesis: string
) {
  const { familiar, stage } = assignFamiliar(sessionId, dominant);
  const guild = assignGuild(cognitive);
  
  return {
    familiar_id: familiar.id,
    familiar_stage: stage,
    guild_id: guild.id,
    dominant,
    nemesis,
  };
}

export function getFamiliarById(id: string): Familiar | undefined {
  return FAMILIARS.find(f => f.id === id);
}

export function getGuildById(id: GuildId): Guild | undefined {
  return GUILDS.find(g => g.id === id);
}