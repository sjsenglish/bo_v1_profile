# ExamRizz Video Lesson HTML Generator — Standalone Instructions

**Purpose:** This document contains everything needed to generate Step 2 (Video Lesson HTML) from an approved Step 1 Content Outline.  
**Version:** 1.0 (January 2025)  
**Usage:** Paste this document + the approved Content Outline into your LLM, then request the HTML file.

---

## YOUR TASK

Generate a complete, standalone HTML video lesson file based on the Content Outline provided.

**Input:** A Content Outline (markdown) containing lesson title, spec reference, learning objectives, key terms, misconceptions, and lesson structure.

**Output:** A single HTML file with interactive slides, worked examples, and practice questions.

---

## CRITICAL REQUIREMENTS

### 1. Subject-Specific Colour Themes

Use the colour scheme matching the subject:

| Subject | Primary | Light | Pale | Dark |
|---------|---------|-------|------|------|
| **Economics** | #f59e0b | #fcd34d | #fef3c7 | #b45309 |
| **Mathematics** | #22c55e | #86efac | #dcfce7 | #166534 |
| **Physics** | #3b82f6 | #93c5fd | #dbeafe | #1d4ed8 |
| **Chemistry** | #8b5cf6 | #c4b5fd | #ede9fe | #6d28d9 |
| **Biology** | #10b981 | #6ee7b7 | #d1fae5 | #047857 |
| **Psychology** | #f43f5e | #fda4af | #ffe4e6 | #be123c |
| **History** | #64748b | #94a3b8 | #e2e8f0 | #334155 |
| **Geography** | #06b6d4 | #67e8f9 | #cffafe | #0e7490 |

### 2. Design System: Neubrutalism

- **Borders:** 4px solid black on all major elements
- **Shadows:** Solid offset, no blur (e.g., `6px 6px 0 #000`)
- **Fonts:** Space Grotesk (body) + Space Mono (code/numbers)
- **No emojis** — use text labels only
- **High contrast** colour blocks

### 3. Slide Structure Rules

- **Title slide (Slide 1):** Header bar visible, content centred
- **All other slides:** NO header bar
- **Working spaces:** Minimum 350px height with centred watermark number
- **Solutions:** Hidden by default, revealed with toggle button

### 4. Required Slide Types

1. **Title Slide** — Spec badge, lesson title, subtitle
2. **Definition Slides** — Key terms with definition boxes
3. **Concept Slides** — Explanations, tables, comparisons
4. **Worked Example Slides** — Question + working space + show/hide solution (3-5 examples)
5. **Practice Slides** — Questions for students to try (2-3 questions)
6. **Summary Slide** — Key takeaways + exam tips

### 5. Content Requirements

- Cover ALL learning objectives from the Content Outline
- Include ALL key terms as definition boxes
- Address common misconceptions (as warning boxes or in explanations)
- Use real-world, modern examples (prefer recent/relatable contexts)
- Progressive complexity: start accessible, build to challenging

---

## COMPLETE HTML TEMPLATE

Copy and adapt this template. Replace all `[PLACEHOLDERS]` with actual content.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[LESSON_TITLE] - ExamRizz A Level [SUBJECT]</title>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        :root {
            --primary: [PRIMARY_COLOUR];
            --primary-light: [PRIMARY_LIGHT];
            --primary-pale: [PRIMARY_PALE];
            --primary-dark: [PRIMARY_DARK];
            --accent: #99f6e4;
            --accent-pale: #ccfbf1;
            --black: #000000;
            --white: #ffffff;
            --gray: #f0f0f0;
        }
        
        body {
            font-family: 'Space Grotesk', sans-serif;
            background: var(--accent-pale);
            min-height: 100vh;
            padding: 24px;
            color: var(--black);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: var(--white);
            border: 4px solid var(--black);
            box-shadow: 12px 12px 0 var(--black);
        }
        
        /* Header - Title slide only */
        .header-bar {
            background: var(--primary);
            padding: 16px 28px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 4px solid var(--black);
        }
        .header-bar.hidden { display: none; }
        
        .level-badge {
            background: var(--white);
            border: 3px solid var(--black);
            padding: 8px 16px;
            font-weight: 700;
            font-size: 0.9em;
            box-shadow: 4px 4px 0 var(--black);
        }
        
        .progress-blocks { display: flex; gap: 6px; }
        .progress-block {
            width: 32px; height: 16px;
            background: var(--white);
            border: 2px solid var(--black);
        }
        .progress-block.active { background: var(--primary-dark); box-shadow: 2px 2px 0 var(--black); }
        .progress-block.passed { background: var(--primary-light); }
        
        /* Slides */
        .slide-wrapper { min-height: 600px; }
        .slide { display: none; padding: 48px; min-height: 600px; }
        .slide.active { display: block; animation: fadeIn 0.3s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
        
        /* Title Slide */
        .title-slide {
            display: none;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 60px;
            min-height: 600px;
            background: repeating-linear-gradient(-45deg, var(--white), var(--white) 20px, var(--accent-pale) 20px, var(--accent-pale) 40px);
        }
        .title-slide.active { display: flex; }
        .title-badge {
            background: var(--primary);
            border: 3px solid var(--black);
            padding: 10px 24px;
            font-weight: 700;
            font-size: 0.9em;
            margin-bottom: 24px;
            box-shadow: 4px 4px 0 var(--black);
            transform: rotate(-2deg);
        }
        .title-slide h1 {
            font-size: 2.8em;
            font-weight: 700;
            margin-bottom: 16px;
            text-transform: uppercase;
            letter-spacing: -2px;
        }
        .title-slide .subtitle {
            font-size: 1.2em;
            max-width: 600px;
            background: var(--white);
            padding: 12px 24px;
            border: 2px solid var(--black);
        }
        
        /* Content Headers */
        .slide h2 {
            font-size: 1.6em;
            font-weight: 700;
            margin-bottom: 24px;
            text-transform: uppercase;
            display: inline-block;
            background: var(--primary-light);
            padding: 4px 12px;
            border: 3px solid var(--black);
            box-shadow: 4px 4px 0 var(--black);
        }
        .slide p { margin-bottom: 16px; font-size: 1.1em; }
        
        /* Definition Box */
        .definition-box {
            background: var(--primary-pale);
            padding: 24px;
            margin: 24px 0;
            border: 4px solid var(--black);
            box-shadow: 6px 6px 0 var(--black);
            position: relative;
        }
        .definition-label {
            position: absolute;
            top: -14px;
            left: 16px;
            background: var(--primary);
            border: 3px solid var(--black);
            padding: 4px 12px;
            font-weight: 700;
            font-size: 0.75em;
            text-transform: uppercase;
        }
        
        /* Key Point Box */
        .key-point {
            background: var(--white);
            border: 4px solid var(--black);
            padding: 20px;
            margin: 20px 0;
            box-shadow: 4px 4px 0 var(--black);
        }
        .key-point-label {
            background: var(--primary);
            border: 2px solid var(--black);
            padding: 4px 12px;
            font-weight: 700;
            font-size: 0.75em;
            text-transform: uppercase;
            display: inline-block;
            margin-bottom: 12px;
        }
        
        /* Tip Box */
        .tip-box {
            background: var(--primary-light);
            border: 4px solid var(--black);
            padding: 20px;
            margin: 20px 0;
            box-shadow: 4px 4px 0 var(--black);
        }
        .tip-label {
            background: var(--primary-dark);
            color: var(--white);
            border: 2px solid var(--black);
            padding: 4px 12px;
            font-weight: 700;
            font-size: 0.75em;
            text-transform: uppercase;
            display: inline-block;
            margin-bottom: 12px;
        }
        
        /* Warning Box */
        .warning-box {
            background: var(--accent);
            border: 4px solid var(--black);
            padding: 20px;
            margin: 20px 0;
            box-shadow: 4px 4px 0 var(--black);
        }
        .warning-label {
            background: var(--black);
            color: var(--white);
            padding: 4px 12px;
            font-weight: 700;
            font-size: 0.75em;
            text-transform: uppercase;
            display: inline-block;
            margin-bottom: 12px;
        }
        
        /* Worked Example */
        .example-container { margin: 24px 0; }
        .example-header { display: flex; align-items: center; gap: 16px; margin-bottom: 16px; }
        .example-number {
            width: 56px; height: 56px;
            background: var(--primary);
            border: 4px solid var(--black);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Space Mono', monospace;
            font-weight: 700;
            font-size: 1.4em;
            box-shadow: 4px 4px 0 var(--black);
        }
        .example-label { font-weight: 700; font-size: 1.2em; text-transform: uppercase; }
        .example-body {
            background: var(--gray);
            padding: 28px;
            border: 4px solid var(--black);
        }
        .question-text { font-size: 1.1em; margin-bottom: 16px; }
        
        /* Working Space */
        .working-space {
            background: var(--white);
            border: 4px dashed var(--black);
            margin: 20px 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 350px;
        }
        .watermark {
            font-family: 'Space Mono', monospace;
            font-size: 8em;
            font-weight: 700;
            color: var(--primary-pale);
            user-select: none;
        }
        
        /* Solution Box */
        .solution {
            display: none;
            background: var(--primary-light);
            border: 4px solid var(--black);
            padding: 24px;
            margin-top: 16px;
            position: relative;
        }
        .solution::before {
            content: 'SOLUTION';
            position: absolute;
            top: -14px;
            left: 16px;
            background: var(--primary);
            border: 3px solid var(--black);
            padding: 4px 12px;
            font-weight: 700;
            font-size: 0.75em;
        }
        .solution.show { display: block; animation: popIn 0.2s ease; }
        @keyframes popIn { 0% { transform: scale(0.95); } 50% { transform: scale(1.02); } 100% { transform: scale(1); } }
        .solution-step { margin: 12px 0; padding-left: 24px; position: relative; }
        .step-label { position: absolute; left: 0; font-weight: 700; color: var(--primary-dark); }
        
        /* Toggle Button */
        .toggle-btn {
            background: var(--white);
            border: 4px solid var(--black);
            padding: 12px 28px;
            cursor: pointer;
            font-size: 0.95em;
            font-weight: 700;
            margin-top: 16px;
            font-family: 'Space Grotesk', sans-serif;
            text-transform: uppercase;
            box-shadow: 4px 4px 0 var(--black);
            transition: all 0.1s;
        }
        .toggle-btn:hover { background: var(--primary-light); transform: translate(2px, 2px); box-shadow: 2px 2px 0 var(--black); }
        
        /* Practice Slide */
        .practice-slide { background: var(--accent-pale); }
        .practice-header { display: flex; align-items: center; gap: 16px; margin-bottom: 24px; }
        .practice-header h2 { margin-bottom: 0; }
        .practice-icon {
            width: 56px; height: 56px;
            background: var(--primary);
            border: 4px solid var(--black);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4em;
            font-weight: 700;
            font-family: 'Space Mono', monospace;
            box-shadow: 4px 4px 0 var(--black);
        }
        .practice-box {
            background: var(--white);
            padding: 24px;
            border: 4px solid var(--black);
            box-shadow: 6px 6px 0 var(--black);
            font-size: 1.1em;
        }
        
        /* Tables */
        table { width: 100%; border-collapse: collapse; margin: 20px 0; border: 4px solid var(--black); }
        th { background: var(--primary); padding: 14px 16px; text-align: left; font-weight: 700; text-transform: uppercase; font-size: 0.85em; border: 2px solid var(--black); }
        td { padding: 14px 16px; border: 2px solid var(--black); background: var(--white); }
        
        /* Summary Card */
        .summary-card {
            background: var(--primary-pale);
            border: 4px solid var(--black);
            padding: 24px;
            margin: 20px 0;
            box-shadow: 6px 6px 0 var(--black);
        }
        .summary-card h4 { font-size: 1.2em; margin-bottom: 16px; text-transform: uppercase; }
        
        /* Lists */
        ul, ol { margin: 16px 0; padding-left: 24px; }
        li { margin: 8px 0; }
        
        /* Navigation */
        .navigation {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 32px;
            background: var(--accent-pale);
            border-top: 4px solid var(--black);
        }
        .nav-btn {
            background: var(--white);
            border: 4px solid var(--black);
            padding: 12px 28px;
            cursor: pointer;
            font-size: 0.95em;
            font-weight: 700;
            font-family: 'Space Grotesk', sans-serif;
            text-transform: uppercase;
            box-shadow: 4px 4px 0 var(--black);
            transition: all 0.1s;
        }
        .nav-btn:hover:not(:disabled) { background: var(--primary); transform: translate(2px, 2px); box-shadow: 2px 2px 0 var(--black); }
        .nav-btn:disabled { opacity: 0.4; cursor: not-allowed; }
        .slide-counter {
            font-family: 'Space Mono', monospace;
            font-weight: 700;
            background: var(--black);
            color: var(--white);
            padding: 10px 20px;
        }
        
        /* Comparison Grid (optional) */
        .comparison-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 20px 0; }
        .comparison-box { background: var(--white); border: 4px solid var(--black); padding: 20px; box-shadow: 4px 4px 0 var(--black); }
        .comparison-box h4 { background: var(--primary); padding: 8px 12px; margin: -20px -20px 16px -20px; border-bottom: 3px solid var(--black); font-weight: 700; text-transform: uppercase; }
        
        /* Responsive */
        @media (max-width: 768px) {
            body { padding: 12px; }
            .slide { padding: 24px; }
            .title-slide h1 { font-size: 2em; }
            .watermark { font-size: 5em; }
            .comparison-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-bar" id="headerBar">
            <div class="level-badge">ExamRizz A Level [SUBJECT]</div>
            <div class="progress-blocks" id="progressBlocks"></div>
        </div>
        
        <div class="slide-wrapper">
            <!-- SLIDE 1: Title -->
            <div class="slide title-slide active" data-show-header="true">
                <div class="title-badge">SPEC [X.X.X] - [SPEC_TOPIC]</div>
                <h1>[LESSON_TITLE]</h1>
                <p class="subtitle">[Brief description of what students will learn]</p>
            </div>
            
            <!-- SLIDE 2: First Definition/Concept -->
            <div class="slide" data-show-header="false">
                <h2>[Topic Header]</h2>
                <div class="definition-box">
                    <span class="definition-label">Definition</span>
                    <p style="margin-top: 8px;"><strong>[Term]</strong> — [Definition from content outline]</p>
                </div>
                <p>[Explanation paragraph]</p>
                <div class="key-point">
                    <div class="key-point-label">Key Concept</div>
                    <p>[Important point to emphasise]</p>
                </div>
            </div>
            
            <!-- SLIDE 3+: Additional concept slides as needed -->
            
            <!-- WORKED EXAMPLE SLIDE TEMPLATE -->
            <div class="slide" data-show-header="false">
                <div class="example-container">
                    <div class="example-header">
                        <div class="example-number">01</div>
                        <span class="example-label">Worked Example</span>
                    </div>
                    <div class="example-body">
                        <p class="question-text"><strong>[Question text]</strong></p>
                        <div class="working-space"><span class="watermark">01</span></div>
                        <button class="toggle-btn" onclick="toggleSolution('sol1')">Show Solution</button>
                        <div class="solution" id="sol1">
                            <div class="solution-step"><span class="step-label">1.</span>[Step 1]</div>
                            <div class="solution-step"><span class="step-label">2.</span>[Step 2]</div>
                            <div class="solution-step"><span class="step-label">3.</span>[Step 3]</div>
                            <p style="margin-top: 12px;"><strong>Answer:</strong> [Final answer]</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- PRACTICE SLIDE TEMPLATE -->
            <div class="slide practice-slide" data-show-header="false">
                <div class="practice-header">
                    <div class="practice-icon">P</div>
                    <h2>Practice</h2>
                </div>
                <div class="practice-box">
                    <strong>Question 1:</strong> [Practice question text]
                </div>
                <div class="working-space"><span class="watermark">01</span></div>
                <button class="toggle-btn" onclick="toggleSolution('prac1')">Show Solution</button>
                <div class="solution" id="prac1">
                    <p>[Solution]</p>
                </div>
            </div>
            
            <!-- SUMMARY SLIDE -->
            <div class="slide" data-show-header="false">
                <h2>Summary</h2>
                <div class="summary-card">
                    <h4>Key Takeaways</h4>
                    <ul>
                        <li><strong>[Point 1]</strong> — [Explanation]</li>
                        <li><strong>[Point 2]</strong> — [Explanation]</li>
                        <li><strong>[Point 3]</strong> — [Explanation]</li>
                    </ul>
                </div>
                <div class="tip-box">
                    <div class="tip-label">Exam Tip</div>
                    <p>[Exam-specific advice]</p>
                </div>
            </div>
        </div>
        
        <div class="navigation">
            <button class="nav-btn" id="prevBtn" onclick="changeSlide(-1)">Previous</button>
            <span class="slide-counter" id="slideCounter">01/[TOTAL]</span>
            <button class="nav-btn" id="nextBtn" onclick="changeSlide(1)">Next</button>
        </div>
    </div>
    
    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');
        const totalSlides = slides.length;
        const headerBar = document.getElementById('headerBar');
        
        function generateBlocks() {
            const container = document.getElementById('progressBlocks');
            for (let i = 0; i < 6; i++) {
                const block = document.createElement('div');
                block.className = 'progress-block' + (i === 0 ? ' active' : '');
                container.appendChild(block);
            }
        }
        
        function updateBlocks() {
            const blocks = document.querySelectorAll('.progress-block');
            const group = Math.floor((currentSlide / totalSlides) * blocks.length);
            blocks.forEach((block, i) => {
                block.classList.remove('active', 'passed');
                if (i < group) block.classList.add('passed');
                else if (i === group) block.classList.add('active');
            });
        }
        
        function showSlide(n) {
            slides.forEach(s => s.classList.remove('active'));
            slides[n].classList.add('active');
            const showHeader = slides[n].getAttribute('data-show-header') === 'true';
            headerBar.classList.toggle('hidden', !showHeader);
            document.getElementById('prevBtn').disabled = (n === 0);
            document.getElementById('nextBtn').disabled = (n === totalSlides - 1);
            document.getElementById('slideCounter').textContent = `${String(n + 1).padStart(2, '0')}/${totalSlides}`;
            updateBlocks();
        }
        
        function changeSlide(d) {
            currentSlide = Math.max(0, Math.min(totalSlides - 1, currentSlide + d));
            showSlide(currentSlide);
        }
        
        function toggleSolution(id) {
            const sol = document.getElementById(id);
            sol.classList.toggle('show');
            const btn = sol.previousElementSibling;
            btn.textContent = sol.classList.contains('show') ? 'Hide Solution' : 'Show Solution';
        }
        
        document.addEventListener('keydown', e => {
            if (e.key === 'ArrowLeft') changeSlide(-1);
            if (e.key === 'ArrowRight') changeSlide(1);
        });
        
        generateBlocks();
        showSlide(0);
    </script>
</body>
</html>
```

---

## SLIDE COUNT GUIDELINES

| Lesson Complexity | Recommended Slides |
|-------------------|-------------------|
| Simple/Conceptual | 12-15 slides |
| Standard | 16-20 slides |
| Complex/Technical | 20-25 slides |

**Typical structure:**
- 1 Title slide
- 4-8 Concept/definition slides
- 3-5 Worked example slides
- 2-3 Practice slides
- 1 Summary slide

---

## CONTENT ADAPTATION RULES

### From Content Outline → Video Slides

| Outline Section | How to Use in HTML |
|-----------------|-------------------|
| Learning Objectives | Cover each objective across concept slides; reference in summary |
| Key Terms | Each term gets a `definition-box` on relevant slide |
| Common Misconceptions | Use `warning-box` to address these directly |
| Lesson Content Structure | Follow this as your slide outline |
| Diagram List | Include visual representations where specified |

### Worked Examples

- Create 3-5 worked examples that apply concepts to realistic scenarios
- Each must have: question, working space (350px, watermark number), show/hide solution
- Solutions should be step-by-step with numbered steps
- Progress from easier to harder

### Practice Questions

- 2-3 practice questions at the end
- These are for students to attempt themselves
- Include solutions but hidden by default
- Should test application, not just recall

---

## QUALITY CHECKLIST

Before submitting the HTML, verify:

- [ ] Correct colour scheme for the subject
- [ ] Header bar ONLY on title slide (Slide 1)
- [ ] All other slides have `data-show-header="false"`
- [ ] Spec reference in title badge matches outline
- [ ] All learning objectives are covered
- [ ] All key terms have definition boxes
- [ ] Working spaces are 350px minimum height
- [ ] Each solution has unique ID (sol1, sol2, prac1, etc.)
- [ ] Toggle buttons call correct solution IDs
- [ ] Slide counter shows correct total
- [ ] No emojis anywhere
- [ ] Summary includes exam tips

---

## EXAMPLE PROMPT TO USE

Once you have this document and your Content Outline ready, use this prompt:

```
Using the ExamRizz Video Lesson HTML Generator instructions provided, create a complete HTML video lesson file for the following Content Outline:

[PASTE CONTENT OUTLINE HERE]

Requirements:
- Subject: [Economics/Maths/Physics/etc.]
- Generate a complete, standalone HTML file
- Follow the neubrutalism design system exactly
- Include 3-5 worked examples and 2-3 practice questions
- Ensure all learning objectives and key terms are covered
```

---

## TROUBLESHOOTING

**Problem:** Solutions don't toggle
**Fix:** Ensure each solution ID is unique and matches the onclick parameter

**Problem:** Header shows on all slides
**Fix:** Only Slide 1 should have `data-show-header="true"`

**Problem:** Colours look wrong
**Fix:** Check you've used the correct colour codes for the subject from the table above

**Problem:** Slide counter shows wrong total
**Fix:** The JavaScript counts slides automatically — ensure you haven't broken the HTML structure

---

**END OF INSTRUCTIONS**