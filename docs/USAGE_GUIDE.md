# Hebrew Academic Template - Detailed Usage Guide

**Copyright:** © 2025 Dr. Segal Yoram. All rights reserved.

## 📋 Table of Contents

1. [Installation & Setup](#installation--setup)
2. [Document Structure](#document-structure)
3. [Text Direction Guidelines](#text-direction-guidelines)
4. [Command Reference](#command-reference)
5. [Advanced Features](#advanced-features)
6. [Best Practices](#best-practices)
7. [Troubleshooting](#troubleshooting)

## 🛠 Installation & Setup

### Windows (MiKTeX + PowerShell)

```powershell
# 1. Ensure MiKTeX is installed and updated
miktex-update

# 2. Clone or download the template
git clone https://github.com/username/hebrew-academic-template.git
cd hebrew-academic-template

# 3. Compile the example
lualatex simple_example.tex
biber simple_example
lualatex simple_example.tex
```

### Linux (TeX Live)

```bash
# 1. Install TeX Live (if not already installed)
sudo apt-get install texlive-full

# 2. Clone the template
git clone https://github.com/username/hebrew-academic-template.git
cd hebrew-academic-template

# 3. Compile the example
lualatex simple_example.tex
biber simple_example
lualatex simple_example.tex
```

## 📄 Document Structure

### Basic Template Structure

```latex
% Copyright header
% Copyright (c) \hebyear{2025} Dr. Segal Yoram. All rights reserved.

\documentclass{hebrew-academic-template}

% Bibliography
\addbibresource{references.bib}

% Title page information
\hebrewtitle{כותרת בעברית}
\englishtitle{English Title}
\hebrewauthor{ד"ר שם המחבר}

\begin{document}

% Title and TOC
\maketitle
\tableofcontents
\newpage

% Content sections
\hebrewsection{מבוא: \entoc{Introduction}}
% Your content here

% Bibliography
\newpage
\printenglishbibliography
\printhebrewbibliography

\end{document}
```

### Required Files

1. **Main .tex file**: Your document content
2. **references.bib**: Bibliography entries with `keywords={english}` or `keywords={hebrew}`
3. **hebrew-academic-template.cls**: Template class file
4. **Images**: Any PNG/JPG files referenced in the document

## 🧭 Text Direction Guidelines

### Critical Rules for Professional Output

#### ✅ **ALWAYS Use LTR Direction For:**

1. **Numbers in Hebrew text**
   ```latex
   % ❌ Wrong
   יש לנו 100 דגימות
   
   % ✅ Correct
   יש לנו \num{100} דגימות
   ```

2. **Years in Hebrew text**
   ```latex
   % ❌ Wrong
   בשנת 2023 התחיל המחקר
   
   % ✅ Correct
   בשנת \hebyear{2023} התחיל המחקר
   ```

3. **Section numbering**
   ```latex
   % ✅ Automatic LTR numbering
   \hebrewsection{שם הפרק}  % Results in: "1 שם הפרק"
   ```

4. **Page numbers**
   ```latex
   % ✅ Automatic LTR page numbers in footer
   ```

5. **Mathematical expressions**
   ```latex
   % ✅ Always LTR automatically
   \begin{equation}
   y = \beta_0 + \beta_1 x + \varepsilon
   \end{equation}
   ```

6. **Python code blocks**
   ```latex
   % ✅ Always LTR with gray background
   \begin{pythonbox}[Title]
   import numpy as np
   # No Hebrew comments allowed here
   \end{pythonbox}
   ```

7. **Citations and bibliography**
   ```latex
   % ✅ Citation numbers always LTR: [1], [2]
   המחקר של \en{Smith} \cite{smith2023}
   
   % ✅ Bibliography left-aligned for English, right-aligned for Hebrew
   \printenglishbibliography
   \printhebrewbibliography
   ```

#### ✅ **Hebrew RTL Content:**

1. **Main paragraph text**
   ```latex
   זהו טקסט עברי רגיל שזורם מימין לשמאל.
   ```

2. **Hebrew parts of mixed titles**
   ```latex
   \hebrewsection{אלגוריתמי למידה: \entoc{Machine Learning}}
   % Results in: "1 אלגוריתמי למידה: Machine Learning"
   ```

3. **Table content (Hebrew cells)**
   ```latex
   \begin{rtltabular}{|c|c|}
     \hline
     \textbf{עברית} & \textbf{English} \\
     \hline
   \end{rtltabular}
   ```

### Mixed Content Examples

#### Perfect Mixed Sentence
```latex
בשנת \hebyear{2013} פותח מודל \en{Word2Vec} על ידי \en{Mikolov et al.} \cite{mikolov2013}, 
שכלל \num{300} ממדים ונבדק על \num{1000000} מילים.
```

#### Mixed Table
```latex
\begin{hebrewtable}[h]
\caption{השוואת מודלים: \en{Model Comparison}}
\begin{rtltabular}{|c|c|c|}
\hline
\textbf{מודל} & \textbf{Model} & \textbf{דיוק} \\
\hline
רגרסיה ליניארית & Linear Regression & \num{85.2}\% \\
\hline
רשת נוירונים & Neural Network & \num{92.1}\% \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

## 📚 Command Reference

### Language & Direction Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `\en{text}` | English LTR text | `\en{Machine Learning}` |
| `\heb{text}` | Hebrew RTL text | `\heb{טקסט עברי}` |
| `\num{123}` | Numbers in LTR | `\num{100} דגימות` |
| `\hebyear{2025}` | Years in LTR | `\hebyear{2023} בשנת` |
| `\LTR{text}` | Force LTR direction | `\LTR{Left-to-Right}` |
| `\RTL{text}` | Force RTL direction | `\RTL{מימין לשמאל}` |
| `\entoc{text}`| English in Table of Contents | `\hebrewsection{מבוא: \entoc{Intro}}`|
| `\hebfoot{text}` | Hebrew RTL in footer/header | `\hebfoot{כל הזכויות - \en{© Name}}` |
| `\hebtitle{text}` | Hebrew RTL in pythonbox title | `[\hebtitle{כותרת בעברית}]` |

### Section Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `\hebrewsection{title}` | Hebrew section | `\hebrewsection{מבוא}` |
| `\englishsection{title}` | English section | `\englishsection{Introduction}` |
| `\hebrewsubsection{title}` | Hebrew subsection | `\hebrewsubsection{שיטות}` |

### Table Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `\begin{hebrewtable}` | Hebrew table environment | See table examples |
| `\begin{rtltabular}` | RTL tabular | `\begin{rtltabular}{|c|c|}` |

### Code & Figures

| Command | Purpose | Example |
|---------|---------|---------|
| `\begin{pythonbox}[title]` | Code block with gray background | See code examples |
| `\includegraphics` | Include figure | `\includegraphics[width=0.8\textwidth]{plot.png}` |

### Bibliography Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `\cite{key}` | Citation | `\cite{smith2023}` |
| `\printenglishbibliography` | English references | End of document |
| `\printhebrewbibliography` | Hebrew references | End of document |

## 🔧 Advanced Features

### Smart Font Fallback System

The template automatically detects available fonts:

**Windows/MiKTeX (Preferred):**
- Main: Times New Roman
- Hebrew: David CLM
- Sans: Arial
- Mono: Courier New

**Linux/TeX Live (Fallback):**
- Main: Latin Modern Roman
- Hebrew: DejaVu Sans
- Sans: Latin Modern Sans
- Mono: DejaVu Sans Mono

### Custom Environments

#### Professional Code Blocks
```latex
\begin{pythonbox}[Data Analysis Example]
import pandas as pd
import numpy as np

# Load data
df = pd.read_csv(\'data.csv\')
print(f"Dataset shape: {df.shape}")

# Statistical analysis
correlation = df.corr()
print(correlation)
\end{pythonbox}
```

#### Advanced Tables
```latex
\begin{hebrewtable}[h]
\caption{תוצאות מפורטות: \en{Detailed Results}}
\begin{rtltabular}{|c|c|c|c|c|}
\hline
\textbf{ניסוי} & \textbf{Experiment} & \textbf{דגימות} & \textbf{דיוק} & \textbf{זמן} \\
\hline
ניסוי \num{1} & Experiment \num{1} & \num{1000} & \num{94.5}\% & \num{2.3}s \\
\hline
ניסוי \num{2} & Experiment \num{2} & \num{2500} & \num{96.2}\% & \num{5.1}s \\
\hline
\textbf{ממוצע} & \textbf{Average} & \num{1750} & \num{95.4}\% & \num{3.7}s \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

### Custom Footer/Header with Hebrew

For custom footers or headers with Hebrew content, use `\hebfoot{}` with `\en{}` for English:

```latex
% Custom footer with Hebrew RTL and English LTR
\fancyfoot[LE,RO]{\hebfoot{כל הזכויות שמורות - \en{© Dr. Your Name}}}

% Custom header with mixed content
\fancyhead[RE,LO]{\hebfoot{מסמך אקדמי - \en{Academic Document}}}
```

**Important:** Do NOT use `\texthebrew{}` in fancyhdr - it doesn't properly set RTL direction. Always use `\hebfoot{}` for Hebrew in footers/headers.

### Hebrew Titles in Pythonbox

For Hebrew titles in pythonbox, use `\hebtitle{}`:

```latex
\begin{pythonbox}[\hebtitle{פתרון SVM עם cvxopt}]
import numpy as np
\end{pythonbox}
```

For mixed Hebrew/English titles:
```latex
\begin{pythonbox}[\hebtitle{פתרון \en{SVM} עם \en{cvxopt}}]
import numpy as np
\end{pythonbox}
```

**Important:** Always use `\hebtitle{}` for Hebrew in pythonbox titles. Pure English titles don't need wrapping.

### Bibliography Setup

#### .bib File Format
```bibtex
@article{smith2023,
  title={Advanced Machine Learning Techniques},
  author={Smith, John and Doe, Jane},
  journal={Journal of AI Research},
  volume={45},
  number={3},
  pages={123--145},
  year={2023},
  publisher={AI Press},
  keywords={english}  % ← REQUIRED for English references
}

@book{hebrew_book,
  author    = {משה בר-אשר and חיים רבין},
  title     = {מחקרים בלשון העברית},
  publisher = {מוסד ביאליק},
  year      = {2009},
  keywords  = {hebrew} % ← REQUIRED for Hebrew references
}
```

#### Multiple Citations
```latex
מחקרים רבים \cite{smith2023,jones2022,hebrew_book} הראו שיפור משמעותי.
```

## 💡 Best Practices

### 1. **Always Use Number Commands**
```latex
% ❌ Never do this
יש לנו 100 דגימות מ-50 מדינות בשנת 2023.

% ✅ Always do this
יש לנו \num{100} דגימות מ-\num{50} מדינות בשנת \hebyear{2023}.
```

### 2. **Proper English Integration**
```latex
% ✅ Good mixed content
האלגוריתם \en{Random Forest} השיג דיוק של \num{92.1}\% על מאגר הנתונים.

% ✅ For titles in the Table of Contents
\hebrewsection{ניתוח נתונים: \entoc{Data Analysis}}
```

### 3. **Code Block Guidelines**
```latex
% ✅ Professional code formatting
\begin{pythonbox}[Model Training]
from sklearn.ensemble import RandomForestClassifier

# Create and train model
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Evaluate performance
accuracy = model.score(X_test, y_test)
print(f"Accuracy: {accuracy:.3f}")
\end{pythonbox}
```

### 4. **Table Best Practices**
- Use `\en{}` for English content within tables.
- Always use `\num{}` for numbers in tables.
- Keep table structure simple and readable.

### 5. **Citation Guidelines**
- Always add `keywords={english}` or `keywords={hebrew}` to .bib entries.
- Use author names in English within `\en{}`.
- Cite immediately after mentioning the work.

## 🐛 Troubleshooting

### Common Compilation Issues

#### 1. **Font Errors**
```
Error: Font not found
```
**Solution:** Template includes automatic fallback. Ensure you\'re using LuaLaTeX.

#### 2. **Bibliography Not Showing**
```
Empty bibliography
```
**Solutions:**
- Add `keywords={english}` or `keywords={hebrew}` to all .bib entries.
- Run compilation sequence: `lualatex → biber → lualatex`.
- Check .bib file syntax for errors (e.g., use `and` to separate authors).

#### 3. **Wrong Text Direction**
```
Numbers/text appearing in wrong direction
```
**Solutions:**
- Use `\num{}` for all numbers in Hebrew text.
- Use `\en{}` for English terms.
- Use `\entoc{}` for English in titles to fix Table of Contents.

#### 4. **Code Block Issues**
```
Code not displaying properly
```
**Solutions:**
- Use `pythonbox` environment.
- Ensure no Hebrew comments in code.
- Check for special characters in the title.

### Compilation Sequence

#### Standard Method
```bash
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex  # Optional final pass
```

#### With Build Directory (Recommended)
```bash
# Create build directory
mkdir build

# Compile with output directory
lualatex -output-directory=build document.tex
biber build/document
lualatex -output-directory=build document.tex

# Copy PDF to main directory
cp build/document.pdf .
```

#### PowerShell (Windows)
```powershell
# Create build directory
mkdir build -Force

# Compile
lualatex -output-directory=build document.tex
biber build/document
lualatex -output-directory=build document.tex

# Copy result
Copy-Item build\document.pdf .
```

### Debug Mode
```bash
# Run with verbose output for debugging
lualatex -interaction=nonstopmode -file-line-error document.tex
```

## 📞 Getting Help

1. **Check Examples**: Review `simple_example.tex` and `comprehensive_example.tex`.
2. **Verify Setup**: Ensure LuaLaTeX and Biber are installed.
3. **Test Compilation**: Try compiling the provided examples first.
4. **Check Logs**: Review .log files for specific error messages.

---

**Happy Academic Writing! 📝✨**

*For more examples and detailed demonstrations, see `comprehensive_example.tex`*

