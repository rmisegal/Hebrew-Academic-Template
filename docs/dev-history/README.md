# Development History (Archive)

This folder is an **archive of the build process** that produced the
`hebrew-academic-template.cls` class and the `cls_info.py` tool. None of it is
required to *use* the template — it is kept only for provenance.

It was moved here during a 2026-06-04 cleanup, after a knowledge-graph audit
(`graphify`) showed these process artifacts dominating the repository and
burying the actual product.

## Contents

| Path | What it is |
|------|------------|
| `agent_outputs/` | Raw output of the 8-agent (A–H) parallel merge/QA pipeline |
| `agents/` | Skill definitions used by the book-creator and QA agents |
| `qa-orchestration/` | QA orchestrator run artifacts |
| `compile_all_examples.sh`, `compile_remaining.sh` | Build scripts hardwired to `agent_outputs/agent_g/` log paths |
| `cls_files_analysis.xlsx` | Cross-version `.cls` feature analysis spreadsheet |
| `CLS_MERGE_PARALLEL_PLAN.md` | The parallel-agent merge plan |
| `WAVE1_COMPLETE_SUMMARY.md`, `SESSION_STATUS.md` | Working session logs |
| `PROJECT_COMPLETE.md`, `PROJECT_OVERVIEW.md`, `PROJECT_STATUS.md`, `PROJECT_SUMMARY.md` | Overlapping point-in-time status reports |
| `FINAL_SUMMARY.md`, `MANIFEST.md`, `MIGRATION-STATUS.md` | Historical summaries / manifests |

## Where the live docs are now

- Product overview & command reference → top-level [`README.md`](../../README.md)
- Feature list → [`../FEATURES.md`](../FEATURES.md)
- Usage guide → [`../USAGE_GUIDE.md`](../USAGE_GUIDE.md)
- Mixed-content guide → [`../MIXED_CONTENT_GUIDE.md`](../MIXED_CONTENT_GUIDE.md)
- Migration guide → [`../MIGRATION_GUIDE.md`](../MIGRATION_GUIDE.md)
- Version history → [`../CHANGELOG.md`](../CHANGELOG.md)
