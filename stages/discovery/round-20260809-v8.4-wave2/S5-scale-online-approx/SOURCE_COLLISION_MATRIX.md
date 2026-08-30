# Source / Collision Matrix — S5 O5 Wave 2

Search cut-off: 2026-08-09.  Entries are primary papers or official conference, publisher, institutional, or project pages.  They are retained as reproducible genealogy/collision evidence, not treated as candidate briefs.

| Object family | Source | Mechanism relevant to the putative residual | Classification | Discovery consequence |
|---|---|---|---|---|
| Edge LLM latency/energy co-design | Tian et al., [CLONE, USENIX ATC 2025](https://www.usenix.org/conference/atc25/presentation/tian) | Model- and system-level co-design on off-the-shelf edge platforms for latency, energy, and generation quality. | `DIRECT_FATAL` | Generic edge budgeted quantization/co-design is covered. |
| Edge LLM neuron sparsity | Kabakibo et al., [PartInfer](https://openreview.net/forum?id=3sbM94O8Ts) | Offline identification plus runtime partial neuron computation and loading. | `DIRECT_FATAL` | Per-request active-neuron approximation is covered in mechanism class. |
| Flash-based edge LLM inference | Zhao et al., [LLM Inference in a Flash!](https://openreview.net/forum?id=gSphYexssc) | Integer-only inference plus dictionary-based dynamic KV compression for flash compute. | `DIRECT_SUBTRACT` | Hardware-specific execution is adjacent but leaves no frozen CPU/solver residual in this batch. |
| Local-PC long-context KV execution | Zheng et al., [SolidAttention, FAST 2026](https://www.usenix.org/conference/fast26/presentation/zheng) | Dynamic attention sparsity, coarse KV blocks, speculative prefetch, and compute/IO co-design. | `DIRECT_FATAL` | SSD/KV sparsity formulation is covered. |
| Online sparse attention via permutation | [S2O: Early Stopping for Sparse Attention via Online Permutation](https://openreview.net/forum?id=Q6BPf4Z5ht) | Index-guided discrete loading of non-contiguous high-priority blocks. | `DIRECT_FATAL` | Online token/block selection is not a novel residual. |
| Test-time adaptive attention ratio | Tang et al., [Elastic Attention, ICML 2026](https://openreview.net/forum?id=rLO2NTUHSW) | Input-adaptive sparse/full attention ratio. | `DIRECT_FATAL` | Adaptive sparsity-budget framing is covered. |
| Training-free online attention filtering | [SpargeAttn](https://openreview.net/forum?id=UZggtUfsJV) | Online attention-map and softmax-aware filters. | `DIRECT_FATAL` | Filter-and-skip routes are already occupied and are wrapper-like for this lane. |
| Fully dynamic graph-stream triangle counts | Xuan et al., [DTC](https://arxiv.org/abs/2508.19057) | Distributed one-pass algorithms for global/local triangle counting with insertions and deletions; source code and datasets declared. | `DIRECT_FATAL` | Do not propose generic fully dynamic triangle sampling. |
| Hypergraph stream triangles under memory cap | [HTCount, PACMMOD 2025](https://doi.org/10.1145/3769837) | Reservoir sampling that adjusts sample size to available memory under variable hyperedge sizes. | `DIRECT_FATAL` | Memory-budgeted streaming motif counter is covered. |
| Directed densest subgraph in semi-streaming | Mitrović et al., [New Parallel and Streaming Algorithms for Directed Densest Subgraph](https://arxiv.org/abs/2509.21729) | Deterministic single-pass semi-streaming and insertion-only dynamic approximation. | `DIRECT_SUBTRACT` | Streaming scale is advanced, but no tested residual with a same-object online baseline was found. |
| Fully dynamic directed densest subgraph | Li & Quanrud, [Approximate Fully Dynamic Directed Densest Subgraph](https://arxiv.org/abs/2312.07827) | Near-optimal fully dynamic approximation/update-time trade-off. | `DIRECT_FATAL` | A generic update/deletion extension is covered. |
| Sparse delta LLM model storage | Wang et al., [ZipLLM, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/wang-zirui) | Family clustering, tensor-level deduplication, and structured sparse delta compression over public model hubs. | `DIRECT_FATAL` | Do not propose model-family delta compression or deduplication as a new sparse data structure. |

## Competing-mechanism comparison

| Proposed-looking mechanism class | Current strongest same-object mechanism | Why no residual remains |
|---|---|---|
| Dynamic precision/active-neuron choice on edge | CLONE + PartInfer | Both the global co-design and local activation-level action are covered; a budget policy is a controller, not N1/N2. |
| Dynamic KV retention/retrieval on SSD | SolidAttention | It already joins approximate selection with storage layout, prefetch, and synchronization cost. |
| Online sparse attention selection | S2O + Elastic Attention + SpargeAttn | Permutation, ratio adaptation, and online filtering collectively cover the obvious decision variables.  They are not a forbidden union baseline; each independently makes the proposed residual non-distinct. |
| Bounded-memory dynamic graph motif estimation | DTC + HTCount | Fully dynamic updates and memory-variable sampling are separately and directly handled. |
| Sparse model-hub representation | ZipLLM | Exact data object, natural corpus, and compression representation are directly addressed. |

