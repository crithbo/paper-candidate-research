# Action-Space / Collision Matrix — Wave 7

**Rule:** a direct subtractor means same object, information, query/guarantee, and core action. “Adjacent” never means collision. A source after 2026-08-09 is excluded.

| Object (fixed before ideation) | Update → query → resource/error contract | Strongest fair baseline union | Candidate-looking action | Collision / residual decision | Finite Stage-A killer if it had survived |
|---|---|---|---|---|---|
| Mutable repetitive string self-index | Insert/delete a substring → locate occurrences of pattern → compressed bits, amortized update, locate/report time | Dynamic RR-index; dynamic r-index and other dynamic self-indexes named in its evaluation; exact decompressed/rebuild ceiling | Dynamic RLSLP/recompression representation that eliminates LCP-sensitive update cost while preserving compact locate | **Direct absorption.** RR-index already makes this representation/action and states the relevant contract. No new N1/N2/N3 action identified. | Not admissible: any fair killer would retest the published direct subtractor, not a distinct mechanism. |
| Fully dynamic motif estimate | Edge insert/delete → global/local motif count → memory, update rate, bias/variance and confidence | Uniform fully dynamic sampling; weighted sampling (WSD); for bipartite butterflies, Abacus/Parabacus; exact recompute ceiling | Reweight samples, compensate deletions, or batch them | **No frozen residual.** These are already competing action families; choosing one from a changing budget is controller behavior. The object/motif/error target was not independently frozen. | Not admissible: must first fix one motif, stream order, ε/δ, memory, and baseline code path. |
| Fully dynamic path predicate | Edge insert/delete → fixed long-path, detour, or parity query → update/query latency and memory | Dynamic Detours for the exact predicate; recomputation ceiling | Local delayed insertion around biconnected components | **Direct absorption** for the discovered exact predicate. Changing from detour to another dynamic graph query is a new object, not a residual. | Not admissible without a newly frozen exact predicate and natural trace. |
| Runtime-evolving constraint satisfaction | Shape/constraint/variable change across solves → satisfiable/solution query → solver time, memory, encoding growth, state activation cost | Fresh encoding; native incremental solver; dependency-guided partition plus incremental encoding/activation | Persist/reuse sub-encodings across solves | **Direct absorption.** D2SCSP's stated core method occupies this action. A cache/proof/checker framing is prohibited. | Not admissible: would compare a renamed version of the direct subtractor. |
| Streaming sketch statistic | Turnstile event → named statistic at query → update throughput, memory, error/confidence, deletion and migration/rebuild cost | Exact counter; named sketch with deletion support; matching CPU implementation; hardware/offload is not a CPU baseline | Shift sketch arrays/resources or adapt budget | **Policy exclusion.** Placement/allocation is controller action; no fixed statistic or union-external sketch representation was identified. | Not admissible until a statistic/contract and non-controller representation exist. |

## Evidence-supported collision notes

- The RR-index source explicitly presents a dynamic grammar-compressed self-index with substring insertions/deletions and contrasts it with dynamic r-index and other dynamic indexes. That makes a new “dynamic compressed self-index using grammar recompression” a direct subtractor collision, not a fresh brief.
- The WSD and Abacus sources establish distinct deletion-aware sampling action families for dynamic graph motifs. They do not prove all dynamic motif research is exhausted; they establish why an un-frozen “better sampling” statement is not a proposal.
- Dynamic Detours states a particular delayed-edge-insertion mechanism and its query scope. This is direct only for the exact predicates tabled above; the matrix deliberately does not overgeneralize it.
- The D2SCSP source specifically names dependency-guided partitioning, incremental encoding, and constraint activation. A proposal that merely reuses solver state collides at the core action level.
- SketchPipe moves/caches sketch state to implement placement on multi-pipeline switches; μView uses streaming sketches in an IPU data plane. Neither is treated as a CPU-only direct baseline, but together they show that a budget/placement formulation is a disallowed controller, not a new data-structure object.

## Source URLs

- <https://arxiv.org/abs/2604.24080>
- <https://arxiv.org/abs/2603.13058>
- <https://arxiv.org/abs/2211.06793>
- <https://arxiv.org/abs/2312.03435>
- <https://arxiv.org/abs/2605.03225>
- <https://arxiv.org/abs/2604.03624>
- <https://www.usenix.org/conference/nsdi26/presentation/chen-xiang>
- <https://www.usenix.org/conference/nsdi26/presentation/cornacchia>
