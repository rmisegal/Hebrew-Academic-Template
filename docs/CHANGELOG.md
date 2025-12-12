# Hebrew Academic Template - Version History

This document chronicles the development of the Hebrew Academic Template.

## [5.8.0] - 2025-12-11 - Section Spacing Fix Edition

### Overview
CRITICAL fix for excessive section spacing. Previous version added `\vspace{2em}` on top of LaTeX's default subsection spacing, causing gaps of 3-4x font height. This version uses controlled spacing with proper orphan prevention.

### Fixed (2 Critical Issues)
- **CRITICAL: Fixed excessive section spacing** - Sections no longer have huge gaps
  - **Problem:** `\vspace{2em}` was ADDITIVE to LaTeX's default `\subsection*` spacing
  - **Root Cause:** Manual vspace added ON TOP of titlesec/article defaults (~1em)
  - **Solution:** Reduced to `\vspace{1.5em}` total for sections, `\vspace{1em}` for subsections
  - **Impact:** Section gaps now ≤2x font height as required

- **CRITICAL: Fixed HebrewTitle/HebrewSubtitle TOC rendering** - Hebrew text in TOC now renders correctly
  - **Problem:** Hebrew argument (#2) was not wrapped in `\texthebrew{}`, causing RTL issues in TOC
  - **Solution:** Changed `\quad#2` to `\quad\texthebrew{#2}` in both commands
  - **Impact:** TOC entries now display Hebrew text correctly in RTL

### Changed
- **Section Spacing**: 2em → 1.5em before section titles
- **Subsection Spacing**: 1.5em → 1em before subsection titles
- **HebrewTitle**: Now wraps #2 in `\texthebrew{}`
- **HebrewSubtitle**: Now wraps #2 in `\texthebrew{}`
- **Version String**: "V5.8.0-2025-12-11"

### Spacing Rules Summary (v5.8.0)
| Element | Spacing | Notes |
|---------|---------|-------|
| Before section | 1.5em | 1.5x font height (~18pt) |
| Before subsection | 1em | 1x font height (~12pt) |
| After section/subsection | 0.5em | 0.5x font height |
| Section needspace | 5 lines | Orphan prevention |
| Subsection needspace | 4 lines | Orphan prevention |
| List item gap | 0.5ex | Half font height |

### Technical Details
- **CLS Version:** V5.8.0-2025-12-11
- **Lines Changed:** 238-246 (HebrewTitle/HebrewSubtitle), 468-479 (hebrewsection), 492-505 (hebrewsubsection)
- **Backward Compatibility:** 100% - documents compile unchanged, just better spacing
- **QA Detection:** This issue should be detected by qa-typeset-detect (overfull vbox) and qa-BiDi-detect (TOC BiDi)

---

## [5.7.0] - 2025-12-11 - Spacing Standards Edition

### Overview
Added precise control over list and section spacing for academic document standards. Lists now have consistent half-font-height spacing, and sections have proper page break handling.

### Added
- **enumitem Package Integration** - Precise list spacing control
  - `itemsep=0.5ex` - Half font height between list items
  - `parsep=0pt` - No extra paragraph spacing within items
  - `topsep=0.5ex` - Half font height above/below lists
  - `partopsep=0pt` - No extra partial line spacing
  - `leftmargin=2em` - Consistent left margin
  - `labelsep=0.5em` - Label-to-text separation

- **needspace Package Integration** - Section page break control
  - Sections require minimum 5 lines available before starting
  - Prevents orphaned section headers at page bottom
  - `\needspace{5\baselineskip}` before each section

### Changed
- **Section Spacing Standards**
  - `\hebrewsection`: 2em (24pt at 12pt font) space before title
  - `\hebrewsubsection`: 1.5em (18pt at 12pt font) space before title
  - 0.5em space after section/subsection titles
  - Sections with ≤5 lines content start on new page

- **Version String**: "V5.7.0-2025-12-11"

### Technical Details
- **CLS Version:** V5.7.0-2025-12-11
- **Total Commands:** 80 (unchanged)
- **New Packages:** enumitem, needspace
- **Backward Compatibility:** 100% - existing documents automatically get improved spacing
- **QA Verification:** All 16 CLS-examples compiled and verified

### Spacing Rules Summary
| Element | Spacing | Notes |
|---------|---------|-------|
| List item gap | 0.5ex | Half font height |
| Before section | 2em | Double font height max |
| Before subsection | 1.5em | 1.5x font height |
| After section title | 0.5em | Half font height |
| Section needspace | 5 lines | Prevents orphan headers |

---

## [5.6.1] - 2025-12-05 - Pythonbox Environment Stability

### Overview
Stabilized pythonbox environment by removing conflicting float wrapper that caused environment stack issues with BiDi.

### Fixed
- **Pythonbox Environment Stability** - Removed `python` float wrapper from pythonbox environment
  - Previous float wrapper conflicted with BiDi processing
  - Now uses same stable approach as `pythonbox*`
  - `\hebtitle{}` implementation simplified to use `\texthebrew{}` wrapper

### Technical Details
- **CLS Version:** V5.6.1-2025-12-05
- **Total Commands:** 80
- **Backward Compatibility:** 100%

---

## [5.6.0] - 2025-12-05 - Pythonbox Hebrew Title Support

### Overview
Added `\hebtitle{}` command for Hebrew titles in pythonbox/tcolorbox environments.

### Added
- **`\hebtitle{}`** - Hebrew RTL titles in pythonbox/tcolorbox
  - Supports nested `\en{}` for English text
  - Prevents rendering issues from Hebrew in code block titles
- **PDF String Handling:** Added `\hebtitle` to `\pdfstringdefDisableCommands`

### Usage Examples
```latex
% Pure Hebrew title
\begin{pythonbox}[\hebtitle{כותרת בעברית}]
...code...
\end{pythonbox}

% Mixed Hebrew/English title
\begin{pythonbox}[\hebtitle{פתרון \en{SVM} עם \en{cvxopt}}]
...code...
\end{pythonbox}

% Pure English title (no wrapper needed)
\begin{pythonbox}[SVM Solution with cvxopt]
...code...
\end{pythonbox}
```

---

## [5.5.0] - 2025-11-28 - Footer/Header BiDi Fix Edition

### Overview
CRITICAL fix for Hebrew text in fancyhdr footers/headers appearing reversed (LTR instead of RTL). Added new `\hebfoot{}` command for proper mixed Hebrew/English content in footer/header context.

### Fixed (1 Critical Issue)
- **CRITICAL: Fixed Hebrew text in footers appearing reversed (LTR)** - Hebrew now displays properly RTL
  - **Problem:** Hebrew text "כל הזכויות שמורות" appeared as "תורומש תויוכז הלכ" (reversed) in page footers
  - **Root Cause:** fancyhdr operates in LTR context even in RTL documents; `\texthebrew{}` alone doesn't set proper RTL direction
  - **User Report:** "some of the pages the footer do not support bidi. see for example page 62 footer"
  - **Solution:** New `\hebfoot{}` command that explicitly sets `\textdir TRT\pardir TRT` for footer/header context
  - **Usage Pattern:** `\hebfoot{כל הזכויות שמורות - \en{© Dr. Name}}` (Hebrew RTL base with `\en{}` for English LTR)
  - **Lines Changed:** CLS lines 591-617 (new command), 627-628 (footer definitions), 703 (title page)
  - **Impact:** All document footers and title page copyright now display Hebrew correctly in RTL
  - **Detected by:** Enhanced qa-BiDi-detect agent (Rule 5: Header/Footer Hebrew)

### Added
- **New Command:** `\hebfoot{}` - Hebrew RTL footer/header with mixed language support
  - Forces RTL text direction for footer/header content
  - Supports nested `\en{}` for English text (remains LTR inline)
  - Similar to `\hebcell{}` but optimized for single-line footer/header context
  - Works within fancyhdr context which defaults to LTR
- **PDF String Handling:** Added `\hebfoot` to `\pdfstringdefDisableCommands` for hyperref compatibility

### Changed
- Footer definitions now use `\hebfoot{}` + `\en{}` pattern (lines 627-628)
- Title page copyright now uses `\hebfoot{}` + `\en{}` pattern (line 703)
- Version string: "V5.5-2025-11-28"

### Technical Details
- **CLS Version:** V5.5-2025-11-28
- **Total Commands:** 79 (up from 78)
- **Lines Changed:** CLS lines 591-617 (new `\hebfoot{}` command), 627-628 (footer definitions), 703 (title page copyright)
- **Root Cause Analysis:** fancyhdr operates independently of document RTL settings; requires explicit text direction commands
- **Fix Mechanism:** `\hebfoot{}` wraps content in `\bgroup\textdir TRT\pardir TRT\selectlanguage{hebrew}...\egroup`
- **Pattern:** Follows established `\hebcell{}` pattern from table cell handling
- **Backward Compatibility:** 100% - existing documents work unchanged, new `\hebfoot{}` available for custom footers
- **Cross-Platform:** Uses standard luabidi commands, works on Windows/MiKTeX and Linux/TeX Live

## [5.4.0] - 2025-11-10 - Code Block Background Overflow Fix Edition

### Overview
CRITICAL fix for code block background overflow in RTL documents. Background was extending beyond right margin, making code appear without visible gray background. Also fixes version number appearing reversed in RTL context.

### Fixed (3 Critical Issues)
- **CRITICAL: Fixed code block background overflow in RTL documents** - Background now properly contained
  - **Problem:** Background started at right margin and overflowed outside document, making code appear without light gray background
  - **Root Cause:** tcolorbox in RTL context needs explicit text direction control - LTR environment not sufficient
  - **User Report:** "background light gray is start in the most right margin and overflow to the right outside of the document"
  - **Solution:** Use python float environment + explicit text direction: `\begin{python}\begingroup\selectlanguage{english}\textdir TLT\pardir TLT`
  - **Lines Changed:** CLS lines 726-727 (pythonbox) and 765-766 (pythonbox*)
  - **Solution Source:** Working implementation from C:\25D\EX\L12\Latex project (proven solution)
  - **Impact:** All code blocks now display with visible light gray background properly contained within page margins
  - **Detected by:** Enhanced Code Block QA Agent + user testing

- **CRITICAL: Fixed section numbering starting from 0** - Sections now properly numbered starting from 1
  - **Problem:** Section numbers appeared as 0.1, 0.2, 0.3... instead of 1, 2, 3...
  - **Root Cause:** `\thehebrewsection` defined as `\thehebrewchapter.\arabic{hebrewsection}`, showing "0.X" when no chapters used
  - **User Report:** "error the numbering start from 0 it should start from 1"
  - **Solution:** Redefined `\thehebrewsection` with conditional to show section number without chapter prefix when `hebrewchapter=0`
  - **Lines Changed:** CLS lines 356-362 (conditional `\thehebrewsection` definition)
  - **Impact:** All sections now correctly numbered 1, 2, 3... and subsections 1.1, 2.1, etc. when no chapters used
  - **Detected by:** Enhanced RTL/LTR QA Agent with section numbering verification

- **CRITICAL: Fixed version number appearing RTL in Hebrew context** - Numbers now display in correct LTR direction
  - **Problem:** Version number "0.5" appeared as "5.0" (reversed) in title page Hebrew text "גרסה 0.5"
  - **Root Cause:** Numbers inherit RTL direction from surrounding Hebrew text when not explicitly wrapped with LTR directives
  - **User Report:** "error in גרסה 0.5 the number is RTL"
  - **Solution:** Separated Hebrew text and number with explicit directionality: `\hebrewversion{\texthebrew{גרסה }\LR{0.5}}`
  - **Lines Changed:** beginner_example.tex line 17
  - **Key Insight:** Must explicitly wrap Hebrew word with `\texthebrew{}` and number with `\LR{}` to prevent reversal
  - **Impact:** Version number and all numbers in Hebrew context now display correctly in LTR
  - **Detected by:** Enhanced RTL/LTR QA Agent with RTL number detection

### Changed
- pythonbox environment: Changed `before` to use python float + explicit text direction (line 726)
- pythonbox environment: Changed `after` to close python float environment (line 727)
- pythonbox* environment: Changed `before` to use explicit text direction without float (line 765)
- pythonbox* environment: Changed `after` to close group (line 766)
- Section numbering: Redefined `\thehebrewsection` with conditional logic (lines 356-362)
- Example document: Wrapped version number with `\num{}` to prevent RTL reversal (beginner_example.tex line 17)
- Code Block QA Agent: Enhanced with background overflow detection methodology
- RTL/LTR QA Agent: Enhanced with section numbering verification (Phase 4) and RTL number detection

### Technical Details
- **CLS Version:** V5.4-2025-11-10
- **Lines Changed:** CLS lines 356-362 (section numbering), 726-727, 765-766 (pythonbox environments)
- **Root Cause Analysis:**
  - Code blocks: tcolorbox needs explicit `\textdir TLT\pardir TLT` within python environment wrapper
  - Section numbering: `\thehebrewsection` hardcoded as `\thehebrewchapter.\arabic{hebrewsection}`, showing "0.X" when no chapters exist
- **Fix Mechanism:**
  - Code blocks: Wrapping in `\begin{python}` float + `\begingroup\selectlanguage{english}\textdir TLT\pardir TLT` forces proper LTR layout
  - Section numbering: Conditional `\thehebrewsection` definition using `\ifnum\value{hebrewchapter}=0` to show plain numbers when no chapters
- **Key Insights:**
  - `\begin{LTR}` environment was insufficient - needed explicit textdir/pardir commands
  - Template supports both chapter-based (book) and chapter-less (article) documents - numbering must adapt
- **Backward Compatibility:** 100% - only fixes broken rendering, no API changes
- **Agent Count:** 3 (enhanced Code Block QA Agent with overflow detection + enhanced RTL/LTR QA Agent)
- **Verification:** ✅ PASS - All fixes verified by QA agents
  - Code blocks: Background properly contained within margins
  - Section numbering: Body and TOC both show 1-12 (not 0.1-0.12)
  - Subsections: Correctly numbered 8.1, 8.2 (not 0.8.1, 0.8.2)
  - Version number: Displays as "גרסה 0.5" with LTR "0.5" (not reversed "5.0")

## [5.3.0] - 2025-11-10 - Code Block Fix Edition

### Overview
Critical code block fixes addressing character encoding normalization and Hebrew translation of code comments.

### Fixed (2 Critical Issues)
- **CRITICAL: Fixed hyphen character encoding in code blocks** - Code now displays standard ASCII hyphens
  - **Problem:** Code blocks allowed non-ASCII hyphen variants (Unicode minus, en-dash, em-dash) to appear
  - **Root Cause:** No literate replacements in pythonbox/pythonbox* listing options (lines 707-714, 742-748)
  - **Solution:** Added literate rules to normalize all hyphen variants: `literate={-}{{-}}1 {−}{{-}}1 {–}{{-}}1 {—}{{-}}1`
  - **Additional Fix:** Added `upquote=true` to ensure straight quotes (not curly) in code
  - **Impact:** All code blocks now display consistent ASCII characters preventing copy-paste issues
  - **Detected by:** New Code Block QA Agent (code-block-qa-agent-skill.md)

- **CRITICAL: Fixed code comment translation** - Code comments now in Hebrew for Hebrew documents
  - **Problem:** Code comments and docstrings in beginner_example.tex were in English
  - **Example Fixed:** beginner_example.tex Python code block now has Hebrew comments
  - **Translations Applied:**
    - `# Simple function to calculate average` → `# פונקציה פשוטה לחישוב ממוצע`
    - `"""Calculate the average of a list of numbers"""` → `"""מחשבת את הממוצע של רשימת מספרים"""`
    - `# Example usage` → `# דוגמת שימוש`
    - `print(f"The average is: {result}")` → `print(f"הממוצע הוא: {result}")`
  - **Impact:** Demonstrates proper localization for Hebrew academic code examples

### Added
- **New Quality Assurance Agent:** `code-block-qa-agent-skill.md` in agents/ folder
  - Specialized agent for detecting code block formatting issues
  - Validates background color (light gray vs white)
  - Detects non-ASCII character encoding (hyphens, quotes, special chars)
  - Verifies Hebrew translation of code comments and docstrings
  - Checks code structure and LTR text direction
  - Provides detailed reports with Unicode code point analysis

### Changed
- Code block literate replacements: Added hyphen normalization rules (lines 707-714, 742-748)
- Code block quote handling: Added `upquote=true` for straight quotes (lines 707-714, 742-748)
- Updated beginner_example.tex with fully Hebrew-translated code comments

### Technical Details
- **CLS Version:** V5.3-2025-11-10
- **Lines Changed:** CLS lines 707-714, 742-748 (pythonbox and pythonbox* listing options)
- **Examples Updated:** beginner_example.tex (Python code block Hebrew translation)
- **Backward Compatibility:** 100% - only improves character rendering and localization
- **Agent Count:** 3 (added Code Block QA Agent)

## [5.2.0] - 2025-11-10 - Table Layout Fix Edition

### Overview
Critical table layout fixes for Hebrew academic documents addressing caption alignment and RTL column ordering.

### Fixed (2 Critical Bugs)
- **CRITICAL: Fixed table caption alignment** - Captions now properly centered instead of left-aligned
  - **Problem:** Table captions were left-aligned due to `raggedleft` setting in Hebrew RTL context
  - **Root Cause:** `\captionsetup{justification=raggedleft}` in `hebrewtable` environment (line 363)
  - **Solution:** Changed to `\captionsetup{justification=centering}` for proper academic table formatting
  - **Impact:** All Hebrew tables now have centered captions following academic standards
  - **Detected by:** New Table Layout QA Agent (table-layout-qa-agent-skill.md)

- **CRITICAL: Fixed example table column order** - Tables now use proper RTL column ordering
  - **Problem:** Table columns followed LTR order (Name → Value → Unit) instead of RTL
  - **Example Fixed:** beginner_example.tex Table 1 now has RTL order (Unit → Value → Name)
  - **Visual Result:** Column 1 (Unit) rightmost, Column 2 (Value) center, Column 3 (Name) leftmost
  - **Impact:** Demonstrates correct RTL table authoring for Hebrew documents

### Added
- **New Quality Assurance Agent:** `table-layout-qa-agent-skill.md` in agents/ folder
  - Specialized agent for detecting table layout problems
  - Validates caption alignment (left/center/right)
  - Verifies RTL column ordering in Hebrew tables
  - Analyzes semantic vs. visual column order
  - Provides detailed reports with fix recommendations

### Changed
- Table caption justification: `raggedleft` → `centering` (line 363)
- Enhanced RTL tabular documentation with clearer column order examples
- Updated beginner_example.tex to demonstrate correct RTL table structure

### Technical Details
- **CLS Version:** V5.2-2025-11-10
- **Lines Changed:** CLS line 363 (caption justification)
- **Examples Updated:** beginner_example.tex (table column order reversed)
- **Backward Compatibility:** 100% - only fixes incorrect behavior
- **Agent Count:** 10 (added Table Layout QA Agent)

## [5.1.0] - 2025-11-10 - RTL/LTR Fix Edition

### Overview
Critical bugfix release addressing systematic English text reversal in section titles, subsections, and captions.

### Fixed (1 Critical Bug)
- **CRITICAL: Fixed `\entoc{}` command** - English text in mixed Hebrew/English titles now renders correctly
  - **Problem:** English text appeared reversed (RTL) in section titles, subsections, table captions, and TOC
  - **Examples:** "Introduction" appeared as "noitcudortnI", "Basic Lists" as "stsiL cisaB"
  - **Root Cause:** `\entoc{}` was defined as `\newcommand{\entoc}[1]{#1}` without text direction control
  - **Solution:** Changed to `\newcommand{\entoc}[1]{\textenglish{#1}}` to force LTR rendering
  - **Impact:** All 7 example documents now render correctly
  - **Detected by:** New RTL/LTR QA Agent (rtl-ltr-qa-agent-skill.md)

### Added
- **New Quality Assurance Agent:** `rtl-ltr-qa-agent-skill.md` in agents/ folder
  - Specialized agent for detecting bidirectional text direction problems
  - Systematically analyzes PDFs for reversed English text
  - Validates section titles, subsections, captions, and TOC entries
  - Provides detailed reports with specific locations and fix recommendations

### Changed
- Version string: "V5.1-2025-11-10"
- Updated `\entoc{}` command documentation with proper usage
- Enhanced inline comments explaining text direction handling

### Technical Details
- **Total Commands:** 78 (unchanged)
- **Total Environments:** 8 (unchanged)
- **Lines of Code:** ~755 (added comments)
- **Backward Compatibility:** 100% - fix only corrects broken behavior
- **Agent Count:** 9 (added RTL/LTR QA Agent)

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

| Feature | v1.0 | v3.0 | v5.0 | v5.6 |
|---------|------|------|------|------|
| Commands | 60 | 72 | 78 | 80 |
| Environments | 6 | 8 | 8 | 8 |
| Packages | 22 | 24 | 24+ | 24+ |
| Chapter Support | ✗ | ✓ | ✓ | ✓ |
| Enhanced Tables | ✗ | ✓ | ✓ | ✓ |
| Non-floating Code | ✗ | ✓ | ✓ | ✓ |
| Biber Backend | ✓ | ✗ | ✓ | ✓ |
| RTL Captions | ✓ | ✗ | ✓ | ✓ |
| PDF Bookmarks | Issues | Issues | ✓ | ✓ |
| Symbol Commands | ✓ | ✗ | ✓ | ✓ |
| Footer BiDi | Issues | Issues | Issues | ✓ |
| Code Block Hebrew Titles | ✗ | ✗ | ✗ | ✓ |

## Migration Notes

### From v1.0 to v5.6
- No changes required - fully backward compatible
- New features available but not required
- Consider using new table commands for better formatting
- Footer/header Hebrew text displays correctly
- Hebrew titles in code blocks supported with `\hebtitle{}`

### From v3.0 to v5.6
- No changes required - fully backward compatible
- PDF bookmark errors automatically fixed
- Table captions properly centered
- Footer Hebrew text displays correctly
- Code block Hebrew titles supported

### From v5.0/v5.4/v5.5 to v5.6
- No changes required - fully backward compatible
- For Hebrew titles in pythonbox, use `\hebtitle{}`

## Development History

The Hebrew Academic Template evolved through community needs:

1. **v1.0** - Foundation for Hebrew academic documents
2. **v3.0** - Extended for book-length works with chapters
3. **v5.0** - Unified all features, fixed all regressions
4. **v5.5** - Footer/header BiDi support
5. **v5.6** - Pythonbox Hebrew title support

Each version built upon user feedback and real-world usage in academic institutions.