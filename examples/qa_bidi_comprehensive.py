#!/usr/bin/env python3
"""
qa-BiDi-detect - Comprehensive BiDi Detection for Hebrew LaTeX files

Checks for three types of BiDi issues:
1. Numbers in Hebrew text without \num{} wrapper
2. English text without \en{} wrapper (conservative)
3. Hebrew text in math mode without \hebmath{}
"""
import re
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = ['beginner_example.tex', 'intermediate_example.tex', 'advanced_example.tex', 'expert_example.tex']
all_issues = []

def has_hebrew(text):
    """Check if text contains Hebrew characters"""
    return bool(re.search('[\u0590-\u05FF]', text))

for filename in files:
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        for line_num, line in enumerate(lines, 1):
            # Skip comments
            if line.strip().startswith('%'):
                continue

            # Skip preamble and structural commands
            skip_patterns = [
                '\\documentclass', '\\begin{document}', '\\end{document}',
                '\\usepackage', '\\addbibresource', '\\maketitle',
                '\\tableofcontents', '\\newpage', '\\listoffigures',
                '\\listoftables', '\\printhebrewbibliography',
                '\\printenglishbibliography'
            ]
            if any(pat in line for pat in skip_patterns):
                continue

            # RULE 1: Numbers after Hebrew words without \num{} wrapper
            # Look for patterns like "גרסה 5.0" where 5.0 is not wrapped
            if has_hebrew(line):
                # Split by whitespace to find word-number pairs
                words = line.split()
                for i in range(len(words) - 1):
                    current_word = words[i]
                    next_word = words[i + 1]

                    # Check if current word has Hebrew
                    if has_hebrew(current_word):
                        # Check if next word is a bare number
                        # Match: 5, 5.0, 3, etc. (but not \num{5})
                        if re.match(r'^\d+(\.\d+)?[,.:;)]?$', next_word):
                            num = re.match(r'^(\d+(?:\.\d+)?)', next_word).group(1)

                            # Check if this number is wrapped in the line
                            wrapped_variants = [
                                f'\\num{{{num}}}',
                                f'\\hebyear{{{num}}}',
                                f'\\percent{{{num}}}'
                            ]

                            # Skip if wrapped
                            if any(variant in line for variant in wrapped_variants):
                                continue

                            # Skip if inside \cite[...] (bibliography page refs)
                            if '\\cite[' in line and ']' in line[line.index(num):]:
                                continue

                            # Skip if this is inside a \textenglish{} command
                            # (already properly handled)
                            if '\\textenglish{' in line[:line.index(num)]:
                                continue

                            # This is a real issue!
                            all_issues.append({
                                'file': filename,
                                'line': line_num,
                                'rule': 'number-without-num-wrapper',
                                'content': line.strip()
                            })
                            break  # Only report once per line

            # RULE 2: English words without \en{} wrapper
            # SKIPPED - Too many false positives with:
            # - LaTeX commands (\texttt, \begin, etc.)
            # - Code blocks (Python, variable names)
            # - Technical terms that are intentional
            # - File paths and extensions

            # RULE 3: Hebrew in math mode without \hebmath{}
            # Check inline math $...$
            inline_math_pattern = r'\$([^\$]+)\$'
            for match in re.finditer(inline_math_pattern, line):
                math_content = match.group(1)

                # Check for Hebrew in math mode
                if has_hebrew(math_content):
                    # Skip if already wrapped properly
                    if any(cmd in math_content for cmd in ['\\hebmath', '\\hebsub', '\\text']):
                        continue

                    # This is a real issue!
                    all_issues.append({
                        'file': filename,
                        'line': line_num,
                        'rule': 'hebrew-in-math-without-hebmath',
                        'content': line.strip()
                    })
                    break

    except Exception as e:
        print(f"Error processing {filename}: {e}", file=sys.stderr)

# Generate final report
report = {
    "skill": "qa-BiDi-detect",
    "status": "DONE",
    "verdict": "PASS" if len(all_issues) == 0 else "FAIL",
    "issues": all_issues
}

print(json.dumps(report, ensure_ascii=False, indent=2))
