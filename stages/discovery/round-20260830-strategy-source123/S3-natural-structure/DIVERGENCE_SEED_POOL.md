# Source123 S3 divergence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260830-SOURCE123 / S3-NATURAL-STRUCTURE`
- Frozen profile: exact public low-bit layout carrier first; natural grouping/sparsity; exact semantics
- Seed ceiling: `10 <= 12`
- RQ candidate ceiling: `10`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`

## Seed records

| Seed | Carrier | Engine | Perspective | Non-evidence structural hunch | Counterfactual decision | Main risk |
|---|---|---|---|---|---|---|
| SD01 | torchao TensorCoreTiledLayout | NATURAL_OR_CANONICAL_EVIDENCE | compiler/backend engineer | Adjacent INT4 groups may repeat exact scale/zero metadata even when weights differ. | Choose a lossless run-indexed metadata layout and fused decode instead of dense per-group metadata loads. | Repetition may be absent or metadata too small; ordinary compression. |
| SD02 | torchao MarlinSparseLayout | COMPOSE_DECOMPOSE_SIMPLIFY | kernel engineer | 2:4 masks and quant groups may create deterministic relationships between sparse positions and scale indexing. | Co-pack mask and scale addressing so metadata work follows surviving groups only. | Sparse Marlin may already encode this; scale still applies to zero-containing groups. |
| SD03 | Triton block-scaled matmul | BISOCIATION_STRUCTURAL_TRANSFER | kernel engineer | E8M0 block scales may exhibit spatial runs or small exponent deltas across natural model tiles. | Losslessly compress scale tensors and decode per warp without changing MX semantics. | Scale overhead is small; decode divergence may erase savings. |
| SD04 | CUTLASS block-scaled GEMM | CONSTRAINT_MANIPULATION | hardware architect | Scale-factor layouts are explicit tensor objects whose tile order may control cache reuse. | Reorder scale storage with expert/channel grouping while keeping operand bits and GEMM semantics fixed. | CUTLASS layouts may already be fully tiled; reordering may be simple layout tuning. |
| SD05 | Transformer Engine MXFP8/NVFP4 | ABSTRACTION_LADDER | compiler/backend engineer | Hierarchical global and local scales may have different lifetimes across repeated microbatch GEMMs. | Hoist or cache exact global/local scale levels separately under an auditable reuse contract. | Existing recipes/kernels may already do it; dynamic scaling can invalidate reuse. |
| SD06 | bitsandbytes nested quant | COMPOSE_DECOMPOSE_SIMPLIFY | kernel engineer | Double quantization produces second-level scale codes that may repeat naturally across blocks. | Dictionary-pack codes and fuse their decode into dequant-GEMM. | Nested quantization already compresses scale statistics; extra layer may be generic. |
| SD07 | llama.cpp K-quants | NATURAL_OR_CANONICAL_EVIDENCE | CPU kernel engineer | K-quant super-blocks carry small scale/min fields and may contain repeated or zero subblocks. | Co-encode zero/repeated subblock metadata and skip exact decode/loads. | IQ/K-quants and importance-aware formats already exploit similar structure. |
| SD08 | Marlin | PROBLEM_REFRAMING | kernel engineer | GPTQ column permutations and group scales may be jointly packable so runtime activation reorder disappears. | Absorb a fixed permutation into packed weight/scale addressing with the same GEMM output. | Marlin may already pre-permute offline; action may be directly implemented. |
| SD09 | BitBLAS | ADJACENT_POSSIBLE_OR_BOUNDARY | compiler/backend engineer | Layout propagation may expose repeated group-scale reuse across output tiles. | Schedule scale decode once per reuse region rather than per consumer tile. | Existing transform propagation and autotuning may already cover it. |
| SD10 | GemLite | NEGATION_OR_INVERSION | kernel engineer | Tail groups for non-multiple dimensions may pay padding or branch costs disproportionate at small batch. | Use a tail-specific exact packed micro-layout without changing group quantization. | Narrow shape optimization or parameter tuning may not form a paper. |

## Coverage-constrained convergence

All ten seeds advance once as carrier-bound primary RQ candidates before source lookup. None is evidence, a novelty statement, raw, or a proposal. Failed rows cannot be replaced after retrieval.

- Engines used: `8`
- Perspective roles used: `compiler/backend engineer / kernel engineer / CPU kernel engineer / hardware architect`
- Largest object share: lossless low-bit metadata/layout handling
- `DIVERGENCE_COVERAGE_ADVISORY`: `DOMINATED_BY_ONE_SURFACE`
- Plain-Chinese note: 本轮题源按 control 有意集中在 low-bit packing；通过五个不同实现栈和 GPU/CPU 两类后端控制同义改写风险。

