# ExamRizz Arena — Assessment Workflow (Final Spec)

**Version:** 2.0  
**Date:** 4 January 2025  
**Status:** Authoritative reference for implementation

---

## Overview

**Total Time:** 16 minutes  
**Completion:** Optional skip at any point with "Continue Later" option  
**Purpose:** Match students to university courses based on genuine fit, not just grades

---

## Assessment Structure

### STAGE 1: Vibe Swiper (2 mins)

**Format:** Swipe through 6 image cards  
**Interaction:** Left (doesn't resonate) / Right (resonates) / Skip  
**Purpose:** Capture subject and environment preferences quickly

**The 6 Cards:**

1. **Laboratory Setting** → Tags: STEM_LIFE, PRACTICAL, RESEARCH
2. **Hospital Ward** → Tags: HEALTHCARE, VOCATIONAL, CLINICAL
3. **Lecture Theatre** → Tags: ACADEMIC, TRADITIONAL, THEORETICAL
4. **Small Seminar Room** → Tags: DISCUSSION, COURSEWORK_HEAVY, INTENSIVE
5. **Art Studio** → Tags: CREATIVE, EXPRESSIVE, INDIVIDUAL
6. **Outdoor Fieldwork** → Tags: APPLIED, FIELDWORK, ACTIVE

**Output:**
- `vibe_tags[]` — Top resonating themes
- `subject_weights{}` — STEM_LIFE, HEALTHCARE, CREATIVE, etc. (0-1 scale)
- `environment_weights{}` — PRACTICAL, ACADEMIC, INTENSIVE, etc. (0-1 scale)

**Database:**
```sql
CREATE TABLE bo_v1_vibe_swipes (
  id UUID PRIMARY KEY,
  session_id UUID REFERENCES bo_v1_sessions,
  card_id TEXT NOT NULL,
  direction TEXT CHECK (direction IN ('LEFT', 'RIGHT', 'SKIP')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

### STAGE 2: Forced-Choice Scenarios (5 mins)

**Format:** 20 binary choice questions with slider  
**Time:** 8-10 seconds per question (soft limit, not enforced)  
**Interaction:** Click anywhere on line between Option A and Option B

**Disposition Coverage (2 items each):**

| Disposition | Questions | Type |
|-------------|-----------|------|
| **Social** | SOC_01, SOC_02 | PRIMARY |
| **Receptivity** | REC_01, REC_02 | PRIMARY |
| **Transfer** | TRF_01, TRF_02 | PRIMARY |
| **Structure** | STR_01, STR_02 | PRIMARY |
| **Depth** | DEP_01, DEP_02 | PRIMARY |
| **Tolerance** | TOL_01, TOL_02 | PRIMARY |
| **Precision** | PRE_01, PRE_02 | PRIMARY |
| **Calibration** | CAL_01, CAL_02 | PRIMARY |
| **Retrieval** | RET_01, RET_02 | PRIMARY |
| **Consistency** | CON_01, CON_02 | PRIMARY |

**Slider Scoring:**
- Position captured as 0-100 value
- Bands: Strong A (0-15), Moderate A (16-35), Lean A (36-50), Lean B (51-65), Moderate B (66-85), Strong B (86-100)
- Converts to disposition score: `((position - 50) / 50) × weight` per question
- Final score per disposition: Normalized to 0-100 scale

**Example Question (SOC_01):**
```
It's 10pm and you're stuck on a problem due tomorrow.

Message group chat          [====|======]          Grind through alone
to see if anyone's                                 — learn more that way
figured it out
```

**Database:**
```sql
CREATE TABLE bo_v1_scenarios (
  id TEXT PRIMARY KEY,
  dimension TEXT NOT NULL,
  scenario_context TEXT NOT NULL,
  option_a TEXT NOT NULL,
  option_b TEXT NOT NULL,
  a_indicates TEXT NOT NULL,
  b_indicates TEXT NOT NULL
);

CREATE TABLE bo_v1_scenario_responses (
  id UUID PRIMARY KEY,
  session_id UUID REFERENCES bo_v1_sessions,
  scenario_id TEXT NOT NULL,
  position INTEGER CHECK (position BETWEEN 0 AND 100),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

### STAGE 3: Mini-Sample Tasks (9 mins)

**Format:** 6 experiential tasks (90 seconds each)  
**Purpose:** Preview actual university work, measure capacity + enjoyment  
**Coverage:** One task per meta-cluster

**The 6 Meta-Clusters:**

1. **STEM-Technical** (Computing, Engineering, Maths)
2. **STEM-Scientific** (Physics, Chemistry, Biology, Medicine)
3. **Humanities** (History, English, Philosophy, Languages)
4. **Social Sciences** (Psychology, Economics, Sociology, Politics)
5. **Professional** (Law, Business, Medicine, Education)
6. **Creative** (Art, Design, Architecture, Media)

**Task Types:**

| Meta-Cluster | Task Type | Format | Example |
|--------------|-----------|--------|---------|
| STEM-Technical | Debugging/Diagnosis | MCQ | Fix watering system error |
| STEM-Scientific | Observation Analysis | MCQ | Explain unexpected mould growth |
| Humanities | Argument Flaw | MCQ | Identify flaw in historian's claim |
| Social Sciences | Hidden Assumption | Short response (50-100 words) | Find assumption in WFH policy |
| Professional | Competing Interests | Short response (50-100 words) | Prioritize doctor's schedule |
| Creative | Design Trade-off | Short response (50-100 words) | Choose poster design priority |

**Each Task Includes:**

1. **Stimulus** (scenario/problem)
2. **Question** (what to solve)
3. **90-second timer** (visible, not enforced)
4. **Response capture** (MCQ or short text)
5. **Follow-up 1:** Enjoyment rating (😫 😐 😊)
6. **Follow-up 2:** Career fit ("Could you do this daily?" 😫 😐 😊)

**Scoring:**

- **MCQ:** Binary 0/1 (correct/incorrect)
- **Short Response:** AI graded 0-3 scale
  - 0 = Off-topic or no answer
  - 1 = Relevant but weak reasoning
  - 2 = Good reasoning, some gaps
  - 3 = Excellent reasoning, clear logic

**Output Per Task:**
```typescript
{
  task_id: string,
  score: number,           // 0-3 scale
  time_taken: number,      // seconds
  enjoyment: number,       // -1, 0, 1
  career_fit: number,      // -1, 0, 1
  response_text?: string   // For short response tasks
}
```

**Database:**
```sql
CREATE TABLE bo_v1_mini_samples (
  id TEXT PRIMARY KEY,
  meta_cluster TEXT NOT NULL,
  task_type TEXT NOT NULL,
  stimulus TEXT NOT NULL,
  question TEXT NOT NULL,
  options JSONB,                -- For MCQ
  correct_answer TEXT,          -- For MCQ
  grading_criteria JSONB,       -- For short response
  time_limit_seconds INTEGER DEFAULT 90
);

CREATE TABLE bo_v1_mini_sample_responses (
  id UUID PRIMARY KEY,
  session_id UUID REFERENCES bo_v1_sessions,
  mini_sample_id TEXT REFERENCES bo_v1_mini_samples,
  response TEXT NOT NULL,
  score INTEGER CHECK (score BETWEEN 0 AND 3),
  time_taken_seconds INTEGER,
  enjoyment_rating INTEGER CHECK (enjoyment_rating IN (-1, 0, 1)),
  career_fit_rating INTEGER CHECK (career_fit_rating IN (-1, 0, 1)),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

### STAGE 4: Processing (30 seconds)

**Display:**
```
Analysing your profile...
✓ Disposition scores calculated
✓ Enjoyment patterns identified
✓ Pathway detected: [Healthcare/STEM/Humanities/etc.]
✓ Matching to 28,520 courses...
```

**Backend Computation:**

1. **Disposition Scores** (0-100 per dimension)
   - Calculate from forced-choice slider positions
   - Normalize to 0-100 scale

2. **Enjoyment Profile** (cluster preferences)
   - Mini-sample enjoyment ratings → cluster weights
   - Map -1/0/1 to preference scores

3. **Pathway Inference**
   - Detect pattern from enjoyment (e.g., STEM_SCI + SOCIAL_SCI + PROFESSIONAL = Healthcare)
   - Apply +15 bonus to matching courses in detected pathway

4. **Course Matching** (5-layer algorithm)
   - Layer 1: Capacity multiplier (placeholder 1.0 for now)
   - Layer 2: Enjoyment fit (0-60 points)
   - Layer 3: Disposition fit/friction (+30 to -40 points)
   - Layer 4: Quality bonus (+22 points max)
   - Layer 5: Pathway bonus (+15 points if match)

---

### STAGE 5: Results

**Two-Tier Display:**

**Tier 1: Top Matches (Elite Institutions)**
- Filtered to Russell Group only
- Ranked by overall fit score
- Shows 5-10 courses
- Message: "Best courses at top universities for your profile"

**Tier 2: Best Fit For You**
- No institution filter
- Pure fit optimization
- Shows 5-10 courses
- Message: "Courses that match your preferences most closely"

**Per Course Display:**
```
┌─────────────────────────────────────────────┐
│  OXFORD MEDICINE                            │
│  Overall Fit: 68/100                        │
│                                             │
│  Why this matches:                          │
│  ✓ Your enjoyment pattern suggests         │
│    healthcare pathway                       │
│  ✓ High receptivity (85) matches feedback- │
│    intensive training                       │
│                                             │
│  Honest challenges:                         │
│  ⚠ Demands high transfer thinking (60)     │
│    — you scored 45 (manageable gap)        │
│                                             │
│  Course details:                            │
│  • Entry: AAA • Duration: 6 years          │
│  • Satisfaction: 85% • Employment: 98%     │
│  • Avg salary (3yr): £52,000               │
└─────────────────────────────────────────────┘
```

---

## Pathway Inference Logic

**6 Career Pathways:**

| Pathway | Enjoyment Pattern | Boosts CAH Codes |
|---------|-------------------|------------------|
| Healthcare | STEM_SCI + SOCIAL_SCI + PROFESSIONAL | CAH01 (Medicine/Dentistry) |
| Pure STEM | STEM_TECH + STEM_SCI | CAH07, CAH09 (Sciences, Engineering, Maths) |
| Arts/Humanities | HUMANITIES + SOCIAL_SCI + CREATIVE | CAH14, CAH20, CAH21 (Languages, History, Arts) |
| Design/Architecture | STEM_TECH + CREATIVE | CAH13 (Architecture) |
| Law/Professional | SOCIAL_SCI + PROFESSIONAL + HUMANITIES | CAH16 (Law) |
| Quant Social Science | STEM_TECH + SOCIAL_SCI | CAH17, CAH04 (Economics, Psychology) |

**Detection Logic:**
- Pattern matches if ≥2 out of 3 clusters were enjoyed (rating = 1)
- No clusters were hated (rating = -1)
- Matching courses get +15 point bonus

---

## Skip & Continue Later Flow

**At any stage, student can:**

1. **Skip individual questions** → No score contribution, flag for wider uncertainty
2. **Continue Later** → Save progress, return to complete
3. **Finish Early** → Process with partial data, show disclaimer:

```
⚠️ You completed 15/25 questions
Your results are based on partial data and may be less accurate.
You can return anytime to answer remaining questions and
improve your match precision.

[CONTINUE TO RESULTS]  [ANSWER MORE NOW]
```

**Minimum Thresholds:**
- Vibe Swiper: 3/6 cards minimum
- Forced-Choice: 10/20 questions minimum
- Mini-Samples: 3/6 tasks minimum

Below minimums → Cannot generate results, prompt to answer more.

---

## Data Flow Summary

```
USER INPUT                    COMPUTED OUTPUT
─────────────────────────    ─────────────────────────
Vibe Swiper (6 swipes)    →  vibe_tags[], subject_weights{}
Forced-Choice (20 slider) →  10 disposition scores (0-100)
Mini-Samples (6 tasks)    →  enjoyment_profile{}, pathway
                             ↓
                          MATCHING ALGORITHM
                             ↓
                          68/100 fit score per course
                             ↓
                          Top 10 matches shown
```

---

## Database Schema Summary

**Core Tables:**
- `bo_v1_sessions` — Track assessment progress
- `bo_v1_profiles` — Final computed disposition scores
- `bo_v1_vibe_swipes` — Swipe responses
- `bo_v1_scenarios` — Forced-choice question bank
- `bo_v1_scenario_responses` — Slider position captures
- `bo_v1_mini_samples` — Task definitions
- `bo_v1_mini_sample_responses` — Task attempts + ratings
- `bo_v1_courses` — 28,520 UK courses with demand profiles
- `bo_v1_matches` — Saved match results

**Session Flags:**
```sql
vibe_completed BOOLEAN
scenarios_completed BOOLEAN
mini_samples_completed BOOLEAN
```

---

## Implementation Checklist

- [ ] Update vibe cards to 6 active (currently 12)
- [ ] Create `bo_v1_scenarios` table with 20 forced-choice items
- [ ] Create `bo_v1_mini_samples` table with 6 task definitions
- [ ] Build slider component for forced-choice
- [ ] Build mini-sample UI (MCQ + short response variants)
- [ ] Implement AI grading for short responses
- [ ] Build pathway inference function
- [ ] Update matching algorithm with rebalanced weights
- [ ] Build two-tier results display
- [ ] Add "Continue Later" save state

---

**Status:** Ready for implementation  
**Next Step:** Database migration + UI components  
**Reference Docs:** FORCED_CHOICE_BANK.md, MINI_SAMPLE_TASKS.md, MATCHING_MODEL.md
