# Current-upstream and collision audit

Audit date: 2026-08-22. Scope is bounded to the single frozen release/path.

## Source pin and reality check

| Role | Official/primary source | Finding |
|---|---|---|
| Release/tag | https://github.com/vllm-project/vllm/releases | Official v0.26.0 release identifies commit prefix `568afb3`; tag-pinned source was inspected directly. A read-only `git ls-remote` attempt failed at Windows Schannel credential acquisition, but the release/tag path itself is accessible. No scientific inference is made from that transport failure. |
| Native action | https://github.com/vllm-project/vllm/blob/v0.26.0/vllm/model_executor/kernels/linear/mixed_precision/triton_w4a16.py | `process_weights_after_loading` documents checkpoint and kernel layouts, then implements unpack → transpose → repack of W4 values, a scale transform, and an explicit zero-point expected/transposed layout branch. |
| Native consumer | Same tag-pinned file | Stock GEMM requires `b_q [K,N/8]`, `scales [K/G,N]`, and optional `qzeros [K/G,N/8]`; it specifies GPTQ nibble shifts, maps `g_idx`, and clamps `BLOCK_K` to prevent cross-group dequantization. |
| Generic semantic subtractor | https://mlir.llvm.org/docs/Dialects/QuantDialect/ | MLIR Quant describes blockwise scales/zero-points and shape compatibility, but is not evidence that vLLM's custom physical W4 packing is represented in MLIR. |

## Default/non-default / action union

The path's eligibility gate rejects unsupported platform/type, non-fp16/bf16
activations, `N % 8 != 0`, activation reordering (`g_idx`), unsupported group
sizes, and `K % group_size != 0`. Its distinct native branches include symmetric
`uint4b8` (constant bias/no zero tensor), asymmetric explicit qzeros, already
kernel-layout qzeros, and transposed compressed-tensors qzeros. These are the
relevant visible action/config modes for the frozen path.

## Direct-absorption analysis

The proposed atomic action was to propagate/check the packed contract across
each transform and dispatch. The source's native union already owns the
nontrivial physical action: it changes which dimension is packed, explicitly
unpacks/reorders/re-packs values, transforms scales/zero-points, and feeds the
kernel whose nibble/group interpretation is declared. A proposed extra relation
checker neither supplies a different whole constructor nor changes the stock
consumer's semantics. It is therefore a prohibited checker/wrapper residual,
not merely an unclosed current-absence claim.

## Collision search ceiling

A bounded primary/official search found no exact paper claiming this same
vLLM-v0.26.0 loader-to-Triton refinement checker. That is recorded as
`SEARCH_BOUNDED_OPEN`, not novelty. It cannot rescue the topic because direct
native absorption supplies the decisive exclusion.

## Evidence references

- vLLM release v0.26.0: official release page, accessed 2026-08-22.
- vLLM `triton_w4a16.py` at v0.26.0: source regions covering `can_implement`,
  `process_weights_after_loading`, and `triton_w4a16_gemm`, accessed 2026-08-22.
- MLIR Quant Dialect: official documentation, accessed 2026-08-22.

