/**
 * ExamRizz Arena — Arcane Design System
 * 
 * Barrel export for all components.
 * Import like: import { CardFrame, ArcaneButton, ... } from '@/components/ui/arcane';
 */

// Colour Tokens
export { ARCANE_COLORS, ARCANE_CLASSES } from './colors';
export type { ArcaneColor } from './colors';

// Decorative Elements
export { OrnateCorner, GemIcon, RuneDivider } from './decorations';

// Core Components
export { CardFrame, CardFrameStack } from './CardFrame';
export { ArcaneButton, ArcaneLinkButton } from './ArcaneButton';
export { ArcaneLoader, InlineLoader, Skeleton } from './ArcaneLoader';
export { ProgressIndicator, ProgressBar, StepIndicator } from './ProgressIndicator';
export { RevealCard, MysteryCardFront, FamiliarCardBack } from './RevealCard';
export { Atmosphere, GradientFade, ParticleField } from './Atmosphere';

// Typography
export { 
  ArcaneHeading, 
  ArcaneLabel, 
  ArcaneQuote, 
  ArcaneBadge,
  SectionHeader 
} from './Typography';

// Form/Input Components
export { 
  LikertScale, 
  ArcaneInput, 
  SelectionCard, 
  SwipeCard 
} from './Inputs';
