# Complete Command List - Hebrew Academic Template CLS

**Agent A Discovery Report**
**Date:** 2025-11-09

---

## Text Direction Commands

### Basic Language Switching (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\en` | `\en{text}` | English LTR text | All | base:204, working:207, latest:204, v3.0:214, image:204, book:204 |
| `\heb` | `\heb{text}` | Hebrew RTL text | All | base:205, working:208, latest:205, v3.0:215, image:205, book:205 |
| `\ilm` | `\ilm{text}` | Inline math/English terms | All | base:206, working:209, latest:206, v3.0:216, image:206, book:206 |

### Number and Year Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\num` | `\num{123}` | Numbers in LTR | All | base:209, working:212, latest:209, v3.0:219, image:209, book:209 |
| `\hebyear` | `\hebyear{2025}` | Years in LTR | All | base:216, working:215, latest:216, v3.0:222, image:216, book:212 |

### Percentage Command (v1.0 base only)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\percent` | `\percent{95.5}` | Percentages with % symbol | base only | base:219 |

### Advanced Direction Commands (v1.0 latest, v3.0)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\ltr` | `\ltr{text}` | Protect LTR text from bidi | latest only | latest:213 |
| `\startenglish` | `\startenglish` | Start English LTR section | All except image | base:229, working:221, latest:229, v3.0:228, book:218 |
| `\stopenglish` | `\stopenglish` | End English section | All except image | base:243, working:235, latest:243, v3.0:242, book:232 |
| `\stophebrew` | `\stophebrew` | Return to Hebrew RTL | All except image | base:236, working:228, latest:236, v3.0:235, book:225 |

### Generic Direction Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\LTR` | `\LTR{text}` | Force LTR direction | All | base:249, working:241, latest:249, v3.0:248, book:238 |
| `\RTL` | `\RTL{text}` | Force RTL direction | All | base:250, working:242, latest:250, v3.0:249, book:239 |

---

## Section Commands

### Standard Section Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebrewsection` | `\hebrewsection{title}` | Hebrew section with auto numbering | All | base:264, working:256, latest:264, v3.0:277, image:253, book:252 |
| `\englishsection` | `\englishsection{title}` | English section with LTR | All | base:271, working:263, latest:271, v3.0:284, image:260, book:260 |
| `\hebrewsubsection` | `\hebrewsubsection{title}` | Hebrew subsection | All | base:284, working:276, latest:284, v3.0:298, image:273, book:272 |

### Chapter Command (v3.0 only)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebrewchapter` | `\hebrewchapter{title}` | Hebrew chapter with section reset | v3.0 only | v3.0:264 |

### Title Helper Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\HebrewTitle` | `\HebrewTitle{num}{title}` | Mixed Hebrew/English title | All | base:72, working:75, latest:72, v3.0:82, image:71, book:71 |
| `\HebrewSubtitle` | `\HebrewSubtitle{num}{title}` | Mixed subtitle | All | base:78, working:81, latest:78, v3.0:88, image:77, book:77 |

---

## Table Commands

### Table Environment Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\begin{hebrewtable}` | `\begin{hebrewtable}[h]` | Hebrew table wrapper | All | base:294, working:286, latest:294, v3.0:308, image:283, book:283 |
| `\begin{rtltabular}` | `\begin{rtltabular}{colspec}` | RTL tabular environment | All | base:310, working:314, latest:310, v3.0:336, image:310, book:294 |

### Basic Table Cell Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebcell` | `\hebcell{text}` | Hebrew RTL cell | All | base:335, working:343, latest:335, v3.0:365, image:301, book:301 |
| `\mixedcell` | `\mixedcell{text}` | Mixed Hebrew/English cell | All | base:343, working:404, latest:343, v3.0:428, image:309, book:309 |

### Advanced Table Cell Commands (v1.0 working only)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\encell` | `\encell{text}` | English LTR cell with padding | working only | working:369 |
| `\hebheader` | `\hebheader{text}` | Hebrew RTL header cell | working only | working:381 |
| `\enheader` | `\enheader{text}` | English LTR header cell | working only | working:396 |

### Table Utility Commands (v1.0 latest only)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\rtlrow` | `\rtlrow[5]{cells}` | Auto-reverse columns for RTL | latest only | latest:320 |

---

## Figure Commands

### Figure Command Form (v1.0 base, working, latest)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebrewfigure` | `\hebrewfigure[h]{content}{caption}` | Hebrew figure with caption | base, working, latest | base:467, working:569, latest:467 |

### Figure Environment Form (v1.0 image, book)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\begin{hebrewfigure}` | `\begin{hebrewfigure}[h]...\end{hebrewfigure}` | Hebrew figure environment | image, book | image:434, book:434 |

---

## Code and Listing Commands

### Code Environment Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\begin{pythonbox}` | `\begin{pythonbox}[title]` | Python code with gray bg | All | base:505, working:607, latest:505, v3.0:629, image:471, book:471 |
| `\pythonverbatimformat` | Internal | Format command for listings | All | base:499, working:601, latest:499, v3.0:623, image:465, book:465 |

### Extended Code Commands (v1.0 working)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\begin{pythonbox*}` | `\begin{pythonbox*}[title]` | Non-floating Python code | working only | working:644 |

### Code Support Commands (v3.0)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\listingfont` | Internal | Courier font for listings | v3.0 only | v3.0:743 |
| `\courierfont` | Internal | Courier New font family | v3.0 only | v3.0:739 |
| `\enpath` | `\enpath{path-with-hyphens}` | Paths/filenames with hyphens | v3.0 only | v3.0:748 |

### Inline Code Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\code` | `\code{text}` | Inline code with font | All | base:476, working:578, latest:476, v3.0:600, image:442, book:442 |
| `\englishterm` | `\englishterm{text}` | English term in italic | All | base:479, working:581, latest:479, v3.0:603, image:445, book:445 |

---

## Mathematical Expression Commands

### Basic Math Commands (v1.0 latest)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebtextmath` | `\hebtextmath{text}` | Hebrew text in math mode | latest only | latest:226 |

### Advanced Math Commands (v1.0 working)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebmath` | `\hebmath{text}` | Hebrew in math formulas | working only | working:681 |
| `\hebsub` | `\hebsub{text}` | Hebrew subscript in math | working only | working:687 |
| `\argmin` | `\argmin` | Math operator argmin | working only | working:523 |
| `\argmax` | `\argmax` | Math operator argmax | working only | working:524 |

### Special Character Commands (v1.0 working)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\Rsquared` | `\Rsquared` | R² symbol | working only | working:695 |
| `\Rtwo` | `\Rtwo` | R² alternative | working only | working:706 |
| `\rarrow` | `\rarrow` | Arrow in RTL context | working only | working:701 |

---

## Symbol Commands (v1.0 latest only)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\warningsymbol` | `\warningsymbol` | Warning triangle | latest only | latest:222 |
| `\checksymbol` | `\checksymbol` | Checkmark | latest only | latest:223 |

---

## Title Page Commands

### Title Definition Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebrewtitle` | `\hebrewtitle{title}` | Hebrew title | All | base:431, working:528, latest:431, v3.0:550, image:397, book:397 |
| `\englishtitle` | `\englishtitle{title}` | English title | All | base:432, working:529, latest:432, v3.0:551, image:398, book:398 |
| `\hebrewauthor` | `\hebrewauthor{author}` | Hebrew author name | All | base:433, working:530, latest:433, v3.0:552, image:399, book:399 |

### Version Command (v1.0 working, v3.0)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\hebrewversion` | `\hebrewversion{version}` | Version text on title page | working, v3.0 | working:531, v3.0:553 |

### Title Generation Command (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\maketitle` | `\maketitle` | Generate title page | All | base:436, working:534, latest:436, v3.0:556, image:402, book:402 |

---

## Bibliography Commands

### Bibliography Display Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\printhebrewbibliography` | `\printhebrewbibliography` | Hebrew references section | All | base:381, working:474, latest:381, v3.0:496, image:347, book:347 |
| `\printenglishbibliography` | `\printenglishbibliography` | English references section | All | base:389, working:482, latest:389, v3.0:504, image:355, book:355 |

### Bibliography Utility Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\ltrnumber` | `\ltrnumber{number}` | Force LTR for bib numbers | All | base:356, working:449, latest:356, v3.0:471, image:322, book:322 |

---

## List Commands (All Versions)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\Hitem` | `\Hitem{text}` | Hebrew item in list | All | base:460, working:562, latest:460, v3.0:584, image:426, book:426 |

---

## Version Information Commands (v3.0 only)

| Command | Syntax | Description | Versions | Line Ref |
|---------|--------|-------------|----------|----------|
| `\clsversion` | `\clsversion` | Returns version string | v3.0 only | v3.0:756 |

---

## Internal/Utility Commands

### PDF String Handling (All Versions)

These commands are defined in `\pdfstringdefDisableCommands` for hyperref compatibility:
- `\def\textenglish#1{#1}`
- `\def\texthebrew#1{#1}`
- `\def\en#1{#1}`
- `\def\heb#1{#1}`
- `\def\ilm#1{#1}`
- `\def\textbf#1{#1}`
- `\def\LTR#1{#1}`
- `\def\HebrewTitle#1#2{#1 #2}`
- `\def\HebrewSubtitle#1#2{#1 #2}`

---

## Summary Statistics

| Category | Count | Notes |
|----------|-------|-------|
| Text Direction Commands | 15 | Core 3 + extended 12 |
| Section Commands | 6 | Including chapter (v3.0) |
| Table Commands | 8 | Basic 4 + advanced 3 + utility 1 |
| Figure Commands | 2 | Command form + environment form |
| Code Commands | 7 | Including v3.0 path support |
| Math Commands | 8 | Basic 1 + advanced 7 |
| Symbol Commands | 2 | v1.0 latest only |
| Title Commands | 5 | Including version |
| Bibliography Commands | 3 | Display + utility |
| List Commands | 1 | Hebrew item |
| Version Commands | 1 | v3.0 only |
| **Total Unique Commands** | **78** | Across all versions |

---

## Recommendations for v5.0

### Must Include (Priority 1)
1. All text direction commands (15)
2. All section commands including `\hebrewchapter` (6)
3. Advanced table cell commands (8)
4. Both figure forms (2)
5. Extended code commands including `\pythonbox*` and `\enpath` (7)
6. Math commands including operators (8)
7. Version tracking (`\clsversion`)

### Optional/Version-Specific (Priority 2)
1. Symbol commands (2) - useful additions
2. Special character fixes (3) - for Hebrew fonts without these glyphs

### Backward Compatibility
1. Keep `\mixedcell` as alias to `\hebcell`
2. Support both figure forms
3. Keep all v1.0 commands functional

---

**Total Commands Recommended for v5.0: 78** (all commands from all versions)

**Next Step:** See AGENT_A_FEATURE_MATRIX.xlsx for detailed version comparison.
