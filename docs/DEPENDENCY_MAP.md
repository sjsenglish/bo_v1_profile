# Dependency Map — ExamRizz Arena

**Purpose:** Track what affects what. When you change X, this tells you what else needs updating.

**How to use:** 
1. Before changing anything, find it in the "Components" section
2. Check "Affects" to see what else might break
3. After changing, update "Last Modified" and review affected items

---

## Document Dependencies

```
MASTER_SPEC.md (v8)
├── MATCHING_MODEL.md ──────────── Algorithm details
├── GROWTH_MODEL.md ────────────── Profile evolution (NEW)
├── FORCED_CHOICE_BANK.md ──────── Question content
├── DATA_DICTIONARY.md ─────────── Schema reference
└── HANDOFF_*.md ───────────────── Session context (ephemeral)

DEPENDENCY_MAP.md (this file)
└── References all above; update when new docs created
```

---

## Component Dependency Matrix

### Key
- **→** = "changes to X affect Y"
- **⟷** = "bidirectional dependency"
- **⚠** = "critical dependency, breaking change likely"

---

### 1. Database Schema

| Component | Affects | Affected By |
|-----------|---------|-------------|
| `bo_v1_profiles` | → Scoring, → Matching, → Results UI, → Profile UI | ⚠ Schema changes |
| `bo_v1_sessions` | → Session management, → Profile linking | — |
| `bo_v1_capacity_items` | → Capacity UI, → Scoring | Item generation |
| `bo_v1_benchmark_responses` | → Scoring, → IRT calculation | Capacity UI |
| `bo_v1_assessment_state` (NEW) | → Profile UI, → Growth mechanics | GROWTH_MODEL.md |
| `bo_v1_courses` | → Matching, → Results UI | HESA data updates |
| `bo_v1_matches` | → Results UI | Matching algorithm |

**If you change `bo_v1_profiles` schema:**
- [ ] Update DATA_DICTIONARY.md
- [ ] Update TypeScript types (`types.ts`)
- [ ] Check scoring.ts for column references
- [ ] Check matching.ts for column references
- [ ] Check Results page data fetching
- [ ] Check Profile page data fetching

---

### 2. Algorithms

| Component | Affects | Affected By |
|-----------|---------|-------------|
| **Scoring algorithm** (`scoring.ts`) | → Profile values, → Matching inputs | Question changes, Disposition definitions |
| **Matching algorithm** (`matching.ts`) | → Course rankings, → Results display | Profile schema, Course schema, MATCHING_MODEL.md |
| **IRT calculation** | → Capacity scores, → Sigma values | Capacity item difficulties |
| **Precision calculation** | → Precision score, → Tier assignment | All sigma values |
| **Identity assignment** | → Familiar, → Guild | Disposition scores |

**If you change matching algorithm:**
- [ ] Update MATCHING_MODEL.md
- [ ] Version bump in algorithm_version field
- [ ] Consider whether existing results need recalculation
- [ ] Update Results UI if new data exposed
- [ ] Update test scenarios

---

### 3. Assessment Flow

| Component | Affects | Affected By |
|-----------|---------|-------------|
| **Vibe Swiper** | → vibe_tags, → disposition_nudges | Vibe card definitions |
| **Forced-Choice** | → Disposition scores | FORCED_CHOICE_BANK.md |
| **Capacity Benchmarks** | → Capacity scores, → Enjoyment, → Calibration | Capacity items, Time limits |
| **Adaptive routing** | → Item selection, → Tier progression | IRT difficulties, Performance thresholds |

**If you change assessment flow order:**
- [ ] Update MASTER_SPEC.md flow diagram
- [ ] Update GROWTH_MODEL.md if it affects precision calculation
- [ ] Update onboarding UI
- [ ] Update "Sharpen Profile" recommendations
- [ ] Check session state tracking

---

### 4. UI Components

| Component | Affects | Affected By |
|-----------|---------|-------------|
| **Landing page** | → Session creation, → User routing | Session detection logic |
| **Profile page** (NEW) | → User engagement, → Feature discovery | Profile schema, Assessment state |
| **Assessment components** | → Response capture | Item schema, Interaction types |
| **Results page** | → User satisfaction | Matching output, Profile data |
| **Sharpen Profile flow** (NEW) | → Return engagement | Assessment state, Precision calc |

**If you change Profile page:**
- [ ] Update GROWTH_MODEL.md wireframes
- [ ] Ensure empty state and populated state both work
- [ ] Check mobile responsiveness
- [ ] Verify familiar/guild display
- [ ] Test precision calculation display

---

### 5. API Endpoints

| Endpoint | Affects | Affected By |
|----------|---------|-------------|
| `POST /api/session` | → Session creation | Session schema |
| `POST /api/response` | → Response storage | Question/item schema |
| `POST /api/calculate` | → Profile update, → Match generation | Scoring + Matching algorithms |
| `GET /api/results/[id]` | → Results display | Profile + Matches tables |
| `GET /api/profile/[id]` (NEW) | → Profile page | Profile schema, Assessment state |
| `POST /api/capacity/respond` | → Benchmark responses | Capacity items, Scoring logic |

**If you add a new endpoint:**
- [ ] Add to API Reference in MASTER_SPEC.md
- [ ] Define request/response types in types.ts
- [ ] Add error handling
- [ ] Consider rate limiting
- [ ] Add to this dependency map

---

## Change Checklist Templates

### Adding a New Disposition

- [ ] Add to disposition enum in types.ts
- [ ] Add columns to bo_v1_profiles (value + sigma)
- [ ] Update DATA_DICTIONARY.md
- [ ] Add questions to FORCED_CHOICE_BANK.md
- [ ] Update scoring.ts calculation
- [ ] Update matching.ts if affects course fit
- [ ] Add to radar chart in Results UI
- [ ] Update precision calculation (denominator changes)
- [ ] Update MASTER_SPEC.md disposition table

### Adding a New Capacity Type

- [ ] Add to capacity enum in types.ts
- [ ] Add columns to bo_v1_profiles (value + sigma + provenance)
- [ ] Create items in bo_v1_capacity_items
- [ ] Update DATA_DICTIONARY.md
- [ ] Build UI component for new interaction types
- [ ] Update IRT calculation to include
- [ ] Update matching.ts if affects course fit
- [ ] Add to Profile page capacity display
- [ ] Update assessment state tracking
- [ ] Update GROWTH_MODEL.md precision calculation

### Adding a New Interaction Type

- [ ] Add to interaction_type CHECK constraint in schema
- [ ] Create React component for type
- [ ] Define options/correct_answer JSONB structure
- [ ] Add scoring logic in capacity scoring
- [ ] Document in DATA_DICTIONARY.md
- [ ] Update HANDOFF docs with examples

### Changing Matching Algorithm

- [ ] Update MATCHING_MODEL.md with new logic
- [ ] Bump matching_algorithm_version
- [ ] Update matching.ts
- [ ] Decide: recalculate existing results?
- [ ] Update Results UI if new data fields
- [ ] Update test scenarios
- [ ] Consider A/B testing approach

---

## Version History

| Date | Change | Affected Components | Author |
|------|--------|---------------------|--------|
| 2025-01-02 | Created dependency map | — | Claude |
| 2025-01-02 | Added GROWTH_MODEL.md | Profile schema, UI, Session flow | Claude |

---

## Critical Invariants

Things that must ALWAYS be true:

1. **Raw responses are never deleted** — even if algorithm changes, we can recalculate
2. **Profile precision = f(all sigmas)** — if you add a dimension, precision calc must update
3. **Session ID links everything** — responses, profile, matches all trace back
4. **Capacity items have IRT difficulty** — required for adaptive routing
5. **Algorithm versions are tracked** — stored on profile for reproducibility
6. **Identity is immutable after assignment** — familiar/guild don't change

---

## When to Update This Document

- [ ] When adding new documentation
- [ ] When adding new database tables/columns
- [ ] When adding new API endpoints
- [ ] When changing how components interact
- [ ] When discovering undocumented dependencies

---

*Last updated: 2 January 2025*
