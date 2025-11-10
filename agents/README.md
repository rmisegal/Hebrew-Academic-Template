# Agent Skills for Hebrew Academic Template

This directory contains specialized agent skill definitions used in the development and maintenance of the Hebrew Academic Template CLS v5.0.

## Overview

These agent skills are designed to assist with various aspects of academic document creation, from content drafting to technical implementation. Each skill provides specialized capabilities tailored to the unique requirements of bilingual (Hebrew-English) academic writing.

## Available Agent Skills

### 1. Academic Source Citation Agent
**File:** `academic-source-citation-agent-skill.md`

Specializes in:
- Proper citation formatting for Hebrew and English sources
- BibTeX/BibLaTeX reference management
- Academic referencing standards
- Bibliography organization

### 2. Chief Architect Reviewer
**File:** `chief-architect-reviewer-skill.md`

Responsible for:
- Overall document structure review
- Template architecture decisions
- Code quality assurance
- Design pattern validation
- Integration oversight

### 3. Code Implementation Agent
**File:** `code-implementation-agent-skill.md`

Handles:
- LaTeX code implementation
- Custom command development
- Package integration
- Technical problem solving

### 4. Content Drafting Agent
**File:** `content-drafting-agent-skill.md`

Assists with:
- Academic content writing
- Document structure planning
- Section organization
- Content flow optimization
- Bilingual content coordination

### 5. Drawing Agent
**File:** `drawing-agent-skill.md`

Manages:
- TikZ diagrams and illustrations
- Figure creation and formatting
- Visual content integration
- Graphic positioning in RTL/LTR contexts

### 6. Hebrew Language Editor
**File:** `hebrew-language-editor-skill.md`

Provides:
- Hebrew language editing and proofreading
- RTL text direction handling
- Hebrew typography standards
- Language-specific formatting rules

### 7. Lead Technologist Math Reviewer
**File:** `lead-technologist-math-reviewer-skill.md`

Ensures:
- Mathematical notation accuracy
- Formula formatting in Hebrew context
- Technical correctness
- Math typesetting best practices

### 8. Source Research Agent
**File:** `source-research-agent-skill.md`

Supports:
- Academic source identification
- Research material organization
- Reference verification
- Literature review assistance

## Template v5.0 Capabilities

The Hebrew Academic Template CLS v5.0, developed with support from these agent skills, now includes:

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

- **Template Version:** v5.0 (November 9, 2025)
- **Commands Available:** 78
- **Environments Available:** 8
- **Packages Integrated:** 24+
- **Versions Merged:** v1.0, v3.0 (Oct 26 & 28), v5.0

---

*For questions about these agent skills or the template, refer to the main documentation in the docs/ directory.*
