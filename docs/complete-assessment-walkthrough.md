# ExamRizz Arena — Complete Assessment Walkthrough

**Student:** Sarah (Year 12, studying Biology, Chemistry, Maths)  
**Interests:** Wants to help people, enjoys science, likes problem-solving  
**Time:** 16 minutes total

---

## STAGE 1: Landing & Introduction (1 min)

**Landing Page:**
```
┌────────────────────────────────────────┐
│  EXAMRIZZ ARENA                        │
│                                        │
│  Find your perfect university course  │
│  Based on how you actually think       │
│  and what you genuinely enjoy          │
│                                        │
│  ⏱️ 19 minutes                          │
│  🎯 30,000+ real UK courses            │
│  🔬 Evidence-based matching            │
│                                        │
│          [START ASSESSMENT]            │
│                                        │
│  No sign-up required • Anonymous       │
└────────────────────────────────────────┘
```

Sarah clicks **START ASSESSMENT**.

---

## STAGE 2: Vibe Swiper (2 mins, 6 cards)

**Instructions:**
> "Swipe through these images. Right = appeals to you, Left = doesn't appeal. This helps us understand what environments and subjects resonate with you."

**The 6 cards Sarah sees:**

**The 6 cards Sarah sees:**

**Card 1: Laboratory Setting**
- Image: Modern lab with microscopes, petri dishes
- Tags: `STEM_LIFE`, `PRACTICAL`, `RESEARCH`
- Sarah's response: **→ RIGHT** (appeals)

**Card 2: Hospital Ward**
- Image: Clean hospital corridor, medical equipment
- Tags: `HEALTHCARE`, `VOCATIONAL`, `CLINICAL`
- Sarah's response: **→ RIGHT** (appeals)

**Card 3: Lecture Theatre**
- Image: Large tiered lecture hall, students taking notes
- Tags: `ACADEMIC`, `TRADITIONAL`, `THEORETICAL`
- Sarah's response: **→ RIGHT** (appeals)

**Card 4: Small Seminar Room**
- Image: Intimate discussion space, 8-10 students around table
- Tags: `DISCUSSION`, `COURSEWORK_HEAVY`, `INTENSIVE`
- Sarah's response: **→ RIGHT** (appeals)

**Card 5: Art Studio**
- Image: Painting studio with easels and canvases
- Tags: `CREATIVE`, `ARTISTIC`, `INDIVIDUAL`
- Sarah's response: **← LEFT** (doesn't appeal)

**Card 6: Outdoor Fieldwork**
- Image: Students collecting environmental samples
- Tags: `APPLIED`, `FIELDWORK`, `ACTIVE`
- Sarah's response: **← LEFT** (doesn't appeal)

**Sarah's final vibe tags:**
- Swiped RIGHT on: Laboratory, Hospital, Lecture Theatre, Seminar Room
- Swiped LEFT on: Art Studio, Fieldwork

**Computed vibe weights:**
```json
{
  "subject_weights": {
    "STEM_LIFE": 0.8,
    "HEALTHCARE": 0.7,
    "RESEARCH": 0.6,
    "PRACTICAL": 0.5
  },
  "environment_weights": {
    "LABORATORY": 0.9,
    "CLINICAL": 0.7,
    "ACADEMIC": 0.6
  }
}
```

---

## STAGE 3: Forced-Choice Scenarios (5 mins, 20 questions)

**Instructions:**
> "Choose which option fits you better. There are no right answers. Click anywhere on the line between the two options."

### Question 1 (SOCIAL)
**Scenario:**
> It's 10pm and you're stuck on a problem that's due tomorrow.

```
Message group chat          [====|======]          Grind alone
to see if anyone's                                 — learn more
figured it out                                      that way
```

**Sarah clicks:** 60% toward "Message group chat"  
**Score:** `social += 0.2` (slight preference for collaborative)

---

### Question 2 (SOCIAL)
**Scenario:**
> You're revising for an exam. Which is more useful?

```
Explaining concepts        [======|====]          Writing your own
to someone else                                    notes in silence
```

**Sarah clicks:** 70% toward "Explaining to someone else"  
**Score:** `social += 0.4` (moderate preference for collaborative)

---

### Question 3 (RECEPTIVITY)
**Scenario:**
> Your teacher gives unexpected critical feedback on work you thought was good.

```
Ask them to explain        [========|==]          Defend your
what you missed                                    approach — you had
— probably a blind spot                            good reasons
```

**Sarah clicks:** 80% toward "Ask them to explain"  
**Score:** `receptivity += 0.6` (high openness to feedback)

---

### Question 4 (RECEPTIVITY)
**Scenario:**
> A classmate points out a flaw in your argument during a discussion.

```
Appreciate it              [=======|===]          Annoying — they
— better to fix                                    could've said it
it now                                             privately
```

**Sarah clicks:** 75% toward "Appreciate it"  
**Score:** `receptivity += 0.5` (moderate-high openness)

---

### Question 5 (TRANSFER)
**Scenario:**
> Two modules are available. Which appeals more?

```
"Connections: Physics,     [===|=======]          "Advanced Quantum
Philosophy and                                     Mechanics"
Economics"
```

**Sarah clicks:** 40% toward "Connections"  
**Score:** `transfer += 0.1` (slight preference for depth over breadth)

---

### Question 6 (TRANSFER)
**Scenario:**
> You're solving a new problem. What's your instinct?

```
"This reminds me           [=====|=====]          "Let me find the
of something from                                  specific method
another subject..."                                for this type"
```

**Sarah clicks:** 50% (exactly middle)  
**Score:** `transfer += 0` (neutral — uses both approaches)

---

### Question 7 (STRUCTURE)
**Scenario:**
> Two courses cover the same content. Which sounds better?

```
Weekly problem sets,       [======|====]          One final project,
clear rubric,                                      open brief, find
structured lectures                                your own sources
```

**Sarah clicks:** 65% toward "Weekly problem sets"  
**Score:** `structure += 0.3` (moderate preference for structure)

---

### Question 8 (STRUCTURE)
**Scenario:**
> Your teacher says "interpret the question however you want." Your reaction?

```
Frustrating — just         [=====|=====]          Exciting — freedom
tell me what you're                                to explore my
looking for                                        own angle
```

**Sarah clicks:** 50% (middle)  
**Score:** `structure += 0` (neutral on this)

---

### Question 9 (DEPTH)
**Scenario:**
> You're choosing your EPQ topic. What appeals more?

```
Deep dive into             [=======|===]          Multiple angles
one specific question                              on a broader theme
```

**Sarah clicks:** 75% toward "Deep dive"  
**Score:** `depth += 0.5` (prefers specialisation)

---

### Question 10 (DEPTH)
**Scenario:**
> Someone asks what you're into. What feels more satisfying to say?

```
"I'm really into           [========|==]          "Lots of stuff —
[one specific thing]                               I find most things
— ask me anything"                                 interesting"
```

**Sarah clicks:** 80% toward specific thing  
**Score:** `depth += 0.6` (strong specialist identity)

---

**...continues for 10 more questions (20 total)...**

### Sarah's Final Disposition Scores (0-100 scale):

| Disposition | Score | Interpretation |
|-------------|-------|----------------|
| **Social** | 65 | Moderate-high (collaborative when useful) |
| **Receptivity** | 85 | High (very open to feedback) |
| **Transfer** | 45 | Moderate-low (prefers depth) |
| **Structure** | 70 | Moderate-high (likes clear guidance) |
| **Depth** | 80 | High (specialist focus) |
| **Tolerance** | 60 | Moderate (estimated from other signals) |
| **Precision** | 75 | Moderate-high (detail-oriented) |
| **Calibration** | 70 | Moderate-high (self-aware) |
| **Retrieval** | 65 | Moderate (balanced study style) |
| **Consistency** | 55 | Moderate (steady but flexible) |

---

## STAGE 4: Mini-Sample Tasks (9 mins, 6 tasks)

**Instructions:**
> "Try these short tasks. They preview what different university subjects actually feel like. You'll have 90 seconds for each. Don't worry about getting them 'right' — we care about what you enjoy."

---

### Task 1: STEM-Technical (Debugging)

**Stimulus:**
> You're testing an automatic plant watering system. It's supposed to water the plant when soil moisture drops below 30%, but it's not working.
> 
> **Observed behaviour:**
> - Moisture sensor reads 25% (correct)
> - Pump receives signal (confirmed)
> - Pump doesn't activate
> - Error log shows: "VOLTAGE_LOW"
> 
> What's the most likely issue?

**Options:**
A) Moisture sensor is faulty  
B) Pump motor requires higher voltage than supplied  
C) Signal cable is disconnected  
D) Software has a bug in the threshold check  

**Sarah's response:** B (correct)  
**Time taken:** 45 seconds  
**Score:** 1/1 ✓

**Follow-up — Enjoyment:**
> How did you find that?
> 😫 Hated it — 😐 Fine — 😊 Loved it

**Sarah selects:** 😐 (neutral)

**Follow-up — Career fit:**
> Could you see yourself doing tasks like this daily?
> 😫 No way — 😐 Maybe — 😊 Definitely

**Sarah selects:** 😐 (maybe)

---

### Task 2: STEM-Scientific (Observation)

**Stimulus:**
> You're growing bacteria in petri dishes. You expect dish A (control) to show normal growth and dish B (experimental) to show reduced growth due to a new antibiotic.
> 
> **Day 3 Results:**
> - Dish A: Dense bacterial colonies (expected)
> - Dish B: Dense bacterial colonies (unexpected!)
> - Dish B also has small blue-green patches around the edges
> 
> What's the most scientifically interesting next step?

**Options:**
A) Conclude the antibiotic doesn't work  
B) Investigate what the blue-green patches are  
C) Repeat the experiment with fresh materials  
D) Increase the antibiotic concentration  

**Sarah's response:** B (best answer)  
**Time taken:** 55 seconds  
**Score:** 1/1 ✓

**Enjoyment:** 😊 Loved it  
**Career fit:** 😊 Definitely

---

### Task 3: Humanities (Argument Analysis)

**Stimulus:**
> A historian claims: "The printing press caused the Protestant Reformation because printed Bibles allowed people to read scripture themselves."
> 
> What's the main flaw in this argument?

**Options:**
A) Correlation doesn't prove causation  
B) Most people couldn't read in the 1500s  
C) The printing press was invented after the Reformation started  
D) Not all printed material was religious  

**Sarah's response:** A (correct)  
**Time taken:** 65 seconds  
**Score:** 1/1 ✓

**Enjoyment:** 😐 Fine  
**Career fit:** 😫 No way

---

### Task 4: Social Sciences (Short Response)

**Stimulus:**
> A company mandates that all employees work from the office 5 days/week, claiming "remote work reduces productivity and team cohesion."
> 
> **Task:** In 2-3 sentences, identify one hidden assumption in this policy.

**Sarah's response:**
> "The policy assumes that physical proximity is the only way to achieve team cohesion, ignoring that some teams might collaborate effectively through digital tools. It also assumes all job roles require the same level of in-person interaction, when some roles might be more independent."

**AI Grading:**
- Identifies assumption: ✓ (physical proximity = cohesion)
- Explains implications: ✓ (digital tools, role variation)
- Clear reasoning: ✓
- **Score:** 3/3 (excellent)

**Time taken:** 85 seconds  
**Enjoyment:** 😊 Loved it  
**Career fit:** 😊 Definitely

---

### Task 5: Professional (Short Response)

**Stimulus:**
> You're a junior doctor. At 8am, you need to:
> - Attend a mandatory training session (8:00-9:00)
> - Complete discharge paperwork for a patient leaving at 8:30
> - Respond to a senior consultant's urgent request for case notes by 8:15
> - Check on a post-op patient who's been waiting since 7:30
> 
> **Task:** How do you prioritise? Explain your reasoning in 2-3 sentences.

**Sarah's response:**
> "Patient safety comes first. I'd quickly check the post-op patient (2 mins) to ensure they're stable, then get the case notes to the consultant by 8:15 since they need them urgently for patient care. I'd complete discharge paperwork during training if possible, or ask a colleague to cover the training while I finish critical tasks."

**AI Grading:**
- Prioritises patient safety: ✓
- Considers urgency & importance: ✓
- Practical delegation: ✓
- **Score:** 3/3 (excellent)

**Time taken:** 80 seconds  
**Enjoyment:** 😊 Loved it  
**Career fit:** 😊 Definitely

---

### Task 6: Creative (Short Response)

**Stimulus:**
> You're designing a poster for a climate march. You can emphasise:
> - Scientific data (graphs, statistics)
> - Emotional appeal (images of impact)
> - Simple clear message (one powerful slogan)
> - Detailed information (causes, solutions, actions)
> 
> **Task:** Which would you prioritise and why? (2-3 sentences)

**Sarah's response:**
> "I'd prioritise a simple clear message because posters need to work at a glance. I might add one powerful image for emotional impact, but detailed information would overwhelm people walking past. Scientific data could go on a website the poster directs people to."

**AI Grading:**
- Clear choice with reasoning: ✓
- Understands medium constraints: ✓
- Considers audience: ✓
- **Score:** 2/3 (good — could be more creative)

**Time taken:** 70 seconds  
**Enjoyment:** 😐 Fine  
**Career fit:** 😐 Maybe

---

### Sarah's Mini-Sample Results:

| Task | Score | Enjoyment | Career Fit |
|------|-------|-----------|------------|
| STEM-Technical | 1/1 | 😐 | 😐 |
| STEM-Scientific | 1/1 | 😊 | 😊 |
| Humanities | 1/1 | 😐 | 😫 |
| Social Sciences | 3/3 | 😊 | 😊 |
| Professional | 3/3 | 😊 | 😊 |
| Creative | 2/3 | 😐 | 😐 |

**Enjoyment Pattern Detected:**
- Loved: STEM-Scientific, Social Sciences, Professional
- Neutral: STEM-Technical, Humanities, Creative

**Inferred Pathway:** 🎯 **Healthcare**  
*Reasoning:* Enjoyed scientific observation + understanding people/society + balancing competing professional interests.

---

## STAGE 5: Processing (30 seconds)

```
┌────────────────────────────────────────┐
│  ANALYSING YOUR PROFILE...             │
│                                        │
│  ✓ Disposition scores calculated      │
│  ✓ Enjoyment patterns identified       │
│  ✓ Pathway detected: Healthcare        │
│  ✓ Matching to 28,520 courses...       │
│                                        │
│  [████████████████░░] 85%              │
└────────────────────────────────────────┘
```

---

## STAGE 6: Results (Sarah reviews)

### Your Profile Summary

```
┌─────────────────────────────────────────────┐
│  YOUR LEARNING PROFILE                      │
│                                             │
│  Strongest traits:                          │
│  • Receptivity (85/100) — Very open to      │
│    feedback and willing to adjust           │
│  • Depth (80/100) — Prefers specialisation  │
│  • Precision (75/100) — Detail-oriented     │
│                                             │
│  Work style:                                │
│  • Moderate collaboration (65)              │
│  • Structured approach (70)                 │
│  • Specialist focus (80)                    │
│                                             │
│  You enjoyed:                               │
│  🎯 Scientific observation & analysis       │
│  🎯 Understanding people & society          │
│  🎯 Balancing competing interests           │
│                                             │
│  Suggested pathway: Healthcare              │
└─────────────────────────────────────────────┘
```

---

### TIER 1: Top Matches (Elite Institutions)

**#1 — University of Oxford — Medicine (MBBS)**
```
┌─────────────────────────────────────────────┐
│  OXFORD MEDICINE                            │
│  Overall Fit: 68/100                        │
│                                             │
│  Why this matches:                          │
│  ✓ Your enjoyment pattern strongly suggests│
│    healthcare (scientific + social +        │
│    professional tasks)                      │
│  ✓ High receptivity (85) matches the       │
│    feedback-intensive nature of medical     │
│    training                                 │
│  ✓ Detail-oriented (75) suits clinical     │
│    precision requirements                   │
│                                             │
│  Honest challenges:                         │
│  ⚠ Demands high transfer thinking (60)     │
│    across biochem, ethics, public health    │
│    — you scored 45 (manageable but not      │
│    your natural strength)                   │
│  ⚠ Requires collaboration (65) — you're    │
│    at 65, good match but will push you      │
│                                             │
│  Course details:                            │
│  • Duration: 6 years                        │
│  • Entry: AAA (typically)                   │
│  • Assessment: 60% exams, 20% coursework,   │
│    20% practical                            │
│  • Student satisfaction: 85%                │
│  • Employment: 98%                          │
│  • Avg salary (3yr): £52,000               │
│                                             │
│  [LEARN MORE]    [SAVE]    [NOT FOR ME]    │
└─────────────────────────────────────────────┘
```

**Score Breakdown:**
- Interest Fit: 60 pts (loved STEM_SCI + SOCIAL_SCI + PROFESSIONAL)
- Disposition Fit: +4 pts (good match on receptivity, precision)
- Friction: -33 pts (transfer gap, depth vs breadth requirements)
- Quality Bonus: +22 pts (Russell Group, high employment, £52k salary)
- **Pathway Bonus: +15 pts** (Healthcare pathway detected)
- **Total: 68/100**

---

**#2 — University of Cambridge — Medicine (MB BChir)**
```
Overall Fit: 67/100

Very similar to Oxford Medicine. Slightly higher transfer
demands (62 vs 60) create a bit more friction. Otherwise
nearly identical fit.

Entry: AAA
Duration: 6 years
Satisfaction: 87%
Employment: 99%

[LEARN MORE]    [SAVE]    [NOT FOR ME]
```

---

**#3 — University of Oxford — Philosophy, Politics & Economics**
```
Overall Fit: 69/100

Technically slightly higher fit than Medicine due to better
disposition alignment (transfer=82 matches your interdisciplinary
thinking). However, your enjoyment pattern doesn't suggest
this pathway — you found humanities tasks neutral, not loved.

Worth considering if you're interested in policy, economics,
or political philosophy.

[LEARN MORE]    [SAVE]    [NOT FOR ME]
```

---

**#4 — University of Oxford — Psychology**
```
Overall Fit: 57/100

Good match on social science interest (you loved understanding
people). Lower overall score due to research demands and
less direct patient care.

[LEARN MORE]    [SAVE]    [NOT FOR ME]
```

---

**#5 — University College London — Biomedical Sciences**
```
Overall Fit: 56/100

Solid scientific match. Less direct patient interaction than
Medicine. Good if you prefer lab research over clinical work.

[LEARN MORE]    [SAVE]    [NOT FOR ME]
```

---

### TIER 2: Best Fit For You (All Institutions)

*Shows same top 5 in this case, since Sarah's matches are all Russell Group*

---

## STAGE 7: Sarah's Next Actions

Sarah can now:

1. **View detailed course info** — Click any match to see:
   - Full module breakdown
   - Assessment structure
   - Student testimonials
   - Related supercurriculars (books, competitions, volunteering)

2. **Filter & refine** — Adjust by:
   - Subject area
   - Location
   - Entry requirements
   - Assessment type preference

3. **Save favourites** — Build a shortlist for UCAS

4. **Explore supercurriculars** — See recommended activities to boost her Medicine application:
   - Books: "Being Mortal" by Atul Gawande
   - Competitions: Biology Olympiad
   - Volunteering: St John Ambulance
   - Courses: Medlink conference

5. **Understand her profile** — Review disposition breakdown:
   - "Why am I high on receptivity?"
   - "What does low transfer mean for Medicine?"
   - "How can I develop collaborative skills?"

---

## Why This Match Makes Sense

### The Algorithm's Logic:

1. **Enjoyment Pattern (60 pts)**
   - Sarah loved: Scientific observation, understanding people, professional judgement
   - This pattern = Healthcare pathway
   - Medicine courses aligned with STEM_SCI + SOCIAL_SCI clusters

2. **Disposition Fit (+4 pts)**
   - Receptivity (85) matches Medicine's feedback-intensive training
   - Precision (75) suits clinical detail requirements
   - Structure (70) aligns with clear progression pathway

3. **Friction Acknowledged (-33 pts)**
   - Transfer gap (Sarah=45, Medicine=60): Manageable but not natural
   - Social demands (Sarah=65, Medicine=65): Good match
   - Depth expectations (Sarah=80, Medicine=80): Perfect match

4. **Elite Pushing (+22 pts)**
   - Russell Group: +15
   - Employment 98%: +3
   - NSS 85%: +2
   - Salary £52k: +2

5. **Pathway Boost (+15 pts)**
   - Healthcare pathway detected from enjoyment pattern
   - +15 bonus for Medicine/Dentistry courses

**Total: 68/100 (Good fit with honest caveats)**

---

## What Sarah Learns About Herself

**Strengths:**
- Very receptive to feedback (top 15%)
- Detail-oriented and precise
- Enjoys understanding both science and people
- Specialist rather than generalist

**Development areas:**
- Transfer thinking — connecting across domains (can develop)
- May prefer structured guidance over complete autonomy

**Honest insight:**
Medicine demands some interdisciplinary thinking (biochemistry, ethics, public health) which doesn't come as naturally to you as pure scientific analysis. But your strong receptivity and precision make you well-suited to learn this. Most successful medical students develop transfer skills during training.

**The brutal honesty:**
You're not a "perfect fit" for Medicine (that would be 85+/100). But you're a solid fit (68/100) with clear strengths and manageable challenges. If you're passionate about healthcare, this is absolutely achievable with effort in the right areas.

---

## Summary: 16 Minutes, Clear Direction

Sarah started uncertain ("maybe Medicine, maybe something else") and now has:

✓ **Data-driven validation** — Healthcare pathway confirmed by enjoyment pattern  
✓ **Specific matches** — Oxford/Cambridge Medicine as top realistic options  
✓ **Honest gaps** — Transfer thinking to develop, but not a blocker  
✓ **Alternative options** — PPE if she wants more interdisciplinary work  
✓ **Action plan** — Supercurriculars to strengthen application  

The platform didn't just say "you'd be good at Medicine" — it showed her *why* (receptivity, precision, enjoyment pattern), *what challenges she'll face* (transfer thinking), and *how confident we are* (68/100, not 95/100).

**That's the difference between a recommendation and a match.**
