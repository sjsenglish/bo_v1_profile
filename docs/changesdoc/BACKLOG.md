# ExamRizz Arena — Backlog

Prioritised list of planned work. Items move to CHANGELOG.md when shipped.

**Last Updated:** 1 January 2025

---

## Priority Legend

| Priority | Meaning | Timeline |
|----------|---------|----------|
| P0 | Critical — blocking user value | This week |
| P1 | High — significantly improves product | Next 2 weeks |
| P2 | Medium — meaningful improvement | This month |
| P3 | Low — nice to have | Future |

---

## P0: Critical

### 1. Debug Course Matching Algorithm
**Problem:** User testing feedback: "Course matches very random"  
**Hypothesis:** Data flow issue between disposition scores and matching algorithm, or algorithm weighting not tuned correctly  
**Acceptance Criteria:**
- [ ] Add logging to trace disposition → demand → score flow
- [ ] Create test profiles with expected matches
- [ ] Verify CAH-based demands are loading correctly
- [ ] Verify per-course modifiers are being applied
- [ ] Confirm quality weighting and diversity constraint work

**Effort:** 1-2 sessions  
**Dependencies:** None

---

### 2. Question Redesign (Forced-Choice)
**Problem:** User feedback: "Questions too hypothetical... I'd just be making it up"  
**Research Support:** Forced-choice reduces faking by d=0.34 vs Likert (Salgado et al., 2021)  
**Acceptance Criteria:**
- [ ] Design 8-12 forced-choice scenario questions
- [ ] Each question has two equally socially desirable options
- [ ] Concrete situations, not abstract self-ratings
- [ ] Maps to key dispositions: CALIBRATION, TOLERANCE, CONSISTENCY
- [ ] Replace Section 1 (cognitive Likert) with forced-choice

**Effort:** 2-3 sessions  
**Dependencies:** Finalize disposition consolidation decision

**Example Format:**
```
Think about your last important test. Which is closer to your experience?
A: I walked out knowing roughly how I'd done — and I was right within a grade
B: I genuinely couldn't tell until I got the paper back
```

---

### 3. Fix Results Page Flash Error
**Problem:** React hydration mismatch causes visual flash  
**Acceptance Criteria:**
- [ ] Identify hydration mismatch source
- [ ] Fix server/client rendering inconsistency
- [ ] No visible flash on page load

**Effort:** 0.5 session  
**Dependencies:** None

---

## P1: High Priority

### 4. Capacity Benchmark UI
**Problem:** 72 capacity items exist in database but no frontend to use them  
**Research Support:** Cognitive ability is the strongest predictor of academic success (r=0.50-0.81)  
**User Feedback:** "Section 3 too short" — users want MORE capacity testing  
**Acceptance Criteria:**
- [ ] VRB section: 5-7 items, ~5 minutes
- [ ] QNT section: 5-7 items, ~5 minutes  
- [ ] Item presentation UI (matches existing design)
- [ ] Response recording to `bo_v1_benchmark_responses`
- [ ] Score calculation with IRT or simple % correct
- [ ] Integrate calibration confidence prompts post-item

**Effort:** 2-3 sessions  
**Dependencies:** Validate existing items are correctly formatted

---

### 5. Calibration Confidence Integration
**Problem:** CALIBRATION currently measured via self-report (fakeable)  
**Research Support:** Metacognitive accuracy from actual performance is more valid  
**Acceptance Criteria:**
- [ ] After each capacity item, ask: "How confident are you that you got this right?"
- [ ] Compare confidence to actual correctness
- [ ] Calculate calibration score from confidence-accuracy correlation
- [ ] Replace or supplement self-report CALIBRATION with measured calibration

**Effort:** 1 session  
**Dependencies:** Capacity Benchmark UI (#4)

---

### 6. Supercurricular API Endpoints
**Problem:** 178 supercurriculars in database, no way to access them  
**Acceptance Criteria:**
- [ ] `GET /api/supercurriculars` — list by cluster/type
- [ ] `GET /api/supercurriculars/[id]` — single item detail
- [ ] `POST /api/supercurriculars/recommend` — get recommendations for profile
- [ ] Filtering by year_group, difficulty, time_commitment

**Effort:** 1-2 sessions  
**Dependencies:** None

---

### 7. Supercurricular UI on Results Page
**Problem:** No way for users to see supercurricular recommendations  
**Acceptance Criteria:**
- [ ] "Recommended Reading & Activities" section on results page
- [ ] 3-5 items per matched course cluster
- [ ] Filter by difficulty appropriate to profile
- [ ] Links to external resources

**Effort:** 1-2 sessions  
**Dependencies:** Supercurricular API (#6)

---

## P2: Medium Priority

### 8. Disposition Consolidation
**Problem:** 10 dispositions may be too many; some overlap  
**Research Finding:** CONSISTENCY overlaps heavily with conscientiousness (ρ > 0.80)  
**Options:**
1. Keep all 10 but weight differently
2. Merge TOLERANCE + CONSISTENCY → single "Persistence" construct
3. Remove CONSISTENCY, fold into TOLERANCE
4. Relabel for clarity (CONSISTENCY → "Routine Preference")

**Decision Needed:** Review disposition validity evidence before implementing  
**Effort:** 1 session to decide, 1-2 sessions to implement  
**Dependencies:** None

---

### 9. Entry Requirements Filtering
**Problem:** Users see courses they can't realistically apply to  
**Acceptance Criteria:**
- [ ] UI to input predicted/actual grades
- [ ] Convert to UCAS points
- [ ] Hard filter: exclude courses requiring higher tariff
- [ ] Soft boost: prefer courses within comfortable reach

**Effort:** 2 sessions  
**Dependencies:** None

---

### 10. User Preferences UI
**Problem:** Users can't adjust filters after seeing results  
**Acceptance Criteria:**
- [ ] Filter by region
- [ ] Filter by university type (Russell Group, etc.)
- [ ] Filter by course features (sandwich year, year abroad)
- [ ] Re-run matching on preference change

**Effort:** 2-3 sessions  
**Dependencies:** None

---

### 11. Course Variant Grouping
**Problem:** Same course with different modes (sandwich, year abroad) shows as separate results  
**Acceptance Criteria:**
- [ ] Identify "base course" for each variant
- [ ] Group variants under base course in results
- [ ] Show primary version with expandable variants

**Effort:** 1-2 sessions  
**Dependencies:** Data analysis to identify groupings

---

## P3: Low Priority (Phase 2)

### 12. XP & Leveling System
**Spec:** Users earn XP for completing activities, level up, unlock features  
**Acceptance Criteria:**
- [ ] XP calculation rules
- [ ] Level thresholds
- [ ] Level display in UI
- [ ] XP rewards for supercurricular completion

**Effort:** 2-3 sessions  
**Dependencies:** Supercurricular system

---

### 13. Profile Grades (F → S)
**Spec:** Overall profile "grade" based on precision + completeness + uniqueness  
**Acceptance Criteria:**
- [ ] Grade calculation formula
- [ ] Grade display on results page
- [ ] Grade improvement suggestions

**Effort:** 1-2 sessions  
**Dependencies:** Capacity benchmarks

---

### 14. Familiar Evolution
**Spec:** Familiars evolve through stages as user engages more  
**Acceptance Criteria:**
- [ ] Evolution triggers (XP thresholds, streak, completeness)
- [ ] Visual evolution stages
- [ ] Evolution animation

**Effort:** 3+ sessions  
**Dependencies:** XP system, design assets

---

### 15. SPD (Processing Speed) Benchmark
**Problem:** 0 SPD items in database currently  
**Acceptance Criteria:**
- [ ] 30-40 simple items (symbol-digit, pattern comparison)
- [ ] Timed presentation (2-3 seconds per item)
- [ ] Score based on accuracy under time pressure

**Effort:** 2-3 sessions  
**Dependencies:** Capacity benchmark UI

---

### 16. Social Feed
**Spec:** Users can share discoveries, questions, resources  
**Acceptance Criteria:**
- [ ] Feed item creation
- [ ] Upvoting/saving
- [ ] Moderation system
- [ ] Feed display on results page

**Effort:** 4+ sessions  
**Dependencies:** User accounts (not currently planned)

---

## Deferred / Won't Do

### ❌ Abstract Reasoning Benchmark
**Rationale:** Matrix reasoning (Raven's-style) is highly valid but difficult to generate original items without IP concerns. Defer until legal review.

### ❌ ML-Based Matching
**Rationale:** Requires outcome data we don't have yet. Revisit after collecting longitudinal data from users.

### ❌ User Accounts / Login
**Rationale:** Anonymous sessions are working. Login adds friction and complexity. Revisit if retention features require it.

---

## Backlog Maintenance

- Review weekly
- Reprioritise based on user feedback
- Move completed items to CHANGELOG.md with date
- Archive items deferred more than 3 months
