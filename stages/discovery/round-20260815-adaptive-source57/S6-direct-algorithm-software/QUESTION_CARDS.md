# Source57 S6 — evidence-qualified question card

## QC-01: LLVM GlobalISel matcher-table construction

- **Exact public anchor:** fixed LLVM target rules processed by `llvm-tblgen -gen-global-isel`; fixed MachineIR/target instruction-selection semantics; the stock `GIMatchTableExecutor` is the reader/oracle.
- **Same-object endpoint:** retain selected/generated target instruction effects for the same input MachineIR; compare producer work, match-table bytes, and executor selection work.
- **Contribution type:** `COMPILER_TOOL / N2` only if a target-specific whole matcher constructor gives an exact/FPT/approximation/certified Pareto bound beyond current GlobalISel actions.
- **Counterfactual:** a qualifying result would exploit a named target-specific rule invariant in a joint construction of tests, continuations and sharing. A generic rule compiler, decision-tree solver, option selector, or altered target rules fails same-object/non-generic gates.
- **Current loci:** current LLVM `llvm-tblgen` command documentation; `GIMatchTableExecutor` documentation; GlobalISel TableGen pattern documentation; current source/test loci returned by the upstream repository search.
- **Minimum falsifier:** current `-optimize-match-table` already reaches the proposed relevant action class, or direct instruction-selection synthesis provides the claimed construction under the same endpoint.
- **Finite closure:** versioned LLVM target `.td`/GlobalISel test input and stock match-table executor; ledger would charge generator CPU/RSS/temp, table bytes, and selection CPU/RSS/latency. Discovery does not run it.
- **Raw-gate result:** `STRUCTURAL_DROP__CURRENT_OPTIMIZED_MATCH_TABLE_PLUS_DIRECT_SUBTRACTOR`. Current tooling explicitly supports optimized match tables; the source/test record says the optimizer may reorder predicates while preserving rule order. The remaining proposed joint choice is generic rule/decision-table compilation, and a primary instruction-selection-backend synthesis work is a direct subtractor rather than a target-specific residual.

No alternate RQ was needed.
