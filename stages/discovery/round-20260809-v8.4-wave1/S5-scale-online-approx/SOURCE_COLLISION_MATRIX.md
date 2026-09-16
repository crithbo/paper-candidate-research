# Source Collision Matrix — S5 O5 Wave 1

Search cut-off: 2026-08-09.  Every retained entry below is a first-party paper, publisher, conference, or author/institutional project page.  Sources are collision evidence, not an assertion that the source itself is a candidate.

| Object / seed | Primary source | What it establishes | Collision class | Consequence |
|---|---|---|---|---|
| Mutable ANN under dynamic and skewed access/update workloads | Mohoney et al., [Quake: Adaptive Indexing for Vector Search, OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/mohoney) | Multi-level partitioning, workload/update adaptation, latency/recall control, and stated comparisons to SVS, DiskANN, HNSW, and ScaNN. | `DIRECT_FATAL` | Do not propose generic adaptive mutable ANN. |
| Billion-scale on-disk ANN insert stability | Guo & Lu, [OdinANN, FAST 2026](https://www.usenix.org/conference/fast26/presentation/guo) | Direct insert specifically addresses search-performance instability while inserts arrive. | `DIRECT_FATAL` | Update-stability reframing is already occupied. |
| Disaggregated, multi-precision vector retrieval | Yin et al., [DistVS, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/yin) | Low/high/full precision progression across compute, memory, and SSD with an explicit retrieval algorithm. | `DIRECT_FATAL` | Resource-tier approximation alone is not a new object. |
| Billion-scale GPU graph ANN dependency overlap | Zhao et al., [FlowANN, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/zhao) | Exploits discovery–expansion windows, deferred edge fetch, and CPU/GPU tiering without losing accuracy. | `DIRECT_FATAL` | GPU-side scale/overlap variant is also occupied. |
| Approximate aggregate-query maintenance under updates | Dai & Yi, [Approximate Query Processing under Updates, PACMMOD 2025](https://doi.org/10.1145/3769760) | Approximate maintenance for free-connex aggregation queries under insertion and fully dynamic sequences, with error guarantee and exact baselines. | `DIRECT_FATAL` | Do not relabel dynamic AQP as a scale/online novelty. |
| Online physical-index choice with drift and limited feedback | Wu et al., [UTune: Towards Uncertainty-Aware Online Index Tuning, ICDE 2026](https://www.microsoft.com/en-us/research/publication/utune-towards-uncertainty-aware-online-index-tuning/) | Operator-level learned models, uncertainty-aware exploration, and workload-drift evaluation for online index selection. | `DIRECT_FATAL` | Any “budget-aware online index tuner” needs a distinct non-controller core; none found. |
| Oracle-budgeted approximate AI workflow evaluation | Wang et al., [Query-Centric Optimization of AI Workflows via Approximate Query Processing and Proxy Models](https://arxiv.org/abs/2607.00254) | Online aggregation with confidence stopping and proxy filtering for LLM workflows. | `DIRECT_FATAL` + `POLICY_EXCLUDE` | Direct route is a wrapper/proxy/controller-style mechanism. |
| Sparse-attention indexer/Top-K under memory pressure | Yin et al., [LiteTopK](https://arxiv.org/abs/2607.11976) | Online sampling and binning to reduce memory/I/O while preserving exact Top-K. | `DIRECT_FATAL` | Do not claim this kernel-level scale/approximation route. |
| Data-lake augmentation seed | Cappuzzo et al., [Retrieve, Merge, Predict: Augmenting Tables with Data Lakes, TMLR 2025](https://openreview.net/forum?id=4uPJN6yfY1) | Natural Open Data US lake and YADL benchmark; isolates retrieval, merge, and prediction. | `INSUFFICIENT_GROUNDEDNESS` | A promising domain, but no verified online same-object algorithmic gap or non-wrapper structure in this batch. |

## Calibration sources (not collision grounds)

- Hellerstein, Haas, and Wang, [Online Aggregation (SIGMOD 1997)](https://doi.org/10.1145/253260.253291): historical online-estimation anchor only.
- Auncel, [Fast, Approximate Vector Queries on a Large-Scale Data Set (NSDI 2023)](https://www.usenix.org/conference/nsdi23/presentation/zhang-zili): historical quality/latency guarantee anchor only.

## Collision decision rule

A row is `DIRECT_FATAL` when the current source already operates on the same object, quality function, and information condition while supplying the candidate mechanism class.  A source is not used to infer novelty merely because it is older or because it reports a different hardware configuration.  In particular, GPU architectural names are not treated as interchangeable objects.

