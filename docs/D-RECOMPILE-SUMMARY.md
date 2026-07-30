# D:\25D LaTeX Recompile + QA -> CLS v7.3.6 - Final Report

**87 PASS / 17 FAIL** of 104 compilable CLS projects.
Skipped (not processed): 79 SKIP:not-cls, 7 SKIP:no-root, 28 SKIP:absent.

All 104 aligned to CLS **v7.3.6**. Originals backed up: `D:\25D\CLS-examples\backups\d-recompile-2026-07-13\`.

qa_engine fixer bugs fixed this run (guards added to `bidi_fixer.py`): `\\[length]` args, tabularray colspec / `\DefTblrTemplate` names, fancyhdr args.

## Remaining failures by TRUE root cause
- **6** - brace/math imbalance (mixed: some CLS moving-arg, some pre-existing)
- **6** - other / needs manual review
- **3** - residual fixer edge (project-specific wrap not yet guarded)
- **1** - project missing file/image (pre-existing)
- **1** - project tikz positioning (pre-existing)

## Full failure list
| # | Project | Error | Root cause |
|---|---------|-------|------------|
| 1 | `D:\25D\EX\LatxHenEng\Hebrew-Academic-Template` | ! Extra }, or forgotten \endgroup. | brace/math imbalance (mixed: some CLS moving-arg, some pre-existing) |
| 2 | `D:\25D\EX\L20\Latech` | ! Extra }, or forgotten \endgroup. | brace/math imbalance (mixed: some CLS moving-arg, some pre-existing) |
| 3 | `D:\25D\EX\L8\Latech` | ! Extra }, or forgotten $. | brace/math imbalance (mixed: some CLS moving-arg, some pre-existing) |
| 4 | `D:\25D\EX\L8\Latech` | ! Extra }, or forgotten $. | brace/math imbalance (mixed: some CLS moving-arg, some pre-existing) |
| 5 | `D:\25D\EX\L18\Logistic-Book` | ! Missing $ inserted. | brace/math imbalance (mixed: some CLS moving-arg, some pre-existing) |
| 6 | `D:\25D\GeneralLearning\GenAi-Security\GenAI-Security-Cheat-Sheet-2025-2026\test-cls-examples\docs` | ! Extra }, or forgotten \endgroup. | brace/math imbalance (mixed: some CLS moving-arg, some pre-existing) |
| 7 | `D:\25D\EX\L16\KNN-Book` | ! Argument of __file_name_expand_cleanup:Nw has an extra }. | other / needs manual review |
| 8 | `D:\25D\Richman\Studies-25-26-A\L07\LATECH\AI-Agent-using-MCP` | ! Package pgfkeys Error: The key '/tikz/step' requires a val | other / needs manual review |
| 9 | `D:\25D\Richman\Studies-25-26-A\L08\LATECH\AI-Agent-using-MCP` | ! Package pgfkeys Error: The key '/tikz/step' requires a val | other / needs manual review |
| 10 | `D:\25D\EX\L21\Latech-book` | ! LaTeX Error: Unknown float option `מ'. | other / needs manual review |
| 11 | `D:\25D\Richman\Learning-Projects\RNN\RNN-BOOK` | ! Argument of __file_name_expand_cleanup:Nw has an extra }. | other / needs manual review |
| 12 | `D:\25D\EX\L19\Latex\multithreading-book` | ! LaTeX Error: Not allowed in LR mode. | other / needs manual review |
| 13 | `D:\25D\GeneralLearning\Claude-CLI-How-To\Book-Latech-V2` | ! Package luatex.def Error: File `images/fig01-01-ai-evoluti | project missing file/image (pre-existing) |
| 14 | `D:\25D\BIU\RL\AdvancedBook\advanced-rl-book-hebrew` | ! Package PGF Math Error: Unknown operator `a' or `an' (in ' | project tikz positioning (pre-existing) |
| 15 | `D:\25D\Richman\Studies-25-26-A\L09\GenAI-Security-Cheat-Sheet-2025-2026\test-cls-examples` | ! Missing \endcsname inserted. | residual fixer edge (project-specific wrap not yet guarded) |
| 16 | `D:\25D\Haifa\CS\Lessons\L06\Summary` | ! Missing \endcsname inserted. | residual fixer edge (project-specific wrap not yet guarded) |
| 17 | `D:\25D\EX\L9\Latech\L9-CorrelationConvolution` | ! Missing \endcsname inserted. | residual fixer edge (project-specific wrap not yet guarded) |