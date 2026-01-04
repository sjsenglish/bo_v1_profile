# Forced-Choice Question Bank

**Purpose:** Complete reference for forced-choice scenario items — questions, construct mappings, scoring logic, and implementation notes.

**Version:** 1.0
**Total Items:** 25
**Per Session:** 15-18 (randomised selection)

---

## 1. Design Principles

### Anti-Gaming
- Both options equally valid — no obvious "good" answer
- Scenario-based — "You're in X situation" not "Are you X type?"
- Trade-off framed — choosing A means giving up B
- Construct hidden — student shouldn't know what's measured
- 8-10 second time limit — gut response, no calculation

### Measurement
- Binary choice = primary signal
- Optional comment = modifier/context
- 4 items per primary construct = α ~0.80 reliability
- Consistency across scenarios = confidence level

### Comments Feature
After each item, optional field:
> "Want to add context? (optional)"
> [100 character limit]

AI extracts:
- Nuance signals ("depends on subject")
- Conflict flags ("neither really")
- Gaming tells ("doctors need teamwork so A")
- Calibration signals ("I say B but should be more A")

Comments modify confidence intervals, don't override choice.

---

## 2. Construct Definitions

### Primary Constructs (4 items each)
Cannot be captured behaviourally in solo test.

| Construct | Definition | High Scorer | Low Scorer |
|-----------|------------|-------------|------------|
| **Social** | Preference for collaborative vs independent work | Learns through interaction, seeks groups, energised by collaboration | Prefers ownership, processes independently, finds groups inefficient |
| **Receptivity** | Openness to external feedback and criticism | Seeks feedback actively, treats criticism as data, low defensiveness | Trusts own judgment, defensive when challenged, processes internally |
| **Transfer** | Preference for cross-domain connection vs single-domain mastery | Sees patterns across domains, interdisciplinary, generalises readily | Prefers depth in one area, finds cross-domain distracting, values mastery |
| **Structure** | Need for guidance, clarity, and explicit expectations | Needs clear expectations, works best with defined criteria, dislikes ambiguity | Thrives with open briefs, self-directs, finds rigid structure limiting |
| **Depth** | Preference for specialisation vs breadth | Wants mastery, goes deep, identifies with specialism | Breadth-seeking, curious about many things, resists narrowing |

### Backup Constructs (1 item each)
Primarily captured via benchmark behaviour; forced-choice provides fallback if benchmarks skipped.

| Construct | Definition | Primary Measurement |
|-----------|------------|---------------------|
| **Calibration** | Accuracy of self-assessment | Confidence vs correctness on benchmark items |
| **Tolerance** | Persistence through difficulty | Skip patterns, time on hard items, performance decay |
| **Precision** | Preference for accuracy over speed | Speed/accuracy tradeoff, error patterns |
| **Retrieval** | Comfort with recall under pressure | Timed recall performance |
| **Consistency** | Steady vs burst work pattern | Response time variance across session |

---

## 3. Question Bank

### SOCIAL (4 items)

#### SOC_01
**Scenario:** Problem-solving under pressure
> It's 10pm and you're stuck on a problem that's due tomorrow.
>
> A) Message the group chat to see if anyone's figured it out
> B) Grind through it alone — you'll learn more that way

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Social+ | Help-seeking behaviour under pressure |
| B | Social− | Self-reliant problem-solving |

---

#### SOC_02
**Scenario:** Revision method
> You're revising for an exam. Which is more useful?
>
> A) Explaining concepts to someone else
> B) Writing your own notes in silence

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Social+ | Learning-through-teaching preference |
| B | Social− | Solo consolidation preference |

---

#### SOC_03
**Scenario:** Project setup choice
> A new project lets you choose your setup.
>
> A) Team of 4, shared responsibilities
> B) Solo, full ownership of outcome

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Social+ | Shared accountability preference |
| B | Social− | Individual ownership preference |

---

#### SOC_04
**Scenario:** Post-exam processing
> You've just finished a tough mock exam. What next?
>
> A) Find others to compare answers and talk through the tricky questions
> B) Head home and process it in your own head first

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Social+ | Social processing of stress |
| B | Social− | Solitary processing preference |

---

### RECEPTIVITY (4 items)

#### REC_01
**Scenario:** Unexpected critical feedback from authority
> Your teacher gives unexpected critical feedback on work you thought was good.
>
> A) Ask them to explain what you missed — probably a blind spot
> B) Defend your approach — you had good reasons

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Receptivity+ | Curiosity about blind spots |
| B | Receptivity− | Confidence in own judgment |

---

#### REC_02
**Scenario:** Peer correction in public
> A classmate points out a flaw in your argument during a discussion.
>
> A) Appreciate it — better to fix it now
> B) Annoying — they could've said it privately

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Receptivity+ | Low ego attachment to being right |
| B | Receptivity− | Face-preservation instinct |

**Note:** Option B may feel "obviously bad" to some. Monitor comment data for defensive responses.

---

#### REC_03
**Scenario:** Lower grade than expected
> You get a lower grade than expected. What's your first instinct?
>
> A) Ask for detailed feedback on where you lost marks
> B) Move on and focus on the next assignment

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Receptivity+ | Active feedback-seeking |
| B | Receptivity− | Forward-focused, doesn't dwell |

---

#### REC_04
**Scenario:** Feedback on personal/identity-attached work
> A friend reads your personal statement draft and suggests major changes.
>
> A) Useful — fresh eyes catch things you can't see yourself
> B) Uncomfortable — they don't really get what I was going for

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Receptivity+ | Open to critique on personal work |
| B | Receptivity− | Protective of self-expression |

---

### TRANSFER (4 items)

#### TRF_01
**Scenario:** Module selection
> Two modules are available. Which appeals more?
>
> A) "Connections: Physics, Philosophy and Economics"
> B) "Advanced Quantum Mechanics"

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Transfer+ | Interdisciplinary preference |
| B | Transfer− | Single-domain depth preference |

**Note:** Module titles may be unfamiliar. Consider adding brief descriptors if comprehension issues arise.

---

#### TRF_02
**Scenario:** Problem-solving instinct
> You're solving a new problem. What's your instinct?
>
> A) "This reminds me of something from another subject..."
> B) "Let me find the specific method for this type of problem"

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Transfer+ | Cross-domain pattern matching |
| B | Transfer− | Method-specific approach |

---

#### TRF_03
**Scenario:** Valued compliment
> Which compliment would mean more to you?
>
> A) "You make unexpected connections between ideas"
> B) "You really know this subject inside-out"

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Transfer+ | Values breadth/connection |
| B | Transfer− | Values depth/expertise |

---

#### TRF_04
**Scenario:** What makes a subject click
> When a subject really clicks for you, what's usually happening?
>
> A) I'm seeing how it connects to other things I've learned
> B) I'm getting deeper into how this specific thing works on its own

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Transfer+ | Connection-driven engagement |
| B | Transfer− | Depth-driven engagement |

---

### STRUCTURE (4 items)

#### STR_01
**Scenario:** Course format preference
> Two courses cover the same content. Which sounds better?
>
> A) Weekly problem sets, clear rubric, structured lectures
> B) One final project, open brief, find your own sources

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Structure+ | Prefers defined workload structure |
| B | Structure− | Prefers autonomy and open-endedness |

---

#### STR_02
**Scenario:** Response to ambiguous instruction
> Your teacher says "interpret the question however you want." Your reaction?
>
> A) Frustrating — just tell me what you're looking for
> B) Great — I can take it somewhere interesting

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Structure+ | Low ambiguity tolerance |
| B | Structure− | High ambiguity tolerance |

---

#### STR_03
**Scenario:** Entry point for new topic
> Starting a new topic. What do you want first?
>
> A) The syllabus, mark scheme, and worked examples
> B) An interesting problem to mess around with

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Structure+ | Framework-first learner |
| B | Structure− | Exploration-first learner |

---

#### STR_04
**Scenario:** First week orientation needs
> First week of a new course. What do you want to know first?
>
> A) How I'll be assessed, what's expected, what good work looks like
> B) Why this subject matters and what the interesting questions are

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Structure+ | Assessment-oriented entry |
| B | Structure− | Meaning-oriented entry |

---

### DEPTH (4 items)

#### DEP_01
**Scenario:** Free time learning allocation
> You have a free afternoon to learn something new.
>
> A) Deep-dive one rabbit hole for 3 hours
> B) Skim 10 different interesting topics

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Depth+ | Time concentration on single topic |
| B | Depth− | Time distribution across topics |

---

#### DEP_02
**Scenario:** University experience aspiration
> Which university experience sounds better?
>
> A) Becoming the person everyone asks about [your subject]
> B) Being able to hold conversations across lots of fields

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Depth+ | Expertise identity aspiration |
| B | Depth− | Generalist identity aspiration |

---

#### DEP_03
**Scenario:** Response to fascinating topic
> You find a topic fascinating. What next?
>
> A) Read everything until you've exhausted it
> B) Note it down and explore something else too

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Depth+ | Completion-driven curiosity |
| B | Depth− | Sampling-driven curiosity |

---

#### DEP_04
**Scenario:** Self-description identity
> Someone asks what you're into. What feels more satisfying to say?
>
> A) "I'm really into [one specific thing] — ask me anything"
> B) "Lots of stuff — I find most things interesting"

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Depth+ | Specialist identity framing |
| B | Depth− | Generalist identity framing |

---

### BACKUP ITEMS (5 items)

#### CAL_01 — Calibration
**Scenario:** Post-exam prediction accuracy
> After finishing an exam, a friend asks how you did.
>
> A) I usually have a pretty good sense before results come out
> B) Honestly no idea — I'm often surprised by my grade

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Calibration+ | Accurate self-prediction |
| B | Calibration− | Poor outcome prediction |

---

#### TOL_01 — Tolerance
**Scenario:** Persistence threshold
> You've been stuck on something for 45 minutes with no progress.
>
> A) Keep going — breakthroughs often come right after the frustration
> B) Switch to something else — diminishing returns

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Tolerance+ | High frustration persistence |
| B | Tolerance− | Efficiency-focused switching |

---

#### PRE_01 — Precision
**Scenario:** Small inconsistency decision
> You're nearly done with an assignment but spot a small inconsistency.
>
> A) Fix it properly — details matter
> B) Leave it — it's not worth the time for something minor

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Precision+ | Detail completion priority |
| B | Precision− | Pragmatic trade-off |

---

#### RET_01 — Retrieval
**Scenario:** Exam readiness feeling
> You're revising. What makes you feel ready for the exam?
>
> A) I can recall the key facts without looking
> B) I understand the concepts well enough to figure it out

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Retrieval+ | Memory-based confidence |
| B | Retrieval− | Understanding-based confidence |

---

#### CON_01 — Consistency
**Scenario:** Work pattern
> How does your work pattern usually look?
>
> A) Steady effort spread across the week
> B) Bursts of intensity closer to deadlines

| Choice | Score | Reveals |
|--------|-------|---------|
| A | Consistency+ | Distributed effort |
| B | Consistency− | Concentrated effort |

**Note:** Most transparent item — "steady vs bursts" is almost literal trait description. Consider more scenario-based alternative if gaming detected.

---

## 4. Scoring Logic

### Per Item
```
Choice A → dimension_score += weight
Choice B → dimension_score -= weight
Default weight = 1.0
```

### Per Construct
```
raw_score = sum(item_scores)  // Range: -4 to +4 for primary, -1 to +1 for backup
normalised = ((raw_score + max) / (2 * max)) * 100  // Range: 0-100
```

### Confidence Adjustment
| Response Pattern | Confidence | Action |
|------------------|------------|--------|
| All same direction (AAAA or BBBB) | High | Use narrow interval |
| Mixed but leaning (AAAB, ABAA) | Medium | Use standard interval |
| Split (AABB, ABAB) | Low | Use wide interval |
| Comment indicates conflict | Lower | Widen interval further |
| Comment indicates gaming | Flag | Discount item |

### Example Calculation

Student answers Social items:
- SOC_01: A (+1)
- SOC_02: B (-1)
- SOC_03: B (-1)
- SOC_04: A (+1)

```
raw_score = +1 -1 -1 +1 = 0
normalised = ((0 + 4) / 8) * 100 = 50
confidence = LOW (split pattern)
```

Result: Social = 50 ± 15 (wide interval due to inconsistency)

---

## 5. Session Selection

### Rules
- Serve 15-18 items per session
- All 4 items from at least 3 primary constructs
- At least 2 items from remaining 2 primary constructs
- Include 2-3 backup items (randomised)
- Randomise order within session
- Track which items served for retake variation

### Example Session (16 items)
```
SOC_01, SOC_02, SOC_03, SOC_04  // Full social
REC_01, REC_02, REC_03, REC_04  // Full receptivity
TRF_01, TRF_02, TRF_03, TRF_04  // Full transfer
STR_01, STR_03                   // Partial structure
DEP_02, DEP_04                   // Partial depth
TOL_01, PRE_01                   // Backups
```

---

## 6. Implementation Notes

### Timing
- 8-10 seconds per item
- Timer visible but not aggressive
- Auto-advance on timeout (count as skip, not random selection)
- Skipped items: no score contribution, flag for wider interval

### UI Flow
```
[Scenario text]

     [A button]              [B button]

[Optional: "Add context?" → small text field]

[Progress: 3/16]                    [Skip →]
```

### Skip Handling
- Skipped items don't contribute to score
- 3+ skips in same construct → flag construct as "insufficient data"
- Show skipped count at end, offer to return

### Comment Analysis (Post-Processing)
AI reviews all comments for:
1. **Nuance flags:** "depends on..." → note context
2. **Conflict flags:** "neither" / "both" → widen interval
3. **Gaming flags:** "because [desired outcome] requires..." → discount
4. **Insight flags:** "I say X but should be Y" → calibration signal

---

## 7. Course Matching Integration

### Results Presentation

**Tier 1: Top Matches**
Elite institutions (Russell Group) with best fit scores.
> "Best courses at top universities for your profile"

**Tier 2: Best Fit For You**
Highest disposition + enjoyment fit regardless of prestige.
> "Courses that match your preferences most closely"

### Fit Calculation

Disposition contributes to fit score using Floor vs Fit logic:

| Disposition | Type | Deficit Penalised | Excess Penalised |
|-------------|------|-------------------|------------------|
| Social | FIT | Yes | Yes |
| Receptivity | FIT | Yes | Yes |
| Transfer | FIT | Yes | Yes |
| Structure | FIT | Yes | Yes |
| Depth | FIT | Yes | Yes |
| Calibration | FLOOR | Yes | No |
| Tolerance | FLOOR | Yes | No |
| Precision | FLOOR | Yes | No |
| Retrieval | FLOOR | Yes | No |
| Consistency | FIT | Yes | Yes |

---

## 8. Validation Plan

### Phase 1: Face Validity
- Review with 3-5 target users
- Check comprehension of scenarios
- Identify confusing wording

### Phase 2: Construct Validity
- Run with 50+ users
- Check internal consistency (do items in same construct correlate?)
- Flag items that don't load on expected factor

### Phase 3: Predictive Validity (Long-term)
- Track user outcomes where possible
- Correlate disposition scores with course satisfaction
- Refine weights based on outcome data

---

## 9. Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | [today] | Initial 25-item bank |

---

*Status: Ready for implementation*
