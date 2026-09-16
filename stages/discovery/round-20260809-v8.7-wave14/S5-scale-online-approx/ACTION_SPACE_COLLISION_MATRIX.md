# Collision / Action-Space Matrix — Wave 14

| Object | Guarantee / full-cost contract | Strongest union | Candidate-looking action | v8.7 reality or collision test | Disposition |
|---|---|---|---|---|---|
| Streaming distinct count | Relative-error cardinality; update/merge cost, bytes active/serialized, error bound, configuration transition cost | DataSketches HLL/CPC family; exact counter ceiling | Switch sketch type/precision/memory location online | Current-HEAD source could not be frozen due `SEC_E_NO_CREDENTIALS`; versioned docs already expose `TgtHllType`, `lgConfigK`, modes, heap choice, and union. No current-absence claim is allowed. | `DROP_NO_VERIFIED_ACTION_GAP`; selection is also prohibited configuration/controller form. |
| Dynamic-stream maximum matching | Approximation factor; passes, semi-streaming space, arbitrary insert/delete order | Current sketching algorithm and lower-bound frontier; offline exact ceiling | Reorder/batch sketch updates to reduce passes | No source-supported union-external action identified; a pass-count assertion alone is not a mechanism. | `DROP_NO_ATOMIC_N2_N3` |
| Exact timestamped graph stream | Exact edge/neighborhood/time semantics; update/query latency and memory | Dolha and conventional adjacency representations | Double-ended hash adjacency plus persistent time window | Dolha supplies the same representation/action. | `DROP_DIRECT_ABSORPTION` |
| Incremental shell re-execution | Same observable behavior including non-idempotent effects; time, state storage, dependency/effect tracking | Incr and full Bash re-execution | Retain/reuse intermediates across edits | Incr directly implements effect-aware dependency tracking and reuse. | `DROP_DIRECT_ABSORPTION` |

## Required action-gap / finite-killer test

No row has a verified action gap. Hence none can legally receive a finite Stage-A natural killer, FIDELITY_CLOSURE_PLAN, or `PROPOSE_STAGE0` recommendation. The HLL row is explicitly **not** a claim that the current upstream lacks a feature; it is an absence claim withheld after the required current-source check failed before source retrieval.

## Source URLs

- <https://github.com/apache/datasketches-java>
- <https://apache.github.io/datasketches-java/6.1.0/org/apache/datasketches/hll/HllSketch.html>
- <https://apache.github.io/datasketches-java/6.1.0/org/apache/datasketches/hll/Union.html>
- <https://arxiv.org/abs/2407.21005>
- <https://arxiv.org/abs/1901.08639>
- <https://www.usenix.org/conference/osdi26/presentation/xie-yizheng>
