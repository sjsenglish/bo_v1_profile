# Assessment Flow v2 — MVP Specification

**Philosophy:** Initial assessment hooks and engages. Sharpening activities add rigour incrementally. A comprehensive institutional test is planned for future development.

---

## MVP Scope

```
┌─────────────────────────────────────────────────────────────┐
│ INITIAL ASSESSMENT (~6 min)                                 │
│ Low friction, high engagement, novel                        │
│ → Profile with ~40% precision                               │
│ → Course matches (low confidence)                           │
│ → Identity assigned                                         │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│ PROFILE PAGE (Hub)                                          │
│                                                             │
│ [Sharpen Your Profile]                                      │
│  └── Incremental activities, ~3-5 min each                  │
│  └── Each adds 5-20% precision                              │
│                                                             │
│ [Take Full Test — Coming Soon]                              │
│  └── Greyed out / teaser                                    │
│  └── "1-hour comprehensive assessment"                      │
└─────────────────────────────────────────────────────────────┘
```

---

## Initial Assessment (~6 min)

### Flow

```
1. LANDING
   ├── New user → "Find courses that fit how you think"
   ├── "6 minutes • No sign-up • Instant results"
   ├── [Start]
   └── Returning user → Redirect to Profile Page

                              ↓

2. VIBE SWIPER                                        ~1 min
   ├── 6 image cards
   ├── Swipe right / left / skip
   ├── Output: vibe_tags[], disposition_nudges
   └── [Skip section available]

                              ↓

3. QUICK SCENARIOS                                    ~2 min
   ├── 8 forced-choice "would you rather" items
   ├── 8-10 second advisory limit per item
   ├── Output: disposition scores (rough)
   │   SOCIAL, STRUCTURE, DEPTH, TRANSFER, RECEPTIVITY
   └── [Any item skippable]

                              ↓

4. UNI TASK PREVIEWS                                  ~4.5 min
   │
   ├── "Try 3 short tasks that feel like real uni work"
   │
   ├── 4a. Code Trace                          ~90 sec
   │   ├── Computing/Engineering/Maths signal
   │   └── Post-task: enjoyment rating (😫 😐 😊)
   │
   ├── 4b. Source Analysis                     ~90 sec
   │   ├── Humanities/Law/Social Sciences signal
   │   └── Post-task: enjoyment rating
   │
   ├── 4c. Data Interpretation                 ~90 sec
   │   ├── Sciences/Psychology/Economics signal
   │   └── Post-task: enjoyment rating
   │
   ├── Order: randomised
   └── [Any task skippable, min 1 required for results]

                              ↓

5. PROCESSING                                         ~5 sec
   ├── Calculate disposition scores
   ├── Calculate cluster preferences (from enjoyment)
   ├── Calculate cluster capability (from performance)
   ├── Derive proxy capacity estimates
   ├── Assign identity (Familiar + Guild)
   ├── Generate course matches (LOW confidence)
   └── Calculate precision score (~35-45%)

                              ↓

6. PROFILE PAGE
   └── See "Profile Page" section below
```

### What Initial Assessment Captures

| Data | Source | Confidence | Used For |
|------|--------|------------|----------|
| Vibe tags | Swiper | Low | Tiebreaker only |
| Disposition estimates | Scenarios | Low (σ ~18) | Course style (wide bands) |
| Cluster preference | Task enjoyment | Medium | Subject area boosting |
| Cluster capability | Task performance | Low-Medium | Within-cluster difficulty |
| VRB proxy | Source Analysis | Low (σ ~20) | Not used for floors |
| QNT proxy | Code Trace + Data Interp | Low (σ ~20) | Not used for floors |

### What Initial Assessment Doesn't Have

- Domain-agnostic capacity scores
- High-confidence disposition measures
- Calibration data
- SPD measurement
- Sufficient data for career matching

---

## Profile Page (Hub)

### After Initial Assessment

```
┌─────────────────────────────────────────────────────────────┐
│ [Familiar Avatar]          YOUR PROFILE                     │
│ The Owl                    Precision: 42%                   │
│ Forge Guild                ━━━━━░░░░░░░░░░░░░               │
│                                                             │
│ These results are a first sketch.                           │
│ Sharpen your profile for better matches.                    │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ EARLY INDICATORS                                            │
│                                                             │
│ Enjoyed & did well:                                         │
│ • Source Analysis → Humanities, Law courses may suit you    │
│                                                             │
│ Capable but less engaged:                                   │
│ • Data Interpretation → Sciences possible, explore more     │
│                                                             │
│ More data needed:                                           │
│ • Computing/Engineering (sharpen your profile)              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ EXPLORE                                                     │
│                                                             │
│ [📚 Courses]        [💼 Careers]       [🎯 Activities]      │
│  ~200 matches        Coming soon        Coming soon         │
│  Low confidence      Sharpen profile    Sharpen profile     │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ SHARPEN YOUR PROFILE                                        │
│                                                             │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ 🧠 Reasoning Challenges                                 │ │
│ │ 3 short tasks • ~4 min • +15% precision                 │ │
│ │ Improves: course difficulty matching                    │ │
│ │                                      [Start →]          │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                             │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ ⚡ Speed Challenge                                       │ │
│ │ Timed tasks • ~3 min • +10% precision                   │ │
│ │ Improves: exam-heavy course matching                    │ │
│ │                                      [Start →]          │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                             │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ 🎯 More Scenarios                                       │ │
│ │ 7 quick choices • ~4 min • +12% precision               │ │
│ │ Improves: learning style matching                       │ │
│ │                                      [Start →]          │ │
│ └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 🔮 FULL TEST — COMING SOON                                  │
│                                                             │
│ 1-hour comprehensive assessment                             │
│ Designed for serious applicants                             │
│ University and employer grade                               │
│                                                             │
│ [Notify me when available]                                  │
└─────────────────────────────────────────────────────────────┘
```

### After Sharpening (~70%+ Precision)

```
┌─────────────────────────────────────────────────────────────┐
│ [Familiar Avatar]          YOUR PROFILE                     │
│ The Owl (Adult)            Precision: 78%                   │
│ Forge Guild                ━━━━━━━━━━━━━━━░░░░              │
│                                                             │
│ Your profile is solid.                                      │
│ [Share Profile]  [Continue sharpening]                      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ YOUR STRENGTHS                                              │
│                                                             │
│ Strong verbal reasoning                                     │
│ • You handled complex arguments well                        │
│ • Courses with heavy reading suit you                       │
│                                                             │
│ Calibrated self-assessment                                  │
│ • Your confidence matched your accuracy                     │
│                                                             │
│ Deep focus preference                                       │
│ • You prefer depth over breadth                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ EXPLORE                                                     │
│                                                             │
│ [📚 Courses]        [💼 Careers]       [🎯 Activities]      │
│  127 matches         8 pathways         34 recommended      │
│  Good confidence     Available          Available           │
└─────────────────────────────────────────────────────────────┘
```

---

## Sharpening Activities (MVP)

Optional activities that increase precision. Each is self-contained and encouraged but not required.

### Available Activities

| Activity | Duration | Precision Gain | What It Measures |
|----------|----------|----------------|------------------|
| Reasoning Challenges | ~4 min | +15% | VRB + QNT capacity |
| Speed Challenge | ~3 min | +10% | SPD capacity |
| More Scenarios | ~4 min | +12% | Disposition refinement |
| Challenge Mini-Samples | ~3 min | +8% | Cluster capability (harder tier) |

### Reasoning Challenges

```
3 Verbal Reasoning items (1 per tier)
├── Foundation: basic inference
├── Standard: argument analysis  
├── Challenge: complex synthesis
└── Post-section: enjoyment rating

3 Quantitative Reasoning items (1 per tier)
├── Foundation: data reading
├── Standard: multi-step calculation
├── Challenge: interpretation under constraints
└── Post-section: enjoyment rating

Output:
├── VRB score + confidence
├── QNT score + confidence  
├── Calibration (from confidence ratings)
└── Enjoyment profile
```

### Speed Challenge

```
6 Processing Speed items (2 per tier)
├── ENFORCED time limits (35-75 seconds)
├── Rapid verification tasks
├── Pattern matching
└── Post-section: enjoyment rating

Output:
├── SPD score + confidence
└── Time-pressure enjoyment
```

### More Scenarios

```
7 additional forced-choice items
├── Deeper probes on key dimensions
├── Cross-validation of initial responses
└── 8-10 second advisory limit

Output:
├── Refined disposition scores
└── Reduced sigma on all dimensions
```

### Challenge Mini-Samples

```
Harder versions of initial tasks:
├── Code Trace (recursion, multiple functions)
├── Source Analysis (compare opposing arguments)
├── Data Interpretation (confounding variables)
└── Each ~90 seconds

Output:
├── Refined cluster capability signals
└── Challenge-level performance data
```

---

## Course Results

### Display Structure

```
┌─────────────────────────────────────────────────────────────┐
│ YOUR COURSE MATCHES                                         │
│ Confidence: [Low / Medium / Good] based on profile precision│
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ TOP MATCHES (Russell Group)                                 │
│                                                             │
│ 1. Law — University of Edinburgh                            │
│    Fit: High • Why: Strong argument analysis, deep focus    │
│                                                             │
│ 2. History — Durham University                              │
│    Fit: High • Why: Source analysis strength, reading load  │
│                                                             │
│ 3. PPE — University of Warwick                              │
│    Fit: Good • Why: Balanced skills, structured course      │
│                                                             │
│ [See all 45 matches →]                                      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ BEST FIT FOR YOU                                            │
│ (highest match regardless of university ranking)            │
│                                                             │
│ 1. Politics — Lancaster University                          │
│    Fit: Very High • Why: Perfect disposition match          │
│                                                             │
│ [See all →]                                                 │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 🎲 WILDCARD                                                 │
│                                                             │
│ Philosophy — University of St Andrews                       │
│                                                             │
│ Why this? You scored highly on argument analysis            │
│ even though you preferred data-heavy tasks.                 │
│                                                             │
│ This is outside your main cluster — that's the point.       │
│                                                             │
│ Is this interesting?                                        │
│ [👍 Surprisingly, yes]     [👎 Not for me]                  │
└─────────────────────────────────────────────────────────────┘
```

### Wildcard Logic

A wildcard is generated if:
1. Strong capability match (top 20% on cluster from mini-sample)
2. Different cluster from main recommendations
3. Not explicitly disliked (enjoyment ≥ 2)

Feedback stored for algorithm validation.

---

## Skip Behaviour

### Principles
- Everything skippable
- Minimum for results: 1 mini-sample completed
- Skipped = high uncertainty (honest about impact)
- No guilt, just clarity

### Skip Messages

| Skip | Message |
|------|---------|
| Vibe section | "No problem — we'll focus on your other responses" |
| Scenario item | *(silent, proceed)* |
| Mini-sample | "Your [cluster] results will be less certain" |
| Sharpening activity | "You can do this anytime from your profile" |

---

## Session Detection

### New vs Returning

- Check localStorage for session_id
- If found + valid → redirect to Profile Page
- If not found → show Landing

### Session Persistence

- Session ID in localStorage
- Shareable profile URL: `examrizz.com/profile/[id]`
- Optional: email capture for "save my profile" (future)

---

## Precision Calculation

```
precision = 100 - mean(all_sigmas) × 2

Sigmas included:
├── 10 dispositions (calibration, tolerance, transfer, etc.)
└── 3 capacities (VRB, QNT, SPD)

Tiers:
├── SKETCH: 0-49%   "Early sketch"
├── DRAFT:  50-69%  "Working draft"  
├── SOLID:  70-84%  "Solid profile"
└── SHARP:  85-100% "Sharp profile"
```

### How Activities Affect Precision

| State | Approx Precision |
|-------|------------------|
| Initial only | 35-45% |
| + Reasoning Challenges | 55-65% |
| + Speed Challenge | 65-75% |
| + More Scenarios | 75-85% |
| + Challenge Mini-Samples | 80-90% |

---

## Future: Full Test (Not in MVP)

> A 1-hour comprehensive assessment is planned for future development.
> 
> **Target use cases:**
> - University admissions partnerships
> - Employer screening
> - Research-grade psychometric profiling
> - Scholarship applications
> 
> **Will include:**
> - Extended capacity benchmarks (18+ items per type)
> - Full disposition battery
> - Situational judgement tests
> - Work-style simulations
> - PDF report with detailed analysis
> 
> **Not in current MVP scope.**
> 
> On Profile Page, shown as:
> ```
> [🔮 Full Test — Coming Soon]
> [Notify me when available]
> ```

---

## Validation Criteria

### Initial Assessment
- [ ] Completes in ~6-7 minutes
- [ ] All sections skippable
- [ ] Results generated with ≥1 mini-sample
- [ ] Precision score ~35-45%
- [ ] Profile page displays correctly
- [ ] Sharpening CTAs visible and clear

### Sharpening Activities
- [ ] Each activity standalone (can do in any order)
- [ ] Precision increases after each
- [ ] Results recalculate automatically
- [ ] Progress persists across sessions

### Course Results
- [ ] Two-tier display (Top Matches + Best Fit)
- [ ] Wildcard shown if conditions met
- [ ] Feedback captured on wildcard
- [ ] Confidence level reflects precision

---

*Version: 2.1 (MVP-focused)*
*Created: 3 January 2025*
