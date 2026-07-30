# Hebrew Academic Template v5.0 - Migration Guide

## Overview

Version 5.0 is 100% backward compatible with all previous versions. This guide helps you upgrade smoothly and take advantage of new features.

## Quick Migration Summary

| From Version | Required Changes | Optional Improvements |
|--------------|------------------|----------------------|
| v1.0 → v5.0 | None | Use enhanced table commands |
| v3.0 → v5.0 | None | Enjoy fixed regressions |
| New User | N/A | Start with v5.0 directly |

## Upgrading from v1.0 to v5.0

### Step 1: Replace Class File
```bash
# Backup old version
cp hebrew-academic-template.cls hebrew-academic-template-v1.cls

# Copy new version
cp hebrew-academic-template-v5.cls hebrew-academic-template.cls
```

### Step 2: Recompile
```bash
lualatex document.tex
biber document
lualatex document.tex
lualatex document.tex
```

### Step 3: Verify Output
Your document should compile without any changes. Check:
- Table captions are right-aligned (fixed)
- PDF bookmarks work (fixed)
- All commands work as before

### New Features Available

#### Enhanced Table Commands
Old v1.0 style (still works):
```latex
\begin{rtltabular}{|c|c|}
\hebcell{טקסט} & \num{123} \\
\end{rtltabular}
```

New v5.0 style (recommended):
```latex
\begin{rtltabular}{|c|c|}
\hebheader{כותרת} & \enheader{Header} \\
\hline
\hebcell{טקסט מעורב} & \encell{English} \\
\end{rtltabular}
```

#### Chapter Support
For book-length documents:
```latex
\hebrewchapter{שם הפרק}
\hebrewsection{סעיף בפרק: \entoc{Section}}
```

#### Math Enhancements
```latex
% New Hebrew in math
$\hebmath{משתנה}$
$x_{\hebsub{תחתון}}$

% New operators
$\argmin_x f(x)$
$\argmax_x g(x)$
```

## Upgrading from v3.0 to v5.0

### Automatic Fixes
These issues are automatically resolved:

1. **Bibliography Backend**: Now uses biber (better Unicode)
2. **RTL Captions**: Hebrew table captions properly aligned
3. **PDF Bookmarks**: No more "duplicate identifier" errors
4. **Restored Commands**: `\ltr{}`, `\warningsymbol`, `\checksymbol`

### No Action Required
Your v3.0 documents work unchanged. The fixes are automatic.

### Version Check
Verify you're using v5.0:
```latex
\documentclass{hebrew-academic-template}
\begin{document}
Version: \clsversion  % Should show V05-2025-11-09
\end{document}
```

## Feature Adoption Guide

### Recommended Adoptions by Priority

#### High Priority (Immediate Benefits)
1. Use `\encell{}` for English table cells
2. Use `\hebheader{}` and `\enheader{}` for headers
3. Use `pythonbox*` for long code blocks

#### Medium Priority (Quality Improvements)
1. Add `\hebrewchapter{}` for books
2. Use `\hebmath{}` instead of `\hebtextmath{}`
3. Apply `\enpath{}` for file paths

#### Low Priority (Nice to Have)
1. Use `\argmin` and `\argmax` in optimization
2. Apply special character commands
3. Add version tracking with `\hebrewversion{}`

## Common Migration Scenarios

### Scenario 1: Simple Article
No changes needed. Just replace the .cls file.

### Scenario 2: Thesis with Tables
Consider updating complex tables:
```latex
% Old style
\mixedcell{Hebrew \en{English}}

% New style (clearer)
\hebcell{Hebrew \en{English}}  % For Hebrew-dominant
\encell{Mostly English}         % For English-dominant
```

### Scenario 3: Book with Chapters
Add chapter structure:
```latex
% Old: Just sections
\hebrewsection{Chapter 1: Introduction}

% New: Proper hierarchy
\hebrewchapter{Introduction}
\hebrewsection{Background: \entoc{Background}}
```

### Scenario 4: Technical Document with Code
Use non-floating for long code:
```latex
% Old: May cause page overflow
\begin{pythonbox}[Long Code]
# 100+ lines...
\end{pythonbox}

% New: Handles page breaks
\begin{pythonbox*}[Long Code]
# 100+ lines...
\end{pythonbox*}
```

## Deprecation Notes

### No Deprecated Commands
All v1.0 and v3.0 commands remain functional:
- `\mixedcell{}` works (alias to `\hebcell{}`)
- Old figure commands work
- All text direction commands preserved

### Future Considerations
While not deprecated, consider modern alternatives:
- Use `\hebmath{}` over `\hebtextmath{}`
- Use `\encell{}` for clarity over generic `\mixedcell{}`
- Use structured chapters for books

## Testing Checklist

After migration, verify:

- [ ] Document compiles without errors
- [ ] Table captions are right-aligned
- [ ] PDF bookmarks work
- [ ] Citations appear correctly
- [ ] Math expressions render properly
- [ ] Code blocks display correctly
- [ ] Figures and captions align properly
- [ ] Page numbers are LTR
- [ ] Section numbers are correct
- [ ] Bibliography formats correctly

## Troubleshooting Migration

### Issue: Compilation Errors
```bash
# Clean and rebuild
rm *.aux *.bbl *.bcf *.blg *.log
lualatex document.tex
biber document
lualatex document.tex
```

### Issue: Missing Commands
Ensure using v5.0:
```bash
# Check first line of .cls file
head -n 1 hebrew-academic-template.cls
# Should show: % Version 5.0 - Unified Edition
```

### Issue: Font Problems
v5.0 has improved fallbacks. If issues persist:
```latex
% Force font refresh
\setmainfont{Times New Roman}[
  Renderer=Harfbuzz,
  Ligatures=TeX
]
```

## Migration Benefits Summary

### From v1.0
- 18 new features
- Better table handling
- Chapter support
- Enhanced math
- Improved code blocks

### From v3.0
- 4 critical fixes
- Restored biber backend
- Fixed PDF bookmarks
- RTL captions work
- Symbol commands back

### For New Users
- Start with the most complete version
- All features integrated
- Best practices built-in
- Comprehensive documentation

## Support

For migration help:
1. Check documentation files
2. See examples in /examples directory
3. Review FAQ section
4. Report issues on GitHub

Remember: v5.0 is designed for zero-friction upgrade. Your documents should just work!