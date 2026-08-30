# DISCOVERY_QUESTION_CARD — S6-QGROUP-01

| Field | Frozen value |
|---|---|
| Exact public anchor | vLLM official tag `v0.26.0` (release commit shown as `568afb3`) and its public W4A16 kernel source |
| Same-object problem | Preserve the same grouped-W4A16 decoded GEMV result while selecting/repairing a K-tile schedule |
| Contribution type | `COMPILER_TOOL` / native kernel construction |
| Atomic action | Verify each tile's scale/zero metadata group and repair an illegal cross-group tile |
| Endpoint | Correct groupwise dequantization, with compile/code-size/runtime/occupancy/traffic counted if a residual survived |
| Stock oracle | vLLM tensor-output equivalence under the fixed packed weights and metadata; not run in Discovery |
| Natural carrier | Public vLLM-supported GPTQ/compressed-tensors W4A16 model metadata; a small synthetic packed matrix only for later legality checking, not a deployment claim |
| Current-source locus | `vllm/model_executor/kernels/linear/mixed_precision/triton_w4a16.py`; loader/format locus `.../compressed_tensors/schemes/compressed_tensors_wNa16.py` |
| Minimum falsifier | Current code proves one scale group per K tile and validates divisibility/support for the frozen object |
| Finite closure route | Read frozen tag source, trace config gate → selected tile → group index → scale/zero loads; no build needed |

## Raw-gate result

`NOT_EVIDENCE_QUALIFIED_RAW__DIRECT_CURRENT_UNION_ABSORPTION`.

The question card itself is closed: current code provides the direct falsifier.
No advisory-field absence, issue count, implementation status, or resource
result is used as a negative scientific inference.
