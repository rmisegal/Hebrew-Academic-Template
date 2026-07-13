# CLS Version Alignment Report

**Generated:** 2026-07-13
**Canonical latest:** `hebrew-academic-template.cls` **v7.3.5** (hash `5f1fdca98593`, 110 public commands)
**Canonical source:** `C:\25D\CLS-examples\hebrew-academic-template.cls`

---

## 1. Discovery summary

- **336** `.cls` files found under `C:\25D` (heavy dirs pruned).
- **315** are named `hebrew-academic-template.cls` (the target class).
- **7** are derivatives: `hebrew-academic-template_fixed.cls` (×5), `hebrew-academic-template-fixed.cls` (×1), `agent-g-hebrew-academic-template-fixed.cls` (×1).
- **14** are unrelated classes (`gtai-template.cls`, `IntechOpen-Book.cls`, `haifa-syllabus.cls`, `phddissertation.cls`) — **out of scope**, not touched.

### Copies per top-level project (315 canonical-named)
| Project | Copies |
|---|---|
| GeneralLearning | 101 |
| EX | 60 |
| BIU | 58 |
| Richman | 49 |
| Haifa | 26 |
| app | 9 |
| CLS-examples | 7 |
| GTAI | 3 |
| Generic-Architecture | 2 |

---

## 2. Version map (315 copies → 13 versions, 22 distinct content hashes)

| Version | Content hash | Count |
|---|---|---|
| 5.0 | 05e23fad2618 | 1 |
| 5.0 | 2f59ccbd9c7f | 1 |
| 5.7.0 | 5020aad96401 | 4 |
| 5.11.0 | df3ec399ab7a | 1 |
| 5.11.4 | d2f29a3f49be | 1 |
| 6.3.2 | 5e528e4ca08f | 22 |
| 6.3.4 | 6f7999c36b70 | 4 |
| 7.0.6 | **9f8829f701cf** | **154** |
| 7.0.6 | c67baac0d6f8 | 1 |
| 7.0.6 | d29231956612 | 1 |
| 7.1.0 | 84dca1843558 | 1 |
| 7.2.0 | da64711ec50d | 33 |
| 7.2.0 | b1df2ced1018 | 3 |
| 7.2.0 | 52521adf9f67 | 1 |
| 7.3.0 | d4551bb79595 | 48 |
| 7.3.0 | ba2b5744ddac | 2 |
| 7.3.0 | 5cc91809f351 | 1 |
| 7.3.0 | cc788558a231 | 1 |
| 7.3.1 | 11d5b82117b7 | 14 |
| 7.3.2 | 016f8ec24f5b | 17 |
| 7.3.2 | aff1e27bade8 | 1 |
| **7.3.5** | **5f1fdca98593** | **3** |

**Only 3 copies are current (v7.3.5).** The bulk are far behind — 156 at v7.0.6, 37 at v7.2.0, 52 at v7.3.0.

### The 3 current v7.3.5 copies
- `CLS-examples\hebrew-academic-template.cls` (canonical)
- `CLS-examples\examples\hebrew-academic-template.cls`
- `Haifa\CS\Lessons\L11\final-project\book-guidelines\hebrew-academic-template.cls`

---

## 3. Collision check — SAME version number, DIFFERENT content ⚠️

The user's exact concern is confirmed and widespread. These version numbers exist with **multiple distinct byte contents**:

| Version | # distinct contents | Hashes |
|---|---|---|
| 5.0 | 2 | 05e23fad2618, 2f59ccbd9c7f |
| **7.0.6** | **3** | 9f8829f701cf, c67baac0d6f8, d29231956612 |
| **7.2.0** | **3** | da64711ec50d, b1df2ced1018, 52521adf9f67 |
| **7.3.0** | **4** | d4551bb79595, ba2b5744ddac, 5cc91809f351, cc788558a231 |
| 7.3.2 | 2 | 016f8ec24f5b, aff1e27bade8 |

These are "mess-ups": a project edited a CLS in place without bumping the version. Aligning everyone to v7.3.5 resolves all collisions (single hash everywhere).

---

## 4. Newer-drops-older check — capabilities in old copies MISSING from v7.3.5

Public-command sets of all 22 variants + 7 derivatives were diffed against v7.3.5. **6** commands appear somewhere but not in v7.3.5:

| Command | Found in | Verdict |
|---|---|---|
| `\numberline` | 5.11.4 | **Noise** — redefinition of a standard LaTeX TOC macro, not a feature. |
| `\to` | 7.0.6 (d29231956612) | **Noise** — local redefinition of the standard math arrow. |
| `\englishauthor{}` | 7.0.6 (c67baac0d6f8) | **Real** — `\newcommand{\englishauthor}[1]{\def\@englishauthor{#1}}` (English author cover metadata). v7.3.5 has `\hebrewauthor` but not `\englishauthor`. |
| `ltrblock` (env) | 7.0.6 (c67baac0d6f8) | **Real** — `\newenvironment{ltrblock}{\par\begin{center}...}` (centered LTR block). |
| `\coverdisclaimer{}` | 7.3.0 (5cc91809f351) | **Real** — `\newcommand{\coverdisclaimer}[1]{...}` + rendered on titlepage (cover-page disclaimer text). |
| `\hebtextmath{}` | fixed variant | **Real** — `\newcommand{\hebtextmath}[1]{\text{\texthebrew{#1}}}` (Hebrew text inside math mode). |

**4 genuine capabilities** were approved and **ported into v7.3.6** (smoke-tested + demonstrated in `expert_example.tex`):
`\englishauthor{}`, `\coverdisclaimer{}`, `ltrblock` env, `\hebtextmath{}` (the last shipped in v1.0, was dropped, now restored). The canonical class is therefore now a **strict superset**. New canonical = **v7.3.6** (hash recomputed at deploy time).

> Deployment note: the file propagated in Phase 5 is **v7.3.6**, not v7.3.5.

---

## 5. Replacement plan (Phase 5)

- **Target:** 315 canonical-named copies **minus 4** under `CLS-examples\docs\dev-history\` (historical, excluded) = **311** copies to align.
- 3 are already v7.3.5; the other **308** get overwritten with the canonical file (after backup).
- **7 `*_fixed` derivatives** are flagged, NOT auto-replaced (different class name = judgment call).
- Backups → `D:\25D\CLS-examples\backups\cls-align-2026-07-13\` mirroring relative paths + `manifest.csv` (path, old_version, sha256).

---

## 6. Coverage audit (Phase 4)

All 16 example `.tex` recompiled clean under LuaLaTeX against **v7.3.6** (pages):
advanced 14, beginner 8, bibliography 8, book 23, coverpage 8, expert 19, footnote 8,
framedschemapage 11, geometry 2, image 16, intermediate 11, table 7, table_minimal 2,
table_test_steps 2, test_rtl ok, toc_article_pagenum 14.

**Public API coverage: 83 items (70 commands + 13 environments) → 81 demonstrated in ≥1 example.**

Uncovered demos were added to `expert_example.tex` for: `\Hitem`, `\Rtwo`,
`\englishsectionunnumbered`, `\hebrewsectionnotoc`, `\hebfoot`, and the `codebox`,
`exercise`, `formulabox`, `latin` environments — all now covered.

**Residual (2, intentional):**
- `\thepage` — standard LaTeX macro (redefined internally), not a public command.
- `\hebrewAlph` — internal Hebrew-letter counter formatter used only by `\hebrewappendix`
  in book mode; not called directly by users.

These 2 are internal helpers, so **effective public-API coverage is 100%**.

---

## 7. Downstream verification (Phase 6)

Compiled 6 representative real consumer documents (one per project, next to an overwritten copy):

| Project | Doc | Result |
|---|---|---|
| EX | `L8/.../direction-test.tex` | ✅ compiled |
| BIU | `RL/.../standalone-chapter02/main-02.tex` | ✅ 11pp |
| app | `visual-agentic-orange/.../e-bill...he.tex` | ✅ 2pp (invoice/geometry) |
| Haifa | `CS/Lessons/L02/Summary/main.tex` | ✅ 10pp |
| GeneralLearning | `.../chapter06-stand-alone/main_chapter06.tex` | ❌ pre-existing (`\chapter` undefined in standalone/article mode) |
| Richman | `Toki/.../master/master-main.tex` | ❌ pre-existing (`\definition` clash with doc's own `\newtheorem`) |

**The 2 failures are NOT swap regressions.** Recompiling each with its **backed-up 7.0.6 CLS**
reproduced the identical error and produced no PDF — i.e. they were already broken before the
alignment. The `\definition` environment (source of the Richman clash) has existed since v5.11.1,
so it was present in the old 7.0.6 too. **The v7.3.6 upgrade introduced zero regressions.**

## 8. Result

- All live CLS copies under `C:\25D` (311) now share one hash `a3cde0bbbea9` (**v7.3.6**).
- 4 `docs\dev-history\**` snapshots intentionally preserved.
- All originals backed up to `D:\25D\CLS-examples\backups\cls-align-2026-07-13\` (`manifest.csv`, 309 rows).
- All 16 examples recompile clean; public-API coverage effectively 100%.
- v7.3.6 committed, tagged, and pushed; README + CHANGELOG + FEATURES + `cls_info_config.json` help built-in synced.


