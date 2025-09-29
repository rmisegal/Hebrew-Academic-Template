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
├── simple_example.tex             # Simple working example
├── comprehensive_example.tex      # Comprehensive test file
├── example_references.bib         # Sample bibliography file for simple_example.tex
├── comprehensive_references.bib   # Sample bibliography file for comprehensive_example.tex
├── example_plot.png              # Sample image for figures
├── README.md                      # This documentation
└── USAGE_GUIDE.md                # Detailed usage instructions
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
\entoc{English in ToC}         % English part of titles in Table of Contents
```

### **Sections & Titles**
```latex
\hebrewsection{שם הפרק}        % Hebrew section
\englishsection{Section Name}   % English section
\hebrewsubsection{כותרת משנה}   % Hebrew subsection
\HebrewTitle{1}{כותרת מעורבת}   % Mixed title

% CRITICAL: Mixed Hebrew/English section titles
% MUST wrap English terms with \entoc{} for proper TOC direction
\hebrewsection{מבוא: \entoc{Introduction}}           % ✅ Correct
\hebrewsubsection{ניתוח: \entoc{Data Analysis}}      % ✅ Correct
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
keywords={hebrew}   % For Hebrew references
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
\hebrewsection{אלגוריתמי למידה: \entoc{Machine Learning Algorithms}}

% Table with mixed content
\mixedcell{רגרסיה ליניארית\\Linear Regression}
```

## 📚 Adding References - Complete Guide

### **Step 1: Create Your Bibliography File**

Create a `.bib` file (e.g., `references.bib`) with your references. **CRITICAL**: Each reference MUST include `keywords={english}` or `keywords={hebrew}` for proper categorization.

```bibtex
% English Reference Example
@article{mikolov2013,
  title={Efficient estimation of word representations in vector space},
  author={Mikolov, Tomas and Chen, Kai and Corrado, Greg and Dean, Jeffrey},
  journal={arXiv preprint arXiv:1301.3781},
  year={2013},
  keywords={english}  % REQUIRED: Mark as English
}

% Hebrew Reference Example  
@article{hebrew_nlp_2023,
  title={עיבוד שפה טבעית בעברית: אתגרים ופתרונות},
  author={כהן, דוד and לוי, רחל and שמעון, יוסף},  % Use 'and' to separate authors
  journal={כתב העת הישראלי למדעי המחשב},
  volume={15},
  number={3},
  pages={45--67},
  year={2023},
  publisher={האוניברסיטה העברית},
  keywords={hebrew}  % REQUIRED: Mark as Hebrew
}

% Book Example
@book{ai_book_2024,
  title={Artificial Intelligence: A Modern Approach},
  author={Russell, Stuart and Norvig, Peter},
  edition={4},
  publisher={Pearson},
  year={2024},
  keywords={english}
}

% Conference Paper Example
@inproceedings{conference_paper_2023,
  title={Deep Learning for Natural Language Processing},
  author={Smith, John and Johnson, Mary},
  booktitle={Proceedings of the International Conference on AI},
  pages={123--135},
  year={2023},
  organization={ACM},
  keywords={english}
}

% Website/Online Source Example
@misc{website_2024,
  title={Introduction to Machine Learning},
  author={OpenAI},
  year={2024},
  url={https://openai.com/research/machine-learning},
  urldate={2024-12-01},
  keywords={english}
}
```

### **Step 2: Reference Types and Required Fields**

| Type | Description | Required Fields | Optional Fields |
|------|-------------|----------------|----------------|
| `@article` | Journal articles | title, author, journal, year | volume, number, pages, doi |
| `@book` | Books | title, author, publisher, year | edition, isbn, address |
| `@inproceedings` | Conference papers | title, author, booktitle, year | pages, organization, address |
| `@phdthesis` | PhD dissertations | title, author, school, year | address, month |
| `@mastersthesis` | Master's theses | title, author, school, year | address, month |
| `@techreport` | Technical reports | title, author, institution, year | number, address |
| `@misc` | Websites, misc. | title, year | author, url, urldate, note |

### **Step 3: Critical Bibliography Rules**

#### ✅ **MUST DO:**
1. **Add keywords**: Every reference MUST have `keywords={english}` or `keywords={hebrew}`
2. **Use 'and' for authors**: `author={Smith, John and Johnson, Mary}` ✅
3. **Use double dashes for page ranges**: `pages={45--67}` ✅
4. **Include urldate for websites**: `urldate={2024-12-01}` ✅

#### ❌ **DON'T DO:**
1. **Missing keywords**: References without keywords won't appear ❌
2. **Comma-separated authors**: `author={Smith, John, Johnson, Mary}` ❌
3. **Single dash for pages**: `pages={45-67}` ❌
4. **Missing urldate for URLs**: Online sources need access dates ❌

### **Step 4: Using Citations in Your Document**

#### **Basic Citations:**
```latex
% Single citation
This is supported by research \cite{mikolov2013}.

% Multiple citations  
Several studies \cite{mikolov2013,ai_book_2024,hebrew_nlp_2023} confirm this.

% Citation with page number
As noted by Smith \cite[p. 45]{ai_book_2024}.
```

#### **Citations in Hebrew Text:**
```latex
\hebrewsection{מחקר בבינה מלאכותית: \entoc{AI Research}}

המחקר מראה \cite{mikolov2013} כי שיטות \en{Deep Learning} יעילות במיוחד.
מחקרים נוספים \cite{hebrew_nlp_2023,ai_book_2024} תומכים בממצאים אלה.
```

### **Step 5: Bibliography Display**

The template automatically separates Hebrew and English references:

```latex
% At the end of your document
\newpage
\printhebrewbibliography  % Shows only Hebrew references (keywords={hebrew})
\printenglishbibliography % Shows only English references (keywords={english})
```

### **Step 6: Complete Working Example**

**main.tex:**
```latex
\documentclass{hebrew-academic-template}
\addbibresource{references.bib}  % Your bibliography file

\hebrewtitle{מחקר בבינה מלאכותית}
\englishtitle{Research in Artificial Intelligence}
\hebrewauthor{ד"ר סגל יורם}

\begin{document}
\maketitle
\tableofcontents
\newpage

\hebrewsection{מבוא: \entoc{Introduction}}

המחקר בתחום הבינה המלאכותית מתפתח במהירות רבה. שיטות \en{Deep Learning} 
מציגות תוצאות מרשימות \cite{mikolov2013}. מחקרים בעברית \cite{hebrew_nlp_2023} 
מראים התקדמות משמעותית.

בשנת \hebyear{2024} פורסמו \num{1500} מאמרים בתחום \cite{ai_book_2024}.

\englishsection{Results and Discussion}

The results show significant improvement over baseline methods \cite{ai_book_2024}.
The accuracy increased from \num{85}\% to \num{94}\%.

\newpage
\printhebrewbibliography
\printenglishbibliography

\end{document}
```

## 📚 Examples

### **Simple Example**
See `simple_example.tex` for a minimal working document with basic citations.

### **Comprehensive Example**
See `comprehensive_example.tex` for extensive examples of all features including:
- Mixed Hebrew/English citations
- Multiple reference types
- Proper bibliography categorization

### **Sample File Rankings**

| File | Status | Completeness | Recommended Use |
|------|--------|--------------|-----------------|
| **`reference_test.tex`** | ✅ **LATEST & BEST** | 100% Complete | **Use this as your main reference** |
| `comprehensive_example.tex` | ✅ **FULLY WORKING** | 95% Complete | **Excellent for learning all features** |
| `simple_example_fixed.tex` | ✅ **FULLY WORKING** | 85% Complete | **Perfect for beginners** |
| `simple_example.tex` | ✅ **BASIC WORKING** | 60% Complete | Basic usage, good starting point |

### **Sample Output**
All examples now compile to professional academic documents with:
- **Perfect IEEE-style citations**: [1], [2], [3] with brackets
- Proper Hebrew RTL and English LTR text directions
- LTR numbering throughout (pages, sections, citations)
- Professional code blocks with gray background
- Mixed-language tables and figures
- IEEE-style bibliography with automatic Hebrew/English separation

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
   - ✅ **Solution**: Use `\en{}` for English, `\num{}` for numbers, and `\entoc{}` for English in titles.
   - ✅ **Check**: All numbers wrapped with `\num{}`

3. **Bibliography not showing**
   - ✅ **Solution**: Add `keywords={english}` or `keywords={hebrew}` to all `.bib` entries
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

For questions, issues, or contributions, please refer to the comprehensive documentation in `comprehensive_example.tex` or examine the working examples provided.

---

**Happy Academic Writing! 📝✨**

