# Action-space and collision matrix

| Source | Exact object | Decision/action space | Fixed constraint or objective | Same-information union status | Why no `PROPOSE_STAGE0` |
|---|---|---|---|---|---|
| [New compressed indices for multijoins on graph databases](https://doi.org/10.1016/j.is.2025.102647) | static labeled graph database; Basic Graph Pattern multijoin; fixed LTJ semantics | choose compact index and query-resolution strategy | static space–time tradeoffs | no second present action space: update support is discussed as prospective | A dynamic extension would be future-work copying and needs a new update-semantic object. |
| [StreamIR](https://arxiv.org/abs/2504.21458) | RTLola unbounded stream specifications compiled/interpreted through StreamIR | static-analysis-derived stream IR transformations | monitor runtime / target compilation | no union with JIT IR reuse: different input, lifecycle, and semantic contract | Exact-object gate fails. |
| [Reusing Highly Optimized IR in Dynamic Compilation](https://2025.ecoop.org/details/ecoop-2025-technical-papers/36/Reusing-Highly-Optimized-IR-in-Dynamic-Compilation) | dynamically compiled JIT IR | retrieve/reuse optimized IR | compilation latency | no union with StreamIR; no common representation/action contract | Exact-object gate fails. |
| [Certified Compilation based on Gödel Numbers](https://arxiv.org/abs/2508.12054) | restricted-C source-to-binary faithfulness certificate | derive integer certificate from source and binary | constant-time derivation-rule construction/checkability | no compatible current certificate-construction baseline was established | Combining with a proof assistant framework is an unsupported wrapper. |
| [Rocqet PLDI 2025 technical report](https://cs.uwaterloo.ca/~oebresaf/papers/rocqet-pldi2025-tr.pdf) | modular formalization of compiler transformations/IR/ISA | proof-assistant construction of modular formalizations | modularity/reuse | different compiler/certificate object from Charon | Exact-object and union gates fail. |
| [LP-Tree time-dependent label-constrained paths](https://link.springer.com/article/10.1007/s41019-026-00345-x) | label-constrained, time-dependent shortest-path query index | parameter-separated two-hop indexing/query | query acceleration under temporal/label constraints | only one compatible current work found in primary-source search | No two-work tension, hence no residual-first union. |

## Full-cost requirement had a candidate survived

Any retained index/certificate/IR topic would have fixed construction/preprocessing, representation or certificate bytes, query/compile/check time, peak memory, update or invalidation work where applicable, and same-function/semantic validation. Because no union passed the action-space gate, no artificial baseline union or Stage A killer is declared.

