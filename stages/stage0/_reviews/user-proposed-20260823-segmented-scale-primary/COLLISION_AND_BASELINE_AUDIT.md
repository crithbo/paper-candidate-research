# Collision and Baseline Audit

## Evidence classification

| Item | Evidence source and scope | Classification | Reason |
|---|---|---|---|
| vLLM dense Triton W4A16 | frozen source blobs, exact object | `DIRECT_SUBTRACT` | exact function/target but current one-scale `BLOCK_K=G` schedule |
| vLLM HIP skinny W4A16 | frozen C++ source and dispatch | `DEPLOYMENT_BASELINE` | same format/group mechanics but native domain ends at M≤5 |
| vLLM MoE W4A16 | frozen FlyDSL MoE source | `METHODOLOGICAL_ADJACENT` | grouped metadata/action exists but routed-expert semantics differ |
| vLLM Marlin selector / MARLIN manuscript | official source / [primary manuscript](https://arxiv.org/abs/2408.11743) | `DEPLOYMENT_BASELINE` | strong FP16×INT4 kernel context but source is CUDA-only |
| Triton block-scaled matrix multiplication | [official tutorial](https://triton-lang.org/main/getting-started/tutorials/10-block-scaled-matmul.html) | `METHODOLOGICAL_ADJACENT` | explicit multi-scale tile and layout techniques, but MX/FP4/FP8 objects differ |
| CUTLASS block-scaled GEMM | [official tutorial](https://docs.nvidia.com/cutlass/latest/media/docs/operators/tutorials/006_block_scaled_gemm.html) | `METHODOLOGICAL_ADJACENT` | same 32-K scale abstraction, NVIDIA Blackwell and different storage/operator contract |
| FlashInfer exact producer/paper | bounded official locator searches | `SEARCH_BOUNDED_OPEN` | no scientific absence inference; it is non-decisive because the generic-product failure is independently sufficient |

## Strongest fair baseline union

The admissible union is not an offline oracle and does not combine incompatible targets. It consists of:

1. all source-visible gfx1151 dense Triton configurations and four source overrides for the frozen shape/operator;
2. a same-dense semantic per-K/per-segment `floor(k/G)` metadata baseline, with its own cost recorded;
3. M≤5 HIP skinny only as a separate deployment lower-bound/negative control, never as an M=16 equivalent producer;
4. CUDA and block-scaled literature only as conceptual/format/target subtractors.

The candidate’s q=2/4 schedule is expressible as `q` repetitions of the first union member’s legal 32-wide group operation placed within one outer tile. The q scale entries are not reused across unrelated logical groups; their mandatory count remains q×BLOCK_N. Its only possible advantage is implementation-specific fusion/pipeline behavior. That is a valid engineering hypothesis but not a paper method without a non-product construction/guarantee.

## Paper genealogy and direct-collision finding

No source satisfies all eight direct-coverage predicates for the exact vLLM/gfx1151/GPTQ/M16 contract, so this report does not claim a direct paper or implementation collision. The decision instead follows the contribution-type contract: known block-scale techniques and the current source union leave the proposed action as a routine application/unrolling configuration. `SEARCH_BOUNDED_OPEN` remains recorded rather than converted to absence.

## Full-cost and Stage A counterfactual

A correctly scoped future new-ID study would compare output equality, codegen time and code size, scale/address instructions, VGPR/LDS/occupancy/spill, program count, kernel latency and vLLM latency. It would stop if any exact q schedule is equivalent after lowering or has no full-cost Pareto point. However, a positive result alone would remain insufficient for this frozen Topic ID because it does not provide a N1/N2/N3 research core.

## Source anchors

- [vLLM frozen commit](https://github.com/vllm-project/vllm/commit/568afb3a13806beb53bb2e6bd518269357b237c0)
- [TVM, OSDI 2018](https://www.usenix.org/conference/osdi18/presentation/chen)
- [Ansor, OSDI 2020](https://www.usenix.org/conference/osdi20/presentation/zheng)
- [MARLIN primary record](https://arxiv.org/abs/2408.11743)
