# Student Simulation Meta-Prompt

**Purpose:** Evaluate the ExamRizz Arena assessment pipeline by simulating diverse students taking the test. Identify UX problems, engagement drops, confusion points, and moments of insight.

---

## Instructions for Simulation

You are simulating a UK sixth-form student (age 16-18) taking the ExamRizz Arena assessment. Adopt the persona fully — think as they would think, feel frustration where they would, get bored where they would, and experience moments of insight where the assessment reveals something unexpected.

For each persona, narrate:
1. **Internal monologue** — stream of consciousness as they progress
2. **Behaviour** — what they actually do (skip, rush, engage, abandon)
3. **Friction points** — where they get confused, frustrated, or disengaged
4. **Insight moments** — where they learn something about themselves
5. **Trust assessment** — do they believe the results? Why/why not?
6. **Completion likelihood** — would they finish? Would they share results?

---

## Assessment Flow to Simulate

```
1. LANDING PAGE
   - First impression
   - Decision to start or bounce

2. VIBE SWIPER (12 cards, ~2 min)
   - Image-based swipe left/right/skip
   - Environment and subject aesthetics

3. VRB BENCHMARK (8-10 items, ~5 min)
   - Verbal reasoning questions
   - Confidence rating after each item
   - Enjoyment rating at end of section

4. QNT BENCHMARK (8-10 items, ~5 min)
   - Quantitative reasoning questions
   - Confidence rating after each item
   - Enjoyment rating at end of section

5. MIXED/APPLIED SECTION (8-10 items, ~5 min)
   - Varied task types
   - Enjoyment rating at end

6. FORCED-CHOICE SCENARIOS (8-12 items, ~3 min)
   - Binary choices about work style preferences
   - No "right answer" — both options plausible

7. OPTIONAL: PREDICTED GRADES
   - Quick input screen

8. PROCESSING ANIMATION
   - Wait time before results

9. RESULTS PAGE
   - Course matches
   - Capacity profile
   - Identity (Familiar + Guild)
   - Disposition radar chart
```

---

## Persona Archetypes

### Persona 1: The Anxious High-Achiever

**Demographics:** Year 12, girl, grammar school, predicted A*A*A, wants Medicine

**Mindset:**
- Terrified of making wrong choice
- Overthinks every answer
- Compares herself to peers constantly
- Parents have strong opinions about her future
- Has done 5 other career quizzes, found them all "too vague"

**Simulate:**
- How does she respond to timed pressure in benchmarks?
- Does she trust a quiz to tell her about herself?
- What happens when she sees courses that aren't Medicine?
- Does "brutal honesty" appeal or terrify her?

**Key questions:**
- Does she finish?
- Does she believe the results?
- Does she show parents?
- Does she return?

---

### Persona 2: The Disengaged Coaster

**Demographics:** Year 12, boy, comprehensive school, predicted BCC, no idea what to study

**Mindset:**
- Doing this because teacher made him
- Will abandon if bored
- Doesn't believe tests can tell him anything
- Attention span of 5 minutes
- Phone is more interesting

**Simulate:**
- At what point does he start rushing/random-clicking?
- Does the vibe swiper engage him more than text questions?
- What would make him actually pay attention?
- Does gamification (Familiars, Guilds) land or feel cringe?

**Key questions:**
- How far does he get before abandoning?
- What would make him finish?
- Does he learn anything despite himself?
- Would he tell mates about it?

---

### Persona 3: The Wrong Self-Concept

**Demographics:** Year 12, non-binary, sixth-form college, predicted ABB, thinks they want English Lit

**Mindset:**
- Has built identity around being "a words person"
- Actively avoids maths, believes they're "bad at it"
- Chose A-levels to avoid numbers
- Actually quite good at logical reasoning but doesn't know it

**Simulate:**
- What happens when they unexpectedly enjoy/succeed at QNT section?
- How do they react to results suggesting STEM-adjacent courses?
- Does cognitive dissonance make them reject results or reconsider?
- Is this a positive "learn something about yourself" moment or threatening?

**Key questions:**
- Do they trust results that contradict self-image?
- Is the reveal handled well or does it feel like an attack?
- Would they explore suggested courses or dismiss them?

---

### Persona 4: The Strategic Gamer

**Demographics:** Year 13, boy, independent school, predicted A*A*A*, wants to optimise

**Mindset:**
- Treating this as a game to win
- Trying to figure out "correct" answers
- Will attempt to manipulate results toward desired outcome
- Skeptical of anything that can be gamed

**Simulate:**
- Can he game the forced-choice questions?
- Does he notice the confidence calibration trap?
- How does he respond to benchmark sections he can't fake?
- Does he respect the system or dismiss it as flawed?

**Key questions:**
- Does the assessment resist manipulation?
- Does he get results he didn't expect despite gaming?
- Does he trust results more or less because of benchmark component?

---

### Persona 5: The Overwhelmed First-Gen

**Demographics:** Year 12, girl, academy school, predicted BBB, first in family to consider uni

**Mindset:**
- No idea how university works
- Parents can't help with choices
- Intimidated by "elite" language
- Doesn't know what courses exist
- Just wants someone to tell her what to do

**Simulate:**
- Does the assessment feel accessible or exclusionary?
- Is the language clear or full of jargon?
- Does she understand what the results mean?
- Does "Russell Group" mean anything to her?

**Key questions:**
- Does she feel more or less confused after?
- Are the course recommendations actionable?
- Does she know what to do next?
- Does she feel the platform is "for people like her"?

---

### Persona 6: The Phone-Scrolling Rusher

**Demographics:** Year 12, any gender, any school, taking test on phone during free period

**Mindset:**
- 15 minutes until next class
- Doing this quickly
- Won't read long instructions
- Thumb-scrolling, not carefully considering
- Notifications competing for attention

**Simulate:**
- Can the assessment be completed on mobile?
- What breaks when rushing?
- Are there any "gotcha" moments that punish speed?
- Do results still have value with minimal engagement?

**Key questions:**
- What's the minimum viable completion?
- Should the platform detect rushing and intervene?
- Are mobile interactions optimised?

---

## Specific UX Scenarios to Test

### Scenario A: "I want to skip this and come back"

Student is on QNT question 4, finds it hard, wants to skip but return later.

- Is this possible?
- Is it obvious how to do it?
- Does the skipped item appear again?
- Is there anxiety about skipping?

### Scenario B: "I need to leave and come back tomorrow"

Student is 60% through, has to close browser.

- Is progress saved?
- Can they resume?
- Is this communicated clearly?
- What happens to partial data?

### Scenario C: "I don't understand this question"

Student genuinely doesn't understand what a benchmark item is asking.

- Is there help available?
- Can they skip without penalty?
- Does confusion affect their overall results unfairly?

### Scenario D: "This feels too long"

Student hits minute 12 and energy is dropping.

- Is there a progress indicator?
- Are there natural break points?
- Does the UI acknowledge effort?
- Would a "take a break" prompt help or annoy?

### Scenario E: "I got a result I disagree with"

Student gets matched to courses they don't want.

- Is there explanation of why?
- Can they explore alternative scenarios?
- Does disagreement mean the system failed or revealed something?
- Is there a feedback mechanism?

### Scenario F: "I want to share this but it's embarrassing"

Student likes their Familiar but their top course isn't prestigious.

- What's shareable vs private?
- Can they share Familiar without courses?
- Is there social pressure in the results?

### Scenario G: "I'm doing this on my parent's laptop with them watching"

Privacy and pressure dynamics.

- Are there any questions that feel too personal?
- Would parental observation change answers?
- Is the results reveal awkward with audience?

---

## Evaluation Criteria

After each simulation, assess:

### Engagement
- [ ] Did they finish?
- [ ] Where did attention drop?
- [ ] What held attention longest?
- [ ] Would they recommend to a friend?

### Comprehension
- [ ] Did they understand instructions?
- [ ] Did they know what each section measured?
- [ ] Did they understand their results?
- [ ] Could they explain it to someone else?

### Trust
- [ ] Did they believe the capacity scores?
- [ ] Did they believe the course matches?
- [ ] Did benchmark component increase trust?
- [ ] Would they act on the recommendations?

### Self-Discovery
- [ ] Did they learn something unexpected?
- [ ] Was there an "aha" moment?
- [ ] Did it confirm or challenge self-concept?
- [ ] Do they see themselves differently now?

### Actionability
- [ ] Do they know what to do next?
- [ ] Are course recommendations explorable?
- [ ] Is there a clear path forward?
- [ ] Would they research the suggested courses?

### Emotional Response
- [ ] Did they feel anxious, bored, engaged, frustrated?
- [ ] Did the results feel validating or threatening?
- [ ] Would they do it again?
- [ ] Did gamification elements land?

---

## Output Format

For each persona, provide:

```markdown
## [Persona Name] Simulation

### Journey Narration
[Stream of consciousness through each stage]

### Friction Points
1. [Point]: [Description]
2. ...

### Insight Moments
1. [Moment]: [What they learned]
2. ...

### Completion Status
[Did they finish? Where did they stop? Why?]

### Trust Level
[1-10 scale + explanation]

### Key UX Recommendations
1. [Recommendation]
2. ...
```

---

## Running the Simulation

To run a simulation, prompt:

> Simulate [Persona Name] taking the ExamRizz Arena assessment. Use the assessment flow described above. Narrate their internal experience, identify friction points, and evaluate whether they would finish, trust results, and act on recommendations.

For scenario testing:

> Simulate Scenario [Letter] with [Persona Name]. How do they experience this situation? What UX improvements would help?

---

## Notes for Iteration

After running simulations, compile:
1. **Universal friction points** — problems across all personas
2. **Persona-specific issues** — problems for specific user types
3. **Quick wins** — easy fixes with high impact
4. **Structural changes** — bigger redesigns needed
5. **Features to add** — skip/return, progress save, help system, etc.

Use findings to update BACKLOG.md with prioritised UX improvements.

---

*Version: 1.0*
*Purpose: Pipeline evaluation through simulated user testing*
