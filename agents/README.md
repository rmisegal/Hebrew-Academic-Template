# Agent Skills for Hebrew Academic Template

This directory contains specialized agent skill definitions used in the development and maintenance of the Hebrew Academic Template CLS v5.3.

## Overview

These agent skills are designed to assist with various aspects of academic document creation, from content drafting to technical implementation. Each skill provides specialized capabilities tailored to the unique requirements of bilingual (Hebrew-English) academic writing.

## Directory Structure

```
agents/
├── book-creator-agents/    # Agents for academic book/document creation
│   ├── academic-source-citation-agent-skill.md
│   ├── chief-architect-reviewer-skill.md
│   ├── code-implementation-agent-skill.md
│   ├── content-drafting-agent-skill.md
│   ├── hebrew-language-editor-skill.md
│   ├── lead-technologist-math-reviewer-skill.md
│   └── source-research-agent-skill.md
├── qa-agents/              # Quality Assurance agents for testing and validation
│   ├── claude-cli-structure-agent-skill.md
│   ├── code-block-qa-agent-skill.md
│   ├── drawing-agent-skill.md
│   ├── qa-infrastructure-agent.md
│   ├── rtl-ltr-qa-agent-skill.md
│   └── table-layout-qa-agent-skill.md
└── README.md               # This file
```

## Book Creator Agents

Located in `book-creator-agents/`, these agents assist with academic content creation:

### 1. Academic Source Citation Agent
**File:** `book-creator-agents/academic-source-citation-agent-skill.md`

Specializes in:
- Proper citation formatting for Hebrew and English sources
- BibTeX/BibLaTeX reference management
- Academic referencing standards
- Bibliography organization

### 2. Chief Architect Reviewer
**File:** `book-creator-agents/chief-architect-reviewer-skill.md`

Responsible for:
- Overall document structure review
- Template architecture decisions
- Code quality assurance
- Design pattern validation
- Integration oversight

### 3. Code Implementation Agent
**File:** `book-creator-agents/code-implementation-agent-skill.md`

Handles:
- LaTeX code implementation
- Custom command development
- Package integration
- Technical problem solving

### 4. Content Drafting Agent
**File:** `book-creator-agents/content-drafting-agent-skill.md`

Assists with:
- Academic content writing
- Document structure planning
- Section organization
- Content flow optimization
- Bilingual content coordination

### 5. Hebrew Language Editor
**File:** `book-creator-agents/hebrew-language-editor-skill.md`

Provides:
- Hebrew language editing and proofreading
- RTL text direction handling
- Hebrew typography standards
- Language-specific formatting rules

### 6. Lead Technologist Math Reviewer
**File:** `book-creator-agents/lead-technologist-math-reviewer-skill.md`

Ensures:
- Mathematical notation accuracy
- Formula formatting in Hebrew context
- Technical correctness
- Math typesetting best practices

### 7. Source Research Agent
**File:** `book-creator-agents/source-research-agent-skill.md`

Supports:
- Academic source identification
- Research material organization
- Reference verification
- Literature review assistance

## Quality Assurance Agents

Located in `qa-agents/`, these agents ensure template quality and correctness:

### 1. Claude CLI Structure Agent
**File:** `qa-agents/claude-cli-structure-agent-skill.md`

Manages:
- Project structure organization
- File naming conventions
- Directory hierarchy
- Build system integration

### 2. Code Block QA Agent
**File:** `qa-agents/code-block-qa-agent-skill.md`

Validates:
- Code listing syntax and formatting
- Python/code block environments
- Syntax highlighting correctness
- Code presentation in RTL documents

### 3. Drawing Agent
**File:** `qa-agents/drawing-agent-skill.md`

Handles:
- TikZ diagrams and illustrations
- Figure creation and formatting
- Visual content integration
- Graphic positioning in RTL/LTR contexts

### 4. QA Infrastructure Agent
**File:** `qa-agents/qa-infrastructure-agent.md`

Provides:
- Automated testing framework
- Compilation verification
- Error detection and reporting
- Continuous quality monitoring

### 5. RTL-LTR QA Agent
**File:** `qa-agents/rtl-ltr-qa-agent-skill.md`

Ensures:
- Proper text direction in mixed content
- RTL/LTR boundary detection
- Bidirectional text validation
- Direction-related bug detection

### 6. Table Layout QA Agent
**File:** `qa-agents/table-layout-qa-agent-skill.md`

Verifies:
- Table structure and formatting
- Mixed Hebrew/English table content
- Cell alignment in RTL context
- Table caption directionality

## Template v5.3 Capabilities

The Hebrew Academic Template CLS v5.3, developed with support from these agent skills, now includes:

### Complete Feature Set
- **78 commands** for comprehensive document control
- **8 environments** for specialized content
- **24+ packages** integrated seamlessly
- **Full RTL/LTR support** with bidirectional text handling

### Key Features
- Bilingual Hebrew-English academic documents
- Advanced table formatting with RTL support
- Code listings with syntax highlighting
- Mathematical expressions with Hebrew labels
- Bibliography management for mixed-language sources
- Custom section/chapter commands
- Title page generation
- Figure and table environments
- Footnote handling

### Command Categories
1. **Text Direction** (15 commands) - `\en{}`, `\heb{}`, `\ilm{}`, `\LTR{}`, `\RTL{}`, etc.
2. **Sections** (6 commands) - `\hebrewsection{}`, `\hebrewchapter{}`, `\englishsection{}`, etc.
3. **Tables** (8 commands) - `\hebcell{}`, `\mixedcell{}`, `\rtlrow{}`, etc.
4. **Figures** (2 forms) - Command and environment forms
5. **Code** (7 commands) - `\pythonbox{}`, `\code{}`, `\enpath{}`, etc.
6. **Math** (8 commands) - `\hebmath{}`, `\hebsub{}`, `\argmin`, etc.
7. **Bibliography** (3 commands) - Hebrew and English bibliography printing
8. **Title Page** (5 commands) - Bilingual title, author, version info
9. **Lists** (1 command) - `\Hitem{}`
10. **Utilities** - Number formatting, symbols, version tracking

## Usage

These agent skills are designed to be used with AI assistants that support skill-based workflows. They provide structured guidance for:

1. Document planning and architecture
2. Content creation and editing
3. Technical implementation
4. Quality assurance and review

## Integration with v5.0

The agents work together to support the complete document lifecycle:

```
Content Drafting → Hebrew Editing → Technical Implementation → Review
        ↓                ↓                    ↓                  ↓
   Structure         Language           Commands            Quality
   Planning          Accuracy           Integration         Assurance
```

## Best Practices

When using these agent skills:

1. **Start with Content Drafting** - Plan your document structure
2. **Apply Hebrew Language Editor** - Ensure proper Hebrew usage
3. **Use Code Implementation** - Apply technical LaTeX features
4. **Consult Chief Architect** - Review overall document quality
5. **Verify with Source Research** - Ensure citation accuracy

## Related Documentation

For complete template documentation, see:
- `docs/README.md` - Introduction and quick start
- `docs/USAGE_GUIDE.md` - Complete command reference (all 78 commands)
- `docs/MIXED_CONTENT_GUIDE.md` - RTL/LTR best practices
- `docs/FEATURES.md` - Feature matrix and comparison
- `docs/CHANGELOG.md` - Version history
- `docs/MIGRATION_GUIDE.md` - Upgrade instructions

## Template Compilation

To use the Hebrew Academic Template v5.0:

```bash
# LuaLaTeX compilation (required for Hebrew fonts)
lualatex your-document.tex
biber your-document
lualatex your-document.tex
lualatex your-document.tex
```

See `examples/` directory for working examples at all skill levels.

## Credits

These agent skills were developed to support the Hebrew Academic Template project, building on the original work by Dr. Segal Yoram and enhanced through collaborative AI-assisted development.

## Version Information

- **Template Version:** v5.3 (November 10, 2025)
- **Commands Available:** 78
- **Environments Available:** 8
- **Packages Integrated:** 24+
- **Agent Organization:** 2 categories (Book Creator + QA Agents)

---

*For questions about these agent skills or the template, refer to the main documentation in the docs/ directory.*
