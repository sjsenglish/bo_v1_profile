# ExamRizz Arena — Handoff Context

**Last Updated:** 1 January 2025, 03:30 UTC  
**Last Session:** Process setup + research synthesis  
**Next Priority:** Debug matching algorithm OR design forced-choice questions

---

## Current State (10 Sentences)

1. ExamRizz Arena is a UK university course matching platform with a functional MVP deployed at https://bo-v1-profile.vercel.app/.
2. The assessment flow (landing → vibe → cognitive → behavioural → processing → results) is complete and connected to Supabase.
3. User testing revealed critical feedback: matches feel "random", Likert questions feel "hypothetical", and the balance is wrong (too much self-report, not enough capacity testing).
4. A 120-page Assessment Framework was synthesised, showing cognitive ability (r=0.50-0.81) is far more predictive than self-report dispositions (r=0.23-0.26).
5. Research strongly supports shifting to: ~55% cognitive capacity, ~25% forced-choice personality, ~20% interest/fit.
6. The database contains 28,520 HESA courses, 178 supercurriculars, 72 capacity items (VRB/QNT), and 40 Likert questions.
7. The supercurricular system has data but no API or UI.
8. The capacity benchmark system has items but no frontend.
9. Process documentation was established: MASTER_SPEC, CHANGELOG, BACKLOG, HANDOFF, DATA_DICTIONARY, RESEARCH_FOUNDATION.
10. Three open questions need decisions before major redesign work.

---

## What Just Happened (This Session)

1. Created comprehensive v8 master spec consolidating all previous versions
2. Read and synthesised 120-page Assessment Framework research document
3. Identified research-supported redesign direction
4. Established documentation structure and workflow
5. Created all core documentation files

---

## Open Questions Requiring Decisions

### Question 1: Disposition Consolidation
**Keep all 10 dispositions or consolidate?**

Research suggests:
- TRANSFER, PRECISION, TOLERANCE have clear course relevance (different courses load differently on these)
- CONSISTENCY overlaps heavily with conscientiousness (ρ > 0.80) — may be redundant
- SOCIAL and STRUCTURE are "thrive" factors (fit/satisfaction) not "succeed" factors (academic performance)

**Options:**
- A) Keep all 10, but re-weight (reduce self-report weight, increase capacity weight)
- B) Merge TOLERANCE + CONSISTENCY into single construct
- C) Keep TOLERANCE, drop CONSISTENCY, measure conscientiousness via forced-choice behaviour
- D) Keep all 10 for now, revisit after capacity integration

**Recommendation:** Option C or D — don't over-engineer before validating core flow

---

### Question 2: Capacity Item Strategy
**Use existing VRB/QNT items or design new ones for "hook" factor?**

Current state:
- 72 items in database (36 VRB, 36 QNT)
- 8 interaction types: MCQ, BINARY_RAPID, HIGHLIGHT_SELECT, etc.
- Items haven't been validated or tested

Research says:
- 5 items per dimension achieves α = 0.82-0.85
- Short-form tests maintain validity (9-item Raven's correlates r = 0.98 with full version)

**Options:**
- A) Use existing items as-is, build UI, test with users
- B) Review/curate existing items first, then build UI
- C) Design fresh items optimised for engagement ("hook" factor)

**Recommendation:** Option B — review what exists before building new

---

### Question 3: Calibration Measurement
**Integrate calibration via post-item confidence prompts?**

Research strongly supports:
- Ask "How confident are you that you got this right?" after each capacity item
- Compare confidence to actual correctness
- This measures CALIBRATION disposition through behaviour, not self-report
- Adds no extra time, eliminates faking

**Options:**
- A) Yes, implement calibration confidence on all capacity items
- B) Yes, but only on a subset of items (e.g., 5 per benchmark)
- C) No, keep CALIBRATION as self-report for now

**Recommendation:** Option A — it's a clear win with no downside

---

## Known Issues (Current)

| Issue | Severity | Status |
|-------|----------|--------|
| Course matching feels random | HIGH | Needs investigation |
| Results page flash error | MEDIUM | Not started |
| Capacity UI missing | MEDIUM | Items exist, UI blocked |
| Supercurricular API missing | MEDIUM | Data exists, API blocked |

---

## Immediate Next Steps

**Option A: Debug Matching First**
1. Add logging to matching algorithm
2. Create test profiles with expected outcomes
3. Verify data flow: profile → demands → scores
4. Fix any identified issues
5. Then proceed with assessment redesign

**Option B: Design Questions First**
1. Decide on disposition consolidation
2. Draft 8-12 forced-choice scenario questions
3. Map questions to key dispositions
4. Get user feedback on new question format
5. Then integrate with capacity benchmarks

**Recommendation:** Start with Option A — if matching is broken, no point redesigning inputs

---

## Key Files to Reference

| File | Purpose |
|------|---------|
| `docs/MASTER_SPEC.md` | Canonical product specification |
| `docs/BACKLOG.md` | Prioritised work items |
| `docs/reference/RESEARCH_FOUNDATION.md` | Why decisions were made |
| `docs/reference/DATA_DICTIONARY.md` | Database schema details |
| `src/lib/matching.ts` | Matching algorithm implementation |
| `src/lib/scoring.ts` | Disposition score calculation |

---

## Environment

| Item | Value |
|------|-------|
| Live URL | https://bo-v1-profile.vercel.app/ |
| Repo | https://github.com/sjsenglish/bo_v1_profile |
| Database | Supabase (bo_v1_* tables) |
| Stack | Next.js 14 + TypeScript + Tailwind |

---

## Session Checklist

Before starting:
- [ ] Read this HANDOFF.md
- [ ] Check BACKLOG.md for priorities
- [ ] Create session note in `docs/sessions/`

After finishing:
- [ ] Update CHANGELOG.md if anything shipped
- [ ] Update BACKLOG.md if priorities changed
- [ ] Overwrite this HANDOFF.md with fresh context
- [ ] Commit docs with code
