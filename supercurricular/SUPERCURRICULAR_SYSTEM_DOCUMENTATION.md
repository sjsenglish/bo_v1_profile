# ExamRizz Arena — Supercurricular System Documentation

**Version:** 1.0  
**Date:** 30 December 2024  
**Status:** System complete for 10 clusters, pending database execution

---

## Table of Contents

1. [Problem Statement](#1-problem-statement)
2. [Architecture Overview](#2-architecture-overview)
3. [Key Design Decisions](#3-key-design-decisions)
4. [Data Model Deep Dive](#4-data-model-deep-dive)
5. [Content Generation Pipeline](#5-content-generation-pipeline)
6. [Course Linking System](#6-course-linking-system)
7. [Quiz Translation Layer](#7-quiz-translation-layer)
8. [Implementation Status](#8-implementation-status)
9. [Scaling & Future Content](#9-scaling--future-content)
10. [Open Questions & Gaps](#10-open-questions--gaps)

---

## 1. Problem Statement

### What Are Supercurriculars?

Supercurriculars are enrichment activities that prepare students for specific university courses and subjects. Unlike extracurriculars (which are general activities like sports or music), supercurriculars are academically focused and directly relevant to a student's intended field of study.

Examples include:
- **Books**: "Do No Harm" by Henry Marsh for Medicine applicants
- **Online courses**: CS50 for Computer Science applicants
- **Admission tests**: UCAT, BMAT, LNAT
- **Competitions**: Biology Olympiad, John Locke Essay Competition
- **Volunteering**: St John Ambulance, NHS volunteering

### Why Build This System?

ExamRizz Arena's core function is matching students to university courses based on their cognitive and behavioural disposition profiles. Once a student knows which courses suit them, the natural next question is: **"What should I do to prepare?"**

The supercurricular system answers this by:
1. Recommending activities aligned with the student's matched courses
2. Suggesting activities that strengthen the student's weakest dispositions (their "nemesis")
3. Providing a gamified progression system (XP, badges, achievements)
4. Enabling AI-assisted engagement with content (book chapter discussions)

### Core Requirements

1. **Course-linked**: Supercurriculars must connect to real UK university courses via CAH codes, keywords, or specific course IDs
2. **Disposition-aware**: Each supercurricular should boost specific cognitive/behavioural dispositions
3. **Multi-dimensional difficulty**: Different types of challenge (conceptual, volume, technical, verbal, ambiguity, self-direction)
4. **Quiz-agnostic**: The same supercurricular catalogue should work across multiple quiz products
5. **Validated content**: LLM-generated content must pass automated verification before going live

---

## 2. Architecture Overview

### Six-Table Schema

```
bo_v1_supercurriculars (Master catalogue)
    │
    ├── bo_v1_supercurricular_sections (Book chapters, course modules)
    │       │
    │       └── bo_v1_section_progress (Per-section user tracking)
    │
    ├── bo_v1_supercurricular_course_links (Links to university courses)
    │
    ├── bo_v1_supercurricular_quiz_mappings (Per-quiz interpretation)
    │
    └── bo_v1_supercurricular_progress (Per-user completion tracking)
```

### Relationship to Main System

```
bo_v1_profiles (student disposition scores)
    ↓
bo_v1_matches (course recommendations)
    ↓
bo_v1_courses.cah_code
    ↓
bo_v1_supercurricular_course_links.cah_code
    ↓
bo_v1_supercurriculars (enrichment recommendations)
```

The supercurricular system sits downstream of the course matching algorithm. After a student completes the assessment and receives course recommendations, the system queries for supercurriculars linked to those courses' CAH codes.

### File Organisation

All SQL seed files follow a numbered convention:

| Range | Content |
|-------|---------|
| 001-009 | MED cluster |
| 010-019 | SOC cluster |
| 020-029 | LAW cluster |
| 030-039 | STEM_PHYS cluster |
| 040-049 | ENG cluster |
| 050-059 | COMP cluster |
| 060-069 | HUM cluster |
| 070-079 | BUS cluster |
| 080-089 | STEM_LIFE cluster |
| 090-099 | LANG cluster |

Within each range:
- `X00` = Main supercurricular inserts
- `X01` = Course links
- `X02` = Sections (for books with chapters)
- `X04` = Quiz mappings

---

## 3. Key Design Decisions

### 3.1 Human-Readable IDs (Not UUIDs)

**Decision**: Use TEXT IDs like `book_do_no_harm` instead of UUIDs.

**Rationale**: 
- Easier to reference in seed files and debugging
- Self-documenting (you can read the ID and know what it is)
- Stable across environments (same ID in dev, staging, prod)

**Trade-off**: Must manually ensure uniqueness. The ID format is `{type}_{short_name}`.

### 3.2 Multi-Dimensional Difficulty (6 Dimensions)

**Decision**: Instead of a single "difficulty" score, use 6 dimensions that map to quiz dispositions.

| Dimension | Measures | Quiz Mapping |
|-----------|----------|--------------|
| `difficulty_conceptual` | Abstract thinking required | TRANSFER × 0.6 + CALIBRATION × 0.4 |
| `difficulty_volume` | Length, persistence needed | TOLERANCE × 0.5 + CONSISTENCY × 0.5 |
| `difficulty_technical` | Numbers, precision required | PRECISION × 0.5 + QNT × 0.5 |
| `difficulty_verbal` | Reading complexity | VRB × 0.6 + RETRIEVAL × 0.4 |
| `difficulty_ambiguity` | Tolerance for uncertainty | TOLERANCE × 0.5 + RECEPTIVITY × 0.5 |
| `difficulty_self_direction` | Independence required | (100 - STRUCTURE) × 0.5 + CALIBRATION × 0.5 |

**Rationale**: A single difficulty score doesn't capture what makes something hard. "The Emperor of All Maladies" is hard because of volume (600+ pages), not because the concepts are abstract. This allows the matching algorithm to recommend activities that challenge the student appropriately on their weak dimensions.

**Implementation**: The composite score and label are auto-generated via PostgreSQL `GENERATED ALWAYS AS` columns:
- `difficulty_composite` = average of 6 dimensions
- `difficulty_label` = FOUNDATION / DEVELOPING / PROFICIENT / ADVANCED / EXPERT

### 3.3 Quiz Translation Layer

**Decision**: Separate the core supercurricular data from quiz-specific interpretations.

**Rationale**: ExamRizz Arena may evolve, and Anthropic may create additional quiz products. By storing disposition boosts, XP rewards, and targeting rules in a separate `quiz_mappings` table, the same supercurricular catalogue can be reused without regenerating content.

**Example**: The same "Do No Harm" book might:
- In ExamRizz Arena: Boost CALIBRATION +4, RECEPTIVITY +3, award 250 XP
- In a future "MedPrep" quiz: Boost different dispositions, award different XP

### 3.4 Three-Tier Course Linking

**Decision**: Link supercurriculars to courses via three methods with different granularity.

| Method | Granularity | Use Case |
|--------|-------------|----------|
| CAH code | Broad | "Do No Harm" applies to ALL CAH01 (Medicine) courses |
| Keyword | Medium | "Nand2Tetris" for courses containing "computer science" |
| Course ID | Narrow | BMAT prep specifically for Oxford/Cambridge medicine |

**Rationale**: Some supercurriculars are universally relevant to a subject area (books), while others are specific to certain universities (admission tests). The three-tier system handles both cases.

### 3.5 Section-Based Progress with AI Interaction

**Decision**: Books and courses with extractable sections get their own progress tracking and AI discussion features.

**Rationale**: Reading a 400-page book is a major undertaking. By breaking it into chapters, students can:
1. Track granular progress
2. Have AI-guided discussions after each chapter
3. Earn incremental XP

**Implementation**: Each section includes:
- `ai_system_prompt`: Instructions for the AI tutor
- `ai_assessment_criteria`: JSON defining completion requirements (e.g., `{"min_exchanges": 3, "must_mention": ["uncertainty", "ethics"]}`)
- `discussion_questions`: Pre-written prompts
- `key_themes` and `key_quotes`: Context for the AI

### 3.6 Staging Table for LLM Validation

**Decision**: All LLM-generated content lands in a staging table first, passes automated validation, then gets promoted to production.

**Rationale**: LLMs hallucinate. They invent ISBNs, make up author credentials, and create URLs that don't exist. The staging pipeline catches these issues before they reach users.

**Validation checks**:
- ISBN format validation (checksum)
- ISBN lookup (OpenLibrary, Google Books)
- URL reachability
- Title/author matching against ISBN records
- Deduplication (exact and fuzzy)
- Credential claim detection (flagging "Nobel Prize" etc.)

---

## 4. Data Model Deep Dive

### 4.1 bo_v1_supercurriculars (Master Catalogue)

The central table containing all supercurricular activities. ~50 columns organised into sections:

**Identity**
- `id` (TEXT PRIMARY KEY): Human-readable identifier, e.g., `book_do_no_harm`
- `version` (INTEGER): For tracking updates without regenerating records

**Classification**
- `type`: BOOK, COURSE, VIDEO, PODCAST, ARTICLE, COMPETITION, ADMISSION_TEST, EPQ_IDEA, VOLUNTEERING, WORK_EXPERIENCE, EVENT, CERTIFICATION, CHALLENGE, SKILL
- `format`: PHYSICAL_BOOK, EBOOK, VIDEO_COURSE, YOUTUBE, PODCAST_AUDIO, IN_PERSON, INTERACTIVE, MIXED

**Content**
- `title`, `subtitle`, `description`
- `author`, `author_credentials`, `publisher`, `publication_year`
- `isbn`, `doi`, `external_url`

**Structure**
- `has_extractable_sections`: Boolean indicating if this has chapters/modules
- `section_count`, `estimated_total_time_mins`

**Clustering**
- `primary_cluster`: MED, SOC, LAW, STEM_PHYS, ENG, COMP, HUM, BUS, STEM_LIFE, LANG, ENV, EDU, CREATIVE
- `secondary_clusters`: Array of additional clusters
- `subject_tags`: Lowercase tags for search
- `course_name_keywords`: Keywords that would appear in relevant course names

**Authority**
- `authority_source`: Specific source, e.g., "Cambridge Law Faculty reading list"
- `authority_type`: UNIVERSITY_READING_LIST, ADMISSIONS_TUTOR, PROFESSIONAL_BODY, AWARD_WINNER, PEER_REVIEWED, INDUSTRY_STANDARD, GOVERNMENT_BODY, ESTABLISHED_MEDIA, COMMUNITY_RECOMMENDED
- `credibility_score`: 1-100

**Difficulty (6 dimensions)**
- `difficulty_conceptual`, `difficulty_volume`, `difficulty_technical`, `difficulty_verbal`, `difficulty_ambiguity`, `difficulty_self_direction`
- `difficulty_composite`: Auto-generated average
- `difficulty_label`: Auto-generated category

**Time & Commitment**
- `time_estimate`: Human-readable, e.g., "8-10 hours"
- `commitment_type`: ONE_OFF, WEEKLY, ONGOING, DEADLINE, FLEXIBLE
- `deadline_month`: For deadline-based items (e.g., "November" for UCAT)
- `is_recurring`: Boolean for annual opportunities

**Access**
- `is_free`, `price_gbp`, `availability_notes`

**Verification**
- `is_verified`, `verification_date`, `verification_notes`
- `generation_confidence`: HIGH, MEDIUM, LOW (LLM self-report)

### 4.2 bo_v1_supercurricular_sections

For books with chapters or courses with modules.

**Key fields**:
- `supercurricular_id`: Foreign key to parent
- `section_order`: Integer for sequencing
- `title`, `description`
- `page_start`, `page_end` or `time_start_mins`, `time_end_mins`
- `ai_interaction_enabled`: Boolean
- `ai_system_prompt`: Instructions for AI tutor
- `ai_assessment_criteria`: JSON completion requirements
- `discussion_questions`: Array of prompts
- `key_themes`, `key_quotes`: Context for AI
- `xp_reward`: Per-section XP (smaller than full completion)

### 4.3 bo_v1_supercurricular_course_links

Connects supercurriculars to courses via three methods.

**Linking methods** (exactly one populated per row):
- `cah_code`: Matches ALL courses with this CAH code
- `course_keyword`: Matches courses where name contains keyword
- `course_id`: Matches specific course ID

**Match strength**:
- `relevance_score`: 1-100 (90-100 = essential, 70-89 = highly recommended, etc.)
- `is_primary`: Boolean for featured/highlighted links

**Context**:
- `relevance_reason`: Why this link exists

### 4.4 bo_v1_supercurricular_quiz_mappings

Per-quiz interpretation of supercurriculars.

**Key fields**:
- `quiz_system`: Identifier, e.g., "examrizz_arena"
- `disposition_boosts`: JSONB, e.g., `{"CALIBRATION": 4, "RECEPTIVITY": 3}`
- `disposition_requirements`: JSONB minimum requirements, e.g., `{"TOLERANCE": 30}`
- `xp_reward_override`: Override base XP
- `badge_id`, `achievement_id`: Gamification rewards
- `display_priority`: Integer for ordering (lower = higher priority)
- `featured_in_quiz`: Boolean
- `custom_description`: Quiz-specific description
- `targeting_rules`: JSONB for recommendation logic

**Example targeting rules**:
```json
{
  "boost_if_nemesis": ["CALIBRATION", "RECEPTIVITY"],
  "recommend_if_cluster": ["MED"],
  "min_level": 5,
  "boost_if_dominant": ["TRANSFER", "DEPTH"],
  "recommend_for_year_groups": ["Y12", "Y13"]
}
```

### 4.5 bo_v1_supercurricular_progress

User completion tracking at the supercurricular level.

**Key fields**:
- `profile_id`: UUID (no FK constraint because profile tables vary by quiz)
- `supercurricular_id`: Foreign key
- `status`: NOT_STARTED, IN_PROGRESS, COMPLETED, ABANDONED, BOOKMARKED
- `started_at`, `completed_at`, `last_accessed_at`
- `progress_percentage`: 0-100
- `sections_completed`, `total_sections`
- `total_xp_earned`
- `notes`: User's personal notes (encrypted at rest)

### 4.6 bo_v1_section_progress

Granular per-section tracking.

**Key fields**:
- `supercurricular_progress_id`: Parent progress record
- `section_id`: Which section
- `status`: NOT_STARTED, IN_PROGRESS, COMPLETED
- `ai_discussion_summary`: AI-generated summary of discussion
- `xp_earned`

---

## 5. Content Generation Pipeline

### 5.1 Overview

The pipeline follows this flow:

```
LLM Generation → Import to Staging → Automated Validation → Manual Review → Promotion to Production
```

### 5.2 LLM Generation Prompt

A detailed prompt template (`SUPERCURRICULAR_GENERATION_PROMPT.md`) instructs LLMs to generate JSON arrays of supercurriculars. Key features:

**Critical rules**:
1. Only include items the LLM is CERTAIN exist
2. ISBNs must be real and verifiable
3. URLs must be real and current
4. Don't invent credentials
5. Be conservative with credibility scores
6. Mark uncertainty explicitly via `generation_confidence` and `llm_notes`

**Output format**: JSON array with strict schema matching the staging table columns.

**Type-specific guidelines**:
- Books: Must have real ISBN-13, verify against mental model of library catalogue
- Courses: Only include well-known MOOCs that still exist
- Admission tests: Use official test body websites for URLs
- Competitions: Only established, recurring competitions

### 5.3 Import Script (import-llm-output.js)

Loads JSON output from LLMs into the staging table.

**Usage**:
```bash
node import-llm-output.js --file=./claude-output.json --source=claude-3.5 --batch=batch_2024-12-30_med_01
```

**Key operations**:
1. Creates/updates batch record in `bo_v1_validation_batches`
2. Normalises ISBN (removes hyphens/spaces)
3. Maps LLM output fields to staging table columns
4. Sets initial `validation_status: 'PENDING'`

### 5.4 Validation Script (validate-supercurriculars.js)

Validates all pending entries in a batch.

**Validation checks**:

| Check | Flags | Penalty |
|-------|-------|---------|
| ISBN format (checksum) | INVALID_ISBN_FORMAT | -25 |
| ISBN lookup (OpenLibrary/Google) | ISBN_NOT_FOUND | -30 |
| ISBN title match | ISBN_TITLE_MISMATCH | -35 (auto-reject) |
| ISBN author match | ISBN_AUTHOR_MISMATCH | -20 |
| URL reachability | URL_NOT_REACHABLE | -15 |
| URL trusted domain | URL_DOMAIN_SUSPICIOUS | -10 |
| Required fields | MISSING_REQUIRED_FIELD | -20 |
| Future publication year | YEAR_FUTURE | -25 (auto-reject) |
| Difficulty range | DIFFICULTY_RANGE_INVALID | -15 |
| High credibility without source | HIGH_CREDIBILITY_NO_SOURCE | -10 |
| Suspicious credentials | UNVERIFIED_CREDENTIAL_CLAIM | -15 |
| Exact duplicate (staging) | EXACT_DUPLICATE_STAGING | -100 (auto-reject) |
| Exact duplicate (production) | EXACT_DUPLICATE_PRODUCTION | -100 (auto-reject) |
| Fuzzy duplicate | FUZZY_DUPLICATE_* | -50 |

**Score thresholds**:
- ≥85: Auto-promote
- 70-84: Manual review required
- ≤40: Auto-reject

**Usage**:
```bash
node validate-supercurriculars.js --batch=batch_2024-12-30_med_01
node validate-supercurriculars.js --promote=batch_2024-12-30_med_01
node validate-supercurriculars.js --stats
```

### 5.5 Promotion to Production

The `promote_to_production` PostgreSQL function:
1. Copies validated entry from staging to production table
2. Sets `is_active: TRUE`
3. Marks staging record as promoted
4. Returns new production ID

---

## 6. Course Linking System

### 6.1 How Links Work

When a student completes the assessment, they receive course recommendations (e.g., "Medicine at Cambridge", "Biomedical Science at Imperial"). The supercurricular matching algorithm:

1. Extracts CAH codes from top matched courses
2. Queries `bo_v1_supercurricular_course_links` for matching CAH codes
3. Queries for keyword matches against course names
4. Ranks candidates by relevance score and other factors

### 6.2 Link Examples (MED Cluster)

```sql
-- Universal links for all Medicine courses
('book_do_no_harm', 'CAH01', 90, TRUE, 'Essential reading for all medicine applicants')
('test_ucat', 'CAH01', 95, TRUE, 'Required admission test for most UK medical schools')

-- Keyword links for specialisation
('book_emperor_maladies', NULL, NULL, 'oncology', 85, FALSE, 'Outstanding for those interested in cancer research')

-- Allied health overlap
('book_being_mortal', 'CAH02', 70, FALSE, 'Relevant for nursing and palliative care courses')
```

### 6.3 Relevance Score Guidelines

| Score | Meaning | Example |
|-------|---------|---------|
| 90-100 | Essential/core | UCAT for Medicine |
| 70-89 | Highly recommended | Do No Harm for Medicine |
| 50-69 | Good to have | Biology Olympiad for Medicine |
| 30-49 | Tangentially relevant | General science podcasts |
| 1-29 | Minor relevance | Broad interest only |

---

## 7. Quiz Translation Layer

### 7.1 Purpose

The quiz mappings table allows the same supercurricular to have different interpretations across quiz products. This future-proofs the content investment.

### 7.2 ExamRizz Arena Mappings

Each mapping specifies:

**Disposition boosts**: Which dispositions this activity develops
```json
{"CALIBRATION": 4, "RECEPTIVITY": 3, "TOLERANCE": 2}
```

**Disposition requirements**: Minimum scores needed to benefit
```json
{"TOLERANCE": 30}  // Need some persistence for a full book
```

**XP reward**: Points awarded for completion

**Targeting rules**: Logic for when to recommend
```json
{
  "boost_if_nemesis": ["CALIBRATION", "RECEPTIVITY"],
  "recommend_if_cluster": ["MED"],
  "min_level": 5
}
```

### 7.3 Matching Algorithm (Proposed)

```typescript
function matchSupercurriculars(studentProfile, topCourses) {
  // 1. Extract CAH codes from top matched courses
  const cahCodes = extractCAHCodes(topCourses);
  
  // 2. Query supercurriculars linked to these courses
  const candidates = queryByLinks(cahCodes);
  
  // 3. Apply quiz-specific mappings
  const withMappings = applyQuizMappings(candidates, 'examrizz_arena');
  
  // 4. Score each candidate
  for (const item of withMappings) {
    let score = 0;
    
    // Cluster relevance (40%)
    score += clusterMatch(item, topCourses) * 0.4;
    
    // Disposition boost relevance (30%)
    // Boost items that help student's nemesis
    score += nemesisBoost(item, studentProfile) * 0.3;
    
    // Difficulty match (15%)
    score += difficultyMatch(item, studentProfile) * 0.15;
    
    // Timing/priority (15%)
    score += timingScore(item, studentProfile.yearGroup) * 0.15;
    
    item.matchScore = score;
  }
  
  // 5. Return ranked, deduplicated list
  return rankAndDeduplicate(withMappings);
}
```

---

## 8. Implementation Status

### 8.1 Completed

| Component | Status | Notes |
|-----------|--------|-------|
| Database schema | ✅ Complete | 6 tables, 20 indexes, 3 triggers, 6 RLS policies |
| Validation schema | ✅ Complete | Staging table, flags, deduplication, promotion function |
| LLM generation prompt | ✅ Complete | Detailed template with anti-hallucination rules |
| Import script | ✅ Complete | JS script for loading LLM output |
| Validation script | ✅ Complete | ISBN/URL verification, deduplication |

### 8.2 Seed Data Status

| Cluster | Supercurriculars | Sections | Course Links | Quiz Mappings |
|---------|------------------|----------|--------------|---------------|
| MED | ✅ 15 items | ✅ 27 chapters | ✅ ~45 links | ✅ 15 mappings |
| SOC | ✅ 15 items | ❌ | ✅ | ✅ |
| LAW | ✅ 12 items | ❌ | ✅ | ✅ |
| STEM_PHYS | ✅ 15 items | ❌ | ✅ | ✅ |
| ENG | ✅ 12 items | ❌ | ✅ | ✅ |
| COMP | ✅ 12 items | ❌ | ✅ | ✅ |
| HUM | ✅ 12 items | ❌ | ✅ | ✅ |
| BUS | ✅ 12 items | ❌ | ✅ | ✅ |
| STEM_LIFE | ✅ 12 items | ❌ | ✅ | ✅ |
| LANG | ✅ 12 items | ❌ | ✅ | ✅ |

**Total: ~132 supercurriculars across 10 clusters**

### 8.3 Not Yet Executed

The SQL seed files have been generated but NOT yet run in Supabase. Execution order:

```sql
-- 1. Schema
supercurricular_schema_v2.sql
validation_schema.sql  -- Optional, for LLM pipeline

-- 2. Supercurriculars (in order)
001_med_supercurriculars.sql
010_soc_supercurriculars.sql
-- ... etc.

-- 3. Sections (MED only for now)
002_med_sections.sql

-- 4. Course links
003_med_course_links.sql
011_soc_course_links.sql
-- ... etc.

-- 5. Quiz mappings
004_med_quiz_mappings.sql
014_soc_quiz_mappings.sql
-- ... etc.
```

### 8.4 Remaining Work

**Required for MVP**:
1. Execute all SQL seeds in Supabase
2. Build API endpoints:
   - `GET /api/supercurriculars` — List with filtering
   - `GET /api/supercurriculars/:id` — Single item with sections
   - `GET /api/supercurriculars/recommended` — Personalised feed
   - `POST /api/progress` — Track completion
3. Build supercurricular UI in Next.js
4. Test full assessment → supercurricular flow

**Optional/Low Priority**:
- ENV, EDU, CREATIVE clusters
- Book sections for non-MED clusters
- Admin interface for adding/editing
- User-generated content (book notes, reviews)

---

## 9. Scaling & Future Content

### 9.1 Adding New Supercurriculars

**Manual process**:
1. Create SQL INSERT statements following existing patterns
2. Include all required fields (id, type, title, primary_cluster, difficulties)
3. Add course links
4. Add quiz mappings

**LLM-assisted process**:
1. Use the generation prompt template
2. Run LLM output through import script
3. Execute validation
4. Promote passing entries

### 9.2 Adding New Clusters

1. Assign number range (e.g., 100-109 for ENV)
2. Generate supercurriculars using prompt template
3. Create course links using appropriate CAH codes
4. Create quiz mappings with disposition boosts

### 9.3 Adding Sections for Books

For each book that should have chapter-level tracking:

1. Create sections file (e.g., `012_soc_sections.sql`)
2. Include for each section:
   - Title, description
   - Page or time ranges
   - AI prompts if enabling AI discussion
   - Discussion questions
   - Key themes and quotes
3. Run the sections file after the main supercurriculars

### 9.4 Multi-LLM Diversity

The pipeline supports using multiple LLMs for content generation:
1. Run same prompt on Claude, GPT-4, Gemini
2. Import each with different `source_llm` tags
3. Validation deduplicates across sources
4. Keep highest-scoring entry for duplicates

---

## 10. Open Questions & Gaps

### 10.1 Unresolved Design Questions

**Q1: How should XP scale across activity types?**

Current state: XP values are manually assigned (50-400 range). No systematic framework for determining appropriate XP for different activity types and difficulties.

Suggestion: Create XP formula based on `estimated_total_time_mins` and `difficulty_composite`.

**Q2: How do disposition requirements interact with recommendations?**

Current state: `disposition_requirements` in quiz mappings (e.g., `{"TOLERANCE": 30}`) but no clear algorithm for how these gate recommendations.

Options:
- Hard gate: Don't recommend if student doesn't meet requirements
- Soft warning: Recommend with "This may be challenging for you" message
- Prerequisite system: Recommend easier activities first

**Q3: What's the section completion criteria for AI discussions?**

Current state: `ai_assessment_criteria` field exists with example JSON, but no implementation of AI assessment logic.

Needs: Define how AI evaluates discussion quality, handles edge cases, prevents gaming.

### 10.2 Missing Components

**M1: No sections for non-MED books**

Only MED cluster has chapter-level sections (27 chapters across 4 books). Other clusters' books don't have sections, limiting AI discussion functionality.

**M2: No admin interface**

Currently, adding/editing supercurriculars requires SQL access. A Supabase-backed admin UI would enable non-technical content management.

**M3: No recommendation engine tuning**

The matching algorithm is proposed but not implemented. Once live, will need A/B testing and tuning based on completion data.

### 10.3 Potential Issues

**P1: ISBN verification API reliability**

OpenLibrary and Google Books APIs are free but have rate limits and don't cover all books. Some valid books may fail verification.

Mitigation: Manual review queue for ISBN_NOT_FOUND flags.

**P2: URL rot**

External URLs (course links, resources) will break over time.

Suggestion: Periodic re-validation job, or remove URL requirement for promotion.

**P3: Difficulty score subjectivity**

The 6-dimension difficulty scores are assigned by LLMs or manually. No calibration against real student feedback.

Suggestion: Add difficulty feedback mechanism, adjust scores based on completion rates.

### 10.4 Future Enhancements

1. **Recommendation personalisation**: Use completion history to improve recommendations
2. **Social features**: See what others in your cluster are doing, study groups
3. **Calendar integration**: Deadline reminders for competitions, admission tests
4. **Progress sharing**: Export supercurricular portfolio for university applications
5. **Mobile app**: Push notifications for daily engagement

---

## Appendix A: Disposition Reference

### Cognitive Dispositions (6)

| Code | Name | Description |
|------|------|-------------|
| CALIBRATION | Self-Monitoring | Knowing what you know and don't know |
| TOLERANCE | Productive Struggle | Persistence through difficulty |
| TRANSFER | Pattern Recognition | Applying concepts across domains |
| PRECISION | Error Sensitivity | Attention to detail and exactness |
| RETRIEVAL | Active Recall | Testing yourself rather than re-reading |
| RECEPTIVITY | Feedback Comfort | Openness to criticism and correction |

### Behavioural Dispositions (4)

| Code | Name | Description |
|------|------|-------------|
| STRUCTURE | Scaffolding Need | Preference for guided vs exploratory learning |
| CONSISTENCY | Work Pattern | Steady daily work vs burst patterns |
| SOCIAL | Collaboration | Group work vs solo preference |
| DEPTH | Mastery Orientation | Surface understanding vs deep mastery |

---

## Appendix B: Cluster Reference

| Code | Name | CAH Codes | Example Subjects |
|------|------|-----------|------------------|
| MED | Medicine & Healthcare | CAH01, CAH02, CAH05 | Medicine, Nursing, Veterinary |
| SOC | Social Sciences | CAH04, CAH15, CAH20 | Psychology, PPE, Economics |
| LAW | Law | CAH16 | Law, Legal Studies |
| STEM_PHYS | Physical Sciences | CAH07, CAH09 | Physics, Chemistry, Maths |
| ENG | Engineering | CAH10 | All engineering disciplines |
| COMP | Computing | CAH11 | Computer Science, Software Engineering |
| HUM | Humanities | CAH14, CAH19, CAH20 | English, Classics, History |
| BUS | Business | CAH17 | Business, Management |
| STEM_LIFE | Life Sciences | CAH03 | Biology, Biomedical Science |
| LANG | Languages | CAH19 | Modern Languages, Linguistics |
| ENV | Environment | CAH12, CAH13 | Geography, Architecture |
| EDU | Education | CAH22 | Teaching, Education Studies |
| CREATIVE | Creative Arts | CAH21 | Art, Design, Drama, Music |

---

## Appendix C: Supercurricular Type Reference

| Type | Format | Example |
|------|--------|---------|
| BOOK | PHYSICAL_BOOK, EBOOK | Do No Harm |
| COURSE | VIDEO_COURSE, IN_PERSON | CS50, Brighton Medicine Prep |
| VIDEO | YOUTUBE | Crash Course Anatomy |
| PODCAST | PODCAST_AUDIO | Inside Health |
| ARTICLE | - | Academic papers |
| COMPETITION | - | Biology Olympiad |
| ADMISSION_TEST | - | UCAT, BMAT, LNAT |
| EPQ_IDEA | - | Project suggestions |
| VOLUNTEERING | IN_PERSON | St John Ambulance |
| WORK_EXPERIENCE | IN_PERSON | NHS shadowing |
| EVENT | IN_PERSON | University open days |
| CERTIFICATION | INTERACTIVE | First aid certificate |
| CHALLENGE | - | Advent of Code |
| SKILL | - | CAD proficiency |

---

**Document Version:** 1.0  
**Last Updated:** 30 December 2024  
**Author:** Generated from project context and implementation files
