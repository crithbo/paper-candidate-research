# Discovery Research Question Candidate
+
## Identity
+
- RQ candidate ID: RQ-S6-SEGMENTED-SCALE-M16-01.
- Assignment: DISCOVERY-S6-20260823-SEGMENTED-SCALE-W4A16-PROMOTION-CLOSURE.
- Seed: S6-SEGMENTED-SCALE-M16-01.
- Exact public anchor: vLLM commit 568afb3a13806beb53bb2e6bd518269357b237c0; source blobs bc0a587b676309da6c3c4d63e092086ee7a5f78e, 01c353c5547475df5bb6ab9c91617ee208468abd, and 8b7077d14ed0f691553f86dd96d9a3d21a459955.
- Stable object/guarantee: dense M=16 W4A16/GPTQ-sequential/G=32/gfx1151 with fp32 accumulation and fp16 output.
- Contribution type hypothesis: COMPILER_TOOL, route N2.
+
## Primary RQ
+
For the frozen M=16 gfx1151 W4A16 object, can a constexpr q-group (q=2 or 4) register-staged scale tile plus structured K-subsegment mapping provide a non-generic, same-output compiler schedule frontier over vLLM’s current one-group BLOCK_K=32 Triton route after full register/LDS/occupancy and end-to-end cost are counted?
+
## Scope and closure
+
- In scope: BLOCK_M=16, BLOCK_N=32, BLOCK_K=64/128, per-group scale tile, symmetric uint4b8, four frozen shapes.
- Out of scope: M≤5 HIP path, MoE, changed packing/zero point, NVIDIA, dynamic shapes, or automatic cross-vendor claims.
- Minimum falsifier: source-level current action covers multigroup scale staging; compiler already produces the identical schedule; or static full-cost has no plausible frontier.
- Primary source route: three named vLLM files at frozen commit, retrieved through official GitHub repository connector.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
