# Source collision / action-space matrix

| First-party source | Exact object | Contribution action | Current strongest-union assessment | Verdict |
|---|---|---|---|---|
| [VTC: DNN Compilation with Virtual Tensors](https://www.usenix.org/conference/osdi26/presentation/hu-muyan) | DNN compiler data-movement graph, same tensor semantics | virtual tensors with index mappings plus profitable creation strategy | Expresses cross-operator data-motion elimination; composing with layout/fusion is within its intended interoperability. | `DIRECT_SUBTRACT_TO_ZERO` |
| [GOODPUT](https://www.usenix.org/conference/nsdi26/presentation/wang-yu) | heterogeneous WLAN configuration | MILP for channel/AP/station decisions | A full configuration controller/solver. | `DROP__CONTROLLER` |
| [CLONE](https://www.usenix.org/conference/atc25/presentation/tian) | edge LLM deployment | model/system energy-latency co-design | No reproducible same-object CPU/formal union route established. | `DROP__NO_FINITE_FIDELITY_CLOSURE` |
| [Reusing Highly Optimized IR in Dynamic Compilation](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.25) | GraalVM dynamic compilation | optimized IR cache/reuse | Prior-screened; retrieval/reuse selection remains excluded. | `EXCLUDED` |

## v8.7 reality check

VTC’s official OSDI source defines the virtual-tensor representation and creation algorithm as the current contribution, which is contrary evidence against a claim that existing mechanisms cannot express joint data-motion elimination. No retained brief follows.

