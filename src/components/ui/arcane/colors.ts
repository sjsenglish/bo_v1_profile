/**
 * ExamRizz Arena — Arcane Design System
 * Colour Tokens
 * 
 * Deep blues, vibrant teals, and icy accents.
 */

export const ARCANE_COLORS = {
  // Background Scale (darkest → lightest)
  bgDeep: '#011c40',
  bgMid: '#023859',
  bgLight: '#26658c',
  
  // Primary Accents
  teal: '#54acbf',
  ice: '#a7ebf2',
  
  // Semantic
  navy: '#011c40',
  line: '#26658c',
  muted: '#26658c',
  
  // Tertiary (for special details)
  gold: '#d4a55a',
} as const;

export type ArcaneColor = keyof typeof ARCANE_COLORS;

/**
 * Tailwind-compatible colour classes
 */
export const ARCANE_CLASSES = {
  bgDeep: 'bg-[#011c40]',
  bgMid: 'bg-[#023859]',
  bgLight: 'bg-[#26658c]',
  teal: 'text-[#54acbf]',
  ice: 'text-[#a7ebf2]',
  borderTeal: 'border-[#54acbf]',
  borderIce: 'border-[#a7ebf2]',
  borderLine: 'border-[#26658c]',
} as const;
