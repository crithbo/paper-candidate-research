# Source and collision matrix

All entries are first-party paper/proceedings/author materials. “Not retained” is not a scientific STOP for a field; it is a failure to meet this assignment’s candidate contract.

| Family / source | Date and role | Exact object | Fixed objective or constraint | Collision / union finding | Decision |
|---|---|---|---|---|---|
| Van Doren, Antonopoulos, Piskac, *Efficient and Verifiable Proof Logging for MaxSAT Solving* — [author PDF](https://www.cs.yale.edu/homes/antonopoulos-timos/ASE-2025.pdf) | ASE 2025 anchor | weighted MaxSAT, core-guided OLL / EvalMaxSAT | native certificate generation, certificate size/check time | Its native-DAG action is tied to OLL inference history. It is not a plug-compatible action with branch-and-bound splitting. | not retained |
| Vandesande, Coll, Bogaerts, *Certified Branch-and-Bound MaxSAT Solving* — [arXiv author version](https://arxiv.org/abs/2511.10273) | 2025 competitive mechanism | branch-and-bound MaxSAT / MaxCDCL | certify BnB look-ahead and MDD encodings | Same broad problem class but no demonstrated identical solver state/action contract or deployable full-cost union with EvalMaxSAT. | `DROP__SAME_OBJECT_ACTION_SPACE_NOT_FROZEN` |
| Bogaerts et al., *Practically Feasible Proof Logging for Pseudo-Boolean Optimization* — [CP 2025 original](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2025.21) | counter-anchor | pseudo-Boolean optimization / RoundingSat, Sat4j | formally verified checking with PB proof language | Confirms language/paradigm dependence; it does not supply a MaxSAT joint action. | methodological adjacent only |
| Xiu, Agarwal, Yang, *PARQO: Penalty-Aware Robust Plan Selection in Query Optimization* — [PVLDB Vol.17 contents](https://www.vldb.org/pvldb/vol17/FrontMatterVol17No13.pdf) | 2025 query seed | SQL query-plan selection | penalty-aware robustness | The named action is plan selection. | `DROP__PROHIBITED_SELECTOR_CONTROLLER` |
| Xiu et al., *PAR2QO: Parametric Penalty-Aware Robust Query Optimization* — [PVLDB Vol.18 contents](https://www.vldb.org/pvldb/vol18/FrontMatterVol18No11.pdf) | 2026 query collision | SQL query-plan selection | parametric penalty-aware robustness | Direct continuation of the selector formulation; a union is still a selector. | `DIRECT_SUBTRACT_TO_ZERO_FOR_THIS_ASSIGNMENT` |
| Pan et al., *GRACE* — [original preprint](https://arxiv.org/abs/2510.13176) | 2025 compiler seed | LLVM pass-sequence autotuning for IR instruction count | code-size quality and per-program tuning time | It forms a specialized sequence coreset then selects/refines a sequence. | `DROP__PROHIBITED_SELECTOR` |
| PDCAT (cited in GRACE bibliography) | FSE 2025 predecessor | same LLVM pass-autotuning family | preference-driven autotuning | A proposed “joint” preference policy would remain an outer selector, not a new compiler transformation/search structure. | `DROP__NO_ADMISSIBLE_N1_N2_RESIDUAL` |

## Fair-union test

No retained candidate exists; therefore no baseline union is declared. For the MaxSAT seed, any claimed union would have to freeze the exact formula class, solver transition system, proof vocabulary, worker/communication model, certificate composition rule, solver and checker time, memory, log bytes, and final checker result. The primary materials do not establish a deployable union meeting that contract. For query and LLVM seeds, the obvious union is exactly the forbidden plan/pass-sequence selector.

