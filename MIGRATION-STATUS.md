# Hebrew Academic Template Migration Status

## Project: v7.0.4 → v8.0.0 (Lua Modular Architecture)

**Last Updated:** 2026-01-02
**Plan File:** `C:\Users\gal-t\.claude\plans\ancient-discovering-hollerith.md`

---

## Task Status Overview

| Phase | Task | Status |
|-------|------|--------|
| 0 | Create backup directory structure | Pending |
| 0 | Backup root CLS file | Pending |
| 0 | Generate baseline PDFs (9 examples) | Pending |
| 0 | Backup and remove duplicate CLS files (7 files) | Pending |
| 0 | Clean auxiliary files | Pending |
| 0 | Archive agent_outputs folder | Pending |
| 0 | Create .gitignore file | Pending |
| 1 | Create Lua directory structure | Pending |
| 1 | Create init.lua module loader | Pending |
| 1 | Create utils.lua module | Pending |
| 2 | Create bidi-boxes.lua module | Pending |
| 3 | Create table-themes.lua module | Pending |
| 4 | Create fonts.lua module | Pending |
| 5 | Create unit test framework | Pending |
| 6 | Update CLS with Lua integration | Pending |
| 7 | Compile and compare PDFs | Pending |
| 8 | Update version to v8.0.0 | Pending |

---

## Phase Descriptions

### Phase 0: Preparation & Cleanup
- Create `_backup/` directory structure
- Backup original CLS (v7.0.4)
- Generate baseline PDFs for all 9 examples
- Remove 7 duplicate CLS files (backup first)
- Clean ~350 auxiliary files
- Archive `agent_outputs/` folder
- Create `.gitignore`

### Phase 1: Lua Module Infrastructure
- Create `lua/hebrew-academic/` directory
- Create `init.lua` (module loader)
- Create `utils.lua` (shared utilities)

### Phase 2: BiDi Boxes Migration
- Create `bidi-boxes.lua` (replaces 104 lines of repetitive TeX)

### Phase 3: Table Themes Migration
- Create `table-themes.lua` (replaces ~50 lines)

### Phase 4: Font Configuration Migration
- Create `fonts.lua` (replaces 87 lines of nested conditionals)

### Phase 5: Unit Testing
- Create test framework (`test-runner.lua`)
- Create TeX mock (`tex-mock.lua`)
- Create module tests

### Phase 6: CLS Integration
- Add Lua loading code to CLS
- Replace TeX sections with `\directlua{}` calls

### Phase 7: PDF Comparison
- Compile all 9 examples with new CLS
- Compare against baseline PDFs using diff-pdf
- Verify BiDi rendering

### Phase 8: Version Update
- Update version to v8.0.0
- Update header and changelog

---

## Files Summary

### Files to Create
| File | Purpose |
|------|---------|
| `lua/hebrew-academic/init.lua` | Module loader |
| `lua/hebrew-academic/utils.lua` | Shared utilities |
| `lua/hebrew-academic/bidi-boxes.lua` | Box generator |
| `lua/hebrew-academic/table-themes.lua` | Theme generator |
| `lua/hebrew-academic/fonts.lua` | Font fallback |
| `lua/tests/test-runner.lua` | Test framework |
| `lua/tests/mocks/tex-mock.lua` | TeX mock |
| `lua/tests/test-*.lua` | Unit tests |
| `scripts/compile-and-compare.ps1` | PDF comparison |
| `.gitignore` | Git ignore rules |

### Files to Remove (after backup)
- `docs/hebrew-academic-template.cls`
- `examples/hebrew-academic-template.cls`
- `agent_outputs/agent_d/hebrew-academic-template.cls`
- `agent_outputs/agent_e/hebrew-academic-template.cls`
- `agent_outputs/agent_f/hebrew-academic-template.cls`
- `agent_outputs/agent_g/hebrew-academic-template.cls`
- `agent_outputs/agent_g/hebrew-academic-template_fixed.cls`

### Files to Modify
- `hebrew-academic-template.cls` (main CLS file)

---

## Success Criteria

- [ ] All 9 example PDFs identical to baseline (diff-pdf)
- [ ] 100% unit test pass rate
- [ ] Zero Lua warnings/errors
- [ ] Single CLS file in project
- [ ] ~230 lines reduced in CLS
- [ ] BiDi verification checklist complete

---

## Notes

- Full implementation code is in the plan file
- Rollback procedure documented in Phase 8 of plan
- All changes are backward compatible
