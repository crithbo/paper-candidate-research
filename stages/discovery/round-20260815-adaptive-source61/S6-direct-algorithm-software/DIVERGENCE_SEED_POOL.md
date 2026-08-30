# Source61 S6 — non-evidence divergence seed pool

- Assignment: `DISCOVERY-S6-20260815-ADAPTIVE-SOURCE61-R40-ORDINARY-BREADTH-V1`
- Profile: ordinary R40; anchor-first and selective-depth `OFF`.
- Generation completed before evidence lookup: `YES`.
- Network-security check: `PASS`.

| ID | Engine / viewpoint | Non-evidence sketch | Exact public anchor candidate | Pre-evidence disposition |
|---|---|---|---|---|
| S01 | `CONSTRAINT_MANIPULATION` / compiler engineer | GCC switch lowering must decide among bit tests, jump tables and decision structures under fixed C/C++ switch semantics. A contribution would require a target-cost-aware whole constructor rather than a flag or code-size heuristic. | GCC `tree-switch-conversion` source/docs | `KEEP_FOR_CONVERGENCE` |
| S02 | `COMPOSE_DECOMPOSE_SIMPLIFY` / language implementation | GHC worker/wrapper combines demand and representation information before Core transformation. A contribution would need a new semantic-preserving joint constructor, not ordinary unboxing. | GHC `WwLib` and demand-analysis source | `KEEP_FOR_CONVERGENCE` |
| S03 | `PROBLEM_REFRAMING` / backend engineer | GCC store merging couples memory-operation grouping with target legality. Likely generic instruction grouping; retained only as a reserve sketch. | GCC store-merging pass | `KEEP_FOR_CONVERGENCE` |
| S04 | `BISOCIATION_STRUCTURAL_TRANSFER` / runtime engineer | PostgreSQL JIT expression construction may couple expression partitioning and code generation. This risks a compiler-cache/controller shell. | PostgreSQL JIT provider source | `KEEP_FOR_CONVERGENCE` |
| S05 | `NEGATION_OR_INVERSION` / compiler engineer | LLVM loop-idiom recognition can be viewed as a proof-producing replacement constructor, but may simply be pass-local rewriting. | LLVM LoopIdiomRecognize | `KEEP_FOR_CONVERGENCE` |
| S06 | `ABSTRACTION_LADDER` / theory engineer | Rust layout/niche selection has language-level representation constraints, yet is likely metadata/layout rather than a new direct algorithm family. | rustc layout source | `KEEP_FOR_CONVERGENCE` |
| S07 | `JANUSIAN_TENSION` / optimizer engineer | GCC interprocedural devirtualization balances speculative direct calls with semantic validity. It is at high risk of generic analysis/controller collapse. | GCC IPA devirtualization source | `KEEP_FOR_CONVERGENCE` |
| S08 | `ADJACENT_POSSIBLE_OR_BOUNDARY` / compiler engineer | OpenJDK C2 string-concat construction could combine templates and escape information, but may be a mature emitter special case. | HotSpot string-opts source | `KEEP_FOR_CONVERGENCE` |

## Convergence

S01 and S02 were selected before source lookup because they have distinct exact compiler objects, semantics and potential native oracles. S03–S08 remain append-only non-evidence backlog; no scientific disposition from S01/S02 will promote a reserve. Existing GCC `genautomata` is terminal Stage0 STOP and was not included. `DIVERGENCE_COVERAGE_ADVISORY: PASS`.
