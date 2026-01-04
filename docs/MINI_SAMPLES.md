# Mini-Sample Tasks — Content Specification

**Purpose:** Three 90-second "uni task previews" that form the novel core of initial onboarding. Each gives students a taste of real university work while capturing performance, preference, and engagement signals.

**Philosophy:** These aren't tests — they're previews. Students should finish thinking "oh, so that's what studying X is actually like."

---

## Overview

| Task | Cluster Signal | Feels Like | Captures |
|------|----------------|------------|----------|
| **Code Trace** | Computing, Engineering, Maths | Problem-solving puzzle | Logic, sequential reasoning, debugging mindset |
| **Source Analysis** | Humanities, Law, Social Sciences | Critical reading | Comprehension, argument evaluation, inference |
| **Data Interpretation** | Sciences, Psychology, Economics, Business | Lab/research analysis | Evidence evaluation, statistical intuition, conclusion-drawing |

**All three completed in onboarding.** Order randomised. ~4.5 min total for this section.

---

## Task 1: Code Trace

### Framing
> "Computer Science and Engineering students spend a lot of time reading and understanding code. Here's a taste."

### Stimulus
```python
def mystery(items):
    result = []
    for i in range(len(items)):
        if i == 0:
            result.append(items[i])
        elif items[i] != items[i-1]:
            result.append(items[i])
    return result

output = mystery([3, 3, 3, 7, 7, 2, 2, 2, 2, 8])
```

### Question (Multi-part)

**Part 1:** What does `output` contain after running this code?

- A) `[3, 7, 2, 8]` ✓
- B) `[3, 3, 3, 7, 7, 2, 2, 2, 2, 8]`
- C) `[8, 2, 7, 3]`
- D) `[3, 7, 2, 2, 8]`
- E) I'm not sure

**Part 2:** In one sentence, what does this function do?

*(Free text, scored against rubric)*

**Ideal answers:**
- "Removes consecutive duplicates" (3 pts)
- "Keeps only elements that are different from the previous one" (3 pts)
- "Removes duplicates" (1 pt — partially correct, misses "consecutive")
- "Filters the list" (0 pts — too vague)

### Scoring Rubric

| Component | Points | Criteria |
|-----------|--------|----------|
| Part 1 correct | 2 | Selected A |
| Part 1 "not sure" | 0.5 | Honest uncertainty (calibration signal) |
| Part 2 precise | 3 | Mentions "consecutive" or equivalent |
| Part 2 partial | 1 | Correct direction but imprecise |
| **Max score** | **5** | |

### Behavioural Capture

| Signal | What It Indicates | How Captured |
|--------|-------------------|--------------|
| Time on Part 1 | Processing speed | Timestamp delta |
| Time on Part 2 | Verbal formulation effort | Timestamp delta |
| Changed Part 1 answer | Revision behaviour | Track selections |
| Skipped Part 2 | Avoidance of open-ended | Null response |

### Post-Task

> "How was that?"
> 😫 Not for me — 😐 Okay — 😊 I liked this

---

## Task 2: Source Analysis

### Framing
> "Humanities, Law, and Social Science students spend a lot of time analysing arguments. Here's a taste."

### Stimulus

> **Extract from a university admissions debate:**
>
> "Contextual admissions — where universities lower grade requirements for students from disadvantaged backgrounds — are fundamentally unfair. A student who achieves AAB has demonstrably performed better than one who achieves BBB, regardless of their circumstances. By admitting the BBB student, we're saying that grades don't actually matter, which undermines the entire purpose of A-levels. Furthermore, the AAB student who loses their place may themselves come from a family that made significant sacrifices for their education. Contextual admissions simply replace one form of unfairness with another."

### Question (Multi-part)

**Part 1:** What is the author's main claim?

- A) A-levels are not a reliable measure of ability
- B) Contextual admissions are unfair to higher-achieving applicants ✓
- C) Universities should only consider grades in admissions
- D) Disadvantaged students cannot succeed at university
- E) I'm not sure

**Part 2:** Which of these, if true, would most weaken the author's argument?

- A) Many universities already use contextual admissions successfully
- B) Students admitted with lower grades due to context perform equally well at university ✓
- C) Some employers prefer graduates from universities that use contextual admissions
- D) The author attended a private school
- E) I'm not sure

**Part 3:** The author assumes that... (select all that apply, max 3)

- ☐ A-level grades accurately reflect student potential ✓
- ☐ University places are zero-sum (one student's gain is another's loss) ✓
- ☐ All students have equal access to A-level preparation ✗ (author ignores this)
- ☐ Contextual admissions consider only socioeconomic background
- ☐ The AAB student will definitely not get a place elsewhere

**Correct selections:** First two are assumptions the author makes. Third is what the author fails to consider (trap option).

### Scoring Rubric

| Component | Points | Criteria |
|-----------|--------|----------|
| Part 1 correct | 1 | Selected B |
| Part 2 correct | 2 | Selected B (harder — requires reasoning) |
| Part 3: 2 correct, 0 wrong | 2 | Selected first two only |
| Part 3: 2 correct, 1 wrong | 1 | Partial credit |
| Part 3: selected trap (third option) | 0 | Common error — conflates "assumption" with "oversight" |
| **Max score** | **5** | |

### Behavioural Capture

| Signal | What It Indicates | How Captured |
|--------|-------------------|--------------|
| Re-read stimulus | Careful vs impulsive | Scroll/focus tracking |
| Time on Part 2 | Reasoning depth | Timestamp delta |
| Part 3 selection order | What jumps out first | Selection timestamps |
| Changed answers | Self-correction | Track all selections |

### Post-Task

> "How was that?"
> 😫 Not for me — 😐 Okay — 😊 I liked this

---

## Task 3: Data Interpretation

### Framing
> "Science, Psychology, and Economics students spend a lot of time interpreting research findings. Here's a taste."

### Stimulus

> **Study Summary:**
>
> Researchers investigated whether background music affects revision effectiveness. 120 A-level students were randomly assigned to three groups:
>
> - **Group A (40 students):** Revised with classical music
> - **Group B (40 students):** Revised with pop music with lyrics  
> - **Group C (40 students):** Revised in silence
>
> After 45 minutes of revision, all students took the same test.
>
> | Group | Mean Score | Standard Deviation |
> |-------|------------|-------------------|
> | Classical | 72% | 12 |
> | Pop/Lyrics | 61% | 15 |
> | Silence | 70% | 11 |
>
> The researchers concluded: "Classical music significantly improves revision effectiveness compared to other conditions."

### Question (Multi-part)

**Part 1:** Based on the data, which statement is best supported?

- A) Classical music causes better test performance
- B) Pop music with lyrics may interfere with revision more than silence ✓
- C) Students should always revise with classical music
- D) The study proves music improves memory
- E) I'm not sure

**Part 2:** What is a problem with the researchers' conclusion? (Select the most important)

- A) 40 students per group is too few
- B) The difference between classical (72%) and silence (70%) is small and may not be meaningful ✓
- C) They didn't test other genres of music
- D) A-level students aren't representative of all students
- E) I'm not sure

**Part 3:** If you were advising a friend based on this study, what would you say?

- A) "Definitely revise with classical music — science proves it works"
- B) "Avoid pop music with lyrics, but silence or classical are probably similar" ✓
- C) "This study is useless — ignore it completely"
- D) "Music doesn't affect revision at all"
- E) I'm not sure

### Scoring Rubric

| Component | Points | Criteria |
|-----------|--------|----------|
| Part 1 correct | 1.5 | Selected B (cautious, evidence-based) |
| Part 1 selected A | 0.5 | Overclaims causation but directionally right |
| Part 2 correct | 2 | Selected B (identifies key statistical issue) |
| Part 3 correct | 1.5 | Selected B (appropriate real-world application) |
| **Max score** | **5** | |

### Behavioural Capture

| Signal | What It Indicates | How Captured |
|--------|-------------------|--------------|
| Time looking at table | Data engagement | Focus tracking |
| Selected "I'm not sure" | Calibration / disengagement | Response |
| Part 3 matches Part 1/2 logic | Internal consistency | Cross-check |

### Post-Task

> "How was that?"
> 😫 Not for me — 😐 Okay — 😊 I liked this

---

## Cluster Mapping

### How Performance Maps to Course Fit

| Task | Strong Performance + Enjoyed | Strong Performance + Disliked | Weak Performance + Enjoyed | Weak Performance + Disliked |
|------|------------------------------|-------------------------------|----------------------------|----------------------------|
| **Code Trace** | Boost: Computing, Engineering, Maths | Capable but other interests — note | Interest without current skill — developmental | Reduce: Computing, Engineering |
| **Source Analysis** | Boost: Humanities, Law, Politics, Social Sciences | Capable but other interests — note | Interest without current skill — developmental | Reduce: Essay-heavy courses |
| **Data Interpretation** | Boost: Sciences, Psychology, Economics, Business | Capable but other interests — note | Interest without current skill — developmental | Reduce: Research-heavy courses |

### How Choice Order Signals Preference

If students could choose order (optional enhancement):
- First choice = strongest pull
- Last choice = least interest (but still completed)

For MVP: randomise order, weight by enjoyment rating instead.

---

## Alternative/Extended Tasks (For Full Test)

### Code Trace Variants
- **Easier:** Simple loop, count occurrences
- **Harder:** Recursion, multiple functions calling each other
- **Different:** SQL query interpretation, spreadsheet formula

### Source Analysis Variants
- **Easier:** Identify main argument only (no assumptions)
- **Harder:** Compare two opposing extracts, evaluate which is stronger
- **Different:** Legal case brief, scientific abstract critique

### Data Interpretation Variants
- **Easier:** Single comparison, obvious conclusion
- **Harder:** Confounding variables, correlation vs causation
- **Different:** Graph reading, experimental design critique

---

## Database Schema

```sql
CREATE TABLE bo_v1_mini_sample_items (
  id TEXT PRIMARY KEY,
  sample_type TEXT CHECK (sample_type IN ('CODE_TRACE', 'SOURCE_ANALYSIS', 'DATA_INTERPRETATION')),
  difficulty TEXT CHECK (difficulty IN ('FOUNDATION', 'STANDARD', 'CHALLENGE')),
  stimulus TEXT NOT NULL,
  questions JSONB NOT NULL,  -- Array of question parts
  correct_answers JSONB NOT NULL,
  scoring_rubric JSONB NOT NULL,
  max_score DECIMAL DEFAULT 5,
  time_limit_seconds INTEGER DEFAULT 90,
  cluster_tags TEXT[],  -- Which course clusters this maps to
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE bo_v1_mini_sample_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES bo_v1_sessions(id),
  item_id TEXT REFERENCES bo_v1_mini_sample_items(id),
  responses JSONB NOT NULL,  -- All parts
  scores JSONB NOT NULL,  -- Per-part scores
  total_score DECIMAL,
  time_spent_ms INTEGER,
  revision_count INTEGER DEFAULT 0,
  enjoyment_rating INTEGER CHECK (enjoyment_rating BETWEEN 1 AND 3),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## UI Notes

### Task Presentation
- Show timer (90 seconds) but don't auto-submit — warn at 15s remaining
- Allow moving between parts within task
- "Submit" button when ready
- Show which task (1/3, 2/3, 3/3)

### Skip Behaviour
- Any task skippable: "Skip this one"
- If skipped: no score, no enjoyment rating, still counts as "seen"
- At least 1 must be completed for meaningful results

### Responsive Considerations
- Code block must be readable on mobile (horizontal scroll or smaller font)
- Table in Data Interpretation needs mobile treatment
- Free text (Code Trace Part 2) — single line input, not textarea

---

## Validation Criteria

Implementation is correct if:

- [ ] All three tasks display correctly on mobile
- [ ] Timer shows and warns at 15 seconds
- [ ] Partial credit scoring matches rubric
- [ ] Enjoyment rating captured after each task
- [ ] Time spent tracked accurately
- [ ] Revision count increments on answer changes
- [ ] Skip works and records appropriately
- [ ] Results feed into cluster boosting in matching algorithm

---

*Version: 1.0*
*Created: 3 January 2025*
