# Matching Model v2

**Purpose:** Definitive reference for how course matching works — philosophy, measurement, algorithm.

---

## 1. Philosophy

### Elite Pushing

ExamRizz Arena pushes students toward the best universities they can realistically attend. Russell Group is the default recommendation pool. Non-Russell courses only surface when:
- Grade requirements exclude Russell options, or
- Fit is dramatically better at a non-Russell institution

This isn't elitism for its own sake. Graduate outcomes data consistently favours Russell Group institutions. Recommending a lower-ranked university when a student qualifies for higher does them a disservice.

### Honest, Not Discouraging

Capacity benchmarks may reveal a student isn't cognitively suited for their dream course. The platform is honest about this, but prescriptive rather than dismissive:

- Never "You can't do this"
- Always "This would require X. Here's what that means."

Very few courses are truly impossible. Most gaps can be closed with effort. The platform tells students what the gap is and lets them decide.

### Self-Discovery

Students should finish the assessment having learned something about themselves. The biggest insight comes from **enjoyment ratings** — finding out what tasks you actually enjoy (vs what you thought you'd enjoy) is valuable regardless of course matching.

---

## 2. Matching Hierarchy

Five layers, in order of priority:

```
1. GRADES        → Hard gate: "Can you get in?"
2. CAPACITY      → Soft gate: "Can you handle it?"
3. ENJOYMENT     → Core ranking: "Will you enjoy the work?"
4. DISPOSITION   → Refinement: "What work style suits you?"
5. PREFERENCE    → Tiebreaker: "What vibes with you?"
```

### Layer 1: Grades (Hard Gate)

The only hard filter. Non-compensatory.

| Input | Comparison | Output |
|-------|------------|--------|
| Predicted grades (optional) | Course `ucas_points` | ELIGIBLE / STRETCH / EXCLUDED |

- **ELIGIBLE:** Meets or exceeds requirements
- **STRETCH:** Within 1 grade band (shown with flag)
- **EXCLUDED:** >1 grade band gap (hidden from top results)

A student predicted BBB cannot charm their way into AAA Medicine.

### Layer 2: Capacity (Soft Gate)

Measured cognitive abilities determine whether a student can handle course demands.

| Capacity | Measures | Source |
|----------|----------|--------|
| VRB | Verbal reasoning | Benchmark performance |
| QNT | Quantitative reasoning | Benchmark performance |
| SPD | Processing speed | Benchmark performance |
| Calibration | Metacognitive accuracy | Confidence vs correctness |

**Floor logic:** Only penalise deficit, not excess. Being "too smart" for a course isn't friction.

```
If student.capacity < course.capacity_floor:
    deficit = floor - student
    Apply penalty proportional to deficit
    If deficit > threshold: flag as "cognitively demanding for you"
Else:
    No penalty
```

**Prescriptive output:** "This course demands QNT in the 75th percentile. You're at 55th. Students like you typically need to work 1.5x harder on quantitative modules. Is that a trade-off you're willing to make?"

### Layer 3: Enjoyment (Core Ranking)

The hardest signal to fake and most predictive of satisfaction.

During benchmarks, after each section:
> "How did you find that?"
> 😫 Hated it — 😐 Fine — 🤩 Loved it

| Enjoyed | Predicts Fit For |
|---------|------------------|
| Verbal tasks | Essay-heavy, reading-intensive courses |
| Quantitative tasks | Maths, data, economics, engineering |
| Time pressure | Exam-heavy assessment |
| Pattern/abstract | Pure sciences, theory, research |
| Open-ended problems | Creative fields, research degrees |
| Structured problems | Professional courses, engineering, law |

**Why this works:** "I enjoyed the verbal tasks" is stronger signal than "I think I'm a verbal person". Kids often have wrong self-concepts — a student who thinks they hate maths might enjoy the puzzle aspect when they actually try it.

### Layer 4: Disposition (Refinement)

Work style preferences measured through forced-choice scenarios and behavioural observation.

| Disposition | Measures | Type |
|-------------|----------|------|
| Tolerance | Persistence through difficulty | FLOOR |
| Transfer | Cross-context application | FIT |
| Precision | Preference for accuracy work | FIT |
| Retrieval | Comfort with recall demands | FLOOR |
| Receptivity | Openness to feedback | FIT |
| Structure | Need for routine/guidance | FIT |
| Consistency | Steady vs burst work style | FIT |
| Social | Collaborative preference | FIT |
| Depth | Specialisation preference | FIT |

**FLOOR vs FIT:**
- FLOOR: Deficit penalised, excess ignored (more is always fine)
- FIT: Both directions penalised (optimal point exists)

### Layer 5: Preference (Tiebreaker)

When courses have similar fit scores:

1. **Quality signals:** Russell Group, employment rate, NSS scores
2. **Vibe match:** Environment/subject tags from swiper

Minimal weight — nudges between already-good matches.

---

## 2a. Results Presentation (Two-Tier)

Results display two distinct course lists:

### Tier 1: "Top Matches"
Elite institutions (Russell Group) with best fit scores.
> "Best courses at top universities for your profile"

- Filtered to Russell Group only
- Ranked by overall fit within elite pool
- Maintains elite-pushing philosophy
- Shows 5-10 courses

### Tier 2: "Best Fit For You"
Highest disposition + enjoyment + vibe fit regardless of prestige.
> "Courses that match your preferences most closely"

- No institution filter
- Pure fit optimisation
- May surface non-Russell courses with exceptional match
- Shows 5-10 courses

### Why Two Tiers

| Concern | Solution |
|---------|----------|
| Elite-pushing feels prescriptive | Tier 2 shows "what if you optimised for fit alone" |
| Non-elite matches hidden | They appear in Tier 2 if genuinely better fit |
| Student autonomy | They see both lenses, they decide |
| Trust | Transparency about what algorithm prioritises |

### Example Output

**Top Matches (Elite)**
1. Medicine @ Cambridge — 81%
2. Natural Sciences @ Oxford — 79%
3. Biochemistry @ Imperial — 77%

**Best Fit For You**
1. Biomedical Science @ Lancaster — 91%
2. Pharmacology @ Bath — 88%
3. Medicine @ Cambridge — 81%

Student sees: "Cambridge is in both lists, but if I care purely about fit, Lancaster scores higher. Now I choose."

---

## 3. Assessment Flow (No Likert)

The assessment captures all signals without Likert scales.

```
LANDING
  ↓
VIBE SWIPER (~2 min)
  12 image cards — environment/subject aesthetics
  Output: vibe_tags[], disposition_nudges
  ↓
BENCHMARKS WITH EMBEDDED MEASURES (~15-20 min)
  │
  ├─ VRB Section (8-10 items)
  │   ├─ Performance → VRB capacity
  │   ├─ Confidence ratings → Calibration
  │   └─ Post-section → Enjoyment (verbal)
  │
  ├─ QNT Section (8-10 items)
  │   ├─ Performance → QNT capacity
  │   ├─ Confidence ratings → Calibration
  │   └─ Post-section → Enjoyment (quantitative)
  │
  ├─ Mixed/Applied Section (8-10 items)
  │   ├─ Varied task types
  │   └─ Post-section → Enjoyment (applied/abstract)
  │
  └─ Throughout: behavioural proxies captured
      ├─ Response times → SPD, Consistency
      ├─ Skip patterns → Tolerance
      ├─ Accuracy/speed tradeoff → Precision preference
      └─ Engagement decay → Tolerance
  ↓
FORCED-CHOICE SCENARIOS (~3 min)
  8-12 items covering:
  - Social (collaborative vs independent)
  - Receptivity (feedback attitude)
  - Transfer (interdisciplinary preference)
  - Structure (guidance needs)
  - Depth (specialisation preference)
  ↓
OPTIONAL: PREDICTED GRADES
  Quick input for grade filtering
  ↓
PROCESSING
  ↓
RESULTS
```

**Total time:** ~20-25 minutes

---

## 4. Measurement Sources

### What Replaces Likert

| Construct | Old Source | New Source | Validity |
|-----------|------------|------------|----------|
| VRB, QNT, SPD | Proxied | Benchmark performance | ↑ Higher |
| Calibration | Self-report | Confidence vs accuracy | ↑ Higher |
| Tolerance | Self-report | Persistence behaviour | ↑ Higher |
| Precision | Self-report | Speed/accuracy tradeoff + enjoyment | ↑ Higher |
| Retrieval | Self-report | Timed recall + enjoyment | ↑ Higher |
| Transfer | Self-report | Forced-choice | ≈ Similar |
| Receptivity | Self-report | Forced-choice | ≈ Similar |
| Structure | Self-report | Task preference + forced-choice | ↑ Higher |
| Consistency | Self-report | Response pattern analysis | ↑ Higher |
| Social | Self-report | Forced-choice | ≈ Similar |
| Depth | Self-report | Forced-choice + enjoyment | ↑ Higher |

### Behavioural Proxies

Captured automatically during benchmarks:

| Behaviour | Indicates | Measurement |
|-----------|-----------|-------------|
| Time on hard items before skip | Tolerance | Response time on incorrect items |
| Pace consistency | Consistency | Response time variance |
| Accuracy vs speed tradeoff | Precision preference | Error rate at different speeds |
| Re-reading prompts | Structure need | Scroll/interaction patterns |
| Performance decay | Tolerance | Score drop across test |
| Confidence accuracy | Calibration | Predicted vs actual correctness |

### Forced-Choice Examples

**Social:**
> You have a difficult problem set due tomorrow.
> A) Find a study group to work through it together
> B) Lock in alone until you've cracked it

**Structure:**
> Two courses cover the same content. Which appeals more?
> A) Weekly problem sets, clear marking criteria, structured lectures
> B) One big project, open brief, self-directed research

**Depth:**
> You have a free afternoon to learn something.
> A) Deep-dive one topic for 3 hours
> B) Skim 10 different interesting articles

---

## 5. Algorithm Specification

### Score Calculation

```
final_score = capacity_multiplier × (
    enjoyment_fit 
    + disposition_fit 
    - disposition_friction
) + quality_bonus + vibe_bonus
```

### Capacity Multiplier

```typescript
function getCapacityMultiplier(student: Capacities, course: Course): number {
  let totalDeficit = 0;
  
  for (const cap of ['vrb', 'qnt', 'spd']) {
    const floor = course[`capacity_${cap}_floor`];
    if (!floor) continue;
    
    const deficit = Math.max(0, floor - student[cap].value);
    totalDeficit += deficit;
  }
  
  if (totalDeficit === 0) return 1.0;
  if (totalDeficit > 40) return 0.3;  // Severe mismatch
  return 1 - (totalDeficit / 100);     // Gradual reduction
}
```

### Enjoyment Fit

```typescript
function calculateEnjoymentFit(enjoyment: EnjoymentProfile, course: Course): number {
  let score = 0;
  
  // Map enjoyment ratings to course characteristics
  if (course.assessment_exam_pct > 60) {
    score += enjoyment.time_pressure * 0.3;  // Enjoyed time pressure → exam-heavy fit
  }
  if (course.cah_code.startsWith('CAH07') || course.cah_code.startsWith('CAH09')) {
    score += enjoyment.quantitative * 0.4;   // Enjoyed quant → STEM fit
  }
  // ... etc
  
  return normalise(score, 0, 100);
}
```

### Disposition Gap (Floor vs Fit)

```typescript
function calculateGap(student: number, demand: number, isFloor: boolean): number {
  if (isFloor) {
    // Only penalise deficit
    return Math.max(0, demand - student);
  } else {
    // Penalise both directions
    return Math.abs(student - demand);
  }
}

const FLOOR_DIMENSIONS = ['tolerance', 'retrieval', 'calibration', 'precision'];
const FIT_DIMENSIONS = ['transfer', 'receptivity', 'structure', 'consistency', 'social', 'depth'];
```

### Quality Bonus

| Factor | Bonus | Threshold |
|--------|-------|-----------|
| Russell Group | +15 | Boolean |
| Employment ≥90% | +3 | employment_rate |
| NSS ≥80% | +2 | nss_overall |
| Salary ≥£30k | +2 | median_salary_3yr |

**Max quality bonus:** +22

---

## 6. Data Requirements

### Course Table

| Column | Status | Priority |
|--------|--------|----------|
| `demand_*` (10 dimensions) | ✓ Populated | — |
| `capacity_vrb_floor` | ✗ Missing | High |
| `capacity_qnt_floor` | ✗ Missing | High |
| `capacity_spd_floor` | ✗ Missing | Medium |
| `ucas_points` | ✓ Partial | High |
| `russell_group` | ✓ Populated | — |
| `subject_tags` | ✗ Empty | Medium |
| `assessment_exam_pct` | ✗ Empty | Low |
| `employment_rate` | ✓ Populated | — |

### Profile Table

| Column | Status | Change Needed |
|--------|--------|---------------|
| Disposition scores | ✓ Exists | Source changes to forced-choice |
| Capacity scores | ✓ Exists | Source changes to benchmark |
| Capacity provenance | ✓ Exists | Track MEASURED vs PROXIED |
| Enjoyment profile | ✗ Missing | Add columns |
| Predicted grades | ✗ Missing | Add column |

---

## 7. Worked Example

### Student: STEM Precision

**Benchmark Performance:**
- VRB: 72 (above average)
- QNT: 88 (high)
- SPD: 65 (average)
- Calibration: 81 (accurate self-assessment)

**Enjoyment Ratings:**
- Verbal tasks: 😐 (3/5)
- Quantitative tasks: 🤩 (5/5)
- Time pressure: 🙂 (4/5)

**Forced-Choice Results:**
- Social: Independent (28)
- Structure: High (81)
- Depth: Deep (91)

**Course: Chemical Physics @ Imperial**

| Layer | Calculation | Result |
|-------|-------------|--------|
| Grades | AAB (144) vs AAA (168) required | STRETCH |
| Capacity | QNT 88 vs floor 75: no deficit | ×1.0 |
| Enjoyment | Loved quant + liked pressure → physics fit | +35 |
| Disposition | Low social matches low-social course | +15 |
| Quality | Russell Group + high employment | +18 |
| **Final** | | **83** |

**Friction: LOW** ✓

---

## 8. UX Principles

### Skip and Return

Students can skip any item and return later. Skipped items:
- Don't contribute to scores (treated as missing)
- Appear in a "skipped" queue at end
- Can be answered or left blank

### Progress Visibility

- Clear progress bar throughout
- Time estimates per section
- "X questions remaining" counter

### No Dead Ends

- Assessment works with partial data
- Fewer responses = higher uncertainty = wider confidence intervals
- Results always generated, quality flagged if data sparse

### Immediate Feedback

After benchmarks, before full results:
- "You scored in the Xth percentile for verbal reasoning"
- "You enjoyed quantitative tasks more than 70% of students"

Creates "learn something" moment even if they don't finish.

---

## 9. Confidence & Uncertainty

### Provenance Tracking

```sql
vrb_provenance TEXT DEFAULT 'PRIOR'  -- PRIOR / PROXIED / MEASURED
```

| Provenance | Meaning | Weight in Matching |
|------------|---------|-------------------|
| PRIOR | No data, default 50 | Ignored |
| PROXIED | Derived from other signals | Low weight, wide tolerance |
| MEASURED | From benchmark | Full weight |

### Displaying Uncertainty

Results show confidence bands, not false precision:
- "75% match" → "65-85% match confidence"
- Wider bands when data is sparse or proxied

---

## 10. Future Considerations

### Adaptive Testing

Start with medium-difficulty items. If correct, increase difficulty. If incorrect, decrease. Reaches reliable estimate in fewer items.

### Enjoyment × Performance Matrix

| | Enjoyed | Didn't Enjoy |
|---|---------|--------------|
| **Scored High** | Sweet spot — pursue this | Able but unfulfilling — consider carefully |
| **Scored Low** | Interest without aptitude — needs development | Avoid |

This 2×2 is powerful career guidance.

### Experiential Tasks

Future addition: short simulated work tasks (write a brief, debug code, analyse data). Captures:
- Performance on career-relevant work
- Enjoyment of realistic tasks
- Time-to-completion patterns

---

*Last updated: [date]*
*Version: 2.0*
*Status: Design complete, implementation pending*
