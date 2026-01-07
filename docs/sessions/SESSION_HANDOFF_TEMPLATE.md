# ExamRizz Arena — Session Handoff Template

**Date:** [Fill in]  
**Previous Session:** [Link to chat]  
**Current Status:** [What's working / what's in progress]

---

## Core Architecture (Always Reference This)

### Results Page Structure (4 Essential Sections)
1. **Profile** - Familiar, Guild, dispositions, precision score
2. **Courses** - Top 100 matches from bo_v1_courses
3. **Careers** - Career pathways (from `careers` table, NOT `bo_v1_careers`)
4. **Supercurriculars** - 178 activities from `bo_v1_supercurriculars`

### Database Tables (13 Core for MVP)

**Assessment Flow:**
- `bo_v1_sessions` - Progress tracking
- `bo_v1_profiles` - Student characteristics (10 dispositions)
- `bo_v1_vibe_cards` / `bo_v1_vibe_swipes`
- `bo_v1_questions` / `bo_v1_diagnostic_responses`
- `bo_v1_mini_sample_items` / `bo_v1_mini_sample_responses`

**Results Display:**
- `bo_v1_courses` (28,520 UK courses from HESA)
- `careers` (NOT bo_v1_ prefix!) - Career pathways
- `bo_v1_supercurriculars` (178 activities)
- `bo_v1_supercurricular_course_links` (essential)
- `bo_v1_matches` / `bo_v1_match_feedback`

**Identity:**
- `bo_v1_familiars` / `bo_v1_guilds`

### Current Onboarding Flow (6 min)
```
Landing → Vibe Swiper (6 cards, 1 min)
→ Quick Scenarios (8 forced-choice, 2 min)
→ Mini-Samples (3 tasks, 4.5 min)
→ Processing (5 sec)
→ Profile/Results Page (shows all 4 sections)
```

**Precision:** Starts at 40% after onboarding, increases with sharpening activities (future).

---

## Key Design Decisions (DON'T CHANGE WITHOUT DISCUSSION)

| Decision | Status | Rationale |
|----------|--------|-----------|
| **10 dispositions** | FINAL | Database + code aligned, don't reduce to 7 |
| **Forced-choice scenarios** | IN PROGRESS | Replacing Likert scale (less fakeable) |
| **Mini-samples as core** | IMPLEMENTED | Novel differentiator, cluster signals |
| **6 active vibe cards** | NEEDS UPDATE | Currently 12, reduce to 6 |
| **Valorant aesthetic** | DESIGN GOAL | Game-like UI for profile/results |
| **Elite pushing philosophy** | CORE | Russell Group default, "where you'll thrive" |

---

## What's Built vs What Needs Building

### ✅ Built & Working
- Database schema (all core tables exist)
- Mini-sample items (3 foundation tasks seeded)
- Supercurriculars (178 activities seeded)
- Courses (28,520 from HESA)
- Vibe swiper (needs reduction to 6 cards)
- Current assessment flow (Likert-scale questions)

### 🚧 In Progress
- Forced-choice scenarios (content ready, table/UI not built)
- Mini-sample UI components (3 task types)
- Profile/Results page (structure exists, needs Valorant redesign)

### ❌ Not Built
- Quick Scenarios component (8 forced-choice A/B questions)
- Session tracking for new flow (missing columns)
- Matching algorithm update (needs to use cluster signals)

---

## Current Blockers / Open Questions

1. **Database:** Need to add session tracking columns for mini-samples
2. **Vibe cards:** Which 6 should stay active? (need subject diversity)
3. **Scenarios:** Should create new `bo_v1_scenarios` table or repurpose `bo_v1_questions`?
4. **Careers:** Using `careers` table (not `bo_v1_careers`) - confirm this is correct

---

## File Locations (Quick Reference)

**Key Docs:**
- `/mnt/project/MASTER_SPEC.md` - Source of truth
- `/mnt/project/FORCED_CHOICE_BANK.md` - Scenario content
- `/mnt/project/MATCHING_MODEL.md` - Algorithm logic
- `/mnt/project/DATA_DICTIONARY.md` - Column-level docs

**Seed Files:**
- `/mnt/project/001_schema.sql` - Core schema
- `/mnt/project/ALL_CLUSTERS.sql` - Supercurriculars (178 items)
- `/mnt/project/002_questions.sql` - Current Likert questions

**Code:**
- `/src/app/assessment/*` - Assessment flow pages
- `/src/lib/scoring.ts` - Disposition scoring
- `/src/lib/matching.ts` - Course matching algorithm

---

## What to Tell Next Claude

**Quick context:**
> "Continue ExamRizz Arena development. We're building the onboarding MVP (Vibe→Scenarios→Mini-samples→Results). Database schema is ready, need to build UI components and update matching algorithm. Key architectural decision: Keep 10 dispositions, not 7. Results page shows 4 sections: Profile, Courses, Careers, Supercurriculars. Read DATABASE_ARCHITECTURE.md for table details."

**Key files to review:**
1. DATABASE_ARCHITECTURE.md (just created - comprehensive table guide)
2. MASTER_SPEC.md (product spec)
3. FORCED_CHOICE_BANK.md (scenario content)

**Immediate tasks:**
1. Create migration files (session tracking + scenarios table + seed data)
2. Build Quick Scenarios UI component
3. Build Mini-Sample UI components
4. Update Profile/Results page

---

## Session Stats

**Tables in Database:** 13 core + many others (ignore non-MVP tables)  
**Supercurriculars Seeded:** 178 activities across 12 clusters  
**Courses Loaded:** 28,520 from HESA  
**Assessment Time:** ~6 min onboarding, optional sharpening later  
**Precision:** 40% initial → 70%+ unlocks familiar  

---

## Links to Past Conversations

[Add links to key chats as you find them useful]

- [Supercurriculars discussion](https://claude.ai/chat/5f999317-98bf-42da-b1ec-6a8abfc9e1d0)
- [Results page structure](https://claude.ai/chat/ede80c6d-2985-43e1-b93a-dcf0ae921b2d)
- [Careers integration](https://claude.ai/chat/81b33ade-a647-4bde-8bf7-b3d082793258)

---

**HOW TO USE THIS TEMPLATE:**

1. **Start of each session:** Upload this file
2. **During session:** Update "Current Status" section
3. **End of session:** Add new decisions to "Key Design Decisions"
4. **Link conversations:** Add chat URLs to "Links to Past Conversations"
5. **Save updated version:** Download and keep latest version

**File location:** Save as `CURRENT_SESSION_HANDOFF.md` in project root
