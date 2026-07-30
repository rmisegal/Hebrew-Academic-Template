# Complete Environment List - Hebrew Academic Template CLS

**Agent A Discovery Report**
**Date:** 2025-11-09

---

## Table Environments

### hebrewtable

**Purpose:** Hebrew table wrapper with RTL support

**Syntax:**
```latex
\begin{hebrewtable}[placement]
  \caption{Hebrew caption}
  % table content
\end{hebrewtable}
```

**Parameters:**
- `placement` (optional): Standard LaTeX float placement (h, t, b, p, H)
  - Default: `htbp`

**Features:**
- Sets `\arraystretch{1.2}` for better row spacing
- Centering applied automatically
- Caption alignment:
  - v1.0 base, latest: Right-aligned (`raggedleft`)
  - v1.0 working, v3.0: Centered (no special alignment)
  - v1.0 image, book: Centered (no caption setup)

**Internal Implementation:**
```latex
\newenvironment{hebrewtable}[1][htbp]{%
  \begin{table}[#1]%
  \begingroup%
  \renewcommand{\arraystretch}{1.2}%
  \captionsetup{justification=raggedleft,singlelinecheck=false}% (base/latest only)
  \centering%
}{%
  \endgroup%
  \end{table}%
}
```

**Versions:** All versions
- base: Line 294
- working: Line 286
- latest: Line 294
- v3.0: Line 308
- image: Line 283
- book: Line 283

**Example Usage:**
```latex
\begin{hebrewtable}[h]
\caption{השוואת מודלים: \en{Model Comparison}}
\begin{rtltabular}{|c|c|c|}
\hline
\textbf{מודל} & \textbf{דיוק} \\
\hline
מודל 1 & \num{95.2}\% \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

---

### rtltabular

**Purpose:** RTL tabular environment for Hebrew tables

**Syntax:**
```latex
\begin{rtltabular}{colspec}
  % table rows
\end{rtltabular}
```

**Parameters:**
- `colspec` (required): Standard LaTeX column specification (e.g., `|c|c|c|`)

**Features:**
- Simple wrapper around standard `tabular` environment
- RTL column ordering (columns must be written in reverse order)
- Works with `\hebcell`, `\mixedcell`, `\encell` commands

**Important Notes:**
- Columns must be written RIGHT-TO-LEFT in source
- Example: For visual order [Hebrew | English | Numbers], write: `Numbers & English & Hebrew`
- Use `m{width}` for vertical centering with cell commands

**Internal Implementation:**
```latex
\newenvironment{rtltabular}[1]{%
  \begin{tabular}{#1}%
}{%
  \end{tabular}%
}
```

**Versions:** All versions
- base: Line 310
- working: Line 314 (with extensive documentation)
- latest: Line 310
- v3.0: Line 336 (with documentation)
- image: Line 310
- book: Line 294

**Example Usage:**
```latex
\begin{rtltabular}{|m{5cm}|m{2cm}|m{3cm}|}
\hline
\textbf{\hebheader{שימוש}} & \textbf{\hebheader{תפקיד}} & \textbf{\enheader{Function}} \\
\hline
\hebcell{מחשבת סכום} & \hebcell{חיבור} & \encell{add()} \\
\hline
\end{rtltabular}
```

---

## Figure Environments

### hebrewfigure (Environment Form)

**Purpose:** Hebrew figure with proper numbering and caption support

**Syntax:**
```latex
\begin{hebrewfigure}[placement]
  \centering
  \includegraphics[options]{filename}
  \caption{Hebrew caption}
  \label{fig:label}
\end{hebrewfigure}
```

**Parameters:**
- `placement` (optional): Standard LaTeX float placement (h, t, b, p, H)
  - Default: `htbp`

**Features:**
- Automatic centering setup
- Proper figure numbering (LTR)
- Caption support with Hebrew/English mixing
- Label support for references

**Internal Implementation:**
```latex
\newenvironment{hebrewfigure}[1][htbp]{%
  \begin{figure}[#1]%
  \centering%
}{%
  \end{figure}%
}
```

**Versions:** v1.0 image, v1.0 book only
- image: Line 434
- book: Line 434

**Note:** v1.0 base, working, latest use **command form** instead:
```latex
\newcommand{\hebrewfigure}[3][htbp]{%
  \begin{figure}[#1]%
    \centering%
    #2%
    \caption{#3}%
  \end{figure}%
}
```

**Example Usage:**
```latex
\begin{hebrewfigure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{plot.png}
  \caption{גרף תוצאות: \en{Results Plot} - הגרף מציג את ההשוואה בין שני המודלים}
  \label{fig:results}
\end{hebrewfigure}

% Reference in text:
ראה איור \en{\ref{fig:results}}
```

---

## Code Environments

### pythonbox (Floating)

**Purpose:** Floating Python code block with gray background and optional title

**Syntax:**
```latex
\begin{pythonbox}[title]
  # Python code here
\end{pythonbox}
```

**Parameters:**
- `title` (optional): Code block title (supports Hebrew/English)
  - Default: empty (no title)

**Features:**
- Gray background (`codegray`: RGB 245,245,245)
- Automatic LTR direction
- Syntax highlighting (Python)
- Floating environment (can move on page)
- Bold black title (v3.0: fixed with `coltitle=black`)
- Line breaking enabled
- Monospace font (Courier New or fallback)
- Tab size: 4 spaces

**Internal Implementation:**
```latex
\newtcblisting{pythonbox}[1][]{
  listing engine=listings,
  listing only,
  colback=codegray,
  colframe=codegray,
  arc=2pt,
  boxrule=0pt,
  left=8pt,
  right=8pt,
  top=8pt,
  bottom=8pt,
  fonttitle=\bfseries,
  coltitle=black,  % v3.0 fix
  title=#1,
  before={\begin{python}\begingroup\selectlanguage{english}\textdir TLT\pardir TLT},
  after={\endgroup\end{python}},
  listing options={
    basicstyle=\pythonverbatimformat,
    tabsize=4,
    breaklines=true,
    showspaces=false,
    showtabs=false,
    language=Python
  }
}
```

**Versions:** All versions
- base: Line 505
- working: Line 607
- latest: Line 505
- v3.0: Line 629
- image: Line 471
- book: Line 471

**Example Usage:**
```latex
\begin{pythonbox}[דוגמה לחישוב: \en{Calculation Example}]
import numpy as np

# Calculate mean
data = np.array([1, 2, 3, 4, 5])
mean_value = np.mean(data)
print(f"Mean: {mean_value}")
\end{pythonbox}
```

---

### pythonbox* (Non-Floating)

**Purpose:** Non-floating Python code block for long code that may span pages

**Syntax:**
```latex
\begin{pythonbox*}[title]
  # Long Python code here
\end{pythonbox*}
```

**Parameters:**
- `title` (optional): Code block title (supports Hebrew/English)

**Features:**
- Same visual style as `pythonbox`
- **Non-floating**: Stays where placed in text
- **Page breaking**: Can split across pages
- Use for long code blocks
- All other features same as `pythonbox`

**Important Notes:**
- If code still overflows into footer, simplify code:
  - Remove: non-core imports, print statements, visualization code
  - Keep: only core algorithm/function
  - Alternative: Convert to pseudocode

**Internal Implementation:**
```latex
\newtcblisting{pythonbox*}[1][]{
  listing engine=listings,
  listing only,
  colback=codegray,
  colframe=codegray,
  arc=2pt,
  boxrule=0pt,
  left=8pt,
  right=8pt,
  top=8pt,
  bottom=8pt,
  fonttitle=\bfseries,
  coltitle=black,
  title=#1,
  before={\begingroup\selectlanguage{english}\textdir TLT\pardir TLT},
  after={\endgroup},
  listing options={
    basicstyle=\pythonverbatimformat,
    tabsize=4,
    breaklines=true,
    showspaces=false,
    showtabs=false,
    language=Python
  }
}
```

**Versions:** v1.0 working only
- working: Line 644

**Example Usage:**
```latex
\begin{pythonbox*}[אלגוריתם מלא: \en{Complete Algorithm}]
import numpy as np
from sklearn.linear_model import LinearRegression

# Load data
X = np.array([[1], [2], [3], [4], [5]])
y = np.array([2, 4, 5, 4, 5])

# Train model
model = LinearRegression()
model.fit(X, y)

# Make predictions
predictions = model.predict(X)
print(f"Predictions: {predictions}")
print(f"Score: {model.score(X, y)}")
\end{pythonbox*}
```

---

## Language Environments

### hebrew

**Purpose:** Hebrew RTL text block (provided by Polyglossia)

**Syntax:**
```latex
\begin{hebrew}
  טקסט עברי כאן
\end{hebrew}
```

**Features:**
- RTL text direction
- Right-aligned paragraphs
- Hebrew typography
- Automatic font switching

**Versions:** All (Polyglossia standard)

---

### english

**Purpose:** English LTR text block (provided by Polyglossia)

**Syntax:**
```latex
\begin{english}
  English text here
\end{english}
```

**Features:**
- LTR text direction
- Left-aligned paragraphs
- English typography
- Automatic font switching

**Versions:** All (Polyglossia standard)

---

## Float Environments

### python (Listing Float)

**Purpose:** Internal float type for Python code listings

**Features:**
- Created by `newfloat` package
- File extension: `.lop`
- Placement: `htbp`
- Name: "Listing"

**Internal Declaration:**
```latex
\DeclareFloatingEnvironment[fileext=lop,placement=htbp,name=Listing]{python}
```

**Versions:** All versions with tcolorbox
- base: Line 497
- working: Line 599
- latest: Line 497
- v3.0: Line 621
- image: Line 463
- book: Line 463

**Note:** This is an internal environment used by `pythonbox`, not typically used directly by users.

---

## Environment Summary

| Environment | Type | Purpose | Versions | Floating? |
|-------------|------|---------|----------|-----------|
| `hebrewtable` | Table | Hebrew table wrapper | All | Yes |
| `rtltabular` | Table | RTL tabular | All | No (inside hebrewtable) |
| `hebrewfigure` | Figure | Hebrew figure | image, book | Yes |
| `pythonbox` | Code | Python code block | All | Yes |
| `pythonbox*` | Code | Non-floating Python | working only | No |
| `hebrew` | Language | Hebrew text block | All (Polyglossia) | No |
| `english` | Language | English text block | All (Polyglossia) | No |
| `python` | Float | Listing float type | All | Yes (internal) |

---

## Environment Comparison by Version

### Table Environments

| Feature | base | working | latest | v3.0 | image | book |
|---------|------|---------|--------|------|-------|------|
| `hebrewtable` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Caption alignment | Right | Center | Right | Center | Center | Center |
| `rtltabular` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RTL column docs | Basic | Extensive | Basic | Extensive | Basic | Basic |

### Figure Environments

| Feature | base | working | latest | v3.0 | image | book |
|---------|------|---------|--------|------|-------|------|
| `hebrewfigure` (cmd) | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| `hebrewfigure` (env) | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |

### Code Environments

| Feature | base | working | latest | v3.0 | image | book |
|---------|------|---------|--------|------|-------|------|
| `pythonbox` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Title color fix | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| `pythonbox*` | ❌ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Overflow docs | ❌ | ✅ | ❌ | ❌ | ❌ | ❌ |

---

## Recommendations for v5.0

### Must Include
1. ✅ `hebrewtable` with configurable caption alignment
2. ✅ `rtltabular` with comprehensive documentation
3. ✅ `hebrewfigure` **both** command and environment forms
4. ✅ `pythonbox` with title color fix (`coltitle=black`)
5. ✅ `pythonbox*` for long code blocks
6. ✅ Language environments (Polyglossia standard)

### Configuration Options
1. Caption alignment: Make configurable (default: right for Hebrew)
2. Figure form: Support both command and environment
3. Code overflow: Include documentation in CLS comments

### Backward Compatibility
1. Keep both figure forms functional
2. Ensure all table features work
3. Maintain all code environment features

---

**Total Environments: 8** (3 table, 2 figure forms, 2 code, 2 language, 1 internal float)

**Recommended for v5.0: All 8 environments with best features from each version**

**Next Step:** See AGENT_A_PACKAGE_LIST.md for complete package requirements.
