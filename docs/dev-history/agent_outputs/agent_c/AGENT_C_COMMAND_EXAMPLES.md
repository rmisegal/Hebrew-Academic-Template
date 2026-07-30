# AGENT C: Command Examples
## Real Examples for Every CLS Command

**Analysis Date:** 2025-11-09
**Source:** 6 production TEX documents
**Agent:** Agent C - TEX Pattern Analyzer

---

## OVERVIEW

This document provides real, working examples for every command found in the hebrew-academic-template.cls. Examples are taken directly from successfully compiling documents.

---

## 1. DOCUMENT STRUCTURE COMMANDS

### \hebrewsection{}

**Purpose:** Create a major section in Hebrew with bilingual title

**Syntax:**
```latex
\hebrewsection{Hebrew Title: \entoc{English Title}}
```

**Real Examples:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\hebrewsection{תוצאות: \entoc{Results}}
\hebrewsection{מסקנות: \entoc{Conclusions}}
\hebrewsection{דוגמאות מתקדמות: \entoc{Advanced Examples}}
\hebrewsection{קוד ואיורים: \entoc{Code and Figures}}
```

**From:** beginner_example.tex, intermediate_example.tex, advanced_example.tex

---

### \hebrewsubsection{}

**Purpose:** Create a subsection in Hebrew with bilingual title

**Syntax:**
```latex
\hebrewsubsection{Hebrew Title: \entoc{English Title}}
```

**Real Examples:**
```latex
\hebrewsubsection{מתודולוגיה: \entoc{Methodology}}
\hebrewsubsection{ניתוח נתונים: \entoc{Data Analysis}}
\hebrewsubsection{קוד לדוגמה: \entoc{Example Code}}
\hebrewsubsection{איור לדוגמה: \entoc{Example Figure}}
\hebrewsubsection{רשימות: \entoc{Lists}}
\hebrewsubsection{טבלה מורכבת: \entoc{Complex Table}}
\hebrewsubsection{ציטוטים: \entoc{Citations}}
```

**From:** beginner_example.tex, intermediate_example.tex, expert_example.tex

---

### \hebrewchapter{}

**Purpose:** Create a chapter heading in book-level documents

**Syntax:**
```latex
\hebrewchapter{Hebrew Chapter Title}
```

**Real Example:**
```latex
\hebrewchapter{מבוא ומוטיבציה: כאשר החיים הם שאלה של כן או לא}
```

**From:** chapter01.tex (Logistic Book)

**Note:** Chapters typically don't include inline English translation

---

### \englishsection{}

**Purpose:** Create a pure English section in a Hebrew document

**Syntax:**
```latex
\englishsection{English Title}
\startenglish
English content here
\stopenglish
```

**Real Examples:**
```latex
\englishsection{English Section: Technical Analysis}
\startenglish
This is a pure English section that flows left-to-right (LTR) and is
aligned to the left. All text in this section should be in English and
follow standard English typography conventions.
\stopenglish
```

```latex
\englishsection{English Section: Advanced Machine Learning Analysis}
\startenglish
The field of artificial intelligence has experienced unprecedented
growth in recent years.
\stopenglish
```

**From:** beginner_example.tex, intermediate_example.tex

---

### \startenglish / \stopenglish

**Purpose:** Mark boundaries of English text blocks

**Syntax:**
```latex
\startenglish
Pure English content in LTR direction
\stopenglish
```

**Real Example:**
```latex
\englishsection{English Section: Advanced Machine Learning Analysis}
\startenglish

This section demonstrates pure English content that flows left-to-right
(LTR) and is aligned to the left.

\begin{enumerate}
\item \textbf{Attention Mechanisms}: Introduced in 2017
\item \textbf{BERT Architecture}: Bidirectional encoder
\item \textbf{GPT Models}: Generative pre-trained transformers
\end{enumerate}

The mathematical foundation of attention mechanisms can be expressed as:

$$\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$$

\stopenglish
```

**From:** intermediate_example.tex

---

## 2. TEXT DIRECTION COMMANDS

### \en{}

**Purpose:** Wrap inline English text in Hebrew context

**Syntax:**
```latex
Hebrew text with \en{English text} continuation
```

**Real Examples:**
```latex
זהו טקסט עברי עם מונחים באנגלית כמו \en{Machine Learning} ו-\en{Deep Learning}
השיטות המודרניות של \en{Artificial Intelligence} מבוססות
המחקר של \en{Mikolov et al.} \cite{mikolov2013}
רגרסיה ליניארית: \en{Linear Regression}
עץ החלטה: \en{Decision Tree}
יער אקראי: \en{Random Forest}
```

**From:** All documents - most frequently used command

**Common Uses:**
- Technical terms: \en{AI}, \en{Deep Learning}, \en{Neural Network}
- Author names: \en{Cox}, \en{Berkson}, \en{Verhulst}
- Software: \en{Python}, \en{TensorFlow}, \en{PyTorch}
- Abbreviations: \en{LLM}, \en{RAG}, \en{RNN}

---

### \entoc{}

**Purpose:** English text specifically for Table of Contents entries

**Syntax:**
```latex
\hebrewsection{Hebrew: \entoc{English}}
\hebrewsubsection{Hebrew: \entoc{English}}
```

**Real Examples:**
```latex
\hebrewsection{מבוא: \entoc{Introduction}}
\hebrewsubsection{מתודולוגיה: \entoc{Methodology}}
\hebrewsubsection{בדיקת ציטוטים בעברית: \entoc{Hebrew Citations Test}}
```

**From:** intermediate_example.tex, expert_example.tex

**Note:** Specialized for TOC - ensures proper LTR rendering in table of contents

---

### \num{}

**Purpose:** Wrap numbers to maintain LTR direction in RTL context

**Syntax:**
```latex
\num{number}
```

**Real Examples:**
```latex
המחקר מבוסס על \num{1000} דגימות
איסוף \num{100000} דוגמאות
בניית \num{5} מודלים
\num{2.5} שניות
\num{512} MB
\num{1.5}\en{B} פרמטרים
```

**From:** All documents

**Variations:**
```latex
\num{123}  % Integer
\num{123.45}  % Decimal
\num{1000000}  % Large number
\num{2.5}  % With units
```

---

### \percent{}

**Purpose:** Display percentage values with correct formatting

**Syntax:**
```latex
\percent{value}
```

**Real Examples:**
```latex
דיוק \percent{95.2}
שיפור של \percent{25} בדיוק
הפחתה של \percent{40} בזמן העיבוד
הביצועים השתפרו מ-\percent{65.2} ל-\percent{96.8}
עלייה של \percent{15} לעומת שיטות קודמות
```

**From:** beginner_example.tex, intermediate_example.tex

**Alternative (manual):**
```latex
\num{6.6}\%  % Explicit percentage
```

---

### \hebyear{}

**Purpose:** Display year numbers in Hebrew context

**Syntax:**
```latex
\hebyear{year}
```

**Real Examples:**
```latex
בשנת \hebyear{2023}
בשנים \hebyear{2020}-\hebyear{2023}
עד שנת \hebyear{2025}
משנת \hebyear{1838}
בשנת \hebyear{1958}
```

**From:** beginner_example.tex, chapter01.tex

**Usage in Ranges:**
```latex
\hebyear{2020}-\hebyear{2023}  % Year range
מהשנים \hebyear{2020}-\hebyear{2022}
```

---

### \texthebrew{} and \textenglish{}

**Purpose:** Polyglossia standard language switching commands

**Syntax:**
```latex
\texthebrew{Hebrew text}
\textenglish{English text}
```

**Real Examples:**
```latex
\date{\textenglish{December 2025}}
\date{\texthebrew{אוקטובר} \textenglish{2025}}
\texthebrew{\en{(Coronary Heart Disease - CHD)}}
```

**From:** beginner_example.tex, main.tex (L12)

**Note:** Less common than \en{}, but useful for date formatting and special cases

---

## 3. TABLE COMMANDS

### hebrewtable Environment

**Purpose:** Create a table with Hebrew caption and RTL support

**Syntax:**
```latex
\begin{hebrewtable}[placement]
\caption{Hebrew Caption: \en{English Caption}}
\begin{rtltabular}{column_spec}
... table content ...
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
\mixedcell{זמן ריצה / \en{Runtime}} & \num{2.5} &
\mixedcell{שניות / \en{Seconds}} \\
\hline
\mixedcell{זיכרון / \en{Memory}} & \num{512} & \en{MB} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

**From:** beginner_example.tex

---

### rtltabular Environment

**Purpose:** Create RTL-aware tabular environment

**Syntax:**
```latex
\begin{rtltabular}{column_specification}
row content \\
\hline
more rows \\
\end{rtltabular}
```

**Real Example:**
```latex
\begin{rtltabular}{|c|c|c|c|}
\hline
\mixedcell{\textbf{מודל / \en{Model}}} &
\mixedcell{\textbf{שנה / \en{Year}}} &
\mixedcell{\textbf{פרמטרים / \en{Parameters}}} &
\mixedcell{\textbf{דיוק / \en{Accuracy}}} \\
\hline
\mixedcell{\en{GPT-2} / ג'יפיטי-\num{2}} &
\mixedcell{\hebyear{2019}} &
\mixedcell{\num{1.5}\en{B}} &
\mixedcell{\num{88.5}\%} \\
\hline
\end{rtltabular}
```

**From:** beginner_example.tex

**Column Specifications:**
```latex
{|c|c|c|}  % 3 centered columns with borders
{|c|c|c|c|}  % 4 centered columns with borders
{c c c}  % 3 centered columns without borders
```

---

### \mixedcell{}

**Purpose:** Wrap table cells containing both Hebrew and English

**Syntax:**
```latex
\mixedcell{Hebrew / \en{English}}
```

**Real Examples:**
```latex
\mixedcell{\textbf{מדד / \en{Metric}}}
\mixedcell{דיוק / \en{Accuracy}}
\mixedcell{זמן ריצה / \en{Runtime}}
\mixedcell{\en{GPT-2} / ג'יפיטי-\num{2}}
\mixedcell{\hebyear{2019}}
```

**From:** beginner_example.tex

**Usage Patterns:**
```latex
% Header cells
\mixedcell{\textbf{Hebrew / \en{English}}}

% Data cells
\mixedcell{Hebrew / \en{English}}

% With numbers
\mixedcell{\en{Name} / Hebrew-\num{123}}
```

---

## 4. CODE BLOCK COMMANDS

### pythonbox Environment

**Purpose:** Display Python code with syntax highlighting

**Syntax:**
```latex
\begin{pythonbox}[Title]
# Python code here
# English comments only
\end{pythonbox}
```

**Real Example 1 - Bilingual Title:**
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
print(f"Intercept: {model.intercept_:.2f}")
print(f"R-squared: {model.score(X, y):.3f}")
\end{pythonbox}
```

**From:** beginner_example.tex

**Real Example 2 - English Title:**
```latex
\begin{pythonbox}[My Python Code]
def fibonacci(n):
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()

fibonacci(100)
\end{pythonbox}
```

**From:** advanced_example.tex

**Real Example 3 - Complex Code:**
```latex
\begin{pythonbox}[Attention Mechanism Implementation]
import torch
import torch.nn.functional as F

def attention(Q, K, V, mask=None):
    """
    Implementation of scaled dot-product attention
    Based on Vaswani et al. (2017)
    """
    d_k = Q.size(-1)
    scores = torch.matmul(Q, K.transpose(-2, -1)) / torch.sqrt(d_k)

    if mask is not None:
        scores = scores.masked_fill(mask == 0, -1e9)

    attention_weights = F.softmax(scores, dim=-1)
    return torch.matmul(attention_weights, V)
\end{pythonbox}
```

**From:** expert_example.tex

**CRITICAL RULES:**
- Title can be Hebrew with \en{} or pure English
- Code MUST be pure English/ASCII
- NO Hebrew in comments
- NO Hebrew in strings

---

## 5. FIGURE AND IMAGE COMMANDS

### figure Environment (Standard)

**Purpose:** Insert images with bilingual captions

**Syntax:**
```latex
\begin{figure}[placement]
\centering
\includegraphics[width=fraction\textwidth]{path/to/image}
\caption{Hebrew Caption: \en{English Caption}}
\label{fig:label}
\end{figure}
```

**Real Example 1:**
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.7\textwidth]{example_plot.png}
\caption{גרף הדגמה בשנת \hebyear{2023}: \en{Example Plot from 2023 showing trigonometric functions}}
\label{fig:example}
\end{figure}
```

**From:** beginner_example.tex

**Real Example 2:**
```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.85\textwidth]{Images/fig_sigmoid_curve.png}
\caption{הפונקציה הלוגיסטית (עקומת סיגמואיד): ניתן לראות כיצד ההסתברות עוברת מ-\num{0} ל-\num{1} בצורה חלקה.}
\label{fig:sigmoid_curve}
\end{figure}
```

**From:** chapter01.tex

**Real Example 3:**
```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.9\textwidth]{Images/fig_chd_scatter.png}
\caption{פיזור נתוני מחלת לב (\en{CHD}) לפי גיל. כל נקודה מייצגת מטופל: \num{0} = בריא, \num{1} = חולה.}
\label{fig:chd_scatter}
\end{figure}
```

**From:** chapter01.tex

**Placement Options:**
- `[h]` - Here (approximately)
- `[t]` - Top of page
- `[b]` - Bottom of page
- `[p]` - Separate page
- `[htbp]` - Try here, top, bottom, or page (flexible)

**Width Specifications:**
```latex
width=0.5\textwidth  % Half page width
width=0.7\textwidth  % 70% page width
width=0.85\textwidth  % 85% page width
width=0.9\textwidth  % 90% page width
```

---

### hebrewfigure Environment

**Purpose:** Figure with special RTL handling for mixed content

**Syntax:**
```latex
\begin{hebrewfigure}[placement]
\centering
... content ...
\caption{Caption}
\label{fig:label}
\end{hebrewfigure}
```

**Real Example:**
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
    \caption{ארכיטקטורת מודל: \en{Model Architecture} - דיאגרמה של מודל \en{AI} בסיסי}
    \label{fig:model_architecture}
\end{hebrewfigure}
```

**From:** expert_example.tex

**Use Cases:**
- Diagrams with mixed Hebrew/English text
- Figures created with TikZ
- Custom figure layouts with bidirectional text

---

### \includegraphics

**Purpose:** Include external image files

**Syntax:**
```latex
\includegraphics[options]{path/to/image}
```

**Real Examples:**
```latex
\includegraphics[width=0.7\textwidth]{example_plot.png}
\includegraphics[width=0.85\textwidth]{Images/fig_sigmoid_curve.png}
\includegraphics[width=0.9\textwidth]{Images/fig_chd_scatter.png}
\includegraphics[width=0.6\textwidth]{example_plot.png}
```

**From:** Various documents

**Common Options:**
```latex
[width=0.7\textwidth]  % Set width as fraction of text width
[height=5cm]  % Set height
[scale=0.5]  % Scale by factor
[angle=90]  % Rotate
```

---

### \ref{} for Figure References

**Purpose:** Reference figures by label

**Syntax:**
```latex
\ref{fig:label}
```

**Real Examples:**
```latex
כפי שניתן לראות באיור \ref{fig:example}, הפונקציות מציגות התנהגות מעניינת.

As can be seen in Figure \ref{fig:sample_plot}, the plot shows a simple sine wave.

האיור \ref{fig:example} מציג את התוצאות

התמונה \ref{fig:model_architecture} מציגה את המבנה הבסיסי
```

**From:** Various documents

---

## 6. BIBLIOGRAPHY COMMANDS

### \addbibresource{}

**Purpose:** Load bibliography file (in preamble)

**Syntax:**
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

**From:** All documents

**MUST be in preamble (before \begin{document})**

---

### \cite{}

**Purpose:** Cite references in text

**Syntax:**
```latex
\cite{key}
\cite{key1,key2,key3}  % Multiple citations
\cite[page]{key}  % With page number
```

**Real Examples - Simple Citations:**
```latex
כפי שמוכח במחקרים רבים \cite{mikolov2013}
המחקר של \en{Mikolov et al.} \cite{mikolov2013}
המחקר של \en{Cox} \cite{Cox1958}
```

**From:** Various documents

**Real Examples - Multiple Citations:**
```latex
מחקרים נוספים \cite{devlin2018,brown2020} הרחיבו את הגישה
Multiple studies \cite{vaswani2017attention,devlin2018bert,hebrew_nlp_2023}
במחקרים רבים \cite{mikolov2013,devlin2018,brown2020}
```

**From:** intermediate_example.tex, expert_example.tex

**Real Examples - With Page Numbers:**
```latex
\cite[עמ' 45]{hebrew_nlp_2023}  % Hebrew "page"
\cite[p. 123]{vaswani2017attention}  % English "page"
```

**From:** expert_example.tex

---

### \printenglishbibliography

**Purpose:** Print bibliography in English format (LTR, IEEE style)

**Syntax:**
```latex
\printenglishbibliography
```

**Real Example:**
```latex
% ==================== BIBLIOGRAPHY ====================

\newpage
\printenglishbibliography

\end{document}
```

**From:** All documents

**Usage:**
- Always use \newpage or \clearpage before
- Place before \end{document}
- Most common bibliography command

---

### \printhebrewbibliography

**Purpose:** Print bibliography in Hebrew format

**Syntax:**
```latex
\printhebrewbibliography
```

**Real Example:**
```latex
\newpage
\printhebrewbibliography
\printenglishbibliography
```

**From:** advanced_example.tex

**Usage:**
- For Hebrew references
- Can use both Hebrew and English bibliographies
- Hebrew bibliography typically comes first if both used

---

## 7. TITLE AND METADATA COMMANDS

### \hebrewtitle{}

**Purpose:** Set Hebrew document title

**Syntax:**
```latex
\hebrewtitle{Hebrew Title}
```

**Real Examples:**
```latex
\hebrewtitle{דוגמה לשימוש בתבנית האקדמית העברית}
\hebrewtitle{בדיקה מקיפה של התבנית האקדמית}
\hebrewtitle{בדיקת מערכת הציטוטים}
\hebrewtitle{פרק \textenglish{11}: אלגוריתם \textenglish{K-Means}}
\hebrewtitle{רשתות נוירונים רקורסיביות: מבוא מקיף}
```

**From:** All documents

---

### \englishtitle{}

**Purpose:** Set English document title

**Syntax:**
```latex
\englishtitle{English Title}
```

**Real Examples:**
```latex
\englishtitle{Example Usage of Hebrew Academic Template}
\englishtitle{Comprehensive Test of the Academic Template}
\englishtitle{Citation System Test}
\englishtitle{Chapter 11: K-Means Algorithm}
\englishtitle{Recurrent Neural Networks: A Comprehensive Introduction}
```

**From:** All documents

---

### \hebrewauthor{}

**Purpose:** Set author name in Hebrew

**Syntax:**
```latex
\hebrewauthor{Author Name}
```

**Real Examples:**
```latex
\hebrewauthor{ד"ר סגל יורם}
\hebrewauthor{ד"ר יורם סגל}
```

**From:** All documents

**Note:** Both word orders are used (Segal Yoram vs. Yoram Segal)

---

### \date{}

**Purpose:** Set document date

**Syntax:**
```latex
\date{Date text}
```

**Real Examples:**
```latex
\date{\textenglish{December 2025}}
\date{\textenglish{September 2025}}
\date{\hebyear{2025}}
\date{\texthebrew{אוקטובר} \textenglish{2025}}
```

**From:** Various documents

**Patterns:**
- English month + year: `\textenglish{Month Year}`
- Hebrew year only: `\hebyear{year}`
- Mixed: `\texthebrew{Hebrew month} \textenglish{year}`

---

### \hebrewversion{}

**Purpose:** Set version number

**Syntax:**
```latex
\hebrewversion{Version text}
```

**Real Example:**
```latex
\hebrewversion{גירסה \textenglish{3.00}}
```

**From:** main.tex (L12)

---

### \maketitle

**Purpose:** Generate title page

**Syntax:**
```latex
\maketitle
```

**Real Example:**
```latex
\begin{document}

\maketitle

\tableofcontents
\newpage

\hebrewsection{...}
```

**From:** All documents

---

### \tableofcontents

**Purpose:** Generate table of contents

**Syntax:**
```latex
\tableofcontents
```

**Real Example:**
```latex
\maketitle

\tableofcontents
\newpage

% Main content starts here
```

**From:** All documents

---

## 8. LIST COMMANDS

### itemize Environment

**Purpose:** Create bullet point lists

**Syntax:**
```latex
\begin{itemize}
\item First item
\item Second item
\end{itemize}
```

**Real Example:**
```latex
\begin{itemize}
\item רגרסיה ליניארית: \en{Linear Regression} - דיוק \percent{85.2}
\item עץ החלטה: \en{Decision Tree} - דיוק \percent{78.9}
\item יער אקראי: \en{Random Forest} - דיוק \percent{92.1}
\item רשת נוירונים: \en{Neural Network} - דיוק \percent{94.5}
\end{itemize}
```

**From:** beginner_example.tex

**English Section Example:**
```latex
\begin{itemize}
\item \textbf{Transformer Architecture:} Introduced attention mechanisms
\item \textbf{Large Language Models:} Models like GPT and BERT
\item \textbf{Generative AI:} Systems capable of creating new content
\end{itemize}
```

**From:** beginner_example.tex

---

### enumerate Environment

**Purpose:** Create numbered lists

**Syntax:**
```latex
\begin{enumerate}
\item First item
\item Second item
\end{enumerate}
```

**Real Example:**
```latex
\begin{enumerate}
\item איסוף \num{1000} דגימות: \en{Data Collection}
\item ניתוח ראשוני של \num{15} משתנים: \en{Exploratory Analysis}
\item בניית \num{5} מודלים: \en{Model Building}
\item הערכת תוצאות על \num{200} מקרי בדיקה: \en{Results Evaluation}
\end{enumerate}
```

**From:** beginner_example.tex

**Nested List Example:**
```latex
\begin{enumerate}
\item The first item in a numbered list.
\item The second item, which contains a nested list:
    \begin{itemize}
    \item A nested bullet point.
    \item Another nested bullet point with \en{Nested Item}.
    \end{itemize}
\item The third item in the list.
\end{enumerate}
```

**From:** advanced_example.tex

---

## 9. MATHEMATICAL COMMANDS

### Inline Math ($...$)

**Purpose:** Mathematical expressions within text

**Syntax:**
```latex
Text with $math$ embedded
```

**Real Examples:**
```latex
ביטויים מתמטיים כמו $E = mc^2$
כאשר $\beta_0$ הוא הקבוע
כאשר $Q$, $K$, ו-$V$ הם מטריצות
Mathematical expressions such as $a^2 + b^2 = c^2$
```

**From:** Various documents

---

### equation Environment

**Purpose:** Numbered display equations

**Syntax:**
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

\begin{equation}
p(x) = \frac{e^{\beta_0 + \beta_1 x}}{1 + e^{\beta_0 + \beta_1 x}}
\label{eq:logistic_function}
\end{equation}
```

**From:** beginner_example.tex, chapter01.tex

---

### Display Math ($$...$$)

**Purpose:** Display equations with manual numbering

**Syntax:**
```latex
$$math expression \quad (number)$$
```

**Real Examples:**
```latex
$$y = \beta_0 + \beta_1 x + \varepsilon \quad (1.1)$$

$$\text{Attention}(Q,K,V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V \quad (2.1)$$

$$N(t) = \frac{K}{1 + e^{-r(t - t_0)}} \quad (1.2)$$
```

**From:** intermediate_example.tex, chapter01.tex

---

### \eqref{} and \ref{} for Equations

**Purpose:** Reference labeled equations

**Syntax:**
```latex
\eqref{eq:label}  % With parentheses
\ref{eq:label}  % Without parentheses
```

**Real Examples:**
```latex
כפי שניתן לראות במשוואה~\eqref{eq:logistic}, ...

במשוואת \en{Verhulst} (משוואה~\ref{eq:verhulst_growth}), ...
```

**From:** chapter01.tex

---

## 10. SPECIAL TEXT COMMANDS

### \footnote{}

**Purpose:** Add footnotes to text

**Syntax:**
```latex
word\footnote{explanation text}
```

**Real Example:**
```latex
מחלת לב כלילית\footnote{``כלילי'' – שייך לכליל, כלומר למה שמקיף את הלב ככתר; ובעגה הרפואית: עורקים כליליים = העורקים המספקים דם לשריר הלב. לדוגמה העורקים הכליליים מספקים דם לשריר הלב.} \texthebrew{\en{(Coronary Heart Disease - CHD)}}?
```

**From:** chapter01.tex

**CRITICAL:** No space between word and \footnote{}

---

### \textbf{}

**Purpose:** Bold text

**Syntax:**
```latex
\textbf{text}
```

**Real Examples:**
```latex
\textbf{מדד / \en{Metric}}
\mixedcell{\textbf{Hebrew / \en{English}}}
\item \textbf{Attention Mechanisms}
```

**From:** Various documents

---

### \textit{}

**Purpose:** Italic text

**Syntax:**
```latex
\textit{text}
```

**Real Example:**
```latex
{\Large\textit{מוקדש}}
{\normalsize\en{\textit{Dedicated to all developers}}}
```

**From:** main.tex (Book-V3)

---

## 11. FILE ORGANIZATION COMMANDS

### \input{}

**Purpose:** Include external TEX files

**Syntax:**
```latex
\input{path/to/file}
\input{path/to/file.tex}  % .tex extension optional
```

**Real Examples:**
```latex
\input{chapters/ch11_01_clustering_problem}
\input{chapters/chapter01.tex}
\input{chapters/chapter02}
\input{chapters/ch11_04_practical_implementation}
```

**From:** main.tex (L12), main.tex (RNN)

**Usage:**
- Use relative paths from main.tex location
- Forward slashes work on all platforms
- .tex extension is optional

---

## 12. PAGE CONTROL COMMANDS

### \newpage

**Purpose:** Start a new page

**Syntax:**
```latex
\newpage
```

**Real Examples:**
```latex
\tableofcontents
\newpage

\hebrewsection{Introduction}
...

\newpage
\printenglishbibliography
```

**From:** Various documents

---

### \clearpage

**Purpose:** Start a new page and flush floats

**Syntax:**
```latex
\clearpage
```

**Real Examples:**
```latex
\clearpage
\tableofcontents

\clearpage
\printenglishbibliography
```

**From:** main.tex (Book-V3), main.tex (RNN)

**Difference from \newpage:**
- \newpage: Start new page
- \clearpage: Start new page AND process all pending floats (figures, tables)

---

### \cleardoublepage

**Purpose:** Start a new right-hand page (for two-sided documents)

**Syntax:**
```latex
\cleardoublepage
```

**Real Example:**
```latex
\cleardoublepage
\pdfbookmark[0]{תוכן עניינים}{toc}
\tableofcontents

\cleardoublepage
```

**From:** main.tex (RNN)

---

## SUMMARY

This document provides real, tested examples for every CLS command. All examples are taken from successfully compiling TEX documents.

**Key Takeaways:**

1. **Most Common Commands:**
   - \en{} - Used in almost every paragraph
   - \num{} - For all numbers in Hebrew text
   - \hebrewsection{} / \hebrewsubsection{} - Document structure
   - \cite{} - Citations throughout
   - \percent{} - Percentage values

2. **Table Commands:**
   - hebrewtable + rtltabular + \mixedcell{}
   - Always use together for RTL tables

3. **Code Blocks:**
   - pythonbox environment
   - English-only content
   - Bilingual titles allowed

4. **Figures:**
   - Standard figure environment
   - hebrewfigure for special cases
   - Always bilingual captions

5. **Bibliography:**
   - \addbibresource{} in preamble
   - \cite{} in text
   - \printenglishbibliography at end

Use these examples as templates for your own documents. They are proven to work and represent best practices from real academic documents.
