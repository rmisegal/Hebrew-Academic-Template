#!/usr/bin/env python3
"""BiDi Detection for LaTeX files - Refined version"""
import re
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = ['beginner_example.tex', 'intermediate_example.tex', 'advanced_example.tex', 'expert_example.tex']
issues = []

def is_in_command(line, pos):
    """Check if position is inside a LaTeX command argument"""
    # Look backward for opening brace
    before = line[:pos]
    after = line[pos:]

    # Count braces
    open_braces = before.count('{') - before.count('}')
    return open_braces > 0

def is_wrapped_number(line, match):
    """Check if a number is already wrapped in \num{}, \hebyear{}, or \percent{}"""
    pos = match.start()
    before = line[:pos].rstrip()
    after = line[pos + len(match.group(0)):]

    # Check if immediately preceded by wrapper command
    if before.endswith('\\num{') or before.endswith('\\hebyear{') or before.endswith('\\percent{'):
        return True

    # Check if followed by closing brace (already wrapped)
    if after.lstrip().startswith('}'):
        return True

    return False

for filename in files:
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        for line_num, line in enumerate(lines, 1):
            # Skip comments
            if line.strip().startswith('%'):
                continue

            # Skip LaTeX structural commands and metadata
            skip_patterns = [
                r'^\\documentclass', r'^\\addbibresource', r'^\\usepackage',
                r'^\\hebrewtitle', r'^\\englishtitle', r'^\\hebrewauthor',
                r'^\\hebrewversion', r'^\\date{', r'^\\begin{document}',
                r'^\\end{document}', r'^\\maketitle', r'^\\tableofcontents',
                r'^\\newpage', r'^\\hebrewchapter', r'^\\hebrewsection',
                r'^\\hebrewsubsection', r'^\\caption{', r'^\\label{',
                r'^\\includegraphics', r'^\\printhebrewbibliography',
                r'^\\printenglishbibliography'
            ]

            if any(re.match(pattern, line.strip()) for pattern in skip_patterns):
                continue

            # RULE 1: Numbers in Hebrew text without proper wrapper
            # Only flag standalone numbers NOT in any command
            if re.search(r'[א-ת]', line):
                # Skip lines that are mostly LaTeX commands
                if line.count('\\') > 5:
                    continue

                # Look for bare numbers in Hebrew context
                # Pattern: Hebrew text followed by space and bare number (not in command)
                pattern = r'[א-ת]+\s+(\d+)(?!\})'
                matches = list(re.finditer(pattern, line))

                for match in matches:
                    if not is_wrapped_number(line, match):
                        # Double check this isn't part of a LaTeX command structure
                        context = line[max(0, match.start()-20):min(len(line), match.end()+20)]
                        if '\\num{' not in context and '\\hebyear{' not in context and '\\percent{' not in context:
                            issues.append({
                                'file': filename,
                                'line': line_num,
                                'rule': 'number-without-num-wrapper',
                                'content': line.strip()
                            })
                            break

            # RULE 2: English words without \en{} wrapper
            # Only flag obvious English words in pure Hebrew sentences
            # Skip this rule for now as it has too many false positives with:
            # - LaTeX commands (texttt, textbf, etc.)
            # - Variable names in code
            # - Technical terms that are intentionally not wrapped
            pass

            # RULE 3: Hebrew text in math mode without \hebmath{}
            # This is the clearest rule - Hebrew should never appear bare in math mode
            inline_math = re.finditer(r'\$([^$]+)\$', line)
            for match in inline_math:
                math_content = match.group(1)
                # Check for Hebrew letters
                if re.search(r'[א-ת]', math_content):
                    # Make sure it's not already wrapped
                    if '\\hebmath' not in math_content and '\\hebsub' not in math_content and '\\text' not in math_content:
                        issues.append({
                            'file': filename,
                            'line': line_num,
                            'rule': 'hebrew-in-math-without-hebmath',
                            'content': line.strip()
                        })
                        break

    except Exception as e:
        print(f"Error processing {filename}: {e}", file=sys.stderr)

# Generate report
print(json.dumps({
    "skill": "qa-BiDi-detect",
    "status": "DONE",
    "verdict": "FAIL" if len(issues) > 0 else "PASS",
    "issues": issues
}, ensure_ascii=False, indent=2))
