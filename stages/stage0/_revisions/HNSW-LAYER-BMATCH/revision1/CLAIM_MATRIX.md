# Claim Matrix — HNSW-LAYER-BMATCH Revision 1

| Claim | Revision support | Verdict | Claim ceiling |
|---|---|---|---|
| Broad global/layerwise HNSW construction is novel | contradicted by FastHNSW/FastKCNA | `FAIL__ABSORBED` | prohibited |
| Generic degree-capped edge selection is novel | generic b-matching genealogy covers kernel | `FAIL__ABSORBED` | prohibited |
| Generic component bridging/DFS repair is novel | ordinary repair and NSG path subtract it | `FAIL__ABSORBED` | prohibited |
| Exact object and same-information candidate graph are definable | frozen vectors/metric/layer/entry/cap/`C` and separate static/native tracks | `PASS` | contract only |
| Candidate is not matching followed by repair | connectivity is invariant from entry-rooted ear growth; exchanges are atomic; objective is path-dependent | `PASS__STRUCTURAL` | algorithm definition, not implementation |
| HNSW-specific objective is explicit | standard layer `ef=1` greedy-reachability `G`, diversity and length tie terms | `PASS` | static objective only |
| Degree/candidate/connectivity invariants are explicit | `I1–I5` and bundle legality | `PASS` | proof target, not proved theorem |
| Nontrivial formal property is explicit | `PE(L,b)` completeness plus `k`-exchange local-optimality target | `PASS_FOR_STAGE0` | conditional property target |
| Six-vector witness is metric realizable | exact coordinates and rational squared distances | `PASS` | static fixture only |
| Candidate action differs from frozen ordinary controls | three-add/two-delete portal exchange; `G=6` versus repaired-path `G=3` | `PASS__STATIC_CATALOG` | not native observed result |
| Candidate uses only frozen edges and caps | `E*⊆C`; every degree is two | `PASS` | static fixture |
| Native hnswlib/Faiss/FastHNSW outputs are already reproduced | no native adapter or run | `NOT_ESTABLISHED` | Stage A fidelity task |
| Native serialization/save/load/search parity is established | no artifact/run | `NOT_ESTABLISHED` | Stage A fidelity task |
| Natural portal-ear occurrence or performance headroom exists | no natural run | `NOT_ESTABLISHED` | no empirical claim |
| Latest exact collision is exhausted | bounded sources only | `SEARCH_BOUNDED_OPEN` | no first-of-kind claim |
| Finite Stage A closure route exists | two-corpus, full-cost, native and witness killers frozen | `PASS` | route only |
| Conditional Q2 N2 paper kernel exists | concrete action, property, discriminator and finite falsifier survive direct subtraction | `PASS_RECOMMENDED_FOR_CLOSING` | `TIER_B_Q2_VIABLE` conditional |

## Evidence versus inference

- Static evidence: coordinates, distance matrix, candidate graph, edge sets, degree/connectivity checks and greedy traces.
- Source evidence: broad layerwise construction, local pruning, generic matching and ordinary repair are strong subtractors.
- Formal inference: bounded portal-ear enumeration can support the stated completeness/local-optimality obligations.
- Open empirical questions: native fidelity, natural occurrence, runtime, matched-recall quality and full-cost Pareto.

## Safe claim after closing review

“The revision defines a same-object, capacity-safe, entry-connected HNSW selector with a static action-divergence witness and a finite formal/empirical falsification route.”

It may not be strengthened to implemented, proven, naturally beneficial, faster, smaller, higher recall, first global HNSW, or superior to FastHNSW.

