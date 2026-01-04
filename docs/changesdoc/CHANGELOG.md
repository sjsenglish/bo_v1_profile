# ExamRizz Arena — Changelog

All notable changes to this project are documented in this file.

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [8.0] - 2025-01-01

### Added
- Comprehensive documentation structure (MASTER_SPEC, CHANGELOG, BACKLOG, HANDOFF, DATA_DICTIONARY, RESEARCH_FOUNDATION)
- Session-based development workflow
- Research synthesis from 120-page Assessment Framework

### Changed
- Consolidated all previous specs into single canonical MASTER_SPEC.md

### Identified (Not Fixed)
- Course matching returns seemingly random results (HIGH priority)
- Likert questions feel too hypothetical to users
- Questions perceived as repetitive
- Section weighting imbalanced (too much self-report, too little capacity)

---

## [7.0] - 2024-12-31

### Added
- Complete supercurricular system schema (3 tables)
- 178 supercurricular items across 10 academic clusters
- Supercurricular curation pipeline (`curate_supercurriculars.js`)
- ALL_CLUSTERS.sql seed file (~5,800 lines)
- Capacity benchmark items in database (72 items: 36 VRB, 36 QNT)

### Changed
- Consolidated v6.0 + v6.2 into unified spec
- Truth reconciliation: documented what's actually built vs planned

### Not Built (Deferred)
- Supercurricular API endpoints
- Supercurricular UI components
- Capacity benchmark frontend

---

## [6.2] - 2024-12-29

### Added
- **Diversity constraint**: Max 3 courses per university in results
  - `applyDiversityConstraint()` function in matching.ts
  - Prevents single institution dominating matches
  
- **Quality weighting**: Institutional quality affects rankings
  - Russell Group: +5 points
  - NSS ≥80%: +3 points
  - Employment ≥90%: +2 points
  - Salary ≥£30k: +2 points
  - Maximum bonus: +12 points

- **Per-course disposition modifiers**: Teaching structure adjusts demands
  - Exam % → RETRIEVAL demand
  - Practical % → PRECISION demand
  - Low continuation → TOLERANCE demand
  - Contact hours → STRUCTURE demand
  - Feedback scores → RECEPTIVITY demand
  - Coursework % → SOCIAL demand

### Changed
- `types.ts`: Added HESA fields, UserPreferences, quality constants
- `matching.ts`: Added diversity, quality, per-course modifier logic
- Estimated course differentiation improved 3× (5,000 → 15,000 distinguishable clusters)

---

## [6.0] - 2024-12-28

### Added
- **HESA dataset integration**: 28,520 real UK university courses
  - Authentic NSS scores, employment rates, salary data
  - Teaching structure metrics (exam/coursework/practical split)
  - Entry requirements (UCAS points)
  
- **Progressive precision system**: σ tracking for each disposition
  - Uncertainty reduces as more questions answered
  - Provenance tracking (MEASURED, PROXIED, PRIOR)

- **4-layer gravity matching algorithm**:
  1. Cognitive fit (weighted by importance)
  2. Behavioural friction (penalty)
  3. Capacity readiness (multiplier)
  4. Vibe bonus (tiebreaker)

- **40 CORE diagnostic questions**: 4 per disposition
  - Weighted (1.0-1.3)
  - Some reverse-scored
  - Supports infinite pool expansion (EXTENDED, DEEP, EXPERT tiers)

- **Vibe Swiper**: 12 image-based cards
  - Environment/subject preferences
  - Disposition nudges on some cards

- **Identity system**:
  - 14 Familiars (10 common, 4 rare)
  - 4 Guilds with weighted formulas
  - Element assignments (Fire, Water, Earth, Air, Shadow, Light)

- **Complete assessment flow**:
  - Landing → Vibe → Cognitive → Behavioural → Processing → Results
  - Anonymous sessions (no login)
  - Progressive completion (can skip sections)

### Technical
- Next.js 14 with App Router
- Supabase backend with Row Level Security
- Tailwind CSS styling
- Vercel deployment

---

## [5.x and Earlier] - Pre-2024-12-28

### Summary
- Initial concept development
- Prototype iterations
- Design system exploration

---

## Legend

- **Added**: New features
- **Changed**: Changes to existing functionality
- **Fixed**: Bug fixes
- **Removed**: Removed features
- **Security**: Security improvements
- **Not Built**: Documented features that were deferred

---

## Upcoming (See BACKLOG.md)

- Question redesign (forced-choice replacing Likert)
- Capacity benchmark UI
- Supercurricular API and UI
- Entry requirements filtering
- Matching algorithm debugging
