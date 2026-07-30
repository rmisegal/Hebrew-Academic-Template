# AGENT C: TEX Usage Patterns Analysis
## CLS Command Usage Patterns in Real Documents

**Analysis Date:** 2025-11-09
**Analyzed Files:** 6 TEX documents
**Agent:** Agent C - TEX Pattern Analyzer

---

## 1. SECTION COMMANDS

### 1.1 \hebrewsection{Hebrew Text: \entoc{English}}

**Primary Usage Pattern:**
```latex
\hebrewsection{עברית: \entoc{English Translation}}
```

**Real Examples:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\hebrewsection{תוצאות: \entoc{Results}}
\hebrewsection{מסקנות: \entoc{Conclusions}}
\hebrewsection{דוגמאות מתקדמות: \entoc{Advanced Examples}}
```

**Key Pattern:** ALWAYS include English translation using `\entoc{}` for TOC

**Variant (beginner_example.tex):**
```latex
\hebrewsection{מבוא: \en{Introduction}}  % Uses \en{} instead of \entoc{}
```

**Important Note:** Intermediate and advanced examples use `\entoc{}` specifically for TOC entries, while beginner uses `\en{}`. The `\entoc{}` is the recommended pattern.

### 1.2 \hebrewsubsection{Hebrew: \entoc{English}}

**Primary Usage Pattern:**
```latex
\hebrewsubsection{Hebrew: \entoc{English Translation}}
```

**Real Examples:**
```latex
\hebrewsubsection{מתודולוגיה: \entoc{Methodology}}
\hebrewsubsection{ניתוח נתונים: \entoc{Data Analysis}}
\hebrewsubsection{קוד לדוגמה: \entoc{Example Code}}
\hebrewsubsection{איור לדוגמה: \entoc{Example Figure}}
\hebrewsubsection{רשימות: \entoc{Lists}}
\hebrewsubsection{טבלה מורכבת: \entoc{Complex Table}}
```

**Consistency:** Same pattern as section - Hebrew text, colon, `\entoc{}` wrapper

### 1.3 \hebrewchapter{} - Book-Level Documents

**Usage Pattern:**
```latex
\hebrewchapter{Hebrew Title Without English Translation}
```

**Real Example (chapter01.tex):**
```latex
\hebrewchapter{מבוא ומוטיבציה: כאשר החיים הם שאלה של כן או לא}
```

**Key Observation:** Chapters do NOT include `\entoc{}` translations in the title itself

### 1.4 \englishsection{} - Pure English Sections

**Usage Pattern:**
```latex
\englishsection{English Title}
\startenglish
... English content ...
\stopenglish
```

**Real Examples:**
```latex
\englishsection{English Section: Technical Analysis}
\startenglish
This is a pure English section that flows left-to-right...
\stopenglish

\englishsection{English Section: Advanced Machine Learning Analysis}
\startenglish
This section demonstrates pure English content...
\stopenglish
```

**Critical Pattern:** ALWAYS wrap content between `\startenglish` and `\stopenglish`

---

## 2. TEXT DIRECTION COMMANDS

### 2.1 \en{} - Inline English in Hebrew Text

**Primary Usage:**
```latex
Hebrew text with \en{English term} embedded
```

**Real Examples:**
```latex
השיטות המודרניות של \en{Artificial Intelligence} מבוססות
זהו טקסט עברי עם \en{Machine Learning} ו-\en{Deep Learning}
המחקר של \en{Mikolov et al.} הציג את מודל \en{Word2Vec}
רשת נוירונים: \en{Neural Network}
```

**Frequency:** Extremely common - appears in almost every sentence with technical terms

**Best Practice:** Use for:
- Technical terms (Machine Learning, AI, BERT, GPT)
- Author names (Cox, Berkson, Verhulst)
- Abbreviations (LLM, RAG, RNN)
- Software/tool names (Python, Claude, BERT)

### 2.2 \entoc{} - English in Table of Contents

**Specific Usage:**
```latex
\hebrewsection{Hebrew: \entoc{English for TOC}}
\hebrewsubsection{Hebrew: \entoc{English for TOC}}
```

**Purpose:** Ensures proper LTR rendering in TOC entries

**Note:** This is a SPECIALIZED command for TOC - NOT for general inline English

### 2.3 \num{} - Numbers in Hebrew RTL Context

**Primary Usage:**
```latex
\num{number}
```

**Real Examples:**
```latex
המחקר מבוסס על \num{1000} דגימות
איסוף \num{100000} דוגמאות
בניית \num{5} מודלים
עלייה של \num{6.6}\%
\num{512} MB
```

**Critical:** ALWAYS use \num{} for numbers in Hebrew text to maintain LTR direction

**Without \num{}:** Numbers appear reversed in RTL context
**With \num{}:** Numbers maintain correct LTR orientation

### 2.4 \percent{} - Percentage Values

**Primary Usage:**
```latex
\percent{value}
```

**Real Examples:**
```latex
דיוק \percent{95.2}
עלייה של \percent{25} בדיוק
שיפור של \percent{40} בזמן העיבוד
הביצועים השתפרו מ-\percent{65.2} ל-\percent{96.8}
```

**Alternative Pattern:**
```latex
\num{6.6}\%  % Explicit percentage sign
```

**Recommendation:** Use `\percent{}` for consistency

### 2.5 \hebyear{} - Hebrew Years

**Primary Usage:**
```latex
\hebyear{year}
```

**Real Examples:**
```latex
בשנת \hebyear{2023}
בשנים \hebyear{2020}-\hebyear{2023}
מהשנים \hebyear{2020}-\hebyear{2022}
עד שנת \hebyear{2025}
```

**Purpose:** Ensures year numbers render correctly in Hebrew context

---

## 3. FOOTNOTES IN RTL CONTEXT

### 3.1 Standard Footnote Pattern

**Usage Pattern:**
```latex
Hebrew text with term\footnote{Explanation in Hebrew}
```

**Real Example (chapter01.tex):**
```latex
האם הוא יפתח מחלת לב כלילית\footnote{``כלילי'' – שייך לכליל,
כלומר למה שמקיף את הלב ככתר; ובעגה הרפואית: עורקים כליליים =
העורקים המספקים דם לשריר הלב. לדוגמה העורקים הכליליים מספקים
דם לשריר הלב.} \texthebrew{\en{(Coronary Heart Disease - CHD)}}?
```

**Key Observations:**
1. Footnote attached IMMEDIATELY after Hebrew word (no space)
2. Footnote content is pure Hebrew RTL text
3. Can include `\en{}` within footnote for English terms
4. Punctuation follows natural Hebrew order

### 3.2 Footnote Positioning

**Pattern:**
```latex
word\footnote{text} continuation
```

**NOT:**
```latex
word \footnote{text}  % Wrong - space before footnote
word.\footnote{text}  % Consider placement after punctuation
```

### 3.3 Mixed Language Footnotes

**Pattern:**
```latex
\footnote{Hebrew explanation with \en{English Term} embedded}
```

---

## 4. TABLES

### 4.1 hebrewtable Environment

**Standard Pattern:**
```latex
\begin{hebrewtable}[h]
\caption{Hebrew Caption: \en{English Caption}}
\begin{rtltabular}{|c|c|c|}
\hline
Header row with \mixedcell{} or plain text \\
\hline
Data rows \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

**Real Example:**
```latex
\begin{hebrewtable}[h]
\caption{תוצאות הניסוי: \en{Experimental Results}}
\begin{rtltabular}{|c|c|c|}
\hline
\mixedcell{\textbf{מדד / \en{Metric}}} &
\mixedcell{\textbf{ערך / \en{Value}}} &
\mixedcell{\textbf{יחידה / \en{Unit}}} \\
\hline
\mixedcell{דיוק / \en{Accuracy}} & \percent{95.2} &
\mixedcell{אחוזים / \en{Percent}} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

### 4.2 \mixedcell{} - Mixed Hebrew/English Cells

**Usage Pattern:**
```latex
\mixedcell{Hebrew / \en{English}}
```

**Real Examples:**
```latex
\mixedcell{\textbf{מדד / \en{Metric}}}
\mixedcell{דיוק / \en{Accuracy}}
\mixedcell{זמן ריצה / \en{Runtime}}
\mixedcell{\en{GPT-2} / ג'יפיטי-\num{2}}
```

**Important:** Use \mixedcell{} for EVERY cell containing mixed content

**Exception (intermediate_example.tex):**
```latex
\textbf{מודל / \en{Model}}  % WITHOUT \mixedcell{} in header
\en{GPT-2} / ג'יפיטי-\num{2}  % WITHOUT \mixedcell{} in data
```

**Recommendation:** ALWAYS use \mixedcell{} for consistency and proper RTL/LTR handling

### 4.3 rtltabular Environment

**Column Specification:**
```latex
\begin{rtltabular}{|c|c|c|c|}  % Centered columns with borders
```

**Alignment Options:**
- `c` - center
- `l` - left
- `r` - right
- `|` - vertical border

**Common Pattern:**
```latex
{|c|c|c|}  % 3 columns, all centered, all with borders
```

---

## 5. CODE BLOCKS

### 5.1 pythonbox Environment

**Standard Pattern:**
```latex
\begin{pythonbox}[Hebrew Title: \en{English Title}]
# Python code here
# NO Hebrew comments allowed
# Only English comments
\end{pythonbox}
```

**Real Example:**
```latex
\begin{pythonbox}[דוגמה לקוד: \en{Python Code Example}]
import numpy as np
from sklearn.linear_model import LinearRegression

# Create sample data (NO Hebrew comments allowed)
X = np.random.randn(100, 1)
y = 2 * X.flatten() + 1 + np.random.randn(100) * 0.1

# Train the model
model = LinearRegression()
model.fit(X, y)

# Print results
print(f"Coefficient: {model.coef_[0]:.2f}")
\end{pythonbox}
```

**CRITICAL RULES:**
1. Title can be mixed Hebrew/English using `\en{}`
2. Code content MUST be pure English
3. NO Hebrew in comments
4. NO Hebrew in strings (causes compilation errors)

### 5.2 Code Block Titles

**Pattern:**
```latex
[Hebrew Description: \en{English Description}]
```

**Examples:**
```latex
[דוגמה לקוד: \en{Python Code Example}]
[Attention Mechanism Implementation]  % Pure English OK
[My Python Code]  % Short English OK
```

---

## 6. FIGURES AND IMAGES

### 6.1 Standard Figure

**Pattern:**
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.7\textwidth]{path/to/image.png}
\caption{Hebrew Caption: \en{English Caption}}
\label{fig:label}
\end{figure}
```

**Real Example:**
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.7\textwidth]{example_plot.png}
\caption{גרף הדגמה בשנת \hebyear{2023}: \en{Example Plot from 2023 showing trigonometric functions}}
\label{fig:example}
\end{figure}
```

### 6.2 hebrewfigure Environment

**Pattern (expert_example.tex):**
```latex
\begin{hebrewfigure}[h]
    \centering
    \fbox{\parbox{8cm}{
        \centering
        \vspace{1cm}
        {\Large \en{AI Model}}\\[0.5cm]
        מודל בינה מלאכותית\\[0.5cm]
        קלט $\rightarrow$ עיבוד $\rightarrow$ פלט\\
        \vspace{1cm}
    }}
    \caption{Hebrew: \en{English} - description}
    \label{fig:label}
\end{hebrewfigure}
```

**Usage:** For figures with mixed Hebrew/English text content

### 6.3 Figure References

**Pattern:**
```latex
\ref{fig:label}
```

**Real Example:**
```latex
כפי שניתן לראות באיור \ref{fig:example}, הפונקציות מציגות התנהגות מעניינת.
```

---

## 7. BIBLIOGRAPHY AND CITATIONS

### 7.1 Adding Bibliography Resource

**Pattern:**
```latex
\addbibresource{filename.bib}
```

**Real Examples:**
```latex
\addbibresource{example_references.bib}
\addbibresource{advanced_references.bib}
\addbibresource{global.bib}
\addbibresource{references.bib}
\addbibresource{references_filtered.bib}
```

**Location:** In preamble, after \documentclass

### 7.2 Citations in Text

**Pattern:**
```latex
\cite{key}
\cite{key1,key2,key3}  % Multiple citations
\cite[page]{key}  % With page number
```

**Real Examples:**
```latex
כפי שמוכח במחקרים רבים \cite{mikolov2013}
המחקר של \en{Mikolov et al.} \cite{mikolov2013}
מחקרים נוספים \cite{devlin2018,brown2020}
\cite[עמ' 45]{hebrew_nlp_2023}  % Hebrew page notation
\cite[p. 123]{vaswani2017attention}  % English page notation
```

### 7.3 Printing Bibliography

**English Bibliography:**
```latex
\printenglishbibliography
```

**Hebrew Bibliography:**
```latex
\printhebrewbibliography
```

**Both:**
```latex
\printhebrewbibliography
\printenglishbibliography
```

**Best Practice:** Use `\printenglishbibliography` for most academic documents (IEEE style, LTR numbers)

---

## 8. LISTS

### 8.1 Itemize (Bullet Lists)

**Pattern:**
```latex
\begin{itemize}
\item Hebrew text with \en{English}
\item Another item
\end{itemize}
```

**Real Example:**
```latex
\begin{itemize}
\item רגרסיה ליניארית: \en{Linear Regression} - דיוק \percent{85.2}
\item עץ החלטה: \en{Decision Tree} - דיוק \percent{78.9}
\item יער אקראי: \en{Random Forest} - דיוק \percent{92.1}
\end{itemize}
```

### 8.2 Enumerate (Numbered Lists)

**Pattern:**
```latex
\begin{enumerate}
\item Item one
\item Item two
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

### 8.3 Nested Lists

**Pattern:**
```latex
\begin{enumerate}
\item First level
    \begin{itemize}
    \item Nested bullet
    \item Another nested with \en{English}
    \end{itemize}
\item Continue first level
\end{enumerate}
```

---

## 9. MATHEMATICAL EXPRESSIONS

### 9.1 Inline Math

**Pattern:**
```latex
Hebrew text with $math$ embedded
```

**Real Examples:**
```latex
ביטויים מתמטיים כמו $E = mc^2$
כאשר $\beta_0$ הוא הקבוע
הפונקציות מציגות $a^2 + b^2 = c^2$
```

### 9.2 Display Math (equation)

**Pattern:**
```latex
\begin{equation}
math expression
\end{equation}
```

**Real Examples:**
```latex
\begin{equation}
y = \beta_0 + \beta_1 x + \varepsilon
\end{equation}

\begin{equation}
E = mc^2
\end{equation}
```

### 9.3 Display Math ($$)

**Pattern:**
```latex
$$math expression \quad (equation number)$$
```

**Real Examples:**
```latex
$$y = \beta_0 + \beta_1 x + \varepsilon \quad (1.1)$$

$$\text{Attention}(Q,K,V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V \quad (2.1)$$
```

---

## 10. DOCUMENT METADATA

### 10.1 Title Information

**Pattern:**
```latex
\hebrewtitle{Hebrew Title}
\englishtitle{English Title}
\hebrewauthor{Hebrew Author Name}
\date{\textenglish{Month Year}}  % Or \hebyear{year}
```

**Real Examples:**
```latex
\hebrewtitle{דוגמה לשימוש בתבנית האקדמית העברית}
\englishtitle{Example Usage of Hebrew Academic Template}
\hebrewauthor{ד"ר סגל יורם}
\date{\textenglish{December 2025}}
```

### 10.2 Version Information

**Pattern:**
```latex
\hebrewversion{גירסה \textenglish{version number}}
```

**Real Example:**
```latex
\hebrewversion{גירסה \textenglish{3.00}}
```

---

## 11. SPECIAL PATTERNS

### 11.1 \texthebrew{} and \textenglish{}

**Usage:**
```latex
\texthebrew{Hebrew text}
\textenglish{English text}
```

**Real Examples:**
```latex
\date{\texthebrew{אוקטובר} \textenglish{2025}}
\texthebrew{\en{(Coronary Heart Disease - CHD)}}
```

**Note:** These are Polyglossia standard commands, less common than `\en{}`

### 11.2 Input for Chapter Files

**Pattern:**
```latex
\input{chapters/filename}
```

**Real Examples:**
```latex
\input{chapters/ch11_01_clustering_problem}
\input{chapters/chapter01.tex}
\input{chapters/chapter02}
```

**Best Practice:** Use relative paths from main.tex location

---

## 12. USAGE FREQUENCY ANALYSIS

### Most Common Commands (by frequency):

1. **\en{}** - Used in almost every paragraph for technical terms
2. **\num{}** - Used for all numbers in Hebrew text
3. **\hebrewsection{}** - Document structure
4. **\hebrewsubsection{}** - Document structure
5. **\cite{}** - Citations throughout
6. **\percent{}** - Percentage values
7. **\hebyear{}** - Year references
8. **\mixedcell{}** - Table cells with mixed content

### Moderately Used:

9. **\begin{pythonbox}** - Code examples
10. **\begin{hebrewtable}** - Data presentation
11. **\begin{figure}** - Images and plots
12. **\footnote{}** - Explanatory notes

### Rarely Used:

13. **\hebrewchapter{}** - Book-level only
14. **\englishsection{}** - Occasional pure English sections
15. **\hebrewfigure{}** - Special figure needs
16. **\texthebrew{}**, **\textenglish{}** - Polyglossia alternatives

---

## 13. CRITICAL PATTERNS FOR SUCCESS

### 13.1 The "Bilingual Header" Pattern
```latex
\hebrewsection{Hebrew: \entoc{English}}
\hebrewsubsection{Hebrew: \entoc{English}}
\caption{Hebrew: \en{English}}
```

### 13.2 The "Technical Term" Pattern
```latex
Hebrew text with \en{Technical Term} continuation
```

### 13.3 The "Numeric Value" Pattern
```latex
\num{value}  % Always wrap numbers
\percent{value}  % Always wrap percentages
\hebyear{year}  % Always wrap years
```

### 13.4 The "Table Cell" Pattern
```latex
\mixedcell{Hebrew / \en{English}}  % For mixed cells
\mixedcell{\textbf{Bold Hebrew / \en{Bold English}}}  % With formatting
```

### 13.5 The "Code Block" Pattern
```latex
\begin{pythonbox}[Hebrew: \en{English}]
# English-only code
# No Hebrew allowed
\end{pythonbox}
```

---

## CONCLUSION

The CLS template shows consistent, predictable patterns across all examined documents. The key to success is:

1. **Always use wrapper commands** (\en{}, \num{}, \percent{}, \hebyear{})
2. **Follow bilingual labeling** (Hebrew: \en{English} or Hebrew: \entoc{English})
3. **Respect RTL/LTR boundaries** (never mix without wrappers)
4. **Use specialized environments** (hebrewtable, pythonbox, hebrewfigure)
5. **Maintain consistent citation style** (IEEE with LTR numbers)

These patterns ensure proper bidirectional text rendering and professional academic presentation.
