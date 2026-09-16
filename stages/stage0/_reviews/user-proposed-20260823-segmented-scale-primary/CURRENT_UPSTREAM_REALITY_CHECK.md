# Independent Current-Upstream Reality Check

## Scope and pin

- Assignment/topic: `STAGE0-PRIMARY-20260823-SEGMENTED-SCALE-W4A16-REV0` / `SEGMENTED-SCALE-W4A16-REV0`.
- Official repository and immutable pin: `vllm-project/vllm@568afb3a13806beb53bb2e6bd518269357b237c0` (GitHub Commit API response retained as `resources/downloads/vllm-commit.json`).
- Pin tree: `ce348f7622d677acf4ee7bc4e5e8a826c2bc2c1f`; complete API tree response reports `truncated=false`, 6,871 paths.
- Check date: 2026-08-23; no code was built or executed.

## Corrected source locations

Discovery’s content/blob identifiers resolve in the frozen tree, but the current paths are under `vllm/model_executor/kernels/linear/mixed_precision/`, not the earlier `layers/quantization/utils/rocm/` spelling. This is a locator correction, not a new mechanism or scope expansion.

| Frozen source | Blob SHA | Facts independently read |
|---|---|---|
| `.../mixed_precision/triton_w4a16.py` | `bc0a587b676309da6c3c4d63e092086ee7a5f78e` | Lines 103–152 iterate `k_start`, form `g_idx=(k_start*BLOCK_K)//group_size`, load one scale row and broadcast it to the full tile. Lines 238–244 state that `BLOCK_K>group_size` corrupts output and clamp it. |
| `.../mixed_precision/rdna_hybrid_w4a16.py` | `01c353c5547475df5bb6ab9c91617ee208468abd` | Lines 60–63 set `MAX_SKINNY_BATCH_SIZE=5`; lines 171–178 list all four G=32 source-recognized shapes with `(BLOCK_M,BLOCK_N,BLOCK_K)=(128,32/64,32)`; lines 271–339 select gfx1151 configs and apply `BLOCK_K=min(BLOCK_K,group_size)`. |
| `csrc/rocm/skinny_gemms_int4.cu` | `8b7077d14ed0f691553f86dd96d9a3d21a459955` | Per-group W4A16 kernel supports groups 32/64/128 and derives `group_idx=k_/GROUP_SIZE`; this is the M≤5 HIP path. |
| `.../mixed_precision/marlin.py` | `87ed8d1b582fcee96b2ecde77d2f9acf73632903` | `can_implement` returns false when `current_platform.is_cuda()` is false; it is not a gfx1151 producer. |
| `.../mixed_precision/rdna3_w4a16.py` | `268728f4bf663fe7a489f40a0362318a69649925` | Requires ROCm gfx1100; it does not substitute for the frozen gfx1151 implementation. |
| `.../compressed_tensors_moe_w4a16_flydsl.py` | `f2159b0eb2ac1ac015804001052f230bd0615096` | Handles grouped/symmetric W4A16 metadata for a fused-MoE object; not dense linear. |
| `tests/kernels/quantization/test_rdna_hybrid_w4a16.py` | `0d007aa1170f1e04040724df6c41ea83a11daaa1` | The canonical test reference expands group scales with `repeat_interleave(G)` and exercises both the M≤5 HIP and M>5 Triton dispatch boundary. |

## Default/non-default union

| Surface | Current source behavior | Effect on candidate |
|---|---|---|
| Dispatch | M≤5 and LDS-compatible uses HIP; M>5 uses Triton | Candidate’s M=16 carrier is correctly in Triton; HIP cannot be passed off as an equal M16 baseline. |
| `BLOCK_K` heuristic | gfx1151 selects a finite shape/M-dependent configuration | Candidate must compare all legal source configurations, not just an arbitrary default. |
| G=32 shape overrides | Four target shapes force `BLOCK_K=32` and widen M/N/warps/stages | Establishes a natural implementation carrier and a strong configuration baseline. |
| Scale addressing | one `g_idx`/scale vector per K tile | Confirms the narrow representation difference. |
| Dense group-staged alternative | none found in exact selected source files | Not an absence claim beyond the inspected source; source does not itself supply candidate’s q tile. |
| MoE W4A16 route | has grouped metadata inside a routed-expert operator | subtracts general metadata novelty, but cannot directly cover dense M=16 object. |
| Marlin/RDNA3 selectors | CUDA-only / gfx1100-only | deployment subtractors, not exact gfx1151 direct coverage. |

## Official external reality checks

- [Triton block-scaled matmul](https://triton-lang.org/main/getting-started/tutorials/10-block-scaled-matmul.html) explicitly describes K-axis blocks with one scale per 32 elements and multi-scale tile/preshuffle organization on NVIDIA/AMD formats. It is not the exact GPTQ uint4b8 object.
- [CUTLASS block-scaled GEMM](https://docs.nvidia.com/cutlass/latest/media/docs/operators/tutorials/006_block_scaled_gemm.html) documents scale factors over 1×1×32 K blocks and physical scale layouts for NVIDIA Blackwell. It is a strong abstraction subtractor but a different target/format/instruction contract.

## Conclusion

`CURRENT_UPSTREAM_REALITY_CHECK = PASS__EXACT_DENSE_M16_BASELINE_REBUILT__NO_DIRECT_CURRENT_ACTION_COVERAGE_ESTABLISHED`.

This only establishes the narrow source gap. It does not establish a research residual: multiple-scale K tile management is already a generic block-scaled implementation technique, and the frozen candidate supplies no target-specific non-product compiler construction beyond local loop/tile composition.
