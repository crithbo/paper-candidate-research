# Source103 S6 RQ Candidate and Question-Card Log

All source actions below occurred after the frozen offline seed pool. Sources are public first-party code/docs or identified academic papers; no download, group-repository read, build, or experiment was performed.

| RQ ID | Seed | Frozen anchor / source role | Primary RQ | Front-end disposition | Reason |
|---|---|---|---|---|---|
| S6-103-RQ01 | 01 | [CUTLASS efficient GEMM](https://github.com/NVIDIA/cutlass/blob/main/media/docs/cpp/efficient_gemm.md) and current low-precision examples / `CURRENT` | For one public low-bit lowering, can a tail-partition algorithm preserve exact operator semantics while beating current tiled dispatch on a natural tail distribution after packing, conversion, and launch cost? | `LOCATOR_ONLY__NOT_ADMITTED_UNFROZEN` | CUTLASS establishes configurable hierarchical tiles and dynamic problem dimensions, but this bounded search did not freeze one exact W4A16 carrier, native tail action, or finite same-object comparator grid. No implementation-absence claim is made. |
| S6-103-RQ02 | 02 | [LP-GEMM](https://arxiv.org/abs/2604.04599) / `CONTRARY`; public serving runtime remains to be fixed | For a fixed low-bit GEMM-to-GEMV runtime chain, is there a semantics-preserving layout action not already covered by layout propagation across sequential GEMMs? | `LOCATOR_ONLY__DIRECT_SUBTRACT_REQUIRED` | LP-GEMM is a strong named subtractor because it claims packing-layout propagation across sequential GEMMs with BLAS-boundary semantics. The selected seed does not yet establish a distinct low-bit GEMM-to-GEMV atomic action, information condition, or cost boundary. |
| S6-103-RQ03 | 04 | [Triton matmul tutorial](https://github.com/triton-lang/triton/blob/main/python/tutorials/03-matrix-multiplication.py) / `CURRENT` | Does one public compiler lowering expose a target-specific bounded tile/layout search with a non-generic guarantee rather than a tuner/solver wrapper? | `EXCLUDED_BEFORE_RAW__GENERIC_SOLVER_RISK` | The seed has no frozen compiler-native residual beyond generic tile grouping and cost selection. It fails the non-generic discriminator before raw admission. |
| S6-103-RQ04 | 07 | [vLLM kernel configuration](https://github.com/vllm-project/vllm/blob/main/vllm/config/kernel.py) / `CURRENT` | Does a current native low-bit backend selector omit a full-cost no-gain decision that can be made as a new target-specific algorithm? | `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_SELECTOR_COVERS_PROBLEM_CLASS` | The current config defines `linear_backend=auto` and enumerates multiple quantized linear backends. Without a distinct frozen action and guarantee, a no-gain classifier would relabel existing backend selection. |
| S6-103-RQ05 | 08 | [TileFuse](https://arxiv.org/abs/2606.11357) / `CONTRARY`; group repository only as non-evidence alignment | Can a public compiler IR/cost model choose a GPU–NDP data-movement cut with an exact GPU-only baseline and explicit fallback, while making only model-level claims? | `LOCATOR_ONLY__NO_EXACT_PUBLIC_OBJECT` | TileFuse is adjacent NPU evidence, not a same-object public compiler-IR carrier. The seed lacks a frozen IR, cost-model inputs, and finite same-object GPU/NDP model route; it cannot enter raw. |

## Question-card gate summary

- Exact public identity plus same-object contract: incomplete for RQ01, RQ02, RQ05.
- Non-generic discriminator: failed for RQ03; current-native selector absorption for RQ04.
- Current-upstream reality check: no candidate claims an implementation absence, so no absence assertion was made.
- Raw admitted: `0`.
- Bounded queues created: `0`; no route was declared exhausted due to resource failure.
- Strongest contrary evidence consulted: LP-GEMM for sequential layout propagation; vLLM current backend selection; CUTLASS tiled/dynamic-layout mechanisms.

## Evidence boundary

The cited papers/code are locator or contrary evidence only. Search absence is not a novelty conclusion, and no resource, performance, hardware, or main-result claim is made.
