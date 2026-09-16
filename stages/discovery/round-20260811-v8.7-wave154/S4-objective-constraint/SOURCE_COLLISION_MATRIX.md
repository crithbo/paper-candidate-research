# Source / target / collision matrix

Frozen cutoff: 2026-08-11. All technical sources are official NVIDIA, AMD/ROCm, LLVM, or Triton documentation. They are positive current-source checks; no source-absence claim is used.

| id | frozen source and current symbols/config | current-reality / collision result |
|---|---|---|
| R01 | [CUDA Programming Guide — TMA](https://docs.nvidia.com/cuda/archive/12.8.0/cuda-c-programming-guide/index.html), compute capability 9.0, `cuTensorMapEncode`, bulk tensor async copies | SM90 TMA pipeline explicitly exists |
| R02 | [CUTLASS 3 GEMM API](https://docs.nvidia.com/cutlass/latest/media/docs/cpp/gemm_api_3x.html), `MainloopSm90TmaGmmaWarpSpecialized`, `KernelTmaWarpSpecialized{,Pingpong,Cooperative}`, `Stages_`, `ClusterShape_` | full proposed joint axis is current configurable union |
| R03 | [CUTLASS changelog](https://docs.nvidia.com/cutlass/latest/CHANGELOG.html), SM100, TCGen05, TMEM, CLC | distinct Blackwell local union; no SM90/AMD inference |
| R04 | [Triton warp specialization](https://triton-lang.org/main/getting-started/tutorials/gluon/warp-specialization.html), [range API](https://triton-lang.org/main/python-api/generated/triton.language.range.html), `nvws.warp_group`/producer commit | current IR and Hopper/Blackwell target gates absorb role partitioning |
| R05 | [LLVM AMDGPU backend guide](https://llvm.org/docs/AMDGPUUsage.html), [occupancy calculator](https://www.llvm.org/docs/CommandGuide/llvm-calc-occupancy.html), `-mcpu=gfx90a`, `amdgpu-waves-per-eu`, OOB/XNACK flags | target/flags and occupancy constraints explicit; no gfx1250/CDNA5 substitution |
| R06 | [ROCm CK guide](https://rocm.docs.amd.com/projects/composable_kernel/en/develop/), tile operators/coordinate transformations/invoker layers | no NVIDIA TMA attribution; no new atomic action frozen |

Latest-collision conclusion: the proposed action spaces are already documented for the matching target, or lack a complete action witness. No baseline crosses target ISA or changes numerical/semantic guarantees.
