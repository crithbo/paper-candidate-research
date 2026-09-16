# S6 Wave 4 — source/collision matrix

Primary papers and official/upstream artifacts were checked through 2026-08-09.  All entries are drops, so no brief or Stage-A killer is authorized.

| ID | Exact object considered | Public natural carrier / artifact | Current strong same-object baseline union | Collision or structural blocker | Decision |
|---|---|---|---|---|---|
| W4-D1 | Recursive Datalog execution: join/decomposition/incremental maintenance for static analysis | FlowLog's real workload suite/DOOP demo; Soufflé-style input | FlowLog relational IR + recursion-aware Boolean/algebraic specialization + robust structural optimiser + sideways information passing; Soufflé and Differential Dataflow paths | FlowLog 2025/2026 already occupies the proposed family.  A policy that selects its paths is a controller; an unpinned new join constraint is not a candidate. | `DIRECT_FATAL / WRAPPER_CONTROLLER` |
| W4-D2 | Reconstruct Lean proofs from solver-derived cvc5 information | QuerySMT/Lean benchmarks; cvc5 proof/hint output | QuerySMT's cvc5-derived hints plus native Lean automation; full replay and premise-only reconstruction | QuerySMT 2026 already defines the intermediate hint construction.  A cache, selector, or diagnostic layer has no new certificate construction/guarantee. | `DIRECT_SUBTRACT / NO_FROZEN_N2` |
| W4-D3 | Independently checkable certificate/witness construction for multi-objective MDP queries | PRISM models/case studies and multi-objective query engine | 2025 certificate/witness algorithm; PRISM's LP, policy iteration, value iteration routes | Existing work supplies the exact certificate/witness objective.  A generic post-hoc minimizer changes no fixed semantics/guarantee and presently has no natural headroom proof. | `DIRECT_SUBTRACT` |
| W4-D4 | Optimal VLIW software-pipeline schedule construction under a fixed initiation interval | paper artifact/search instances where available; CPU SMT solver | 2026 SMT-based optimal software pipeliner; heuristic and hand schedules | The current paper already freezes solver-based construction and infeasibility feedback.  A different schedule heuristic is a weak-baseline/tuning variant unless a distinct information or constraint structure is established. | `DIRECT_FATAL` |
| W4-D5 | Fast approximate free-connex aggregation under updates | relational query/update workloads | Dai–Yi 2025 logarithmic-amortized insertion-only AQP; exact incremental-view-maintenance baseline | The claimed approximation/decomposition object is directly published.  Extending it to a different update model would change exact object and needs independently grounded natural headroom. | `DIRECT_FATAL` |

## Fairness and semantic boundaries

- No cross-object comparison is admissible: a FlowLog workload is not a PRISM query, and a cvc5 proof is not a generic Datalog artifact.
- Any future performance claim would need end-to-end CPU/runtime/memory/output-quality accounting, not isolated operator timings.
- Existing mechanisms are strong baselines only within their named object; no universal component union was used to force a STOP.
