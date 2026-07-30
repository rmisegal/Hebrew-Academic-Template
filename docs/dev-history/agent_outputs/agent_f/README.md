# Hebrew Academic Template v5.0 - Unified Edition

**The Definitive LaTeX Class for Hebrew Academic Documents**

**Copyright:** © 2025 Dr. Segal Yoram. All rights reserved.

---

## Table of Contents

1. [Introduction](#introduction)
2. [What's New in v5.0](#whats-new-in-v50)
3. [Features Overview](#features-overview)
4. [System Requirements](#system-requirements)
5. [Installation](#installation)
6. [Quick Start Guide](#quick-start-guide)
7. [Compilation Instructions](#compilation-instructions)
8. [Version Comparison](#version-comparison)
9. [Directory Structure](#directory-structure)
10. [Example Files Guide](#example-files-guide)
11. [Command Reference](#command-reference)
12. [Environment Reference](#environment-reference)
13. [Package Dependencies](#package-dependencies)
14. [Font Configuration](#font-configuration)
15. [Documentation](#documentation)
16. [Troubleshooting](#troubleshooting)
17. [FAQ](#faq)
18. [Contributing](#contributing)
19. [Credits and Acknowledgments](#credits-and-acknowledgments)
20. [License](#license)

---

## Introduction

The **Hebrew Academic Template v5.0** is a comprehensive, production-ready LaTeX class specifically designed for creating professional Hebrew academic documents with seamless English integration. This unified edition represents the culmination of extensive development, combining the best features from all previous versions while fixing all known regressions.

### Why Hebrew Academic Template?

Writing academic documents in Hebrew presents unique challenges:

- **Bidirectional Text:** Hebrew reads right-to-left (RTL) while English, numbers, and mathematical expressions read left-to-right (LTR)
- **Mixed Content:** Academic documents frequently mix Hebrew text with English technical terms, citations, and formulas
- **Typography:** Hebrew fonts often lack special characters and symbols needed in academic writing
- **Bibliography:** Managing mixed Hebrew/English references requires special handling
- **Tables and Figures:** Captions and content need proper directional alignment

The Hebrew Academic Template solves all these challenges with:

- **Automatic Direction Management:** Smart handling of RTL/LTR transitions
- **78 Specialized Commands:** Purpose-built for Hebrew academic writing
- **8 Custom Environments:** Optimized for tables, code, and figures
- **Cross-Platform Support:** Works seamlessly on Windows (MiKTeX) and Linux (TeX Live)
- **Professional Output:** Publication-ready formatting that meets academic standards

### Who Is This For?

- **Academic Researchers** writing papers, theses, and dissertations in Hebrew
- **University Students** preparing coursework and final projects
- **Technical Writers** creating Hebrew documentation with English terminology
- **Book Authors** writing academic books with multiple chapters
- **Educators** preparing course materials and lecture notes
- **Anyone** needing professional Hebrew documents with mixed language content

---

## What's New in v5.0

### Version 5.0 (2025-11-09) - The Unified Edition

Version 5.0 represents a major milestone, unifying all previous versions into a single, comprehensive template:

#### Fixed All 4 Critical Regressions from v3.0

1. **✅ Restored Biber Backend**
   - Superior Unicode support for mixed Hebrew/English bibliographies
   - Better handling of special characters
   - More powerful citation processing

2. **✅ Restored RTL Caption Alignment**
   - Hebrew table captions now properly right-aligned
   - Consistent with Hebrew document flow
   - Professional appearance

3. **✅ Added \phantomsection**
   - PDF bookmarks work without errors
   - Prevents "destination with same identifier" warnings
   - Essential for professional documents

4. **✅ Restored Utility Commands**
   - `\ltr{}` - Protects brackets/parentheses from bidi reversal
   - `\warningsymbol` - Warning triangle symbol (▲)
   - `\checksymbol` - Checkmark symbol (✓)

#### Preserved All 18 Enhancements from v3.0

1. **Chapter Support** - `\hebrewchapter{}` for book-length documents
2. **Enhanced Table Cells** - `\hebcell{}`, `\encell{}`, `\hebheader{}`, `\enheader{}`
3. **Hebrew in Math** - `\hebmath{}`, `\hebsub{}` for Hebrew in formulas
4. **Math Operators** - `\argmin`, `\argmax` for optimization
5. **Special Characters** - `\Rsquared`, `\rarrow`, `\Rtwo` for Hebrew fonts
6. **Non-Floating Code** - `pythonbox*` for long code blocks
7. **Path Support** - `\enpath{}` for filenames with hyphens
8. **Version Tracking** - `\clsversion{}` returns "V05-2025-11-09"
9. **Title Page Version** - `\hebrewversion{}` for document versioning
10. **TikZ Support** - `tikz-cd` package for diagrams
11. **Code Title Color** - Black titles in code blocks
12. **Font Families** - `\courierfont`, `\listingfont` for listings
13. **Counter Management** - Hierarchical chapter/section counters
14. **Bibliography Categories** - Automatic Hebrew/English separation
15. **Float Management** - Python code environment with proper floating
16. **Citation Formatting** - LTR brackets [1], [2], [3]
17. **Equation Support** - Proper RTL/LTR handling in math
18. **Cross-References** - Working `\ref{}` and `\label{}`

#### 100% Backward Compatibility

- **All v1.0 documents compile unchanged**
- **All v3.0 documents compile unchanged**
- **No breaking changes introduced**
- **All 78 commands preserved**

---

## Features Overview

### Core Features (78 Commands)

The template provides 78 specialized commands organized into categories:

#### Text Direction Commands (15)
- **Basic:** `\en{}`, `\heb{}`, `\ilm{}`
- **Numbers:** `\num{}`, `\percent{}`, `\hebyear{}`
- **Advanced:** `\ltr{}`, `\LTR{}`, `\RTL{}`
- **Sections:** `\startenglish`, `\stopenglish`, `\stophebrew`

#### Section Commands (6)
- **Chapter:** `\hebrewchapter{}` - Book chapters with auto-reset
- **Sections:** `\hebrewsection{}`, `\englishsection{}`
- **Subsections:** `\hebrewsubsection{}`
- **Helpers:** `\HebrewTitle{}`, `\HebrewSubtitle{}`

#### Table Commands (8)
- **Environments:** `hebrewtable`, `rtltabular`
- **Cells:** `\hebcell{}`, `\mixedcell{}`, `\encell{}`
- **Headers:** `\hebheader{}`, `\enheader{}`
- **Helper:** `\rtlrow{}` (optional)

#### Figure Commands (2)
- **Command Form:** `\hebrewfigure[placement]{content}{caption}`
- **Environment Form:** `\begin{hebrewfigure}...\end{hebrewfigure}`

#### Code Commands (7)
- **Environments:** `pythonbox`, `pythonbox*`
- **Inline:** `\code{}`, `\englishterm{}`
- **Support:** `\enpath{}`, `\listingfont`, `\courierfont`

#### Math Commands (8)
- **Hebrew in Math:** `\hebmath{}`, `\hebsub{}`, `\hebtextmath{}`
- **Operators:** `\argmin`, `\argmax`
- **Special:** `\Rsquared`, `\Rtwo`, `\rarrow`

#### Bibliography Commands (3)
- **Display:** `\printhebrewbibliography`, `\printenglishbibliography`
- **Utility:** `\ltrnumber{}`

#### Title Commands (5)
- **Define:** `\hebrewtitle{}`, `\englishtitle{}`, `\hebrewauthor{}`
- **Version:** `\hebrewversion{}`
- **Generate:** `\maketitle`

#### Symbol Commands (2)
- **Warning:** `\warningsymbol` - Black triangle (▲)
- **Check:** `\checksymbol` - Checkmark (✓)

#### Utility Commands (22)
- **Lists:** `\Hitem{}`
- **Version:** `\clsversion` - Returns "V05-2025-11-09"
- **PDF Strings:** Special handling for hyperref
- **And many more internal utilities...**

### Environment Features (8 Environments)

1. **hebrewtable** - RTL table wrapper with caption support
2. **rtltabular** - RTL column ordering
3. **hebrewfigure** - Figure environment with Hebrew captions
4. **pythonbox** - Floating code with syntax highlighting
5. **pythonbox*** - Non-floating code for long listings
6. **python** - Float environment for code
7. **hebrew** - Standard polyglossia Hebrew environment
8. **english** - Standard polyglossia English environment

### Package Support (24+ Packages)

The template integrates with:

- **Languages:** fontspec, polyglossia, luabidi
- **Math:** amsmath, amssymb
- **Graphics:** graphicx, float, tikz-cd
- **Tables:** longtable, tabularx, array, booktabs
- **Bibliography:** biblatex with biber backend
- **Code:** tcolorbox, listings, fvextra, xcolor
- **Layout:** geometry, fancyhdr, titlesec, setspace
- **PDF:** hyperref with Unicode support

---

## System Requirements

### Required Software

#### Windows
- **MiKTeX** (latest version) or **TeX Live 2023+**
- **LuaLaTeX** compiler (included with distributions)
- **Biber** (included with distributions)
- **Text Editor:** Any LaTeX editor (TeXstudio, TeXmaker, VS Code with LaTeX Workshop)

#### Linux
- **TeX Live 2023+** (full installation recommended)
- **LuaLaTeX** compiler
- **Biber** bibliography processor
- **Text Editor:** Any LaTeX editor

#### macOS
- **MacTeX 2023+**
- **LuaLaTeX** and **Biber** (included)
- **Text Editor:** TeXShop, TeXstudio, or any LaTeX editor

### Font Requirements

The template uses a smart fallback system:

#### Windows Fonts (Primary)
- **Main:** Times New Roman
- **Hebrew:** David CLM
- **Sans:** Arial
- **Mono:** Courier New

#### Linux/macOS Fonts (Fallback)
- **Main:** Latin Modern Roman
- **Hebrew:** DejaVu Sans
- **Sans:** Latin Modern Sans
- **Mono:** DejaVu Sans Mono

All fonts are detected automatically. The template will use the best available fonts on your system.

---

## Installation

### Method 1: Local Installation (Recommended for Single Projects)

1. **Download the template:**
   ```bash
   git clone https://github.com/yourusername/hebrew-academic-template.git
   cd hebrew-academic-template
   ```

2. **Copy the class file to your project:**
   ```bash
   cp hebrew-academic-template.cls /path/to/your/project/
   ```

3. **Start using in your document:**
   ```latex
   \documentclass{hebrew-academic-template}
   ```

### Method 2: System-Wide Installation

#### Windows (MiKTeX)

1. **Find your local texmf directory:**
   ```powershell
   kpsewhich -var-value TEXMFHOME
   ```

2. **Create the directory structure:**
   ```powershell
   mkdir %USERPROFILE%\texmf\tex\latex\hebrew-academic-template
   ```

3. **Copy the class file:**
   ```powershell
   copy hebrew-academic-template.cls %USERPROFILE%\texmf\tex\latex\hebrew-academic-template\
   ```

4. **Refresh the database:**
   ```powershell
   initexmf --update-fndb
   ```

#### Linux (TeX Live)

1. **Find your local texmf directory:**
   ```bash
   kpsewhich -var-value TEXMFHOME
   ```

2. **Create the directory structure:**
   ```bash
   mkdir -p ~/texmf/tex/latex/hebrew-academic-template
   ```

3. **Copy the class file:**
   ```bash
   cp hebrew-academic-template.cls ~/texmf/tex/latex/hebrew-academic-template/
   ```

4. **Refresh the database:**
   ```bash
   mktexlsr ~/texmf
   ```

### Method 3: Package Manager Installation (Future)

We're working on making the template available through:
- CTAN (Comprehensive TeX Archive Network)
- MiKTeX Package Manager
- TeX Live Manager (tlmgr)

Stay tuned for updates!

---

## Quick Start Guide

### Your First Document

Create a new file `my_first_hebrew_doc.tex`:

```latex
\documentclass{hebrew-academic-template}

% Bibliography (if needed)
\addbibresource{references.bib}

% Document metadata
\hebrewtitle{המסמך הראשון שלי}
\englishtitle{My First Document}
\hebrewauthor{השם שלך}
\date{\textenglish{November 2025}}

\begin{document}

% Generate title page
\maketitle

% Table of contents
\tableofcontents
\newpage

% First section
\hebrewsection{מבוא: \entoc{Introduction}}

זהו המסמך הראשון שלי עם התבנית האקדמית העברית.
התבנית תומכת בטקסט עברי עם שילוב של \en{English terms}
ומספרים כמו \num{123} ואחוזים כמו \percent{95.5}.

\hebrewsubsection{תת-סעיף: \entoc{Subsection}}

הנה נוסחה מתמטית: $E = mc^2$

והנה רשימה:
\begin{itemize}
\item פריט ראשון עם \en{English}
\item פריט שני עם מספר \num{42}
\item פריט שלישי
\end{itemize}

% Bibliography (if you have references)
\newpage
\printenglishbibliography

\end{document}
```

### Compile Your Document

```bash
# First compilation
lualatex my_first_hebrew_doc.tex

# Process bibliography (if you have citations)
biber my_first_hebrew_doc

# Second compilation (incorporate bibliography)
lualatex my_first_hebrew_doc.tex

# Third compilation (finalize cross-references)
lualatex my_first_hebrew_doc.tex
```

---

## Compilation Instructions

### Standard Workflow (LuaLaTeX + Biber)

The template requires LuaLaTeX for proper RTL/LTR handling and Unicode support:

```bash
# Step 1: Initial compilation
lualatex document.tex

# Step 2: Process bibliography
biber document

# Step 3: Incorporate bibliography
lualatex document.tex

# Step 4: Finalize references
lualatex document.tex
```

### Why Multiple Compilations?

1. **First run:** Generates auxiliary files (.aux, .toc, .lof)
2. **Biber run:** Processes bibliography entries and citations
3. **Second run:** Incorporates bibliography, updates references
4. **Third run:** Finalizes cross-references, page numbers, TOC

### Build Automation

#### Using latexmk

Create `.latexmkrc`:

```perl
$pdf_mode = 4;  # Use lualatex
$biber = 'biber';
$bibtex_use = 2;  # Use biber
```

Then compile with:

```bash
latexmk -lualatex document.tex
```

#### Using Make

Create `Makefile`:

```makefile
MAIN = document
COMPILER = lualatex
BIB = biber

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(COMPILER) $(MAIN)
	$(BIB) $(MAIN)
	$(COMPILER) $(MAIN)
	$(COMPILER) $(MAIN)

clean:
	rm -f $(MAIN).{aux,bbl,bcf,blg,log,out,run.xml,toc,lof,lot}

.PHONY: all clean
```

Then compile with:

```bash
make
```

#### Using VS Code

Add to `.vscode/settings.json`:

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
        "%DOC%"
      ]
    },
    {
      "name": "biber",
      "command": "biber",
      "args": ["%DOCFILE%"]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "Hebrew Academic",
      "tools": [
        "lualatex",
        "biber",
        "lualatex",
        "lualatex"
      ]
    }
  ]
}
```

---

## Version Comparison

### Feature Evolution Across Versions

| Feature | v1.0 (2025-09-26) | v3.0 (2025-10-28) | v5.0 (2025-11-09) |
|---------|-------------------|-------------------|-------------------|
| **Base Class** | article | article | article |
| **Commands** | 60 | 72 | 78 |
| **Environments** | 6 | 8 | 8 |
| **Packages** | 22 | 24 | 24+ |
| **Bibliography Backend** | biber ✓ | bibtex ✗ | biber ✓ |
| **RTL Captions** | ✓ | ✗ | ✓ |
| **Chapter Support** | ✗ | ✓ | ✓ |
| **Enhanced Tables** | Basic | Advanced | Advanced |
| **Hebrew in Math** | Basic | Advanced | Advanced |
| **Non-Floating Code** | ✗ | ✓ | ✓ |
| **Path Support** | ✗ | ✓ | ✓ |
| **PDF Bookmarks** | Issues | Issues | Fixed ✓ |
| **Version Tracking** | ✗ | ✓ | ✓ |
| **Symbol Commands** | ✓ | ✗ | ✓ |
| **Special Characters** | ✗ | ✓ | ✓ |

### Command Availability by Version

| Command Category | v1.0 | v3.0 | v5.0 |
|------------------|------|------|------|
| **Text Direction** | 12 | 14 | 15 |
| **Sections** | 5 | 6 | 6 |
| **Tables** | 4 | 7 | 8 |
| **Figures** | 1 | 2 | 2 |
| **Code** | 3 | 7 | 7 |
| **Math** | 1 | 8 | 8 |
| **Bibliography** | 3 | 3 | 3 |
| **Symbols** | 2 | 0 | 2 |
| **Utilities** | 29 | 25 | 27 |
| **Total** | 60 | 72 | 78 |

### Migration Impact

| From Version | To v5.0 | Breaking Changes | Action Required |
|--------------|---------|------------------|-----------------|
| v1.0 | Seamless | None | None - just recompile |
| v3.0 Oct 26 | Seamless | None | None - just recompile |
| v3.0 Oct 28 | Seamless | None | None - just recompile |
| New Users | N/A | N/A | Use v5.0 directly |

---

## Directory Structure

### Template Distribution

```
hebrew-academic-template-v5/
├── hebrew-academic-template.cls   # Main class file (v5.0)
├── README.md                       # This documentation
├── USAGE_GUIDE.md                 # Complete command reference
├── MIXED_CONTENT_GUIDE.md        # RTL/LTR mixing guide
├── CHANGELOG.md                   # Version history
├── MIGRATION_GUIDE.md             # Upgrade instructions
├── FEATURES.md                    # Feature comparison
├── LICENSE                        # License information
├── examples/                      # Example documents
│   ├── simple_article.tex        # Basic article example
│   ├── simple_article.bib        # Bibliography for article
│   ├── research_paper.tex        # Research paper example
│   ├── research_paper.bib        # Research bibliography
│   ├── thesis.tex                # Thesis/dissertation example
│   ├── thesis.bib                # Thesis bibliography
│   ├── book_chapter.tex          # Book chapter example
│   ├── technical_report.tex      # Technical report example
│   └── images/                   # Sample images
│       ├── example_plot.png      # Sample plot
│       ├── diagram.pdf           # Sample diagram
│       └── logo.jpg              # Sample logo
├── templates/                     # Document templates
│   ├── article_template.tex      # Article starter
│   ├── thesis_template.tex       # Thesis starter
│   ├── book_template.tex         # Book starter
│   └── presentation_notes.tex    # Presentation notes
├── docs/                          # Additional documentation
│   ├── command_reference.pdf     # PDF command reference
│   ├── troubleshooting.md        # Common issues
│   └── best_practices.md         # Writing guidelines
└── tests/                         # Test files
    ├── test_basic.tex            # Basic functionality test
    ├── test_tables.tex           # Table commands test
    ├── test_math.tex             # Math commands test
    ├── test_bibliography.tex      # Bibliography test
    └── test_all.tex              # Comprehensive test
```

### Recommended Project Structure

For your own projects:

```
my_project/
├── main.tex                       # Main document
├── hebrew-academic-template.cls   # Copy of class file
├── references.bib                 # Bibliography database
├── chapters/                      # Chapter files (for books/thesis)
│   ├── chapter1.tex
│   ├── chapter2.tex
│   └── ...
├── figures/                       # Images and diagrams
│   ├── fig1.png
│   ├── fig2.pdf
│   └── ...
├── tables/                        # External table files
│   └── data.csv
├── code/                          # Source code files
│   └── algorithm.py
└── build/                         # Compilation output (optional)
    ├── main.pdf
    └── [auxiliary files]
```

---

## Example Files Guide

### 1. Simple Article (`examples/simple_article.tex`)

A basic academic article demonstrating:
- Document setup and metadata
- Hebrew sections with English translations
- Mixed language paragraphs
- Basic tables and figures
- Bibliography with Hebrew and English sources

**Use this for:** Papers, assignments, short reports

### 2. Research Paper (`examples/research_paper.tex`)

An advanced research paper showing:
- Abstract in Hebrew and English
- Literature review with extensive citations
- Mathematical formulas and theorems
- Complex tables with mixed content
- Code examples with syntax highlighting
- Multiple figure arrangements

**Use this for:** Journal submissions, conference papers

### 3. Thesis Template (`examples/thesis.tex`)

A complete thesis/dissertation structure featuring:
- Title page with university branding
- Abstract, acknowledgments, dedications
- Multiple chapters using `\hebrewchapter{}`
- Appendices with supplementary material
- Extensive bibliography
- List of figures and tables

**Use this for:** Master's thesis, PhD dissertation

### 4. Book Chapter (`examples/book_chapter.tex`)

A book chapter template demonstrating:
- Chapter-level organization
- Section and subsection hierarchy
- Extensive footnotes
- Side notes and margin material
- Chapter-specific bibliography

**Use this for:** Academic books, textbooks, monographs

### 5. Technical Report (`examples/technical_report.tex`)

A technical documentation template showing:
- Executive summary
- Technical specifications
- Code documentation with `pythonbox`
- System diagrams using TikZ
- Performance tables and charts
- Implementation details

**Use this for:** Technical documentation, system reports

---

## Command Reference

### Most Used Commands

#### Text Direction (Essential)

```latex
\en{English text}           % English in Hebrew context
\heb{Hebrew text}          % Hebrew in English context
\num{123}                  % Numbers (always LTR)
\percent{95.5}             % Percentage with %
\hebyear{2025}             % Years in Hebrew text
```

#### Sections

```latex
\hebrewchapter{Chapter Title}              % For books
\hebrewsection{Title: \entoc{English}}     % Main sections
\hebrewsubsection{Title: \entoc{English}}  % Subsections
\englishsection{English Section}           % English sections
```

#### Tables

```latex
\begin{hebrewtable}[h]
  \caption{Caption: \en{English}}
  \begin{rtltabular}{|c|c|c|}
    \hline
    \hebcell{Hebrew} & \encell{English} & \num{123} \\
    \hline
  \end{rtltabular}
\end{hebrewtable}
```

#### Code

```latex
\begin{pythonbox}[Title: \en{Code Example}]
import numpy as np
# Python code here
\end{pythonbox}

\code{inline_code}                % Inline code
\englishterm{technical term}      % Technical terms
\enpath{/path/with-hyphens.txt}  % File paths
```

#### Math

```latex
$\hebmath{Hebrew}$          % Hebrew in math mode
$x_{\hebsub{Hebrew}}$      % Hebrew subscript
\argmin, \argmax           % Optimization operators
\Rsquared                  % R² symbol
```

#### Bibliography

```latex
\cite{key}                           % Citation
\printhebrewbibliography            % Hebrew references
\printenglishbibliography           % English references
```

For complete command documentation, see [USAGE_GUIDE.md](USAGE_GUIDE.md).

---

## Environment Reference

### hebrewtable

RTL table with Hebrew caption:

```latex
\begin{hebrewtable}[htbp]
  \caption{Hebrew Caption: \en{English Translation}}
  \label{tab:example}
  % Table content
\end{hebrewtable}
```

### rtltabular

Right-to-left column ordering:

```latex
\begin{rtltabular}{|r|c|l|}
  \hline
  % Rightmost & Middle & Leftmost \\
  \hline
\end{rtltabular}
```

### pythonbox / pythonbox*

Floating (pythonbox) or non-floating (pythonbox*) code:

```latex
\begin{pythonbox}[Optional Title]
# Python code
\end{pythonbox}

\begin{pythonbox*}[Long Code - Non-floating]
# Very long Python code
# Can break across pages
\end{pythonbox*}
```

---

## Package Dependencies

### Core Requirements

| Package | Purpose | Version Required |
|---------|---------|------------------|
| fontspec | Font selection | Any recent |
| polyglossia | Language support | 1.45+ |
| luabidi | Bidirectional text | Latest |
| biblatex | Bibliography | 3.14+ |

### Mathematical Packages

| Package | Purpose |
|---------|---------|
| amsmath | Advanced math |
| amssymb | Math symbols |

### Graphics and Floats

| Package | Purpose |
|---------|---------|
| graphicx | Image inclusion |
| float | Float placement |
| caption | Caption formatting |
| tikz-cd | Commutative diagrams |

### Tables

| Package | Purpose |
|---------|---------|
| longtable | Multi-page tables |
| tabularx | Flexible columns |
| array | Enhanced arrays |
| booktabs | Professional rules |

### Code and Colors

| Package | Purpose |
|---------|---------|
| tcolorbox | Colored boxes |
| listings | Code listings |
| fvextra | Verbatim extras |
| xcolor | Color support |
| newfloat | Custom floats |

### Layout and Structure

| Package | Purpose |
|---------|---------|
| geometry | Page dimensions |
| fancyhdr | Headers/footers |
| titlesec | Section formatting |
| setspace | Line spacing |
| hyperref | PDF features |

---

## Font Configuration

### Automatic Font Detection

The template automatically detects and uses the best available fonts:

#### Windows Priority (MiKTeX)

```latex
Main Text:  Times New Roman → Latin Modern Roman
Hebrew:     David CLM → DejaVu Sans → Latin Modern Roman
Sans-serif: Arial → DejaVu Sans → Latin Modern Sans
Monospace:  Courier New → DejaVu Sans Mono → Latin Modern Mono
```

#### Linux Priority (TeX Live)

```latex
Main Text:  Latin Modern Roman (default)
Hebrew:     DejaVu Sans → Latin Modern Roman
Sans-serif: DejaVu Sans → Latin Modern Sans
Monospace:  DejaVu Sans Mono → Latin Modern Mono
```

### Installing Missing Fonts

#### Windows

Hebrew fonts can be installed from:
- **David CLM:** Part of Culmus project
- Download: https://sourceforge.net/projects/culmus/

#### Linux

```bash
# Debian/Ubuntu
sudo apt-get install culmus fonts-dejavu

# Fedora/RHEL
sudo dnf install culmus-fonts dejavu-fonts

# Arch
sudo pacman -S culmus dejavu-fonts
```

### Custom Font Configuration

To use custom fonts, add after `\documentclass`:

```latex
\setmainfont{Your Font}[
  Renderer=Harfbuzz,
  Ligatures=TeX
]

\newfontfamily\hebrewfont{Your Hebrew Font}[
  Renderer=Harfbuzz,
  Script=Hebrew,
  Scale=MatchLowercase
]
```

---

## Documentation

### Core Documentation Files

1. **[README.md](README.md)** - This file, comprehensive overview
2. **[USAGE_GUIDE.md](USAGE_GUIDE.md)** - Complete command reference (3000+ lines)
3. **[MIXED_CONTENT_GUIDE.md](MIXED_CONTENT_GUIDE.md)** - RTL/LTR mixing rules
4. **[CHANGELOG.md](CHANGELOG.md)** - Version history and changes
5. **[MIGRATION_GUIDE.md](MIGRATION_GUIDE.md)** - Upgrading from older versions
6. **[FEATURES.md](FEATURES.md)** - Feature comparison across versions

### Additional Resources

#### In the `docs/` folder:

- **command_reference.pdf** - Printable command reference
- **troubleshooting.md** - Common issues and solutions
- **best_practices.md** - Writing guidelines and tips
- **examples.md** - Annotated examples

#### Online Resources:

- **GitHub Repository:** https://github.com/yourusername/hebrew-academic-template
- **Issue Tracker:** Report bugs and request features
- **Wiki:** Community-contributed tips and tricks
- **Discussions:** Q&A and community support

---

## Troubleshooting

### Common Issues and Solutions

#### 1. Compilation Errors

**Error:** "File 'hebrew-academic-template.cls' not found"
```bash
# Solution: Ensure the .cls file is in the same directory as your .tex file
# Or install system-wide (see Installation section)
```

**Error:** "Missing font David CLM"
```latex
% Solution: The template will automatically fall back to DejaVu Sans
% Or install Culmus fonts (see Font Configuration)
```

#### 2. Bibliography Issues

**Error:** "Empty bibliography"
```bash
# Solution: Run biber, not bibtex
biber document  # Correct
# NOT: bibtex document  # Wrong
```

**Error:** "Citation undefined"
```bash
# Solution: Compile multiple times
lualatex document && biber document && lualatex document && lualatex document
```

#### 3. Direction Problems

**Problem:** Numbers appear reversed
```latex
% Wrong: המספר הוא 123
% Correct: המספר הוא \num{123}
```

**Problem:** English text appears RTL
```latex
% Wrong: This is English text in Hebrew
% Correct: \en{This is English text} in Hebrew
```

#### 4. Table Issues

**Problem:** Mixed content not aligning
```latex
% Wrong: Hebrew text / English
% Correct: \hebcell{Hebrew text / \en{English}}
```

#### 5. PDF Bookmark Errors

**Error:** "destination with the same identifier"
```latex
% Solution: Already fixed in v5.0 with \phantomsection
% Make sure you're using v5.0
```

### Getting Help

1. **Check the documentation** - Most answers are in the guides
2. **Search existing issues** - GitHub Issues page
3. **Ask the community** - GitHub Discussions
4. **Report bugs** - Create a new issue with minimal example

---

## FAQ

### General Questions

**Q: Why LuaLaTeX instead of pdfLaTeX?**
A: LuaLaTeX provides superior Unicode support and bidirectional text handling essential for Hebrew documents.

**Q: Can I use this template for commercial documents?**
A: Yes, but please respect the copyright notice. See LICENSE for details.

**Q: Is this template compatible with Overleaf?**
A: Yes, upload the .cls file to your Overleaf project and set the compiler to LuaLaTeX.

### Technical Questions

**Q: How do I add a new Hebrew font?**
A: Use `\newfontfamily\hebrewfont{FontName}[Script=Hebrew]` in your preamble.

**Q: Can I change the bibliography style?**
A: Yes, modify `style=ieee` in the template to any biblatex style.

**Q: How do I create a bilingual abstract?**
A: See the thesis example for a complete bilingual abstract implementation.

### Language Questions

**Q: How do I type Hebrew vowels (nikud)?**
A: Simply type them; the template handles nikud correctly with Hebrew fonts.

**Q: Can I mix Arabic or other RTL languages?**
A: Yes, add the language with `\setotherlanguage{arabic}` and create similar commands.

### Troubleshooting Questions

**Q: My Hebrew text appears as boxes/squares**
A: Install Hebrew fonts (David CLM or DejaVu Sans) on your system.

**Q: Citations show as [?]**
A: Run biber between LaTeX compilations: `lualatex → biber → lualatex`

**Q: The table of contents is empty**
A: Compile twice: first generates .toc file, second includes it.

---

## Contributing

We welcome contributions to make the Hebrew Academic Template even better!

### How to Contribute

1. **Report Issues**
   - Use GitHub Issues
   - Include minimal working example (MWE)
   - Specify your OS and TeX distribution

2. **Suggest Features**
   - Open a discussion on GitHub
   - Explain the use case
   - Provide examples if possible

3. **Submit Code**
   - Fork the repository
   - Create a feature branch
   - Submit a pull request
   - Include tests and documentation

### Development Guidelines

- Maintain backward compatibility
- Document new commands thoroughly
- Test on both Windows and Linux
- Follow existing code style
- Update CHANGELOG.md

### Testing

Before submitting changes:

```bash
# Run basic tests
lualatex tests/test_all.tex

# Check compilation
cd examples
for file in *.tex; do
    lualatex "$file"
done
```

### Code of Conduct

- Be respectful and inclusive
- Help others learn
- Give credit where due
- Focus on constructive feedback

---

## Credits and Acknowledgments

### Primary Author

**Dr. Segal Yoram**
- Creator and maintainer of Hebrew Academic Template
- Copyright holder
- Contact: [email]

### Contributors

The following individuals have contributed to the development of v5.0:

- **Agent A** - Discovery and analysis of all version features
- **Agent B** - Version comparison and conflict resolution
- **Agent C** - Best practices and pattern analysis
- **Agent D** - Merge engineering and implementation
- **Agent E** - Testing and validation
- **Agent F** - Documentation and guides

### Special Thanks

- The **Culmus Project** for Hebrew fonts
- **polyglossia** maintainers for Hebrew language support
- **biblatex** team for bibliography management
- The **LuaTeX** team for bidirectional text support
- The **TeX** community for continuous support and feedback

### Institutional Support

- Universities and research institutions using the template
- Students and researchers providing feedback
- The open-source community

### Version History Credits

- **v1.0 (2025-09-26)** - Initial release by Dr. Segal Yoram
- **v3.0 (2025-10-28)** - Major upgrade with chapter support
- **v5.0 (2025-11-09)** - Unified edition combining all features

---

## License

### Copyright Notice

```
Hebrew Academic Template v5.0
Copyright © 2025 Dr. Segal Yoram. All rights reserved.
```

### Usage Rights

This template is provided for academic and educational use with the following terms:

1. **Attribution Required**
   - Maintain copyright notices in source files
   - Credit the template in your document (acknowledgments or colophon)

2. **Permitted Uses**
   - Academic papers, theses, dissertations
   - Educational materials and textbooks
   - Research documentation
   - Personal projects

3. **Distribution**
   - You may share the template with others
   - Modifications must be clearly marked
   - Original copyright must be preserved

4. **Commercial Use**
   - Allowed with attribution
   - Cannot claim as your own work
   - Cannot sell the template itself

### Warranty Disclaimer

This template is provided "as is" without warranty of any kind, express or implied. The authors are not liable for any damages arising from its use.

### Contact

For licensing questions or special arrangements:
- Email: [Dr. Segal Yoram's email]
- GitHub: [Repository issues page]

---

## Appendix A: Command Quick Reference

### Essential Daily Commands

```latex
% Text direction
\en{English}              % English in Hebrew
\num{123}                % Numbers
\percent{95}             % Percentages
\hebyear{2025}           % Years

% Sections
\hebrewsection{Title: \entoc{English}}
\hebrewsubsection{Title: \entoc{English}}

% Tables
\hebcell{Mixed \en{content}}
\encell{English only}

% Code
\code{inline_code}
\begin{pythonbox}[Title]
# code here
\end{pythonbox}

% Bibliography
\cite{key}
\printenglishbibliography
```

---

## Appendix B: Compilation Quick Reference

### Basic Compilation

```bash
# Quick compile (no bibliography)
lualatex document.tex

# Full compile (with bibliography)
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex
```

### Build Automation

```bash
# Using latexmk
latexmk -lualatex document.tex

# Using make
make

# Clean auxiliary files
latexmk -c document.tex
# or
make clean
```

---

## Appendix C: Version Migration Checklist

### Upgrading to v5.0

- [ ] Backup your current documents
- [ ] Replace .cls file with v5.0
- [ ] No changes needed in .tex files
- [ ] Recompile with lualatex
- [ ] Verify bibliography with biber
- [ ] Check PDF bookmarks work
- [ ] Enjoy new features!

---

## Final Notes

The Hebrew Academic Template v5.0 represents the culmination of extensive development and community feedback. It provides a professional, feature-rich solution for Hebrew academic writing that:

- **Works out of the box** with sensible defaults
- **Handles complexity** when you need advanced features
- **Maintains compatibility** with existing documents
- **Produces beautiful** professional output

Whether you're writing your first Hebrew assignment or preparing a doctoral dissertation, this template provides the tools you need for success.

**Happy writing! בהצלחה!**

---

*Hebrew Academic Template v5.0 - The definitive solution for Hebrew academic documents*

*Last updated: November 9, 2025*
*Documentation Version: 1.0.0*
*Total Lines: ~2000*