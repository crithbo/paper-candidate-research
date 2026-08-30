# Source / Collision Matrix — Wave 4

**Cutoff:** 2026-08-09. “Collision” is reserved for same-object, same-goal, same-core-mechanism absorption. Adjacent work is never silently upgraded to a direct collision.

| Seed | Primary source | Same-object direct subtractor or competing mechanism | Fair baseline union if a brief existed | Collision classification | Disposition |
|---|---|---|---|---|---|
| Online IPv6 LPM updates | PlanB (NSDI 2026), official paper | PlanB's elementary-interval transform plus linearized B+-tree for CPU IPv6 LPM; established software LPM baselines named by PlanB: PopTrie, CP-Trie, Neurotrie, HBS | Any static snapshot baseline above, plus the best update-capable LPM structure and a plain rebuild-from-snapshot implementation; static optimum is ceiling only | **Adjacent, not direct:** PlanB is static lookup-centric. Yet no independently grounded incremental representation or update trace was found here. | No candidate: ungrounded residual, not a collision claim. |
| Dynamic sketch resource allocation | SketchPipe (NSDI 2026); HeteroSketch (NSDI 2022) | Splitless placement with state transfer; profiling plus placement/resource-allocation optimization under changes | Exact sketch implementation, splitless/placement mechanisms, and any matching static allocation; must charge data/state migration | Directly absorbs a placement/allocator formulation. | Drop: controller/wrapper prohibited. |
| Dynamic out-of-core ADS | Oasis (FAST 2025) | ADS-based out-of-core representation for approximate graph processing | Oasis/ADS, a dynamic graph/stream baseline with matching query and error contract, and full I/O/rebuild accounting | **No direct collision established.** The gap is only a generic “make static ADS dynamic” statement, not a mechanism. | No candidate: no frozen model/falsifier. |
| Incremental compiler equivalence | HEC (2025) | Equality-saturation-based verification of source-to-source transformations in MLIR | HEC/e-graph verification and conventional equivalence tools, including time/memory and false-result behavior | Same functional object; a reuse proposal remains a checker derivative. | Drop: checker forbidden. |
| Dynamic phase ordering | MileStone (2026) | Multi-objective phase-ordering framework | Current phase-ordering methods plus compile-time/full optimization budget | Same decision-object family. | Drop: policy/controller prohibited. |

## Evidence notes

- **PlanB** explicitly frames IPv6 LPM as a two-dimensional prefix-value/prefix-length search and reports comparison against PopTrie, CP-Trie, Neurotrie, and HBS. It is therefore mandatory in any future CPU IPv6-LPM same-object baseline union, not evidence for an online-update contribution by itself.
- **SketchPipe** handles multi-pipeline sketch placement/state transfer; **HeteroSketch** explicitly optimizes monitoring-task placement and resource allocation during dynamics. A new “budget-aware adaptive sketch” proposal would collide structurally or violate the no-controller rule.
- **HEC** is first-party evidence of a current e-graph equivalence-checking mechanism. Performance or incremental reuse there would not transform the object into an admissible algorithm/database/compiler contribution without changing the object; changing it would fail same-object discipline.
- **Oasis** demonstrates the static out-of-core ADS tension but does not validate a specific dynamic-update residual. This was kept as a non-collision exclusion, not overstated as prior-art absorption.

## Source URLs

- <https://www.usenix.org/conference/nsdi26/presentation/zhang-zhihao>
- <https://www.usenix.org/conference/nsdi26/technical-sessions>
- <https://www.usenix.org/conference/nsdi22/technical-sessions>
- <https://www.usenix.org/conference/fast25/technical-sessions>
- <https://arxiv.org/abs/2506.02290>
- <https://arxiv.org/abs/2605.23435>
