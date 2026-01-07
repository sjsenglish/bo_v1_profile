# ExamRizz Arena — Data Dictionary

Comprehensive documentation of all database tables, columns, relationships, and data types.

**Last Updated:** 1 January 2025  
**Database:** Supabase (PostgreSQL)  
**Table Prefix:** `bo_v1_`

---

## Table Overview

| Table | Purpose | Rows | Status |
|-------|---------|------|--------|
| `bo_v1_sessions` | Assessment state tracking | Dynamic | ✅ Active |
| `bo_v1_profiles` | Computed student characteristics | Dynamic | ✅ Active |
| `bo_v1_courses` | HESA university course data | 28,520 | ✅ Populated |
| `bo_v1_questions` | Diagnostic questions | 40 | ✅ Populated |
| `bo_v1_vibe_cards` | Vibe swiper cards | 12 | ✅ Populated |
| `bo_v1_familiars` | Spirit animal definitions | 14 | ✅ Populated |
| `bo_v1_guilds` | Guild definitions | 4 | ✅ Populated |
| `bo_v1_vibe_swipes` | Individual swipe records | Dynamic | ✅ Active |
| `bo_v1_diagnostic_responses` | Question responses | Dynamic | ✅ Active |
| `bo_v1_benchmark_responses` | Capacity item responses | Dynamic | ✅ Active |
| `bo_v1_matches` | Cached match results | Dynamic | ✅ Active |
| `bo_v1_supercurriculars` | Supercurricular activities | 178 | ✅ Populated |
| `bo_v1_supercurricular_course_links` | Course↔supercurricular links | TBD | ⚠️ Schema exists |
| `bo_v1_supercurricular_quiz_mappings` | Quiz integration | TBD | ⚠️ Schema exists |
| `bo_v1_quests` | Task definitions | 0 | ❌ Not used |
| `bo_v1_feed_items` | Social feed items | 0 | ❌ Not used |

---

## Core Tables

### bo_v1_sessions

Tracks assessment progress for each anonymous user session.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | UUID | NO | `gen_random_uuid()` | Primary key |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Session start time |
| `completed_at` | TIMESTAMPTZ | YES | NULL | When assessment finished |
| `vibe_completed` | BOOLEAN | YES | FALSE | Vibe section done |
| `vibe_skipped` | BOOLEAN | YES | FALSE | Vibe section skipped |
| `cognitive_completed` | BOOLEAN | YES | FALSE | Cognitive questions done |
| `behavioral_completed` | BOOLEAN | YES | FALSE | Behavioural questions done |
| `behavioral_skipped` | BOOLEAN | YES | FALSE | Behavioural section skipped |
| `questions_answered` | INTEGER | YES | 0 | Total questions answered |
| `questions_skipped` | INTEGER | YES | 0 | Total questions skipped |
| `benchmarks_completed` | INTEGER | YES | 0 | Capacity benchmarks completed |

**Indexes:** Primary key on `id`  
**RLS:** Anonymous insert, select, update enabled

---

### bo_v1_profiles

Computed characteristics for each student. One profile per session.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | UUID | NO | `gen_random_uuid()` | Primary key |
| `session_id` | UUID | YES | — | FK to sessions (UNIQUE) |
| **Vibe Output** |
| `vibe_tags` | TEXT[] | YES | `'{}'` | Accumulated tags from swipes |
| `subject_weights` | JSONB | YES | `'{}'` | Subject preference weights |
| `environment_weights` | JSONB | YES | `'{}'` | Environment preference weights |
| **Cognitive Dispositions** |
| `calibration` | INTEGER | YES | 50 | Score 0-100 |
| `calibration_sigma` | INTEGER | YES | 20 | Uncertainty |
| `tolerance` | INTEGER | YES | 50 | Score 0-100 |
| `tolerance_sigma` | INTEGER | YES | 20 | Uncertainty |
| `transfer` | INTEGER | YES | 50 | Score 0-100 |
| `transfer_sigma` | INTEGER | YES | 20 | Uncertainty |
| `precision` | INTEGER | YES | 50 | Score 0-100 |
| `precision_sigma` | INTEGER | YES | 20 | Uncertainty |
| `retrieval` | INTEGER | YES | 50 | Score 0-100 |
| `retrieval_sigma` | INTEGER | YES | 20 | Uncertainty |
| `receptivity` | INTEGER | YES | 50 | Score 0-100 |
| `receptivity_sigma` | INTEGER | YES | 20 | Uncertainty |
| **Behavioural Dispositions** |
| `structure` | INTEGER | YES | 50 | Score 0-100 |
| `structure_sigma` | INTEGER | YES | 20 | Uncertainty |
| `consistency` | INTEGER | YES | 50 | Score 0-100 |
| `consistency_sigma` | INTEGER | YES | 20 | Uncertainty |
| `social` | INTEGER | YES | 50 | Score 0-100 |
| `social_sigma` | INTEGER | YES | 20 | Uncertainty |
| `depth` | INTEGER | YES | 50 | Score 0-100 |
| `depth_sigma` | INTEGER | YES | 20 | Uncertainty |
| **Capacities** |
| `vrb_value` | INTEGER | YES | 50 | Verbal reasoning score |
| `vrb_sigma` | INTEGER | YES | 20 | Uncertainty |
| `vrb_provenance` | TEXT | YES | 'PRIOR' | MEASURED/PROXIED/PRIOR |
| `qnt_value` | INTEGER | YES | 50 | Quantitative reasoning score |
| `qnt_sigma` | INTEGER | YES | 20 | Uncertainty |
| `qnt_provenance` | TEXT | YES | 'PRIOR' | MEASURED/PROXIED/PRIOR |
| `spd_value` | INTEGER | YES | 50 | Processing speed score |
| `spd_sigma` | INTEGER | YES | 20 | Uncertainty |
| `spd_provenance` | TEXT | YES | 'PRIOR' | MEASURED/PROXIED/PRIOR |
| **Identity** |
| `familiar_id` | TEXT | YES | NULL | Assigned familiar (FK informal) |
| `familiar_stage` | INTEGER | YES | 1 | Evolution stage |
| `guild_id` | TEXT | YES | NULL | Assigned guild |
| `dominant` | TEXT | YES | NULL | Highest disposition |
| `nemesis` | TEXT | YES | NULL | Lowest disposition |
| **Progression** |
| `level` | INTEGER | YES | 1 | User level |
| `total_xp` | INTEGER | YES | 0 | Accumulated XP |
| `current_streak` | INTEGER | YES | 0 | Current daily streak |
| `longest_streak` | INTEGER | YES | 0 | Best streak achieved |
| `last_active_date` | DATE | YES | NULL | Last activity date |
| **Grading** |
| `grade_letter` | TEXT | YES | 'F' | Overall profile grade |
| `grade_percentage` | INTEGER | YES | 0 | Grade as percentage |
| `precision_score` | INTEGER | YES | 0 | Grade component |
| `completeness_score` | INTEGER | YES | 0 | Grade component |
| `uniqueness_score` | INTEGER | YES | 0 | Grade component |
| **Other** |
| `badges` | TEXT[] | YES | `'{}'` | Earned badge IDs |
| `target_courses` | TEXT[] | YES | `'{}'` | Saved course IDs |
| `theme` | TEXT | YES | 'default' | UI theme preference |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Profile creation |
| `updated_at` | TIMESTAMPTZ | YES | `NOW()` | Last update |

**Indexes:** Primary key on `id`, unique on `session_id`  
**Constraints:** FK to `bo_v1_sessions(id)` ON DELETE CASCADE

---

### bo_v1_courses

HESA Discover Uni dataset with disposition demands.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | TEXT | NO | — | Primary key (composite) |
| **HESA Identifiers** |
| `ukprn` | TEXT | YES | — | 8-digit provider ID |
| `kis_course_id` | TEXT | YES | — | Course ID within provider |
| `course_url` | TEXT | YES | — | HESA course page URL |
| `university_ukprn` | TEXT | YES | — | University identifier |
| **Basic Info** |
| `university` | TEXT | NO | — | University name |
| `course_name` | TEXT | NO | — | Full course title |
| `ucas_code` | TEXT | YES | — | UCAS course code |
| `degree_type` | TEXT | YES | — | BA, BSc, BEng, etc. |
| `duration_years` | INTEGER | YES | — | Standard duration |
| `study_mode` | TEXT | YES | — | Full-time/Part-time |
| `sandwich_year` | BOOLEAN | YES | FALSE | Has placement year |
| `year_abroad` | BOOLEAN | YES | FALSE | Has year abroad |
| **Classification** |
| `region` | TEXT | YES | — | UK region |
| `russell_group` | BOOLEAN | YES | FALSE | Russell Group member |
| `subject_area` | TEXT | YES | — | Broad subject |
| `cah_code` | TEXT | YES | — | CAH classification code |
| `course_type` | TEXT | YES | — | Course type category |
| `subject_tags` | TEXT[] | YES | `'{}'` | Subject keywords |
| `accredited` | BOOLEAN | YES | FALSE | Professional accreditation |
| **Entry Requirements** |
| `typical_offer` | TEXT | YES | — | Grade requirements text |
| `ucas_points` | INTEGER | YES | — | UCAS tariff points |
| **HESA Outcome Data** |
| `nss_overall` | INTEGER | YES | — | NSS overall satisfaction % |
| `nss_teaching` | INTEGER | YES | — | NSS teaching quality % |
| `nss_feedback` | INTEGER | YES | — | NSS assessment feedback % |
| `employment_rate` | INTEGER | YES | — | Graduate employment % |
| `continuation_rate` | INTEGER | YES | — | Year 2 continuation % |
| `median_salary_3yr` | INTEGER | YES | — | Median salary 3 years post |
| `median_salary_5yr` | INTEGER | YES | — | Median salary 5 years post |
| **Teaching Structure** |
| `assessment_exam_pct` | INTEGER | YES | — | % assessed by exam |
| `assessment_coursework_pct` | INTEGER | YES | — | % assessed by coursework |
| `assessment_practical_pct` | INTEGER | YES | — | % assessed by practical |
| `scheduled_hours` | INTEGER | YES | — | Weekly contact hours |
| **Disposition Demands (0-100)** |
| `demand_calibration` | INTEGER | NO | — | Required calibration |
| `demand_tolerance` | INTEGER | NO | — | Required tolerance |
| `demand_transfer` | INTEGER | NO | — | Required transfer |
| `demand_precision` | INTEGER | NO | — | Required precision |
| `demand_retrieval` | INTEGER | NO | — | Required retrieval |
| `demand_receptivity` | INTEGER | NO | — | Required receptivity |
| `demand_structure` | INTEGER | YES | 50 | Required structure |
| `demand_consistency` | INTEGER | YES | 50 | Required consistency |
| `demand_social` | INTEGER | YES | 50 | Required social |
| `demand_depth` | INTEGER | YES | 50 | Required depth |
| **Importance Levels** |
| `importance_calibration` | TEXT | YES | 'IMPORTANT' | CRITICAL/IMPORTANT/NICE_TO_HAVE |
| `importance_tolerance` | TEXT | YES | 'IMPORTANT' | CRITICAL/IMPORTANT/NICE_TO_HAVE |
| `importance_transfer` | TEXT | YES | 'IMPORTANT' | CRITICAL/IMPORTANT/NICE_TO_HAVE |
| `importance_precision` | TEXT | YES | 'IMPORTANT' | CRITICAL/IMPORTANT/NICE_TO_HAVE |
| `importance_retrieval` | TEXT | YES | 'IMPORTANT' | CRITICAL/IMPORTANT/NICE_TO_HAVE |
| `importance_receptivity` | TEXT | YES | 'IMPORTANT' | CRITICAL/IMPORTANT/NICE_TO_HAVE |
| **Metadata** |
| `derivation_confidence` | NUMERIC | YES | — | Confidence in demands |
| `data_completeness` | NUMERIC | YES | — | % of fields populated |
| `academic_year` | TEXT | YES | — | Data year |
| `is_active` | BOOLEAN | YES | TRUE | Available for matching |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Import timestamp |

**Indexes:** 
- Primary key on `id`
- `idx_courses_cah` on `cah_code`
- `idx_courses_subject` GIN on `subject_tags`
- `idx_courses_russell` on `russell_group`

---

### bo_v1_questions

Diagnostic questions pool.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | TEXT | NO | — | Primary key (e.g., CAL_01) |
| `dimension` | TEXT | NO | — | Target disposition |
| `tier` | TEXT | NO | — | CORE/EXTENDED/DEEP/EXPERT |
| `text` | TEXT | NO | — | Question text |
| `reverse_scored` | BOOLEAN | YES | FALSE | Invert response |
| `weight` | NUMERIC(3,2) | YES | 1.0 | Importance weight |
| `active` | BOOLEAN | YES | TRUE | Available for use |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Creation time |

**Constraints:** `tier` must be one of CORE, EXTENDED, DEEP, EXPERT

**Current Content:**
- 24 cognitive questions (4 per dimension × 6 dimensions)
- 16 behavioural questions (4 per dimension × 4 dimensions)
- All CORE tier

---

### bo_v1_vibe_cards

Vibe swiper card definitions.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | TEXT | NO | — | Primary key (e.g., VIBE_01) |
| `image_url` | TEXT | NO | — | Card image path |
| `alt_text` | TEXT | NO | — | Accessibility text |
| `right_tags` | TEXT[] | NO | — | Tags on right swipe |
| `left_tags` | TEXT[] | NO | — | Tags on left swipe |
| `disposition_nudge` | JSONB | YES | NULL | Optional disposition effect |
| `sort_order` | INTEGER | YES | — | Display order |
| `active` | BOOLEAN | YES | TRUE | Available for use |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Creation time |

**disposition_nudge format:**
```json
{
  "dimension": "SOCIAL",
  "right_delta": 4,
  "left_delta": -3
}
```

---

### bo_v1_familiars

Spirit animal definitions.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | TEXT | NO | — | Primary key (e.g., OWL) |
| `name` | TEXT | NO | — | Display name |
| `element` | TEXT | NO | — | Fire/Water/Earth/Air/Shadow/Light |
| `tagline` | TEXT | NO | — | Short description |
| `rarity` | TEXT | NO | — | COMMON or RARE |
| `rarity_pct` | NUMERIC(4,2) | YES | — | Assignment probability |
| `bias_dimensions` | TEXT[] | YES | `'{}'` | Dispositions this familiar emphasises |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Creation time |

**Current Content:** 10 common + 4 rare = 14 total

---

### bo_v1_guilds

Guild definitions.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | TEXT | NO | — | Primary key (e.g., FORGE) |
| `name` | TEXT | NO | — | Display name |
| `motto` | TEXT | NO | — | Guild motto |
| `formula` | JSONB | NO | — | Weighted scoring formula |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Creation time |

**formula format:**
```json
{
  "PRECISION": 0.35,
  "RETRIEVAL": 0.35,
  "CALIBRATION": 0.30
}
```

**Current Content:** 4 guilds (FORGE, FLOW, FORCE, FOUNDATION)

---

## Response Tables

### bo_v1_vibe_swipes

Records individual swipe actions.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | UUID | NO | `gen_random_uuid()` | Primary key |
| `session_id` | UUID | YES | — | FK to sessions |
| `card_id` | TEXT | NO | — | Swiped card ID |
| `direction` | TEXT | NO | — | LEFT/RIGHT/SKIP |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Swipe time |

**Constraints:** `direction` must be LEFT, RIGHT, or SKIP

---

### bo_v1_diagnostic_responses

Records question responses.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | UUID | NO | `gen_random_uuid()` | Primary key |
| `session_id` | UUID | YES | — | FK to sessions |
| `question_id` | TEXT | NO | — | Answered question |
| `value` | INTEGER | YES | — | Response 1-5 |
| `skipped` | BOOLEAN | YES | FALSE | Was skipped |
| `response_time_ms` | INTEGER | YES | — | Time to respond |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Response time |

**Constraints:** `value` must be between 1 and 5

---

### bo_v1_benchmark_responses

Records capacity item responses.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | UUID | NO | `gen_random_uuid()` | Primary key |
| `session_id` | UUID | YES | — | FK to sessions |
| `capacity_id` | TEXT | NO | — | VRB/QNT/SPD |
| `item_id` | TEXT | NO | — | Specific item |
| `response` | TEXT | NO | — | User's answer |
| `is_correct` | BOOLEAN | NO | — | Correctness |
| `response_time_ms` | INTEGER | YES | — | Time to respond |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Response time |

**Constraints:** `capacity_id` must be VRB, QNT, or SPD

---

### bo_v1_matches

Cached course match results.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | UUID | NO | `gen_random_uuid()` | Primary key |
| `session_id` | UUID | YES | — | FK to sessions |
| `course_id` | TEXT | YES | — | FK to courses |
| `score` | INTEGER | NO | — | Match score 0-100 |
| `fit_score` | INTEGER | NO | — | Fit component |
| `friction` | TEXT | NO | — | LOW/MODERATE/HIGH/VERY_HIGH/EXTREME |
| `explanation` | JSONB | YES | — | Score breakdown |
| `rank` | INTEGER | NO | — | Position in results |
| `created_at` | TIMESTAMPTZ | YES | `NOW()` | Calculation time |

**Constraints:** Unique on `(session_id, course_id)`

---

## Content Tables

### bo_v1_supercurriculars

Supercurricular activity definitions.

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| `id` | TEXT | NO | — | Primary key |
| `type` | TEXT | NO | — | BOOK/PODCAST/COURSE/etc. |
| `format` | TEXT | YES | — | PHYSICAL_BOOK/VIDEO_COURSE/etc. |
| `title` | TEXT | NO | — | Activity title |
| `subtitle` | TEXT | YES | — | Optional subtitle |
| `description` | TEXT | YES | — | Full description |
| **Author/Publisher** |
| `author` | TEXT | YES | — | Creator name |
| `author_credentials` | TEXT | YES | — | Author qualifications |
| `publisher` | TEXT | YES | — | Publisher/platform |
| `publication_year` | INTEGER | YES | — | Year published |
| `isbn` | TEXT | YES | — | ISBN for books |
| `external_url` | TEXT | YES | — | Link to resource |
| **Structure** |
| `has_extractable_sections` | BOOLEAN | YES | — | Can be broken into parts |
| `section_count` | INTEGER | YES | — | Number of sections |
| `estimated_total_time_mins` | INTEGER | YES | — | Total time commitment |
| **Classification** |
| `primary_cluster` | TEXT | NO | — | Main academic cluster |
| `secondary_clusters` | TEXT[] | YES | — | Related clusters |
| `subject_tags` | TEXT[] | YES | — | Keywords |
| `course_name_keywords` | TEXT[] | YES | — | Course matching keywords |
| **Authority** |
| `authority_source` | TEXT | YES | — | Who recommends this |
| `authority_type` | TEXT | YES | — | UNIVERSITY_READING_LIST/etc. |
| `success_signal` | TEXT | YES | — | How this helps applications |
| `credibility_score` | INTEGER | YES | — | 0-100 quality rating |
| **Difficulty (0-100 each)** |
| `difficulty_conceptual` | INTEGER | YES | — | Conceptual complexity |
| `difficulty_volume` | INTEGER | YES | — | Amount of content |
| `difficulty_technical` | INTEGER | YES | — | Technical requirements |
| `difficulty_verbal` | INTEGER | YES | — | Language complexity |
| `difficulty_ambiguity` | INTEGER | YES | — | Tolerance for ambiguity needed |
| `difficulty_self_direction` | INTEGER | YES | — | Self-guidance required |
| **Targeting** |
| `prerequisite_knowledge` | TEXT[] | YES | — | Required background |
| `year_groups` | TEXT[] | YES | — | Suitable year groups |
| `time_estimate` | TEXT | YES | — | Human-readable time |
| `commitment_type` | TEXT | YES | — | ONE_OFF/WEEKLY/ONGOING |
| `deadline_month` | INTEGER | YES | — | If deadline-based |
| `is_recurring` | BOOLEAN | YES | — | Repeats annually |
| **Access** |
| `is_free` | BOOLEAN | YES | — | Free to access |
| `price_gbp` | NUMERIC | YES | — | Cost if not free |
| `availability_notes` | TEXT | YES | — | How to access |
| **Status** |
| `is_active` | BOOLEAN | YES | TRUE | Available for recommendation |
| `is_verified` | BOOLEAN | YES | FALSE | Human-verified |
| `generation_confidence` | TEXT | YES | — | HIGH/MEDIUM/LOW |

**Current Content:** 178 items across 10 clusters

---

## Indexes

```sql
-- Courses
CREATE INDEX idx_courses_cah ON bo_v1_courses(cah_code);
CREATE INDEX idx_courses_subject ON bo_v1_courses USING GIN(subject_tags);
CREATE INDEX idx_courses_russell ON bo_v1_courses(russell_group);

-- Matches
CREATE INDEX idx_matches_session ON bo_v1_matches(session_id, rank);

-- Profiles
CREATE INDEX idx_profiles_session ON bo_v1_profiles(session_id);

-- Supercurriculars
CREATE INDEX idx_supercurriculars_cluster ON bo_v1_supercurriculars(primary_cluster);
CREATE INDEX idx_supercurriculars_type ON bo_v1_supercurriculars(type);
```

---

## Row Level Security

All tables have RLS enabled. Current policies allow anonymous access for the assessment flow:

```sql
-- Sessions, Profiles, Responses: anonymous insert/select/update
-- Content tables: public read-only
```

---

## Data Relationships

```
bo_v1_sessions (1)
    │
    ├──→ bo_v1_profiles (1)
    │
    ├──→ bo_v1_vibe_swipes (many)
    │
    ├──→ bo_v1_diagnostic_responses (many)
    │
    ├──→ bo_v1_benchmark_responses (many)
    │
    └──→ bo_v1_matches (many)
              │
              └──→ bo_v1_courses (1)

bo_v1_supercurriculars (1)
    │
    ├──→ bo_v1_supercurricular_course_links (many)
    │
    └──→ bo_v1_supercurricular_quiz_mappings (many)
```

---

## Common Queries

### Get profile with session
```sql
SELECT p.*, s.*
FROM bo_v1_profiles p
JOIN bo_v1_sessions s ON p.session_id = s.id
WHERE s.id = 'session-uuid';
```

### Get top matches for session
```sql
SELECT m.*, c.university, c.course_name
FROM bo_v1_matches m
JOIN bo_v1_courses c ON m.course_id = c.id
WHERE m.session_id = 'session-uuid'
ORDER BY m.rank
LIMIT 20;
```

### Get supercurriculars by cluster
```sql
SELECT *
FROM bo_v1_supercurriculars
WHERE primary_cluster = 'STEM_PHYS'
  AND is_active = TRUE
ORDER BY credibility_score DESC;
```

### Check question distribution
```sql
SELECT dimension, COUNT(*) as count
FROM bo_v1_questions
WHERE active = TRUE
GROUP BY dimension
ORDER BY dimension;
```
