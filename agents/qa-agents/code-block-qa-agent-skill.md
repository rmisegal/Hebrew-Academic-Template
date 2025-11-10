# Code Block Quality Assurance Agent

## Mission
Detect and report code block formatting issues in Hebrew academic documents, specifically focusing on character encoding, translation quality, and visual presentation.

## Scope
Analyze compiled PDF documents to verify:
1. Code block background colors
2. Character encoding (ASCII vs Unicode variants)
3. Hebrew translation of code comments
4. Code block structure and formatting

## Detection Criteria

### 1. Background Color and Overflow Check
**Requirement:** Code blocks should have light gray background (RGB ~245,245,245) that is properly contained within page margins

**Detection Method:**
- Extract visual properties from PDF code blocks
- Verify background is not white (RGB 255,255,255)
- **CRITICAL: Check for background overflow/extension beyond right margin**
- **Check if background starts at right margin and overflows to the right**
- **Check if background is properly contained within text boundaries**
- Report if background is missing, incorrect, or overflowing

**Background Overflow Issues to Detect:**
1. **Right Margin Overflow (RTL Documents):**
   - Background box starts at rightmost margin
   - Background extends BEYOND the right edge of the page
   - Background is not visible or appears cut off
   - Symptom: "Code appears without light gray background"

2. **Left Margin Overflow (LTR Documents):**
   - Background box extends beyond left edge
   - Similar visibility issues

3. **Box Alignment Issues:**
   - tcolorbox not properly aligned with text margins
   - Box wider than available text width
   - Box positioned incorrectly causing overflow

**Visual Indicators of Overflow:**
- Code block appears with no background (background is outside visible area)
- Background appears as thin line at edge of page
- Background cut off at page margin
- Asymmetric margins around code block

**Expected Result:** Light gray background present AND properly contained within page margins

### 2. Character Encoding Check
**Requirement:** All hyphens/minus signs in code must be ASCII standard (U+002D)

**Problematic Characters to Detect:**
- U+2212 (−) - Mathematical minus sign
- U+2013 (–) - En dash
- U+2014 (—) - Em dash
- Any other non-ASCII hyphen/minus variants

**Detection Method:**
- Scan all code content character by character
- Identify hyphen/minus characters
- Report Unicode code point for each
- Flag any non-ASCII variants

**Expected Result:** Only ASCII U+002D (-) hyphens

### 3. Hebrew Translation Check
**Requirement:** All code comments and docstrings should be in Hebrew

**Detection Method:**
- Identify Python comments (lines starting with #)
- Identify Python docstrings ("""...""")
- Detect language using character ranges:
  - Hebrew: U+0590 to U+05FF
  - English: U+0041 to U+007A
- Report any English text found in comments

**Expected Result:** All comments in Hebrew

### 4. Code Block Structure
**Requirement:** Code should maintain LTR direction with proper tcolorbox formatting

**Detection Method:**
- Verify code text flows left-to-right
- Check for tcolorbox visual structure
- Validate title/caption rendering

**Expected Result:** Proper LTR code layout

## Output Format

### Executive Summary
```
CODE BLOCK QA REPORT
Status: [PASS / FAIL]
Document: [filename]
Total Code Blocks: [N]
Issues Found: [N]
```

### Detailed Analysis
For each code block:
```
CODE BLOCK #[N] - [Title]
Location: Page [N]

✅/❌ Background Color: [PASS/FAIL]
   - Detected: RGB([r], [g], [b])
   - Expected: RGB(~245, ~245, ~245)
   - Overflow Check: [PASS/FAIL]
   - Box Position: [Within margins / Overflowing right / Overflowing left]
   - Visual Status: [Background visible / Background missing / Background cut off]

✅/❌ Character Encoding: [PASS/FAIL]
   - Total hyphens: [N]
   - ASCII (U+002D): [N]
   - Unicode variants: [N]
   - Details: [list specific character issues with line numbers]

✅/❌ Hebrew Translation: [PASS/FAIL]
   - Total comments: [N]
   - Hebrew comments: [N]
   - English comments: [N]
   - Details: [list English comments with line numbers]

✅ Structure: [PASS/FAIL]
   - Text direction: [LTR/RTL]
   - tcolorbox: [present/missing]
```

### Character Issue Details
```
CHARACTER ENCODING ISSUES:
Line 3: Found U+2212 (−) instead of U+002D (-)
        Context: "average = total − len(numbers)"
Line 5: Found U+2013 (–) instead of U+002D (-)
        Context: "result = calculate–average(data)"
```

### Translation Issue Details
```
TRANSLATION ISSUES:
Line 1: English comment detected
        Text: "# Simple function to calculate average"
        Should be: "# פונקציה פשוטה לחישוב ממוצע"

Line 2: English docstring detected
        Text: """Calculate the average of a list of numbers"""
        Should be: """מחשבת את הממוצע של רשימת מספרים"""

Line 9: English comment detected
        Text: "# Example usage"
        Should be: "# דוגמת שימוש"

Line 12: English in print statement
        Text: print(f"The average is: {result}")
        Should be: print(f"הממוצע הוא: {result}")
```

### Fix Recommendations
```
FIX RECOMMENDATIONS:

1. CLS File Fixes (hebrew-academic-template.cls):
   - Add literate replacements for hyphen variants
   - Add upquote=true for straight quotes
   - Locations: lines 707-714, 742-748

2. TEX File Fixes (beginner_example.tex):
   - Translate code comments to Hebrew
   - Translate docstrings to Hebrew
   - Translate print statement strings to Hebrew
   - Location: lines 103-115

3. Background Overflow Fixes (hebrew-academic-template.cls):

   **PROBLEM: Background overflows to the right in RTL documents**

   **ROOT CAUSE:** tcolorbox positioning in RTL context conflicts with bidi package

   **SOLUTION A - Use python float + explicit text direction (RECOMMENDED - PROVEN WORKING):**
   ```latex
   % In pythonbox environment definition (around line 712-738)
   \newtcblisting{pythonbox}[1][]{
     listing engine=listings,
     listing only,
     colback=codegray,
     colframe=codegray,
     arc=2pt,
     boxrule=0pt,
     left=8pt,
     right=8pt,
     top=8pt,
     bottom=8pt,
     fonttitle=\bfseries,
     coltitle=black,
     title=#1,
     before={\begin{python}\begingroup\selectlanguage{english}\textdir TLT\pardir TLT},
     after={\endgroup\end{python}},
     listing options={...}
   }
   ```

   **Key Elements:**
   - `\begin{python}` - Use python float environment
   - `\begingroup` - Create scope for settings
   - `\selectlanguage{english}` - Set language to English
   - `\textdir TLT\pardir TLT` - CRITICAL: Explicit text and paragraph direction left-to-right
   - This is the PROVEN working solution from C:\25D\EX\L12\Latex project

   **SOLUTION B - Use adjustbox wrapper:**
   ```latex
   % Wrap tcolorbox content with adjustbox
   \usepackage{adjustbox}

   \NewTColorBox{pythonbox}{O{}}{
     enhanced,
     before upper={\begin{adjustbox}{margin=0pt, max width=\textwidth}},
     after upper={\end{adjustbox}},
     ...
   }
   ```

   **SOLUTION C - Force text width constraint:**
   ```latex
   % Add width constraint to tcolorbox
   \NewTColorBox{pythonbox}{O{}}{
     enhanced,
     width=\textwidth,
     boxsep=0pt,
     left=5mm,
     right=5mm,
     ...
   }
   ```

   **VERIFICATION:**
   - Recompile document with LuaLaTeX
   - Check that code block background is visible
   - Verify background doesn't extend beyond right margin
   - Confirm symmetric margins around code block
```

## Analysis Instructions

### Step 1: Open PDF
Read the target PDF file (typically examples/beginner_example.pdf)

### Step 2: Locate Code Blocks
Identify all code blocks in the document by:
- Looking for tcolorbox environments
- Identifying monospace font sections
- Finding titled code sections

### Step 3: Extract Code Content
For each code block:
- Extract all text content
- Preserve line structure
- Note visual properties (background, borders)

### Step 4: Analyze Characters
For each code line:
- Scan for hyphen/minus characters
- Report Unicode code point
- Flag non-ASCII variants
- Provide context (surrounding text)

### Step 5: Analyze Language
For comment lines and docstrings:
- Detect language (Hebrew vs English)
- Count Hebrew characters (U+0590-U+05FF)
- Count English characters (U+0041-U+007A)
- Report if English detected

### Step 6: Analyze Structure
- Check text direction (should be LTR for code)
- Verify background color
- Check tcolorbox presence

### Step 7: Generate Report
- Compile all findings
- Provide executive summary
- List specific issues with line numbers
- Generate fix recommendations

## Success Criteria

### PASS Verdict Requirements
All of the following must be true:
- ✅ Background color is light gray (not white)
- ✅ **Background is properly contained within page margins (no overflow)**
- ✅ **Background is fully visible and not cut off**
- ✅ All hyphens are ASCII U+002D
- ✅ All comments are in Hebrew
- ✅ Code structure is LTR with tcolorbox

### FAIL Verdict Triggers
Any of the following:
- ❌ Non-ASCII hyphen characters found
- ❌ English comments found
- ❌ White or missing background
- ❌ **Background overflow beyond page margins (CRITICAL)**
- ❌ **Background not visible (cut off or outside viewport)**
- ❌ RTL text direction in code
- ❌ Missing tcolorbox structure

## Usage Example

```
Task: Analyze beginner_example.pdf for code block issues
Expected Output:
1. Executive summary showing FAIL status
2. Detection of non-ASCII hyphens (if present)
3. Detection of English comments (currently present)
4. Specific line numbers and fix recommendations
```

## Integration with Template Development

This agent is part of the hebrew-academic-template.cls quality assurance suite:
- **v5.1:** RTL/LTR QA Agent (rtl-ltr-qa-agent-skill.md)
- **v5.2:** Table Layout QA Agent (table-layout-qa-agent-skill.md)
- **v5.3:** Code Block QA Agent (code-block-qa-agent-skill.md) ← THIS AGENT

## Version History
- **2025-11-10:** Initial creation for v5.3 code block fixes
- **Purpose:** Detect hyphen encoding and Hebrew translation issues

---

**Agent Status:** Ready for deployment
**Test Target:** examples/beginner_example.pdf
**Expected Result:** Should detect English comments and potentially non-ASCII hyphens
