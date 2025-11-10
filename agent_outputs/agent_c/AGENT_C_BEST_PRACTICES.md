# AGENT C: Best Practices for CLS Template Usage
## Recommended Patterns from Real-World TEX Documents

**Analysis Date:** 2025-11-09
**Based on:** 6 production-quality TEX documents
**Agent:** Agent C - TEX Pattern Analyzer

---

## OVERVIEW

This document presents best practices derived from analyzing real, working TEX documents that successfully compile with LuaLaTeX and the hebrew-academic-template.cls. These are PROVEN patterns, not theoretical recommendations.

---

## 1. DOCUMENT STRUCTURE

### 1.1 Preamble Setup

**BEST PRACTICE:**
```latex
\documentclass{hebrew-academic-template}

% Bibliography FIRST
\addbibresource{references.bib}

% Title information
\hebrewtitle{Hebrew Title}
\englishtitle{English Title}
\hebrewauthor{Author Name}
\date{\textenglish{Month Year}}

\begin{document}
```

**Why this order?**
- Bibliography resource must be loaded before document begins
- Title information in preamble ensures proper metadata
- Clean separation of concerns

### 1.2 Document Flow

**BEST PRACTICE:**
```latex
\begin{document}

\maketitle
\tableofcontents
\newpage  % or \clearpage

% Main content
\hebrewsection{...}
...

% Bibliography at end
\newpage
\printenglishbibliography

\end{document}
```

**Key Points:**
- Always include \maketitle for title page
- \tableofcontents generates TOC automatically
- Use \newpage or \clearpage between major sections
- Bibliography always at the end

---

## 2. SECTION HEADINGS

### 2.1 Standard Pattern: ALWAYS Include English

**BEST PRACTICE:**
```latex
\hebrewsection{Hebrew Text: \entoc{English Translation}}
\hebrewsubsection{Hebrew Text: \entoc{English Translation}}
```

**Examples:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\hebrewsection{מתודולוגיה: \entoc{Methodology}}
\hebrewsubsection{ניתוח נתונים: \entoc{Data Analysis}}
```

**Why?**
- Ensures proper TOC rendering
- Bilingual TOC helps readers
- `\entoc{}` specifically designed for TOC entries
- Professional academic standard

**AVOID:**
```latex
\hebrewsection{מבוא}  % Missing English - BAD
\hebrewsection{Introduction}  % English only - BAD
```

### 2.2 Chapter vs. Section

**BEST PRACTICE:**

For **standalone documents** (articles, reports):
```latex
\hebrewsection{Main Topic: \entoc{English}}
```

For **book chapters** (multi-file books):
```latex
\hebrewchapter{Chapter Title Without English}
\hebrewsection{Section Within Chapter: \entoc{English}}
```

**Why?**
- Chapters are highest level, don't need inline English
- Sections within chapters follow standard bilingual pattern
- Maintains hierarchical clarity

---

## 3. INLINE TEXT MIXING

### 3.1 English Terms in Hebrew Text

**BEST PRACTICE:**
```latex
Hebrew text with \en{English Term} continuation
```

**Examples:**
```latex
השיטות המודרניות של \en{Artificial Intelligence} מבוססות
המחקר של \en{Cox et al.} הראה
אלגוריתמי \en{Machine Learning} מתקדמים
```

**CRITICAL RULES:**
1. ALWAYS use `\en{}` for ANY English in Hebrew context
2. No spaces inside `\en{}`
3. Punctuation OUTSIDE `\en{}` unless it's part of the English term
4. Use for: technical terms, names, abbreviations, software

**AVOID:**
```latex
השיטות של Artificial Intelligence  % Missing \en{} - BAD
השיטות של \en{Artificial Intelligence.}  % Period inside - usually BAD
השיטות של \en{ AI }  % Spaces inside - BAD
```

### 3.2 Numbers in Hebrew Text

**BEST PRACTICE:**
```latex
Always use \num{} for numbers in Hebrew context
```

**Examples:**
```latex
המחקר מבוסס על \num{1000} דגימות
בשנת \hebyear{2023}
דיוק של \percent{95.2}
\num{100000} דוגמאות
```

**Why?**
- Numbers are LTR even in RTL text
- Without `\num{}`, numbers may appear reversed
- Ensures consistent rendering across PDF viewers

**Types of Number Commands:**
- `\num{123}` - General numbers
- `\percent{95}` - Percentages (handles % symbol)
- `\hebyear{2023}` - Years in Hebrew context

### 3.3 Punctuation Placement

**BEST PRACTICE:**

Hebrew punctuation OUTSIDE English wrapper:
```latex
המחקר של \en{Cox}, שפורסם  % Comma outside
לפי \en{Machine Learning}.  % Period outside
האם \en{AI}?  % Question mark outside
```

English punctuation INSIDE when part of English:
```latex
ראה \en{Smith et al.}  % "et al." is English punctuation
```

---

## 4. TABLES

### 4.1 Complete Table Pattern

**BEST PRACTICE:**
```latex
\begin{hebrewtable}[h]
\caption{Hebrew Caption: \en{English Caption}}
\begin{rtltabular}{|c|c|c|}
\hline
\mixedcell{\textbf{Hebrew / \en{English}}} &
\mixedcell{\textbf{Hebrew / \en{English}}} &
\mixedcell{\textbf{Hebrew / \en{English}}} \\
\hline
\mixedcell{Data / \en{Data}} & \num{123} & \percent{95} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

**Key Elements:**
1. `hebrewtable` environment wraps everything
2. `\caption{}` with bilingual text
3. `rtltabular` for RTL table layout
4. `\mixedcell{}` for EVERY cell with mixed content
5. Column spec: `{|c|c|c|}` for centered, bordered columns

### 4.2 Mixed Cell Usage

**BEST PRACTICE:**

Use `\mixedcell{}` when cell contains:
- Hebrew AND English: `\mixedcell{עברית / \en{English}}`
- Hebrew AND numbers: `\mixedcell{דיוק / \en{Accuracy}}`
- Any bidirectional content

**Examples:**
```latex
% Header row
\mixedcell{\textbf{מדד / \en{Metric}}}

% Data rows
\mixedcell{דיוק / \en{Accuracy}}
\mixedcell{\en{GPT-2} / ג'יפיטי-\num{2}}
```

**AVOID:**
```latex
Hebrew / \en{English}  % Missing \mixedcell{} - may break alignment
```

### 4.3 Pure Content Cells

**BEST PRACTICE:**

Pure numbers DON'T need `\mixedcell{}`:
```latex
\num{512} & \percent{95.2} & \en{MB}  % No \mixedcell needed
```

Pure Hebrew CAN be direct:
```latex
עברית בלבד  % No \mixedcell needed if truly pure Hebrew
```

---

## 5. CODE BLOCKS

### 5.1 Python Code

**BEST PRACTICE:**
```latex
\begin{pythonbox}[Hebrew Title: \en{English Title}]
# English comments only
import library

def function():
    # NO Hebrew comments
    # NO Hebrew strings
    return result
\end{pythonbox}
```

**CRITICAL RULES:**
1. Title can be bilingual: `[Hebrew: \en{English}]`
2. Code MUST be pure English/ASCII
3. Comments MUST be English only
4. NO Hebrew in strings (causes compile errors)
5. NO special characters that aren't ASCII

**Real Example:**
```latex
\begin{pythonbox}[דוגמה לקוד: \en{Python Code Example}]
import numpy as np

# Create sample data (NO Hebrew comments allowed)
X = np.random.randn(100, 1)
model.fit(X, y)
\end{pythonbox}
```

### 5.2 Short English Titles

**ALTERNATIVE:**
```latex
\begin{pythonbox}[My Python Code]
# Pure English title is also OK
\end{pythonbox}
```

**When to use:**
- Simple, short titles
- No Hebrew context needed
- Inline with English sections

---

## 6. FIGURES AND IMAGES

### 6.1 Standard Figure Pattern

**BEST PRACTICE:**
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.7\textwidth]{path/to/image.png}
\caption{Hebrew Caption: \en{English Caption}}
\label{fig:descriptive_name}
\end{figure}
```

**Key Points:**
1. Use `[h]` for "here" placement (or `[htbp]` for flexible)
2. Always `\centering` for centered images
3. Width as fraction of textwidth: `0.7\textwidth`, `0.9\textwidth`
4. Bilingual caption
5. Descriptive label for references

**Real Example:**
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.85\textwidth]{Images/fig_sigmoid_curve.png}
\caption{הפונקציה הלוגיסטית (עקומת סיגמואיד): \en{Sigmoid Curve}}
\label{fig:sigmoid_curve}
\end{figure}
```

### 6.2 Referencing Figures

**BEST PRACTICE:**
```latex
כפי שניתן לראות באיור \ref{fig:label}, ...
As shown in Figure \ref{fig:label}, ...
```

**Why use \ref{}?**
- Automatic numbering
- Updates if figure order changes
- Clickable in PDF (with hyperref)

### 6.3 Figure Captions with Complex Content

**BEST PRACTICE:**
```latex
\caption{Hebrew description with \num{2023} and \en{English terms}:
\en{Full English description including technical details}}
```

**Example:**
```latex
\caption{גרף הדגמה בשנת \hebyear{2023}:
\en{Example Plot from 2023 showing trigonometric functions}}
```

---

## 7. FOOTNOTES IN RTL

### 7.1 Placement and Content

**BEST PRACTICE:**
```latex
Hebrew word\footnote{Hebrew explanation with \en{English term} if needed}
```

**Real Example:**
```latex
מחלת לב כלילית\footnote{``כלילי'' – שייך לכליל, כלומר למה שמקיף
את הלב ככתר; ובעגה הרפואית: עורקים כליליים = העורקים המספקים
דם לשריר הלב.} \texthebrew{\en{(Coronary Heart Disease - CHD)}}
```

**Key Rules:**
1. NO space between word and `\footnote{}`
2. Footnote content can be full Hebrew text
3. Use `\en{}` for English terms within footnote
4. Can include technical explanations, translations, clarifications

### 7.2 Footnote with English Content

**BEST PRACTICE:**
```latex
\footnote{Hebrew text explaining \en{Technical Term} with details}
```

**AVOID:**
```latex
word \footnote{...}  % Space before - inconsistent rendering
\footnote{Pure English}  % In Hebrew context - should use \en{} wrapper
```

---

## 8. BIBLIOGRAPHY AND CITATIONS

### 8.1 Citation Style

**BEST PRACTICE:**
```latex
Hebrew text \cite{key} continuation
המחקר של \en{Author et al.} \cite{key}
Multiple studies \cite{key1,key2,key3}
```

**With Page Numbers:**
```latex
\cite[עמ' 45]{key}  % Hebrew "page"
\cite[p. 123]{key}  % English "page"
```

**Real Examples:**
```latex
כפי שמוכח במחקרים רבים \cite{mikolov2013}
המחקר של \en{Mikolov et al.} \cite{mikolov2013} הציג
מחקרים נוספים \cite{devlin2018,brown2020} הרחיבו
```

### 8.2 Bibliography Placement

**BEST PRACTICE:**
```latex
% At end of document, before \end{document}
\newpage
\printenglishbibliography
```

**For bilingual works:**
```latex
\newpage
\printhebrewbibliography
\printenglishbibliography
```

**Why \printenglishbibliography?**
- IEEE style with LTR numbers [1], [2], [3]
- Standard in academic work
- Better compatibility with international standards

### 8.3 Multiple Bibliographies

**BEST PRACTICE (for books with chapters):**
```latex
% In main.tex
\begin{refsection}
\input{chapters/chapter01}
\printbibliography[segment=\therefsection, title={Chapter 1 References}]
\end{refsection}
```

**This creates:**
- Separate bibliography per chapter
- Independent numbering [1], [2] per chapter
- Cleaner organization for long works

---

## 9. LISTS

### 9.1 Bullet Lists (itemize)

**BEST PRACTICE:**
```latex
\begin{itemize}
\item Hebrew text with \en{English} and \num{numbers}
\item Second item
\item Third item with \percent{95.2}
\end{itemize}
```

**Real Example:**
```latex
\begin{itemize}
\item רגרסיה ליניארית: \en{Linear Regression} - דיוק \percent{85.2}
\item יער אקראי: \en{Random Forest} - דיוק \percent{92.1}
\item רשת נוירונים: \en{Neural Network} - דיוק \percent{94.5}
\end{itemize}
```

### 9.2 Numbered Lists (enumerate)

**BEST PRACTICE:**
```latex
\begin{enumerate}
\item First step with \en{English terms}
\item Second step with \num{values}
\item Third step
\end{enumerate}
```

**Real Example:**
```latex
\begin{enumerate}
\item איסוף \num{1000} דגימות: \en{Data Collection}
\item ניתוח ראשוני של \num{15} משתנים: \en{Exploratory Analysis}
\item בניית \num{5} מודלים: \en{Model Building}
\end{enumerate}
```

### 9.3 Nested Lists

**BEST PRACTICE:**
```latex
\begin{enumerate}
\item Outer item
    \begin{itemize}
    \item Nested bullet
    \item Another nested
    \end{itemize}
\item Continue outer
\end{enumerate}
```

**Indentation:** Use 4 spaces for visual clarity (LaTeX ignores it, but helps reading)

---

## 10. MATHEMATICAL EXPRESSIONS

### 10.1 Inline Math

**BEST PRACTICE:**
```latex
Hebrew text with $math$ embedded naturally
```

**Examples:**
```latex
הנוסחה $E = mc^2$ מפורסמת
כאשר $\beta_0$ הוא הקבוע ו-$\beta_1$ הוא המקדם
```

**AVOID:**
```latex
$ E = mc^2 $  % Spaces inside - unnecessary
```

### 10.2 Display Math

**BEST PRACTICE:**

For numbered equations:
```latex
\begin{equation}
E = mc^2
\end{equation}
```

For unnumbered with manual number:
```latex
$$math expression \quad (1.1)$$
```

**Real Examples:**
```latex
\begin{equation}
y = \beta_0 + \beta_1 x + \varepsilon
\end{equation}

$$\text{Attention}(Q,K,V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V \quad (2.1)$$
```

### 10.3 Complex Equations in Hebrew Context

**BEST PRACTICE:**
```latex
Hebrew introduction text:

\begin{equation}
complex math here
\label{eq:name}
\end{equation}

Hebrew explanation referencing equation~\eqref{eq:name}.
```

**Example:**
```latex
הנוסחה הבסיסית היא:

\begin{equation}
p(x) = \frac{e^{\beta_0 + \beta_1 x}}{1 + e^{\beta_0 + \beta_1 x}}
\label{eq:logistic}
\end{equation}

כפי שניתן לראות במשוואה~\eqref{eq:logistic}, ...
```

---

## 11. ENGLISH SECTIONS IN HEBREW DOCUMENTS

### 11.1 Full English Section

**BEST PRACTICE:**
```latex
\englishsection{English Section Title}
\startenglish

All content here is pure English, left-to-right.
No Hebrew allowed. Standard English formatting.

Mathematical expressions work: $E = mc^2$

\begin{itemize}
\item English bullet points
\item With English text
\end{itemize}

\stopenglish
```

**CRITICAL:**
- MUST use `\startenglish` and `\stopenglish`
- Everything between is LTR
- No Hebrew mixing
- Returns to RTL after `\stopenglish`

### 11.2 When to Use English Sections

**BEST PRACTICE:**

Use `\englishsection` when:
- Extended English content (multiple paragraphs)
- Pure technical/mathematical derivations
- International audience sections
- English abstracts in bilingual works

**Don't use for:**
- Single English terms (use `\en{}` instead)
- Short English phrases (use `\en{}` instead)
- Mixed Hebrew-English paragraphs (use Hebrew section with `\en{}`)

---

## 12. DOCUMENT METADATA

### 12.1 Title Page Information

**BEST PRACTICE:**
```latex
\hebrewtitle{Full Hebrew Title}
\englishtitle{Full English Translation}
\hebrewauthor{ד"ר שם המחבר}
\date{\textenglish{Month Year}}
```

**Alternative for date:**
```latex
\date{\hebyear{2025}}
\date{\texthebrew{חודש} \textenglish{2025}}
```

### 12.2 Version Numbering

**BEST PRACTICE:**
```latex
\hebrewversion{גירסה \textenglish{3.00}}
```

---

## 13. FILE ORGANIZATION

### 13.1 Multi-File Projects

**BEST PRACTICE:**

Directory structure:
```
project/
├── main.tex
├── chapters/
│   ├── chapter01.tex
│   ├── chapter02.tex
│   └── ...
├── Images/
│   ├── fig_example.png
│   └── ...
└── references.bib
```

Main file:
```latex
\documentclass{hebrew-academic-template}
\addbibresource{references.bib}

\begin{document}
\input{chapters/chapter01}
\input{chapters/chapter02}
\end{document}
```

Chapter files:
```latex
% chapter01.tex - NO preamble, NO \begin{document}
\hebrewsection{Chapter Title: \entoc{English}}

Content here...
```

---

## 14. COMMON PITFALLS TO AVOID

### 14.1 Don't Do These

**AVOID:** Missing English in section headers
```latex
\hebrewsection{עברית}  % BAD - no English translation
```

**AVOID:** English without \en{} wrapper
```latex
טקסט עברי עם Machine Learning  % BAD - missing \en{}
```

**AVOID:** Numbers without \num{}
```latex
המחקר כלל 1000 דגימות  % BAD - missing \num{}
```

**AVOID:** Hebrew in code blocks
```latex
\begin{pythonbox}[Title]
# הערה בעברית  % BAD - causes errors
\end{pythonbox}
```

**AVOID:** Space before footnote
```latex
word \footnote{text}  % BAD - space before \footnote
```

**AVOID:** Mixed cells without \mixedcell{}
```latex
עברית / \en{English}  % In table - BAD, needs \mixedcell{}
```

---

## 15. COMPILATION WORKFLOW

### 15.1 Standard Compilation

**BEST PRACTICE:**
```bash
lualatex main.tex
biber main  # or bibtex main
lualatex main.tex
lualatex main.tex
```

**Why three times?**
1. First run: generates aux files
2. Biber/BibTeX: processes bibliography
3. Second run: includes bibliography, updates references
4. Third run: finalizes cross-references

### 15.2 Incremental Development

**BEST PRACTICE:**

During writing:
```bash
lualatex main.tex  # Quick check
```

When adding citations:
```bash
lualatex main.tex
biber main
lualatex main.tex
```

Final version:
```bash
lualatex main.tex
biber main
lualatex main.tex
lualatex main.tex
```

---

## SUMMARY: TOP 10 BEST PRACTICES

1. **ALWAYS wrap English in Hebrew:** `\en{English}`
2. **ALWAYS wrap numbers:** `\num{123}`, `\percent{95}`, `\hebyear{2023}`
3. **ALWAYS bilingual headers:** `\hebrewsection{Hebrew: \entoc{English}}`
4. **ALWAYS use \mixedcell{}** in tables with mixed content
5. **NEVER use Hebrew** in code blocks
6. **NEVER omit bibliography resource:** `\addbibresource{file.bib}`
7. **ALWAYS \newpage** before bibliography
8. **ALWAYS label figures:** `\label{fig:name}` for references
9. **ALWAYS close environments:** `\startenglish` → `\stopenglish`
10. **ALWAYS compile multiple times** for references and TOC

---

## FINAL RECOMMENDATION

These best practices are derived from documents that successfully compile and produce professional output. Follow them consistently for:

- Clean compilation (fewer errors)
- Professional appearance
- Proper RTL/LTR handling
- Maintainable code
- International standards compliance

When in doubt, consult the example files analyzed in this report. They represent proven, working patterns.
