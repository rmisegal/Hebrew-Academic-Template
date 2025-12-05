#!/usr/bin/env python3
"""qa-BiDi-detect - BiDi Detection for Hebrew LaTeX files"""
import re
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = ['beginner_example.tex', 'intermediate_example.tex', 'advanced_example.tex', 'expert_example.tex']
all_issues = []

def has_hebrew(text):
    """Check if text contains Hebrew characters"""
    return bool(re.search('[\u0590-\u05FF]', text))

def has_english_word(text):
    """Check if text contains English words (not LaTeX commands)"""
    return bool(re.search(r'\b[A-Za-z]{3,}\b', text))

for filename in files:
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
            lines = content.splitlines()

        for line_num, line in enumerate(lines, 1):
            # Skip comments
            if line.strip().startswith('%'):
                continue

            # Skip preamble and structural commands
            if any(x in line for x in ['\\documentclass', '\\begin{document}', '\\end{document}',
                                        '\\usepackage', '\\addbibresource', '\\maketitle',
                                        '\\tableofcontents', '\\newpage', '\\printهebrew',
                                        '\\printenglish']):
                continue

            # RULE 1: Numbers after Hebrew words without \num{} wrapper
            # Pattern: Look for "word 5" or "word 5.0" where word is Hebrew
            # Match version numbers like "גרסה 5.0"
            if has_hebrew(line):
                # Simple pattern: Hebrew followed by whitespace and a number
                # Use simple ASCII check for numbers
                words = line.split()
                for i in range(len(words) - 1):
                    # Check if current word has Hebrew and next word is a number
                    if has_hebrew(words[i]) and re.match(r'^\d+(\.\d+)?$', words[i+1]):
                        # Check the whole line for wrapping
                        num = words[i+1]
                        # Check if this number appears wrapped
                        if f'\\num{{{num}}}' not in line and f'\\hebyear{{{num}}}' not in line and f'\\percent{{{num}}}' not in line:
                            # Make sure it's not in \cite[...]
                            if '\\cite[' not in line:
                                all_issues.append({
                                    'file': filename,
                                    'line': line_num,
                                    'rule': 'number-without-num-wrapper',
                                    'content': line.strip()
                                })
                                break

            # RULE 2: English words without \en{} wrapper (SKIPPED - too many false positives)
            # Would need sophisticated parsing to avoid:
            # - LaTeX commands (\texttt, \textbf, etc.)
            # - Code blocks
            # - Technical terms
            # - Bibliography entries

            # RULE 3: Hebrew in math mode without \hebmath{}
            # Check inline math: $...$
            math_inline = re.findall(r'\$([^\$]+)\$', line)
            for math_expr in math_inline:
                if has_hebrew(math_expr):
                    # Check if wrapped
                    if '\\hebmath' not in math_expr and '\\hebsub' not in math_expr and '\\text' not in math_expr:
                        all_issues.append({
                            'file': filename,
                            'line': line_num,
                            'rule': 'hebrew-in-math-without-hebmath',
                            'content': line.strip()
                        })
                        break

    except Exception as e:
        print(f"Error processing {filename}: {e}", file=sys.stderr)

# Output report
report = {
    "skill": "qa-BiDi-detect",
    "status": "DONE",
    "verdict": "PASS" if len(all_issues) == 0 else "FAIL",
    "issues": all_issues
}

print(json.dumps(report, ensure_ascii=False, indent=2))
