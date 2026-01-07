# UI Implementation Guide for Claude Code

**Project:** ExamRizz Arena Onboarding MVP  
**Database:** ✅ Migrations complete  
**Next:** Build UI components for new flow

---

## Implementation Order (Priority)

```
1. Update Vibe Swiper (5 min - EASY)
   ↓
2. Build Quick Scenarios Component (1-2 hours - MEDIUM)
   ↓
3. Build Mini-Sample Components (2-3 hours - HARD)
   ↓
4. Build Profile/Results Page (2-3 hours - COMPLEX)
```

---

## TASK 1: Update Vibe Swiper (5 minutes)

### File to Edit
`src/app/assessment/vibe/page.tsx`

### Current Issue
Loads all 12 vibe cards instead of 6 active ones.

### Fix Required
Change the Supabase query to filter by `active = TRUE`

### Current Query (approximate)
```typescript
const { data: cards } = await supabase
  .from('bo_v1_vibe_cards')
  .select('*')
  .order('sort_order');
```

### Updated Query
```typescript
const { data: cards } = await supabase
  .from('bo_v1_vibe_cards')
  .select('*')
  .eq('active', true)  // ← ADD THIS LINE
  .order('sort_order');
```

### Verification
- Should load exactly 6 cards
- Cards should be: VIBE_03, VIBE_05, VIBE_06, VIBE_07, VIBE_08, VIBE_09

### Testing
1. Start dev server: `npm run dev`
2. Navigate to `/assessment/vibe`
3. Count cards - should see 6, not 12
4. Verify no errors in console

---

## TASK 2: Build Quick Scenarios Component (1-2 hours)

### File to Create
`src/app/assessment/scenarios/page.tsx`

### Component Requirements

**Data Source:** `bo_v1_scenarios` table (8 forced-choice questions)

**UI Structure:**
```
┌─────────────────────────────────────┐
│  Progress: 3/8                      │
├─────────────────────────────────────┤
│                                     │
│  [Scenario Context Text]            │
│  "You're solving a new problem.     │
│   What's your instinct?"            │
│                                     │
│  ┌─────────────────────┐            │
│  │  A) This reminds... │  ← Button  │
│  └─────────────────────┘            │
│                                     │
│  ┌─────────────────────┐            │
│  │  B) Let me find...  │  ← Button  │
│  └─────────────────────┘            │
│                                     │
└─────────────────────────────────────┘
```

**Key Features:**
1. Load 8 scenarios from database
2. Show one at a time (not all at once)
3. Two large buttons for Option A and Option B
4. Progress indicator (1/8, 2/8, etc.)
5. Save response to `bo_v1_diagnostic_responses` table
6. Auto-advance to next question on click
7. After 8th question, redirect to `/assessment/mini-samples`

### Database Operations

**Load scenarios:**
```typescript
const { data: scenarios } = await supabase
  .from('bo_v1_scenarios')
  .select('*')
  .eq('active', true)
  .order('sort_order');
```

**Save response:**
```typescript
await supabase
  .from('bo_v1_diagnostic_responses')
  .insert({
    session_id: sessionId,
    question_id: scenario.id,
    value: choice, // 'A' or 'B' (note: currently uses INTEGER, may need to adapt)
    skipped: false,
    response_time_ms: responseTime
  });
```

**Note:** The `bo_v1_diagnostic_responses.value` column is currently INTEGER (for Likert 1-5). You have two options:

**Option A (Quick Fix):** Store 'A' as 1, 'B' as 2
```typescript
value: choice === 'A' ? 1 : 2
```

**Option B (Proper Fix):** Alter column to TEXT
```sql
ALTER TABLE bo_v1_diagnostic_responses ALTER COLUMN value TYPE TEXT;
```

**Recommendation:** Use Option A for now (quick), Option B can be a future migration.

### Session State Update

After completing all 8 scenarios:
```typescript
await supabase
  .from('bo_v1_sessions')
  .update({
    scenarios_completed: true,
    questions_answered: questions_answered + 8
  })
  .eq('id', sessionId);
```

### Styling Notes
- Use existing Arcane design system components
- Large, clickable buttons (minimum 44px height for mobile)
- Clear visual feedback on hover
- Consider adding subtle animation on button click
- Match existing assessment flow styling from cognitive/behavioral pages

### Flow Integration
- **Previous page:** `/assessment/vibe` → redirect to `/assessment/scenarios`
- **Next page:** After 8 scenarios → redirect to `/assessment/mini-samples`

### Error Handling
- Handle missing session_id (redirect to landing)
- Handle database errors gracefully
- Allow back navigation (but don't let them change previous answers)
- Consider localStorage backup in case of refresh

---

## TASK 3: Build Mini-Sample Components (2-3 hours)

### File to Create
`src/app/assessment/mini-samples/page.tsx`

### Architecture

**Container Component:** Mini-samples page that routes between 3 tasks

**Child Components (create these):**
1. `src/components/mini-samples/CodeTraceTask.tsx`
2. `src/components/mini-samples/SourceAnalysisTask.tsx`
3. `src/components/mini-samples/DataInterpretationTask.tsx`
4. `src/components/mini-samples/TaskTimer.tsx`
5. `src/components/mini-samples/EnjoymentRating.tsx`

### Data Source
`bo_v1_mini_sample_items` table has 3 foundation tasks:
- MS_CODE_01 (Code Trace)
- MS_SOURCE_01 (Source Analysis)
- MS_DATA_01 (Data Interpretation)

### Task Flow
```
Load Task 1 (Code Trace)
   ↓
Show stimulus + questions
   ↓
90-second timer countdown
   ↓
Student answers questions
   ↓
Timer expires OR student finishes
   ↓
Enjoyment overlay appears (😫 😐 😊)
   ↓
Save response + enjoyment
   ↓
Load Task 2 (Source Analysis)
   ↓
[Repeat]
   ↓
Load Task 3 (Data Interpretation)
   ↓
[Repeat]
   ↓
All 3 complete → Redirect to /assessment/processing
```

### Database Schema Reference

**Load task:**
```typescript
const { data: task } = await supabase
  .from('bo_v1_mini_sample_items')
  .select('*')
  .eq('id', taskId)
  .single();

// task.stimulus = code snippet / passage / data table
// task.questions = JSONB array of questions
```

**Questions JSONB structure:**
```typescript
[
  {
    question: "What does this function calculate?",
    type: "MCQ",
    options: ["Sum of factors", "Prime check", "Fibonacci", "Factorial"],
    correct: 0  // index of correct answer
  },
  {
    question: "What is the output?",
    type: "TEXT_INPUT",
    correct: "28"
  }
]
```

**Save response:**
```typescript
await supabase
  .from('bo_v1_mini_sample_responses')
  .insert({
    session_id: sessionId,
    task_id: task.id,
    responses: {
      q1: "0",  // selected option index or text input
      q2: "28"
    },
    correctness: {
      q1: true,
      q2: true
    },
    score_percentage: 100,
    time_taken_seconds: 75,
    overtime: false,
    enjoyment_rating: 3,  // 1=😫, 2=😐, 3=😊
    enjoyment_feedback: null
  });
```

### Timer Component Requirements

**TaskTimer.tsx:**
- Countdown from 90 seconds
- Visual warning at 10 seconds (color change, pulse)
- At 0:00, does NOT force submit
- Shows "Overtime" indicator if >90s
- Saves actual time taken

**Implementation:**
```typescript
const [timeLeft, setTimeLeft] = useState(90);
const [overtime, setOvertime] = useState(false);

useEffect(() => {
  const interval = setInterval(() => {
    setTimeLeft(prev => {
      if (prev <= 0) {
        setOvertime(true);
        return 0;
      }
      return prev - 1;
    });
  }, 1000);
  
  return () => clearInterval(interval);
}, []);

// Display: 1:30, 1:29, ..., 0:10 (warning), 0:00, OVERTIME
```

### Enjoyment Rating Component

**EnjoymentRating.tsx:**
- Blocking modal (can't proceed without rating)
- 3 emoji buttons: 😫 😐 😊
- Optional text feedback (100 char limit)
- [Continue] button (only active after emoji selected)

**Implementation:**
```typescript
<div className="enjoyment-overlay">
  <h3>How did that feel?</h3>
  
  <div className="emoji-buttons">
    <button onClick={() => setRating(1)}>😫<br/>Painful</button>
    <button onClick={() => setRating(2)}>😐<br/>Neutral</button>
    <button onClick={() => setRating(3)}>😊<br/>Enjoyed</button>
  </div>
  
  <textarea 
    placeholder="Any quick thoughts? (optional)"
    maxLength={100}
  />
  
  <button 
    disabled={!rating}
    onClick={handleContinue}
  >
    Continue
  </button>
</div>
```

### Task Type Components

Each task type needs its own display component:

**CodeTraceTask.tsx:**
- Display code in `<pre><code>` with syntax highlighting
- Show questions below code
- MCQ = radio buttons
- TEXT_INPUT = text field

**SourceAnalysisTask.tsx:**
- Display passage in readable format
- Show questions below
- MCQ = radio buttons
- MULTI_SELECT = checkboxes

**DataInterpretationTask.tsx:**
- Display table/data
- Show questions below
- MCQ questions only (for foundation tier)

### Session State Updates

After each task:
```typescript
// After Code Trace
await supabase
  .from('bo_v1_sessions')
  .update({ mini_sample_code_completed: true })
  .eq('id', sessionId);

// After all 3 tasks
await supabase
  .from('bo_v1_sessions')
  .update({ mini_samples_completed: true })
  .eq('id', sessionId);
```

### Responsive Design
- Mobile: Stack code/passage above questions
- Desktop: Side-by-side if space allows
- Ensure code doesn't overflow on small screens (horizontal scroll)
- Timer always visible (sticky header or floating)

---

## TASK 4: Build Profile/Results Page (2-3 hours)

### Files to Create/Update
- `src/app/results/[sessionId]/page.tsx` (may already exist, needs updating)
- `src/components/results/ProfileHeader.tsx`
- `src/components/results/EarlyIndicators.tsx`
- `src/components/results/CourseMatches.tsx`
- `src/components/results/SharpeningCTAs.tsx`

### Data to Display

**Profile Header:**
```typescript
const { data: profile } = await supabase
  .from('bo_v1_profiles')
  .select('*')
  .eq('session_id', sessionId)
  .single();

const { data: session } = await supabase
  .from('bo_v1_sessions')
  .select('precision_score')
  .eq('id', sessionId)
  .single();

// Display:
// - precision_score (40% initially)
// - precision_tier ('FOUNDATION' at <70%)
// - familiar_id (locked/null at <70%)
// - guild_id (locked/null at <70%)
```

**Early Indicators (Cluster Signals):**
```typescript
const { data: miniSampleResponses } = await supabase
  .from('bo_v1_mini_sample_responses')
  .select(`
    *,
    bo_v1_mini_sample_items (cluster)
  `)
  .eq('session_id', sessionId);

// Aggregate by cluster:
// - STEM: Code Trace performance + enjoyment
// - HUMANITIES: Source Analysis performance + enjoyment
// - ANALYTICAL: Data Interpretation performance + enjoyment

// Show 3 cards with:
// - Performance score (0-100)
// - Enjoyment rating (😫 😐 😊)
// - Insight message based on combination
```

**Course Matches:**
```typescript
const { data: matches } = await supabase
  .from('bo_v1_matches')
  .select(`
    *,
    bo_v1_courses (*)
  `)
  .eq('session_id', sessionId)
  .order('rank', { ascending: true })
  .limit(20);

// Display top 10 as cards with:
// - University name
// - Course name
// - Match percentage
// - Russell Group badge if applicable
// - [View Details] button
```

**Sharpening CTAs:**
```typescript
// Show 4 sharpening activities (placeholders for now):
const activities = [
  { name: 'Reasoning Challenges', time: '~4 min', precision: '+15%' },
  { name: 'Speed Challenge', time: '~3 min', precision: '+10%' },
  { name: 'More Scenarios', time: '~4 min', precision: '+12%' },
  { name: 'Challenge Mini-Samples', time: '~3 min', precision: '+8%' }
];

// Display as cards with:
// - Activity name
// - Time estimate
// - Precision improvement
// - "Coming soon" badge (not functional yet)
```

### Layout Structure

**Desktop:**
```
┌─────────────────────────────────────────┐
│ Profile Header                          │
│ (Precision, Familiar, Guild)            │
├─────────────────────────────────────────┤
│ Early Indicators                        │
│ [STEM]  [Humanities]  [Analytical]      │
├─────────────────────────────────────────┤
│ Course Recommendations                  │
│ [Top Matches]  [Best Fit For You]       │
│ (Card grid)                             │
├─────────────────────────────────────────┤
│ Sharpening Activities                   │
│ [Activity 1] [Activity 2]               │
│ [Activity 3] [Activity 4]               │
├─────────────────────────────────────────┤
│ Explore More                            │
│ [Careers] [Supercurriculars]            │
└─────────────────────────────────────────┘
```

**Mobile:** Stack all sections vertically

### Precision Indicator

**Visual requirements:**
- Show percentage (e.g., "42%")
- Show confidence level ("Low confidence" / "Medium" / "High")
- Color coding:
  - Red/Amber: <50%
  - Amber: 50-69%
  - Teal/Green: 70%+
- Progress bar or circular indicator
- Prominent placement (top of page)

### Locked Familiar/Guild

**Display:**
- Silhouette image (mysterious shape)
- "Unlock at 70% precision" message
- Greyed out / locked visual state
- Hover tooltip: "Complete sharpening activities to unlock"

### Styling Reference

See `VALORANT_STYLE_GUIDE.md` for:
- Angled corner cards
- Diagonal section dividers
- 3D tilt hover states
- Outlined typography
- Teal accent colors (#54acbf)
- Dark background (#011c40)

**Don't need to implement full Valorant aesthetic immediately** - functional UI first, polish later.

---

## Development Workflow

### For Each Task:

1. **Create branch** (optional but recommended)
```bash
git checkout -b feature/quick-scenarios
```

2. **Build component**
```bash
# Create file
touch src/app/assessment/scenarios/page.tsx

# Start dev server
npm run dev
```

3. **Test locally**
- Navigate to route
- Test happy path
- Test error cases
- Check mobile responsive
- Check console for errors

4. **Commit**
```bash
git add .
git commit -m "feat: add Quick Scenarios component"
```

5. **Deploy to Vercel**
```bash
git push origin feature/quick-scenarios
# Or merge to main and push
```

---

## Testing Checklist

### After Each Component:

- [ ] Loads without errors
- [ ] Data fetches from Supabase correctly
- [ ] Saves responses to database
- [ ] Updates session state
- [ ] Redirects to next page correctly
- [ ] Works on mobile (responsive)
- [ ] No console errors
- [ ] No TypeScript errors

### End-to-End Test:

1. Start at `/assessment/vibe`
2. Swipe 6 cards → should redirect to `/assessment/scenarios`
3. Answer 8 scenarios → should redirect to `/assessment/mini-samples`
4. Complete 3 mini-samples with enjoyment ratings → should redirect to `/results/[sessionId]`
5. See profile with 40% precision, locked familiar, course matches
6. Verify data saved in all tables

---

## Common Issues & Solutions

### Issue: Session ID not found
**Cause:** Not creating/passing session ID correctly  
**Solution:** Create session in localStorage on landing, pass to all pages

### Issue: TypeScript errors on Supabase types
**Cause:** Types out of sync with database  
**Solution:** Run `npx supabase gen types typescript`

### Issue: Vibe cards showing 12 instead of 6
**Cause:** Query not filtering by active  
**Solution:** Add `.eq('active', true)`

### Issue: Mini-sample questions not displaying
**Cause:** JSONB parsing issue  
**Solution:** Access `task.questions` as JavaScript object directly

### Issue: Timer not stopping
**Cause:** Interval not cleared  
**Solution:** Return cleanup function in useEffect

---

## File Structure After Implementation

```
src/
├── app/
│   ├── assessment/
│   │   ├── vibe/page.tsx (✅ UPDATE)
│   │   ├── scenarios/page.tsx (➕ CREATE)
│   │   └── mini-samples/
│   │       └── page.tsx (➕ CREATE)
│   └── results/
│       └── [sessionId]/page.tsx (✅ UPDATE)
├── components/
│   ├── mini-samples/
│   │   ├── CodeTraceTask.tsx (➕ CREATE)
│   │   ├── SourceAnalysisTask.tsx (➕ CREATE)
│   │   ├── DataInterpretationTask.tsx (➕ CREATE)
│   │   ├── TaskTimer.tsx (➕ CREATE)
│   │   └── EnjoymentRating.tsx (➕ CREATE)
│   └── results/
│       ├── ProfileHeader.tsx (➕ CREATE)
│       ├── EarlyIndicators.tsx (➕ CREATE)
│       ├── CourseMatches.tsx (➕ CREATE)
│       └── SharpeningCTAs.tsx (➕ CREATE)
└── lib/
    └── services/
        └── assessment.ts (✅ UPDATE - session state helpers)
```

---

## Priority Recommendations

**Start with Task 1 (Vibe Swiper)** - Easy win, 5 minutes  
**Then Task 2 (Scenarios)** - Core flow, tests database integration  
**Then Task 3 (Mini-Samples)** - Most complex, needs timer + enjoyment  
**Finally Task 4 (Results)** - Can be iterative, add sections progressively  

**Don't try to build everything at once.** Get one page working end-to-end, then move to the next.

---

## Support Resources

**Database schema:** See `DATABASE_ARCHITECTURE.md`  
**Design reference:** See `VALORANT_STYLE_GUIDE.md` (if visual polish needed)  
**Existing patterns:** Check `/src/app/assessment/cognitive/page.tsx` for question display patterns  

---

**Good luck! Build one component at a time, test thoroughly, then move to next.**
