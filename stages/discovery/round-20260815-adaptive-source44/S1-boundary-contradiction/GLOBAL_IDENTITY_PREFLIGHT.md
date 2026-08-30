# Source44 — global five-field identity preflight

| RQ / seed | Nearest historical record | Object | Atomic action / estimand | Endpoint | Guarantee | Full-cost boundary | Relation / canonical handling |
|---|---|---|---|---|---|---|---|
| RQ01 RVV `vxrm/vxsat` interprocedural state transition | bounded all-history local lookup over registry, Discovery, Stage0 and StageA records | `NO_MATCH` | `NO_MATCH` | `NO_MATCH` | `NO_MATCH` | `NO_MATCH` | `NO_MATCH__NO_NOVELTY_OR_ABSENCE_INFERENCE`; eligible for current-source checking only. |
| RQ02 ELF IFUNC relocation/call-form | Source02 `GLIBC_IFUNC__RESOLVER_TIMING__ELF_RELOCATION_CONSTRUCTOR_BOUNDARY` | `EXACT` ELF IFUNC resolver binary | `TERMINAL_CONTAINS` relocation/resolve timing/form choice | `EXACT` selected implementation/loader observation | `EXACT` ELF resolver semantics | `TERMINAL_CONTAINS` link/load/call cost | `EXCLUDED_BEFORE_RAW__TERMINAL_IDENTITY_OR_KNOWN_FATAL`; no external delta. |
| S03 GC transition | Source41 LLVM statepoint exceptional relocation | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | locator control only; no selected RQ. |
| S04 coroutine final suspend | Wave294 LLVM async coroutine context | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | locator control only; no selected RQ. |
| S05 Wasm multi-memory | Source29/43 fixed memory64 host/canonical ABI | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | `RELATED_ONLY` | locator control only; no selected RQ. |
| S06 Zawrs | Source09 `RISCV_ZAWRS__LRSC_WAIT_HINT__ATOMIC_PROGRESS__FIXED_RISCV_MEMORY_SEMANTICS` | `EXACT` | `EXACT` | `EXACT` | `EXACT` | `EXACT` | `EXCLUDED_BEFORE_LOCATOR__TERMINAL_IDENTITY`. |

`RELATED_ONLY` never excludes.  A non-match only describes the searched canonical surface and does not claim novelty, current absence, or paper quality.
