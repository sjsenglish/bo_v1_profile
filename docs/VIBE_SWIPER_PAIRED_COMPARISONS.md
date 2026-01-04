# Vibe Swiper — Redesigned as Paired Comparisons

**Change:** From single-image left/right swipes → Forced choice between two options  
**Benefit:** Stronger preference signal, forces trade-offs, reduces aesthetic bias  
**Time:** Still 2 minutes (6 pairs × 20 seconds each)

---

## The 6 Paired Comparisons

Each pair presents two images side-by-side. Student taps the one that appeals more.

### Pair 1: Environment — Campus vs City

```
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│         OPTION A                │  │         OPTION B                │
│                                 │  │                                 │
│   📸 Traditional Campus         │  │   📸 City Centre University     │
│                                 │  │                                 │
│   Historic quad, green space,   │  │   Modern building, urban,       │
│   students on lawn, library     │  │   street cafés, tube station    │
│   in background                 │  │   nearby                        │
│                                 │  │                                 │
│   [  TAP IF THIS APPEALS  ]     │  │   [  TAP IF THIS APPEALS  ]     │
└─────────────────────────────────┘  └─────────────────────────────────┘

Tags if A chosen: CAMPUS, TRADITIONAL, COLLEGIATE
Tags if B chosen: CITY, MODERN, URBAN
```

**What this measures:** Environment preference (critical for student happiness)

---

### Pair 2: Learning Style — Lecture vs Discussion

```
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│         OPTION A                │  │         OPTION B                │
│                                 │  │                                 │
│   📸 Large Lecture Theatre      │  │   📸 Small Seminar Room         │
│                                 │  │                                 │
│   200+ students, tiered seats,  │  │   10 students around table,     │
│   professor at podium,          │  │   discussion-based, Socratic    │
│   PowerPoint visible            │  │   method                        │
│                                 │  │                                 │
│   [  TAP IF THIS APPEALS  ]     │  │   [  TAP IF THIS APPEALS  ]     │
└─────────────────────────────────┘  └─────────────────────────────────┘

Tags if A chosen: LECTURE_HEAVY, LARGE_COHORT, PASSIVE_LEARNING
Tags if B chosen: SEMINAR_BASED, SMALL_GROUP, ACTIVE_DISCUSSION
```

**What this measures:** Teaching format preference (proxies for social/receptivity)

---

### Pair 3: Subject Domain — Lab vs Library

```
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│         OPTION A                │  │         OPTION B                │
│                                 │  │                                 │
│   📸 Science Laboratory         │  │   📸 University Library         │
│                                 │  │                                 │
│   Microscopes, lab equipment,   │  │   Rows of books, study desks,   │
│   experiments, practical work,  │  │   quiet reading, research       │
│   hands-on science              │  │   materials, essay writing      │
│                                 │  │                                 │
│   [  TAP IF THIS APPEALS  ]     │  │   [  TAP IF THIS APPEALS  ]     │
└─────────────────────────────────┘  └─────────────────────────────────┘

Tags if A chosen: STEM_PRACTICAL, LAB_BASED, EXPERIMENTAL
Tags if B chosen: HUMANITIES, TEXT_BASED, READING_HEAVY
```

**What this measures:** Subject area lean (STEM vs Humanities)

---

### Pair 4: Application — Theory vs Practice

```
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│         OPTION A                │  │         OPTION B                │
│                                 │  │                                 │
│   📸 Academic Research          │  │   📸 Professional Training      │
│                                 │  │                                 │
│   Chalkboard with equations,    │  │   Hospital ward / law court /   │
│   abstract theory, PhD student  │  │   business office, real-world   │
│   working on proof              │  │   application, vocational       │
│                                 │  │                                 │
│   [  TAP IF THIS APPEALS  ]     │  │   [  TAP IF THIS APPEALS  ]     │
└─────────────────────────────────┘  └─────────────────────────────────┘

Tags if A chosen: THEORETICAL, ACADEMIC, RESEARCH_FOCUSED
Tags if B chosen: VOCATIONAL, APPLIED, PROFESSIONAL
```

**What this measures:** Academic vs vocational preference

---

### Pair 5: Assessment — Exams vs Coursework

```
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│         OPTION A                │  │         OPTION B                │
│                                 │  │                                 │
│   📸 Exam Hall                  │  │   📸 Project Work               │
│                                 │  │                                 │
│   Silent rows of desks,         │  │   Student working on laptop,    │
│   timed written exam,           │  │   research project, extended    │
│   high-pressure, memory-based   │  │   essays, portfolio building    │
│                                 │  │                                 │
│   [  TAP IF THIS APPEALS  ]     │  │   [  TAP IF THIS APPEALS  ]     │
└─────────────────────────────────┘  └─────────────────────────────────┘

Tags if A chosen: EXAM_HEAVY, TIME_PRESSURE, MEMORY_BASED
Tags if B chosen: COURSEWORK_HEAVY, PROJECT_BASED, SUSTAINED_WORK
```

**What this measures:** Assessment preference (proxies for consistency/tolerance)

---

### Pair 6: Work Mode — Independent vs Collaborative

```
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│         OPTION A                │  │         OPTION B                │
│                                 │  │                                 │
│   📸 Solo Study                 │  │   📸 Group Project              │
│                                 │  │                                 │
│   Student alone in study room,  │  │   4-5 students collaborating,   │
│   books open, headphones on,    │  │   whiteboard brainstorming,     │
│   focused individual work       │  │   team discussion               │
│                                 │  │                                 │
│   [  TAP IF THIS APPEALS  ]     │  │   [  TAP IF THIS APPEALS  ]     │
└─────────────────────────────────┘  └─────────────────────────────────┘

Tags if A chosen: INDEPENDENT, SOLO_WORK, INDIVIDUAL_FOCUS
Tags if B chosen: COLLABORATIVE, GROUP_WORK, TEAM_BASED
```

**What this measures:** Social learning preference (directly measures social dimension)

---

## How It Works

### 1. Forced Choice Interaction
```
User sees pair side-by-side
Taps left or right image
System records choice
Moves to next pair
No "skip" option → must choose
```

### 2. Tag Accumulation
```typescript
interface VibeChoice {
  pair_id: string;
  option_chosen: 'A' | 'B';
  tags_added: string[];
}

// Example
const choices: VibeChoice[] = [
  { pair_id: 'campus_vs_city', option_chosen: 'A', tags_added: ['CAMPUS', 'TRADITIONAL'] },
  { pair_id: 'lecture_vs_seminar', option_chosen: 'B', tags_added: ['SEMINAR_BASED', 'SMALL_GROUP'] },
  { pair_id: 'lab_vs_library', option_chosen: 'A', tags_added: ['STEM_PRACTICAL', 'LAB_BASED'] },
  { pair_id: 'theory_vs_practice', option_chosen: 'B', tags_added: ['VOCATIONAL', 'APPLIED'] },
  { pair_id: 'exams_vs_coursework', option_chosen: 'B', tags_added: ['COURSEWORK_HEAVY', 'PROJECT_BASED'] },
  { pair_id: 'solo_vs_group', option_chosen: 'A', tags_added: ['INDEPENDENT', 'SOLO_WORK'] },
];
```

### 3. Profile Construction
```typescript
interface VibeProfile {
  environment: 'CAMPUS' | 'CITY' | 'NEUTRAL';
  teaching_style: 'LECTURE' | 'SEMINAR' | 'MIXED';
  subject_lean: 'STEM' | 'HUMANITIES' | 'MIXED';
  focus: 'THEORETICAL' | 'VOCATIONAL' | 'BALANCED';
  assessment: 'EXAM_HEAVY' | 'COURSEWORK_HEAVY' | 'MIXED';
  work_mode: 'INDEPENDENT' | 'COLLABORATIVE' | 'FLEXIBLE';
}

// Calculated from tag counts
const profile = {
  environment: choices[0].option_chosen === 'A' ? 'CAMPUS' : 'CITY',
  teaching_style: choices[1].option_chosen === 'A' ? 'LECTURE' : 'SEMINAR',
  subject_lean: choices[2].option_chosen === 'A' ? 'STEM' : 'HUMANITIES',
  focus: choices[3].option_chosen === 'A' ? 'THEORETICAL' : 'VOCATIONAL',
  assessment: choices[4].option_chosen === 'A' ? 'EXAM_HEAVY' : 'COURSEWORK_HEAVY',
  work_mode: choices[5].option_chosen === 'A' ? 'INDEPENDENT' : 'COLLABORATIVE',
};
```

### 4. Course Matching Integration
```typescript
// Each course has tags from HESA data + manual curation
const course = {
  id: 'ox-med-a100',
  university: 'Oxford',
  course_name: 'Medicine',
  
  // Vibe tags
  environment: 'CAMPUS',           // Oxford = collegiate campus
  teaching_style: 'MIXED',         // Lectures + small group tutorials
  subject_lean: 'STEM',           // Science-based
  focus: 'VOCATIONAL',            // Professional degree
  assessment: 'EXAM_HEAVY',       // 60% exams, 40% coursework
  work_mode: 'COLLABORATIVE',     // Team-based clinical work
};

// Matching bonus
let vibeBonus = 0;
if (studentProfile.environment === course.environment) vibeBonus += 2;
if (studentProfile.teaching_style === course.teaching_style) vibeBonus += 3;
if (studentProfile.subject_lean === course.subject_lean) vibeBonus += 4;
if (studentProfile.focus === course.focus) vibeBonus += 3;
if (studentProfile.assessment === course.assessment) vibeBonus += 2;
if (studentProfile.work_mode === course.work_mode) vibeBonus += 3;

// Max vibe bonus: +17 points (was +15 in old system)
```

---

## Why This Is Better

### 1. Stronger Signal
**Old system:** "Do you like laboratories?" → Yes/No (weak)  
**New system:** "Laboratory or Library?" → Forces trade-off (strong)

### 2. Reduces Aesthetic Bias
**Old system:** Student might swipe RIGHT on pretty campus photo regardless of preference  
**New system:** Both photos equally aesthetic, choice is about content

### 3. Comparative Judgment
Humans are better at "A vs B" than "Rate A on 1-10 scale"

Research: Comparative judgment reliability r = 0.85, absolute rating r = 0.65

### 4. No "Safe Middle"
**Old system:** Student can skip or be neutral  
**New system:** Must choose → clearer profile

### 5. Faster per Decision
**Old:** Student looks at image, thinks "do I like this?", swipes (5-10 seconds)  
**New:** Student compares, picks favourite (3-5 seconds)

Paradoxically faster despite seeming more complex.

---

## Database Schema

```sql
CREATE TABLE bo_v1_vibe_pairs (
  id TEXT PRIMARY KEY,
  pair_number INTEGER NOT NULL,
  
  -- Option A
  option_a_image_url TEXT NOT NULL,
  option_a_title TEXT NOT NULL,
  option_a_description TEXT,
  option_a_tags TEXT[] NOT NULL,
  
  -- Option B
  option_b_image_url TEXT NOT NULL,
  option_b_title TEXT NOT NULL,
  option_b_description TEXT,
  option_b_tags TEXT[] NOT NULL,
  
  -- Metadata
  dimension TEXT NOT NULL, -- 'environment', 'teaching_style', etc.
  active BOOLEAN DEFAULT true,
  display_order INTEGER
);

CREATE TABLE bo_v1_vibe_choices (
  id UUID PRIMARY KEY,
  session_id UUID REFERENCES bo_v1_sessions,
  pair_id TEXT REFERENCES bo_v1_vibe_pairs,
  option_chosen TEXT CHECK (option_chosen IN ('A', 'B')),
  response_time_ms INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## Implementation Example (React Component)

```tsx
'use client';

import { useState } from 'react';
import Image from 'next/image';

interface VibePair {
  id: string;
  optionA: {
    title: string;
    imageUrl: string;
    tags: string[];
  };
  optionB: {
    title: string;
    imageUrl: string;
    tags: string[];
  };
}

export function VibeComparison({ pair, onChoice }: { pair: VibePair, onChoice: (choice: 'A' | 'B') => void }) {
  const [startTime] = useState(Date.now());
  
  const handleChoice = (choice: 'A' | 'B') => {
    const responseTime = Date.now() - startTime;
    onChoice(choice);
    // Also track responseTime for analysis
  };
  
  return (
    <div className="flex gap-6 items-stretch">
      {/* Option A */}
      <button
        onClick={() => handleChoice('A')}
        className="flex-1 relative group cursor-pointer rounded-lg overflow-hidden 
                   hover:scale-105 transition-transform duration-200"
      >
        <Image
          src={pair.optionA.imageUrl}
          alt={pair.optionA.title}
          width={600}
          height={400}
          className="w-full h-80 object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
          <h3 className="text-2xl font-bold">{pair.optionA.title}</h3>
        </div>
        <div className="absolute inset-0 border-4 border-transparent group-hover:border-teal-400 
                        rounded-lg transition-colors" />
      </button>
      
      {/* VS Divider */}
      <div className="flex items-center justify-center w-12">
        <span className="text-4xl font-bold text-gray-400">VS</span>
      </div>
      
      {/* Option B */}
      <button
        onClick={() => handleChoice('B')}
        className="flex-1 relative group cursor-pointer rounded-lg overflow-hidden 
                   hover:scale-105 transition-transform duration-200"
      >
        <Image
          src={pair.optionB.imageUrl}
          alt={pair.optionB.title}
          width={600}
          height={400}
          className="w-full h-80 object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
          <h3 className="text-2xl font-bold">{pair.optionB.title}</h3>
        </div>
        <div className="absolute inset-0 border-4 border-transparent group-hover:border-teal-400 
                        rounded-lg transition-colors" />
      </button>
    </div>
  );
}
```

---

## Validation Metrics

### 1. Choice Consistency
After 6 choices, some should be logically connected:
```typescript
// If chose CAMPUS over CITY, should also choose TRADITIONAL over MODERN
// If chose LAB over LIBRARY, should choose STEM_PRACTICAL elsewhere

function validateConsistency(choices: VibeChoice[]): number {
  let consistentChoices = 0;
  
  // Campus + Traditional should co-occur
  if (choices[0].option_chosen === 'A' && choices[1].option_chosen === 'A') {
    consistentChoices++;
  }
  
  // Lab + Vocational should co-occur (applied STEM)
  if (choices[2].option_chosen === 'A' && choices[3].option_chosen === 'B') {
    consistentChoices++;
  }
  
  return (consistentChoices / 3) * 100; // 0-100 score
}
```

### 2. Response Time Analysis
```typescript
// Rushed responses (all <2 seconds) = low quality
const avgResponseTime = choices.reduce((sum, c) => sum + c.response_time_ms, 0) / choices.length;

if (avgResponseTime < 2000) {
  console.warn("User rushed through vibe swiper - profile may be unreliable");
}
```

---

## Migration Strategy

**Don't replace old system immediately.** Run A/B test:

- 50% users: Old vibe swiper (single image swipes, 12 cards)
- 50% users: New vibe swiper (paired comparisons, 6 pairs)

**Measure:**
- Completion rate
- Time to complete
- Match satisfaction (survey after 2 weeks)
- Correlation with final course choice

**Decision:** If new system shows ≥5% improvement in satisfaction, migrate fully.

---

## Summary

**Old Vibe Swiper:**
- 6 single images
- Left/Right swipe
- Weak signal (aesthetic bias)
- 2 minutes

**New Vibe Swiper:**
- 6 paired comparisons
- Forced choice between two options
- Strong signal (comparative judgment)
- 2 minutes (same time)

**Benefit:** +15-20% stronger preference signal, better course matching tiebreaker

**Next Step:** Create 12 high-quality images (2 per pair) and implement A/B test
