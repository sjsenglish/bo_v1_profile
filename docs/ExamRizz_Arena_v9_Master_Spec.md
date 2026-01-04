# ExamRizz Arena — Master Specification v9
*Updated: 4 January 2025*

## Overview

UK university course matching platform for sixth-form students (ages 16-18). Profiles students across learning dispositions and cognitive capacities, matches them to 28,520+ real HESA courses.

**Philosophy:** Elite pushing. Recommend best universities students can realistically attend. Russell Group default. Brutal honesty about fit, delivered supportively.

**Tech:** Next.js 14, TypeScript, Supabase, Tailwind (Arcane theme)

---

## Assessment Model

### Current Design (as of Jan 4, 2025)

**3-part assessment:**

1. **Vibe Swiper** (2 mins) — 6 image cards for interest discovery
2. **Forced-Choice Questions** (5 mins) — 20 scenarios measuring 10 learning dispositions
3. **Mini-Sample Tasks** (9 mins) — 6 experiential tasks across meta-clusters

**Total:** 16 minutes end-to-end

### 10 Learning Dispositions

Measured via forced-choice questions (2 items each):

- **Transfer** — Apply knowledge to new contexts
- **Receptivity** — Openness to feedback
- **Tolerance** — Persistence through difficulty
- **Precision** — Attention to detail
- **Calibration** — Self-assessment accuracy
- **Depth** — Desire to explore beyond requirements
- **Structure** — Preference for planning vs flexibility
- **Social** — Collaborative vs independent work
- **Consistency** — Routine adherence
- **Retrieval** — Active recall vs passive review

### 6 Meta-Clusters

Measured via mini-sample tasks (1 task each):

- **STEM-Technical** — Debugging/diagnosis (90s, MCQ)
- **STEM-Scientific** — Unexpected observation (90s, MCQ)
- **Humanities** — Argument flaw (90s, MCQ)
- **Social Sciences** — Hidden assumption (90s, short response)
- **Professional** — Competing interests (90s, short response)
- **Creative** — Design trade-off (90s, short response)

Each mini-sample includes enjoyment + career fit follow-ups.

### Forced-Choice Format

Slider-style scale between Option A and Option B:
- User clicks anywhere on line
- Position captured 0-100
- Scoring bands: Strong A (0-15), Moderate A (16-35), Lean A (36-50), Lean B (51-65), Moderate B (66-85), Strong B (86-100)
- Fallback to binary (left half = A, right half = B) if granularity adds no value

---

## Matching Algorithm

**4-layer gravity model:**

1. **Cognitive Fit** — VRB/QNT/SPD alignment with course demands
2. **Behavioral Friction** — Disposition mismatch penalties
3. **Vibe Bonus** — Interest/appeal multiplier
4. **Quality Weighting** — Russell Group bonus, student satisfaction, employment outcomes

**Key mechanisms:**
- Diversity constraints prevent single-subject dominance
- Russell Group 15% bonus for elite pushing
- Per-course disposition modifiers derived from CAH codes
- Mini-sample performance = cluster fit proxy

See `MATCHING_MODEL.md` for full algorithm spec.

---

## Database Schema

**Core tables:** (prefix: `bo_v1_`)

- `questions` — Vibe swiper cards (6 cards)
- `scenarios` — Forced-choice questions (20 items)
- `mini_samples` — Mini-sample task specs (6 tasks)
- `mini_sample_responses` — User responses + scores
- `capacity_items` — Benchmark questions (72 items, deferred for MVP)
- `courses` — HESA course data (28,520 records)
- `supercurriculars` — Enrichment activities (178 items across 12 clusters)

**HESA integration:**
- UKPRN identifiers for institutions
- CAH subject classification codes
- Student satisfaction, employment, salary data
- Russell Group flags

See SQL files 001-006 for schema + `ALL_CLUSTERS.sql` for supercurricular data.

---

## Question Design Principles

**Forced-choice scenarios:**
- Both options equally valid (no "good student" answer)
- Real trade-off or cost to each choice
- Concrete UK sixth-form context (EPQ, UCAS, mock exams)
- No virtue-signalling language
- Construct hidden from test-taker

**Mini-sample tasks:**
- Experiential preview of university work
- No prior subject knowledge required
- Genuine difficulty differentiation
- 90-second time limit
- AI grading for short response (0-3 scale)

See `FORCED_CHOICE_BANK.md` for all current questions.  
See `STUDENT_SIMULATION_PROMPT.md` for testing tool.

---

## Results Presentation

**Two-tier system:**

1. **Top Matches** — Best Russell Group courses student can realistically attend (elite pushing)
2. **Best Fit For You** — Highest disposition + enjoyment fit regardless of prestige

**Each match shows:**
- University name + logo
- Course title
- Fit score breakdown (cognitive, behavioral, vibe, quality)
- Key disposition alignments
- Student satisfaction + employment outcomes
- Relevant supercurriculars

---

## Gamification

**Spirit Familiars:** 12 creatures aligned with academic clusters  
**Guilds:** Team-based challenges  
**XP System:** Progression through assessment + activities  

Details in main codebase. Not critical for MVP.

---

## Implementation Status

**✓ Complete:**
- Landing page, vibe swiper, results page deployed
- 28,520 courses in DB with HESA data
- Matching algorithm functional
- 178 supercurriculars linked to courses
- Forced-choice questions designed (20 items)
- Mini-sample tasks designed (6 tasks)

**⚠️ In Progress:**
- Database migration for new questions
- Slider UI component
- Mini-sample UI + timer
- AI grading integration

**⏳ Deferred:**
- Capacity benchmarks (VRB/QNT/SPD)
- Institutional test for universities
- XP + familiar evolution

---

## Key Files Reference

- `MATCHING_MODEL.md` — Full algorithm specification
- `DATA_DICTIONARY.md` — Database field definitions
- `FORCED_CHOICE_BANK.md` — All current assessment questions
- `RESEARCH_FOUNDATION.md` — Academic basis for design
- `ASSESSMENT_FRAMEWORK_MAIN.docx` — 120-page research doc
- `BACKLOG.md` — Active todo list
- `HANDOFF_2025-01-01.md` — Latest session handoff

---

## Open Questions

1. When benchmarks are added, initial flow or optional sharpeners?
2. How should mini-sample performance weight against forced-choice dispositions?
3. If someone skips mini-sample, exclude cluster or show with uncertainty flag?
4. AI grading consistency — validate against human raters before launch?

---

**Version:** 9.0  
**Last Major Update:** Question redesign (Jan 4, 2025)  
**Next Priority:** Database migration + slider component
