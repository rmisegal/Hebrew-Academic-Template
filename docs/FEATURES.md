# Hebrew Academic Template v5.6 - Complete Feature List

## Feature Overview

The Hebrew Academic Template v5.6 provides 80 commands, 8 environments, and 24+ packages for professional Hebrew academic documents with full bidirectional text support.

## Feature Comparison Table

| Category | v1.0 | v3.0 | v5.6 | Enhancement |
|----------|------|------|------|-------------|
| **Total Commands** | 60 | 72 | 80 | +33% from v1.0 |
| **Environments** | 6 | 8 | 8 | +33% from v1.0 |
| **Packages** | 22 | 24 | 24+ | +10% from v1.0 |
| **Text Direction** | 12 | 14 | 17 | Complete BiDi support |
| **Section Types** | 5 | 6 | 6 | Chapter support |
| **Table Commands** | 4 | 7 | 8 | Advanced cells |
| **Math Support** | 1 | 8 | 8 | Full Hebrew math |
| **Code Features** | 3 | 7 | 7 | Hebrew titles |
| **Bibliography** | Basic | Basic | Enhanced | Biber backend |

## Command Reference Table (All 80 Commands)

### Text Direction Commands (17)

| Command | Purpose |
|---------|---------|
| `\en{}` | English in Hebrew context |
| `\heb{}` | Hebrew in English context |
| `\ilm{}` | Inline LTR (legacy) |
| `\num{}` | Numbers in Hebrew |
| `\percent{}` | Percentages with % |
| `\hebyear{}` | Years in Hebrew text |
| `\ltr{}` | Protect LTR from bidi |
| `\LTR{}` | Force LTR direction |
| `\RTL{}` | Force RTL direction |
| `\startenglish` | Begin English section |
| `\stopenglish` | End English section |
| `\stophebrew` | Return to Hebrew |
| `\textenglish{}` | Polyglossia English |
| `\texthebrew{}` | Polyglossia Hebrew |
| `\selectlanguage{}` | Switch language |
| `\hebfoot{}` | Hebrew RTL in footer/header |
| `\hebtitle{}` | Hebrew RTL in tcolorbox/pythonbox title |

### Section Commands (6)

| Command | Purpose |
|---------|---------|
| `\hebrewchapter{}` | Book chapters |
| `\hebrewsection{}` | Main sections |
| `\englishsection{}` | English sections |
| `\hebrewsubsection{}` | Subsections |
| `\HebrewTitle{}` | Format Hebrew title |
| `\HebrewSubtitle{}` | Format subtitle |

### Table Commands (8)

| Command | Purpose |
|---------|---------|
| `hebrewtable` | RTL table environment |
| `rtltabular` | RTL column order |
| `\hebcell{}` | Hebrew cell with RTL support |
| `\mixedcell{}` | **DEPRECATED** - alias for `\hebcell{}` |
| `\encell{}` | English cell |
| `\hebheader{}` | Hebrew header |
| `\enheader{}` | English header |
| `\rtlrow{}` | Auto-reverse columns |

### Figure Commands (2)

| Command | Purpose |
|---------|---------|
| `\hebrewfigure` | Command form |
| `hebrewfigure` env | Environment form |

### Code Commands (7)

| Command | Purpose |
|---------|---------|
| `pythonbox` | Floating code with syntax highlighting |
| `pythonbox*` | Non-floating code (page breaks OK) |
| `\code{}` | Inline code |
| `\englishterm{}` | Technical terms |
| `\enpath{}` | File paths with hyphens |
| `\listingfont` | Listing font |
| `\courierfont` | Courier family |

### Math Commands (8)

| Command | Purpose |
|---------|---------|
| `\hebmath{}` | Hebrew in math |
| `\hebsub{}` | Hebrew subscript |
| `\hebtextmath{}` | Legacy Hebrew math |
| `\argmin` | Argmin operator |
| `\argmax` | Argmax operator |
| `\Rsquared` | R² symbol |
| `\Rtwo` | R² alternative |
| `\rarrow` | RTL arrow |

### Bibliography Commands (3)

| Command | Purpose |
|---------|---------|
| `\printhebrewbibliography` | Hebrew references |
| `\printenglishbibliography` | English references |
| `\ltrnumber{}` | LTR numbers |

### Title Commands (5)

| Command | Purpose |
|---------|---------|
| `\hebrewtitle{}` | Hebrew title |
| `\englishtitle{}` | English title |
| `\hebrewauthor{}` | Author name |
| `\hebrewversion{}` | Document version |
| `\maketitle` | Generate title |

### Symbol Commands (2)

| Command | Purpose |
|---------|---------|
| `\warningsymbol` | Warning triangle |
| `\checksymbol` | Checkmark |

### Other Commands (22)

| Command | Purpose |
|---------|---------|
| `\Hitem{}` | Hebrew list item |
| `\clsversion` | Template version |
| Various internal | PDF, counters, etc. |

## Environment Reference Table (8 Environments)

| Environment | Purpose | Features |
|-------------|---------|----------|
| `hebrewtable` | RTL table wrapper | Centered caption, RTL support |
| `rtltabular` | RTL columns | Right-to-left column order |
| `hebrewfigure` | Figure environment | Hebrew captions |
| `pythonbox` | Floating code | Syntax highlighting, Hebrew titles with `\hebtitle{}` |
| `pythonbox*` | Non-floating code | Page breaks OK, long code blocks |
| `python` | Code float | Internal use |
| `hebrew` | Hebrew block | Polyglossia |
| `english` | English block | Polyglossia |

## Package Dependencies Table

### Core Packages
| Package | Purpose | Critical For |
|---------|---------|-------------|
| fontspec | Font selection | All fonts |
| polyglossia | Language support | RTL/LTR |
| luabidi | Bidirectional text | Direction |
| biblatex | Bibliography | Citations |

### Mathematical Packages
| Package | Purpose | Commands |
|---------|---------|----------|
| amsmath | Advanced math | Environments |
| amssymb | Math symbols | Symbols |

### Graphics Packages
| Package | Purpose | Usage |
|---------|---------|-------|
| graphicx | Images | `\includegraphics` |
| float | Float control | `[H]` placement |
| caption | Captions | Caption formatting |
| tikz-cd | Diagrams | Commutative diagrams |

### Table Packages
| Package | Purpose | Features |
|---------|---------|----------|
| longtable | Long tables | Multi-page |
| tabularx | Flexible | X columns |
| array | Enhanced | Column types |
| booktabs | Rules | `\toprule` |

### Code Packages
| Package | Purpose | Usage |
|---------|---------|-------|
| tcolorbox | Boxes | pythonbox |
| listings | Listings | Syntax |
| fvextra | Verbatim | Enhanced |
| xcolor | Colors | Background |
| newfloat | Floats | Python env |

### Layout Packages
| Package | Purpose | Features |
|---------|---------|----------|
| geometry | Page layout | Margins |
| fancyhdr | Headers | Custom headers |
| titlesec | Sections | Formatting |
| setspace | Spacing | Line spacing |
| hyperref | PDF | Links, bookmarks |

## Key Features

### Complete Bidirectional Support
- Full RTL/LTR text handling throughout the document
- Footer and header BiDi support with `\hebfoot{}`
- Code block Hebrew titles with `\hebtitle{}`
- Automatic direction for numbers, citations, and page numbers

### Chapter and Section Hierarchy
- Book-length document support with `\hebrewchapter{}`
- Automatic section numbering (adapts to chapter/no-chapter mode)
- Proper PDF bookmarks for all structural elements

### Professional Code Blocks
- Floating (`pythonbox`) and non-floating (`pythonbox*`) environments
- Hebrew titles supported via `\hebtitle{}`
- Light gray background with proper LTR code rendering
- Syntax highlighting for Python

### Advanced Table Support
- RTL column ordering with `rtltabular`
- Mixed content cells with `\hebcell{}`
- Centered captions for academic formatting
- Header commands for proper alignment

### Mathematical Expressions
- Hebrew text in math mode with `\hebmath{}`
- Hebrew subscripts with `\hebsub{}`
- Standard math operators (`\argmin`, `\argmax`)
- Proper LTR math rendering in RTL documents

### Bibliography Management
- Biber backend for superior Unicode support
- Automatic Hebrew/English reference separation
- IEEE citation style
- LTR citation numbers in RTL text

## Feature Categories

### Professional Typography
- Smart font fallbacks
- Harfbuzz rendering
- Proper kerning
- Ligature support

### Academic Structure
- Chapters for books
- Sections/subsections
- Table of contents
- Cross-references

### Bidirectional Excellence
- Automatic direction
- Protected commands
- Proper alignment
- Mixed content

### Mathematical Power
- Hebrew variables
- Optimization operators
- Special symbols
- Formula numbering

### Code Integration
- Syntax highlighting
- Gray backgrounds
- Floating/non-floating
- Path handling

### Bibliography Management
- Biber backend
- Language filtering
- IEEE style
- Mixed references

## Performance Features

### Compilation Speed
- Optimized loading
- Minimal dependencies
- Efficient processing
- Smart caching

### Memory Usage
- Lazy loading
- Efficient structures
- Clean namespaces
- Minimal overhead

### Output Quality
- Professional PDFs
- Proper bookmarks
- Searchable text
- High-quality fonts

## Compatibility Matrix

| Platform | Status | Notes |
|----------|--------|-------|
| Windows + MiKTeX | ✅ Full | Primary platform |
| Linux + TeX Live | ✅ Full | Complete support |
| macOS + MacTeX | ✅ Full | Tested |
| Overleaf | ✅ Full | Upload .cls |
| ShareLaTeX | ✅ Full | Compatible |

## Usage Statistics

### Command Usage Frequency
1. `\en{}` - Used in every document
2. `\num{}` - Essential for numbers
3. `\hebrewsection{}` - Document structure
4. `\hebcell{}` - Table formatting
5. `\cite{}` - Academic citations

### Most Valuable Features
1. Automatic RTL/LTR handling
2. Mixed content in tables
3. Chapter support for books
4. Non-floating code blocks
5. Hebrew in mathematics

## Summary

Hebrew Academic Template v5.6 provides comprehensive support for Hebrew academic documents:
- **80 commands** covering all use cases
- **8 environments** for structured content
- **24+ packages** professionally integrated
- **100% backward compatibility** with all previous versions
- **Complete BiDi support** including footers, headers, and code block titles
- **Professional typography** with smart font fallback system

This is the definitive template for Hebrew academic documents.