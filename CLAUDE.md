# ExamRizz Arena

> UK university course matching platform for sixth-form students. Psychometric assessment → course recommendations.

## Quick Context

**What:** Profile students across 7 dispositions + 3 capacities, match to 28,520 real UK courses (HESA data).

**Philosophy:**
- "Elite pushing" — Russell Group default, best universities students can realistically attend
- "Brutal honesty" — measure capability through performance, not self-report
- "Growth model" — low-friction start, profile sharpens over time through optional activities

**Stack:** Next.js 14, TypeScript, Supabase (PostgreSQL), Tailwind CSS, Vercel

**Repo:** https://github.com/sjsenglish/bo_v1_profile

---

## Assessment Model (Two-Tier)

### Initial Assessment (~6 min)
```
Vibe Swiper (6 cards)        → 1 min
Quick Scenarios (8 items)    → 2 min
Mini-Samples (3 tasks)       → 4.5 min
Processing                   → 5 sec
────────────────────────────────────
Profile Page                 → Precision ~40%, LOW confidence
```

### Mini-Sample Tasks (Novel Core)
| Task | Cluster Signal | Duration |
|------|----------------|----------|
| Code Trace | Computing, Engineering, Maths | 90 sec |
| Source Analysis | Humanities, Law, Social Sciences | 90 sec |
| Data Interpretation | Sciences, Psychology, Economics | 90 sec |

### Sharpening Activities (Optional, Encouraged)
| Activity | Duration | Precision Gain |
|----------|----------|----------------|
| Reasoning Challenges | ~4 min | +15% |
| Speed Challenge | ~3 min | +10% |
| More Scenarios | ~4 min | +12% |
| Challenge Mini-Samples | ~3 min | +8% |

### Future (Not Built)
- Full 1-hour institutional test
- Career pathway matching
- PDF export

---

## Constructs Measured

### Capacities (3)
| ID | Name | Source |
|----|------|--------|
| VRB | Verbal Reasoning | Benchmarks (or proxy from Source Analysis) |
| QNT | Quantitative Reasoning | Benchmarks (or proxy from Code Trace/Data) |
| SPD | Processing Speed | Benchmarks only |

### Dispositions (7)
| ID | Name | Type |
|----|------|------|
| CAL | Calibration | FLOOR |
| TOL | Tolerance | FLOOR |
| TRA | Transfer | FIT |
| STR | Structure | FIT |
| SOC | Social | FIT |
| DEP | Depth | FIT |
| REC | Receptivity | FIT |

---

## Key Files

### Documentation (read when needed)
- `docs/MASTER_SPEC.md` — Full product spec
- `docs/ASSESSMENT_FLOW_v2.md` — Two-tier assessment model
- `docs/MINI_SAMPLES.md` — Task content specification
- `docs/MATCHING_MODEL.md` — Algorithm details
- `docs/GROWTH_MODEL.md` — Profile evolution architecture
- `docs/DATA_DICTIONARY.md` — Schema reference
- `docs/DEPENDENCY_MAP.md` — What affects what

### Code
- `src/lib/types.ts` — TypeScript interfaces
- `src/lib/scoring.ts` — Disposition calculation
- `src/lib/matching.ts` — Course matching algorithm
- `src/lib/identity.ts` — Familiar/Guild assignment

### Database
- `seeds/001_schema.sql` — Core tables
- `seeds/010_mini_samples.sql` — Mini-sample tables + items
- `seeds/ALL_CLUSTERS.sql` — Supercurricular data

---

## Database Tables (bo_v1_ prefix)

### Core
- `sessions` — Assessment state
- `profiles` — Student characteristics + scores
- `courses` — HESA university data (28,520)
- `matches` — Cached match results

### Assessment
- `vibe_cards` — Swiper card definitions (6)
- `questions` — Forced-choice scenarios
- `capacity_items` — Benchmark questions (63)
- `mini_sample_items` — Task definitions (3+)
- `mini_sample_responses` — Task responses

### Responses
- `vibe_swipes` — Swipe records
- `diagnostic_responses` — Scenario answers
- `benchmark_responses` — Capacity item answers
- `assessment_state` — Completion tracking
- `match_feedback` — Thumbs up/down on recommendations

### Identity
- `familiars` — Spirit animal definitions (14)
- `guilds` — Guild definitions (4)

### Content
- `supercurriculars` — Enrichment activities (178)

---

## Matching Algorithm (5-Layer)

```
1. GRADES        → Hard gate (if provided)
2. CAPACITY      → Soft gate (VRB/QNT/SPD floors)
3. CLUSTER       → Subject matching (from mini-samples)
4. DISPOSITION   → Style matching (from scenarios)
5. PREFERENCE    → Tiebreaker (vibe + quality)
```

Wildcard: generated if strong capability in cluster but low enjoyment.

---

## Conventions

### Code Style
- British English in UI copy
- TypeScript strict mode
- Tailwind for styling (Arcane design system: navy #011c40, teal #54acbf)
- Server components by default

### Database
- All tables prefixed `bo_v1_`
- Scores: 0-100 scale, 50 = population average
- Uncertainty: sigma values (lower = more confident)
- Provenance: PRIOR / PROXIED / MEASURED

### Naming
- Dispositions: UPPERCASE (CALIBRATION, TOLERANCE)
- Capacities: UPPERCASE 3-letter (VRB, QNT, SPD)
- Tiers: FOUNDATION / STANDARD / CHALLENGE
- Clusters: STEM, HUMANITIES, SCIENCES, etc.

---

## Working With Me

### Preferences
- British English
- Brief explanations, no fluff
- Outline plans before implementation
- Single best option, not multiple alternatives
- Don't start coding without checking first
- Disagree if warranted

### Before Major Changes
1. Check `docs/DEPENDENCY_MAP.md` for ripple effects
2. Update relevant documentation
3. Consider migration for existing data

### UI Principles
- Mobile-first (70%+ users on phones)
- Everything skippable
- Time limits: ENFORCED for SPD, advisory otherwise
- No exact numbers shown to users (use descriptive language)
- Strong CTAs to sharpen profile

---

## Immediate Priorities

1. **Mini-sample UI components** — Code Trace, Source Analysis, Data Interpretation
2. **Profile page** — Hub with precision display, early indicators, sharpening CTAs
3. **Wildcard + feedback** — Thumbs up/down with optional reason
4. **Sharpening flow** — Capacity benchmarks as optional activities

---

## Links

- **Live:** https://bo-v1-profile.vercel.app/
- **Repo:** https://github.com/sjsenglish/bo_v1_profile

---

*For detailed specs, read the docs/ files. This file is kept minimal for token efficiency.*
