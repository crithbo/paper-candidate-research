# CUDA/GPU Discovery batch 20260802-07

Date: 2026-08-02. Scope: publicly reproducible CUDA/GPU software stacks only.

## Outcome

| ID | Decision | Rationale |
|---|---|---|
| GPU-GDS-COFLOW | `PROPOSE_STAGE0` | A narrow, falsifiable coflow decision remains after subtracting GDS batching/stream APIs and cuDF's existing decoder choices. |
| GPU-AUTOTUNE-AMORT | `DROP` | TensorRT selection caches, PyTorch dynamic shapes, and Triton autotuning leave only ordinary cache/admission tuning. |
| GPU-FP8-PHASE | `DROP` | Repeats the active GPU-MXSCALEFLOW cross-operator scale/metadata-flow object. |
| GPU-UVMPHASE | `DROP` | Repeats the history-closed generic UVM migration/prefetch scheduling core. |
| GPU-CUDAGRAPH-ADMIT | `DROP` | Repeats the history-closed graph/conditional-buffer admission and lifetime core. |

Only GPU-GDS-COFLOW is recommended for Stage 0. Its novelty remains `SEARCH_BOUNDED_OPEN`; no performance result or paper-level novelty closure is claimed.

## Cross-topic source integrity

All factual artifact assertions are limited to the official NVIDIA GDS documentation, RAPIDS cuDF source/docs, and official PyTorch/Triton documentation listed in each `source_log.md`. Search completed on 2026-08-02. No source was treated as proof of an unreviewed mechanism claim.

AI assisted this source audit and brief drafting; it did not run a GPU experiment.
