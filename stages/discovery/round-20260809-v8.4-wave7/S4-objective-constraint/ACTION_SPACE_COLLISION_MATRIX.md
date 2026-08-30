# Action-space / collision matrix

| Source | Exact object | Current constraint/objective | Action space | Union status | Candidate result |
|---|---|---|---|---|---|
| [Recycling Algebraic Proof Certificates](https://arxiv.org/abs/2507.20267) | LPAC algebraic proof certificate checked by Pacheck | certificate bytes and verification time | extend/check algebraic derivation DAG with proof-reuse rules | The source itself jointly attacks the two listed costs. | `DIRECT_SUBTRACT__NO_RESIDUAL_IDENTIFIED` |
| [Pseudo-Boolean proof logging for constraint propagation algorithms](https://theses.gla.ac.uk/86049/) | CP propagator proof logging using PB/VeriPB derivations | proof-generation overhead and checking time | derive PB justification for CP propagation | Incompatible proof language/checker/action contract with LPAC. | `DROP__UNION_UNDEFINED` |
| [Enabling large-state stream processing on memory-constrained multi-core systems](https://doi.org/10.1016/j.future.2026.108471) | keyed temporal-window stream state on one machine | memory constraint and stream performance | state/window layout and secondary-store interaction | No independent current strong work sharing this exact action space and fixing another compatible constraint was established. | `DROP__TWO_WORK_GATE_FAIL` |
| [Approximate Query Processing under Updates](https://doi.org/10.1145/3769760) | insertion-only free-connex aggregate query maintenance | logarithmic amortized update by allowing approximation error | maintain approximate aggregate result | A stream-window union would change data/query semantics; no faithful union. | `DROP__SAME_OBJECT_FAILURE` |

## Full-cost contract if an admissible residual later appears

It must freeze input/corpus provenance, semantics and guarantee, preprocess/build time, representation/certificate bytes, solve/query/update/check time, peak memory, all conversion/translation work, and natural 20–50-instance results. This assignment declares none because no union satisfies the preceding gate.

