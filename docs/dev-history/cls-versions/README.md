# Recovered historical CLS versions

Copies of `hebrew-academic-template.cls` that predate this repository's git history
(the earliest committed blob is v5.4). Recovered by scanning `C:\25D` on 2026-07-30.
They are archived for provenance and for capability audits — **do not compile against
them**; the class in the repository root is the only supported version.

| File | Version | Recovered from |
|---|---|---|
| `hebrew-academic-template-v1.0-foundation.cls` | 1.0 | `C:\25D\EX\L17\Latex\PCA-BOOK\chapters\chapter_04\hebrew-academic-template-fixed.cls` |
| `hebrew-academic-template-v5.0-agent_g-variant.cls` | 5.0 | `C:\25D\Richman\Studies-25-26-A\L09\GenAI-Security-Cheat-Sheet-2025-2026\test-cls-examples\agent_outputs\agent_g\hebrew-academic-template_fixed.cls` |

## Why these two

**v1.0 (Foundation Release).** The earliest surviving copy of the class. It has
`\hebrewsection`, `\hebcell` and `\printhebrewbibliography` but no `\hebrewchapter`
and no `\clsversion`, which matches the changelog's account of chapters arriving in
v3.0. This is the version the documentation credits with 60 commands.

**v5.0 agent_g variant.** A distinct variant of the agent_g merge-era file. The copy
already archived under `docs/dev-history/agent_outputs/agent_g/` is byte-identical to
one found under `skill-python-base/test-data/`, but the copy recovered from `Richman/`
differs, so it is preserved separately.

## Audit result against v7.4.2 (2026-07-30)

Both files are **fully contained** in v7.4.2 — no public capability was lost.

The only symbols defined in v1.0 and absent from v7.4.2 are four `@`-private helpers,
`\rtl@rev@ii` … `\rtl@rev@v`, which implemented table-column reversal by argument
pattern matching. The **public** capability they served, `\rtlrow`, is still provided
by v7.4.2 (which carries the comment *"OPTIONAL: \rtlrow{} helper command from v1.0"*),
reimplemented without those private macros. A changed private implementation behind an
unchanged public command is not a regression.

## Still missing

**v3.0.0** (documented as the Book-Latech V2/V3 release, 72 commands) could not be
found anywhere under `C:\25D`. It survives only as changelog and feature-matrix prose.
If a copy turns up, add it here and re-run the audit.

## Not archived here

`gtai-template.cls` (v1.0.0, four copies under `C:\25D\GTAI\` and
`C:\25D\BIU\Department\Workshop\output\`) shares this class's Hebrew/BiDi core but is a
**separate class** for GTAI business documents — proposals, invoices, specifications,
whitepapers — with its own `\gtai*` recipient/project metadata. It is a sibling fork,
not an ancestor of this class, so it is not part of this lineage.
