# QA Agents Directory

## Overview

This directory contains specialized Quality Assurance (QA) agents for validating Hebrew Academic LaTeX documents. These agents ensure comprehensive quality control for bilingual (Hebrew-English) academic documents compiled with LuaLaTeX.

## Directory Structure

```
qa-agents/
├── qa-orchestrator-agent.md         # Master QA pipeline coordinator
├── rtl-ltr-qa-agent-skill.md        # Bidirectional text validator
├── table-layout-qa-agent-skill.md   # Table structure inspector
├── code-block-qa-agent-skill.md     # Code listing validator
├── drawing-agent-skill.md           # Image/figure validator
├── claude-cli-structure-agent-skill.md  # Project structure manager
├── qa-infrastructure-agent.md       # Project organization manager
└── README.md                        # This file
```

## Agent Roles

### 🎯 QA Orchestrator Agent (Master Coordinator)
**File:** `qa-orchestrator-agent.md`

**Role:** Master QA pipeline manager that coordinates all other QA agents

**Key Responsibilities:**
- Plan comprehensive QA testing strategy
- Coordinate multiple QA agents in parallel execution
- Aggregate results from all QA agents
- Provide unified PASS/FAIL verdict
- Generate comprehensive quality reports
- Track QA metrics and recommend fixes

**When to Use:**
- Run complete QA pipeline on any document
- Execute multiple QA checks simultaneously
- Get comprehensive quality report with all findings
- Coordinate fixes across multiple issue types

**Usage Example:**
```
"Run comprehensive QA on expert_example.pdf"
"Execute full QA pipeline for document validation"
"Orchestrate all QA agents on the latest PDF"
```

---

### 🔤 RTL/LTR QA Agent
**File:** `rtl-ltr-qa-agent-skill.md`

**Specialization:** Bidirectional text direction validation

**Key Capabilities:**
- ✅ Detect reversed English text (e.g., "noitcudortnI" instead of "Introduction")
- ✅ Detect reversed Hebrew text (LTR when should be RTL)
- ✅ Validate section/chapter title text direction
- ✅ Check Table of Contents rendering
- ✅ Verify inline mixed Hebrew/English content
- ✅ Detect numbers appearing in RTL context
- ✅ Verify section numbering starts from 1 (not 0)

**Critical for:**
- All Hebrew-English bilingual documents (ALWAYS RUN)
- Title pages with mixed content
- Documents with Table of Contents
- Section and chapter headings

**Typical Issues Found:**
- Section numbering: "0.1" instead of "1"
- Reversed English in titles: "noitcudortnI"
- Version numbers reversed: "5.0" instead of "0.5"
- Hebrew text appearing in wrong direction

**Execution Priority:** HIGH (critical for readability)

---

### 📊 Table Layout QA Agent
**File:** `table-layout-qa-agent-skill.md`

**Specialization:** Hebrew table structure and RTL column ordering

**Key Capabilities:**
- ✅ Detect caption alignment issues (left/center/right)
- ✅ Validate RTL column ordering in tables
- ✅ Check table structure for proper RTL orientation
- ✅ Verify mixed Hebrew/English content in cells
- ✅ Analyze semantic column order vs visual order

**Critical for:**
- Documents containing tables
- Data presentation in Hebrew academic papers
- Mixed Hebrew/English table content

**Typical Issues Found:**
- Caption left-aligned instead of centered
- LTR column order when RTL expected
- Semantic "Name/Value/Unit" appearing left-to-right instead of right-to-left

**Execution Priority:** MEDIUM (if tables present)

---

### 💻 Code Block QA Agent
**File:** `code-block-qa-agent-skill.md`

**Specialization:** Code listing validation and formatting

**Key Capabilities:**
- ✅ Check code block background colors and visibility
- ✅ Detect character encoding issues (ASCII vs Unicode hyphens)
- ✅ Verify Hebrew translation of code comments
- ✅ Validate code block structure and LTR direction
- ✅ Detect background overflow beyond page margins

**Critical for:**
- Technical documents with code examples
- Documents using pythonbox environments
- Code listings with Hebrew comments

**Typical Issues Found:**
- Code block background overflowing page margins
- Non-ASCII hyphens (U+2212 instead of U+002D)
- English comments instead of Hebrew
- Missing or incorrect background color

**Execution Priority:** MEDIUM (if code blocks present)

---

### 🖼️ Drawing/Image QA Agent
**File:** `drawing-agent-skill.md`

**Specialization:** Missing image detection and figure validation

**Key Capabilities:**
- ✅ Cross-reference List of Figures with actual rendered images
- ✅ Detect empty figure boxes and placeholder text
- ✅ Identify missing image files
- ✅ Diagnose root causes of missing images
- ✅ Provide specific fix recommendations with file paths

**Critical for:**
- Documents with figures and images
- Visual content validation
- Ensuring all figures actually render

**Typical Issues Found:**
- Empty figure boxes with only captions
- Placeholder text visible: "Figure using hebrewfigure command"
- Missing image files
- Wrong file paths in \includegraphics

**Execution Priority:** MEDIUM (if figures present)

---

### 🏗️ Claude CLI Structure Agent
**File:** `claude-cli-structure-agent-skill.md`

**Specialization:** Project structure organization and .claude folder management

**Key Capabilities:**
- ✅ Validate .claude folder structure
- ✅ Verify required directory hierarchy
- ✅ Create missing directories
- ✅ Generate proper file templates

**When to Use:**
- Setting up new projects
- Validating project structure
- Creating standard .claude directories

**Execution Priority:** LOW (infrastructure, not document quality)

---

### 📁 QA Infrastructure Agent
**File:** `qa-infrastructure-agent.md`

**Specialization:** Project file organization and cleanup

**Key Capabilities:**
- ✅ Verify and reorganize project folder structure
- ✅ Create complete project backups
- ✅ Categorize and move files to appropriate directories
- ✅ Maintain clean project organization

**When to Use:**
- Project cleanup and reorganization
- Before major structural changes
- Maintaining organized file hierarchy

**Execution Priority:** LOW (infrastructure, not document quality)

---

## Usage Workflows

### 1. Comprehensive QA Pipeline (Recommended)

Use the **QA Orchestrator Agent** to run all applicable agents in parallel:

```
Task: "Run comprehensive QA on examples/expert_example.pdf"

The orchestrator will:
1. Analyze document content (tables, code, figures)
2. Launch all relevant agents in parallel
3. Aggregate results from all agents
4. Provide unified report with all findings
5. Recommend prioritized fixes
```

**Benefits:**
- Fastest execution (parallel processing)
- Single comprehensive report
- Prioritized fix recommendations
- Automated agent selection based on content

---

### 2. Targeted QA Testing

Run specific agents for focused validation:

#### Check Text Direction Only
```
Task: "Run RTL/LTR QA agent on expert_example.pdf"
```

#### Validate Tables Only
```
Task: "Run table layout QA on expert_example.pdf"
```

#### Check Code Blocks Only
```
Task: "Run code block QA on expert_example.pdf"
```

#### Validate Images Only
```
Task: "Run drawing/image QA on expert_example.pdf"
```

---

### 3. Iterative Fix-and-Verify

After applying fixes, re-run QA:

```
1. Run comprehensive QA → Get report with issues
2. Apply recommended fixes
3. Re-run comprehensive QA → Verify fixes work
4. Repeat until PASS achieved
```

---

### 4. Project Setup and Maintenance

For project structure work:

```
Task: "Validate and organize project structure"

Uses:
- Claude CLI Structure Agent (for .claude directories)
- QA Infrastructure Agent (for file organization)
```

---

## QA Pipeline Architecture

### Parallel Execution Model

The QA Orchestrator runs these agents **concurrently** for maximum speed:

```
          ┌─────────────────────────┐
          │  QA Orchestrator Agent  │
          └────────────┬────────────┘
                       │
       ┌───────────────┼───────────────┬──────────────┐
       │               │               │              │
       ▼               ▼               ▼              ▼
┌─────────────┐ ┌─────────────┐ ┌──────────┐ ┌──────────┐
│  RTL/LTR    │ │ Table Layout│ │   Code   │ │  Drawing │
│  QA Agent   │ │   QA Agent  │ │   Block  │ │  /Image  │
│  (ALWAYS)   │ │ (if tables) │ │(if code) │ │(if figs) │
└─────────────┘ └─────────────┘ └──────────┘ └──────────┘
       │               │               │              │
       └───────────────┴───────────────┴──────────────┘
                       │
                       ▼
          ┌─────────────────────────┐
          │  Aggregated QA Report   │
          │  with Unified Verdict   │
          └─────────────────────────┘
```

### Agent Selection Logic

```python
def select_agents(document):
    agents = []

    # RTL/LTR - ALWAYS RUN
    agents.append('RTL/LTR QA Agent')

    # Content-based selection
    if has_tables(document):
        agents.append('Table Layout QA Agent')

    if has_code_blocks(document):
        agents.append('Code Block QA Agent')

    if has_figures(document):
        agents.append('Drawing/Image QA Agent')

    return agents
```

---

## QA Report Format

### Executive Summary
```
COMPREHENSIVE QA REPORT
========================
Document: expert_example.pdf
Overall Verdict: ✅ PASS / ❌ FAIL / ⚠️ WARNING

Agents Executed: 4
Critical Issues: 2
Warnings: 3
```

### Individual Agent Results
```
1. RTL/LTR QA Agent: ❌ FAIL
   - Critical: Section numbering starts at 0.1
   - Warning: Minor spacing issue

2. Table Layout QA Agent: ✅ PASS
   - All 3 tables properly formatted

3. Code Block QA Agent: ❌ FAIL
   - Critical: Background overflow detected

4. Drawing/Image QA Agent: ✅ PASS
   - All 3 figures render correctly
```

### Consolidated Fixes
```
IMMEDIATE ACTIONS REQUIRED:
1. Fix section numbering (CLS file line 358)
2. Fix code block background overflow (CLS file line 712)
```

---

## Common Issues and Fixes

### RTL/LTR Issues

**Issue:** Section numbering starts at 0.1
```latex
# FIX in hebrew-academic-template.cls line ~358:
\renewcommand{\thehebrewsection}{%
  \ifnum\value{hebrewchapter}=0
    \arabic{hebrewsection}%
  \else
    \thehebrewchapter.\arabic{hebrewsection}%
  \fi
}
```

**Issue:** Reversed English text in titles
```latex
# FIX in .tex file:
# WRONG:
\hebrewsection{Introduction :אובמ}

# CORRECT:
\hebrewsection{מבוא: \entoc{Introduction}}
```

**Issue:** Numbers appear reversed (5.0 instead of 0.5)
```latex
# FIX in .tex file:
# WRONG:
\hebrewversion{גרסה 0.5}

# CORRECT:
\hebrewversion{גרסה \textenglish{0.5}}
```

---

### Table Layout Issues

**Issue:** LTR column order in RTL table
```latex
# FIX: Reverse column order in LaTeX source
# WRONG (produces LTR visual):
\hline
Name & Value & Unit \\
\hline

# CORRECT (produces RTL visual):
\hline
Unit & Value & Name \\
\hline
```

---

### Code Block Issues

**Issue:** Background overflow beyond margins
```latex
# FIX in hebrew-academic-template.cls:
\newtcblisting{pythonbox}[1][]{
  before={\begin{python}\begingroup\selectlanguage{english}\textdir TLT\pardir TLT},
  after={\endgroup\end{python}},
  % ... other settings
}
```

---

### Image Issues

**Issue:** Missing images (empty boxes)
```bash
# FIX: Create missing image files
mkdir -p examples/images/
# Create example-figure1.png, example-figure2.png, etc.
```

```latex
# Or fix paths in .tex file:
# WRONG:
\includegraphics{example-figure1.png}

# CORRECT:
\includegraphics{images/example-figure1.png}
```

---

## Best Practices

### 1. Always Run Comprehensive QA First
Use the orchestrator to get complete picture:
```
"Run comprehensive QA on [document.pdf]"
```

### 2. Fix Critical Issues First
Address issues by priority:
- **CRITICAL:** Must fix before release
- **WARNING:** Should fix when possible
- **INFO:** Nice to have improvements

### 3. Re-run QA After Fixes
Verify fixes worked:
```
"Re-run QA on [document.pdf] to verify fixes"
```

### 4. Use Parallel Execution
Let orchestrator run agents simultaneously for speed

### 5. Keep QA Reports
Track quality improvements over time

---

## Integration with Development Workflow

### During Development
```bash
# After compiling LaTeX:
lualatex document.tex
biber document
lualatex document.tex

# Run comprehensive QA:
"Run QA on document.pdf"

# Fix issues found
# Re-compile and re-run QA
```

### Before Commit/Release
```bash
# Final QA check:
"Run comprehensive QA on all example PDFs"

# Must achieve PASS on all documents before release
```

### Continuous Quality
```bash
# Regular QA runs:
- After major changes
- Before version releases
- When adding new features
- After template modifications
```

---

## QA Metrics

Track quality over time:

```
Document: expert_example.pdf
Version: v5.3

QA History:
- 2025-11-10 14:30: FAIL (5 critical issues)
- 2025-11-10 15:45: FAIL (2 critical issues remaining)
- 2025-11-10 16:20: PASS (all issues resolved)
```

---

## Version History

- **v1.0** (2025-11-10): Initial QA agents collection
  - RTL/LTR QA Agent
  - Table Layout QA Agent
  - Code Block QA Agent
  - Drawing/Image QA Agent
  - Claude CLI Structure Agent
  - QA Infrastructure Agent
  - **QA Orchestrator Agent** (NEW - master coordinator)

---

## Support and Documentation

For detailed information about each agent:
- Read individual agent skill files
- Check agent specifications for capabilities
- Review example usage in agent documentation

For template documentation:
- See `docs/README.md` for template usage
- See `docs/USAGE_GUIDE.md` for command reference
- See `examples/` for working examples

---

**Master QA Orchestrator:** Use `qa-orchestrator-agent.md` to coordinate all QA activities efficiently!
