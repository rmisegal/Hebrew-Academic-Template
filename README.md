# Hebrew Academic Template

**Version 7.0.4** | January 2026

A comprehensive LaTeX class for Hebrew academic documents with seamless English integration, designed for LuaLaTeX with polyglossia and luabidi.

## Features

### Core Capabilities
- **Bidirectional Text Support**: Seamless Hebrew (RTL) and English (LTR) integration
- **Modern Table System**: tabularray-based tables with proper RTL alignment
- **Multiple Document Modes**: Article and Book modes with automatic adaptations
- **Academic Formatting**: Bibliography, footnotes, TOC, figures, and more
- **Cross-Chapter References**: Smart references that work in standalone mode

### Table System (v7.0+)
The template includes a modern table system with four built-in themes:

| Theme | Description | Use Case |
|-------|-------------|----------|
| `fancytable` | Blue header, all borders, bold headers | Default, general use |
| `tblrminimal` | booktabs-style, no vertical lines | Academic papers |
| `tblrstriped` | Alternating row colors | Data tables |
| `tblracademic` | Thick top/bottom lines, clean | Formal documents |

#### Quick Table Syntax
```latex
\begin{fancytable}{ccc}{Table Caption}
Header 1 & Header 2 & Header 3 \\
Data 1 & Data 2 & Data 3 \\
\end{fancytable}
```

#### Column Types
| Type | Description | Example |
|------|-------------|---------|
| `c` | Center-aligned | Numbers, short text |
| `l` | Left-aligned | English text |
| `r` | Right-aligned | Hebrew text |
| `R{width}` | Fixed-width, right-aligned | Hebrew paragraphs |
| `L{width}` | Fixed-width, left-aligned | English paragraphs |
| `C{width}` | Fixed-width, centered | Mixed content |
| `H` | Hebrew column (auto RTL) | Hebrew headers |
| `E` | English column (auto LTR) | English headers |

#### Numbers in Tables
Wrap numbers in `\en{}` for proper LTR display:
```latex
Price & \en{4,500} NIS \\
```

## Installation

1. Copy `hebrew-academic-template.cls` to your project directory
2. Ensure you have LuaLaTeX installed (MiKTeX or TeX Live)
3. Required fonts: David CLM (Hebrew), Times New Roman (English)

## Usage

### Basic Document
```latex
\documentclass{hebrew-academic-template}

\hebrewtitle{כותרת המסמך}
\englishtitle{Document Title}
\hebrewauthor{שם המחבר}

\begin{document}
\maketitle

\hebrewsection{מבוא}
טקסט בעברית עם \en{English} מעורב.

\end{document}
```

### Book Mode
```latex
\documentclass[book]{hebrew-academic-template}

\begin{document}
\frontmatter
\tableofcontents

\mainmatter
\hebrewchapter{פרק ראשון}
...
\end{document}
```

## Examples

The `examples/` folder contains complete working examples:

| Example | Level | Demonstrates |
|---------|-------|--------------|
| `beginner_example.tex` | Beginner | Basic document structure |
| `intermediate_example.tex` | Intermediate | Sections, lists, basic formatting |
| `advanced_example.tex` | Advanced | Tables, figures, code blocks |
| `expert_example.tex` | Expert | Full book with all features |
| `table_example.tex` | Tables | All table themes and layouts |
| `bibliography_example.tex` | References | IEEE-style citations |
| `footnote_example.tex` | Footnotes | Hebrew/English footnotes |
| `image_example.tex` | Figures | Image handling in RTL |
| `book_example.tex` | Book | Multi-chapter book structure |

## Compiling

Use LuaLaTeX (not pdfLaTeX or XeLaTeX):

```bash
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex
```

## Key Commands

### Text Direction
| Command | Description |
|---------|-------------|
| `\en{text}` | Inline English text |
| `\he{text}` | Inline Hebrew text |
| `\begin{english}...\end{english}` | English block |
| `\begin{hebrew}...\end{hebrew}` | Hebrew block |

### Sections
| Command | Description |
|---------|-------------|
| `\hebrewsection{title}` | Hebrew section |
| `\hebrewsubsection{title}` | Hebrew subsection |
| `\hebrewchapter{title}` | Hebrew chapter (book mode) |
| `\englishsection{title}` | English section |

### Cross-Chapter References
| Command | Example Output |
|---------|----------------|
| `\chapterref{2}` | פרק 2 |
| `\chapterrefrange{2}{5}` | פרקים 2-5 |
| `\chapterreflist{2,5,7}` | פרקים 2, 5 ו-7 |
| `\chapterrefforward{5}` | יוסבר בפרק 5 |

### Bibliography
```latex
\printhebrewbibliography  % Hebrew sources
\printenglishbibliography % English sources
```

## Changelog

### v7.0.4 (2026-01-02)
- **FIXED**: `R{width}` column type now uses tabularray's Q column
- R{} columns properly inherit RTL right-alignment from themes
- Tables with `R{3cm}R{4cm}R{4cm}` display correctly

### v7.0.3 (2026-01-02)
- **FIXED**: Hebrew table RTL right-alignment
- Added `cells={cmd=\raggedright}` to all tabularray themes
- Fixed: tblrfancy, tblrminimal, tblrstriped, tblracademic, fancytable

### v7.0.2 (2026-01-02)
- **FIXED**: rtltabular legacy table BiDi rendering
- Column spec processing adds `\textdir TRT` to each column

### v7.0.1 (2026-01-02)
- **FIXED**: Column specs now respected (c=center, l=left, r=right)
- **NEW**: R{width}, L{width}, C{width} paragraph columns

### v7.0.0 (2026-01-02)
- **MAJOR**: Added tabularray package for modern table support
- **NEW**: `fancytable` environment and four table themes
- **FIXED**: Row colors no longer cover vertical borders

### v6.3.6 (2026-01-02)
- **FIXED**: Article mode compatibility (thechapter undefined)

### v6.3.5 (2025-12-24)
- **NEW**: Cross-chapter reference commands

### v6.3.4 (2025-12-21)
- **FIXED**: TOC page numbers LTR rendering

### v6.3.3 (2025-12-21)
- **FIXED**: Footer page numbering (Roman numerals in front matter)

### v6.3.2 (2025-12-21)
- **FIXED**: Footer page numbers LTR rendering

### v6.3.1 (2025-12-21)
- **FIXED**: English References page number LTR

### v6.3.0 (2025-12-21)
- **FIXED**: Bibliography TOC single entry

## Requirements

- **Compiler**: LuaLaTeX (MiKTeX 25.x or TeX Live 2025+)
- **Fonts**: David CLM, Times New Roman, Courier New
- **Packages**: polyglossia, luabidi, tabularray, biblatex, tcolorbox, tikz

## License

Copyright (c) 2025 Dr. Segal Yoram. All rights reserved.

## Contributing

Issues and pull requests are welcome at the project repository.
