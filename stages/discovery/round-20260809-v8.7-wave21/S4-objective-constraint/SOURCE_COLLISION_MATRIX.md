# Source / collision / action-space matrix

| Source | Exact object | Fixed goal/constraint | Current action space and union | Decision |
|---|---|---|---|---|
| [Certificates and witnesses for multi-objective queries in MDPs](https://doi.org/10.1016/j.peva.2025.102482) | MDP multi-objective reachability, invariant, and mean-payoff query | independently checkable certificate plus diagnostic witness | LP-derived certificate/witness under that query semantics | baseline / no declared mixed-query union |
| [Certificates and Witnesses for Multi-objective ω-regular Queries in MDPs](https://arxiv.org/abs/2508.17859) | MDP multi-objective omega-regular query | certification, minimal witness subsystem | MEC/reachability certificate plus MILP/automata construction | `DROP__DIFFERENT_QUERY_LANGUAGE_GUARANTEE` |
| [Reducing Tail Latency in Storage-Disaggregated Database Systems](https://doi.org/10.1145/3786688) | storage-disaggregated OLTP log replay | tail latency | Replay-as-a-Service | `DROP__ONE_WORK_NO_DEPLOYABLE_UNION` |
| [Reusing Highly Optimized IR in Dynamic Compilation](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.25) | GraalVM dynamic compilation server / optimized IR cache | compilation-time reduction | cache/reuse/compile lifecycle actions | `DROP__SELECTOR_OR_ABSORBED` |
| [Interaction-aware multi-objective optimization for LLVM compiler option sequences](https://doi.org/10.1016/j.peva.2026.102543) | LLVM option-sequence choice | runtime and energy | option-sequence selection/search | `DROP__PROHIBITED_SELECTOR` |

## v8.6/v8.7 audit

No retained action gap was premised on absent upstream functionality. Accordingly no speculative current-absence assertion, outdated documentation, issue, future-work sentence, or configuration inference was used. No `FIDELITY_CLOSURE_PLAN` is declared for a dropped lead.

