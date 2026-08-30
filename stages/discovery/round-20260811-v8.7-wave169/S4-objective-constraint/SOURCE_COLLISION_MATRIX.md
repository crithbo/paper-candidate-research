# Source / collision / ISA matrix

Frozen cutoff: 2026-08-11. Sources are official NVIDIA, Triton, AMD/ROCm, or MLIR documentation. They provide positive current construction evidence; no feature absence is inferred.

| id | official current source / target / relevant symbols | outcome |
|---|---|---|
| R01 | [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-programming-guide/pdf/cuda-programming-guide.pdf), SM90a bulk async copies/TMA/pipeline barriers | current staged-copy lifetime union |
| R02 | [CUTLASS Efficient GEMM](https://docs.nvidia.com/cutlass/latest/media/docs/cpp/efficient_gemm.html), [GEMM API](https://docs.nvidia.com/cutlass/latest/media/docs/cpp/gemm_api_3x.html), SM90a stages/double buffers/collectives | current SMEM/RMEM union |
| R03 | [CUTLASS SM100 utilities](https://docs.nvidia.com/cutlass/latest/media/docs/pythonDSL/cute_dsl_api/utils_sm100.html), [TCGen05 guide](https://docs.nvidia.com/cutlass/latest/media/docs/pythonDSL/mma_docs/tcgen05_programming.html), SM100a `TmemAllocator`, allocation/release | current TMEM union; TMEM is distinct from TMA |
| R04 | [Triton range](https://triton-lang.org/main/python-api/generated/triton.language.range.html), [warp specialization](https://triton-lang.org/main/getting-started/tutorials/gluon/warp-specialization.html), stages/multi-buffer/groups/commit | current IR lifetime union |
| R05 | [ROCm CK documentation](https://rocm.docs.amd.com/projects/composable_kernel/en/develop/), static distributed/LDS/register tensors | no NVIDIA-primitive attribution; no atomic witness |
| R06 | [MLIR GPU dialect](https://mlir.llvm.org/docs/Dialects/GPU/), allocation/lowering level | insufficient complete native source contract |

Current config check records target specificity. It never equates `gfx1250` with CDNA5, or AMD TDM/Tensor DMA with NVIDIA TMA.
