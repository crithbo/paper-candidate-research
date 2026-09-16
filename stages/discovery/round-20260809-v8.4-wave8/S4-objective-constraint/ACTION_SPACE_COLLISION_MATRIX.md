# Action-space / collision matrix

| Source | Exact object | Actions and constraints | Fair strongest union | Residual verdict |
|---|---|---|---|---|
| [Succinct Dynamic Rank/Select](https://arxiv.org/abs/2510.19175) | dynamic ordered dictionary over a universe; insert/delete/rank/select | compressed tabulation-weighted treap; near-optimal redundancy and operation time, assuming a static table | Cannot fairly union with a bitvector without changing the object from a set dictionary to a binary sequence. | `DROP__SAME_OBJECT_FAILURE` |
| [Worst-case Optimal Adaptive Dynamic Bitvectors](https://doi.org/10.1007/s00224-025-10229-8) | dynamic bitvector; access/rank/select with updates | adaptive representation parameterized by queries per update; succinct space and query/update complexity | No common operation/guarantee/full-cost contract with the ordered-dictionary source. | `DROP__UNION_UNDEFINED` |
| [RadixGraph](https://arxiv.org/abs/2601.01444) | dynamic graph storage with concurrent updates and analytics | radix vertex index plus snapshot-log edge store; memory and ingest/update performance | Only one compatible current action family was verified. | `DROP__TWO_WORK_GATE_FAIL` |
| [Tiny Pointer Hash Tables](https://arxiv.org/abs/2607.28892) | dynamic 64-bit key/value hash table | chained design for space, flattened design for common-case cache-miss latency | A runtime policy choosing chained vs flattened is a forbidden selector; a fixed combination is already its own representation design, not a cross-paper residual. | `DROP__SELECTOR_AND_DIRECT_SUBTRACT` |

## Full-cost / killer note

Were a candidate admissible, its union would include build/resize/update work, bytes (including static tables and logs), query latency/throughput, peak memory, concurrency semantics, and natural trace corpus. Since no fair same-object union exists, fabricating a 20–50-instance Stage A killer would be invalid.

