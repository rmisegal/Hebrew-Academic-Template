# Hebrew Academic Template

**Copyright:** © 2025 Dr. Segal Yoram. All rights reserved.

A comprehensive LaTeX template for Hebrew academic documents with seamless English integration, designed for professional academic writing with proper RTL/LTR text direction handling.

## 🌟 Features

### ✅ **Bilingual Support**
- **Hebrew RTL** text with proper direction handling
- **English LTR** integration within Hebrew text
- **Mixed language** titles, subtitles, and content
- **Smart font fallback** system (Windows/Linux compatible)

### ✅ **Academic Formatting**
- **IEEE-style bibliography** with automatic language categorization
- **Professional numbering** (all numbers in LTR direction)
- **Mathematical expressions** with proper LTR orientation
- **Code blocks** with syntax highlighting and gray background
- **Tables** with mixed Hebrew/English content
- **Figures** with bilingual captions

### ✅ **Cross-Platform Compatibility**
- **Windows + MiKTeX**: Uses Times New Roman, David CLM, Arial, Courier New
- **Linux + TeX Live**: Automatic fallback to Latin Modern, DejaVu Sans fonts
- **Smart detection**: Automatically chooses best available fonts

### ✅ **Professional Layout**
- **Custom headers/footers** with copyright and page numbers
- **Proper margins** and spacing for academic documents
- **Table of contents** with mixed language support
- **Title page** with bilingual information

## 📁 Repository Contents

```
hebrew_academic_template/
├── hebrew-academic-template.cls    # Main template class file
├── template_explanation.tex        # Comprehensive usage guide
├── simple_example.tex             # Simple working example
├── example_references.bib         # Sample bibliography file
├── example_plot.png              # Sample image for figures
├── README.md                      # This documentation
├── USAGE_GUIDE.md                # Detailed usage instructions
└── examples/                     # Additional examples
```

## 🚀 Quick Start

### 1. **Basic Document Setup**

```latex
\documentclass{hebrew-academic-template}

% Add bibliography file
\addbibresource{references.bib}

% Title page information
\hebrewtitle{כותרת המחקר בעברית}
\englishtitle{Research Title in English}
\hebrewauthor{ד"ר שם החוקר}

\begin{document}
\maketitle
\tableofcontents
\newpage

% Your content here

\newpage
\printenglishbibliography
\end{document}
```

### 2. **Compilation Process**

```bash
# Standard compilation
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex

# With output directory (keeps temp files separate)
lualatex -output-directory=build document.tex
biber build/document
lualatex -output-directory=build document.tex
```

### 3. **PowerShell (Windows) Compilation**

```powershell
# Create build directory to keep temp files separate
mkdir build -Force

# Compile with output directory
lualatex -output-directory=build document.tex
biber build/document
lualatex -output-directory=build document.tex

# Copy PDF back to main directory
Copy-Item build\document.pdf .
```

## 📖 Key Commands Reference

### **Text Direction & Language**
```latex
\en{English text}              % English LTR
\heb{טקסט עברי}                % Hebrew RTL
\num{123}                      % Numbers in LTR
\hebyear{2025}                 % Years in LTR
\LTR{Left-to-Right text}       % Force LTR
\RTL{טקסט מימין לשמאל}         % Force RTL
```

### **Sections & Titles**
```latex
\hebrewsection{שם הפרק}        % Hebrew section
\englishsection{Section Name}   % English section
\hebrewsubsection{כותרת משנה}   % Hebrew subsection
\HebrewTitle{1}{כותרת מעורבת}   % Mixed title

% CRITICAL: Mixed Hebrew/English section titles
% MUST wrap English terms with \en{} for proper TOC direction
\hebrewsection{מבוא: \en{Introduction}}           % ✅ Correct
\hebrewsubsection{ניתוח: \en{Data Analysis}}      % ✅ Correct
\hebrewsection{מבוא: Introduction}                % ❌ Wrong - English RTL in TOC
```

### **Tables**
```latex
\begin{hebrewtable}[h]
\caption{כותרת הטבלה: Table Caption}
\begin{rtltabular}{|c|c|c|}
\hline
\textbf{עברית} & \textbf{English} & \textbf{מספרים} \\
\hline
תוכן & Content & \num{123} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```

### **Code Blocks**
```latex
\begin{pythonbox}[כותרת הקוד]
import numpy as np
# Python code here (always LTR)
# No Hebrew comments allowed in code
\end{pythonbox}
```

### **Citations**
```latex
% In-text citations (always LTR numbers)
המחקר של \en{Smith et al.} \cite{smith2023}

% Bibliography file (.bib) entries must include:
keywords={english}  % For English references
```

## 🎯 Text Direction Rules

### **MUST Use LTR Direction:**
- ✅ **All numbers**: `\num{123}`, `\hebyear{2025}`
- ✅ **Page numbers**: Automatic LTR formatting
- ✅ **Section numbers**: Automatic LTR in headings
- ✅ **Mathematical formulas**: Always LTR
- ✅ **Python code**: Always LTR with gray background
- ✅ **Citations**: `[1]`, `[2]` always LTR
- ✅ **Bibliography**: English references left-aligned

### **Hebrew RTL Content:**
- ✅ **Main text**: Hebrew paragraphs
- ✅ **Headings**: Hebrew part of mixed titles
- ✅ **Table content**: Hebrew cells
- ✅ **Figure captions**: Hebrew descriptions

### **Mixed Content Examples:**
```latex
% Correct mixed usage
בשנת \hebyear{2023} פותח מודל \en{GPT-4} עם \num{175} מיליארד פרמטרים.

% Section with LTR number + Hebrew title + English subtitle
\hebrewsection{אלגוריתמי למידה: Machine Learning Algorithms}

% Table with mixed content
\mixedcell{רגרסיה ליניארית\\Linear Regression}
```

## 📚 Examples

### **Simple Example**
See `simple_example.tex` for a minimal working document.

### **Comprehensive Guide**
See `template_explanation.tex` for extensive examples of all features.

### **Sample Output**
Both examples compile to professional academic documents with:
- Proper Hebrew RTL and English LTR text directions
- LTR numbering throughout (pages, sections, citations)
- Professional code blocks with gray background
- Mixed-language tables and figures
- IEEE-style bibliography

## 🔧 Requirements

### **LaTeX Distribution**
- **Windows**: MiKTeX with LuaLaTeX
- **Linux**: TeX Live with LuaLaTeX
- **macOS**: MacTeX with LuaLaTeX

### **Required Packages**
All packages are included in modern LaTeX distributions:
- `fontspec`, `polyglossia`, `luabidi`
- `biblatex` with `biber` backend
- `amsmath`, `graphicx`, `tcolorbox`
- `fancyhdr`, `hyperref`, `geometry`

### **Fonts**
- **Windows/MiKTeX**: Times New Roman, David CLM, Arial, Courier New
- **Linux/TeX Live**: Automatic fallback to Latin Modern, DejaVu Sans
- **Smart detection**: Template automatically chooses best available fonts

## 🐛 Troubleshooting

### **Common Issues**

1. **Font not found errors**
   - ✅ **Solution**: Template includes automatic fallback fonts
   - ✅ **Windows**: Ensure MiKTeX is updated
   - ✅ **Linux**: Use TeX Live full installation

2. **Wrong text direction**
   - ✅ **Solution**: Use `\en{}` for English, `\num{}` for numbers
   - ✅ **Check**: All numbers wrapped with `\num{}`

3. **Bibliography not showing**
   - ✅ **Solution**: Add `keywords={english}` to all `.bib` entries
   - ✅ **Check**: Run `biber` after first `lualatex` compilation

4. **Code blocks not working**
   - ✅ **Solution**: Use `pythonbox` environment
   - ✅ **Check**: No Hebrew comments in code blocks

### **Compilation Order**
Always use this sequence:
```bash
lualatex document.tex    # First pass
biber document           # Process bibliography
lualatex document.tex    # Second pass
lualatex document.tex    # Final pass (optional)
```

## 📄 License

**Copyright © 2025 Dr. Segal Yoram. All rights reserved.**

This template is provided for academic and educational use. All rights are reserved to Dr. Segal Yoram.

## 🤝 Support

For questions, issues, or contributions, please refer to the comprehensive documentation in `template_explanation.tex` or examine the working examples provided.

---

**Happy Academic Writing! 📝✨**
