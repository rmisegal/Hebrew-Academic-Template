# AGENT C: Common Mistakes to Avoid
## What NOT to Do - Lessons from TEX File Analysis

**Analysis Date:** 2025-11-09
**Based on:** Comparison of working and problematic patterns in 6 TEX documents
**Agent:** Agent C - TEX Pattern Analyzer

---

## OVERVIEW

This document catalogs common mistakes, anti-patterns, and errors discovered during TEX file analysis. Each mistake includes:
- What NOT to do (with example)
- Why it's wrong
- How to fix it
- Real consequences

---

## 1. TEXT DIRECTION MISTAKES

### 1.1 MISTAKE: English Text Without \en{} Wrapper

**WRONG:**
```latex
טקסט עברי עם Machine Learning שממשיך
השיטה של Artificial Intelligence היא
```

**WHY IT'S WRONG:**
- English text appears reversed in RTL context
- PDF renders incorrectly
- Copy-paste from PDF is garbled
- Unpredictable behavior across PDF viewers

**CORRECT:**
```latex
טקסט עברי עם \en{Machine Learning} שממשיך
השיטה של \en{Artificial Intelligence} היא
```

**CONSEQUENCE:**
- Visual: Text appears backward or scrambled
- Functional: Cannot search English terms in PDF
- Professional: Looks unprofessional and broken

### 1.2 MISTAKE: Numbers Without \num{} Wrapper

**WRONG:**
```latex
המחקר כלל 1000 דגימות
בשנת 2023 נמצא
דיוק של 95.2% נרשם
```

**WHY IT'S WRONG:**
- Numbers may appear reversed (0001 instead of 1000)
- Inconsistent rendering across PDF viewers
- Percentage sign placement incorrect

**CORRECT:**
```latex
המחקר כלל \num{1000} דגימות
בשנת \hebyear{2023} נמצא
דיוק של \percent{95.2} נרשם
```

**CONSEQUENCE:**
- Visual: Numbers appear backward: "0001" instead of "1000"
- Critical: Makes data unreadable
- Professional: Destroys document credibility

### 1.3 MISTAKE: Spaces Inside \en{} Wrapper

**WRONG:**
```latex
\en{ Machine Learning }
\en{AI }
\en{ Neural Networks}
```

**WHY IT'S WRONG:**
- Creates inconsistent spacing
- May cause spacing issues with punctuation
- Unnecessary and incorrect syntax

**CORRECT:**
```latex
\en{Machine Learning}
\en{AI}
\en{Neural Networks}
```

**CONSEQUENCE:**
- Visual: Extra spaces around English text
- Minor but unprofessional appearance

### 1.4 MISTAKE: Punctuation Inside \en{} When It Shouldn't Be

**WRONG:**
```latex
המחקר של \en{Cox.} הראה
לפי \en{Machine Learning,} השיטה
```

**WHY IT'S WRONG:**
- Punctuation is part of Hebrew sentence structure
- Should follow RTL rules, not LTR
- Creates incorrect punctuation spacing

**CORRECT:**
```latex
המחקר של \en{Cox}, הראה
לפי \en{Machine Learning}, השיטה
```

**EXCEPTION (when punctuation is part of English):**
```latex
ראה \en{Smith et al.}  % "et al." includes the period
```

**CONSEQUENCE:**
- Visual: Incorrect punctuation spacing
- Grammatical: Violates Hebrew punctuation rules

---

## 2. SECTION HEADER MISTAKES

### 2.1 MISTAKE: Missing English Translation

**WRONG:**
```latex
\hebrewsection{מבוא}
\hebrewsubsection{מתודולוגיה}
```

**WHY IT'S WRONG:**
- TOC has no English translation
- Not accessible to international readers
- Violates bilingual document standard
- Missing \entoc{} for TOC rendering

**CORRECT:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\hebrewsubsection{מתודולוגיה: \entoc{Methodology}}
```

**CONSEQUENCE:**
- Professional: Document appears monolingual
- Functional: TOC lacks bilingual support
- Accessibility: Limits international audience

### 2.2 MISTAKE: Using \en{} Instead of \entoc{} in Headers

**SUBOPTIMAL:**
```latex
\hebrewsection{מבוא: \en{Introduction}}
```

**WHY IT'S SUBOPTIMAL:**
- Works, but not optimized for TOC
- `\entoc{}` is specifically designed for TOC entries
- May cause TOC rendering issues in complex documents

**BETTER:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
```

**NOTE:** This is found in beginner_example.tex but intermediate/advanced use `\entoc{}`

**CONSEQUENCE:**
- Functional: Usually works but not guaranteed
- Best practice: Use `\entoc{}` for consistency

### 2.3 MISTAKE: English-Only Section Headers

**WRONG:**
```latex
\hebrewsection{Introduction}
\hebrewsubsection{Methodology}
```

**WHY IT'S WRONG:**
- Using `\hebrewsection` for English content
- Should use `\englishsection` instead
- Text direction will be wrong

**CORRECT:**
```latex
\englishsection{Introduction}
\startenglish
Content here...
\stopenglish
```

**CONSEQUENCE:**
- Visual: Text appears with wrong alignment
- Structural: Document structure is confused

---

## 3. TABLE MISTAKES

### 3.1 MISTAKE: Mixed Content Without \mixedcell{}

**WRONG:**
```latex
\begin{rtltabular}{|c|c|}
\hline
עברית / \en{English} & ערך / \en{Value} \\
\hline
\end{rtltabular}
```

**WHY IT'S WRONG:**
- RTL and LTR content in same cell without wrapper
- Alignment issues
- Unpredictable rendering

**CORRECT:**
```latex
\begin{rtltabular}{|c|c|}
\hline
\mixedcell{עברית / \en{English}} & \mixedcell{ערך / \en{Value}} \\
\hline
\end{rtltabular}
```

**CONSEQUENCE:**
- Visual: Cell content misaligned
- Critical: Table layout breaks
- Professional: Table looks broken

### 3.2 MISTAKE: Using Regular figure/table Instead of Hebrew Variants

**WRONG (for Hebrew captions):**
```latex
\begin{table}[h]
\caption{טבלה עברית: \en{Hebrew Table}}
...
\end{table}
```

**WHY IT'S WRONG:**
- Regular table environment doesn't handle RTL properly
- Caption alignment issues
- Table numbering may be wrong

**CORRECT:**
```latex
\begin{hebrewtable}[h]
\caption{טבלה עברית: \en{Hebrew Table}}
\begin{rtltabular}{...}
...
\end{rtltabular}
\end{hebrewtable}
```

**CONSEQUENCE:**
- Visual: Caption misaligned
- Structural: Table numbering incorrect

### 3.3 MISTAKE: Wrong Column Specification

**WRONG:**
```latex
\begin{rtltabular}{ccc}  % Missing borders
```

**SUBOPTIMAL:**
```latex
\begin{rtltabular}{|l|l|l|}  % Left-aligned in RTL
```

**CORRECT:**
```latex
\begin{rtltabular}{|c|c|c|}  % Centered with borders
```

**WHY:**
- Centered columns work best for RTL/LTR mixed content
- Borders improve readability
- Left/right alignment can be confusing in RTL

**CONSEQUENCE:**
- Visual: Table borders missing or alignment poor
- Readability: Content harder to read

---

## 4. CODE BLOCK MISTAKES

### 4.1 MISTAKE: Hebrew Comments in Code

**WRONG:**
```latex
\begin{pythonbox}[Example]
import numpy as np

# יצירת נתונים - Hebrew comment
X = np.random.randn(100, 1)
\end{pythonbox}
```

**WHY IT'S WRONG:**
- Hebrew in code blocks causes compilation errors
- RTL text in LTR code environment
- May crash LuaLaTeX

**CORRECT:**
```latex
\begin{pythonbox}[Example]
import numpy as np

# Create sample data - English only
X = np.random.randn(100, 1)
\end{pythonbox}
```

**CONSEQUENCE:**
- Critical: COMPILATION FAILURE
- Error message: "! Package inputenc Error: Unicode char not set up for use with LaTeX"

### 4.2 MISTAKE: Hebrew in Strings

**WRONG:**
```latex
\begin{pythonbox}[Example]
print("שלום")  # Hebrew string
message = "טקסט עברי"
\end{pythonbox}
```

**WHY IT'S WRONG:**
- Same as Hebrew comments
- Causes compilation errors
- Code blocks expect ASCII/English only

**CORRECT:**
```latex
\begin{pythonbox}[Example]
print("Hello")  # English string
message = "English text"
\end{pythonbox}
```

**ALTERNATIVE (if you must show Hebrew strings):**
```latex
Hebrew text explaining: \verb|print("שלום")|  % Use \verb outside pythonbox
```

**CONSEQUENCE:**
- Critical: COMPILATION FAILURE

### 4.3 MISTAKE: Missing Title in pythonbox

**SUBOPTIMAL:**
```latex
\begin{pythonbox}
# Code without title
\end{pythonbox}
```

**WHY IT'S SUBOPTIMAL:**
- Code blocks should be labeled
- Helps readers understand context
- Professional documents always label code

**BETTER:**
```latex
\begin{pythonbox}[Algorithm Implementation]
# Labeled code
\end{pythonbox}
```

**OR:**
```latex
\begin{pythonbox}[יישום אלגוריתם: \en{Algorithm Implementation}]
# Bilingual labeled code
\end{pythonbox}
```

**CONSEQUENCE:**
- Professional: Unlabeled code looks incomplete
- Readability: Readers don't know what code does

---

## 5. FIGURE AND IMAGE MISTAKES

### 5.1 MISTAKE: Missing Bilingual Caption

**WRONG:**
```latex
\caption{תמונה}
```

**WHY IT'S WRONG:**
- Caption should be bilingual
- Not accessible to international readers
- Violates document standard

**CORRECT:**
```latex
\caption{תמונה: \en{Image Description}}
```

**CONSEQUENCE:**
- Professional: Caption appears incomplete
- Accessibility: English readers can't understand

### 5.2 MISTAKE: Missing \label{} for Cross-References

**WRONG:**
```latex
\begin{figure}[h]
\includegraphics{image.png}
\caption{Description}
% Missing \label{}
\end{figure}
```

**WHY IT'S WRONG:**
- Cannot reference figure in text
- Manual numbering required
- Numbering breaks if figure order changes

**CORRECT:**
```latex
\begin{figure}[h]
\includegraphics{image.png}
\caption{Description}
\label{fig:descriptive_name}
\end{figure}

% Later in text:
As shown in Figure \ref{fig:descriptive_name}, ...
```

**CONSEQUENCE:**
- Functional: Cannot cross-reference figures
- Maintenance: Manual numbering nightmare

### 5.3 MISTAKE: Image Path Errors

**WRONG:**
```latex
\includegraphics{image.png}  % Missing path
\includegraphics{C:\Images\image.png}  % Absolute Windows path
```

**WHY IT'S WRONG:**
- May not find image
- Absolute paths break portability
- Windows backslashes cause errors

**CORRECT:**
```latex
\includegraphics{Images/image.png}  % Relative path, forward slashes
\includegraphics{../Images/image.png}  % Relative to parent directory
```

**CONSEQUENCE:**
- Critical: Image not found, compilation warning
- Portability: Document won't compile on other systems

---

## 6. FOOTNOTE MISTAKES

### 6.1 MISTAKE: Space Before \footnote{}

**WRONG:**
```latex
word \footnote{explanation}
```

**WHY IT'S WRONG:**
- Creates space between word and footnote marker
- Inconsistent spacing
- Not standard footnote style

**CORRECT:**
```latex
word\footnote{explanation}
```

**CONSEQUENCE:**
- Visual: Awkward space before footnote number
- Professional: Non-standard appearance

### 6.2 MISTAKE: English Footnote Without \en{}

**WRONG:**
```latex
מילה\footnote{English explanation without wrapper}
```

**WHY IT'S WRONG:**
- English text in RTL footnote
- Text direction issues
- Rendering problems

**CORRECT:**
```latex
מילה\footnote{הסבר בעברית עם \en{English Term} אם נדרש}
```

**CONSEQUENCE:**
- Visual: Footnote text appears backwards
- Readability: Footnote hard to read

---

## 7. BIBLIOGRAPHY MISTAKES

### 7.1 MISTAKE: Missing \addbibresource{}

**WRONG:**
```latex
\documentclass{hebrew-academic-template}

\begin{document}
...
\cite{key}  % Citation without bibliography resource
...
\printenglishbibliography  % No resource loaded
\end{document}
```

**WHY IT'S WRONG:**
- No bibliography file loaded
- Citations show as [?]
- Bibliography section empty

**CORRECT:**
```latex
\documentclass{hebrew-academic-template}

\addbibresource{references.bib}  % MUST be in preamble

\begin{document}
...
```

**CONSEQUENCE:**
- Critical: Citations don't work
- Visual: [?] instead of [1], [2], etc.

### 7.2 MISTAKE: Wrong Bibliography Command

**WRONG:**
```latex
\printbibliography  % Wrong for this template
\bibliography{file}  % Old BibTeX style
```

**WHY IT'S WRONG:**
- Template provides specific commands
- May not format correctly for Hebrew
- LTR/RTL issues

**CORRECT:**
```latex
\printenglishbibliography  % For English/international references
\printhebrewbibliography   % For Hebrew references
```

**CONSEQUENCE:**
- Functional: Bibliography may not appear
- Visual: Wrong formatting or direction

### 7.3 MISTAKE: Bibliography Not on New Page

**SUBOPTIMAL:**
```latex
\hebrewsection{Conclusions}
...
\printenglishbibliography  % Immediately after content
```

**WHY IT'S SUBOPTIMAL:**
- Bibliography should start on new page
- Professional standard
- Better document organization

**BETTER:**
```latex
\hebrewsection{Conclusions}
...

\newpage  % or \clearpage
\printenglishbibliography
```

**CONSEQUENCE:**
- Professional: Bibliography squeezed on same page as content
- Organization: Harder to find references

---

## 8. LIST MISTAKES

### 8.1 MISTAKE: Inconsistent Item Format

**WRONG:**
```latex
\begin{itemize}
\item Hebrew text
\item English text
\item Mixed text without \en{} wrapper
\end{itemize}
```

**WHY IT'S WRONG:**
- Inconsistent language handling
- Some items work, some don't
- Unprofessional appearance

**CORRECT:**
```latex
\begin{itemize}
\item טקסט עברי עם \en{English terms}
\item עוד טקסט עברי עם \num{123}
\item פריט נוסף עם \percent{95}
\end{itemize}
```

**CONSEQUENCE:**
- Visual: Mixed formatting looks unprofessional
- Consistency: Document lacks uniformity

### 8.2 MISTAKE: Wrong Nesting Indentation

**CONFUSING:**
```latex
\begin{enumerate}
\item First
\begin{itemize}
\item Nested  % Bad indentation in source
\end{itemize}
\end{enumerate}
```

**BETTER:**
```latex
\begin{enumerate}
\item First
    \begin{itemize}
    \item Nested  % Clear indentation
    \end{itemize}
\end{enumerate}
```

**WHY IT MATTERS:**
- LaTeX ignores indentation, but humans don't
- Source code readability
- Easier to spot errors

**CONSEQUENCE:**
- Maintenance: Harder to edit nested lists
- Readability: Confusing source code

---

## 9. MATHEMATICAL EXPRESSION MISTAKES

### 9.1 MISTAKE: Spaces Inside Math Delimiters

**WRONG:**
```latex
$ E = mc^2 $  % Spaces inside
Hebrew text with $ x + y $ continuation
```

**WHY IT'S WRONG:**
- Unnecessary spaces
- Not standard LaTeX style
- May affect spacing

**CORRECT:**
```latex
$E = mc^2$
Hebrew text with $x + y$ continuation
```

**CONSEQUENCE:**
- Minor: Extra spacing around math
- Style: Non-standard LaTeX

### 9.2 MISTAKE: Using \textrm{} for Hebrew in Math Mode

**WRONG:**
```latex
$\textrm{עברית}$  % Hebrew in math mode
```

**WHY IT'S WRONG:**
- Hebrew in math mode causes errors
- Wrong font encoding
- Compilation issues

**CORRECT:**
```latex
Hebrew text with $x$ and more Hebrew  % Keep Hebrew outside math
```

**CONSEQUENCE:**
- Critical: May cause compilation errors
- Visual: Garbled Hebrew text

---

## 10. DOCUMENT STRUCTURE MISTAKES

### 10.1 MISTAKE: Missing \maketitle

**WRONG:**
```latex
\hebrewtitle{Title}
\begin{document}
\hebrewsection{First Section}  % Missing title page
```

**WHY IT'S WRONG:**
- No title page generated
- Metadata unused
- Unprofessional document start

**CORRECT:**
```latex
\hebrewtitle{Title}
\begin{document}
\maketitle  % Generates title page
\tableofcontents
\newpage
\hebrewsection{First Section}
```

**CONSEQUENCE:**
- Professional: Document has no title page
- Structure: Metadata wasted

### 10.2 MISTAKE: Wrong Command Order

**WRONG:**
```latex
\begin{document}
\addbibresource{refs.bib}  % Too late!
```

**WHY IT'S WRONG:**
- Bibliography resource MUST be in preamble
- After \begin{document} is too late
- Compilation error

**CORRECT:**
```latex
\documentclass{hebrew-academic-template}
\addbibresource{refs.bib}  % In preamble

\begin{document}
```

**CONSEQUENCE:**
- Critical: Bibliography won't work
- Error: "Cannot use \addbibresource after \begin{document}"

### 10.3 MISTAKE: Missing TOC

**SUBOPTIMAL:**
```latex
\begin{document}
\maketitle
\hebrewsection{Section 1}  % Missing TOC
```

**WHY IT'S SUBOPTIMAL:**
- No table of contents
- Professional documents should have TOC
- Navigation difficult

**BETTER:**
```latex
\begin{document}
\maketitle
\tableofcontents
\newpage
\hebrewsection{Section 1}
```

**CONSEQUENCE:**
- Professional: Document lacks navigation
- Usability: Harder to find content

---

## 11. FILE ORGANIZATION MISTAKES

### 11.1 MISTAKE: \input{} with Absolute Paths

**WRONG:**
```latex
\input{C:\Users\Name\Documents\chapter01.tex}  % Absolute path
```

**WHY IT'S WRONG:**
- Not portable
- Won't work on other systems
- Windows backslashes cause errors

**CORRECT:**
```latex
\input{chapters/chapter01.tex}  % Relative path
\input{chapters/chapter01}  % .tex extension optional
```

**CONSEQUENCE:**
- Portability: Document won't compile elsewhere
- Collaboration: Breaks for other users

### 11.2 MISTAKE: Chapter Files with \documentclass

**WRONG (in chapter01.tex):**
```latex
% chapter01.tex
\documentclass{hebrew-academic-template}  % WRONG in chapter file
\begin{document}

Chapter content...

\end{document}
```

**WHY IT'S WRONG:**
- Chapter files should contain ONLY content
- \documentclass only in main file
- Causes compilation errors

**CORRECT (in chapter01.tex):**
```latex
% chapter01.tex - NO preamble, NO \begin{document}

\hebrewsection{Chapter Title: \entoc{English}}

Chapter content...
```

**CONSEQUENCE:**
- Critical: Compilation fails with "Nested document class" error

---

## 12. COMPILATION MISTAKES

### 12.1 MISTAKE: Using Wrong Compiler

**WRONG:**
```bash
pdflatex main.tex  # Wrong compiler
xelatex main.tex   # Wrong compiler
```

**WHY IT'S WRONG:**
- Template requires LuaLaTeX
- Other compilers don't support all features
- Compilation fails or produces errors

**CORRECT:**
```bash
lualatex main.tex  # Correct compiler
```

**CONSEQUENCE:**
- Critical: COMPILATION FAILURE
- Error: Various package errors

### 12.2 MISTAKE: Single Compilation Pass

**WRONG:**
```bash
lualatex main.tex  # Only once
# Stop here - WRONG
```

**WHY IT'S WRONG:**
- Bibliography not included
- Cross-references show as [?]
- TOC not updated

**CORRECT:**
```bash
lualatex main.tex
biber main  # or bibtex main
lualatex main.tex
lualatex main.tex
```

**CONSEQUENCE:**
- Functional: Bibliography missing, references wrong
- Visual: [?] instead of proper numbers

---

## 13. SPECIAL CHARACTER MISTAKES

### 13.1 MISTAKE: Unescaped Special Characters

**WRONG:**
```latex
Price: $100  % $ is math delimiter
Email: user@example.com  % @ has special meaning
File: C:\Path\file.txt  % \ is escape character
50% increase  % % is comment character
```

**WHY IT'S WRONG:**
- Special characters have LaTeX meanings
- Cause compilation errors or wrong output
- Text disappears or becomes math

**CORRECT:**
```latex
Price: \$100
Email: user@example.com  % @ is OK in text
File: C:/Path/file.txt  % Use forward slashes
\percent{50} increase  % Use \percent{} command
```

**CONSEQUENCE:**
- Critical: Compilation errors or missing text
- Visual: Wrong symbols or missing content

---

## 14. MIXED LANGUAGE MISTAKES

### 14.1 MISTAKE: Wrong Language for Section Type

**WRONG:**
```latex
\englishsection{מבוא}  % Hebrew in \englishsection
\hebrewsection{Introduction}  % English in \hebrewsection
```

**WHY IT'S WRONG:**
- Section type doesn't match language
- Wrong text direction
- Wrong alignment

**CORRECT:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\englishsection{Introduction}
\startenglish
...
\stopenglish
```

**CONSEQUENCE:**
- Visual: Text aligned wrong
- Structural: Document structure confused

### 14.2 MISTAKE: Missing \startenglish / \stopenglish

**WRONG:**
```latex
\englishsection{English Section}
This is English content.  % Missing \startenglish
More English text.
```

**WHY IT'S WRONG:**
- Content not properly marked as English
- May render with wrong direction
- Inconsistent behavior

**CORRECT:**
```latex
\englishsection{English Section}
\startenglish
This is English content.
More English text.
\stopenglish
```

**CONSEQUENCE:**
- Visual: Content may appear RTL instead of LTR
- Structural: Language switching broken

---

## 15. CRITICAL ERROR SUMMARY

### Errors That BREAK Compilation:

1. Hebrew in code blocks → COMPILATION FAILURE
2. \addbibresource after \begin{document} → ERROR
3. Nested \documentclass → ERROR
4. Using pdflatex instead of lualatex → ERRORS
5. Unescaped $ or % or \ → ERRORS

### Errors That BREAK Output:

6. English without \en{} → Text reversed
7. Numbers without \num{} → Numbers reversed
8. Mixed table cells without \mixedcell{} → Misaligned
9. Missing bibliography resource → [?] citations
10. Hebrew in footnote without \en{} → Reversed text

### Errors That Look UNPROFESSIONAL:

11. Missing English in headers → Monolingual appearance
12. Missing bilingual captions → Incomplete documentation
13. Space before \footnote{} → Awkward spacing
14. No \newpage before bibliography → Cramped layout
15. Missing \label{} in figures → No cross-references

---

## DEBUGGING CHECKLIST

When something goes wrong, check these common mistakes:

**Document won't compile:**
- [ ] Using lualatex (not pdflatex)?
- [ ] Hebrew in code blocks?
- [ ] \addbibresource in preamble?
- [ ] Special characters escaped?

**Text appears backwards:**
- [ ] English wrapped in \en{}?
- [ ] Numbers wrapped in \num{}?
- [ ] Mixed cells wrapped in \mixedcell{}?

**References don't work:**
- [ ] \addbibresource loaded?
- [ ] Compiled with biber/bibtex?
- [ ] Three compilation passes done?
- [ ] \label{} present for figures/equations?

**Professional appearance issues:**
- [ ] Bilingual headers (\entoc{})?
- [ ] \newpage before bibliography?
- [ ] \maketitle for title page?
- [ ] \tableofcontents present?

---

## FINAL ADVICE

The vast majority of errors fall into three categories:

1. **Missing wrappers:** \en{}, \num{}, \mixedcell{}
2. **Wrong language in wrong place:** Hebrew in code, English without \en{}
3. **Missing setup:** \addbibresource{}, compilation passes

**Golden Rule:** When in doubt, look at working examples. All patterns in this document are derived from successfully compiling TEX files. Copy proven patterns, not experimental ones.

**Prevention is better than debugging:** Use best practices from the start, and you'll avoid 95% of these mistakes.
