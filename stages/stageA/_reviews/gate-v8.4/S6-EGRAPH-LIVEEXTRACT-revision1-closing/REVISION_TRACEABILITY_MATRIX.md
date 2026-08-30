# Revision traceability matrix

Atomic gate: `NATURAL_MULTI_ALTERNATIVE_EGRAPH_WITH_BACKEND_VALID_SIZE_COST_AND_SAME_B_STRICT_WITNESS_OR_STRUCTURAL_INCREMENT`

| Gate item | Revision claim | Independent verification | Status |
|---|---|---|---|
| Frozen public compiler object | Diospyros `simple_vec_add_root_7`, root 7, pinned extraction-gym commit/path/blob/hash | Local bytes are 17,477; SHA-256 and independently recomputed Git blob SHA-1 `0a6fdaa6432a55b7c49001bd83531835efc6a1af` match the contract | `VERIFIED_PINNED_BYTES` |
| Deterministic acyclic projection | 16 reachable e-classes, 24 retained e-nodes | All 24 retained nodes exist in the raw artifact; node e-class/op/children/cost mappings match; all 16 classes are root-reachable and the retained union graph is acyclic | `VERIFIED_LOCKED_PROJECTION_CONSISTENCY` |
| Natural multi-alternative object | 9 exact extractions | Sealed run lists 9 distinct signatures across five root representative families; minimum requirement of two is met | `FULLY_ADDRESSED` |
| Target-informed size/cost mapping | scalar 4 B, four-lane vector 16 B, artifact cost ×1000 | Independent raw/projection audit found zero mapping inconsistencies; this remains a proxy mapping, not measured allocation/latency | `FULLY_ADDRESSED_WITH_CEILING` |
| Same object and information | Joint and both controls share projection, root, closure, B, mapping and action space | Static code inspection confirms one `classes, roots` object and one `scheduled(extraction, budget)` function are used by all methods | `FULLY_ADDRESSED` |
| Exact runtime-first control | Globally minimum static target cost, exact schedule, all ties | Code implements global minimum, retains ties; sealed structure reports one tie; root-7.3 extraction is the unique control | `FULLY_ADDRESSED` |
| Exact memory-first control | Minimum exact one-shot peak, then static cost, exact schedule, all ties | Code exhaustively searches one-shot schedules, preserves the frozen tie order; sealed structure reports one tie; root-7.2 is the unique control | `FULLY_ADDRESSED` |
| Complete budget sweep | B = 4..136 in 4-byte steps | 34 serialized points are present with no gap | `FULLY_ADDRESSED` |
| Strict natural residual | Joint strictly below both controls at identical feasible B | 0 strict witnesses; B=24..44 exactly equals memory-first, B=48..136 exactly equals runtime-first | `NOT_ACHIEVED__DECISIVE_NEGATIVE` |
| Qualifying structural increment | Explicit characterization leaving a nonempty residual | The only characterization is a two-region absorption partition; the frozen contract explicitly says absorption is STOP, not a PASS increment | `NOT_ACHIEVED` |
| Replay and reproducibility | Two canonical runs and 81 schedule replays | Semantic run payloads independently compare equal; 81 serialized traces independently replay with zero violation; sealed validator reports identical canonical hash | `FULLY_ADDRESSED` |
| Claim honesty | Object-specific negative only | Reports do not claim universal absorption, measured backend results or paper-level completion | `FULLY_ADDRESSED` |

Re-review disposition: the revision request was executed and verified, but its scientific answer is negative. Since the single revision is consumed, the traceability result maps to `STOP`, not another revision.
