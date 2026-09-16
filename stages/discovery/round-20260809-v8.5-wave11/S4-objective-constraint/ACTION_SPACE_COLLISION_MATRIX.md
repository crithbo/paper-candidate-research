# Action-space / collision matrix

| Primary source | Exact natural/formal object | Action and guarantee | Same-information union assessment | Candidate outcome |
|---|---|---|---|---|
| [A Multi-Stage Proof Logging Framework to Certify the Correctness of CP Solvers](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2024.11) | CP solver proof trace / multi-stage certificate | generate/check proof stages for CP solver operations | Can be compared to direct DRCP only if both retain the same FlatZinc model, propagation semantics, checker trust base, and all construction costs. | baseline only |
| [Formally Verified Certification of Constraint Programming Proofs](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2026.24) | FlatZinc model and DRCP proof | direct formally verified checking of modular inference rules | Already subsumes the direct semantic-construction axis. Adding a format translator is not a union-external inference action. | `DROP__WRAPPER` |
| [Approximate Query Processing under Updates](https://doi.org/10.1145/3769760) | free-connex aggregation under updates | error-bounded approximate maintenance | Not same output guarantee as exact enumeration/maintenance. | `DROP__SEMANTIC_MISMATCH` |
| [Maintaining Queries under Updates Using Heavy-Light Partitioning](https://arxiv.org/abs/2605.08397) | arbitrary join output under tuple updates | exact output maintenance and constant-delay enumeration | A bridge to AQP would choose/relax guarantee rather than construct a same-guarantee joint representation. | `DROP__SELECTOR_OR_CHANGED_OBJECT` |
| [Certificates and witnesses for multi-objective queries in Markov decision processes](https://doi.org/10.1016/j.peva.2025.102482) | probabilistic model-checking query/certificate | independently checkable certificate and witness | No second compatible current constraint-fixed construction located in primary-source search. | `DROP__TWO_WORK_GATE_FAIL` |

## Full-cost and finite-killer policy

No union passed. A future admissible brief would explicitly count construction/translation, certificate or state bytes, solve/query/check time, peak memory, and preserve model/query/output semantics. Its Stage A witness would test legality/equivalence and denominator completeness before any claim-bearing result.

