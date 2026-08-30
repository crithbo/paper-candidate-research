# Raw screen row events

| event | evidence state | disposition |
|---|---|---|
| Pool representation | Current upstream describes libsolv as a dependency solver with dictionary storage for packages and dependencies; Pool, Repo and Solvable interfaces are ID-indexed. | representation audit |
| Native cache | `.solv` is the native repository/cache path, so a valid topic must preserve standard loading and solving. | fixed object |
| Minimal divergence | Complete construction can regenerate all references after another insertion or ID-reuse history. | representation variance only |
| N2 admission | Full writer/serialization/config union and direct collision are not closed. | `NOT_ADMITTED_UNFROZEN` |

Internal-ID variance is not treated as a performance claim or evidence of a target-specific algorithm.
