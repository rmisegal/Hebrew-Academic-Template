#!/usr/bin/env python3
"""BiDi Detection for LaTeX files"""
import re
import json

files = ['beginner_example.tex', 'intermediate_example.tex', 'advanced_example.tex', 'expert_example.tex']
issues = []

for filename in files:
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        for line_num, line in enumerate(lines, 1):
            # Skip comments
            if line.strip().startswith('%'):
                continue

            # Skip specific LaTeX commands and metadata
            if any(x in line for x in ['\\documentclass', '\\addbibresource', '\\hebrewtitle',
                                        '\\englishtitle', '\\hebrewauthor', '\\hebrewversion',
                                        '\\date{', '\\begin{document}', '\\end{document}',
                                        '\\maketitle', '\\tableofcontents', '\\newpage',
                                        '\\hebrewchapter', '\\hebrewsection', '\\hebrewsubsection',
                                        '\\caption{', '\\label{', '\\ref{', '\\cite{',
                                        '\\includegraphics', '\\begin{', '\\end{']):
                continue

            # Rule 1: Numbers NOT in wrapping commands in Hebrew text
            # Check for numbers that appear after Hebrew text but not wrapped
            if re.search(r'[א-ת]', line):
                # Find all standalone numbers (not in commands)
                number_pattern = r'(?<!\\)(?<!{)(\d+\.?\d*)(?!})'
                matches = list(re.finditer(number_pattern, line))
                for match in matches:
                    num_str = match.group(1)
                    pos = match.start()

                    # Check if number is already wrapped
                    before = line[:pos].rstrip()
                    after = line[pos + len(num_str):]

                    # Skip if this is part of a command or already wrapped
                    if before.endswith('\\num{') or before.endswith('\\hebyear{') or before.endswith('\\percent{'):
                        continue
                    if before.endswith('{') and not after.startswith('}'):
                        continue

                    # Skip version numbers, dates, page numbers
                    if any(x in before[-30:] for x in ['גרסה', 'version', 'v', 'page', 'עמ']):
                        continue

                    # Check if there's Hebrew before this number
                    hebrew_before = re.search(r'[א-ת]', line[:pos])
                    if hebrew_before:
                        issues.append({
                            'file': filename,
                            'line': line_num,
                            'rule': 'number-without-num-wrapper',
                            'content': line.strip()
                        })
                        break

            # Rule 2: English words without \en{} in Hebrew context
            if re.search(r'[א-ת]', line):
                # Look for standalone English words (uppercase or lowercase sequences)
                english_pattern = r'\b([A-Z][a-z]{2,}|[a-z]{3,})\b'
                matches = list(re.finditer(english_pattern, line))

                for match in matches:
                    word = match.group(1)
                    pos = match.start()
                    before = line[:pos]

                    # Skip if already wrapped in \en{}, \entoc{}, etc.
                    if any(cmd in before[-50:] for cmd in ['\\en{', '\\entoc{', '\\texttt{',
                                                             '\\code{', '\\englishterm{',
                                                             '\\ilm{', '\\enpath{',
                                                             '\\textbf{', '\\textit{']):
                        continue

                    # Skip LaTeX keywords
                    latex_keywords = ['begin', 'end', 'item', 'hline', 'caption', 'label',
                                     'ref', 'cite', 'section', 'chapter', 'include',
                                     'centering', 'textbf', 'textit', 'footnote', 'vspace',
                                     'fbox', 'parbox', 'resizebox', 'multicolumn']
                    if word.lower() in latex_keywords:
                        continue

                    # Skip file extensions and paths
                    if any(ext in line for ext in ['.tex', '.png', '.py', '.bib', '.pdf', '.cls']):
                        continue

                    # Check for Hebrew nearby
                    context_start = max(0, pos - 50)
                    context_end = min(len(line), pos + 50)
                    context = line[context_start:context_end]

                    if re.search(r'[א-ת]', context):
                        issues.append({
                            'file': filename,
                            'line': line_num,
                            'rule': 'english-without-en-wrapper',
                            'content': line.strip()
                        })
                        break

            # Rule 3: Hebrew in math mode without \hebmath{}
            # Check inline math $ $
            inline_math = re.finditer(r'\$([^$]+)\$', line)
            for match in inline_math:
                math_content = match.group(1)
                if re.search(r'[א-ת]', math_content):
                    if '\\hebmath' not in math_content and '\\hebsub' not in math_content:
                        issues.append({
                            'file': filename,
                            'line': line_num,
                            'rule': 'hebrew-in-math-without-hebmath',
                            'content': line.strip()
                        })
                        break

    except Exception as e:
        print(f"Error processing {filename}: {e}")

# Output results
import sys
sys.stdout.reconfigure(encoding='utf-8')
print(json.dumps(issues, ensure_ascii=False, indent=2))
