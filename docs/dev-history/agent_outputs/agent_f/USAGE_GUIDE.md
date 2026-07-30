# Hebrew Academic Template v5.0 - Complete Usage Guide

**Comprehensive Reference Manual for All 78 Commands and 8 Environments**

**Copyright:** © 2025 Dr. Segal Yoram. All rights reserved.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
3. [Text Direction Commands](#text-direction-commands)
4. [Section Commands](#section-commands)
5. [Table Commands](#table-commands)
6. [Figure Commands](#figure-commands)
7. [Code and Listing Commands](#code-and-listing-commands)
8. [Mathematical Expression Commands](#mathematical-expression-commands)
9. [Bibliography Commands](#bibliography-commands)
10. [Title Page Commands](#title-page-commands)
11. [Symbol Commands](#symbol-commands)
12. [List Commands](#list-commands)
13. [Utility Commands](#utility-commands)
14. [Environments Reference](#environments-reference)
15. [Package Dependencies](#package-dependencies)
16. [Font Configuration](#font-configuration)
17. [Compilation Guide](#compilation-guide)
18. [Troubleshooting](#troubleshooting)
19. [FAQ](#faq)
20. [Complete Command Index](#complete-command-index)

---

## Introduction

This comprehensive guide documents every command, environment, and feature of the Hebrew Academic Template v5.0. With 78 specialized commands and 8 custom environments, this template provides everything needed for professional Hebrew academic writing.

### How to Use This Guide

- **Quick Reference:** Jump to the [Complete Command Index](#complete-command-index) for alphabetical listing
- **By Category:** Browse commands grouped by functionality
- **Examples:** Every command includes practical examples
- **Notes:** Special considerations and warnings are highlighted
- **Cross-References:** Related commands are linked for easy navigation

### Notation Conventions

Throughout this guide:
- `{}` indicates required parameters
- `[]` indicates optional parameters
- `|` separates alternatives
- `...` indicates variable content

---

## Getting Started

### Basic Document Structure

```latex
\documentclass{hebrew-academic-template}

% Preamble - Bibliography
\addbibresource{references.bib}

% Preamble - Metadata
\hebrewtitle{כותרת עברית}
\englishtitle{English Title}
\hebrewauthor{שם המחבר}
\date{\textenglish{November 2025}}

\begin{document}

% Front matter
\maketitle
\tableofcontents
\newpage

% Main content
\hebrewsection{כותרת: \entoc{Title}}
Your content here...

% Back matter
\newpage
\printenglishbibliography

\end{document}
```

### Essential Commands for Every Document

| Command | Purpose | Usage |
|---------|---------|-------|
| `\en{}` | English in Hebrew context | `טקסט עברי עם \en{English}` |
| `\num{}` | Numbers in Hebrew text | `יש לנו \num{100} דוגמאות` |
| `\hebrewsection{}` | Create Hebrew section | `\hebrewsection{כותרת: \entoc{Title}}` |
| `\cite{}` | Add citation | `מחקרים רבים \cite{key}` |

---

## Text Direction Commands

### Basic Language Switching (3 commands)

#### 1. `\en{text}`
**Purpose:** Insert English text within Hebrew context
**Syntax:** `\en{English text}`
**Parameters:** `text` - The English text to insert
**Example:**
```latex
הטכנולוגיה של \en{Machine Learning} מתפתחת במהירות
```
**Output:** The Hebrew text with "Machine Learning" in LTR direction
**Notes:**
- Always use for ANY English in Hebrew context
- No spaces inside the braces
- Handles punctuation automatically

#### 2. `\heb{text}`
**Purpose:** Insert Hebrew text within English context
**Syntax:** `\heb{Hebrew text}`
**Parameters:** `text` - The Hebrew text to insert
**Example:**
```latex
The Hebrew word \heb{שלום} means peace
```
**Output:** English text with "שלום" in RTL direction
**Notes:** Rarely needed as main text is usually Hebrew

#### 3. `\ilm{text}`
**Purpose:** Inline math or English terms (legacy compatibility)
**Syntax:** `\ilm{text}`
**Parameters:** `text` - The text to treat as LTR
**Example:**
```latex
הנוסחה \ilm{E=mc^2} מפורסמת
```
**Notes:** Consider using `\en{}` for consistency

### Number and Date Commands (3 commands)

#### 4. `\num{number}`
**Purpose:** Display numbers in LTR direction within Hebrew text
**Syntax:** `\num{number}`
**Parameters:** `number` - Any numeric value
**Example:**
```latex
המחקר כלל \num{1,234} משתתפים במשך \num{6} חודשים
```
**Output:** Numbers displayed in LTR: 1,234 and 6
**Notes:**
- ALWAYS use for numbers in Hebrew context
- Supports decimal points and commas
- Critical for correct display

#### 5. `\percent{number}`
**Purpose:** Display percentage with % symbol
**Syntax:** `\percent{number}`
**Parameters:** `number` - The percentage value
**Example:**
```latex
הדיוק הגיע ל-\percent{95.5} במבחן
```
**Output:** 95.5% (with % on the right)
**Notes:**
- Automatically adds % symbol
- Ensures correct LTR display
- Use without % in parameter

#### 6. `\hebyear{year}`
**Purpose:** Display years in Hebrew text
**Syntax:** `\hebyear{year}`
**Parameters:** `year` - The year (4 digits)
**Example:**
```latex
המחקר נערך בשנת \hebyear{2023} ופורסם ב-\hebyear{2024}
```
**Output:** Years in LTR: 2023, 2024
**Notes:** Specifically optimized for year display

### Advanced Direction Commands (6 commands)

#### 7. `\ltr{text}`
**Purpose:** Protect LTR text from bidi reversal
**Syntax:** `\ltr{text}`
**Parameters:** `text` - Text to protect
**Example:**
```latex
הביטוי \ltr{(a+b)} מייצג סכום
```
**Output:** Parentheses remain in correct order
**Notes:**
- Useful for brackets and parentheses
- Prevents bidi algorithm issues
- Restored in v5.0

#### 8. `\LTR{text}`
**Purpose:** Force left-to-right direction
**Syntax:** `\LTR{text}`
**Parameters:** `text` - Text to display LTR
**Example:**
```latex
\LTR{This entire phrase is LTR}
```
**Notes:** More forceful than `\en{}`

#### 9. `\RTL{text}`
**Purpose:** Force right-to-left direction
**Syntax:** `\RTL{text}`
**Parameters:** `text` - Text to display RTL
**Example:**
```latex
\RTL{כל המשפט הזה מימין לשמאל}
```
**Notes:** Usually unnecessary in Hebrew context

#### 10. `\startenglish`
**Purpose:** Begin an English LTR section
**Syntax:** `\startenglish`
**Parameters:** None
**Example:**
```latex
\startenglish
This entire paragraph is in English with LTR alignment.
Multiple lines work correctly.
\stopenglish
```
**Notes:** Must be closed with `\stopenglish`

#### 11. `\stopenglish`
**Purpose:** End English section, return to Hebrew
**Syntax:** `\stopenglish`
**Parameters:** None
**Notes:** Always pair with `\startenglish`

#### 12. `\stophebrew`
**Purpose:** Return to Hebrew RTL after English
**Syntax:** `\stophebrew`
**Parameters:** None
**Notes:** Alternative to `\stopenglish`

### Polyglossia Language Commands (3 commands)

#### 13. `\textenglish{text}`
**Purpose:** Polyglossia English text
**Syntax:** `\textenglish{text}`
**Parameters:** `text` - English text
**Notes:** Lower-level than `\en{}`

#### 14. `\texthebrew{text}`
**Purpose:** Polyglossia Hebrew text
**Syntax:** `\texthebrew{text}`
**Parameters:** `text` - Hebrew text
**Notes:** Lower-level than `\heb{}`

#### 15. `\selectlanguage{language}`
**Purpose:** Switch document language
**Syntax:** `\selectlanguage{hebrew|english}`
**Parameters:** `language` - Target language
**Notes:** Affects hyphenation and typography

---

## Section Commands

### Chapter Commands (1 command)

#### 16. `\hebrewchapter{title}`
**Purpose:** Create a new chapter (for books)
**Syntax:** `\hebrewchapter{Chapter Title}`
**Parameters:** `title` - Chapter title in Hebrew
**Example:**
```latex
\hebrewchapter{מבוא כללי}
```
**Output:**
- New page
- Chapter number and title
- TOC entry
- Reset section counters
**Notes:**
- Automatically numbers chapters
- Resets section counters
- Added in v3.0

### Section Commands (3 commands)

#### 17. `\hebrewsection{title}`
**Purpose:** Create a Hebrew section
**Syntax:** `\hebrewsection{Hebrew Title: \entoc{English Title}}`
**Parameters:** `title` - Section title with English translation
**Example:**
```latex
\hebrewsection{רקע תיאורטי: \entoc{Theoretical Background}}
```
**Output:** Numbered section with bilingual title
**Notes:**
- Always include `\entoc{}` for TOC
- Auto-increments section counter
- Adds to table of contents

#### 18. `\englishsection{title}`
**Purpose:** Create an English LTR section
**Syntax:** `\englishsection{English Title}`
**Parameters:** `title` - Section title in English
**Example:**
```latex
\englishsection{Literature Review}
\startenglish
English content here...
\stopenglish
```
**Notes:** Remember to use `\startenglish` for content

#### 19. `\hebrewsubsection{title}`
**Purpose:** Create a Hebrew subsection
**Syntax:** `\hebrewsubsection{Hebrew Title: \entoc{English}}`
**Parameters:** `title` - Subsection title
**Example:**
```latex
\hebrewsubsection{שיטות מחקר: \entoc{Research Methods}}
```
**Notes:** Numbered as X.Y

### Title Helper Commands (2 commands)

#### 20. `\HebrewTitle{number}{title}`
**Purpose:** Format numbered Hebrew title
**Syntax:** `\HebrewTitle{number}{title}`
**Parameters:**
- `number` - Section number
- `title` - Hebrew title
**Example:**
```latex
\HebrewTitle{1.2}{כותרת עברית}
```
**Notes:** Internal use, prefer `\hebrewsection`

#### 21. `\HebrewSubtitle{number}{title}`
**Purpose:** Format numbered Hebrew subtitle
**Syntax:** `\HebrewSubtitle{number}{title}`
**Parameters:**
- `number` - Subsection number
- `title` - Hebrew subtitle
**Notes:** Internal use

---

## Table Commands

### Table Environment Commands (2 commands)

#### 22. `\begin{hebrewtable}`
**Purpose:** Create RTL table with Hebrew caption
**Syntax:** `\begin{hebrewtable}[placement]`
**Parameters:** `[placement]` - Optional: h, t, b, p, H
**Example:**
```latex
\begin{hebrewtable}[h]
  \caption{כותרת הטבלה: \en{Table Caption}}
  \label{tab:example}
  \begin{rtltabular}{|c|c|c|}
    \hline
    עמודה 3 & עמודה 2 & עמודה 1 \\
    \hline
  \end{rtltabular}
\end{hebrewtable}
```
**Notes:**
- Caption is right-aligned
- Use with `rtltabular`
- Fixed in v5.0

#### 23. `\begin{rtltabular}`
**Purpose:** RTL column ordering
**Syntax:** `\begin{rtltabular}{column spec}`
**Parameters:** `column spec` - Standard tabular spec
**Example:**
```latex
\begin{rtltabular}{|r|c|l|}
  \hline
  ימין & מרכז & שמאל \\
  \hline
\end{rtltabular}
```
**Notes:**
- Columns appear right-to-left
- Use standard alignment: r, c, l
- Supports all tabular features

### Cell Content Commands (6 commands)

#### 24. `\hebcell{content}`
**Purpose:** Hebrew RTL cell with mixed content
**Syntax:** `\hebcell{Hebrew and \en{English} text}`
**Parameters:** `content` - Mixed Hebrew/English
**Example:**
```latex
\hebcell{טקסט עברי עם \en{English} ומספר \num{123}}
```
**Features:**
- RTL base direction
- Supports nested `\en{}`
- Vertical padding (0.5ex)
- Right alignment
**Notes:** Enhanced in v3.0 with better padding

#### 25. `\mixedcell{content}`
**Purpose:** Alias for `\hebcell` (backward compatibility)
**Syntax:** `\mixedcell{content}`
**Parameters:** Same as `\hebcell`
**Notes:** Kept for v1.0 compatibility

#### 26. `\encell{content}`
**Purpose:** English LTR cell
**Syntax:** `\encell{English only content}`
**Parameters:** `content` - English text
**Example:**
```latex
\encell{Pure English text}
```
**Features:**
- LTR direction
- Left alignment
- Vertical padding
**Notes:** Added in v3.0

#### 27. `\hebheader{content}`
**Purpose:** Hebrew header cell
**Syntax:** `\hebheader{Header Text}`
**Parameters:** `content` - Header text
**Example:**
```latex
\textbf{\hebheader{כותרת עמודה}}
```
**Notes:**
- Use with `\textbf{}` for bold
- Optimized vertical spacing
- Added in v3.0

#### 28. `\enheader{content}`
**Purpose:** English header cell
**Syntax:** `\enheader{Header Text}`
**Parameters:** `content` - Header text
**Example:**
```latex
\textbf{\enheader{Column Header}}
```
**Notes:** LTR header formatting

#### 29. `\rtlrow{cells}` (Optional)
**Purpose:** Auto-reverse columns for RTL
**Syntax:** `\rtlrow[ncols]{cell1 & cell2 & cell3}`
**Parameters:**
- `[ncols]` - Number of columns
- `cells` - Cell contents
**Notes:**
- Helper for beginners
- Optional in v5.0
- Consider using manual ordering

---

## Figure Commands

### Figure Creation (2 commands)

#### 30. `\hebrewfigure` (Command Form)
**Purpose:** Create figure with Hebrew caption
**Syntax:** `\hebrewfigure[placement]{content}{caption}`
**Parameters:**
- `[placement]` - Optional: h, t, b, p
- `{content}` - Figure content
- `{caption}` - Caption text
**Example:**
```latex
\hebrewfigure[h]{
  \includegraphics[width=0.8\textwidth]{image.png}
}{
  תיאור האיור: \en{Figure Description}
}
```
**Notes:** Command form from v1.0

#### 31. `\begin{hebrewfigure}` (Environment Form)
**Purpose:** Figure environment with Hebrew support
**Syntax:** `\begin{hebrewfigure}[placement]`
**Parameters:** `[placement]` - Optional placement
**Example:**
```latex
\begin{hebrewfigure}[htbp]
  \centering
  \includegraphics[width=0.7\textwidth]{diagram.pdf}
  \caption{דיאגרמה: \en{System Diagram}}
  \label{fig:system}
\end{hebrewfigure}
```
**Notes:**
- Environment form from v3.0
- More flexible than command form
- Supports all figure features

---

## Code and Listing Commands

### Code Environment Commands (2 commands)

#### 32. `\begin{pythonbox}`
**Purpose:** Floating Python code with syntax highlighting
**Syntax:** `\begin{pythonbox}[title]`
**Parameters:** `[title]` - Optional title
**Example:**
```latex
\begin{pythonbox}[אלגוריתם: \en{Sorting Algorithm}]
import numpy as np

def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    return quicksort([x for x in arr if x < pivot]) + \
           [pivot] + \
           quicksort([x for x in arr if x > pivot])
\end{pythonbox}
```
**Features:**
- Gray background
- Syntax highlighting
- Line breaking
- Floating (can move for optimal placement)
**Notes:**
- Title can be bilingual
- Code must be ASCII only
- No Hebrew in comments

#### 33. `\begin{pythonbox*}`
**Purpose:** Non-floating Python code
**Syntax:** `\begin{pythonbox*}[title]`
**Parameters:** `[title]` - Optional title
**Example:**
```latex
\begin{pythonbox*}[Long Code Example]
# Very long code that needs to stay in place
# and possibly break across pages
for i in range(100):
    # ... lots of code ...
\end{pythonbox*}
```
**Features:**
- Same as pythonbox but non-floating
- Can break across pages
- Stays exactly where placed
**Notes:**
- Added in v3.0
- Use for long code blocks
- Prevents overflow issues

### Inline Code Commands (2 commands)

#### 34. `\code{text}`
**Purpose:** Inline code formatting
**Syntax:** `\code{code_text}`
**Parameters:** `text` - Code to format
**Example:**
```latex
השתמש בפקודה \code{print("Hello")} להדפסה
```
**Output:** Monospace font with LTR direction
**Notes:** Automatically uses `\en{}` wrapper

#### 35. `\englishterm{term}`
**Purpose:** English technical terms in italic
**Syntax:** `\englishterm{term}`
**Parameters:** `term` - Technical term
**Example:**
```latex
המושג \englishterm{machine learning} מתאר
```
**Output:** Italicized English term
**Notes:** Emphasizes technical vocabulary

### Path and Font Commands (3 commands)

#### 36. `\enpath{path}`
**Purpose:** File paths with proper hyphen handling
**Syntax:** `\enpath{/path/to/file-name.txt}`
**Parameters:** `path` - File path or name
**Example:**
```latex
הקובץ נמצא ב-\enpath{/usr/local/bin/my-script.sh}
```
**Features:**
- Courier font
- Correct hyphen rendering
- LTR direction
**Notes:**
- Added in v3.0
- Solves hyphen display issues
- Robust in captions

#### 37. `\listingfont`
**Purpose:** Set font for listings
**Syntax:** `\listingfont`
**Parameters:** None
**Notes:** Internal command for code blocks

#### 38. `\courierfont`
**Purpose:** Access Courier font family
**Syntax:** `{\courierfont text}`
**Parameters:** None (font switch)
**Notes:** Used internally by `\enpath`

---

## Mathematical Expression Commands

### Hebrew in Math (3 commands)

#### 39. `\hebmath{text}`
**Purpose:** Hebrew text inside math formulas
**Syntax:** `$\hebmath{Hebrew text}$`
**Parameters:** `text` - Hebrew text
**Example:**
```latex
$$f(x) = \begin{cases}
  1 & \text{אם } x > 0 \\
  0 & \hebmath{אחרת}
\end{cases}$$
```
**Features:**
- RTL direction in math
- Proper scoping
- Text mode in math
**Notes:** Superior to `\hebtextmath`

#### 40. `\hebsub{text}`
**Purpose:** Hebrew subscript in math
**Syntax:** `$x_{\hebsub{Hebrew}}$`
**Parameters:** `text` - Hebrew subscript text
**Example:**
```latex
$V_{\hebsub{מקסימום}} = 100$
```
**Features:**
- Smaller size
- RTL in subscript
**Notes:** Added in v3.0

#### 41. `\hebtextmath{text}`
**Purpose:** Legacy Hebrew in math
**Syntax:** `$\hebtextmath{text}$`
**Parameters:** `text` - Hebrew text
**Notes:** Use `\hebmath` instead

### Math Operators (2 commands)

#### 42. `\argmin`
**Purpose:** Argmin operator
**Syntax:** `$\argmin_{x} f(x)$`
**Parameters:** None (operator)
**Example:**
```latex
$$\theta^* = \argmin_{\theta} L(\theta)$$
```
**Output:** Properly spaced "arg min"
**Notes:** Common in optimization

#### 43. `\argmax`
**Purpose:** Argmax operator
**Syntax:** `$\argmax_{x} f(x)$`
**Parameters:** None (operator)
**Example:**
```latex
$$a^* = \argmax_{a} Q(s,a)$$
```
**Output:** Properly spaced "arg max"
**Notes:** Common in ML/optimization

### Special Characters (3 commands)

#### 44. `\Rsquared`
**Purpose:** R² symbol
**Syntax:** `\Rsquared`
**Parameters:** None
**Example:**
```latex
המודל השיג \Rsquared{} של \percent{0.95}
```
**Output:** R²
**Notes:** Works in Hebrew fonts lacking ²

#### 45. `\Rtwo`
**Purpose:** Alternative R² rendering
**Syntax:** `\Rtwo`
**Parameters:** None
**Output:** R with superscript 2
**Notes:** Text mode alternative

#### 46. `\rarrow`
**Purpose:** Arrow in RTL context
**Syntax:** `\rarrow`
**Parameters:** None
**Example:**
```latex
תהליך: שלב א \rarrow שלב ב \rarrow שלב ג
```
**Output:** ← (leftward arrow in RTL)
**Notes:** Logical "next" arrow

---

## Bibliography Commands

### Bibliography Display (2 commands)

#### 47. `\printhebrewbibliography`
**Purpose:** Display Hebrew references
**Syntax:** `\printhebrewbibliography`
**Parameters:** None
**Example:**
```latex
\newpage
\printhebrewbibliography
```
**Features:**
- Filters by `keywords={hebrew}`
- RTL formatting
- Hebrew section title
**Notes:** Requires biber backend

#### 48. `\printenglishbibliography`
**Purpose:** Display English references
**Syntax:** `\printenglishbibliography`
**Parameters:** None
**Example:**
```latex
\newpage
\printenglishbibliography
```
**Features:**
- Filters by `keywords={english}`
- LTR formatting
- English section title
**Notes:** Standard for academic work

### Bibliography Utilities (1 command)

#### 49. `\ltrnumber{number}`
**Purpose:** Force LTR for bibliography numbers
**Syntax:** `\ltrnumber{number}`
**Parameters:** `number` - Number to format
**Notes:** Used internally for [1], [2], [3]

---

## Title Page Commands

### Title Definition (4 commands)

#### 50. `\hebrewtitle{title}`
**Purpose:** Set Hebrew title
**Syntax:** `\hebrewtitle{Hebrew Title}`
**Parameters:** `title` - Document title in Hebrew
**Example:**
```latex
\hebrewtitle{מערכות למידה עמוקה}
```
**Notes:** Used by `\maketitle`

#### 51. `\englishtitle{title}`
**Purpose:** Set English title
**Syntax:** `\englishtitle{English Title}`
**Parameters:** `title` - Document title in English
**Example:**
```latex
\englishtitle{Deep Learning Systems}
```
**Notes:** Appears below Hebrew title

#### 52. `\hebrewauthor{author}`
**Purpose:** Set author name
**Syntax:** `\hebrewauthor{Author Name}`
**Parameters:** `author` - Author name
**Example:**
```latex
\hebrewauthor{ד"ר ישראל ישראלי}
```
**Notes:** Can be Hebrew or English

#### 53. `\hebrewversion{version}`
**Purpose:** Set document version
**Syntax:** `\hebrewversion{version}`
**Parameters:** `version` - Version string
**Example:**
```latex
\hebrewversion{גרסה \textenglish{2.0}}
```
**Notes:** Appears on title page

### Title Generation (1 command)

#### 54. `\maketitle`
**Purpose:** Generate title page
**Syntax:** `\maketitle`
**Parameters:** None
**Example:**
```latex
\begin{document}
\maketitle
```
**Features:**
- Uses all defined title commands
- Includes copyright notice
- Professional formatting
**Notes:** Place after `\begin{document}`

---

## Symbol Commands

#### 55. `\warningsymbol`
**Purpose:** Warning triangle symbol
**Syntax:** `\warningsymbol`
**Parameters:** None
**Example:**
```latex
\warningsymbol{} אזהרה: נדרשת זהירות
```
**Output:** ▲
**Notes:** Black triangle, restored in v5.0

#### 56. `\checksymbol`
**Purpose:** Checkmark symbol
**Syntax:** `\checksymbol`
**Parameters:** None
**Example:**
```latex
\checksymbol{} משימה הושלמה
```
**Output:** ✓
**Notes:** Useful for checklists

---

## List Commands

#### 57. `\Hitem{text}`
**Purpose:** Hebrew item in list
**Syntax:** `\Hitem{Hebrew text}`
**Parameters:** `text` - Item text
**Example:**
```latex
\begin{itemize}
\Hitem{פריט ראשון}
\Hitem{פריט שני עם \en{English}}
\Hitem{פריט שלישי}
\end{itemize}
```
**Notes:** Ensures proper RTL in lists

---

## Utility Commands

### Version Information (1 command)

#### 58. `\clsversion`
**Purpose:** Get template version
**Syntax:** `\clsversion`
**Parameters:** None
**Example:**
```latex
This document uses template version \clsversion
```
**Output:** V05-2025-11-09
**Notes:** Useful for debugging

### Internal Commands (20+ commands)

These commands are used internally by the template:

#### PDF String Commands
- `\pdfstringdefDisableCommands` - PDF bookmark compatibility
- Various `\def` commands for hyperref

#### Counter Commands
- `\thehebrewchapter` - Chapter numbering
- `\thehebrewsection` - Section numbering
- `\thehebrewsubsection` - Subsection numbering

#### Font Commands
- `\englishfont` - English font family
- `\hebrewfont` - Hebrew font family

#### Page Elements
- `\thepage` - Page numbering (LTR)
- `\thetable` - Table numbering
- `\thefigure` - Figure numbering

---

## Environments Reference

### 1. `hebrewtable` Environment

**Purpose:** RTL table with Hebrew caption support

**Syntax:**
```latex
\begin{hebrewtable}[placement]
  \caption{Hebrew Caption: \en{English Caption}}
  \label{tab:label}
  % Table content
\end{hebrewtable}
```

**Parameters:**
- `[placement]` - Optional: `h` (here), `t` (top), `b` (bottom), `p` (page), `H` (HERE)

**Features:**
- Right-aligned Hebrew captions
- Automatic numbering
- Cross-reference support

**Example:**
```latex
\begin{hebrewtable}[h]
  \caption{נתוני ניסוי: \en{Experimental Data}}
  \label{tab:data}
  \begin{rtltabular}{|c|c|c|}
    \hline
    \hebheader{פרמטר} & \hebheader{ערך} & \enheader{Unit} \\
    \hline
    \hebcell{טמפרטורה} & \num{25} & \en{°C} \\
    \hebcell{לחץ} & \num{101.3} & \en{kPa} \\
    \hline
  \end{rtltabular}
\end{hebrewtable}
```

**Notes:**
- Caption alignment fixed in v5.0
- Always use with `rtltabular`
- Reference with `\ref{tab:label}`

### 2. `rtltabular` Environment

**Purpose:** Tabular with RTL column ordering

**Syntax:**
```latex
\begin{rtltabular}{column specification}
  % Table rows
\end{rtltabular}
```

**Parameters:**
- Column specification: `|c|c|c|`, `|r|c|l|`, etc.

**Features:**
- Columns appear right-to-left
- Supports all tabular features
- Works with booktabs

**Example:**
```latex
\begin{rtltabular}{|m{4cm}|m{3cm}|m{2cm}|}
  \hline
  \hebcell{תיאור ארוך} &
  \hebcell{ערך} &
  \encell{Status} \\
  \hline
\end{rtltabular}
```

**Column Types:**
- `c` - centered
- `l` - left-aligned (appears right in RTL)
- `r` - right-aligned (appears left in RTL)
- `p{width}` - paragraph column
- `m{width}` - middle-aligned (recommended)

### 3. `hebrewfigure` Environment

**Purpose:** Figure with Hebrew support

**Syntax:**
```latex
\begin{hebrewfigure}[placement]
  \centering
  \includegraphics[options]{file}
  \caption{Caption}
  \label{fig:label}
\end{hebrewfigure}
```

**Features:**
- Hebrew/English captions
- Standard figure functionality
- Cross-referencing

**Example:**
```latex
\begin{hebrewfigure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{results.pdf}
  \caption{תוצאות הניסוי: \en{Experiment Results}}
  \label{fig:results}
\end{hebrewfigure}
```

### 4. `pythonbox` Environment

**Purpose:** Floating Python code block

**Syntax:**
```latex
\begin{pythonbox}[title]
# Python code
\end{pythonbox}
```

**Features:**
- Syntax highlighting
- Gray background (#F5F5F5)
- Automatic line breaking
- Tab size: 4 spaces

**Example:**
```latex
\begin{pythonbox}[אלגוריתם KMeans: \en{KMeans Algorithm}]
from sklearn.cluster import KMeans
import numpy as np

# Initialize KMeans with 3 clusters
kmeans = KMeans(n_clusters=3, random_state=42)

# Fit the model
kmeans.fit(X)

# Get cluster centers
centers = kmeans.cluster_centers_
\end{pythonbox}
```

**Important Rules:**
- NO Hebrew in code or comments
- ASCII characters only
- Title can be bilingual
- Floats to optimal position

### 5. `pythonbox*` Environment

**Purpose:** Non-floating Python code

**Syntax:**
```latex
\begin{pythonbox*}[title]
# Long Python code
\end{pythonbox*}
```

**Features:**
- Same as pythonbox but non-floating
- Can break across pages
- Stays in exact position

**When to Use:**
- Very long code listings
- Code that must appear in sequence
- When floating causes layout issues

### 6. `python` Environment

**Purpose:** Float container for code listings

**Syntax:**
```latex
\begin{python}
  % Content (usually pythonbox)
\end{python}
```

**Notes:**
- Internal environment
- Created by `newfloat` package
- Provides `\listofpythonlistings` capability

### 7. `hebrew` Environment

**Purpose:** Hebrew text block

**Syntax:**
```latex
\begin{hebrew}
Hebrew text here
\end{hebrew}
```

**Features:**
- Sets Hebrew as active language
- RTL paragraph direction
- Hebrew hyphenation

**Notes:**
- From polyglossia package
- Usually not needed (document is Hebrew by default)

### 8. `english` Environment

**Purpose:** English text block

**Syntax:**
```latex
\begin{english}
English text here
\end{english}
```

**Features:**
- Sets English as active language
- LTR paragraph direction
- English hyphenation

**Example:**
```latex
\englishsection{Abstract}
\begin{english}
This paper presents a comprehensive study of
machine learning applications in natural language
processing for Hebrew texts.
\end{english}
```

---

## Package Dependencies

### Required Core Packages

| Package | Version | Purpose | Critical Commands |
|---------|---------|---------|-------------------|
| **fontspec** | Any | Font selection | Font loading |
| **polyglossia** | 1.45+ | Language support | `\texthebrew`, `\textenglish` |
| **luabidi** | Latest | Bidi algorithm | RTL/LTR handling |
| **biblatex** | 3.14+ | Bibliography | `\cite`, `\printbibliography` |

### Mathematical Packages

| Package | Purpose | Commands Provided |
|---------|---------|-------------------|
| **amsmath** | Advanced math | Environments, symbols |
| **amssymb** | Math symbols | Special characters |

### Graphics Packages

| Package | Purpose | Usage |
|---------|---------|-------|
| **graphicx** | Images | `\includegraphics` |
| **float** | Float control | `[H]` placement |
| **caption** | Captions | `\caption` styling |
| **tikz-cd** | Diagrams | Commutative diagrams |

### Table Packages

| Package | Purpose | Features |
|---------|---------|----------|
| **longtable** | Multi-page tables | Page breaks |
| **tabularx** | Flexible width | `X` columns |
| **array** | Enhanced arrays | Column types |
| **booktabs** | Professional rules | `\toprule`, `\midrule` |

### Code Packages

| Package | Purpose | Usage |
|---------|---------|-------|
| **tcolorbox** | Colored boxes | pythonbox environment |
| **listings** | Code listings | Syntax highlighting |
| **fvextra** | Verbatim extras | Enhanced verbatim |
| **xcolor** | Colors | Background colors |
| **newfloat** | Custom floats | python environment |

### Document Structure Packages

| Package | Purpose | Features |
|---------|---------|----------|
| **geometry** | Page layout | Margins, dimensions |
| **fancyhdr** | Headers/footers | Custom headers |
| **titlesec** | Section formatting | Title styling |
| **setspace** | Spacing | Line spacing |
| **hyperref** | PDF features | Links, bookmarks |
| **enumerate** | Lists | Enhanced enumeration |

### Package Loading Order

The template loads packages in this specific order:

1. **Font/Language:** fontspec → polyglossia → luabidi
2. **Math:** amsmath → amssymb
3. **Graphics:** graphicx → float → caption
4. **Structure:** setspace → enumerate → titlesec
5. **Bibliography:** biblatex with biber backend
6. **Tables:** longtable → tabularx → array → booktabs
7. **Special:** tikz-cd
8. **PDF:** hyperref (must be near last)
9. **Layout:** fancyhdr → geometry
10. **Code:** xcolor → tcolorbox → fvextra → newfloat

---

## Font Configuration

### Automatic Font Detection System

The template uses a smart cascading fallback system:

```
Try Primary Font → Try Secondary Font → Use Fallback Font
```

### Windows Font Configuration (MiKTeX)

```latex
% Main document font
\setmainfont{Times New Roman}[
    Renderer=Harfbuzz,
    Ligatures=TeX
]

% Hebrew font
\newfontfamily\hebrewfont{David CLM}[
    Renderer=Harfbuzz,
    Script=Hebrew,
    Scale=MatchLowercase
]

% Sans-serif font
\setsansfont{Arial}[
    Renderer=Harfbuzz
]

% Monospace font
\setmonofont{Courier New}[
    Renderer=Harfbuzz
]
```

### Linux Font Configuration (TeX Live)

```latex
% Main document font
\setmainfont{Latin Modern Roman}[
    Renderer=Harfbuzz,
    Ligatures=TeX
]

% Hebrew font
\newfontfamily\hebrewfont{DejaVu Sans}[
    Renderer=Harfbuzz,
    Script=Hebrew,
    Scale=MatchLowercase
]

% Sans-serif font
\setsansfont{DejaVu Sans}[
    Renderer=Harfbuzz
]

% Monospace font
\setmonofont{DejaVu Sans Mono}[
    Renderer=Harfbuzz
]
```

### Font Installation Guide

#### Installing Hebrew Fonts on Windows

1. Download Culmus fonts:
   - Visit: https://sourceforge.net/projects/culmus/
   - Download: culmus-0.133.zip

2. Install fonts:
   - Extract ZIP file
   - Select all .ttf files
   - Right-click → Install

#### Installing Hebrew Fonts on Linux

Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install culmus fonts-dejavu culmus-fancy
```

Fedora/RHEL:
```bash
sudo dnf install culmus-fonts dejavu-fonts-all
```

Arch Linux:
```bash
sudo pacman -S ttf-dejavu culmus
```

#### Installing Hebrew Fonts on macOS

Using Homebrew:
```bash
brew tap homebrew/cask-fonts
brew install --cask font-dejavu
```

Manual installation:
1. Download fonts from Culmus project
2. Double-click .ttf files
3. Click "Install Font"

### Custom Font Configuration

To override default fonts, add after `\documentclass`:

```latex
% Custom main font
\setmainfont{Libertinus Serif}[
    Renderer=Harfbuzz,
    Ligatures=TeX
]

% Custom Hebrew font
\newfontfamily\hebrewfont{Frank Ruehl CLM}[
    Renderer=Harfbuzz,
    Script=Hebrew,
    Scale=1.2  % Adjust size
]

% Custom code font
\setmonofont{Fira Code}[
    Renderer=Harfbuzz,
    Contextuals=Alternate  % Enable ligatures
]
```

### Font Troubleshooting

**Issue:** Hebrew appears as boxes □□□
```latex
% Solution: Install Hebrew fonts or let template use fallback
% The template will automatically try DejaVu Sans
```

**Issue:** Font looks too small/large
```latex
% Adjust scaling
\newfontfamily\hebrewfont{David CLM}[
    Scale=1.1  % Increase by 10%
]
```

**Issue:** Monospace font has wrong width
```latex
% Use fixed-width font
\setmonofont{Courier New}[
    Scale=MatchLowercase
]
```

---

## Compilation Guide

### Standard LuaLaTeX + Biber Workflow

The template requires LuaLaTeX for proper Unicode and bidirectional support:

```bash
# Step 1: Initial compilation (generates .aux, .bcf files)
lualatex document.tex

# Step 2: Process bibliography (reads .bcf, generates .bbl)
biber document

# Step 3: Incorporate bibliography (reads .bbl)
lualatex document.tex

# Step 4: Finalize cross-references
lualatex document.tex
```

### Understanding the Compilation Process

| Step | Command | Purpose | Files Generated |
|------|---------|---------|-----------------|
| 1 | `lualatex` | Parse document | .aux, .bcf, .toc, .out |
| 2 | `biber` | Process citations | .bbl, .blg |
| 3 | `lualatex` | Include bibliography | Updates .aux |
| 4 | `lualatex` | Finalize references | Final PDF |

### Quick Compilation (No Bibliography)

For documents without citations:
```bash
lualatex document.tex
lualatex document.tex  # Run twice for TOC
```

### Automated Build Systems

#### Using latexmk

Create `.latexmkrc` in project directory:
```perl
# LuaLaTeX configuration
$pdf_mode = 4;           # Use lualatex
$pdf_previewer = 'start evince';  # Linux
# $pdf_previewer = 'start';        # Windows
# $pdf_previewer = 'open';         # macOS

# Biber configuration
$biber = 'biber %O %B';
$bibtex_use = 2;         # Use biber

# Clean auxiliary files
$clean_ext = 'synctex.gz run.xml bcf';

# Custom dependencies
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  my ($base_name, $path) = fileparse($_[0]);
  pushd($path);
  my $return = system "makeglossaries $base_name";
  popd();
  return $return;
}
```

Compile with:
```bash
latexmk document.tex        # Compile
latexmk -pvc document.tex   # Continuous preview
latexmk -c document.tex     # Clean auxiliary files
latexmk -C document.tex     # Clean all generated files
```

#### Using GNU Make

Create `Makefile`:
```makefile
# Variables
MAIN = document
COMPILER = lualatex
BIB = biber
LATEXMK = latexmk

# Compiler flags
LFLAGS = -synctex=1 -interaction=nonstopmode -file-line-error
BFLAGS = --debug

# Files
TEX_FILES = $(wildcard *.tex)
BIB_FILES = $(wildcard *.bib)
FIG_FILES = $(wildcard figures/*.pdf figures/*.png)

# Main target
all: $(MAIN).pdf

# PDF generation
$(MAIN).pdf: $(TEX_FILES) $(BIB_FILES) $(FIG_FILES)
	$(COMPILER) $(LFLAGS) $(MAIN)
	$(BIB) $(BFLAGS) $(MAIN)
	$(COMPILER) $(LFLAGS) $(MAIN)
	$(COMPILER) $(LFLAGS) $(MAIN)

# Quick build (no bibliography)
quick:
	$(COMPILER) $(LFLAGS) $(MAIN)

# Continuous compilation
watch:
	$(LATEXMK) -pvc -lualatex $(MAIN)

# Clean auxiliary files
clean:
	rm -f $(MAIN).{aux,bbl,bcf,blg,log,out,run.xml,toc,lof,lot}
	rm -f $(MAIN).{fdb_latexmk,fls,synctex.gz}

# Clean everything
distclean: clean
	rm -f $(MAIN).pdf

# Help
help:
	@echo "Available targets:"
	@echo "  all       - Full compilation with bibliography"
	@echo "  quick     - Quick compilation without bibliography"
	@echo "  watch     - Continuous compilation with preview"
	@echo "  clean     - Remove auxiliary files"
	@echo "  distclean - Remove all generated files"
	@echo "  help      - Show this help message"

.PHONY: all quick watch clean distclean help
```

#### Using VS Code

Configure in `.vscode/settings.json`:
```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "lualatex",
      "command": "lualatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-output-directory=%OUTDIR%",
        "%DOC%"
      ]
    },
    {
      "name": "biber",
      "command": "biber",
      "args": [
        "%OUTDIR%/%DOCFILE%"
      ]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "Hebrew Academic (full)",
      "tools": [
        "lualatex",
        "biber",
        "lualatex",
        "lualatex"
      ]
    },
    {
      "name": "Hebrew Academic (quick)",
      "tools": [
        "lualatex"
      ]
    }
  ],
  "latex-workshop.latex.recipe.default": "Hebrew Academic (full)",
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux",
    "*.bbl",
    "*.bcf",
    "*.blg",
    "*.idx",
    "*.ind",
    "*.lof",
    "*.lot",
    "*.out",
    "*.toc",
    "*.run.xml",
    "*.synctex.gz",
    "*.fdb_latexmk",
    "*.fls",
    "*.log"
  ]
}
```

### Compilation Performance Tips

#### Enable Shell Escape (When Needed)
```bash
lualatex --shell-escape document.tex  # For TikZ externalize
```

#### Use Draft Mode for Testing
```latex
\documentclass[draft]{hebrew-academic-template}
% Images replaced with boxes, faster compilation
```

#### Externalize TikZ Graphics
```latex
\usetikzlibrary{external}
\tikzexternalize[prefix=tikz/]
```

#### Precompile Preamble
```bash
lualatex -ini -jobname="preamble" "&lualatex" myheader.tex "\dump"
lualatex "&preamble" document.tex
```

---

## Troubleshooting

### Compilation Errors

#### Error: "File 'hebrew-academic-template.cls' not found"

**Cause:** Class file not in correct location

**Solutions:**
```bash
# Option 1: Copy to project directory
cp /path/to/hebrew-academic-template.cls ./

# Option 2: Install system-wide (Linux)
mkdir -p ~/texmf/tex/latex/hebrew-academic-template
cp hebrew-academic-template.cls ~/texmf/tex/latex/hebrew-academic-template/
mktexlsr ~/texmf

# Option 3: Install system-wide (Windows)
# Copy to: C:\Users\[username]\texmf\tex\latex\hebrew-academic-template\
# Run: initexmf --update-fndb
```

#### Error: "Missing $ inserted"

**Cause:** Math mode issue with Hebrew

**Solution:**
```latex
% Wrong:
המשוואה x^2 + y^2 = 1

% Correct:
המשוואה $x^2 + y^2 = 1$
```

#### Error: "Package babel Error: Unknown language 'hebrew'"

**Cause:** Using babel instead of polyglossia

**Solution:**
```latex
% Don't use babel with this template
% polyglossia is loaded automatically
```

### Font Issues

#### Problem: Hebrew Text Shows as Boxes □□□

**Cause:** Missing Hebrew fonts

**Solutions:**
```bash
# Linux
sudo apt-get install culmus fonts-dejavu

# Windows
# Download and install Culmus fonts

# macOS
brew install --cask font-dejavu
```

#### Problem: Font Size Inconsistent

**Solution:**
```latex
% Adjust Hebrew font scaling
\newfontfamily\hebrewfont{David CLM}[
    Scale=1.1  % Increase size by 10%
]
```

### Bibliography Issues

#### Problem: Citations Show as [?]

**Cause:** Bibliography not processed

**Solution:**
```bash
# Must use biber, not bibtex
lualatex document
biber document    # NOT bibtex!
lualatex document
lualatex document
```

#### Problem: Empty Bibliography

**Cause:** Missing keywords in .bib file

**Solution:**
```bibtex
% In your .bib file:
@article{example2025,
  author = {Author, Name},
  title = {Title},
  journal = {Journal},
  year = {2025},
  keywords = {english}  % or {hebrew}
}
```

### Direction Issues

#### Problem: Numbers Appear Reversed (321 instead of 123)

**Cause:** Not using `\num{}` command

**Solution:**
```latex
% Wrong:
יש לנו 123 דוגמאות

% Correct:
יש לנו \num{123} דוגמאות
```

#### Problem: English Text Appears RTL

**Cause:** Not using `\en{}` command

**Solution:**
```latex
% Wrong:
הטכנולוגיה של Machine Learning

% Correct:
הטכנולוגיה של \en{Machine Learning}
```

#### Problem: Mixed Content in Tables Not Aligned

**Cause:** Not using cell commands

**Solution:**
```latex
% Wrong:
טקסט עברי & English text & 123

% Correct:
\hebcell{טקסט עברי} & \encell{English text} & \num{123}
```

### Table Issues

#### Problem: Table Columns Appear in Wrong Order

**Cause:** Not accounting for RTL ordering

**Solution:**
```latex
% Columns in rtltabular appear right-to-left
\begin{rtltabular}{|r|c|l|}
  Column 3 & Column 2 & Column 1 \\  % Rightmost first
\end{rtltabular}
```

#### Problem: Hebrew Caption Not Right-Aligned

**Cause:** Using v3.0 instead of v5.0

**Solution:**
Ensure using v5.0 which has the fix:
```latex
% Check version
\clsversion  % Should output: V05-2025-11-09
```

### Code Block Issues

#### Problem: Hebrew in Code Causes Errors

**Cause:** Hebrew characters in pythonbox

**Solution:**
```latex
% Wrong:
\begin{pythonbox}
# הערה בעברית  # This breaks compilation!
print("שלום")   # This also breaks!
\end{pythonbox}

% Correct:
\begin{pythonbox}
# English comments only
print("Hello")  # ASCII only
\end{pythonbox}
```

#### Problem: Code Overflows Page

**Cause:** Using pythonbox for long code

**Solution:**
```latex
% Use pythonbox* for long code
\begin{pythonbox*}[Long Code]
# Very long code
# Can break across pages
# Won't overflow
\end{pythonbox*}
```

### PDF Issues

#### Problem: "destination with the same identifier"

**Cause:** Missing `\phantomsection`

**Solution:**
Already fixed in v5.0. Ensure using latest version.

#### Problem: PDF Bookmarks Show Wrong Text

**Cause:** Commands in section titles

**Solution:**
```latex
% Use \texorpdfstring
\hebrewsection{\texorpdfstring{טקסט עם \en{English}}{Hebrew with English}}
```

### Cross-Reference Issues

#### Problem: References Show as ??

**Cause:** Need additional compilation

**Solution:**
```bash
# Compile multiple times
lualatex document
lualatex document  # Updates references
```

#### Problem: Wrong Reference Numbers

**Cause:** Label placement

**Solution:**
```latex
% Correct order:
\begin{figure}
  \centering
  \includegraphics{image}
  \caption{Caption}
  \label{fig:mylabel}  % After \caption
\end{figure}
```

---

## FAQ

### General Questions

**Q: Why use LuaLaTeX instead of pdfLaTeX?**

A: LuaLaTeX provides:
- Native Unicode support (essential for Hebrew)
- Advanced bidirectional text algorithms
- Better font handling with fontspec
- Modern TeX engine with Lua scripting

**Q: Can I use this template with Overleaf?**

A: Yes! Steps:
1. Upload `hebrew-academic-template.cls` to your project
2. Set compiler to LuaLaTeX (Menu → Compiler)
3. Use normally

**Q: Is the template compatible with XeLaTeX?**

A: Partially. XeLaTeX works but LuaLaTeX is recommended for:
- Better bidi support
- Faster compilation
- Better Hebrew line breaking

**Q: Can I use this for commercial documents?**

A: Yes, with attribution. See LICENSE file.

### Setup Questions

**Q: How do I install on Windows without admin rights?**

A: Install in user directory:
```powershell
# Create user texmf
mkdir %APPDATA%\MiKTeX\tex\latex\hebrew-academic-template

# Copy class file
copy hebrew-academic-template.cls %APPDATA%\MiKTeX\tex\latex\hebrew-academic-template\

# Update database
initexmf --update-fndb
```

**Q: How do I know which version I'm using?**

A: Check in your document:
```latex
Template version: \clsversion  % Outputs: V05-2025-11-09
```

### Language Questions

**Q: How do I add Arabic or other RTL languages?**

A: Add to preamble:
```latex
\setotherlanguage{arabic}
\newfontfamily\arabicfont{Amiri}[Script=Arabic]

% Usage
\begin{arabic}
النص العربي
\end{arabic}
```

**Q: Can I use Hebrew vowels (nikud)?**

A: Yes, they work automatically:
```latex
הַמִּלָּה עִם נִקּוּד
```

**Q: How do I type Hebrew in my editor?**

A: Configure your editor:
- VS Code: Install Hebrew language pack
- TeXstudio: Enable bidirectional text
- Emacs: Use hebrew-mode
- Vim: Set encoding=utf-8

### Table Questions

**Q: How do I create a table with both Hebrew and English headers?**

A: Use mixed headers:
```latex
\begin{rtltabular}{|c|c|c|}
  \hline
  \hebheader{עברית} & \enheader{English} & \hebheader{מעורב \en{Mixed}} \\
  \hline
\end{rtltabular}
```

**Q: How do I align numbers in table columns?**

A: Use `r` alignment and `\num{}`:
```latex
\begin{rtltabular}{|l|r|}
  \hline
  \hebcell{שם} & \multicolumn{1}{c|}{\hebheader{ערך}} \\
  \hline
  \hebcell{ראשון} & \num{1,234} \\
  \hebcell{שני} & \num{56} \\
  \hline
\end{rtltabular}
```

### Math Questions

**Q: How do I write Hebrew variable names in equations?**

A: Use `\hebmath{}`:
```latex
$$\hebmath{מהירות} = \frac{\hebmath{מרחק}}{\hebmath{זמן}}$$
```

**Q: How do I number equations in Hebrew?**

A: Numbering is automatic:
```latex
\begin{equation}
E = mc^2
\end{equation}
```

### Code Questions

**Q: Can I include code in other languages?**

A: Yes, modify pythonbox:
```latex
% In preamble
\newtcblisting{javascriptbox}[1][]{
  listing engine=listings,
  listing options={language=JavaScript},
  % ... rest same as pythonbox
}
```

**Q: How do I include external code files?**

A: Use listings:
```latex
\lstinputlisting[language=Python]{code/myfile.py}
```

### Bibliography Questions

**Q: How do I use a different citation style?**

A: Change in class file or preamble:
```latex
\usepackage[backend=biber,style=apa]{biblatex}  % APA style
```

**Q: Can I use BibTeX instead of Biber?**

A: Not recommended. Biber has better Unicode support. If necessary:
```latex
% Change in class file line with biblatex
backend=bibtex  % Instead of backend=biber
```

### Customization Questions

**Q: How do I change margins?**

A: Add to preamble:
```latex
\geometry{margin=3cm}  % All margins 3cm
% or
\geometry{left=2.5cm,right=2cm,top=3cm,bottom=3cm}
```

**Q: How do I change line spacing?**

A: Use setspace commands:
```latex
\singlespacing    % 1.0
\onehalfspacing   % 1.5 (default)
\doublespacing    % 2.0
```

**Q: How do I add a watermark?**

A: Use draftwatermark:
```latex
\usepackage{draftwatermark}
\SetWatermarkText{טיוטה}
\SetWatermarkScale{1}
```

---

## Complete Command Index

### Alphabetical Command Reference

| Command | Category | Page | Description |
|---------|----------|------|-------------|
| `\argmax` | Math | [43](#42-argmax) | Argmax operator |
| `\argmin` | Math | [42](#42-argmin) | Argmin operator |
| `\checksymbol` | Symbols | [56](#56-checksymbol) | Checkmark ✓ |
| `\clsversion` | Utility | [58](#58-clsversion) | Template version |
| `\code{}` | Code | [34](#34-code) | Inline code |
| `\courierfont` | Code | [38](#38-courierfont) | Courier font |
| `\en{}` | Text | [1](#1-en) | English in Hebrew |
| `\encell{}` | Tables | [26](#26-encell) | English cell |
| `\englishsection{}` | Sections | [18](#18-englishsection) | English section |
| `\englishterm{}` | Code | [35](#35-englishterm) | Technical term |
| `\englishtitle{}` | Title | [51](#51-englishtitle) | English title |
| `\enheader{}` | Tables | [28](#28-enheader) | English header |
| `\enpath{}` | Code | [36](#36-enpath) | File paths |
| `\heb{}` | Text | [2](#2-heb) | Hebrew in English |
| `\hebcell{}` | Tables | [24](#24-hebcell) | Hebrew cell |
| `\hebheader{}` | Tables | [27](#27-hebheader) | Hebrew header |
| `\hebmath{}` | Math | [39](#39-hebmath) | Hebrew in math |
| `\hebrewauthor{}` | Title | [52](#52-hebrewauthor) | Author name |
| `\hebrewchapter{}` | Sections | [16](#16-hebrewchapter) | Book chapter |
| `\hebrewfigure` | Figures | [30](#30-hebrewfigure) | Hebrew figure |
| `\hebrewsection{}` | Sections | [17](#17-hebrewsection) | Hebrew section |
| `\hebrewsubsection{}` | Sections | [19](#19-hebrewsubsection) | Hebrew subsection |
| `\HebrewSubtitle{}` | Sections | [21](#21-hebrewsubtitle) | Format subtitle |
| `\hebrewtitle{}` | Title | [50](#50-hebrewtitle) | Hebrew title |
| `\HebrewTitle{}` | Sections | [20](#20-hebrewtitle) | Format title |
| `\hebrewversion{}` | Title | [53](#53-hebrewversion) | Document version |
| `\hebsub{}` | Math | [40](#40-hebsub) | Hebrew subscript |
| `\hebtextmath{}` | Math | [41](#41-hebtextmath) | Legacy Hebrew math |
| `\hebyear{}` | Text | [6](#6-hebyear) | Years in Hebrew |
| `\Hitem{}` | Lists | [57](#57-hitem) | Hebrew list item |
| `\ilm{}` | Text | [3](#3-ilm) | Inline LTR |
| `\listingfont` | Code | [37](#37-listingfont) | Listing font |
| `\ltr{}` | Text | [7](#7-ltr) | Protect LTR |
| `\LTR{}` | Text | [8](#8-ltr-uppercase) | Force LTR |
| `\ltrnumber{}` | Bibliography | [49](#49-ltrnumber) | LTR numbers |
| `\maketitle` | Title | [54](#54-maketitle) | Generate title |
| `\mixedcell{}` | Tables | [25](#25-mixedcell) | Mixed cell (alias) |
| `\num{}` | Text | [4](#4-num) | Numbers in Hebrew |
| `\percent{}` | Text | [5](#5-percent) | Percentages |
| `\printenglishbibliography` | Bibliography | [48](#48-printenglishbibliography) | English references |
| `\printhebrewbibliography` | Bibliography | [47](#47-printhebrewbibliography) | Hebrew references |
| `\rarrow` | Math | [46](#46-rarrow) | RTL arrow |
| `\Rsquared` | Math | [44](#44-rsquared) | R² symbol |
| `\RTL{}` | Text | [9](#9-rtl) | Force RTL |
| `\rtlrow{}` | Tables | [29](#29-rtlrow) | Auto-reverse columns |
| `\Rtwo` | Math | [45](#45-rtwo) | R² alternative |
| `\selectlanguage{}` | Text | [15](#15-selectlanguage) | Switch language |
| `\startenglish` | Text | [10](#10-startenglish) | Begin English |
| `\stopenglish` | Text | [11](#11-stopenglish) | End English |
| `\stophebrew` | Text | [12](#12-stophebrew) | Return to Hebrew |
| `\textenglish{}` | Text | [13](#13-textenglish) | Polyglossia English |
| `\texthebrew{}` | Text | [14](#14-texthebrew) | Polyglossia Hebrew |
| `\warningsymbol` | Symbols | [55](#55-warningsymbol) | Warning triangle |

### Commands by Category

#### Text Direction (15 commands)
- Basic: `\en{}`, `\heb{}`, `\ilm{}`
- Numbers: `\num{}`, `\percent{}`, `\hebyear{}`
- Protection: `\ltr{}`, `\LTR{}`, `\RTL{}`
- Sections: `\startenglish`, `\stopenglish`, `\stophebrew`
- Polyglossia: `\textenglish{}`, `\texthebrew{}`, `\selectlanguage{}`

#### Sections (6 commands)
- Chapter: `\hebrewchapter{}`
- Sections: `\hebrewsection{}`, `\englishsection{}`, `\hebrewsubsection{}`
- Helpers: `\HebrewTitle{}`, `\HebrewSubtitle{}`

#### Tables (8 commands)
- Environments: `hebrewtable`, `rtltabular`
- Cells: `\hebcell{}`, `\mixedcell{}`, `\encell{}`
- Headers: `\hebheader{}`, `\enheader{}`
- Utility: `\rtlrow{}`

#### Figures (2 commands)
- Command: `\hebrewfigure`
- Environment: `hebrewfigure`

#### Code (7 commands)
- Environments: `pythonbox`, `pythonbox*`
- Inline: `\code{}`, `\englishterm{}`
- Paths: `\enpath{}`
- Fonts: `\listingfont`, `\courierfont`

#### Math (8 commands)
- Hebrew: `\hebmath{}`, `\hebsub{}`, `\hebtextmath{}`
- Operators: `\argmin`, `\argmax`
- Symbols: `\Rsquared`, `\Rtwo`, `\rarrow`

#### Bibliography (3 commands)
- Display: `\printhebrewbibliography`, `\printenglishbibliography`
- Utility: `\ltrnumber{}`

#### Title Page (5 commands)
- Define: `\hebrewtitle{}`, `\englishtitle{}`, `\hebrewauthor{}`
- Version: `\hebrewversion{}`
- Generate: `\maketitle`

#### Symbols (2 commands)
- `\warningsymbol`, `\checksymbol`

#### Lists (1 command)
- `\Hitem{}`

#### Utility (1 command)
- `\clsversion`

---

## Summary

This comprehensive guide documents all 78 commands and 8 environments of the Hebrew Academic Template v5.0. The template provides:

- **Complete RTL/LTR Support:** 15 text direction commands
- **Professional Structure:** 6 section commands with chapter support
- **Advanced Tables:** 8 specialized table commands
- **Code Integration:** 7 commands for code and listings
- **Mathematical Excellence:** 8 math-specific commands
- **Bibliography Management:** Full biber integration
- **Cross-Platform:** Works on Windows, Linux, and macOS
- **100% Backward Compatible:** All v1.0 and v3.0 documents work unchanged

For quick reference, use the [Complete Command Index](#complete-command-index). For detailed examples, see each command's documentation section.

---

**Hebrew Academic Template v5.0 Usage Guide**
**Version:** 1.0.0
**Last Updated:** November 9, 2025
**Total Lines:** ~3500

*The definitive reference for Hebrew academic document preparation in LaTeX*