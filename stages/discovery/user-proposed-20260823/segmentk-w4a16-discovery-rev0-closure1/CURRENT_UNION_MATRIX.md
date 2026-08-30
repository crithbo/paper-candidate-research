# SegmentK W4A16 — current-union matrix
+
## Frozen boundary
+
- Assignment: `DISCOVERY-S6-20260823-SEGMENTK-W4A16-DISCOVERY-REV0`.
- Runtime/source pin: vLLM `v0.26.0`, commit `568afb3a13806beb53bb2e6bd518269357b237c0`.
- Exact pre-topic object: dense M1/decode GEMV on AMD `gfx1151`, `uint4b8`, symmetric GPTQ-sequential quantization, `G=32`, fp16 activation/scale/output, fp32 accumulation, and the four assignment-frozen `(K,N)` shapes.
- Candidate, not an admitted action: a `q=2` or `q=4` group segment (`BLOCK_K=qG`) that loads the scale for each group/output tile once and uses it only for that group’s 32 K-elements.
+
## Sources and reality-check status
+
| Source role | Official frozen location | What was established | Status |
|---|---|---|---|
| Dense baseline | `vllm/model_executor/kernels/linear/mixed_precision/triton_w4a16.py` at tag `v0.26.0`, asserted blob `bc0a587b676309da6c3c4d63e092086ee7a5f78e` | The dense Triton route obtains a group index from the K offset, applies the group’s scale/zero to the corresponding K region, and constrains a K tile so it cannot span a smaller group. | `INSPECTED_OFFICIAL_TAGGED_SOURCE` |
| RDNA wrapper and dispatch | `vllm/model_executor/kernels/linear/mixed_precision/rdna_hybrid_w4a16.py` at tag `v0.26.0`, asserted blob `01c353c5547475df5bb6ab9c91617ee208468abd` | On `gfx1151` the wrapper documents tuned group-128 defaults, then limits a skinny Triton K tile to `min(BLOCK_K, group_size)`. For the M1-like skinny dispatch predicate it calls `ops.wvSplitK_int4_g(...)`; this is the actual production branch that matters for the frozen object. | `INSPECTED_OFFICIAL_TAGGED_SOURCE` |
| Actual M1 HIP producer | `csrc/rocm/skinny_gemms_int4.cu`, entry `wvSplitK_int4_g` | The source path and entry symbol are identified by the official wrapper, but its implementation body was not obtained from an official route in this bounded run. | `UNRESOLVED_SOURCE_CLOSURE_DEBT` |
+
The two inspected wrappers are sufficient to reject an absence claim about the **whole** vLLM M1 union: the M1 route is not merely the dense Triton kernel. They are not sufficient to decide whether `wvSplitK_int4_g` already implements the proposed q-group staged metadata action.
+
## Complete-action field audit
+
| Required union field | Dense Triton producer | RDNA wrapper/skinny Triton branch | M1 `wvSplitK_int4_g` HIP branch | Closure result |
|---|---|---|---|---|
| Mathematical operator | Fixed W4A16 dequantized dense linear operator. | Same. | Same wrapper call contract. | `CLOSED_AT_WRAPPER` |
| GPTQ-sequential int4 packing | Fixed by the frozen input contract. | Same accepted format. | Passed to the HIP operation through the wrapper. | `CLOSED_AT_WRAPPER` |
| M1 dispatch | Generic dense route. | Explicit skinny/M1 predicate is present and dispatches to `wvSplitK_int4_g`. | Selected for the relevant branch. | `CLOSED_AT_WRAPPER` |
| `gfx1151` target path | Not target-specific. | Explicit gfx1151 branch/heuristics. | Actual device implementation remains unread. | `PARTIAL` |
| `BLOCK_K > G` | Not represented: the inspected source prevents a one-scale/multi-group error by limiting the tile to the group. | Same limitation on its Triton skinny branch. | Unknown. | `UNRESOLVED_DECISIVE` |
| Scale granularity | Per quantization group. | Per quantization group. | Unknown scheduling/reuse pattern. | `UNRESOLVED_DECISIVE` |
| Zero-point behavior | The symmetric `uint4b8`/bias-8 contract is not a free change of quantization semantics. | Same frozen contract. | Wrapper supplies the zero-point argument; inner behavior unread. | `PARTIAL` |
| Non-default flags/configurations | No inspected wrapper-visible option changes M1 into q-group scheduling; selection is branch/predicate based. | Same. | Native entry options/compile-time variants are unclosed. | `UNRESOLVED_DECISIVE` |
+
## Current-union conclusion
+
`CURRENT_UNION_STATUS = INCOMPLETE__M1_HIP_PRODUCER_UNREAD`.
+
It would be unsound to label the segment action absent, absorbed, or residual based only on the clamps in the Triton-facing paths. The official HIP producer must be inspected at the frozen tag before any topic creation or raw admission.
+
## Source-route telemetry
+
Two bounded, non-persisted official source retrieval attempts were made after wrapper inspection:
+
1. GitHub contents API for `csrc/rocm/skinny_gemms_int4.cu?ref=v0.26.0`: authentication failure before content transfer.
2. `raw.githubusercontent.com` for the identical pinned path: Windows Schannel `SEC_E_NO_CREDENTIALS` before content transfer.
+
These are resource/transport facts only. They do not support an absence, novelty, performance, or scientific-negative claim.
