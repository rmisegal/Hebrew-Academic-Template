# Hebrew Academic Template v5.0 - Mixed Content Guide

**Comprehensive RTL/LTR Content Mixing Rules and Best Practices**

**Copyright:** © 2025 Dr. Segal Yoram. All rights reserved.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Fundamental Rules](#fundamental-rules)
3. [Text Direction Commands](#text-direction-commands)
4. [Number Formatting](#number-formatting)
5. [Section Headings](#section-headings)
6. [Tables and Mixed Content](#tables-and-mixed-content)
7. [Footnotes in RTL](#footnotes-in-rtl)
8. [Mathematical Expressions](#mathematical-expressions)
9. [Code Blocks](#code-blocks)
10. [Bibliography and Citations](#bibliography-and-citations)
11. [Common Mistakes](#common-mistakes)
12. [Visual Examples](#visual-examples)
13. [Quick Reference](#quick-reference)

---

## Introduction

Writing Hebrew academic documents with English integration requires careful attention to text direction. This guide provides comprehensive rules and patterns for mixing Hebrew (RTL) and English (LTR) content professionally.

### Why Mixed Content Matters

Hebrew academic documents frequently contain:
- English technical terms and abbreviations
- Mathematical formulas (always LTR)
- Numbers and dates (must be LTR)
- Citations and references
- Code snippets
- Mixed-language tables

Without proper handling, these elements can appear reversed, misaligned, or broken.

---

## Fundamental Rules

### The Golden Rules of RTL/LTR

1. **ALWAYS wrap English in Hebrew context:** Use `\en{}`
2. **ALWAYS wrap numbers:** Use `\num{}`, `\percent{}`, or `\hebyear{}`
3. **NEVER mix directions without commands:** The bidi algorithm will fail
4. **ALWAYS test PDF output:** Editor preview may differ from final PDF
5. **BE CONSISTENT:** Use the same patterns throughout

### Direction Hierarchy

```
Document (Hebrew RTL)
├── Hebrew paragraphs (RTL)
│   ├── Hebrew text (RTL)
│   ├── \en{English} (LTR)
│   ├── \num{123} (LTR)
│   └── $math$ (LTR)
├── English sections (LTR)
│   ├── English text (LTR)
│   ├── \heb{עברית} (RTL)
│   └── $math$ (LTR)
└── Tables (Special rules)
    ├── \hebcell{} (RTL base)
    └── \encell{} (LTR base)
```

---

## Text Direction Commands

### Basic Language Switching

#### Rule 1: English in Hebrew Context

**❌ WRONG:**
```latex
המחקר בתחום Machine Learning מתקדם במהירות
```
Result: "Machine Learning" may appear reversed or broken

**✅ CORRECT:**
```latex
המחקר בתחום \en{Machine Learning} מתקדם במהירות
```

#### Rule 2: Multiple English Terms

**❌ WRONG:**
```latex
הטכנולוגיות של AI, ML ו-Deep Learning
```

**✅ CORRECT:**
```latex
הטכנולוגיות של \en{AI}, \en{ML} ו-\en{Deep Learning}
```

**✅ BETTER:**
```latex
הטכנולוגיות של \en{AI, ML} ו-\en{Deep Learning}
```

#### Rule 3: English with Hebrew Articles

**Pattern:**
```latex
ה-\en{CPU} (the CPU)
ב-\en{GPU} (in/with GPU)
מ-\en{RAM} (from RAM)
```

### Advanced Patterns

#### Mixed Acronyms

```latex
\en{NASA} (נאס"א)
\en{FBI} (אף-בי-איי)
מכון \en{MIT}
אוניברסיטת \en{Harvard}
```

#### Software and Commands

```latex
השתמש בפקודה \code{git commit}
התוכנה \en{Python 3.9}
מערכת ההפעלה \en{Ubuntu Linux}
```

#### Author Names and Citations

```latex
המחקר של \en{Smith et al.} מ-\hebyear{2023}
לפי \en{Johnson} (\hebyear{2024})
```

---

## Number Formatting

### Rule 1: All Numbers Need Protection

**❌ WRONG:**
```latex
המחקר כלל 1234 משתתפים
```
Result: May display as 4321 in RTL

**✅ CORRECT:**
```latex
המחקר כלל \num{1234} משתתפים
```

### Number Types and Commands

| Type | Command | Example | Output |
|------|---------|---------|--------|
| Integer | `\num{}` | `\num{1000}` | 1000 |
| Decimal | `\num{}` | `\num{3.14159}` | 3.14159 |
| Percentage | `\percent{}` | `\percent{95.5}` | 95.5% |
| Year | `\hebyear{}` | `\hebyear{2025}` | 2025 |
| Range | `\num{}-\num{}` | `\num{10}-\num{20}` | 10-20 |
| Scientific | `\num{}` | `\num{6.02e23}` | 6.02×10²³ |

### Complex Number Patterns

#### Dates and Times
```latex
בתאריך \num{15.11.2025}
בשעה \num{14:30}
במשך \num{3} שעות ו-\num{45} דקות
```

#### Units and Measurements
```latex
מהירות של \num{100} \en{km/h}
טמפרטורה של \num{25} \en{°C}
גודל של \num{512} \en{MB}
```

#### Mathematical Context
```latex
הערך של $\pi \approx \num{3.14159}$
התוצאה היא \num{42} (התשובה לכל דבר)
```

---

## Section Headings

### The Universal Pattern

**ALWAYS use bilingual headings:**

```latex
\hebrewsection{כותרת בעברית: \entoc{English Title}}
\hebrewsubsection{תת כותרת: \entoc{Subtitle}}
```

### Why `\entoc{}`?

The `\entoc{}` command ensures:
1. Proper TOC rendering
2. PDF bookmark compatibility
3. Searchable English text
4. Professional appearance

### Examples by Document Type

#### Research Paper
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\hebrewsection{סקירת ספרות: \entoc{Literature Review}}
\hebrewsection{מתודולוגיה: \entoc{Methodology}}
\hebrewsection{תוצאות: \entoc{Results}}
\hebrewsection{דיון: \entoc{Discussion}}
\hebrewsection{מסקנות: \entoc{Conclusions}}
```

#### Technical Documentation
```latex
\hebrewsection{דרישות מערכת: \entoc{System Requirements}}
\hebrewsection{התקנה: \entoc{Installation}}
\hebrewsection{תצורה: \entoc{Configuration}}
\hebrewsection{פתרון בעיות: \entoc{Troubleshooting}}
```

#### Thesis Chapters
```latex
\hebrewchapter{רקע תיאורטי}  % Chapter - Hebrew only
\hebrewsection{מושגי יסוד: \entoc{Basic Concepts}}  % Section - bilingual
\hebrewsubsection{הגדרות: \entoc{Definitions}}  % Subsection - bilingual
```

---

## Tables and Mixed Content

### Table Structure Rules

#### Rule 1: RTL Column Order
```latex
\begin{rtltabular}{|c|c|c|}
  % Columns appear: [Column 3] [Column 2] [Column 1]
  % Write them in reverse order:
  Col3 & Col2 & Col1 \\
\end{rtltabular}
```

#### Rule 2: Cell Content Commands

**For Hebrew/Mixed cells:**
```latex
\hebcell{טקסט עברי עם \en{English} ומספר \num{123}}
```

**For English-only cells:**
```latex
\encell{Pure English text}
```

**For numbers only:**
```latex
\num{123}  % No cell wrapper needed
```

### Complete Table Example

```latex
\begin{hebrewtable}[h]
\caption{תוצאות הניסוי: \en{Experimental Results}}
\label{tab:results}
\begin{rtltabular}{|m{3cm}|m{2cm}|m{2cm}|m{2cm}|}
\hline
\textbf{\hebheader{פרמטר}} &
\textbf{\hebheader{ערך ראשוני}} &
\textbf{\hebheader{ערך סופי}} &
\textbf{\enheader{Change}} \\
\hline
\hebcell{טמפרטורה (\en{°C})} & \num{20} & \num{80} & \en{+60} \\
\hebcell{לחץ (\en{kPa})} & \num{101.3} & \num{202.6} & \en{×2} \\
\hebcell{זמן (\en{min})} & \num{0} & \num{30} & \en{+30} \\
\hline
\hebcell{דיוק כולל} & \percent{85.5} & \percent{94.2} & \en{+8.7\%} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

### Mixed Headers Pattern

```latex
\begin{rtltabular}{|c|c|c|}
\hline
\multicolumn{3}{|c|}{\textbf{\hebcell{כותרת ראשית: \en{Main Header}}}} \\
\hline
\textbf{\hebheader{עברית}} &
\textbf{\enheader{English}} &
\textbf{\hebheader{מעורב \en{Mixed}}} \\
\hline
\end{rtltabular}
```

---

## Footnotes in RTL

### Basic Footnote Rules

#### Rule 1: No Space Before \footnote
```latex
% ❌ WRONG:
מילה \footnote{הערת שוליים}

% ✅ CORRECT:
מילה\footnote{הערת שוליים}
```

#### Rule 2: Mixed Content in Footnotes
```latex
טקסט\footnote{הסבר בעברית עם מונח \en{English term} ומספר \num{42}}
```

### Complex Footnote Examples

#### Academic Citation Footnote
```latex
מחקרים רבים\footnote{ראו \en{Smith et al.} (\hebyear{2023}),
\en{Johnson} (\hebyear{2024}), ומחקרים נוספים בתחום
\en{Machine Learning} שפורסמו לאחרונה.} הראו...
```

#### Explanatory Footnote
```latex
האלגוריתם\footnote{%
  אלגוריתם \en{K-means} הוא שיטת \en{clustering}
  לא מפוקחת שמחלקת נתונים ל-\num{k} קבוצות.
  ראו פרק \ref{chap:clustering} להרחבה.%
} משמש...
```

#### Translation Footnote
```latex
המושג קורלציה\footnote{\en{Correlation} -
מדד סטטיסטי המתאר את הקשר הליניארי בין
שני משתנים, נע בין \num{-1} ל-\num{1}.} חשוב...
```

---

## Mathematical Expressions

### Math Direction Rules

#### Rule 1: Math is Always LTR
```latex
% Inline math
הנוסחה $E = mc^2$ מפורסמת

% Display math
\begin{equation}
f(x) = ax^2 + bx + c
\end{equation}
```

#### Rule 2: Hebrew in Math
```latex
% Use \hebmath{} for Hebrew text in math
$$
\text{מהירות} = \frac{\text{מרחק}}{\text{זמן}}
$$

% Better with \hebmath{}:
$$
\hebmath{מהירות} = \frac{\hebmath{מרחק}}{\hebmath{זמן}}
$$
```

### Complex Math Examples

#### Piecewise Functions
```latex
$$
f(x) = \begin{cases}
  x^2 & \hebmath{אם} \; x > 0 \\
  0 & \hebmath{אם} \; x = 0 \\
  -x^2 & \hebmath{אחרת}
\end{cases}
$$
```

#### Hebrew Subscripts
```latex
$$
V_{\hebsub{מקסימום}} = \num{100} \; \en{m/s}
$$

$$
P_{\hebsub{התחלה}} = P_0 \cdot e^{-\lambda t}
$$
```

#### Optimization Problems
```latex
\begin{equation}
\begin{aligned}
\hebmath{מצא:} \quad & \max_{x,y} f(x,y) \\
\hebmath{בכפוף ל:} \quad & g(x,y) \leq 0 \\
& h(x,y) = 0 \\
& x, y \geq 0
\end{aligned}
\end{equation}
```

---

## Code Blocks

### Critical Rules for Code

#### Rule 1: NO Hebrew in Code
```latex
% ❌ WRONG - Will cause compilation errors:
\begin{pythonbox}
# הגדרת משתנים  # ERROR!
שם = "ישראל"      # ERROR!
print("שלום")     # ERROR!
\end{pythonbox}

% ✅ CORRECT - English only:
\begin{pythonbox}
# Define variables
name = "Israel"  # English comments only
print("Hello")   # ASCII characters only
\end{pythonbox}
```

#### Rule 2: Bilingual Titles OK
```latex
\begin{pythonbox}[אלגוריתם מיון: \en{Sorting Algorithm}]
def quicksort(arr):
    # Implementation here
    pass
\end{pythonbox}
```

### Code Block Patterns

#### Machine Learning Example
```latex
\begin{pythonbox}[מודל למידה: \en{Learning Model}]
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

# Load data
X, y = load_data()

# Split dataset
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Train model
model = LogisticRegression()
model.fit(X_train, y_train)

# Evaluate
accuracy = model.score(X_test, y_test)
print(f"Accuracy: {accuracy:.2%}")
\end{pythonbox}
```

#### Long Code (Non-floating)
```latex
\begin{pythonbox*}[Long Implementation]
# Very long code that should not float
# Will stay in place and can break across pages
class NeuralNetwork:
    def __init__(self, layers):
        self.layers = layers
        # ... 100+ lines of code ...
\end{pythonbox*}
```

---

## Bibliography and Citations

### Citation Patterns

#### Basic Citation
```latex
מחקרים רבים \cite{smith2023,johnson2024} הראו...
```

#### Author Name Citation
```latex
לפי \en{Smith} \cite{smith2023}, התוצאות...
```

#### Multiple Authors
```latex
\en{Smith et al.} \cite{smith2023} טוענים...
```

#### Page Numbers
```latex
\cite[עמ' 45-47]{smith2023}  % Hebrew pages
\cite[pp. 45-47]{smith2023}  % English pages
```

### Bibliography Entry Formatting

In your `.bib` file:

```bibtex
@article{cohen2025,
  author = {Cohen, David and Levy, Sarah},
  title = {מחקר על למידת מכונה},  % Hebrew title OK
  journal = {כתב העת לבינה מלאכותית},
  year = {2025},
  keywords = {hebrew}  % Critical for filtering
}

@article{smith2023,
  author = {Smith, John and Johnson, Mary},
  title = {Deep Learning for NLP},
  journal = {Journal of AI Research},
  year = {2023},
  keywords = {english}  % Critical for filtering
}
```

### Bibliography Display

```latex
% Separate Hebrew and English bibliographies
\newpage
\printhebrewbibliography   % Hebrew sources
\printenglishbibliography  % English sources
```

---

## Common Mistakes

### Top 10 Mistakes to Avoid

#### 1. Missing \en{} for English
```latex
❌ טקסט עברי עם Machine Learning
✅ טקסט עברי עם \en{Machine Learning}
```

#### 2. Missing \num{} for Numbers
```latex
❌ יש לנו 1000 דוגמאות
✅ יש לנו \num{1000} דוגמאות
```

#### 3. Space Before Footnote
```latex
❌ מילה \footnote{הערה}
✅ מילה\footnote{הערה}
```

#### 4. Hebrew in Code
```latex
❌ \begin{pythonbox}
   # הערה בעברית
   \end{pythonbox}
✅ \begin{pythonbox}
   # English comment
   \end{pythonbox}
```

#### 5. Missing \entoc{} in Sections
```latex
❌ \hebrewsection{רקע תיאורטי}
✅ \hebrewsection{רקע תיאורטי: \entoc{Theoretical Background}}
```

#### 6. Wrong Table Cell Commands
```latex
❌ טקסט עברי עם \en{English}  % In table
✅ \hebcell{טקסט עברי עם \en{English}}  % In table
```

#### 7. Punctuation Inside \en{}
```latex
❌ המחקר של \en{Smith.}
✅ המחקר של \en{Smith}.
```

#### 8. Mixed Direction Without Protection
```latex
❌ הביטוי (a+b) מייצג
✅ הביטוי \ltr{(a+b)} מייצג
```

#### 9. Wrong Bibliography Backend
```latex
❌ bibtex document  # Command line
✅ biber document   # Command line
```

#### 10. Incomplete Compilation
```latex
❌ lualatex document  # Once only
✅ lualatex && biber && lualatex && lualatex  # Full cycle
```

---

## Visual Examples

### Example 1: Research Abstract

```latex
\hebrewsection{תקציר: \entoc{Abstract}}

המחקר הנוכחי בוחן את היישום של אלגוריתמי \en{Deep Learning}
לעיבוד שפה טבעית בעברית. במהלך \num{6} חודשים, נאספו
\num{50,000} דוגמאות טקסט ממקורות שונים. המודל השיג
דיוק של \percent{92.3} במשימת סיווג הטקסטים.

השימוש בארכיטקטורת \en{Transformer} (\en{Vaswani et al.},
\hebyear{2017}) אפשר שיפור משמעותי ביחס למודלים
מסורתיים של \en{LSTM} ו-\en{GRU}. התוצאות מראות
כי גישת \en{attention mechanism} מתאימה במיוחד
לעיבוד טקסט עברי, בשל המבנה המורפולוגי העשיר של השפה.
```

### Example 2: Technical Specification

```latex
\hebrewsection{מפרט טכני: \entoc{Technical Specifications}}

\begin{hebrewtable}[h]
\caption{דרישות מערכת: \en{System Requirements}}
\begin{rtltabular}{|m{4cm}|m{3cm}|m{3cm}|}
\hline
\textbf{\hebheader{רכיב}} &
\textbf{\hebheader{מינימום}} &
\textbf{\hebheader{מומלץ}} \\
\hline
\hebcell{מעבד} &
\encell{Intel i5} &
\encell{Intel i7/i9} \\
\hebcell{זיכרון \en{RAM}} &
\num{8} \en{GB} &
\num{16} \en{GB} \\
\hebcell{כרטיס מסך} &
\encell{NVIDIA GTX 1060} &
\encell{NVIDIA RTX 3080} \\
\hebcell{אחסון} &
\num{256} \en{GB SSD} &
\num{512} \en{GB NVMe} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

### Example 3: Algorithm Description

```latex
\hebrewsection{האלגוריתם: \entoc{The Algorithm}}

אלגוריתם \en{K-means} עובד בשלבים הבאים:

\begin{enumerate}
\item אתחול \num{k} מרכזים באופן אקראי
\item עבור כל נקודה:
  \begin{itemize}
  \item חשב מרחק לכל המרכזים
  \item שייך לקבוצה של המרכז הקרוב ביותר
  \end{itemize}
\item עדכן מרכזים: $\mu_j = \frac{1}{|C_j|}\sum_{x \in C_j} x$
\item חזור על שלבים \num{2}-\num{3} עד התכנסות
\end{enumerate}

\begin{pythonbox}[יישום: \en{Implementation}]
from sklearn.cluster import KMeans
import numpy as np

# Generate sample data
X = np.random.randn(1000, 2)

# Apply K-means with k=3
kmeans = KMeans(n_clusters=3, random_state=42)
labels = kmeans.fit_predict(X)

# Get cluster centers
centers = kmeans.cluster_centers_
print(f"Converged in {kmeans.n_iter_} iterations")
\end{pythonbox}
```

---

## Quick Reference

### Essential Commands Cheat Sheet

| Context | Command | Example |
|---------|---------|---------|
| English in Hebrew | `\en{}` | `טקסט \en{English} עברי` |
| Numbers | `\num{}` | `יש \num{100} דוגמאות` |
| Percentage | `\percent{}` | `דיוק של \percent{95.5}` |
| Year | `\hebyear{}` | `בשנת \hebyear{2025}` |
| Section | `\hebrewsection{}` | `\hebrewsection{כותרת: \entoc{Title}}` |
| Table cell (Hebrew) | `\hebcell{}` | `\hebcell{טקסט מעורב}` |
| Table cell (English) | `\encell{}` | `\encell{English only}` |
| Code inline | `\code{}` | `הפקודה \code{print()}` |
| Citation | `\cite{}` | `מחקרים \cite{key}` |
| Math Hebrew | `\hebmath{}` | `$\hebmath{משתנה}$` |

### Compilation Commands

```bash
# Full compilation with bibliography
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex

# Quick check (no bibliography)
lualatex document.tex

# Clean auxiliary files
rm *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml
```

### Decision Tree for Mixed Content

```
Is it English in Hebrew text?
├── YES → Use \en{English}
└── NO → Is it a number?
    ├── YES → Is it a percentage?
    │   ├── YES → Use \percent{95}
    │   └── NO → Is it a year?
    │       ├── YES → Use \hebyear{2025}
    │       └── NO → Use \num{123}
    └── NO → Is it in a table cell?
        ├── YES → Mostly Hebrew?
        │   ├── YES → Use \hebcell{}
        │   └── NO → Use \encell{}
        └── NO → Is it in math?
            ├── YES → Use \hebmath{} or \hebsub{}
            └── NO → Use plain text
```

---

## Summary

This guide provides comprehensive rules for mixing Hebrew and English content in academic documents. Key takeaways:

1. **Always wrap English** with `\en{}`
2. **Always wrap numbers** with appropriate commands
3. **Use bilingual section headings** with `\entoc{}`
4. **Apply table cell commands** for proper alignment
5. **Keep code blocks English-only**
6. **Test PDF output** to verify direction

Following these patterns ensures professional, properly formatted Hebrew academic documents with seamless English integration.

---

**Mixed Content Guide v5.0**
**Last Updated:** November 9, 2025
**Total Lines:** ~1200

*Professional Hebrew-English mixing for academic excellence*