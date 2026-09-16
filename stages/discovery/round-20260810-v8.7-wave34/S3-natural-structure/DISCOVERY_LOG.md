# Discovery log — WAVE34 ALGORITHMIC RESIDUAL

- Assignment: `DISCOVERY-S3-20260810-V8.7-WAVE34-ALGORITHMIC-RESIDUAL`
- Lens: `S3-natural-structure / O3`
- Frozen cutoff: `2026-08-10`
- Method: accepted production `v2/v8.1`, v8.6 fidelity-plan admission, v8.7 current-upstream reality check. This is **not** a v8.8 method/backtest activity.
- Scope: candidate-grade re-audit of Wave30's non-terminal UST, Triton, and NCCL leads. Wave30 itself is not altered.
- Execution: literature/source inspection only; no download, experiment, benchmark, or Stage0/A/B creation.

## Decision discipline corrected in this wave

An upstream action, flag, configuration, dispatcher, or plugin is a deployment baseline, not automatic absorption. Absorption requires that the baseline can replay the candidate's **complete atomic construction** under the same information, budget, semantics/quality contract, and full-cost denominator. Conversely, a proposal is dropped when its only remaining action is ordinary tuning, a selector/controller/wrapper, changed object, or has no finite fidelity route.

## Three re-audited leads

| Lead | Natural structure and same-object opening | Candidate-grade residual after six-facet comparison | Result |
|---|---|---|---|
| UST sparse SpMM | Natural sparse matrices can contain contiguous row regions with materially different row-span, run/diagonal, and block-density signatures. A current UST `Tensor` binds one `TensorFormat`; the public format grammar maps one tensor's dimensions to storage levels. | A bounded **row-segment cover plus amortization gate** constructs a heterogeneous representation and execution plan, not a selection of one existing full-tensor format. It remains outside the documented single-`TensorFormat` action only if the Stage A source/API check confirms no native segmented heterogeneous tensor constructor. | `PROPOSE_STAGE0` — `TIER_B_Q2_VIABLE`, conditional on direct-collision review and fidelity closure. |
| Triton kernel compilation | Public kernel/tutorial corpus has shape/layout/pipeline variation, but current compiler has layout transforms, scheduling/pipeline passes and exposes `num_warps`, `num_ctas`, `num_stages`, `maxnreg`, IR override; `triton.autotune` evaluates config grids. | The plausible residuals examined reduce either to choosing these knobs/IR variants or to wrapping the compiler with an external chooser. No independently frozen same-object action with a different information/quality/complexity contract was found. | `DROP__ORDINARY_TUNING_OR_SELECTOR`; no brief. |
| NCCL collectives | Natural training communication traces have collective/topology/message distributions. NCCL already uses topology/cost/dynamic scheduling and supports algorithm/protocol/chunk/CTA decisions plus tuner plugins. | The examined residual is a policy choosing native per-collective actions; a plugin/global chooser remains a controller. No fixed same-object joint construction with natural public carrier and a finite verifier route was identified without changing the application schedule/object. | `DROP__CONTROLLER_OR_CHANGED_OBJECT`; no brief. |

## Sources and frozen current reality

1. NVIDIA, [UST ecosystem announcement (2026-01-30)](https://developer.nvidia.com/blog/establishing-a-scalable-sparse-ecosystem-with-the-universal-sparse-tensor/): format inspection and library/codegen dispatch are genuine strong baselines.
2. NVIDIA, [nvmath-python 1.0.0 sparse/UST documentation](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/index.html): current public DSL grammar, dynamic construction, and supported level formats.
3. NVIDIA, [current `Tensor` API documentation](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.ust.Tensor.html): a tensor is bound to a `TensorFormat`; construction routes are `from_package`, `from_file`, and `convert`.
4. NVIDIA, [current UST `Matmul` API](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.Matmul-class.html): real plan/execute comparator semantics.
5. Triton upstream [`compiler.py` at `main`](https://github.com/triton-lang/triton/blob/main/third_party/nvidia/backend/compiler.py) and [current `triton.autotune` documentation](https://triton-lang.org/main/python-api/generated/triton.autotune.html): native optimization/configuration surface and tuning behavior.
6. NVIDIA, [NCCL tuning guide](https://developer.nvidia.com/blog/understanding-nccl-tuning-to-accelerate-gpu-to-gpu-communication/), [NCCL master `init.cc`](https://github.com/NVIDIA/nccl/blob/master/src/init.cc), and [official release index](https://developer.nvidia.com/nccl/nccl-download) (current listed release `2.30.7`): baseline action/configuration surface.
7. Kjolstad et al., [The Tensor Algebra Compiler (OOPSLA 2017)](https://dl.acm.org/doi/10.1145/3133901), and Gao et al., [OpSparse (ICS 2022)](https://arxiv.org/abs/2206.07244): sparse-format/codegen genealogy and competing implementation family.

## Search boundary and honesty

The review used the primary sources above and did not run their artifacts. `SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion. The retained UST brief makes a bounded current-API action-gap claim and provides a source/API falsifier; it does not assert that no prior segmented-format research exists or that performance is already positive.
