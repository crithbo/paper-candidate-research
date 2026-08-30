# Current union and subtractor matrix
+
| Producer / subtractor | Exact object relation | Current action | Coverage of candidate action | Disposition |
|---|---|---|---|---|
| vLLM selected RDNA Triton path | Exact for M=16/gfx1151/G=32. | One g_idx, one scale vector broadcast across BLOCK_K; clamps BLOCK_K to G. | Does not cover q-group scale tile plus segment mapping. | DEPLOYMENT_BASELINE |
| vLLM RDNA HIP wvSplitK_int4_g | Same representation but M≤5 only. | Group-aware native skinny operation with group specializations. | Does not cover frozen M=16 wrapper path. | DIRECT_SUBTRACTOR_FOR_M_LE_5_ONLY |
| vLLM MoE GPTQ/AWQ | Caller/object differs. | Not part of frozen dense M=16 contract. | Cannot absorb without a same-object callable proof. | RELATED_ONLY |
| Marlin same-format family | Target/current producer relation not established for gfx1151 M=16. | Required Stage 0 comparison family. | No direct coverage established. | OPEN_BOUNDED_COLLISION_DEBT |
| CUTLASS or FlashInfer path | Foreign target or unresolved same-object execution relation. | Required comparative family. | No direct coverage established. | OPEN_BOUNDED_COLLISION_DEBT |
| Triton block-scaled matmul | Methodological adjacency, not same GPTQ group contract by default. | Block-scale representations/schedules. | Candidate does not claim first multi-scale/block-scale construction. | METHODOLOGICAL_ADJACENT |
+
## Exact current-union result
+
The M=16 union required by the assignment is closed at the source level. The wrapper selection is decisive: MAX_SKINNY_BATCH_SIZE is 5, hence M=16 takes triton_w4a16_skinny_fmt_gemm. That source’s one g_idx representation requires its group-size clamp. The candidate action is therefore outside the inspected current M=16 native producer, subject to Stage 0 verification of compiler lowering and broader direct collision.
+
## Claim ceiling
+
Outside-current-union means only source-level action difference. It does not prove novelty, a beneficial cost frontier, compiler non-recovery, or any performance result.
