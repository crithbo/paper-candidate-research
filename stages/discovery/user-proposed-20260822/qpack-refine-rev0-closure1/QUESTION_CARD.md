# Canonical Question Card — QPACK-REFINE-REV0

| Field | Frozen value |
|---|---|
| Opportunity family | `QPACK_REFINE__VLLM_W4A16_LOADER_KERNEL_SEMANTIC_CHECK` |
| Exact object | One vLLM v0.26.0 compressed-tensors W4A16 linear-layer checkpoint representation through the stock loader/repack to `TritonW4A16LinearKernel`. |
| Same-function endpoint | Stock kernel result `C=A @ dequant(B)` for the same logical matrix, scales, zeros, group size, activation, and output shape. |
| Public anchor | Official vLLM v0.26.0 release/tag and official tag-pinned `triton_w4a16.py`. |
| Hypothesized N2 | A target-specific executable refinement contract across native transforms. |
| Native current union | `can_implement` eligibility checks; `process_weights_after_loading`; packed-weight unpack/transpose/repack; scale transform; zero-point layout branch; stock GEMM's contiguous/shape/group assertions and group-tile clamp. |
| Strongest subtractor | The tag-pinned native vLLM action union; MLIR Quant blockwise integrity is an adjacent generic semantic subtractor. |
| Natural/canonical carrier | A versioned compressed-tensors W4A16 checkpoint compatible with this exact vLLM path. No checkpoint was downloaded; its acquisition is unnecessary after the direct-fatal source result. |
| Full-cost denominator if viable | Contract construction/checking plus load-time transformation, dispatch overhead, false rejection, bug triage, and stock runtime. |
| Minimal falsifier | A legal input for which native repack passes but a distinct nibble/group/zero mapping produces the same stock object while violating the claimed contract. The source record instead shows the proposed transformation is itself native. |
| Disposition | `DROP` — direct absorption / checker-wrapper residual. |

The conclusion does not rest on a missing implementation, result, compute resource,
or advisory native-first field.

