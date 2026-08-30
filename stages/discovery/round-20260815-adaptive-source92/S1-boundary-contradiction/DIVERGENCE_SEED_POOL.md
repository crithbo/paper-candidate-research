# Source92 S1 divergence seed pool

- Assignment / lane: `DISCOVERY-S1-20260815-ADAPTIVE-SOURCE92-R40-ORDINARY-BREADTH-V1` / `S1_BOUNDARY_CONTRADICTION`
- Frozen profile: R40 ordinary breadth; selective depth and anchor-first OFF.
- Seed ceiling: 12; generated offline before evidence lookup: YES.
- Network-security exclusion check: PASS.

| Seed ID | Engine / perspective | Offline sketch and conclusion-first test | Preliminary disposition |
|---|---|---|---|
| S92-S1-01 | JANUSIAN_TENSION / maintainer | POSIX `fork()` preserves the calling thread's address-space view but post-fork code in a multithreaded child is tightly restricted. A same-contract handler-order constructor would only matter if it changed legal recovery without changing that boundary. | SELECTED_FOR_CONVERGENCE |
| S92-S1-02 | CONSTRAINT_MANIPULATION / compiler engineer | Ask whether C++ atomic wait/notify lifetime semantics leave a target-specific wake-placement algorithm under a fixed progress contract. Conservative conclusion: only a non-generic progress guarantee would matter. | KEEP_FOR_CONVERGENCE |
| S92-S1-03 | PROBLEM_REFRAMING / runtime maintainer | Treat a POSIX barrier phase change as a publication boundary rather than a scheduling event. It is useful only if phase-local state admits a fixed-guarantee construction beyond batching. | KEEP_FOR_CONVERGENCE |
| S92-S1-04 | ABSTRACTION_LADDER / operator | Recast process-spawn file-action visibility as an observable commit point. Worth study only if a same-image action exists beyond adapter-level action ordering. | KEEP_FOR_CONVERGENCE |
| S92-S1-05 | ADJACENT_POSSIBLE_OR_BOUNDARY / theorist | Consider C++ condition-variable notification-at-thread-exit as a lifecycle/cost boundary. A publish-time change would need to preserve completion and wake guarantees. | KEEP_FOR_CONVERGENCE |
| S92-S1-06 | COMPOSE_DECOMPOSE_SIMPLIFY / maintainer | Split thread-local cleanup from key deletion to test whether a cleanup-plan algorithm can preserve destructor/lifetime semantics. Similar lifecycle endpoint risk to the prior Source91 TSS family. | RELATED_ONLY__NOT_SELECTED |

## Clustering and convergence

| Cluster | Seed IDs | Representative | Why selected/not selected |
|---|---|---|---|
| fork/lifecycle commit boundary | 01, 04, 05 | 01 | `fork()` has a precise official observable boundary and a short primary-source route. |
| wait/phase semantics | 02, 03 | 02 | Retained only as non-evidence backlog; no result-aware replacement occurs. |
| destructor lifecycle | 06 | 06 | Related to Source91 only; it was not used as an exclusion or a new locator. |

## Coverage advisory

- Engines used: 6; perspectives: maintainer, compiler engineer, operator, theorist.
- `DIVERGENCE_COVERAGE_ADVISORY`: PASS.
- Plain-Chinese note: 本池仅用于离线召回；唯一进入证据路径的是 S92-S1-01，其他 seed 未因筛查结果补位。
