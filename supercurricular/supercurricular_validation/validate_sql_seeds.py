#!/usr/bin/env python3
"""
Validate supercurricular SQL seed files for common errors.

Usage:
    python validate_sql_seeds.py merged_seeds.sql
    
Or drag and drop your SQL file onto this script in VS Code terminal.
"""

import re
import sys
from collections import Counter

# Valid clusters from schema
VALID_CLUSTERS = {
    'MED', 'STEM_PHYS', 'STEM_LIFE', 'ENG', 'COMP', 
    'SOC', 'LAW', 'BUS', 'HUM', 'LANG', 'ENV', 'EDU'
}

def extract_supercurricular_ids(content):
    """Extract IDs from INSERT INTO bo_v1_supercurriculars statements."""
    # Pattern matches: ('book_something', 1, 'BOOK', ...
    pattern = r"INSERT INTO bo_v1_supercurriculars[\s\S]*?VALUES[\s\S]*?\(\s*'([a-z_]+)'"
    
    # Also match continuation rows: ), ('next_id', ...
    all_ids = re.findall(r"\(\s*'([a-z][a-z0-9_]+)'(?=\s*,\s*\d+\s*,\s*'(?:BOOK|ARTICLE|VIDEO|PODCAST|COURSE|COMPETITION|ADMISSION_TEST|EPQ_IDEA|VOLUNTEERING|WORK_EXPERIENCE|CHALLENGE|RESEARCH|PORTFOLIO|SOCIETY|EVENT|SKILL|CERTIFICATION|JOURNAL))", content)
    
    return all_ids

def extract_course_links_refs(content):
    """Extract supercurricular_id references from course_links."""
    # Match INSERT INTO bo_v1_supercurricular_course_links ... VALUES ... ('id', ...
    pattern = r"INSERT INTO bo_v1_supercurricular_course_links[\s\S]*?VALUES([\s\S]*?);"
    matches = re.findall(pattern, content)
    
    refs = []
    for match in matches:
        # Match opening paren at start of line (row start), then capture first quoted string
        row_pattern = r"^\s*\(\s*'([a-z][a-z0-9_]+)'"
        refs.extend(re.findall(row_pattern, match, re.MULTILINE))
    
    return refs

def extract_quiz_mappings_refs(content):
    """Extract supercurricular_id references from quiz_mappings."""
    pattern = r"INSERT INTO bo_v1_supercurricular_quiz_mappings[\s\S]*?VALUES([\s\S]*?);"
    matches = re.findall(pattern, content)
    
    refs = []
    for match in matches:
        # Match opening paren at start of line (row start), then capture first quoted string
        # This ensures we only get supercurricular_id, not quiz_system or other fields
        row_pattern = r"^\s*\(\s*'([a-z][a-z0-9_]+)'"
        refs.extend(re.findall(row_pattern, match, re.MULTILINE))
    
    return refs

def find_invalid_clusters(content):
    """Find any cluster values not in VALID_CLUSTERS."""
    # Look for primary_cluster values in supercurriculars inserts
    # Pattern: ..., 'ENV', ARRAY[... or ..., 'CREATIVE', ARRAY[...
    pattern = r"'((?:MED|STEM_PHYS|STEM_LIFE|ENG|COMP|SOC|LAW|BUS|HUM|LANG|ENV|EDU|[A-Z_]+))',\s*ARRAY\["
    
    clusters_found = re.findall(pattern, content)
    invalid = [c for c in clusters_found if c not in VALID_CLUSTERS]
    
    return invalid

def find_line_number(content, search_text):
    """Find line number containing search_text."""
    lines = content.split('\n')
    for i, line in enumerate(lines, 1):
        if search_text in line:
            return i
    return None

def main():
    if len(sys.argv) < 2:
        print("Usage: python validate_sql_seeds.py <sql_file>")
        print("\nDrag your merged SQL file here or provide path as argument.")
        sys.exit(1)
    
    filepath = sys.argv[1]
    
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: File not found: {filepath}")
        sys.exit(1)
    
    print(f"Scanning: {filepath}")
    print("=" * 60)
    
    errors = []
    warnings = []
    
    # 1. Check for duplicate supercurricular IDs
    super_ids = extract_supercurricular_ids(content)
    id_counts = Counter(super_ids)
    duplicates = {k: v for k, v in id_counts.items() if v > 1}
    
    if duplicates:
        print(f"\n❌ DUPLICATE SUPERCURRICULAR IDs ({len(duplicates)} found):")
        for dup_id, count in sorted(duplicates.items()):
            line = find_line_number(content, f"'{dup_id}'")
            print(f"   - {dup_id} (appears {count}x, first at line ~{line})")
            errors.append(f"Duplicate: {dup_id}")
    else:
        print(f"\n✅ No duplicate supercurricular IDs ({len(super_ids)} unique)")
    
    # 2. Check for invalid cluster values
    invalid_clusters = find_invalid_clusters(content)
    if invalid_clusters:
        print(f"\n❌ INVALID CLUSTER VALUES ({len(invalid_clusters)} found):")
        for cluster in set(invalid_clusters):
            line = find_line_number(content, f"'{cluster}'")
            print(f"   - '{cluster}' at line ~{line} (should be one of: {', '.join(sorted(VALID_CLUSTERS))})")
            errors.append(f"Invalid cluster: {cluster}")
    else:
        print("\n✅ All cluster values valid")
    
    # 3. Check for orphaned course_links references
    course_links_refs = extract_course_links_refs(content)
    super_id_set = set(super_ids)
    orphaned_links = [ref for ref in course_links_refs if ref not in super_id_set]
    
    if orphaned_links:
        print(f"\n❌ ORPHANED COURSE_LINKS REFERENCES ({len(set(orphaned_links))} unique):")
        for ref in sorted(set(orphaned_links)):
            line = find_line_number(content, f"'{ref}'")
            print(f"   - {ref} (line ~{line}) - not in supercurriculars")
            errors.append(f"Orphaned link: {ref}")
    else:
        print(f"\n✅ All course_links references valid ({len(course_links_refs)} refs)")
    
    # 4. Check for orphaned quiz_mappings references
    quiz_refs = extract_quiz_mappings_refs(content)
    orphaned_mappings = [ref for ref in quiz_refs if ref not in super_id_set]
    
    if orphaned_mappings:
        print(f"\n❌ ORPHANED QUIZ_MAPPINGS REFERENCES ({len(set(orphaned_mappings))} unique):")
        for ref in sorted(set(orphaned_mappings)):
            line = find_line_number(content, f"'{ref}'")
            print(f"   - {ref} (line ~{line}) - not in supercurriculars")
            errors.append(f"Orphaned mapping: {ref}")
    else:
        print(f"\n✅ All quiz_mappings references valid ({len(quiz_refs)} refs)")
    
    # 5. Summary
    print("\n" + "=" * 60)
    if errors:
        print(f"❌ FAILED: {len(errors)} errors found")
        print("\nFix these before running SQL:")
        for e in errors[:10]:
            print(f"   • {e}")
        if len(errors) > 10:
            print(f"   ... and {len(errors) - 10} more")
        sys.exit(1)
    else:
        print("✅ PASSED: No errors found")
        print(f"\nStats:")
        print(f"   • Supercurriculars: {len(super_ids)}")
        print(f"   • Course links: {len(course_links_refs)}")
        print(f"   • Quiz mappings: {len(quiz_refs)}")
        sys.exit(0)

if __name__ == "__main__":
    main()
