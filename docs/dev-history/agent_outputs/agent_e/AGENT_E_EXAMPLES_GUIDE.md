# Hebrew Academic Template v5.0 - Examples Guide

**Agent E: Example Creator**
**Date:** November 9, 2025
**Version:** CLS v5.0 Unified Edition

---

## Overview

This guide provides a comprehensive overview of all example files created for the Hebrew Academic Template v5.0. Each example is designed to demonstrate specific features and use cases of the template.

---

## Example Files Structure

### 1. **beginner_example.tex** (5-7 pages)
**Purpose:** Introduction to basic template features for new users

**Key Features Demonstrated:**
- Basic Hebrew/English text mixing with `\en{}` and `\heb{}`
- Simple sections with `\hebrewsection` and `\hebrewsubsection`
- Basic lists (itemize, enumerate)
- Simple tables with `\mixedcell{}`
- Basic citations
- Simple figures
- Basic math expressions
- Use of `\num{}`, `\percent{}`, `\hebyear{}`
- **Important:** Uses `\entoc{}` for section headers (not `\en{}`)

**Target Audience:** First-time users, students new to LaTeX

---

### 2. **intermediate_example.tex** (8-10 pages)
**Purpose:** Demonstrate intermediate features for regular academic use

**Key Features Demonstrated:**
- Complex tables with multiple `\mixedcell{}` columns
- Multiple section levels and organization
- Python code blocks with `pythonbox`
- Multiple figures with captions and references
- Advanced citations with page references
- Complex mathematical formulas
- Nested lists and mixed content
- Cross-references between elements
- Use of all number formatting commands

**Target Audience:** Graduate students, researchers

---

### 3. **advanced_example.tex** (10-12 pages)
**Purpose:** Show advanced features for complex academic documents

**Key Features Demonstrated:**
- Advanced bibliography with multiple citation styles
- Complex tables with 6+ columns
- Multiple code examples (`pythonbox` and `pythonbox*`)
- Extensive cross-references
- Advanced mathematical expressions with Hebrew
- Figure grids and complex layouts
- Mixed citation types and groups
- Table of figures and tables
- Advanced formatting techniques

**Target Audience:** Advanced researchers, thesis writers

---

### 4. **expert_example.tex** (15-20 pages)
**Purpose:** Comprehensive demonstration of ALL 78 commands

**Key Features Demonstrated:**
- **ALL 78 CLS v5.0 commands used at least once**
- `\hebrewchapter` for book-level documents
- All text direction commands (15 total)
- All section commands (6 total)
- All table commands (8 total)
- All code commands (7 total)
- All math commands (8 total)
- All bibliography commands
- Symbol commands (`\warningsymbol`, `\checksymbol`)
- Version tracking with `\clsversion`
- Complete feature showcase

**Target Audience:** Template developers, power users, reference documentation

---

### 5. **footnote_example.tex** (3-4 pages)
**Purpose:** Specialized example for footnote usage

**Key Features Demonstrated:**
- Multiple footnotes in Hebrew RTL text
- Mixed Hebrew/English in footnotes
- Footnote numbering and cross-references
- Footnotes with citations
- Footnotes in tables and figures
- Long and complex footnotes
- Footnotes in English sections

**Target Audience:** Academic writers needing extensive footnotes

---

### 6. **image_example.tex** (4-5 pages)
**Purpose:** Comprehensive guide to figures and images

**Key Features Demonstrated:**
- `\hebrewfigure` command usage
- Standard `figure` environment
- All positioning options: `[h]`, `[t]`, `[b]`, `[p]`
- Side-by-side figures
- Figure grids (2×2, etc.)
- Complex figure captions
- Figure cross-references
- TikZ integration for diagrams
- Best practices for images

**Target Audience:** Users working with visual content

---

### 7. **bibliography_example.tex** (5-6 pages)
**Purpose:** Complete bibliography management demonstration

**Key Features Demonstrated:**
- Hebrew bibliography section
- English bibliography section
- Mixed citations in text
- Different citation styles (in-text, parenthetical)
- Citations with page/chapter references
- Citation groups and categories
- Use of `keywords={hebrew}` and `keywords={english}`
- Bibliography in special contexts (tables, footnotes)

**Target Audience:** Researchers with extensive references

---

## Bibliography Files

### **example_references.bib** (5-10 entries)
- Basic references for beginner examples
- Mix of Hebrew and English sources
- Essential publication types
- Properly tagged with `keywords`

### **advanced_references.bib** (15-20 entries)
- Comprehensive reference collection
- Diverse publication types (articles, books, reports, theses)
- Full Hebrew and English separation
- Complete metadata for all entries

---

## Command Coverage by Example

| Command Category | Beginner | Intermediate | Advanced | Expert | Specialized |
|-----------------|----------|--------------|----------|--------|-------------|
| Text Direction (15) | ✓ Basic | ✓ Most | ✓ Most | ✓ ALL | As needed |
| Sections (6) | ✓ 3/6 | ✓ 4/6 | ✓ 4/6 | ✓ ALL | ✓ 3/6 |
| Tables (8) | ✓ 2/8 | ✓ 4/8 | ✓ 6/8 | ✓ ALL | Some |
| Figures (2) | ✓ 1/2 | ✓ 2/2 | ✓ 2/2 | ✓ ALL | ✓ ALL |
| Code (7) | ✓ 2/7 | ✓ 3/7 | ✓ 5/7 | ✓ ALL | None |
| Math (8) | Basic | ✓ 3/8 | ✓ 6/8 | ✓ ALL | None |
| Symbols (2) | ✓ | ✓ | Some | ✓ ALL | None |
| Bibliography (3) | ✓ | ✓ | ✓ ALL | ✓ ALL | ✓ ALL |
| Version (1) | ✓ | ✓ | Some | ✓ ALL | None |

---

## Usage Recommendations

### For New Users
1. Start with `beginner_example.tex`
2. Study the basic command patterns
3. Note the use of `\entoc{}` in section headers
4. Practice with simple modifications

### For Regular Users
1. Use `intermediate_example.tex` as a starting template
2. Refer to `advanced_example.tex` for complex features
3. Check specialized examples for specific needs

### For Power Users
1. `expert_example.tex` serves as complete reference
2. Shows every single command in action
3. Demonstrates advanced integration patterns

### For Specific Needs
- Heavy footnote usage → `footnote_example.tex`
- Many figures/diagrams → `image_example.tex`
- Extensive citations → `bibliography_example.tex`

---

## Important Notes

1. **Always use `\entoc{}` in section headers**, not `\en{}`
2. **Use `\mixedcell{}` for Hebrew table cells** with mixed content
3. **Tag bibliography entries** with `keywords={hebrew}` or `keywords={english}`
4. **Expert example uses ALL 78 commands** - use as complete reference
5. **Each example is self-contained** and can be compiled independently

---

## File Locations

All example files are located in:
```
C:\25D\CLS-examples\agent_outputs\agent_e\
```

Main CLS file:
```
C:\25D\CLS-examples\hebrew-academic-template.cls
```

---

## Compilation Instructions

For all examples:
```bash
lualatex example_name.tex
biber example_name
lualatex example_name.tex
lualatex example_name.tex
```

**Note:** Always use LuaLaTeX, never pdflatex or xelatex.

---

## Version Information

- **CLS Version:** 5.0 (Unified Edition)
- **Date:** November 9, 2025
- **Total Commands:** 78
- **Total Environments:** 8
- **Backward Compatible:** Yes (v1.0 and v3.0)