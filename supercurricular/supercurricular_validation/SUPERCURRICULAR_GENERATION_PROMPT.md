# SUPERCURRICULAR GENERATION PROMPT
## ExamRizz Arena - Multi-LLM Content Pipeline

---

## SYSTEM INSTRUCTIONS

You are generating supercurricular activities for ExamRizz Arena, a UK university course matching platform. Your output will be **automatically validated** against real databases (ISBN lookup, URL checking, deduplication). 

**CRITICAL RULES:**

1. **Only include items you are CERTAIN exist.** If you're unsure whether a book, course, or resource exists, DO NOT include it.

2. **ISBNs must be real.** Every book MUST have a valid ISBN that will pass verification against OpenLibrary and Google Books. If you don't know the exact ISBN, mark `generation_confidence: LOW` and leave ISBN as null.

3. **URLs must be real and current.** Only include URLs you are confident are live. Do not guess or construct URLs.

4. **Do not invent credentials.** If you're not certain someone won a Nobel Prize, Pulitzer, or other major award, DO NOT claim it.

5. **Be conservative with credibility scores.** Only assign >85 if you can cite a specific authoritative source.

6. **Mark uncertainty explicitly.** Use `generation_confidence` and `llm_notes` fields to flag any doubts.

---

## OUTPUT FORMAT

Return a JSON array. Each item must follow this exact schema:

```json
{
  "id": "string - format: {type}_{short_name} e.g., book_thinking_fast_slow",
  "type": "BOOK|COURSE|VIDEO|PODCAST|ARTICLE|COMPETITION|ADMISSION_TEST|EPQ_IDEA|VOLUNTEERING|WORK_EXPERIENCE|EVENT|CERTIFICATION|CHALLENGE|SKILL",
  "format": "PHYSICAL_BOOK|EBOOK|VIDEO_COURSE|YOUTUBE|PODCAST_AUDIO|IN_PERSON|INTERACTIVE|MIXED|null",
  
  "title": "string - exact title as published",
  "subtitle": "string|null - exact subtitle if any",
  "description": "string - 100-300 chars, factual, no marketing fluff",
  
  "author": "string|null - primary author/creator name",
  "author_credentials": "string|null - ONLY verified credentials, be conservative",
  "publisher": "string|null",
  "publication_year": "number|null - must be <= current year",
  
  "isbn": "string|null - ISBN-13 preferred, must be REAL and verifiable",
  "doi": "string|null - for academic papers",
  "external_url": "string|null - only if you're CERTAIN it's valid",
  
  "has_extractable_sections": "boolean - true if book with chapters, course with modules",
  "section_count": "number|null",
  "estimated_total_time_mins": "number|null",
  
  "primary_cluster": "MED|SOC|LAW|STEM_PHYS|ENG|COMP|HUM|BUS|STEM_LIFE|LANG|ENV|EDU|CREATIVE",
  "secondary_clusters": ["array of cluster codes or empty"],
  "subject_tags": ["array of lowercase tags"],
  "course_name_keywords": ["keywords that would appear in relevant university course names"],
  
  "authority_source": "string|null - specific source e.g., 'Cambridge Law Faculty reading list'",
  "authority_type": "UNIVERSITY_READING_LIST|ADMISSIONS_TUTOR|PROFESSIONAL_BODY|AWARD_WINNER|PEER_REVIEWED|INDUSTRY_STANDARD|GOVERNMENT_BODY|ESTABLISHED_MEDIA|COMMUNITY_RECOMMENDED|null",
  "success_signal": "string|null - why this helps applications",
  "credibility_score": "number 1-100 - be CONSERVATIVE, only >85 if strong authority",
  
  "difficulty_conceptual": "number 1-100 - abstract thinking required",
  "difficulty_volume": "number 1-100 - length/time commitment",
  "difficulty_technical": "number 1-100 - numbers/precision required",
  "difficulty_verbal": "number 1-100 - reading complexity",
  "difficulty_ambiguity": "number 1-100 - tolerance for uncertainty",
  "difficulty_self_direction": "number 1-100 - independence required",
  
  "prerequisite_knowledge": ["array of prerequisites or empty"],
  "year_groups": ["Y10", "Y11", "Y12", "Y13"],
  
  "time_estimate": "string e.g., '8-10 hours', '3 weeks, 2 hours/week'",
  "commitment_type": "ONE_OFF|WEEKLY|ONGOING|DEADLINE|FLEXIBLE",
  "deadline_month": "string|null - e.g., 'November' for admission tests",
  "is_recurring": "boolean - true if annual event",
  
  "is_free": "boolean",
  "price_gbp": "number|null",
  "availability_notes": "string|null",
  
  "generation_confidence": "HIGH|MEDIUM|LOW - your certainty this entry is accurate",
  "llm_notes": "string|null - any uncertainties, flags for human review"
}
```

---

## GENERATION GUIDELINES BY TYPE

### BOOKS

**DO:**
- Include widely-known books you're certain about
- Use ISBN-13 format (978-...)
- Check mental model: "Would this ISBN return the correct book from a library catalogue?"

**DON'T:**
- Guess ISBNs - if uncertain, set `isbn: null` and `generation_confidence: LOW`
- Include obscure books unless you're certain of details
- Invent author credentials

**Required fields:** title, author, type, primary_cluster, difficulty_*, year_groups
**Strongly recommended:** isbn, publication_year, publisher, description

### COURSES (Online)

**DO:**
- Include well-known MOOCs (edX, Coursera, FutureLearn)
- Verify the course still exists before including URL
- Note if courses are periodically offered vs always available

**DON'T:**
- Include courses that may have been discontinued
- Guess course URLs - use exact URLs only

**Required fields:** title, type, format, primary_cluster, external_url (if confident)

### ADMISSION TESTS

**DO:**
- Include official UK admission tests (UCAT, BMAT, LNAT, TSA, MAT, STEP, PAT, etc.)
- Use official test body websites for URLs
- Specify which universities require each test

**DON'T:**
- Invent test names or requirements
- Guess test fees or dates without certainty

### COMPETITIONS

**DO:**
- Include established, recurring competitions (Olympiads, essay competitions)
- Specify organising body
- Note typical deadlines

**DON'T:**
- Include one-off or discontinued competitions
- Guess entry requirements

### PODCASTS/VIDEOS

**DO:**
- Include established channels/shows with significant following
- Verify the show is still active

**DON'T:**
- Include channels that may have stopped uploading
- Guess subscriber counts or episode numbers

---

## CLUSTER DEFINITIONS

| Code | Name | CAH Codes | Example Subjects |
|------|------|-----------|------------------|
| MED | Medicine & Healthcare | CAH01, CAH02, CAH05 | Medicine, Nursing, Veterinary |
| SOC | Social Sciences | CAH04, CAH15, CAH20 | Psychology, PPE, Economics, Politics, History, Philosophy |
| LAW | Law | CAH16 | Law, Legal studies |
| STEM_PHYS | Physical Sciences | CAH07, CAH09 | Physics, Chemistry, Mathematics |
| ENG | Engineering | CAH10 | All engineering disciplines |
| COMP | Computing | CAH11 | Computer Science, Software Engineering |
| HUM | Humanities | CAH14, CAH19, CAH20 | English, Classics, Languages, History |
| BUS | Business | CAH17 | Business, Management, Accounting |
| STEM_LIFE | Life Sciences | CAH03 | Biology, Biomedical Science |
| LANG | Languages | CAH19 | Modern Languages, Linguistics |
| ENV | Environment | CAH12, CAH13 | Geography, Architecture, Environmental Science |
| EDU | Education | CAH22 | Teaching, Education Studies |
| CREATIVE | Creative Arts | CAH21 | Art, Design, Drama, Music |

---

## DIFFICULTY DIMENSION GUIDELINES

Score each 1-100:

| Dimension | 1-20 | 40-60 | 80-100 |
|-----------|------|-------|--------|
| **Conceptual** | Concrete, practical | Mixed | Highly abstract, theoretical |
| **Volume** | <2 hours | 5-15 hours | 50+ hours |
| **Technical** | No maths/jargon | Some technical terms | Heavy maths, specialist vocabulary |
| **Verbal** | Simple language | Standard academic | Dense academic prose |
| **Ambiguity** | Clear right answers | Some interpretation | Contested, philosophical |
| **Self-direction** | Step-by-step guided | Some structure | Fully self-directed |

---

## EXAMPLE ENTRY (Correct)

```json
{
  "id": "book_thinking_fast_slow",
  "type": "BOOK",
  "format": "PHYSICAL_BOOK",
  "title": "Thinking, Fast and Slow",
  "subtitle": null,
  "description": "Daniel Kahneman's exploration of cognitive biases and dual-system thinking. Introduces System 1/System 2 framework for understanding human judgement and decision-making errors.",
  "author": "Daniel Kahneman",
  "author_credentials": "Nobel Prize in Economics 2002, Princeton Professor Emeritus",
  "publisher": "Penguin",
  "publication_year": 2011,
  "isbn": "978-0141033570",
  "external_url": null,
  "has_extractable_sections": true,
  "section_count": 5,
  "estimated_total_time_mins": 900,
  "primary_cluster": "SOC",
  "secondary_clusters": ["MED", "BUS"],
  "subject_tags": ["psychology", "economics", "decision-making", "cognitive-bias", "behavioural-economics"],
  "course_name_keywords": ["psychology", "economics", "PPE", "behavioural"],
  "authority_source": "Cambridge Economics reading list, Oxford PPE reading list",
  "authority_type": "UNIVERSITY_READING_LIST",
  "success_signal": "Frequently cited in successful PPE and Economics personal statements",
  "credibility_score": 92,
  "difficulty_conceptual": 70,
  "difficulty_volume": 75,
  "difficulty_technical": 45,
  "difficulty_verbal": 65,
  "difficulty_ambiguity": 55,
  "difficulty_self_direction": 40,
  "prerequisite_knowledge": [],
  "year_groups": ["Y11", "Y12", "Y13"],
  "time_estimate": "15-20 hours",
  "commitment_type": "ONE_OFF",
  "deadline_month": null,
  "is_recurring": false,
  "is_free": false,
  "price_gbp": 10.99,
  "availability_notes": "Widely available, audiobook excellent",
  "generation_confidence": "HIGH",
  "llm_notes": null
}
```

---

## EXAMPLE ENTRY (Uncertain - Correctly Flagged)

```json
{
  "id": "book_some_obscure_title",
  "type": "BOOK",
  "format": "PHYSICAL_BOOK",
  "title": "Some Obscure Medical Ethics Title",
  "subtitle": null,
  "description": "A text on medical ethics that I believe exists but am not certain of exact details.",
  "author": "Dr. Someone",
  "author_credentials": null,
  "publisher": null,
  "publication_year": null,
  "isbn": null,
  "external_url": null,
  "has_extractable_sections": true,
  "section_count": null,
  "estimated_total_time_mins": 480,
  "primary_cluster": "MED",
  "secondary_clusters": [],
  "subject_tags": ["medical-ethics"],
  "course_name_keywords": ["medicine"],
  "authority_source": null,
  "authority_type": null,
  "success_signal": null,
  "credibility_score": 50,
  "difficulty_conceptual": 60,
  "difficulty_volume": 50,
  "difficulty_technical": 30,
  "difficulty_verbal": 55,
  "difficulty_ambiguity": 65,
  "difficulty_self_direction": 40,
  "prerequisite_knowledge": [],
  "year_groups": ["Y12", "Y13"],
  "time_estimate": "8-10 hours",
  "commitment_type": "ONE_OFF",
  "deadline_month": null,
  "is_recurring": false,
  "is_free": false,
  "price_gbp": null,
  "availability_notes": null,
  "generation_confidence": "LOW",
  "llm_notes": "Uncertain of exact title, author, and ISBN. Flagging for manual verification."
}
```

---

## YOUR TASK

Generate supercurricular entries for the **{CLUSTER}** cluster.

Requirements:
- Generate **{COUNT}** items
- Mix of types: books (40%), courses (20%), competitions/tests (15%), media (15%), other (10%)
- Prioritise HIGH confidence items
- For any LOW confidence items, clearly flag in llm_notes
- Use real ISBNs only - if unsure, leave null
- Include items across difficulty levels (some accessible, some challenging)

Target year groups: Primarily Y11, Y12, Y13 (ages 15-18, pre-university UK students)

**Return ONLY the JSON array. No other text.**
