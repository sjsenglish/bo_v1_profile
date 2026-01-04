# ExamRizz Arena — Research Foundation

Condensed findings from the 120-page Assessment Framework that inform product decisions.

**Source:** ASSESSMENT_FRAMEWORK_MAIN.docx  
**Last Updated:** 1 January 2025

---

## Executive Summary

The research strongly supports three key shifts:

1. **Increase cognitive testing** — Cognitive ability (g) is the strongest predictor of academic success (r = 0.50-0.81), far exceeding personality measures (r = 0.23-0.26)

2. **Use forced-choice for personality** — Reduces faking by d = 0.34 compared to Likert scales

3. **Measure calibration behaviourally** — Post-item confidence ratings are more valid than self-report metacognition

---

## 1. Validity Hierarchy

### What Predicts University Success?

| Factor | Validity (r) | Min Time | Fakability | Notes |
|--------|-------------|----------|------------|-------|
| Cognitive Ability (g) | 0.50-0.81 | 10-15 min | Very Low | Strongest predictor |
| Verbal Reasoning | 0.35-0.50 | 5-10 min | Low | High course differentiation |
| Quantitative Reasoning | 0.40-0.55 | 5-10 min | Low | High course differentiation |
| Conscientiousness | 0.23-0.26 | 2-5 min | HIGH | Moderate predictor, highly fakeable |
| Self-Efficacy | 0.30-0.45 | 2-3 min | Medium-High | Calibration matters more |
| Grit | 0.16-0.26 | 2-3 min | HIGH | Redundant with conscientiousness |
| Interest Fit | 0.10-0.20 | 2-3 min | Medium | Better for satisfaction than performance |

**Key Insight:** A 15-minute cognitive test predicts academic success better than any amount of self-report personality assessment.

---

## 2. Key Research Findings

### 2.1 Cognitive Ability Dominates

> "Correlation between g and GCSE performance: r = 0.81"  
> — Deary et al. (2007), N = 70,000 UK students

**Implication:** Cognitive ability should be the primary matching signal, not a supplementary measure.

### 2.2 Subject-Specific g-Loading

Different subjects require different amounts of cognitive ability:

| Subject | Variance Explained by g |
|---------|------------------------|
| Mathematics | 58.6% |
| English | 48.5% |
| Physics | 46.3% |
| Art & Design | 18.1% |

**Implication:** Cognitive profiles (verbal vs quantitative strength) meaningfully differentiate course suitability.

### 2.3 Grit Is Redundant

> "Grit correlates ρ > 0.80 with conscientiousness... does NOT show incremental validity over conscientiousness for academic performance"  
> — Credé et al. (2017)

**Implication:** Don't measure grit separately. If measuring persistence, fold it into conscientiousness or tolerance.

### 2.4 Self-Report Faking Is Substantial

> "Job applicants score d = 0.61 higher on personality tests than non-applicants"  
> — Birkeland et al. (2006)

Students completing a "which course is right for me" assessment have similar incentives to present favourably.

**Implication:** Self-report personality measures are compromised in high-stakes contexts.

### 2.5 Forced-Choice Reduces Faking

| Format | Mean Score Inflation (d) |
|--------|-------------------------|
| Likert | 0.75 |
| Forced-Choice | 0.41 |

> — Salgado et al. (2021)

**Implication:** Forced-choice format reduces faking by approximately 45%.

### 2.6 Short Tests Maintain Validity

> "9-item Raven's correlates r = 0.98 with full 60-item version"  
> — Bilker et al. (2012)

| Items | Reliability (α) |
|-------|----------------|
| 12 | 0.78-0.82 |
| 20 | 0.85-0.88 |

**Implication:** 15 well-chosen cognitive items can achieve strong reliability without user fatigue.

### 2.7 Calibration > Confidence

> "Measure self-efficacy AFTER completing reasoning tasks. Ask 'How confident are you that you answered correctly?' This captures calibration (accuracy of self-assessment) rather than just confidence level."

**Implication:** Integrate confidence prompts into capacity benchmarks rather than relying on self-report calibration questions.

---

## 3. Evidence-Based Weighting

### Current (Implicit) Weighting

| Component | Weight |
|-----------|--------|
| Self-report dispositions | ~90% |
| Capacity benchmarks | ~10% (proxied) |
| Vibe preferences | ~0% |

### Research-Supported Weighting

| Component | Recommended Weight |
|-----------|-------------------|
| Cognitive ability (capacity) | ~55% |
| Conscientiousness (forced-choice) | ~25% |
| Interest/Fit (vibe + preferences) | ~20% |

**Rationale:** Weights based on relative validity coefficients, adjusted for fakability.

---

## 4. Forced-Choice Design Principles

### Why Forced-Choice Works

1. **Removes acquiescence bias** — Can't just agree with everything
2. **Controls social desirability** — Both options equally "good"
3. **Forces discrimination** — Must reveal actual preference
4. **Mirrors real decisions** — University choice is itself forced-choice

### Good Forced-Choice Question

```
Think about your last important test. Which is closer to your experience?

A: I walked out knowing roughly how I'd done — and I was right within a grade
B: I genuinely couldn't tell until I got the paper back
```

**Why it works:**
- Concrete situation (not hypothetical)
- Both options socially neutral
- Behavioural, not attitudinal
- Maps to CALIBRATION disposition

### Bad Forced-Choice Question

```
Which describes you better?

A: I'm a hard worker
B: I'm not a hard worker
```

**Why it fails:**
- Obviously "correct" answer
- Social desirability not controlled
- No real forced choice

---

## 5. Matching Algorithm Recommendations

### 5.1 Hybrid Model

Research supports a **threshold + compensatory** approach:

1. **Non-compensatory gate:** If cognitive ability below threshold for course demands, flag as high-risk
2. **Compensatory scoring:** Above threshold, combine cognitive + personality + fit

### 5.2 Soft Thresholds

Don't use hard cut-offs. Use logistic probability curves:

```
P(success) = 1 / (1 + exp(-k * (ability - threshold)))
```

This allows "stretch" recommendations while flagging risk.

### 5.3 Dual Outputs

Separate predictions for:
- **"Succeed"** — Will they pass? (cognitive-dominant)
- **"Thrive"** — Will they enjoy it? (fit-dominant)

### 5.4 Honest Uncertainty

Show prediction intervals, not point estimates:
- "75% match" is false precision
- "65-85% confidence interval" is honest

---

## 6. Course Demand Framework

### 6.1 Entry Tariffs Proxy Cognitive Threshold

| UCAS Points | Interpretation |
|-------------|----------------|
| 168+ | A*A*A* equivalent — very high cognitive demand |
| 144 | AAA equivalent — high cognitive demand |
| 120 | BBB equivalent — moderate cognitive demand |
| 96 | CCC equivalent — lower cognitive threshold |
| 48 | EE equivalent — accessible entry |

### 6.2 Continuation Rates Indicate Difficulty

| Course Type | Typical Continuation |
|-------------|---------------------|
| Medicine | 98% |
| Law | 92% |
| Computer Science | 85-87% |
| Creative Arts | 88% |

Low continuation = high dropout = course demands exceed typical entrant capabilities

### 6.3 LEO Salary Data Validates Demands

| Course | Median Salary (3yr) |
|--------|---------------------|
| Medicine | £52,600 |
| Engineering | £32,400 |
| Computer Science | £30,000 |
| Psychology | £24,500 |
| Performing Arts | £22,600 |

Higher salaries generally correlate with higher cognitive demands and selectivity.

---

## 7. Disposition-to-Demand Mapping

### High Validity Mappings

| Disposition | Course Characteristic | Evidence |
|-------------|----------------------|----------|
| CALIBRATION | Exam-heavy (>60% exam) | Metacognitive monitoring predicts exam performance |
| TOLERANCE | Low continuation rate | Persistence predicts completion |
| PRECISION | Lab/practical work | Error sensitivity critical for technical fields |
| RETRIEVAL | Cumulative content | Spaced retrieval predicts knowledge retention |

### Lower Validity Mappings

| Disposition | Course Characteristic | Concern |
|-------------|----------------------|---------|
| SOCIAL | Group work | Predicts satisfaction, not performance |
| STRUCTURE | High contact hours | May reflect preference, not capability |
| CONSISTENCY | Regular deadlines | Highly overlaps with conscientiousness |

---

## 8. Validation Strategy

### Minimum Viable Validation

1. **Pilot sample:** N ≥ 200 completions
2. **Internal consistency:** Cronbach's α ≥ 0.70 for each scale
3. **DIF analysis:** Check for gender/ethnicity/SES bias
4. **User testing:** N ≥ 50 qualitative interviews

### Ideal Validation (Longitudinal)

Track users through:
- First-year pass rate
- Year 2 continuation
- NSS satisfaction scores
- Degree classification
- Graduate employment

**Timeline:** 3-5 years for full validation cycle

---

## 9. Capacity Item Design

### Verbal Reasoning (VRB)

**Recommended item types:**
- Reading comprehension passages
- Verbal analogies ("doctor : patient :: teacher : ?")
- Critical reading (identifying arguments, assumptions)
- Vocabulary in context (NOT definitions)

**Avoid:**
- Knowledge-based questions (tests A-level content)
- Pure vocabulary tests (culturally biased)

### Quantitative Reasoning (QNT)

**Recommended item types:**
- Data interpretation from graphs/tables
- Word problems requiring mathematical modelling
- Percentage, ratio, proportion problems
- Statistical reasoning (means, variability)

**Avoid:**
- A-level maths content directly
- Calculator-dependent computation

### Processing Speed (SPD)

**Recommended item types:**
- Symbol-digit substitution
- Pattern comparison (same/different)
- Simple reaction time tasks

**Note:** Measures efficiency under time pressure, not knowledge

---

## 10. Research Citations

### Core References

| Citation | Finding |
|----------|---------|
| Deary et al. (2007) | g correlates r = 0.81 with GCSE performance (N = 70,000) |
| Poropat (2009) | Conscientiousness meta-analysis: r = 0.23 |
| Richardson et al. (2012) | 241 datasets, 50 correlates of university grades |
| Credé et al. (2017) | Grit meta-analysis: redundant with conscientiousness |
| Birkeland et al. (2006) | Faking in selection contexts: d = 0.61 |
| Salgado et al. (2021) | Forced-choice reduces faking by d = 0.34 |
| Bilker et al. (2012) | Short-form Raven's validity: r = 0.98 with full version |
| Schmidt & Hunter (1998) | GMA validity meta-analysis |
| Vedel (2014) | Big Five and tertiary performance |

---

## 11. Summary: Design Implications

| Current Design | Research Says | Recommended Change |
|----------------|---------------|-------------------|
| 40 Likert questions | High fakability, moderate validity | Replace with 8-12 forced-choice |
| Capacities proxied | Cognitive ability is strongest predictor | Build capacity benchmark UI |
| Self-report CALIBRATION | Behaviour-based is more valid | Integrate confidence prompts |
| 10 dispositions equally weighted | Some redundant, some low validity | Consolidate or re-weight |
| ~90% self-report weighting | Should be ~25-30% | Shift to ~55% cognitive |
| Point estimate matches | False precision | Show confidence intervals |

---

## Appendix: Research Quality Notes

**Strongest Evidence:**
- Cognitive ability → academic performance (multiple meta-analyses, N > 100,000)
- Conscientiousness → academic performance (Poropat meta-analysis)
- Forced-choice reduces faking (Salgado meta-analysis)

**Moderate Evidence:**
- Subject-specific g-loading differences (single large UK study)
- Short-form test validity (multiple studies, smaller N)

**Weaker Evidence:**
- Specific disposition → specific course demand mappings (theoretical, limited empirical validation)
- Fit → satisfaction (fewer longitudinal studies)

---

**END OF RESEARCH FOUNDATION**
