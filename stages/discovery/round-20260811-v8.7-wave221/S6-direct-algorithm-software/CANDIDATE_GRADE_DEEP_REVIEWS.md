# Candidate-grade deep review

## F1 — LLVM DWARF `.debug_names` joint planner

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no Stage0 brief.

| Gate | Source-grounded record |
|---|---|
| Exact object / oracle | Same DIE/name/CU/TU facts and stock `llvm-dwarfdump --debug-names --verify`; debugger lookup results must be unchanged. |
| Native action catalog | Emit headers; CU, local-TU and foreign-TU lists; choose name/hash/bucket records; encode abbreviation forms/codes; place entry-pool data; regenerate offsets and widths. |
| Strongest current union | Current LLVM `AccelTable`/debug-name production, all relevant compiler/linker modes and defaults/nondefaults, format constraints, and primary same-object tools/papers. Full current union is not source-closed. |
| Static witness | Reassign two legal name-table positions and regenerate entry offsets while preserving the name-to-DIE relation and reader acceptance. It is not an action-gap certificate. |
| Putative N2 | A joint constructor with a formal byte/lookup-cost or approximation guarantee. No distinct guarantee, complexity claim, or union-external mechanism is frozen. |
| Natural carrier | LLVM Test-Suite or versioned public C/C++ debug binaries. |
| Full cost | Compile/link CPU+wall+RSS+temporary use; output/debug-section bytes; `llvm-dwarfdump` parse/verify/find CPU+RSS+latency; debugger startup/lookup where a reproducible stock route permits it. |
| 72h killer | Pin one LLVM revision; enumerate `DwarfDebug`, `AccelTable`, debug-name emission/link paths and all debug-name flags; build a small two-name/two-DIE legal regenerated-section witness; reject if native union expresses it, verifier/lookup changes, only local sorting remains, or full costs eliminate the effect. |
| Fidelity closure | Finite but incomplete. Source/option and collision closure precede any claim-bearing run. |

### Residual audit

- **Decision/information:** a valid planner must use exactly the fixed DIE/name facts, jointly select all listed tables, and regenerate all dependent offsets.
- **Complexity/quality:** byte differences or ULEB-width effects alone are not a nontrivial N2 or reader-quality guarantee.
- **Full cost/generalization:** a file-size-only benefit that adds link time or loses lookup behavior is a no-gain outcome.
- **Reason for withholding:** the source-level strongest union and direct subtractor remain unresolved, rather than an implementation, resource, or readiness limitation.
