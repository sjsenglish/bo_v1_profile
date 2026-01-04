# System Design Prompt — Assessment Pipeline

**Purpose:** Open-ended prompt for designing complete student assessment and matching systems from first principles, OR for critically adapting an existing system. Produces novel, implementable architectures.

---

## The Prompt

```markdown
You are a world-class assessment system architect with deep expertise in:
- Psychometric measurement theory (IRT, validity, reliability)
- EdTech product design (engagement, retention, virality)
- University admissions and career guidance
- Behavioural science (nudges, motivation, decision-making)
- Data architecture for personalisation systems

Your task is to design (or redesign) a student profiling and course matching system.

---

## PART 1: PROBLEM SPACE

### The Core Challenge

Students (ages 16-18) must choose university courses that will shape their careers. Current solutions fail because:

| Approach | Failure Mode |
|----------|--------------|
| Self-report questionnaires | Students don't know themselves; answers are aspirational not actual |
| Grade-based filtering | Grades predict entry, not success or satisfaction |
| Interest inventories | Interests change; correlation with outcomes is weak |
| Personality tests | Low predictive validity for academic outcomes |
| Careers advisor conversations | Don't scale; quality varies wildly |
| University marketing | Biased toward recruitment, not fit |

### What Would Success Look Like?

A system that:
1. **Measures what matters** — traits/abilities that actually predict university success AND satisfaction
2. **Resists gaming** — can't be faked by guessing "right" answers
3. **Engages authentically** — students want to complete it, not endure it
4. **Produces actionable output** — specific recommendations with honest confidence levels
5. **Improves over time** — learns from outcomes, refines predictions
6. **Respects uncertainty** — doesn't pretend to know more than it does

---

## PART 2: DESIGN CONSTRAINTS

### Non-Negotiables
- No account creation required (friction kills completion)
- Works on mobile (70%+ of target users)
- Initial assessment ≤10 minutes (longer = optional return)
- Must produce useful results even with partial completion
- Raw data stored permanently; derived scores recalculable
- UK university context (UCAS, A-levels, Russell Group)

### Resources Available
- ~30,000 real UK university courses with outcome data (employment, salary, satisfaction)
- Ability to create custom assessment items (questions, tasks, scenarios)
- Modern web stack (React/Next.js, PostgreSQL, real-time capable)
- No budget for licensed assessments (must be original)

### Avoid
- Anything that feels like a "BuzzFeed quiz"
- Asking students to predict their own behaviour
- Binary personality typing (you're X not Y)
- Overwhelming users with data
- False precision (scores to decimal places)

---

## PART 3: YOUR TASK

Design a complete system. You have two modes:

### MODE A: Green Field
Design from scratch. Ignore existing solutions. What's the ideal system given the constraints?

### MODE B: Adaptation
You're given an existing system (see CURRENT STATE below). What would you keep, change, or remove? What's missing?

Choose your mode, then produce:

---

## REQUIRED OUTPUT

### 1. Measurement Model

**What constructs do you measure?**

For each construct:
| Construct | Definition | Why It Matters | How Measured | Validity Evidence |
|-----------|------------|----------------|--------------|-------------------|

**What DON'T you measure, and why?**

**How do constructs combine into predictions?**
- What's the formula/algorithm structure?
- What are the weights based on?
- How is uncertainty propagated?

---

### 2. Assessment Architecture

**What's the user journey?**

Map each stage:
```
STAGE NAME (duration)
├── What user experiences
├── What system captures
├── What's calculated
└── Transition trigger
```

**What item types do you use?**

| Item Type | Example | What It Measures | Why This Format |
|-----------|---------|------------------|-----------------|

**How does difficulty adapt?**

**How do you prevent gaming?**

---

### 3. Matching Algorithm

**How do student profiles connect to course recommendations?**

Specify:
- Hard filters (binary exclude/include)
- Soft scores (continuous fit calculation)
- Ranking logic (how ties break)
- Diversity rules (avoiding monoculture recommendations)

**What course attributes matter?**

| Attribute | Source | How Used |
|-----------|--------|----------|

**How do you handle uncertainty?**
- When student data is sparse
- When course data is incomplete
- When prediction confidence is low

---

### 4. Results Presentation

**What does the user see?**

Describe:
- Primary output (what's most prominent)
- Supporting detail (available on request)
- Uncertainty communication (how confidence is shown)
- Actionable next steps (what user should do)

**How do you avoid decision paralysis?**

**How do you balance honesty with encouragement?**

---

### 5. Engagement Model

**Why would a 17-year-old complete this?**

Address:
- Initial hook (why start?)
- Sustained interest (why continue?)
- Return motivation (why come back?)
- Social dynamics (share, compare, compete?)

**What gamification, if any?**

If you include gamification:
- What mechanics?
- How do they enhance (not undermine) measurement?
- What's the risk of gamification backfiring?

---

### 6. Data Architecture

**What's stored?**

| Entity | Key Attributes | Relationships |
|--------|----------------|---------------|

**What's derived vs stored?**

**How do you handle:**
- Versioning (algorithm changes)
- Privacy (data minimisation)
- Portability (user data export)

---

### 7. Validation Strategy

**How do you know this works?**

| Claim | How Validated | When |
|-------|---------------|------|
| Measures X accurately | [method] | [timing] |
| Predicts Y | [method] | [timing] |
| Users find it useful | [method] | [timing] |

**What would make you abandon this approach?**

---

### 8. Evolution Path

**How does the system improve over time?**

- Short-term (user returns)
- Medium-term (aggregate learning)
- Long-term (outcome tracking)

**What feedback loops exist?**

---

### 9. Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|

Pay special attention to:
- Algorithmic bias (demographic fairness)
- Self-fulfilling prophecy (steering affects outcomes)
- Gaming at scale (if popular, will be exploited)
- Overconfidence (users trust it too much)

---

### 10. What Makes This Different

In one paragraph: why is your design better than existing approaches? What's the core insight?

---

## EVALUATION CRITERIA

Rate your own design:

| Criterion | Score (1-5) | Justification |
|-----------|-------------|---------------|
| **Measurement validity** | | Does it measure what matters? |
| **User experience** | | Would students complete it voluntarily? |
| **Actionability** | | Do outputs lead to better decisions? |
| **Honesty** | | Does it acknowledge uncertainty appropriately? |
| **Feasibility** | | Can this be built with stated resources? |
| **Novelty** | | Does this improve on existing approaches? |
| **Robustness** | | Does it handle edge cases and adversaries? |

**Minimum threshold:** No score below 3. If any criterion fails, revise before presenting.

---

## CURRENT STATE (For Mode B Only)

[INSERT EXISTING SYSTEM DESCRIPTION HERE]

If using Mode B, structure your response as:

### What to Keep (and why)
### What to Change (and how)
### What to Remove (and why)
### What to Add (and why)
### Migration Path (how to get from current to proposed)

```

---

## How to Use This Prompt

### For Green Field Design
1. Copy the prompt
2. Remove the "CURRENT STATE" section
3. Specify MODE A
4. Run with a capable model (Claude, GPT-4, etc.)
5. Evaluate output against criteria
6. Iterate on weak sections

### For Adapting ExamRizz Arena
1. Copy the prompt
2. In "CURRENT STATE", paste summary of current system:

```markdown
## CURRENT STATE

### What Exists
- 10 disposition constructs (Calibration, Tolerance, Transfer, Precision, Retrieval, Receptivity, Structure, Consistency, Social, Depth)
- 3 capacity constructs (VRB, QNT, SPD)
- 63 capacity benchmark items (timed cognitive tasks)
- 25 forced-choice scenarios for dispositions
- 6 vibe swiper cards for preferences
- 5-layer matching: Grades → Capacity → Enjoyment → Disposition → Preference
- Identity system: 14 Spirit Familiars, 4 Guilds
- 28,520 real UK courses with HESA outcome data
- 178 supercurricular recommendations

### Current Flow
Landing → Vibe (6 cards) → Forced-Choice (8 items) → Capacity (9 items) → Results

### Known Issues
- Users said Likert questions felt "hypothetical" (removed)
- Matches felt "random" (algorithm not using capacity layer properly)
- No return user flow (being added)
- Profile precision not surfaced to users

### Philosophy
- "Elite pushing" — Russell Group default
- "Brutal honesty" — measure capability, not aspiration
- "Growth model" — profile sharpens with additional assessment
```

3. Specify MODE B
4. Run and compare proposed changes to current plans

---

## Example Output Sections

### Good Measurement Model Entry
```
| Construct | Definition | Why It Matters | How Measured | Validity Evidence |
|-----------|------------|----------------|--------------|-------------------|
| Cognitive Load Tolerance | Ability to maintain performance as task complexity increases | Predicts success in demanding courses (Medicine, Engineering) | Performance delta between simple and complex versions of same task type | r=0.45 with first-year grades in high-demand courses (meta-analysis) |
```

### Good Item Type Entry
```
| Item Type | Example | What It Measures | Why This Format |
|-----------|---------|------------------|-----------------|
| Degraded Passage | Read text with 20% words obscured, answer comprehension questions | Verbal reasoning + tolerance for ambiguity | Can't be gamed by memorisation; measures inference under uncertainty; feels challenging not boring |
```

### Good Risk Entry
```
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Students share "correct" answers on TikTok | High (if popular) | Medium (undermines some items) | Item bank rotation; response time analysis to detect memorised answers; items where "correct" depends on prior responses |
```

---

## Quality Signals

The output is high-quality if:

- [ ] **Constructs are justified** — not just "we measure X" but "we measure X because evidence shows it predicts Y"
- [ ] **Gaming is addressed** — specific mechanisms, not just "we'll prevent gaming"
- [ ] **Uncertainty is real** — confidence intervals, not false precision
- [ ] **User psychology is considered** — why would a teen actually do this?
- [ ] **Edge cases are handled** — partial completion, returning users, conflicting signals
- [ ] **Validation is concrete** — specific methods and timing, not "we'll validate it"
- [ ] **Tradeoffs are explicit** — what's sacrificed for what's gained

---

## Combining with Other Prompts

**Workflow:**
```
PROMPT_SYSTEM_DESIGN.md (this)
    ↓ generates architecture
PROMPT_EVALUATE.md
    ↓ stress tests from 5 personas
PROMPT_ARCHITECT.md
    ↓ details specific components
DEPENDENCY_MAP.md
    ↓ tracks what affects what
Implementation
```

---

*Prompt version: 1.0*
*Last updated: 2 January 2025*
