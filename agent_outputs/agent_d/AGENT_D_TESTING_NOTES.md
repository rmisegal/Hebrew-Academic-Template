# Agent D: Testing Notes for CLS v5.0

**Version:** hebrew-academic-template.cls v5.0
**Date:** 2025-11-09
**Purpose:** Comprehensive testing guide for the unified CLS

---

## Critical Tests Required

### 1. Bibliography Backend Test
**Test:** Compile document with mixed Hebrew/English bibliography
```latex
\documentclass{hebrew-academic-template}
\addbibresource{references.bib}
\begin{document}
Text with citation \cite{hebrew_source,english_source}
\printhebrewbibliography
\printenglishbibliography
\end{document}
```
**Expected:**
- Compilation with `lualatex` → `biber` → `lualatex`
- Proper Unicode handling
- Hebrew and English sections separate
- LTR citation numbers [1], [2]

### 2. PDF Bookmark Test
**Test:** Multi-chapter document
```latex
\documentclass{hebrew-academic-template}
\begin{document}
\tableofcontents
\hebrewchapter{פרק ראשון}
\hebrewsection{סעיף ראשון: \entoc{Section One}}
\hebrewsubsection{תת-סעיף: \entoc{Subsection}}
\hebrewchapter{פרק שני}
\hebrewsection{סעיף בפרק השני: \entoc{Section in Chapter Two}}
\end{document}
```
**Expected:**
- NO "destination with same identifier" errors
- Clickable PDF bookmarks
- Proper hierarchy in PDF viewer
- Correct counter reset (2.1 after chapter 2)

### 3. Table Caption Alignment Test
**Test:** Hebrew table with caption
```latex
\begin{hebrewtable}[h]
\caption{כותרת הטבלה בעברית: \en{English Caption}}
\begin{rtltabular}{|c|c|c|}
\hline
\hebcell{עברית} & \num{123} & \en{English} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```
**Expected:**
- Caption right-aligned (RTL)
- Table centered
- Proper cell alignment

### 4. Restored Commands Test
**Test:** All restored v1.0 commands
```latex
% Test \ltr{} for bracket protection
Hebrew text with \ltr{[bracketed content]}

% Test percentage
דיוק של \percent{95.5}

% Test symbols
\warningsymbol{} אזהרה
\checksymbol{} בדיקה
```
**Expected:**
- Brackets remain in correct order
- Percentage shows as "95.5%"
- Warning triangle displays
- Checkmark displays

### 5. Enhanced Table Cells Test
**Test:** All cell command types
```latex
\begin{hebrewtable}[h]
\begin{rtltabular}{|m{3cm}|m{3cm}|m{3cm}|}
\hline
\textbf{\hebheader{כותרת עברית}} &
\textbf{\enheader{English Header}} &
\textbf{\hebheader{מעורב / \en{Mixed}}} \\
\hline
\hebcell{תא עברי} &
\encell{English cell} &
\hebcell{עברית עם \en{English}} \\
\hline
\end{rtltabular}
\end{hebrewtable}
```
**Expected:**
- Headers properly aligned
- Vertical padding visible
- Mixed content handled correctly

### 6. Math Commands Test
**Test:** Hebrew in math mode
```latex
% Inline math
נוסחה: $\hebmath{משתנה} = x^2$

% Display math
\begin{equation}
y_{\hebsub{תחתון}} = \argmin_{x} f(x)
\end{equation}

% Special characters
\Rsquared{} coefficient
Direction \rarrow{} result
```
**Expected:**
- Hebrew displays RTL within LTR math
- Subscript in Hebrew
- R² displays correctly
- Arrow points left in RTL

### 7. Code Environment Test
**Test:** Floating and non-floating code
```latex
% Floating
\begin{pythonbox}[כותרת: \en{Python Example}]
def function():
    return "Hello World"
\end{pythonbox}

% Non-floating (long code)
\begin{pythonbox*}[Long Code]
# This is a very long code block
# ... many lines ...
\end{pythonbox*}
```
**Expected:**
- Floating box with caption
- Non-floating box breaks across pages
- Black title text (coltitle=black)
- Gray background

### 8. Path Command Test
**Test:** Filenames with hyphens
```latex
% In text
File path: \enpath{/usr/local/my-file-name.txt}

% In figure caption
\begin{figure}[h]
\centering
\includegraphics[width=0.5\textwidth]{image.png}
\caption{Diagram from \enpath{fork-join-model.pdf}}
\end{figure}
```
**Expected:**
- Hyphens display correctly
- Courier font (or fallback)
- LTR direction maintained

---

## Platform-Specific Tests

### Windows (MiKTeX)
1. Verify Times New Roman loads
2. Verify David CLM for Hebrew
3. Verify Courier New for \enpath{}
4. Test biber executable found

### Linux (TeX Live)
1. Verify Latin Modern Roman fallback
2. Verify DejaVu Sans for Hebrew
3. Verify DejaVu Sans Mono for \enpath{}
4. Test biber executable found

---

## Compilation Workflow Test

### Standard Compilation
```bash
lualatex test.tex
biber test
lualatex test.tex
lualatex test.tex
```
**Expected:**
- First run: Generates .bcf file
- Biber run: Processes bibliography
- Second run: Includes bibliography
- Third run: Finalizes references

### Error-Free Compilation
**Check for:**
- NO "destination with same identifier" errors
- NO "Missing character" warnings (except expected)
- NO "Undefined control sequence" errors
- NO font warnings (fallbacks should work)

---

## Backward Compatibility Tests

### v1.0 Document Test
Take existing v1.0 document and compile with v5.0 CLS:
- All commands should work
- No new errors
- Same visual output

### v3.0 Document Test
Take existing v3.0 document and compile with v5.0 CLS:
- Chapter hierarchy maintained
- All enhancements work
- No regressions

---

## Regression Tests

### Test Each Fixed Regression
1. **biber backend:** Create .bib with Unicode entries
2. **RTL captions:** Multiple tables with Hebrew captions
3. **\phantomsection:** Document with 10+ sections
4. **Restored commands:** Use each restored command

---

## Performance Tests

### Large Document Test
- 100+ page document
- Multiple chapters
- 50+ bibliography entries
- 20+ tables and figures

**Expected:**
- Reasonable compilation time
- No memory issues
- PDF bookmarks work throughout

---

## Edge Cases

### Mixed Direction Test
```latex
\hebrewsection{Hebrew \en{with English} וחזרה לעברית: \entoc{Mixed Section}}
```

### Nested Language Test
```latex
\hebcell{Hebrew with \en{English with \num{123} numbers} וחזרה}
```

### Special Characters Test
```latex
Math: $\alpha \beta \gamma$
Symbols: © ® ™
Hebrew: א-ת with nikud if needed
```

---

## Test File Recommendations

Create these test files:
1. `test-basic.tex` - Minimal working example
2. `test-bibliography.tex` - Bibliography features
3. `test-tables.tex` - All table commands
4. `test-math.tex` - Math and Hebrew
5. `test-code.tex` - Code environments
6. `test-compatibility.tex` - v1.0 commands
7. `test-full.tex` - Complete feature test

---

## Success Criteria

✅ All tests compile without errors
✅ PDF output visually correct
✅ Bookmarks clickable and correct
✅ Bibliography properly sorted
✅ Tables aligned correctly
✅ Math displays properly
✅ Code highlighting works
✅ Cross-platform compatibility

---

## Known Limitations

1. \rtlrow{} not fully implemented (placeholder only)
2. Some Hebrew fonts may not support all symbols
3. Biber required (not bibtex)
4. LuaLaTeX required (not pdfLaTeX)

---

## Conclusion

Run all tests above to validate v5.0 functionality. Document any issues found for future patches.

**Testing Status:** READY TO BEGIN