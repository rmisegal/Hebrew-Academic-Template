# Hebrew Academic Template - Adoption Guide

## Overview

This guide helps you adopt the template for your academic documents and understand the full range of capabilities available.

## Quick Start Summary

| User Type | Recommended Approach |
|-----------|---------------------|
| New User | Start with beginner_example.tex and gradually adopt advanced features |
| Upgrading | Replace the .cls file - all documents work unchanged |
| Advanced | Explore enhanced table commands, chapter support, and math features |

## Getting Started

### Step 1: Set Up Your Environment
```bash
# Ensure you have LuaLaTeX and Biber installed
# Copy the class file to your project directory
cp hebrew-academic-template.cls your-project/
```

### Step 2: Compile Your Document
```bash
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex
```

### Step 3: Verify Output
Your document should compile with:
- Table captions properly aligned
- PDF bookmarks working correctly
- All BiDi text rendering correctly

## Available Features

### Enhanced Table Commands
```latex
\begin{rtltabular}{|c|c|}
\hebheader{כותרת} & \enheader{Header} \\
\hline
\hebcell{טקסט מעורב} & \encell{English} \\
\end{rtltabular}
```

### Chapter Support
For book-length documents:
```latex
\hebrewchapter{שם הפרק}
\hebrewsection{סעיף בפרק: \entoc{Section}}
```

### Math with Hebrew
```latex
% Hebrew in math mode
$\hebmath{משתנה}$
$x_{\hebsub{תחתון}}$

% Optimization operators
$\argmin_x f(x)$
$\argmax_x g(x)$
```

## Template Capabilities

The template includes comprehensive support for:

1. **Bibliography**: Uses biber backend for superior Unicode handling
2. **RTL Captions**: Hebrew table captions properly right-aligned
3. **PDF Bookmarks**: Full bookmark support for all sections
4. **Utility Commands**: `\ltr{}`, `\warningsymbol`, `\checksymbol`

### Version Check
Verify your template version:
```latex
\documentclass{hebrew-academic-template}
\begin{document}
Version: \clsversion
\end{document}
```

## Feature Adoption Guide

### Recommended Features by Priority

#### High Priority (Essential)
1. Use `\encell{}` for English table cells
2. Use `\hebheader{}` and `\enheader{}` for headers
3. Use `pythonbox*` for long code blocks

#### Medium Priority (Enhanced Quality)
1. Add `\hebrewchapter{}` for books
2. Use `\hebmath{}` for Hebrew in math mode
3. Apply `\enpath{}` for file paths

#### Additional Features
1. Use `\argmin` and `\argmax` in optimization expressions
2. Apply special character commands like `\Rsquared`
3. Add version tracking with `\hebrewversion{}`

## Common Usage Scenarios

### Scenario 1: Simple Article
Standard article documents work out of the box with basic features.

### Scenario 2: Thesis with Tables
Use the enhanced table commands for clarity:
```latex
\hebcell{Hebrew \en{English}}  % For Hebrew-dominant cells
\encell{Mostly English}         % For English-dominant cells
```

### Scenario 3: Book with Chapters
Use the full chapter hierarchy:
```latex
\hebrewchapter{Introduction}
\hebrewsection{Background: \entoc{Background}}
```

### Scenario 4: Technical Document with Code
Use non-floating for long code blocks:
```latex
\begin{pythonbox*}[Long Code]
# Handles page breaks properly for 100+ lines
\end{pythonbox*}
```

## Command Aliases

For flexibility, the template provides command aliases:
- `\mixedcell{}` is an alias for `\hebcell{}`
- `\hebtextmath{}` is an alias for `\hebmath{}`
- All text direction commands work interchangeably

## Verification Checklist

Verify your document output:

- [ ] Document compiles without errors
- [ ] Table captions are properly aligned
- [ ] PDF bookmarks work
- [ ] Citations appear correctly
- [ ] Math expressions render properly
- [ ] Code blocks display correctly
- [ ] Figures and captions align properly
- [ ] Page numbers are LTR
- [ ] Section numbers are correct
- [ ] Bibliography formats correctly

## Troubleshooting

### Compilation Errors
```bash
# Clean and rebuild
rm *.aux *.bbl *.bcf *.blg *.log
lualatex document.tex
biber document
lualatex document.tex
```

### Font Issues
The template includes smart font fallbacks. If issues persist:
```latex
% Force font refresh
\setmainfont{Times New Roman}[
  Renderer=Harfbuzz,
  Ligatures=TeX
]
```

## Template Benefits

- **Complete Feature Set**: 80 commands covering all academic document needs
- **Professional Tables**: Enhanced table handling with Hebrew support
- **Chapter Support**: Full book-length document capability
- **Math Integration**: Hebrew text in math mode
- **Code Blocks**: Professional code formatting with page break handling
- **Smart Fonts**: Automatic font fallback system
- **Documentation**: Comprehensive examples and guides

## Support

For help:
1. Check documentation files
2. See examples in /examples directory
3. Review the troubleshooting section
4. Report issues on GitHub