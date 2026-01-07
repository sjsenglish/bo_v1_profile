# ExamRizz Arena — Database Architecture Guide

**Last Updated:** 3 January 2025  
**Database:** Supabase (PostgreSQL)  
**Namespace:** `bo_v1_*` tables

---

## Executive Summary

ExamRizz Arena uses **11 core tables** to power the university course matching system. The database tracks:
1. Student assessment progress (sessions)
2. Student profiles (dispositions, capacities, preferences)
3. University courses with demand profiles (28,520 courses)
4. Assessment content (questions, vibe cards, mini-samples)
5. Student responses and matches

**Design Principles:**
- Anonymous sessions (no user accounts for MVP)
- One session → One profile → Many responses → Many matches
- Content tables are read-only reference data
- Response tables capture student interactions

---

## Table Overview (11 Core Tables)

### Assessment Flow Tables (3)
1. **bo_v1_sessions** - Track assessment progress
2. **bo_v1_profiles** - Computed student characteristics
3. **bo_v1_matches** - Cached course recommendations

### Response Tables (3)
4. **bo_v1_vibe_swipes** - Vibe card preferences
5. **bo_v1_diagnostic_responses** - Scenario question answers
6. **bo_v1_mini_sample_responses** - Mini-sample task results

### Content Tables (5)
7. **bo_v1_courses** - University courses (HESA data)
8. **bo_v1_questions** - Assessment questions/scenarios
9. **bo_v1_vibe_cards** - Vibe swiper images
10. **bo_v1_mini_sample_items** - Mini-sample task definitions
11. **bo_v1_familiars** - Spirit animal definitions

### Supporting Tables (2)
12. **bo_v1_guilds** - Guild definitions
13. **bo_v1_match_feedback** - Student feedback on matches

---

## Data Flow Diagram

```
STUDENT LANDS ON SITE
       ↓
[CREATE SESSION] → bo_v1_sessions (id generated)
       ↓
┌──────────────────────────────────────┐
│   ASSESSMENT STAGES (in order)       │
├──────────────────────────────────────┤
│ 1. VIBE SWIPER (~1 min)             │
│    → bo_v1_vibe_cards (read)         │
│    → bo_v1_vibe_swipes (write)       │
│                                      │
│ 2. SCENARIOS (~2 min)                │
│    → bo_v1_questions (read)          │
│    → bo_v1_diagnostic_responses      │
│                                      │
│ 3. MINI-SAMPLES (~4.5 min)           │
│    → bo_v1_mini_sample_items (read)  │
│    → bo_v1_mini_sample_responses     │
└──────────────────────────────────────┘
       ↓
[CALCULATE PROFILE] → bo_v1_profiles (computed)
       ↓
[RUN MATCHING ALGORITHM]
       ↓
[SAVE MATCHES] → bo_v1_matches (top 100 courses)
       ↓
[SHOW RESULTS PAGE]
       ↓
[OPTIONAL: STUDENT FEEDBACK] → bo_v1_match_feedback
```

---

## Detailed Table Specifications

### 1. bo_v1_sessions

**Purpose:** Track each student's assessment progress through stages.

**Lifecycle:** Created when student starts, updated as they progress, marked complete when they finish.

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key, auto-generated |
| `created_at` | TIMESTAMPTZ | When session started |
| `completed_at` | TIMESTAMPTZ | When assessment finished (NULL until done) |
| `vibe_completed` | BOOLEAN | Vibe swiper done? |
| `scenarios_completed` | BOOLEAN | Forced-choice scenarios done? |
| `mini_samples_completed` | BOOLEAN | All 3 mini-samples done? |
| `questions_answered` | INTEGER | Total questions answered |
| `questions_skipped` | INTEGER | Total questions skipped |

**Relationships:**
- One session → One profile (`bo_v1_profiles.session_id`)
- One session → Many swipes (`bo_v1_vibe_swipes.session_id`)
- One session → Many responses (`bo_v1_diagnostic_responses.session_id`)
- One session → Many mini-sample responses (`bo_v1_mini_sample_responses.session_id`)
- One session → Many matches (`bo_v1_matches.session_id`)

**Data Flow:**
1. Created: When student lands on `/assessment/vibe`
2. Updated: After each stage completion
3. `completed_at` set: When student reaches results page

**Example Row:**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "created_at": "2025-01-03T10:30:00Z",
  "completed_at": null,
  "vibe_completed": true,
  "scenarios_completed": true,
  "mini_samples_completed": false,
  "questions_answered": 14,
  "questions_skipped": 0
}
```

---

### 2. bo_v1_profiles

**Purpose:** Store computed student characteristics from assessment responses.

**Lifecycle:** Created when assessment completes, updated if student does sharpening activities.

**Key Columns:**

**Identity:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key |
| `session_id` | UUID | Links to session (1:1 relationship) |
| `familiar_id` | TEXT | Spirit animal ID (unlocked at 70% precision) |
| `guild_id` | TEXT | Guild assignment |

**Vibe Output:**
| Column | Type | Description |
|--------|------|-------------|
| `vibe_tags` | TEXT[] | Tags from right-swipes (e.g., ['analytical', 'collaborative']) |
| `subject_weights` | JSONB | Subject preferences `{science: 80, humanities: 40}` |

**Dispositions (10 total):**
Each disposition has TWO columns:
- `{name}_value` - Score 0-100
- `{name}_sigma` - Uncertainty/confidence (lower = more certain)

| Disposition | Type | Description |
|-------------|------|-------------|
| `calibration` | INTEGER | Self-awareness of performance (FLOOR) |
| `tolerance` | INTEGER | Frustration persistence (FLOOR) |
| `transfer` | INTEGER | Apply learning across contexts (FIT) |
| `precision` | INTEGER | Attention to detail (FIT) |
| `retrieval` | INTEGER | Memory recall preference (FIT) |
| `receptivity` | INTEGER | Openness to feedback (FIT) |
| `structure` | INTEGER | Need for organization (FIT) |
| `consistency` | INTEGER | Routine preference (FIT) |
| `social` | INTEGER | Collaborative vs independent (FIT) |
| `depth` | INTEGER | Specialist vs generalist (FIT) |

**Capacities (3 total):**
Each capacity has THREE columns:
- `{name}_value` - Score 0-100
- `{name}_sigma` - Uncertainty
- `{name}_provenance` - How measured: 'PRIOR' (default), 'PROXIED' (estimated), 'MEASURED' (tested)

| Capacity | Description |
|----------|-------------|
| `vrb` | Verbal reasoning |
| `qnt` | Quantitative reasoning |
| `spd` | Processing speed |

**Cluster Signals (from mini-samples):**
| Column | Type | Description |
|--------|------|-------------|
| `cluster_preferences` | JSONB | Enjoyment ratings per cluster `{STEM: 3, Humanities: 1, Analytical: 2}` |
| `cluster_capabilities` | JSONB | Performance scores per cluster `{STEM: 85, Humanities: 60, Analytical: 72}` |

**Precision Tracking:**
| Column | Type | Description |
|--------|------|-------------|
| `precision_score` | INTEGER | Overall confidence 0-100 (starts at 40% after onboarding) |
| `precision_tier` | TEXT | FOUNDATION (<70%), STANDARD (70-85%), ELITE (>85%) |

**Relationships:**
- One profile → One session (`session_id` UNIQUE)
- One profile → One familiar (`familiar_id` references `bo_v1_familiars.id`)
- One profile → One guild (`guild_id` references `bo_v1_guilds.id`)

**Data Flow:**
1. Created: When assessment completes (after mini-samples)
2. Populated: Scoring algorithm computes disposition scores from responses
3. Updated: If student completes sharpening activities (precision_score increases)

**Example Row:**
```json
{
  "id": "abc123...",
  "session_id": "def456...",
  "vibe_tags": ["analytical", "collaborative", "applied"],
  "calibration": 72,
  "calibration_sigma": 15,
  "tolerance": 58,
  "tolerance_sigma": 18,
  "cluster_preferences": {"STEM": 3, "Humanities": 1, "Analytical": 2},
  "cluster_capabilities": {"STEM": 82, "Humanities": 45, "Analytical": 70},
  "precision_score": 42,
  "precision_tier": "FOUNDATION",
  "familiar_id": null
}
```

---

### 3. bo_v1_courses

**Purpose:** Store all UK university courses with demand profiles for matching.

**Data Source:** HESA Discover Uni dataset (official government data)

**Row Count:** 28,520 courses

**Key Columns:**

**Identifiers:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT | Primary key (UKPRN + KIS course ID) |
| `ukprn` | TEXT | UK Provider Reference Number (institution ID) |
| `ucas_code` | TEXT | UCAS course code |

**Basic Info:**
| Column | Type | Description |
|--------|------|-------------|
| `university` | TEXT | Institution name |
| `course_name` | TEXT | Full course title |
| `degree_type` | TEXT | BSc, BA, MEng, etc. |
| `duration_years` | INTEGER | Course length |
| `russell_group` | BOOLEAN | Elite university? |
| `subject_area` | TEXT | Subject classification |

**Entry Requirements:**
| Column | Type | Description |
|--------|------|-------------|
| `typical_offer` | TEXT | e.g., "AAA" or "ABB" |
| `ucas_points` | INTEGER | Tariff points |

**Outcomes (from HESA):**
| Column | Type | Description |
|--------|------|-------------|
| `nss_overall` | INTEGER | National Student Survey score 0-100 |
| `employment_rate` | INTEGER | % employed 15 months after |
| `continuation_rate` | INTEGER | % continuing to year 2 |
| `median_salary_3yr` | INTEGER | £ salary 3 years after graduation |

**Teaching Structure:**
| Column | Type | Description |
|--------|------|-------------|
| `assessment_exam_pct` | INTEGER | % assessed by exams |
| `assessment_coursework_pct` | INTEGER | % assessed by coursework |
| `scheduled_hours` | INTEGER | Hours per week of scheduled teaching |

**Disposition Demands (10 columns):**
Each course has demand scores (0-100) for all 10 dispositions:
| Column | Description |
|--------|-------------|
| `demand_calibration` | How much self-awareness matters |
| `demand_tolerance` | How much persistence matters |
| `demand_transfer` | How much cross-context thinking matters |
| `demand_precision` | How much attention to detail matters |
| `demand_retrieval` | How much memory recall matters |
| `demand_receptivity` | How much feedback openness matters |
| `demand_structure` | How much organization matters |
| `demand_consistency` | How much routine matters |
| `demand_social` | How much collaboration matters |
| `demand_depth` | How much specialization matters |

**Relationships:**
- Many courses → Many matches (via `bo_v1_matches.course_id`)

**Data Flow:**
1. Imported: Via seed file from HESA dataset
2. Updated: Manually when new HESA data released (annually)
3. Read: By matching algorithm to find compatible courses

**Example Row:**
```json
{
  "id": "10007785_C100_BSC_FT",
  "university": "Imperial College London",
  "course_name": "Computer Science BSc",
  "ucas_code": "G400",
  "russell_group": true,
  "typical_offer": "A*A*A",
  "ucas_points": 168,
  "nss_overall": 85,
  "employment_rate": 95,
  "demand_calibration": 75,
  "demand_tolerance": 70,
  "demand_transfer": 85,
  "demand_precision": 80,
  "demand_social": 40
}
```

---

### 4. bo_v1_vibe_swipes

**Purpose:** Record each swipe during vibe swiper stage.

**Lifecycle:** Created when student swipes a card (LEFT/RIGHT/SKIP).

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key |
| `session_id` | UUID | Which session |
| `card_id` | TEXT | Which card (references `bo_v1_vibe_cards.id`) |
| `direction` | TEXT | 'LEFT', 'RIGHT', or 'SKIP' |
| `created_at` | TIMESTAMPTZ | When swiped |

**Relationships:**
- Many swipes → One session (`session_id`)
- Many swipes → One card (`card_id` references `bo_v1_vibe_cards.id`)

**Data Flow:**
1. Created: When student swipes
2. Aggregated: After vibe stage completes, tags from RIGHT swipes → `bo_v1_profiles.vibe_tags`

**Example Rows:**
```json
[
  {"session_id": "abc...", "card_id": "vc_01", "direction": "RIGHT"},
  {"session_id": "abc...", "card_id": "vc_02", "direction": "LEFT"},
  {"session_id": "abc...", "card_id": "vc_03", "direction": "SKIP"}
]
```

---

### 5. bo_v1_diagnostic_responses

**Purpose:** Record answers to forced-choice scenario questions.

**Lifecycle:** Created when student answers each scenario.

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key |
| `session_id` | UUID | Which session |
| `question_id` | TEXT | Which scenario (references `bo_v1_questions.id`) |
| `value` | INTEGER | Answer: 1-5 for Likert OR will change to TEXT for A/B choice |
| `skipped` | BOOLEAN | Did they skip? |
| `response_time_ms` | INTEGER | How long to answer |
| `created_at` | TIMESTAMPTZ | When answered |

**Relationships:**
- Many responses → One session (`session_id`)
- Many responses → One question (`question_id`)

**Data Flow:**
1. Created: When student answers question
2. Aggregated: After scenarios complete, responses → disposition scores in `bo_v1_profiles`

**Current State:** Stores Likert responses (1-5)
**Future State:** Will store forced-choice responses ('A' or 'B')

**Example Row (current):**
```json
{
  "session_id": "abc...",
  "question_id": "CAL_01",
  "value": 4,
  "skipped": false,
  "response_time_ms": 3200
}
```

**Example Row (future forced-choice):**
```json
{
  "session_id": "abc...",
  "question_id": "TRA_01",
  "value": "A",  // or could use new column "choice"
  "response_time_ms": 2100
}
```

---

### 6. bo_v1_mini_sample_responses

**Purpose:** Record student performance on mini-sample tasks.

**Lifecycle:** Created when student completes each mini-sample task.

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key |
| `session_id` | UUID | Which session |
| `task_id` | TEXT | Which mini-sample (references `bo_v1_mini_sample_items.id`) |
| `responses` | JSONB | Answers to all questions `{q1: "answer", q2: ["a","c"]}` |
| `correctness` | JSONB | Which answers correct `{q1: true, q2: false}` |
| `score_percentage` | INTEGER | 0-100 calculated from correctness |
| `time_taken_seconds` | INTEGER | Total time on task |
| `overtime` | BOOLEAN | Did they exceed 90s? |
| `enjoyment_rating` | INTEGER | 1=😫, 2=😐, 3=😊 |
| `enjoyment_feedback` | TEXT | Optional text feedback |
| `created_at` | TIMESTAMPTZ | When completed |

**Relationships:**
- Many responses → One session (`session_id`)
- Many responses → One task (`task_id` references `bo_v1_mini_sample_items.id`)

**Data Flow:**
1. Created: When student completes task + enjoyment rating
2. Aggregated: After all 3 mini-samples, scores/enjoyment → `bo_v1_profiles.cluster_*` columns

**Example Row:**
```json
{
  "session_id": "abc...",
  "task_id": "MS_CODE_01",
  "responses": {
    "q1": "b",
    "q2": "12",
    "q3": "sum of factors"
  },
  "correctness": {
    "q1": true,
    "q2": true,
    "q3": false
  },
  "score_percentage": 67,
  "time_taken_seconds": 82,
  "overtime": false,
  "enjoyment_rating": 3,
  "enjoyment_feedback": "Liked the challenge!"
}
```

---

### 7. bo_v1_matches

**Purpose:** Cache course recommendations for each session.

**Lifecycle:** Created after assessment completes, when matching algorithm runs.

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key |
| `session_id` | UUID | Which session |
| `course_id` | TEXT | Which course (references `bo_v1_courses.id`) |
| `score` | INTEGER | Overall match score 0-100 |
| `fit_score` | INTEGER | Disposition fit score 0-100 |
| `friction` | TEXT | Disposition mismatch summary |
| `explanation` | JSONB | Why this match (for UI display) |
| `rank` | INTEGER | 1 = best match, 2 = second best, etc. |
| `created_at` | TIMESTAMPTZ | When calculated |

**Relationships:**
- Many matches → One session (`session_id`)
- Many matches → One course (`course_id`)
- Unique constraint: One match per (session, course) pair

**Data Flow:**
1. Created: After assessment completes, matching algorithm calculates top 100 courses
2. Read: Results page displays top matches
3. Updated: If student does sharpening activities (recalculated with higher precision)

**Example Row:**
```json
{
  "session_id": "abc...",
  "course_id": "10007785_C100_BSC_FT",
  "score": 87,
  "fit_score": 82,
  "friction": "Low social demand vs high social preference",
  "rank": 1,
  "explanation": {
    "cognitive_fit": "Strong match",
    "disposition_fit": "Excellent alignment",
    "vibe_bonus": 5
  }
}
```

---

### 8. bo_v1_questions

**Purpose:** Store assessment questions/scenarios.

**Current State:** 40 Likert-scale questions
**Target State:** Will add forced-choice scenarios

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT | Primary key (e.g., 'CAL_01', 'TRA_02') |
| `dimension` | TEXT | Which disposition (CAL, TOL, TRA, etc.) |
| `tier` | TEXT | Difficulty: CORE, EXTENDED, DEEP, EXPERT |
| `text` | TEXT | Question text |
| `reverse_scored` | BOOLEAN | Reverse scoring? |
| `active` | BOOLEAN | Show in assessment? |

**Future columns needed for forced-choice:**
| Column | Type | Description |
|--------|------|-------------|
| `option_a` | TEXT | First choice |
| `option_b` | TEXT | Second choice |
| `a_indicates` | TEXT | What choosing A means (e.g., 'high_transfer') |
| `b_indicates` | TEXT | What choosing B means |

**Relationships:**
- Many questions → Many responses (`bo_v1_diagnostic_responses.question_id`)

**Data Flow:**
1. Seeded: Via migration with content
2. Read: By assessment UI to display questions
3. Updated: Rarely (only when improving question quality)

**Example Row (current Likert):**
```json
{
  "id": "CAL_01",
  "dimension": "CALIBRATION",
  "tier": "CORE",
  "text": "Before getting my test back, I usually know roughly how well I did",
  "reverse_scored": false,
  "active": true
}
```

**Example Row (future forced-choice):**
```json
{
  "id": "TRA_01",
  "dimension": "TRANSFER",
  "text": "You've learned a technique in maths. It could help with physics.",
  "option_a": "Actively look for where else this applies",
  "option_b": "Stick to using it where you learned it",
  "a_indicates": "high_transfer",
  "b_indicates": "low_transfer"
}
```

---

### 9. bo_v1_vibe_cards

**Purpose:** Store vibe swiper card images and tag mappings.

**Row Count:** 12 total, **6 active** (for MVP)

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT | Primary key (e.g., 'vc_01', 'vc_02') |
| `image_url` | TEXT | Cloudinary URL or path |
| `alt_text` | TEXT | Image description for accessibility |
| `right_tags` | TEXT[] | Tags added if swiped RIGHT |
| `left_tags` | TEXT[] | Tags added if swiped LEFT |
| `sort_order` | INTEGER | Display order |
| `active` | BOOLEAN | Show in vibe swiper? |

**Relationships:**
- Many cards → Many swipes (`bo_v1_vibe_swipes.card_id`)

**Data Flow:**
1. Seeded: Via migration
2. Read: By vibe swiper UI (loads WHERE active = TRUE)
3. Updated: Rarely (only when changing card set)

**Example Row:**
```json
{
  "id": "vc_01",
  "image_url": "/images/vibe/analytical-lab.jpg",
  "alt_text": "Student working in analytical chemistry lab",
  "right_tags": ["analytical", "experimental", "STEM"],
  "left_tags": ["theoretical", "humanities"],
  "sort_order": 1,
  "active": true
}
```

---

### 10. bo_v1_mini_sample_items

**Purpose:** Store mini-sample task definitions.

**Row Count:** 3 foundation tasks (Code Trace, Source Analysis, Data Interpretation)

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT | Primary key (e.g., 'MS_CODE_01') |
| `task_type` | TEXT | CODE_TRACE, SOURCE_ANALYSIS, DATA_INTERPRETATION |
| `tier` | TEXT | FOUNDATION, CHALLENGE |
| `stimulus` | TEXT | Task content (code snippet, passage, or data table) |
| `questions` | JSONB | Array of questions with options |
| `time_limit_seconds` | INTEGER | Default 90 |
| `cluster` | TEXT | STEM, HUMANITIES, ANALYTICAL |
| `active` | BOOLEAN | Show in assessment? |

**Questions JSONB format:**
```json
[
  {
    "question": "What does this function calculate?",
    "type": "MCQ",
    "options": ["Sum of factors", "Prime check", "Fibonacci", "Factorial"],
    "correct": 0
  },
  {
    "question": "What is the output?",
    "type": "TEXT_INPUT",
    "correct": "28"
  }
]
```

**Relationships:**
- Many items → Many responses (`bo_v1_mini_sample_responses.task_id`)

**Data Flow:**
1. Seeded: Via migration
2. Read: By mini-sample UI to display tasks
3. Updated: Rarely (only when improving task quality)

**Example Row:**
```json
{
  "id": "MS_CODE_01",
  "task_type": "CODE_TRACE",
  "tier": "FOUNDATION",
  "stimulus": "def mystery(n):\n    result = 0\n    for i in range(1, n):\n        if n % i == 0:\n            result += i\n    return result",
  "questions": [...],
  "time_limit_seconds": 90,
  "cluster": "STEM",
  "active": true
}
```

---

### 11. bo_v1_familiars

**Purpose:** Define spirit animals assigned based on disposition profile.

**Row Count:** 14 familiars

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT | Primary key (e.g., 'phoenix', 'owl') |
| `name` | TEXT | Display name |
| `element` | TEXT | Fire, Water, Earth, Air |
| `tagline` | TEXT | Short description |
| `rarity` | TEXT | COMMON, RARE, LEGENDARY |
| `bias_dimensions` | TEXT[] | Which dispositions this familiar represents |

**Relationships:**
- Many familiars → Many profiles (`bo_v1_profiles.familiar_id`)

**Data Flow:**
1. Seeded: Via migration
2. Read: Assignment algorithm picks familiar based on dominant dispositions
3. Assigned: When student reaches 70%+ precision

**Example Row:**
```json
{
  "id": "phoenix",
  "name": "Phoenix",
  "element": "Fire",
  "tagline": "Resilient and transformative",
  "rarity": "RARE",
  "bias_dimensions": ["tolerance", "receptivity"]
}
```

---

### 12. bo_v1_guilds

**Purpose:** Define guilds (learning style archetypes).

**Row Count:** 4 guilds

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT | Primary key (e.g., 'architects', 'explorers') |
| `name` | TEXT | Display name |
| `motto` | TEXT | Guild philosophy |
| `formula` | JSONB | Which dispositions define this guild |

**Relationships:**
- Many guilds → Many profiles (`bo_v1_profiles.guild_id`)

**Data Flow:**
1. Seeded: Via migration
2. Read: Assignment algorithm uses formula to pick guild
3. Assigned: After assessment completes

**Example Row:**
```json
{
  "id": "architects",
  "name": "The Architects",
  "motto": "Build knowledge brick by brick",
  "formula": {
    "high": ["structure", "precision", "depth"],
    "low": ["social"]
  }
}
```

---

### 13. bo_v1_match_feedback

**Purpose:** Collect student feedback on course recommendations (especially wildcards).

**Key Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID | Primary key |
| `session_id` | UUID | Which session |
| `course_id` | TEXT | Which course (references `bo_v1_courses.id`) |
| `is_wildcard` | BOOLEAN | Was this a wildcard match? |
| `feedback_type` | TEXT | THUMBS_UP, THUMBS_DOWN |
| `reason_category` | TEXT | not_interested, wrong_subject, location, etc. |
| `reason_text` | TEXT | Optional free text |
| `created_at` | TIMESTAMPTZ | When submitted |

**Relationships:**
- Many feedback → One session (`session_id`)
- Many feedback → One course (`course_id`)

**Data Flow:**
1. Created: When student clicks thumbs up/down on results page
2. Analyzed: Used to improve matching algorithm over time

**Example Row:**
```json
{
  "session_id": "abc...",
  "course_id": "10007785_C100_BSC_FT",
  "is_wildcard": true,
  "feedback_type": "THUMBS_DOWN",
  "reason_category": "not_interested",
  "reason_text": "Don't want to do computer science actually"
}
```

---

## Tables NOT Needed for MVP

**These exist in your database but are NOT part of the core onboarding flow:**

### Capacity Testing (Future Sharpening Activities)
- `bo_v1_capacity_items` - Benchmark test items
- `bo_v1_capacity_responses` - Student responses to benchmarks
- `bo_v1_capacity_results` - Final capacity scores
- `bo_v1_cat_state` - Computerized Adaptive Testing state

### Experiential Tasks (Future Feature)
- `bo_v1_experiential_tasks` - Career-anchored tasks
- `bo_v1_experiential_responses` - Student task responses

### Supercurriculars (Separate Feature)
- `bo_v1_supercurriculars` - Enrichment activities
- `bo_v1_supercurricular_*` - Various supercurricular tables

### Advanced Features (Future)
- `bo_v1_quests` - Gamification quests
- `bo_v1_feed_items` - Social feed
- `bo_v1_assessment_resets` - Reset tracking
- `bo_v1_confidence_tracking` - Calibration tracking
- `bo_v1_benchmark_responses` - Old benchmark system
- And many more...

**Recommendation:** Ignore these for now. They're not breaking anything, but they're not needed for the onboarding MVP.

---

## Key Relationships Diagram

```
SESSION (1)
    │
    ├─→ PROFILE (1)
    │       ├─→ FAMILIAR (1)
    │       └─→ GUILD (1)
    │
    ├─→ VIBE_SWIPES (many)
    │       └─→ VIBE_CARDS (many)
    │
    ├─→ DIAGNOSTIC_RESPONSES (many)
    │       └─→ QUESTIONS (many)
    │
    ├─→ MINI_SAMPLE_RESPONSES (many)
    │       └─→ MINI_SAMPLE_ITEMS (many)
    │
    ├─→ MATCHES (many)
    │       └─→ COURSES (many)
    │
    └─→ MATCH_FEEDBACK (many)
            └─→ COURSES (many)
```

**Legend:**
- `(1)` = One-to-one relationship
- `(many)` = One-to-many relationship

---

## Data Integrity Rules

### Foreign Key Constraints
- `bo_v1_profiles.session_id` → `bo_v1_sessions.id` (CASCADE DELETE)
- `bo_v1_vibe_swipes.session_id` → `bo_v1_sessions.id` (CASCADE DELETE)
- `bo_v1_diagnostic_responses.session_id` → `bo_v1_sessions.id` (CASCADE DELETE)
- `bo_v1_mini_sample_responses.session_id` → `bo_v1_sessions.id` (CASCADE DELETE)
- `bo_v1_matches.session_id` → `bo_v1_sessions.id` (CASCADE DELETE)
- `bo_v1_match_feedback.session_id` → `bo_v1_sessions.id` (CASCADE DELETE)

**Implication:** Deleting a session deletes all associated data (responses, profile, matches).

### Unique Constraints
- `bo_v1_profiles.session_id` - One profile per session
- `bo_v1_matches(session_id, course_id)` - One match record per course per session

### Check Constraints
- `bo_v1_vibe_swipes.direction` IN ('LEFT', 'RIGHT', 'SKIP')
- `bo_v1_mini_sample_responses.enjoyment_rating` BETWEEN 1 AND 3
- `bo_v1_match_feedback.feedback_type` IN ('THUMBS_UP', 'THUMBS_DOWN')
- `bo_v1_mini_sample_items.task_type` IN ('CODE_TRACE', 'SOURCE_ANALYSIS', 'DATA_INTERPRETATION')

---

## Row Level Security (RLS)

**All tables have RLS enabled.**

**Anonymous access policies** (no authentication required):
- **INSERT:** sessions, profiles, vibe_swipes, diagnostic_responses, mini_sample_responses, matches, match_feedback
- **SELECT:** All tables (read-only for content tables)
- **UPDATE:** sessions, profiles

**Read-only tables:**
- courses, questions, vibe_cards, mini_sample_items, familiars, guilds

**Implication:** Students can create and view their own data without accounts.

---

## Storage Requirements

**Estimate for 10,000 students:**

| Table | Rows per Student | Total Rows | Est. Size |
|-------|-----------------|------------|-----------|
| sessions | 1 | 10,000 | 1 MB |
| profiles | 1 | 10,000 | 5 MB |
| vibe_swipes | 6 | 60,000 | 3 MB |
| diagnostic_responses | 8 | 80,000 | 4 MB |
| mini_sample_responses | 3 | 30,000 | 15 MB |
| matches | 100 | 1,000,000 | 50 MB |
| match_feedback | ~5 | 50,000 | 2 MB |
| **Dynamic total** | | **1,230,000** | **~80 MB** |

**Static content tables:**
| Table | Rows | Est. Size |
|-------|------|-----------|
| courses | 28,520 | 25 MB |
| questions | 8-40 | <1 MB |
| vibe_cards | 12 | <1 MB |
| mini_sample_items | 3 | <1 MB |
| familiars | 14 | <1 MB |
| guilds | 4 | <1 MB |
| **Static total** | **28,553** | **~28 MB** |

**Total for 10K students:** ~108 MB

---

## Common Queries

### 1. Get student's complete assessment data
```sql
SELECT 
  s.id as session_id,
  s.completed_at,
  p.*
FROM bo_v1_sessions s
LEFT JOIN bo_v1_profiles p ON p.session_id = s.id
WHERE s.id = :session_id;
```

### 2. Get student's top 10 matches
```sql
SELECT 
  m.rank,
  m.score,
  c.university,
  c.course_name,
  c.russell_group
FROM bo_v1_matches m
JOIN bo_v1_courses c ON c.id = m.course_id
WHERE m.session_id = :session_id
ORDER BY m.rank ASC
LIMIT 10;
```

### 3. Get mini-sample performance by cluster
```sql
SELECT 
  mi.cluster,
  AVG(mr.score_percentage) as avg_performance,
  AVG(mr.enjoyment_rating) as avg_enjoyment
FROM bo_v1_mini_sample_responses mr
JOIN bo_v1_mini_sample_items mi ON mi.id = mr.task_id
WHERE mr.session_id = :session_id
GROUP BY mi.cluster;
```

### 4. Count active vibe cards
```sql
SELECT COUNT(*) 
FROM bo_v1_vibe_cards 
WHERE active = TRUE;
```

### 5. Get disposition scores for a profile
```sql
SELECT 
  calibration, calibration_sigma,
  tolerance, tolerance_sigma,
  transfer, transfer_sigma,
  precision, precision_sigma,
  retrieval, retrieval_sigma,
  receptivity, receptivity_sigma,
  structure, structure_sigma,
  consistency, consistency_sigma,
  social, social_sigma,
  depth, depth_sigma
FROM bo_v1_profiles
WHERE session_id = :session_id;
```

---

## Migration Strategy

**When making database changes:**

1. **Create migration file** with timestamp: `YYYYMMDD_HHMMSS_description.sql`
2. **Include rollback** in comments at top
3. **Test locally** before production
4. **Apply to production** via Supabase dashboard or CLI
5. **Update this document** with changes

**Example migration naming:**
```
20250103_143000_add_mini_sample_session_tracking.sql
20250103_143100_create_scenarios_table.sql
20250103_143200_seed_forced_choice_scenarios.sql
```

---

## Maintenance Tasks

**Weekly:**
- Monitor session completion rates
- Check for orphaned matches (sessions with no profile)

**Monthly:**
- Archive old sessions (>90 days)
- Analyze match feedback patterns
- Review question performance (skip rates, response times)

**Quarterly:**
- Update course data from HESA
- Recalculate course demand profiles based on outcomes

**Annually:**
- Major schema updates if needed
- Backup full database
- Performance optimization (indexes, vacuum)

---

## Performance Considerations

**Indexes to maintain:**
- Primary keys (automatic)
- Foreign keys (add manually for performance)
- `bo_v1_courses.russell_group` (for filtering elite universities)
- `bo_v1_courses.subject_area` (for subject filtering)
- `bo_v1_matches(session_id, rank)` (for top matches queries)

**Query optimization:**
- Use `EXPLAIN ANALYZE` for slow queries
- Consider materialized views for complex aggregations
- Denormalize if needed (e.g., store top 3 matches in profile)

---

## Security Notes

**Sensitive data:**
- No PII required for MVP (anonymous sessions)
- If adding user accounts later, encrypt email addresses
- GDPR compliance: Allow session deletion on request

**SQL injection prevention:**
- Always use parameterized queries
- Supabase client handles this automatically

**Rate limiting:**
- Consider rate limits on session creation (prevent spam)
- Limit match recalculations (expensive operation)

---

## Summary for Developers

**To understand the system, remember:**

1. **One session = One assessment journey**
   - Creates responses as student progresses
   - Generates one profile at end
   - Calculates matches once profile exists

2. **Content tables are static** (questions, cards, courses)
   - Updated rarely via migrations
   - Read-only for students

3. **Response tables are dynamic** (swipes, answers, mini-samples)
   - Written during assessment
   - Aggregated into profile

4. **Matches are cached**
   - Expensive to calculate
   - Stored once, updated only if profile changes

5. **Everything ties to session_id**
   - Session is the root entity
   - Delete session → Delete everything related

---

**End of Database Architecture Guide**

*For questions or clarifications, refer to DATA_DICTIONARY.md for column-level details.*
