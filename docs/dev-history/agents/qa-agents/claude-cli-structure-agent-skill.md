---
name: Claude CLI Project Structure Manager
version: 1.0.0
description: Creates and manages the .claude folder structure for Claude CLI projects with proper organization of agents, skills, commands, planning, and configuration files
author: AI Agent
tags: [claude-cli, project-structure, agents, skills, commands, configuration]
---

# Claude CLI Project Structure Manager

## Overview

This skill enables the AI agent to create and manage the `.claude` folder structure at the project level for Claude CLI projects. The structure supports modular, extensible workflows with agents, skills, commands, project planning, documentation, and configuration.

## Core Capabilities

1. **Initialize complete `.claude` folder structure**
2. **Create individual components** (agents, skills, commands, tasks)
3. **Generate appropriate file templates** based on context
4. **Maintain project documentation** (CLAUDE.md, prd.md)
5. **Manage configuration files** (settings.json)

---

## Standard `.claude` Folder Structure
````
.claude/
├── agents/                 # Agent definitions
│   └── {agent-name}/
│       ├── AGENT.md       # Agent instructions and policies
│       └── [support files]
├── commands/              # Reusable command templates
│   └── {command-name}.md
├── skills/                # Skill definitions
│   └── {skill-name}/
│       ├── SKILL.md      # Skill metadata and instructions
│       └── [scripts/utilities]
├── tasks/                 # Project planning and task management
│   └── planning.md
├── prd.md                # Product Requirements Document
├── CLAUDE.md             # Central project context file
└── settings.json         # Project configuration
````

---

## File Type Specifications

### 1. AGENT.md Template
````markdown
---
name: {Agent Name}
version: 1.0.0
description: {Agent purpose and capabilities}
role: {Agent role/specialty}
---

# {Agent Name}

## Purpose
{Detailed description of what this agent does}

## Capabilities
- {Capability 1}
- {Capability 2}
- {Capability 3}

## Instructions
{Detailed operational guidelines for the agent}

## Policies
{Rules and constraints the agent must follow}

## Required Skills
- {skill-name-1}
- {skill-name-2}

## Context Requirements
{Information the agent needs to function properly}

## Example Usage
{Examples of how to invoke or use this agent}
````

### 2. SKILL.md Template
````markdown
---
name: {Skill Name}
version: 1.0.0
description: {Skill purpose and functionality}
author: {Author}
tags: [{tag1}, {tag2}, {tag3}]
---

# {Skill Name}

## Overview
{Detailed description of the skill}

## Requirements
- {Requirement 1}
- {Requirement 2}

## Usage
{Instructions on how to use this skill}

## Implementation
{Technical details, code examples, or procedures}

## Examples
{Practical examples of the skill in action}

## Supporting Files
{List of any Python scripts, utilities, or templates included}
````

### 3. Command Template ({command-name}.md)
````markdown
# {Command Name}

## Description
{What this command does}

## Usage
{How to invoke the command}

## Parameters
- `{param1}`: {description}
- `{param2}`: {description}

## Example
```bash
{example command}
```

## Implementation
{Command logic, shell script, or automation steps}
````

### 4. CLAUDE.md Template
````markdown
# {Project Name} - Claude Context

## Project Overview
{Brief description of the project}

## Development Environment
- **Languages**: Python, Bash, LaTeX
- **Platforms**: Windows 11 (PowerShell), Linux (WSL)
- **IDEs**: VS Code, Google Colab
- **Focus Areas**: ML/DL, LLM Development, MCP-based AI Agents

## Project Structure
{Description of project organization}

## Commands
{Available commands and their usage}

## Workflows
{Standard workflows and procedures}

## Code Standards
{Coding conventions and style guidelines}

## Testing Instructions
{How to run tests and validation}

## Branch Naming
{Git branch naming conventions}

## Setup Instructions
{How to set up the development environment}

## Dependencies
{Required libraries, tools, and services}

## Expectations
{Development guidelines and best practices}
````

### 5. settings.json Template
````json
{
  "project": {
    "name": "{project-name}",
    "version": "1.0.0",
    "description": "{project-description}"
  },
  "environment": {
    "python_version": "3.11",
    "cuda_enabled": true,
    "wsl_enabled": true
  },
  "paths": {
    "data": "./data",
    "models": "./models",
    "outputs": "./outputs"
  },
  "ml_config": {
    "framework": "pytorch",
    "device": "cuda",
    "seed": 42
  },
  "features": {
    "auto_test": true,
    "auto_format": true,
    "pre_commit_hooks": true
  }
}
````

### 6. prd.md Template
````markdown
# Product Requirements Document

## Project Name
{Project Name}

## Overview
{High-level project description}

## Goals
1. {Goal 1}
2. {Goal 2}
3. {Goal 3}

## Requirements

### Functional Requirements
- {Requirement 1}
- {Requirement 2}

### Technical Requirements
- {Requirement 1}
- {Requirement 2}

### ML/AI Specific Requirements
- {Model architecture requirements}
- {Training data requirements}
- {Performance metrics}

## Dependencies
- {Dependency 1}
- {Dependency 2}

## Milestones
- [ ] {Milestone 1} - {Date}
- [ ] {Milestone 2} - {Date}

## Success Criteria
{How to measure project success}
````

---

## Usage Instructions for Agent

### Initialize Complete Structure

When the user requests to initialize a Claude CLI project structure:
````bash
# Create the complete .claude folder structure
mkdir -p .claude/{agents,commands,skills,tasks}
touch .claude/{CLAUDE.md,prd.md,settings.json}
````

### Create Specific Components

#### Create a New Agent

When user requests: "Create an agent for {purpose}"

1. Create agent folder: `.claude/agents/{agent-name}/`
2. Generate `AGENT.md` with appropriate template
3. Customize based on the specific purpose
4. Add references to required skills

#### Create a New Skill

When user requests: "Create a skill for {functionality}"

1. Create skill folder: `.claude/skills/{skill-name}/`
2. Generate `SKILL.md` with template
3. Add supporting scripts if needed (Python, Bash)
4. Document usage and examples

#### Create a New Command

When user requests: "Create a command for {task}"

1. Create command file: `.claude/commands/{command-name}.md`
2. Document command usage and parameters
3. Include implementation (prompt or shell script)

### Update Configuration

When user requests configuration changes:

1. Modify `.claude/settings.json`
2. Update environment variables
3. Adjust feature toggles

---

## Context-Aware File Creation

### For ML/DL Projects

**Agent Examples:**
- `model-trainer/` - Agent for training ML models
- `data-processor/` - Agent for data preprocessing
- `model-evaluator/` - Agent for model evaluation

**Skill Examples:**
- `dataset-loader/` - Loading and preprocessing datasets
- `model-optimization/` - Hyperparameter tuning
- `inference-pipeline/` - Model deployment and inference

**Command Examples:**
- `train-model.md` - Train ML model command
- `evaluate-model.md` - Model evaluation command
- `export-model.md` - Model export command

### For MCP-Based AI Agents

**Agent Examples:**
- `mcp-server/` - MCP server agent
- `mcp-client/` - MCP client agent
- `protocol-validator/` - Protocol validation agent

**Skill Examples:**
- `mcp-communication/` - MCP protocol handling
- `tool-integration/` - External tool integration
- `context-management/` - Context window management

---

## Best Practices

1. **Keep files modular** - Each agent, skill, and command should have a single, clear purpose
2. **Use descriptive names** - Names should clearly indicate functionality
3. **Document thoroughly** - All files should have clear documentation
4. **Version control** - Track versions in frontmatter
5. **Maintain consistency** - Follow templates and naming conventions
6. **Update CLAUDE.md** - Keep central context file current
7. **Reference properly** - Agents should reference required skills explicitly

---

## Example Request Handling

### User Request: "Initialize a Claude CLI project for an LLM fine-tuning system"

**Agent Response:**

1. Create complete `.claude` structure
2. Generate `CLAUDE.md` with ML/LLM context
3. Create relevant agents:
   - `fine-tuning-agent/AGENT.md`
   - `data-preparation-agent/AGENT.md`
   - `evaluation-agent/AGENT.md`
4. Create relevant skills:
   - `dataset-processing/SKILL.md` + supporting scripts
   - `model-training/SKILL.md`
   - `performance-metrics/SKILL.md`
5. Create commands:
   - `prepare-data.md`
   - `start-training.md`
   - `evaluate-model.md`
6. Generate `prd.md` with LLM fine-tuning requirements
7. Configure `settings.json` with GPU/CUDA settings

### User Request: "Add a code review agent"

**Agent Response:**

1. Create `.claude/agents/code-review/`
2. Generate `AGENT.md` with:
   - Purpose: Automated code review and quality checks
   - Capabilities: Style checking, bug detection, documentation review
   - Instructions: How to review different code types
   - Policies: Quality standards and conventions
3. Reference required skills (if any)
4. Update `CLAUDE.md` to document the new agent

---

## Supporting Script Examples

### Python Utility for Skill (extract_text.py)
````python
"""
Text extraction utility for document processing skill
"""
import sys
from pathlib import Path

def extract_text(file_path):
    """Extract text from various file formats"""
    path = Path(file_path)
    
    if path.suffix == '.txt':
        return path.read_text()
    elif path.suffix == '.pdf':
        # PDF extraction logic
        pass
    elif path.suffix == '.docx':
        # DOCX extraction logic
        pass
    
    return None

if __name__ == "__main__":
    if len(sys.argv) > 1:
        text = extract_text(sys.argv[1])
        print(text)
````

---

## Integration with Development Workflow

### VS Code Integration

Add to `.vscode/tasks.json`:
````json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Claude CLI: Initialize Project",
      "type": "shell",
      "command": "mkdir -p .claude/{agents,commands,skills,tasks}"
    }
  ]
}
````

### WSL/PowerShell Compatibility

Ensure cross-platform compatibility:
- Use forward slashes in paths
- Test commands in both WSL and PowerShell
- Document platform-specific requirements

---

## Validation Checklist

Before completing structure creation:

- [ ] All required folders exist
- [ ] Core files (CLAUDE.md, prd.md, settings.json) are created
- [ ] Templates are properly populated
- [ ] File naming conventions are followed
- [ ] Cross-references are valid
- [ ] Documentation is complete
- [ ] Supporting scripts have proper permissions

---

## Quick Reference

### Create Full Structure
````bash
mkdir -p .claude/{agents,commands,skills,tasks}
````

### Create Agent
````bash
mkdir -p .claude/agents/{agent-name}
touch .claude/agents/{agent-name}/AGENT.md
````

### Create Skill
````bash
mkdir -p .claude/skills/{skill-name}
touch .claude/skills/{skill-name}/SKILL.md
````

### Create Command
````bash
touch .claude/commands/{command-name}.md
````

---

## Conclusion

This skill enables systematic creation and management of Claude CLI project structures. Use it to initialize new projects, add components incrementally, or maintain existing structures. Always customize templates based on specific project requirements and maintain consistency across the project.