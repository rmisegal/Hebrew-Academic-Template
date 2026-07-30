# Hebrew Academic Template - Changelog

All notable changes to the Hebrew Academic Template are documented here.

## [5.0.0] - 2025-11-09 - Unified Edition

### Overview
The definitive version combining all features from previous versions with all regressions fixed.

### Added (18 Enhancements from v3.0)
- Chapter support with `\hebrewchapter{}` command
- Enhanced table cells: `\hebcell{}`, `\encell{}`, `\hebheader{}`, `\enheader{}`
- Hebrew in math: `\hebmath{}` and `\hebsub{}` commands
- Math operators: `\argmin` and `\argmax`
- Special character fixes: `\Rsquared`, `\rarrow`, `\Rtwo`
- Non-floating code environment: `pythonbox*`
- Path support: `\enpath{}` for filenames with hyphens
- Version tracking: `\clsversion{}` command
- Font commands: `\courierfont` and `\listingfont`
- TikZ support with tikz-cd package
- Code title color fix (coltitle=black)
- Python float environment for listings
- Bibliography categories for Hebrew/English separation
- Hierarchical counter management for chapters
- Cross-reference improvements
- Enhanced PDF string handling
- Improved font fallback system
- Complete backward compatibility system

### Fixed (4 Critical Regressions)
- **Restored biber backend** - Better Unicode support than bibtex
- **Restored RTL caption alignment** - Hebrew table captions now right-aligned
- **Added \phantomsection** - PDF bookmarks work without errors
- **Restored utility commands** - `\ltr{}`, `\warningsymbol`, `\checksymbol`

### Changed
- Version string now returns "V05-2025-11-09"
- Improved documentation and inline comments
- Better error messages for common issues
- Optimized compilation performance

### Technical Details
- **Total Commands:** 78 (up from 72 in v3.0, 60 in v1.0)
- **Total Environments:** 8
- **Required Packages:** 24+
- **Lines of Code:** ~740
- **Backward Compatibility:** 100% with v1.0 and v3.0

## [3.0.0] - 2025-10-28 - Book-Latech-V3

### Added
- `\enpath{}` command for paths and filenames with hyphens
- `\courierfont` font family for code listings
- Improved version history in comments

### Changed
- Moved `\clsversion{}` definition to end of file
- Enhanced changelog format

### Removed
- `\phantomsection` commands (regression - restored in v5.0)

## [3.0.0] - 2025-10-26 - Book-Latech-V2

### Added
- `\hebrewchapter{}` command for book chapters
- Chapter counter with automatic section reset
- Enhanced `\hebcell{}` with better RTL padding
- `\encell{}` command for English table cells
- `\hebheader{}` and `\enheader{}` for table headers
- `\hebmath{}` and `\hebsub{}` for Hebrew in math mode
- `\argmin` and `\argmax` math operators
- `\Rsquared`, `\Rtwo`, and `\rarrow` special characters
- `pythonbox*` non-floating environment
- `\hebrewversion{}` for title page version
- `\clsversion{}` command for version tracking
- tikz-cd package for commutative diagrams
- coltitle=black for code block titles
- Help system with `\clshelp{}` and `\clsquickref{}`
- `\phantomsection` for PDF bookmark fixes

### Changed
- Bibliography backend from biber to bibtex (regression)
- Section counter hierarchy (now resets with chapters)
- Table cell implementation (more sophisticated)
- Math mode Hebrew handling (improved)

### Removed
- RTL caption alignment (regression - restored in v5.0)
- `\ltr{}` command (restored in v5.0)
- Symbol commands (restored in v5.0)

## [1.0.0] - 2025-09-26 - Foundation Release

### Initial Features
- Full Hebrew RTL support with English LTR integration
- Custom bilingual title page
- Section commands: `\hebrewsection{}`, `\englishsection{}`, `\hebrewsubsection{}`
- Basic table support: `hebrewtable` and `rtltabular` environments
- Basic cell commands: `\hebcell{}` and `\mixedcell{}`
- Bibliography with biber backend
- Smart font fallback system
- Text direction commands: `\en{}`, `\heb{}`, `\num{}`, `\percent{}`, `\hebyear{}`
- Protection commands: `\ltr{}`, `\LTR{}`, `\RTL{}`
- Symbol commands: `\warningsymbol`, `\checksymbol`
- Figure command: `\hebrewfigure`
- Code environment: `pythonbox`
- Math support: `\hebtextmath{}`
- List command: `\Hitem{}`
- 60 total commands
- 6 environments
- 22 required packages

### Package Configuration
- Backend: biber for superior Unicode support
- Base class: article with twoside option
- Compiler: LuaLaTeX required
- Font system: fontspec with Harfbuzz renderer

## Version Comparison Summary

| Feature | v1.0 | v3.0 | v5.0 |
|---------|------|------|------|
| Commands | 60 | 72 | 78 |
| Environments | 6 | 8 | 8 |
| Packages | 22 | 24 | 24+ |
| Chapter Support | ✗ | ✓ | ✓ |
| Enhanced Tables | ✗ | ✓ | ✓ |
| Non-floating Code | ✗ | ✓ | ✓ |
| Biber Backend | ✓ | ✗ | ✓ |
| RTL Captions | ✓ | ✗ | ✓ |
| PDF Bookmarks | Issues | Issues | ✓ |
| Symbol Commands | ✓ | ✗ | ✓ |

## Migration Notes

### From v1.0 to v5.0
- No changes required - fully backward compatible
- New features available but not required
- Consider using new table commands for better formatting

### From v3.0 to v5.0
- No changes required - fully backward compatible
- PDF bookmark errors automatically fixed
- Table captions now properly aligned

## Development History

The Hebrew Academic Template evolved through community needs:

1. **v1.0** - Created for basic Hebrew academic documents
2. **v3.0** - Extended for book-length works with chapters
3. **v5.0** - Unified all features, fixed all regressions

Each version built upon user feedback and real-world usage in academic institutions.