#!/usr/bin/env python3
"""
CLS Info Tool - Hebrew Academic Template Information System
A terminal menu for exploring the CLS template documentation.
Uses a configuration file for cached data with auto-update on version change.
"""
import json
import os
import re
import sys
from pathlib import Path

# Fix Windows console encoding
if sys.platform == 'win32':
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

# Configuration
CLS_FILE = "hebrew-academic-template.cls"
DOCS_DIR = "docs"
EXAMPLES_DIR = "examples"
CONFIG_FILE = "cls_info_config.json"
BASE_DIR = Path(__file__).parent


def sanitize_text(text):
    """Remove or replace problematic Unicode characters."""
    replacements = {
        '\u274c': '[X]', '\u2714': '[v]', '\u2713': '[v]',
        '\u2192': '->', '\u2190': '<-', '\u2026': '...',
        '\u2018': "'", '\u2019': "'", '\u201c': '"', '\u201d': '"',
    }
    for old, new in replacements.items():
        text = text.replace(old, new)
    return text


def get_current_version():
    """Extract current version from CLS file."""
    cls_path = BASE_DIR / CLS_FILE
    if not cls_path.exists():
        return "0.0.0"
    with open(cls_path, 'r', encoding='utf-8') as f:
        for line in f:
            if match := re.search(r'Version\s+(\d+\.\d+\.\d+)', line):
                return match.group(1)
    return "0.0.0"


def get_version_date():
    """Extract version date from CLS file."""
    cls_path = BASE_DIR / CLS_FILE
    if not cls_path.exists():
        return ""
    with open(cls_path, 'r', encoding='utf-8') as f:
        for line in f:
            if match := re.search(r'Date:\s*(\d{4}-\d{2}-\d{2})', line):
                return match.group(1)
    return ""


def parse_changelog():
    """Parse CHANGELOG.md into version dictionary."""
    changelog_path = BASE_DIR / DOCS_DIR / "CHANGELOG.md"
    versions = {}
    if not changelog_path.exists():
        return versions
    with open(changelog_path, 'r', encoding='utf-8') as f:
        content = f.read()
    pattern = r'##\s*\[(\d+\.\d+\.?\d*)\]\s*-\s*([^\n]+)'
    matches = list(re.finditer(pattern, content))
    for i, match in enumerate(matches):
        version = match.group(1)
        date_desc = match.group(2)
        start = match.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(content)
        info = content[start:end].strip()
        versions[version] = {"date": date_desc, "info": info[:2000]}
    return versions


def parse_commands_with_descriptions():
    """Extract commands with their descriptions from FEATURES.md."""
    features_path = BASE_DIR / DOCS_DIR / "FEATURES.md"
    commands = []

    if not features_path.exists():
        return commands

    with open(features_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Parse tables: | `command` | description |
    pattern = r'\|\s*`([^`]+)`\s*\|\s*([^|]+)\|'
    for match in re.finditer(pattern, content):
        cmd = match.group(1).strip()
        desc = match.group(2).strip()
        # Filter actual commands
        if cmd.startswith('\\') or 'box' in cmd.lower() or 'tabular' in cmd.lower():
            if not desc.startswith('**') and len(desc) > 2:
                commands.append({"command": cmd, "description": desc[:80]})

    # Add environments from environment table
    env_pattern = r'\|\s*`([^`]+)`\s*\|\s*([^|]+)\|\s*([^|]+)\|'
    for match in re.finditer(env_pattern, content):
        env = match.group(1).strip()
        purpose = match.group(2).strip()
        if 'box' in env or 'table' in env or 'figure' in env or env in ['hebrew', 'english', 'python']:
            commands.append({"command": env, "description": purpose[:80], "type": "environment"})

    # Remove duplicates by command name
    seen = set()
    unique = []
    for c in commands:
        if c["command"] not in seen:
            seen.add(c["command"])
            unique.append(c)

    return sorted(unique, key=lambda x: x["command"].lstrip('\\').lower())


def parse_examples():
    """Parse example files and extract descriptions."""
    examples_dir = BASE_DIR / EXAMPLES_DIR
    examples = []

    # Define example metadata
    example_info = {
        "beginner_example.tex": {
            "level": "Beginner",
            "topics": ["Basic document structure", "Title page setup",
                      "Simple sections", "Text direction basics"]
        },
        "intermediate_example.tex": {
            "level": "Intermediate",
            "topics": ["Lists and enumerations", "Basic tables",
                      "Figures and captions", "Citations basics"]
        },
        "advanced_example.tex": {
            "level": "Advanced",
            "topics": ["Complex tables with RTL", "Code blocks (pythonbox)",
                      "Mathematical formulas", "Cross-references"]
        },
        "expert_example.tex": {
            "level": "Expert",
            "topics": ["Full book structure", "All CLS features",
                      "Advanced BiDi handling", "Complete bibliography"]
        },
        "table_example.tex": {
            "level": "Tables",
            "topics": ["All table themes", "RTL column ordering",
                      "Mixed content cells", "Table formatting"]
        },
        "bibliography_example.tex": {
            "level": "References",
            "topics": ["IEEE citations", "Hebrew/English separation",
                      "Biber configuration", "Citation styles"]
        },
        "footnote_example.tex": {
            "level": "Footnotes",
            "topics": ["Hebrew footnotes", "Mixed language notes",
                      "Footnote positioning", "RTL footnote handling"]
        },
        "image_example.tex": {
            "level": "Images",
            "topics": ["Figure placement", "Hebrew captions",
                      "Image sizing", "Float handling in RTL"]
        },
        "book_example.tex": {
            "level": "Book",
            "topics": ["Multi-chapter books", "Front/main/back matter",
                      "TOC/LOF/LOT", "Appendices"]
        },
        "toc_article_pagenum_example.tex": {
            "level": "TOC",
            "topics": ["Article-mode TOC", "Two-digit page numbers (BiDi)",
                      "v7.3.2 regression test", "RTL TOC page-number direction"]
        },
    }

    if examples_dir.exists():
        for tex_file in examples_dir.glob("*.tex"):
            name = tex_file.name
            if name in example_info:
                info = example_info[name]
                examples.append({
                    "file": name,
                    "level": info["level"],
                    "topics": info["topics"]
                })
            elif not name.startswith("test_") and not name.startswith("table_minimal"):
                examples.append({
                    "file": name,
                    "level": "Other",
                    "topics": ["See file for details"]
                })

    return sorted(examples, key=lambda x: x["level"])


def parse_help_topics():
    """Parse markdown files into hierarchical topics."""
    all_topics = []
    docs_path = BASE_DIR / DOCS_DIR

    if not docs_path.exists():
        return all_topics

    for md_file in docs_path.glob("*.md"):
        with open(md_file, 'r', encoding='utf-8') as f:
            content = f.read()

        current_path = []
        lines = content.split('\n')

        for i, line in enumerate(lines):
            if line.startswith('#'):
                level = len(line) - len(line.lstrip('#'))
                title = line.lstrip('#').strip()

                while len(current_path) >= level:
                    current_path.pop()
                current_path.append(title)

                content_lines = []
                for j in range(i + 1, min(i + 15, len(lines))):
                    if lines[j].startswith('#'):
                        break
                    if lines[j].strip():
                        content_lines.append(lines[j])

                all_topics.append({
                    "level": level,
                    "title": sanitize_text(title),
                    "path": " > ".join(current_path),
                    "content": sanitize_text('\n'.join(content_lines[:8])),
                    "file": md_file.name
                })

    return all_topics


def build_config():
    """Build complete configuration from all sources."""
    print("  Reading CLS file...")
    version = get_current_version()
    version_date = get_version_date()

    print("  Parsing changelog...")
    versions = parse_changelog()

    print("  Extracting commands...")
    commands = parse_commands_with_descriptions()

    print("  Scanning examples...")
    examples = parse_examples()

    print("  Building help topics...")
    topics = parse_help_topics()

    config = {
        "cls_version": version,
        "version_date": version_date,
        "versions": versions,
        "commands": commands,
        "examples": examples,
        "help_topics": topics,
    }

    return config


def save_config(config):
    """Save configuration to JSON file."""
    config_path = BASE_DIR / CONFIG_FILE
    with open(config_path, 'w', encoding='utf-8') as f:
        json.dump(config, f, indent=2, ensure_ascii=False)
    print(f"  Configuration saved to {CONFIG_FILE}")


def load_config():
    """Load configuration from JSON file."""
    config_path = BASE_DIR / CONFIG_FILE
    if not config_path.exists():
        return None
    with open(config_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def check_and_update_config():
    """Check if config needs update and update if necessary."""
    current_version = get_current_version()
    config = load_config()

    if config is None:
        print("\n[*] No configuration found. Building...")
        config = build_config()
        save_config(config)
        return config

    config_version = config.get("cls_version", "0.0.0")

    if config_version != current_version:
        print(f"\n[*] Version changed: {config_version} -> {current_version}")
        print("    Updating configuration...")
        config = build_config()
        save_config(config)
        return config

    return config


def update_config_manual():
    """Manually update configuration."""
    print("\n" + "="*50)
    print("  Updating Configuration")
    print("="*50)
    config = build_config()
    save_config(config)
    print("\n  Update complete!")
    return config


# Global config
CONFIG = None


def print_current_version():
    """Print current version info."""
    print(f"\n{'='*50}")
    print(f"  Current Version: {CONFIG['cls_version']}")
    if CONFIG.get('version_date'):
        print(f"  Release Date: {CONFIG['version_date']}")
    print('='*50)


def print_version_info(version=None):
    """Print info for a specific version."""
    if version is None:
        version = CONFIG['cls_version']

    versions = CONFIG.get('versions', {})

    if version in versions:
        v = versions[version]
        print(f"\nVersion {version} - {v['date']}\n")
        print(sanitize_text(v['info']))
    else:
        print(f"\nVersion {version} not found in changelog.")
        print("Available versions:", ", ".join(sorted(versions.keys(), reverse=True)[:10]))


def print_commands():
    """Print all commands with descriptions."""
    commands = CONFIG.get('commands', [])

    print(f"\n{'='*60}")
    print(f"  Available CLS Commands ({len(commands)} total)")
    print('='*60)

    # Group by type
    text_cmds = [c for c in commands if c['command'].startswith('\\')]
    env_cmds = [c for c in commands if not c['command'].startswith('\\')]

    print("\n  TEXT/DIRECTION COMMANDS:")
    print("  " + "-"*56)
    for i, cmd in enumerate(text_cmds, 1):
        name = cmd['command'].ljust(25)
        desc = cmd['description'][:35]
        print(f"  {i:2}. {name} {desc}")

    print("\n  ENVIRONMENTS:")
    print("  " + "-"*56)
    for i, cmd in enumerate(env_cmds, 1):
        name = cmd['command'].ljust(25)
        desc = cmd['description'][:35]
        print(f"  {i:2}. {name} {desc}")


def search_documents(query):
    """Search help topics for a query."""
    topics = CONFIG.get('help_topics', [])
    results = []

    for t in topics:
        if query.lower() in t['title'].lower() or query.lower() in t['content'].lower():
            results.append(t)

    print(f"\n{'='*50}")
    print(f"  Search Results for: '{query}'")
    print(f"  Found {len(results)} matches")
    print('='*50)

    for i, r in enumerate(results[:15], 1):
        print(f"\n--- [{i}] {r['file']} ---")
        print(f"  Topic: {r['path']}")
        if r['content']:
            print(f"  {r['content'][:200]}")


def print_examples():
    """Print available examples."""
    examples = CONFIG.get('examples', [])

    print(f"\n{'='*60}")
    print(f"  Available Examples ({len(examples)} files)")
    print('='*60)

    for ex in examples:
        print(f"\n  [{ex['level']}] {ex['file']}")
        print("  " + "-"*50)
        for topic in ex['topics']:
            print(f"    - {topic}")


def display_help_tree():
    """Display hierarchical help topics."""
    topics = CONFIG.get('help_topics', [])

    if not topics:
        print("No documentation found.")
        return

    by_file = {}
    for t in topics:
        f = t["file"]
        if f not in by_file:
            by_file[f] = []
        by_file[f].append(t)

    for filename, file_topics in sorted(by_file.items()):
        print(f"\n{'='*60}")
        print(f"  {filename}")
        print('='*60)
        for t in file_topics:
            indent = "  " * t["level"]
            print(f"{indent}{t['title']}")


def display_topic_detail(topic_query):
    """Display detailed content for a topic."""
    topics = CONFIG.get('help_topics', [])

    for t in topics:
        if topic_query.lower() in t["path"].lower():
            print(f"\n{'='*60}")
            print(f"  {t['path']}")
            print(f"  File: {t['file']}")
            print('='*60)
            print(t["content"])
            print()
            return

    print(f"Topic '{topic_query}' not found.")


def print_menu():
    """Print the main menu."""
    print("\n" + "="*50)
    print("  Hebrew Academic Template - CLS Info Tool")
    print(f"  Version: {CONFIG.get('cls_version', 'N/A')}")
    print("="*50)
    print("  1. Print current version")
    print("  2. Print version info (by version number)")
    print("  3. Print list of CLS functions")
    print("  4. Search documentation")
    print("  5. Show available examples")
    print("  6. Update configuration (reread docs)")
    print("  7. Print help (documentation topics)")
    print("  0. Exit")
    print("="*50)


def main():
    """Main menu loop."""
    global CONFIG

    # Initialize and check config
    CONFIG = check_and_update_config()

    while True:
        print_menu()
        choice = input("\nEnter choice [0-7]: ").strip()

        if choice == '0':
            print("\nGoodbye!")
            break

        elif choice == '1':
            print_current_version()

        elif choice == '2':
            ver = input("Enter version (Enter for current): ").strip()
            print_version_info(ver if ver else None)

        elif choice == '3':
            print_commands()

        elif choice == '4':
            query = input("Enter search query: ").strip()
            if query:
                search_documents(query)
            else:
                print("No query entered.")

        elif choice == '5':
            print_examples()

        elif choice == '6':
            CONFIG = update_config_manual()

        elif choice == '7':
            print("\n" + "="*50)
            print("  Help Topics")
            print("="*50)
            print("  1. Show topic tree")
            print("  2. Show topic details")
            print("  0. Back to main menu")

            sub = input("\nEnter choice [0-2]: ").strip()
            if sub == '1':
                display_help_tree()
            elif sub == '2':
                topic = input("Enter topic name: ").strip()
                if topic:
                    display_topic_detail(topic)

        else:
            print("Invalid choice. Please try again.")

        input("\nPress Enter to continue...")


if __name__ == "__main__":
    main()
