# Source / collision / action-space matrix — WAVE34

## Upstream reality record

| Lead | Frozen upstream facet | Official current sources and symbols | Default / non-default surface checked | Contrary evidence | Disposition |
|---|---|---|---|---|---|
| UST | nvmath-python `1.0.0` docs, checked 2026-08-10 | `nvmath.sparse.ust.Tensor(extents, tensor_format=...)`; `Tensor.from_package`, `from_file`, `convert`; `TensorFormat`; `nvmath.sparse.Matmul.plan/execute` | DSL level formats (`dense`, `batch`, `range`, `compressed`, `singleton`, `delta`) and named formats; dynamic parsing/inspection; library vs codegen dispatch; Matmul planning | UST explicitly has flexible runtime format creation and dispatch; this is a strong whole-tensor baseline. The public docs nevertheless bind each `Tensor` to one `TensorFormat` and expose no documented segmented heterogeneous-format constructor. | A narrowly stated action gap survives only for the joint cover; do not claim a generic format-selection gap. Stage A must re-check actual pinned source/API and any hidden/experimental path. |
| Triton | upstream `main`, checked 2026-08-10; public release series includes 3.7.x | `third_party/nvidia/backend/compiler.py`: `CUDAOptions(num_warps, num_ctas, num_stages, maxnreg, ir_override)`; compiler passes include layout conversion, coalescing, latency assignment, loop scheduling, pipeline/warp specialization | defaults `4/1/3`; non-default keyword options; `triton.autotune(configs, key, ...)`, configs, pruning, cache | Compiler owns the scheduling/layout primitive surface; autotune explicitly benchmarks configurations on keys. | Any discovered rule merely choosing config/layout/stage belongs to tuning/selection. No union-external atomic action was isolated. |
| NCCL | release `2.30.7` listed by NVIDIA; `master` inspected 2026-08-10 | `src/init.cc`, topology and tuner integration; generated device variants for collective/reduction/type/algorithm/protocol | topology detection, algorithm/protocol/chunk/CTA/cost/dynamic scheduler; tuner-plugin path and documented launch/order/network controls | Native tuner/plugin can override choices; dynamic scheduler has richer runtime state than a static rule. | A policy over these knobs is controller absorption. A proposed application-level global scheduler changes the object unless it supplies a fixed collective-graph construction and natural verifier route; none was found. |

## Six-facet candidate-grade subtraction

| Facet | UST segmented-format cover | Triton residual considered | NCCL residual considered |
|---|---|---|---|
| Exact object / function | One fixed sparse matrix `A` and dense right-hand-side sequence `B_1…B_R`; produce the same `C_r=A×B_r` under a frozen numerical contract. Row ownership of `C` is disjoint. | A fixed Triton kernel and its outputs. | A fixed sequence of application collective calls and their protocol-visible semantics. |
| Decision rule | Jointly select at most `K` contiguous row intervals, one native format per interval, boundary directory, and reuse-aware execution/conversion plan. | Select `num_warps`/`num_stages`/layout/pipeline/IR variant. | Select topology/algorithm/protocol/chunk/CTA or plugin policy. |
| Information condition | Static `A` structure (row nnz, span, diagonal/run and block-density summaries), known `R`, B shape/dtype and a declared memory budget; no timing oracle. | Kernel shape/layout and compile options; autotune may additionally benchmark candidates. | Communicator/topology/message/concurrency/runtime state exposed to NCCL and plugin. |
| Complexity / resource | Bounded dynamic program over permitted row boundaries/formats, plus explicit directory, conversion, plan/setup, launches and output placement. Must remain within the same device-memory budget as baseline. | Existing compiler optimization plus finite config grid; candidate adds only a chooser. | Existing cost model/dynamic scheduler/plugin; candidate adds only a policy layer. |
| Quality / guarantee | Preserve sparse coordinates/values and every output row; prove feasibility and optimize a frozen additive full-cost estimator exactly/with stated approximation. Empirical claim remains conditional. | Same output, but no new quality guarantee beyond an existing config choice. | Same collective result, but a policy cannot add a same-object guarantee beyond native control without changing scheduling object. |
| Full-cost | CSR ingestion or format conversion, segment directory bytes, all plans/setup, every launch, temporary/output bytes, and amortization over `R`; report cold and warm separately. | Compilation/tuning trials, cache, code size, launch and runtime; ordinary tuning must be charged. | Initialization/topology discovery, plugin/controller overhead, grouping/order changes, and communication time. |
| Generalization / no-gain | Hypothesis: heterogeneous row-local structure is stable enough that a bounded cover can beat every single global format after amortization. No-gain: homogeneous matrices, `R=1`, too many boundaries, or one global format already dominates. | No distinct generalization claim after subtraction; it is configuration tuning. | No distinct same-object claim after subtraction; it is controller behavior or a changed application schedule. |

## Retained action-gap certificate: `UST-SEGMENTED-FORMAT-COVER`

| Certificate item | Frozen statement |
|---|---|
| Baseline union | One UST `Tensor` with one `TensorFormat`; all documented level/named formats, dynamic parsing/inspection, `Tensor.convert`, library/codegen dispatch, and `Matmul.plan/execute`; direct CSR/CSC/BSR/DIA paths where semantically compatible. |
| Complete union-external atomic action | Construct `{(row interval I_j, UST format f_j)}_{j≤K}` plus a boundary directory and a reuse-aware conversion/plan/execution schedule. Execute every segment over the same `B_r` and place its disjoint output rows in the same `C_r`. This is not "pick f for A". |
| Why same action is not assumed absorbed | The public current tensor API documents a single `tensor_format` object bound to a `Tensor`, while the candidate's action creates a *set* of tensor fragments with different formats and jointly optimizes boundaries, format assignments, feasibility and amortization. The claim is conditional on the current-source re-check; a native constructor that expresses this complete action is a direct subtractor. |
| Information and budget fairness | The candidate sees only static structure/declared reuse/budget also available before UST planning. It cannot use post-hoc timings; it is charged conversion, metadata, planning, launches, memory and output assembly. |
| Direct subtractors | (1) a native segmented/mixed-format UST object with equivalent joint construction; (2) a same-information whole-matrix system that enumerates partitions/formats and charges the same costs; (3) prior work with the same SpMM object, joint construction and guarantee. |
| Finite counterfactual | If the pinned source/API offers (1), or any direct subtractor exists, drop or shrink to its unabsorbed component. If exact-output and full-cost closure cannot be obtained on the finite natural route, drop; do not substitute a synthetic-only proxy. |

## Collision classification

| Lead | Classification | Reason |
|---|---|---|
| UST | `DIRECT_SUBTRACT` + bounded `SEARCH_BOUNDED_OPEN` | Format polymorphism/codegen subtracts single-format selection. The remaining joint segmented construction is candidate-grade but must be independently collision-checked in Stage 0. |
| Triton | `DIRECT_FATAL` for the examined residual | Identical decision variables are compiler configs/tuning; no separate atomic method survived. |
| NCCL | `DIRECT_FATAL` for the examined residual | Identical decision variables are native scheduling/tuner controls; any proposal remaining is a prohibited controller or changes object. |
