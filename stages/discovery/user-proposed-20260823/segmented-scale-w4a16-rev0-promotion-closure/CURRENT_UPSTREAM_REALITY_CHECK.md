# Current upstream reality check
+
## Official frozen sources
+
| Locus | Official blob | Finding for M=16 |
|---|---|---|
| triton_w4a16.py | bc0a587b676309da6c3c4d63e092086ee7a5f78e | Supports symmetric uint4b8, G=32 and no g_idx. On gfx1151, M≤32 initially selects (BLOCK_M,BLOCK_N,BLOCK_K)=(32,32,64); before launch it clamps BLOCK_K to group_size because one g_idx/scale row is broadcast across the complete tile. |
| rdna_hybrid_w4a16.py | 01c353c5547475df5bb6ab9c91617ee208468abd | MAX_SKINNY_BATCH_SIZE=5; M=16 routes to triton_w4a16_skinny_fmt_gemm, not HIP. Exact G=32 shape overrides use (128,32,32) for (2048,6144) and (128,64,32) for (8192,2048); generic M≤32 starts at (32,32,128) then clamps to G. |
| skinny_gemms_int4.cu | 8b7077d14ed0f691553f86dd96d9a3d21a459955 | Native wvSplitK_int4_g is real, group-aware and specialized by group size; wrapper/native dispatch bound it to batch M≤5. It is a mandatory direct subtractor for M≤5, not a current M=16 producer. |
+
## Required field closure
+
| Field | Result |
|---|---|
| Mathematical operator | Closed: dense W4A16 dequantized GEMM. |
| Packing | Closed: GPTQ sequential / ExLlama shuffled uint4b8, eight int4 per int32. |
| M=16 dispatch | Closed: wrapper predicate routes M>5 to Triton prefill. |
| Target | Closed: gfx1151 branch and per-shape overrides inspected. |
| Block-K relative to G | Closed: selected code enforces one group per K tile by clamping to G=32. |
| Scale granularity | Closed: one scale vector per g_idx, broadcast to tile. |
| Zero behavior | Closed: symmetric bias-8/no explicit zero point supported; candidate does not change it. |
| Default/non-default controls | Closed to source-visible M/K/N/G predicates, shape overrides, num_warps/num_stages and group clamp. No source-visible control makes M=16 use q-group scale staging. |
+
## Contrary evidence and subtraction
+
- wvSplitK_int4_g disproves any claim that vLLM lacks group-aware HIP metadata logic generally; it does not cover M=16 under the frozen wrapper contract.
- Marlin, CUTLASS and FlashInfer remain required comparison families, but no same-target M=16/gfx1151 current producer was established in this bounded official packet. They are Stage 0 collision debt, not absence evidence.
- Generic Triton block-scaled work is methodological adjacent; this candidate makes no first-block-scale claim and retains exact GPTQ group semantics.
+
## Outcome
+
CURRENT_UPSTREAM_REALITY_CHECK = PASS__M16_CURRENT_UNION_CLOSED_FOR_ASSIGNMENT_REQUIRED_LOCI.
+
The narrow action-gap claim is only that the selected M=16 Triton producer has no q-group scale-tile/segment action; it explicitly prevents a multi-group tile under its one-scale representation. It does not establish novelty or performance.
