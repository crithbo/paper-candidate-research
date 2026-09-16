# Current-upstream and collision audit

## Frozen source reality check

**Anchor.** vLLM official release `v0.26.0` identifies commit `568afb3`.
The review uses the official tag pages rather than an unpinned main branch.

**Producer and format union.**

| Layer | Official source evidence | Relevant current action / constraint |
|---|---|---|
| WNA16 scheme | `compressed_tensors_wNa16.py` at `v0.26.0` | Records `group_size`, quant type, symmetric/asymmetric zero-point form and optional `g_idx`; builds packed weights and per-group scale/zero tensors; chooses an MP linear backend. |
| Kernel admission | `triton_w4a16.py` at `v0.26.0` | Allows only specified quant/activation types, packed-N divisible by eight, no activation reordering, supported group sizes (including 128), and `K % effective_group_size == 0`. |
| Kernel schedule | same file | Picks source tile shapes as a function of `M`/platform; the frozen `G=128` path uses a K-tile no larger than 32 before any clamp. |
| Metadata mapping | same file | Uses `g_idx=(k_start * BLOCK_K)//group_size`, then one matching scale row and optional zero row for that K tile. |
| Guard / repair | same file | If `group_size < BLOCK_K`, assigns `BLOCK_K=group_size`; source comment identifies incorrect cross-group scale use as the prevented failure mode. |
| Loading / layout | same file plus scheme | Transposes/re-packs the source checkpoint layout so the kernel consumes `[K,N/8]`, `[K/G,N]`, and optional `[K/G,N/8]` metadata. |

No default or nondefault application flag changes the above invariant.  The
relevant nondefault/configurational inputs are quant type, `group_size`,
symmetry/zero points, activation ordering, K/N partition shape, and target
platform.  The frozen `G=128`, no-`g_idx`, divisible-K object is accepted.

## Direct coverage matrix

| Predicate | Candidate guard/repair | vLLM v0.26.0 source | Result |
|---|---|---|---|
| Same object | fixed grouped W4A16 GEMV | fixed grouped W4A16 GEMV | PASS |
| Same information | K-tile start, G, scales/zeros, layout | same | PASS |
| Atomic action | prevent one-scale-row cross-group tile | `BLOCK_K` clamp plus one-group tile mapping | PASS |
| Legality / guarantee | every weight uses its logical group metadata | K divisibility, one `g_idx` tile and clamp enforce it | PASS |
| Cost boundary | a guard must count compile/code/runtime effects | source guard is constant-time scheduling/configuration; no candidate delta survives | PASS for absorption |

## Action-divergence analysis

The minimal trace admits two same-output *legal* tile granularities (`32` and
`128`) for `G=128`; both preserve one metadata group per tile.  Selecting
between them is ordinary tile tuning.  The only purported divergent case,
`BLOCK_K=256` with one `g_idx`, is already identified by the source as invalid
and is repaired by the current clamp where applicable.  A new multi-group-per-
tile dequantization kernel would be a different action/algorithm, not the
frozen guard/repair claim; no target-specific non-generic guarantee was found
for it in the bounded review.

## External subtractors and contrary evidence

* MLIR Quant documentation defines blockwise semantics through the exact
  per-element/block index relationship, and its verifier sources enforce the
  shape/divisibility side of that relation.  It is a semantic baseline, not a
  surviving vLLM action gap.
* CAKE provides a typed, hardware-explicit schedule representation and schedule
  verification/cost framework.  It is methodological adjacency; it does not
  rescue a native action already enforced by the exact vLLM producer.
* Recent vLLM issue reports about W4A16 shape/TP failures were used only as
  locators/contrary checks.  They are not evidence of a residual in this exact
  frozen `G=128` single-linear-kernel object.

## Collision disposition

`DIRECT_FATAL__CURRENT_UNION_ABSORPTION`.

The current tagged source itself covers the proposed action and its same-object
correctness endpoint.  No absence claim is made, and no incomplete external
paper search is being treated as proof of nonexistence.

## Bounded evidence references

1. https://github.com/vllm-project/vllm/releases/tag/v0.26.0
2. https://github.com/vllm-project/vllm/blob/v0.26.0/vllm/model_executor/kernels/linear/mixed_precision/triton_w4a16.py
3. https://github.com/vllm-project/vllm/blob/v0.26.0/vllm/model_executor/layers/quantization/compressed_tensors/schemes/compressed_tensors_wNa16.py
4. https://mlir.llvm.org/docs/Dialects/QuantDialect/
5. https://arxiv.org/abs/2608.12629
