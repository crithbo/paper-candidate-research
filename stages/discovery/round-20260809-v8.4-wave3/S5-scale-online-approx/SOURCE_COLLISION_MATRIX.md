# Source / Collision Matrix — S5 O5 Wave 3

Search cut-off: 2026-08-09.  All retained sources are original papers or official publisher, conference, project, or upstream-library pages.

| Exact object / seed | Source | Relevant result | Collision status | Consequence |
|---|---|---|---|---|
| State-change-aware streaming statistics | Jayaram, Woodruff, and Zhou, [Streaming Algorithms with Few State Changes](https://arxiv.org/abs/2406.06821) | Establishes state changes as a complexity measure and gives near-optimal simultaneous state-change/space results for frequency moments, heavy hitters, sparse support recovery, and entropy. | `METHODOLOGICAL_ADJACENT` | Motivates, but does not validate, a quantile residual. |
| State-change-aware heavy hitters | Swartworth and Woodruff, [Finding Heavy-Hitters with Optimal State Changes](https://doi.org/10.1145/3767714) | Improves heavy-hitter state-change bounds and supplies near-matching lower-bound evidence. | `METHODOLOGICAL_ADJACENT` | Eliminates any claim that the generic write-aware streaming formulation is new. |
| Dynamic/sliding-window quantiles | Zhao et al., [KLL±: Approximate Quantile Sketches over Dynamic Datasets](https://www.vldb.org/pvldb/vol14/p1215-zhao.pdf) | Supports bounded deletions; explicitly describes a three-overlapping-block construction for fixed-size sliding windows. | `DIRECT_FATAL` | Generic dynamic or windowed quantile sketch cannot be proposed. |
| Deployable compact quantile sketch | Apache, [DataSketches KLL](https://datasketches.apache.org/docs/KLL/KLLSketch.html) and [KllSketch API](https://apache.github.io/datasketches-java/main/org/apache/datasketches/kll/KllSketch.html) | Current lazy-compaction implementation with stated rank-error behavior and multi-language upstream paths. | `DEPLOYMENT_BASELINE` | Required equal-contract baseline for any future quantile residual. |
| Relative-error / mergeable quantiles | Masson et al., [DDSketch](https://arxiv.org/abs/1908.10693) | Fully mergeable quantile sketch with relative-error guarantees. | `DEPLOYMENT_BASELINE` | Prevents an unfair KLL-only comparison. |
| Recent practical/theoretical quantile accuracy | [SplineSketch](https://arxiv.org/abs/2504.01206) | Dynamic subdivision with spline interpolation and error guarantees; reports real-data comparisons. | `DIRECT_SUBTRACT` | Any accuracy-only compactor change must subtract this route. |
| Online vector quantization | Zandieh et al., [TurboQuant](https://arxiv.org/abs/2504.19874) and [Google Research project](https://research.google/blog/turboquant-redefining-ai-efficiency-with-extreme-compression/) | Data-oblivious online quantization with near-optimal distortion; KV and nearest-neighbor evidence. | `DIRECT_FATAL` + `SCOPE_DUPLICATE` | A vector-search/KV route is both covered and excluded as a prior-wave object. |
| Quantization under streaming ANN updates | Aden-Ali et al., [Quantization for Vector Search under Streaming Updates](https://arxiv.org/abs/2512.18335) | Formal dynamic consistency and bounded disk IO per update for data-dependent quantization. | `DIRECT_FATAL` + `SCOPE_DUPLICATE` | Do not re-enter dynamic ANN through the quantization layer. |
| Quantized full-state tuning | Li et al., [QFT](https://openreview.net/forum?id=PcKjjZOnfc) | Quantizes weights, gradients, and optimizer states with an integer training path. | `DIRECT_FATAL` | Full-state low-bit representation already has a direct active mechanism. |
| Ultra-low-bit optimizer states | Yu et al., [2D Quantization for Ultra-low-bit Optimizers](https://openreview.net/forum?id=kJLRccGu9K) | 1.5/2-bit first-order optimizer-state representation. | `DIRECT_FATAL` | Do not propose a generic lower-bit optimizer state. |

## Non-union rule

KLL±, Apache KLL, DDSketch, and SplineSketch form a frozen fair baseline set because they preserve the quantile object under distinct accuracy/update/merge constraints.  They are not invoked as an infeasible universal union.  Exact window quantiles are an offline ceiling only.

