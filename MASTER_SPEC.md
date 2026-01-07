# ExamRizz Arena — Master Specification

**Version:** 8.0  
**Status:** FUNCTIONAL MVP (with known issues)  
**Last Updated:** 1 January 2025  
**Live URL:** https://bo-v1-profile.vercel.app/  
**Repository:** https://github.com/sjsenglish/bo_v1_profile

---

## 1. Product Definition

### What It Is

ExamRizz Arena is a UK university course matching platform that profiles sixth-form students (ages 16-18) across 10 learning dispositions and 3 cognitive capacities, then matches them to degree programmes from authentic HESA data using a 4-layer gravity algorithm.

### Core Differentiator

"Brutally honest" assessments that measure what students *can* do (capacity), how they *learn* (disposition), and what they *might enjoy* (fit) — rather than relying on self-reported interests or A-level predictions alone.

### Target Users

- Primary: Year 12-13 students choosing university courses
- Secondary: Year 10-11 students exploring options
- Tertiary: Parents, teachers, careers advisors

---

## 2. Current Deployed State

### What Works

| Component | Status | Notes |
|-----------|--------|-------|
| Landing page | ✅ Complete | Entry point with session creation |
| Vibe Swiper | ✅ Complete | 12 image cards, swipe-based |
| Cognitive questions | ✅ Complete | 24 Likert-scale questions |
| Behavioural questions | ✅ Complete | 16 Likert-scale questions |
| Processing screen | ✅ Complete | Calculates matches + identity |
| Results page | ✅ Partial | Shows matches, has React hydration flash |
| Course matching | ✅ Complete | 4-layer + quality + diversity |
| Identity system | ✅ Complete | 14 familiars, 4 guilds |
| Course data | ✅ 28,520 courses | Real HESA Discover Uni data |

### What Doesn't Work / Known Issues

| Issue | Severity | Root Cause |
|-------|----------|------------|
| Course matches feel "random" | HIGH | Algorithm/data flow issue — user feedback indicates matches don't correlate with inputs |
| Results page flash error | MEDIUM | React hydration mismatch |
| Likert questions feel "hypothetical" | MEDIUM | User feedback — students feel like they're making things up |
| Questions feel repetitive | LOW | 40 questions across 10 dimensions with similar phrasing |
| Capacity UI incomplete | LOW | VRB/QNT/SPD benchmarks exist in DB but no frontend |

### What's Not Built

| Component | Priority | Blocker |
|-----------|----------|---------|
| Supercurricular API | HIGH | Database populated (178 items), needs endpoints |
| Supercurricular UI | HIGH | Waiting on API |
| Capacity benchmarks UI | HIGH | Items in database (72), needs frontend |
| Entry requirements filtering | MEDIUM | None |
| User preferences UI | MEDIUM | None |
| XP/Leveling system | LOW | Phase 2 |

---

## 3. The 10 Dispositions

### Cognitive Dispositions (6)

| ID | Name | What It Measures | High Score Suits |
|----|------|------------------|------------------|
| CALIBRATION | Self-Monitoring | Knowing what you know vs don't | Exam-heavy courses |
| TOLERANCE | Productive Struggle | Persisting through difficulty | STEM, research courses |
| TRANSFER | Pattern Recognition | Connections across domains | Interdisciplinary courses |
| PRECISION | Error Sensitivity | Catching mistakes, exactness | Lab sciences, engineering |
| RETRIEVAL | Recall Discipline | Active testing vs passive review | Cumulative knowledge courses |
| RECEPTIVITY | Feedback Comfort | Seeking and using correction | Coursework-heavy courses |

### Behavioural Dispositions (4)

| ID | Name | What It Measures | High Score Suits |
|----|------|------------------|------------------|
| STRUCTURE | Scaffolding Need | Clear steps vs open exploration | Modular, prescriptive courses |
| CONSISTENCY | Routine Stability | Steady work vs burst patterns | Regular deadline courses |
| SOCIAL | Learning Mode | Collaboration vs solo | Seminar/group work courses |
| DEPTH | Orientation | Surface vs deep mastery | Research/dissertation courses |

### Measurement

Each disposition is stored as:
- **Value:** 0-100 scale (50 = population average)
- **Sigma (σ):** Uncertainty (starts at 20-25, reduces with more questions)

Sigma reduction by questions answered:
```
0 questions:  σ = 25 (population prior)
4 questions:  σ = 15 (CORE tier)
8 questions:  σ = 10 (EXTENDED tier)
12 questions: σ = 6  (DEEP tier)
16+ questions: σ = 3  (EXPERT tier)
```

---

## 4. The 3 Capacities

| ID | Name | What It Measures | Current State |
|----|------|------------------|---------------|
| VRB | Verbal Reasoning | Reading comprehension, argument analysis | 36 items in DB, UI not built |
| QNT | Quantitative Reasoning | Data interpretation, mathematical modelling | 36 items in DB, UI not built |
| SPD | Processing Speed | Symbol-digit, pattern comparison | 0 items in DB |

### Proxy Formulas (When Not Measured)

```
VRB = TRANSFER × 0.4 + CALIBRATION × 0.3 + RETRIEVAL × 0.3  (σ = 18)
QNT = PRECISION × 0.5 + CALIBRATION × 0.3 + TRANSFER × 0.2  (σ = 18)
SPD = CALIBRATION × 0.4 + PRECISION × 0.3 + TOLERANCE × 0.3  (σ = 18)
```

---

## 5. Assessment Flow

### Current Flow (Deployed)

```
LANDING → VIBE SWIPER (12 cards, ~2 min, skippable)
       → COGNITIVE (24 questions, ~6 min)
       → BEHAVIOURAL (16 questions, ~4 min, skippable)
       → PROCESSING (identity + matching calculation)
       → RESULTS (top 20 courses + radar chart + identity)
```

### Component Details

#### 5.1 Vibe Swiper

- 12 image cards with environment/subject aesthetics
- Swipe right/left/skip
- Each card has:
  - `right_tags[]`: Tags applied on right swipe
  - `left_tags[]`: Tags applied on left swipe
  - `disposition_nudge`: Optional +/- to disposition scores
- Output: `vibe_tags[]`, `subject_weights{}`, `environment_weights{}`

#### 5.2 Diagnostic Questions

- 40 CORE questions total (4 per disposition)
- 5-point Likert scale (Strongly Disagree → Strongly Agree)
- Some reverse-scored
- Weights range 1.0-1.3

Question structure:
```typescript
interface Question {
  id: string;           // e.g., "CAL_01"
  dimension: string;    // e.g., "CALIBRATION"
  tier: 'CORE' | 'EXTENDED' | 'DEEP' | 'EXPERT';
  text: string;
  reverse_scored: boolean;
  weight: number;       // 1.0-1.3
}
```

#### 5.3 Processing

1. Calculate disposition scores from responses
2. Assign identity (familiar + guild)
3. Run 4-layer matching algorithm
4. Store results in `bo_v1_matches`

---

## 6. Course Matching Algorithm

### 6.1 Four-Layer Gravity Model

```typescript
function calculateFit(profile: Profile, course: Course): MatchResult {
  // Layer 1: Cognitive fit (weighted by importance)
  const cognitive = calculateCognitiveFit(profile, course);
  
  // Layer 2: Behavioural friction
  const behavioralPenalty = calculateBehavioralFriction(profile, course);
  
  // Layer 3: Capacity readiness (currently proxied)
  const readiness = calculateCapacityReadiness(profile, course);
  const readinessMultiplier = readiness < 60 ? readiness / 100 : 1.0;
  
  // Layer 4: Vibe bonus (tiebreaker)
  const vibeBonus = calculateVibeBonus(profile.vibe_tags, course.subject_tags);
  
  // Combine
  let score = cognitive - behavioralPenalty;
  score *= readinessMultiplier;
  score += vibeBonus;
  
  return { score: clamp(0, 100, score), friction };
}
```

### 6.2 Per-Course Disposition Modifiers

Base CAH demands are adjusted by per-course HESA data:

| HESA Field | Affects | Logic |
|------------|---------|-------|
| `assessment_exam_pct` | RETRIEVAL | +3 per 10% above 50% |
| `assessment_practical_pct` | PRECISION | +2 per 10% |
| `continuation_rate` | TOLERANCE | +5 if 10% below 85% |
| `scheduled_hours` | STRUCTURE | +3 per 5 hours above 15/week |
| `nss_feedback` | RECEPTIVITY | +0.3 per point above 75 |
| `assessment_coursework_pct` | SOCIAL | +2 per 10% above 30% |

### 6.3 Quality Weighting

| Factor | Bonus | Threshold |
|--------|-------|-----------|
| Russell Group | +5 points | Boolean flag |
| NSS Overall | +3 points | ≥80% |
| Employment Rate | +2 points | ≥90% |
| Median Salary (3yr) | +2 points | ≥£30,000 |

**Maximum quality bonus:** +12 points

### 6.4 Diversity Constraint

Maximum 3 courses per university in final results. Prevents single institution dominating matches.

### 6.5 Friction Buckets

| Score Range | Friction Label |
|-------------|----------------|
| 80-100 | LOW |
| 65-79 | MODERATE |
| 50-64 | HIGH |
| 35-49 | VERY_HIGH |
| 0-34 | EXTREME |

---

## 7. Identity System

### 7.1 Familiars (14 Total)

**Common (10):**
| ID | Name | Element | Bias Dimensions |
|----|------|---------|-----------------|
| OWL | The Owl | Air | CALIBRATION, PRECISION |
| FOX | The Fox | Shadow | TRANSFER, RECEPTIVITY |
| WOLF | The Wolf | Earth | TOLERANCE, RECEPTIVITY |
| PANDA | The Panda | Earth | TOLERANCE |
| RAVEN | The Raven | Shadow | TRANSFER, RETRIEVAL |
| OCTOPUS | The Octopus | Water | TRANSFER, RETRIEVAL |
| BEAR | The Bear | Earth | TOLERANCE |
| TORTOISE | The Tortoise | Earth | TOLERANCE, PRECISION |
| CHEETAH | The Cheetah | Fire | CALIBRATION, PRECISION |
| CROW | The Crow | Air | PRECISION |

**Rare (4):**
| ID | Name | Element | Rarity % |
|----|------|---------|----------|
| PHOENIX | The Phoenix | Fire | 3% |
| DRAGON | The Dragon | Fire | 3% |
| KITSUNE | The Kitsune | Shadow | 3% |
| SPHINX | The Sphinx | Light | 1% |

### 7.2 Guilds (4)

| ID | Name | Motto | Formula |
|----|------|-------|---------|
| FORGE | Forge Guild | "We build systems" | PRECISION×0.35 + RETRIEVAL×0.35 + CALIBRATION×0.30 |
| FLOW | Flow Guild | "We adapt and connect" | TRANSFER×0.35 + RECEPTIVITY×0.35 + (100-PRECISION)×0.30 |
| FORCE | Force Guild | "We push through" | TOLERANCE×0.45 + RECEPTIVITY×0.30 + TRANSFER×0.25 |
| FOUNDATION | Foundation Guild | "We remember and endure" | RETRIEVAL×0.40 + CALIBRATION×0.35 + TOLERANCE×0.25 |

---

## 8. Supercurricular System

### 8.1 Current State

- **Database:** 178 items across 10 clusters (ALL_CLUSTERS.sql)
- **API:** Not built
- **UI:** Not built

### 8.2 Clusters

| Cluster | Full Name | Example Courses |
|---------|-----------|-----------------|
| MED | Medical & Health Sciences | Medicine, Nursing, Dentistry |
| SOC | Social Sciences | Psychology, Economics, PPE |
| LAW | Law | Law, Criminology |
| STEM_PHYS | Physical Sciences | Physics, Chemistry, Maths |
| ENG | Engineering | Civil, Mechanical, Electrical |
| COMP | Computer Science | CS, Software Engineering |
| HUM | Humanities | History, Philosophy, English |
| BUS | Business | Management, Marketing, Finance |
| STEM_LIFE | Life Sciences | Biology, Biochemistry |
| LANG | Languages & Linguistics | Modern Languages |

### 8.3 Supercurricular Types

```
BOOK, ARTICLE, PODCAST, VIDEO, COURSE, COMPETITION,
WORK_EXPERIENCE, VOLUNTEERING, EPQ, SUMMER_SCHOOL, RESEARCH
```

### 8.4 Database Schema

```sql
bo_v1_supercurriculars (main table)
  ├── id, type, format, title, subtitle, description
  ├── author, author_credentials, publisher, publication_year
  ├── primary_cluster, secondary_clusters[], subject_tags[]
  ├── difficulty_* (6 dimensions)
  ├── year_groups[], time_estimate, commitment_type
  └── credibility_score, generation_confidence

bo_v1_supercurricular_course_links (course→supercurricular)
  └── Links supercurriculars to specific courses/CAH codes

bo_v1_supercurricular_quiz_mappings (quiz integration)
  └── disposition_boosts, disposition_requirements, xp_reward
```

---

## 9. Database Schema Reference

### 9.1 Core Tables

| Table | Purpose | Row Count |
|-------|---------|-----------|
| `bo_v1_sessions` | Assessment state tracking | Dynamic |
| `bo_v1_profiles` | Computed student characteristics | Dynamic |
| `bo_v1_courses` | HESA course data | 28,520 |
| `bo_v1_questions` | Diagnostic questions | 40 (CORE tier) |
| `bo_v1_vibe_cards` | Vibe swiper cards | 12 |
| `bo_v1_familiars` | Spirit animal definitions | 14 |
| `bo_v1_guilds` | Guild definitions | 4 |

### 9.2 Response Tables

| Table | Purpose |
|-------|---------|
| `bo_v1_vibe_swipes` | Records individual swipes |
| `bo_v1_diagnostic_responses` | Records question responses |
| `bo_v1_benchmark_responses` | Records capacity item responses |
| `bo_v1_matches` | Cached course match results |

### 9.3 Content Tables

| Table | Purpose | Row Count |
|-------|---------|-----------|
| `bo_v1_supercurriculars` | Supercurricular activities | 178 |
| `bo_v1_quests` | Task definitions (future) | 0 |
| `bo_v1_feed_items` | Social feed (future) | 0 |

See DATA_DICTIONARY.md for complete column-level documentation.

---

## 10. API Reference

### 10.1 Existing Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/session` | POST | Create new assessment session |
| `/api/vibe` | POST | Record vibe swipe |
| `/api/response` | POST | Record question response |
| `/api/calculate` | POST | Calculate matches + identity |
| `/api/results/[id]` | GET | Fetch results for session |

### 10.2 Request/Response Examples

**Create Session:**
```json
POST /api/session
Response: { "sessionId": "uuid-here" }
```

**Record Response:**
```json
POST /api/response
Body: {
  "sessionId": "uuid",
  "questionId": "CAL_01",
  "value": 4,
  "responseTimeMs": 3200
}
```

**Calculate:**
```json
POST /api/calculate
Body: { "sessionId": "uuid" }
Response: { "success": true, "profileId": "uuid" }
```

---

## 11. Technical Stack

| Component | Technology |
|-----------|------------|
| Framework | Next.js 14 (App Router) |
| Language | TypeScript |
| Database | Supabase (PostgreSQL) |
| Styling | Tailwind CSS + custom "Arcane" theme |
| Deployment | Vercel |
| Auth | Anonymous sessions (no login) |

### 11.1 Key Files

```
src/
├── app/
│   ├── page.tsx                    # Landing
│   ├── assessment/
│   │   ├── vibe/page.tsx           # Swiper
│   │   ├── cognitive/page.tsx      # Questions
│   │   ├── behavioral/page.tsx     # Questions
│   │   └── processing/page.tsx     # Calculation
│   └── results/[id]/page.tsx       # Results
│
└── lib/
    ├── types.ts                    # TypeScript interfaces
    ├── scoring.ts                  # Disposition calculation
    ├── matching.ts                 # 4-layer algorithm
    └── identity.ts                 # Familiar/Guild assignment
```

---

## 12. HESA Data Standards

### 12.1 Key Identifiers

| Standard | Description | Example |
|----------|-------------|---------|
| UKPRN | 8-digit provider ID | 10007789 |
| KISCOURSEID | Course ID within provider | AB1234 |
| HECoS | 6-digit subject code | 100329 |
| CAH | 3-level subject hierarchy | CAH01-01-01 |

### 12.2 Data Quality

```
Total courses:           28,520
Universities:            ~280
Courses with NSS:        ~71%
Courses with employment: ~90%
Courses with salary:     ~81%
Average completeness:    0.9
```

---

## 13. Environment & Deployment

### 13.1 Environment Variables

```env
NEXT_PUBLIC_SUPABASE_URL=your_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_key
```

### 13.2 Local Development

```bash
git clone https://github.com/sjsenglish/bo_v1_profile
cd bo_v1_profile
npm install
npm run dev
```

### 13.3 Database Setup (Fresh)

```bash
# In Supabase SQL Editor, run in order:
seeds/001_schema.sql
seeds/002_questions.sql
seeds/003_vibe_cards.sql
seeds/004_identity.sql
seeds/005_indexes.sql

# Then import courses via script or bulk insert
```

---

## Appendix A: Glossary

| Term | Definition |
|------|------------|
| σ (Sigma) | Uncertainty in measurement (lower = more confident) |
| CAH | Common Aggregation Hierarchy (subject grouping) |
| HESA | Higher Education Statistics Agency |
| HECoS | Higher Education Classification of Subjects |
| LEO | Longitudinal Education Outcomes (salary data) |
| NSS | National Student Survey |
| Provenance | Source of a measurement (MEASURED, PROXIED, PRIOR) |
| UKPRN | UK Provider Reference Number |

---

## Appendix B: Version History

| Version | Date | Key Changes |
|---------|------|-------------|
| 8.0 | 1 Jan 2025 | Process documentation, research integration, user feedback incorporation |
| 7.0 | 31 Dec 2024 | Supercurricular system, truth reconciliation |
| 6.2 | 29 Dec 2024 | Diversity constraint, quality weighting, per-course modifiers |
| 6.0 | 28 Dec 2024 | HESA integration, 4-layer matching, identity system |

---

**END OF SPECIFICATION**
