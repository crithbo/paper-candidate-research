# Source94 S1 divergence seed pool

- Assignment / lane: `DISCOVERY-S1-20260815-ADAPTIVE-SOURCE94-R40-ORDINARY-BREADTH-V1` / S1.
- Profile: R40 ordinary breadth; selective depth, anchor-first, claim-pack and V9 OFF.
- Seed generation completed offline before evidence lookup: YES; network-security exclusion: PASS.

| Seed ID | Engine / perspective | Offline idea and cautious conclusion | Disposition |
|---|---|---|---|
| S94-S1-01 | JANUSIAN_TENSION / runtime maintainer | Rust scoped threads make borrowed data safe by joining before scope return, yet TLS destructors may still run after return. A same-contract completion constructor would matter only if it does more than strengthen/alter this lifecycle boundary. | SELECTED_FOR_CONVERGENCE |
| S94-S1-02 | CONSTRAINT_MANIPULATION / compiler engineer | Treat scope-end join placement as a liveness frontier. A contribution needs a target-specific invariant beyond ordinary join scheduling. | KEEP_FOR_CONVERGENCE |
| S94-S1-03 | PROBLEM_REFRAMING / application developer | Ask whether panic propagation at scoped-thread completion creates an observable batch boundary. It is useful only if fixed panic semantics leave a non-generic decision. | KEEP_FOR_CONVERGENCE |
| S94-S1-04 | ABSTRACTION_LADDER / theorist | Model scoped borrowing and scope lifetime as a formal transition system. A paper needs a construction distinct from a generic proof/scheduler. | KEEP_FOR_CONVERGENCE |
| S94-S1-05 | COMPOSE_DECOMPOSE_SIMPLIFY / operator | Separate manual joins from automatic joins within one scope. The likely negative is generic action ordering under fixed completion semantics. | KEEP_FOR_CONVERGENCE |
| S94-S1-06 | ADJACENT_POSSIBLE_OR_BOUNDARY / maintainer | Contrast scope return with process/thread teardown. This is only a sketch and does not reopen Source91 TSS lifecycle work. | RELATED_ONLY__NOT_SELECTED |

## Convergence

| Cluster | Seeds | Representative | Decision |
|---|---|---|---|
| scoped lifecycle / completion | 01–05 | 01 | Selected for its exact official contract and direct contrary statement. |
| general teardown | 06 | 06 | Non-evidence backlog only. |

Coverage advisory: 6 engines, 5 perspectives, PASS. No evidence outcome was used to replace any seed.
