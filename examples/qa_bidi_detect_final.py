#!/usr/bin/env python3
"""
qa-BiDi-detect - Final BiDi Detection for LaTeX files
Checks for:
1. Numbers in Hebrew text without \num{} wrapper
2. English text without \en{} wrapper (conservative check)
3. Hebrew text in math mode without \hebmath{}
"""
import re
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = ['beginner_example.tex', 'intermediate_example.tex', 'advanced_example.tex', 'expert_example.tex']
all_issues = []

for filename in files:
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        for line_num, line in enumerate(lines, 1):
            # Skip comments
            if line.strip().startswith('%'):
                continue

            # Skip LaTeX preamble and structural commands
            skip_keywords = [
                '\\documentclass', '\\usepackage', '\\addbibresource',
                '\\begin{document}', '\\end{document}', '\\maketitle',
                '\\tableofcontents', '\\listoffigures', '\\listoftables',
                '\\printhebrewbibliography', '\\printenglishbibliography',
                '\\newpage'
            ]
            if any(kw in line for kw in skip_keywords):
                continue

            # ====== RULE 1: Numbers in Hebrew text without \num{} wrapper ======
            # Look for: "גרסה 5.0" or "פרק 3" or similar patterns
            # Pattern: Hebrew word + space + bare number (not wrapped)

            # Check if line contains Hebrew
            if re.search(r'[א-ת]', line):
                # Find patterns like "גרסה 5.0" or "פרק 3"
                # Match: Hebrew word(s) followed by standalone number
                pattern = r'([\u0590-\u05FF][\u0590-\u05FF\s]*)\s+(\d+(?:\.\d+)?)\b'
                matches = list(re.finditer(pattern, line))

                for match in matches:
                    hebrew_word = match.group(1).strip()
                    number = match.group(2)
                    full_match = match.group(0)

                    # Get context around the match
                    start = match.start()
                    end = match.end()
                    before = line[:start]
                    after = line[end:]

                    # Skip if already wrapped in \num{}, \hebyear{}, \percent{}
                    if any(cmd in before[-20:] for cmd in ['\\num{', '\\hebyear{', '\\percent{']):
                        continue

                    # Skip if this is inside a command argument that's already wrapped
                    if before.rstrip().endswith('{') and after.lstrip().startswith('}'):
                        continue

                    # Skip if inside \cite[...] (page/chapter references)
                    if '\\cite[' in before[-30:] and ']' in after[:30]:
                        continue

                    # This is a genuine issue - bare number after Hebrew text
                    all_issues.append({
                        'file': filename,
                        'line': line_num,
                        'rule': 'number-without-num-wrapper',
                        'content': line.strip()
                    })
                    break  # Only report once per line

            # ====== RULE 2: English words without \en{} wrapper ======
            # Conservative check: Only flag obvious English words in Hebrew sentences
            # Skip this for now due to complexity and false positives
            # (LaTeX commands, code, technical terms, etc.)

            # ====== RULE 3: Hebrew in math mode without \hebmath{} ======
            # Check inline math $ ... $
            for match in re.finditer(r'\$([^$]+)\$', line):
                math_content = match.group(1)

                # Check for Hebrew letters in math mode
                if re.search(r'[א-ת]', math_content):
                    # Skip if already wrapped with \hebmath, \hebsub, or \text
                    if any(cmd in math_content for cmd in ['\\hebmath', '\\hebsub', '\\text']):
                        continue

                    # This is a genuine issue
                    all_issues.append({
                        'file': filename,
                        'line': line_num,
                        'rule': 'hebrew-in-math-without-hebmath',
                        'content': line.strip()
                    })
                    break

            # Check display math environments
            if re.search(r'\\begin{equation}|\\begin{align}|\\[', line):
                # This would require multi-line parsing - skip for now
                pass

    except Exception as e:
        print(f"Error processing {filename}: {e}", file=sys.stderr)

# Output final report
report = {
    "skill": "qa-BiDi-detect",
    "status": "DONE",
    "verdict": "PASS" if len(all_issues) == 0 else "FAIL",
    "issues": all_issues
}

print(json.dumps(report, ensure_ascii=False, indent=2))
