# Official Fact Boundary — AMD CDNA5 / TDM / gfx1250

**Research cut-off:** 2026-08-05. **Source policy:** only AMD, LLVM/Clang/MLIR, Triton upstream GitHub, and NVIDIA official documentation. Facts below are limited to those sources; everything labelled *inference* or *unverified* is not a paper claim.

## Frozen identity map

| Object | Officially established | Explicitly not established by the inspected first-party sources |
|---|---|---|
| AMD CDNA 5 / MI455X | AMD calls MI455X the first introduced CDNA5 product; AMD describes 8 CDNA5 chiplets/256 WGPs, Wave32 matrix execution, and TDM. [AMD CDNA page](https://www.amd.com/en/technologies/cdna.html) | No inspected AMD page maps this product/architecture to the code name `gfx1250`. |
| `gfx1250` | LLVM classifies it under **GCN GFX12 (RDNA 4)**, as `amdgpu12.50`, APU; its linked AMD ISA is the RDNA4 ISA guide (doc 70651, 2025-04-08). [LLVM target table](https://llvm.org/docs/AMDGPUUsage.html), [AMD RDNA4 ISA](https://docs.amd.com/v/u/en-US/rdna4-instruction-set-architecture) | It is not evidence that this RDNA4 route is CDNA5, MI455X, or an MI400 execution environment. |
| AMD TDM / tensor DMA | AMD says CDNA5 TDM performs direct async global-to-LDS movement without register staging. Clang documents tensor load/store builtins as async global↔LDS transfers, with five chunks of a hardware tensor descriptor and `TENSOR_CNT`/asyncmark completion; the shown builtins target `gfx1250-insts`. [AMD](https://www.amd.com/en/technologies/cdna.html), [Clang builtins](https://clang.llvm.org/docs/AMDGPUBuiltinReference.html) | A shared *class* of operation does not prove identical microarchitecture, descriptor format, latency/bandwidth, ordering, cache policy, cluster semantics, or performance between the two named objects. |
| AMD async/synchronization contract | LLVM documents global↔LDS DMA intrinsics and asynchronous tensor intrinsics, and documents async LDS-barrier arrival as an ordered pending async-load operation (available `gfx1250+`). [LLVM AMDGPU Usage](https://llvm.org/docs/AMDGPUUsage.html), [MLIR AMDGPU dialect](https://mlir.llvm.org/docs/Dialects/AMDGPU/) | The public compiler documentation alone cannot validate a CDNA5 performance, occupancy, or correctness claim. |
| NVIDIA TMA | NVIDIA defines TMA for Hopper (CC 9.0+) as bulk/bulk-tensor async copies, using a tensor map for multidimensional copies; it has its own CUDA/PTX synchronization and descriptor rules. [CUDA guide](https://docs.nvidia.com/cuda/archive/13.1.0/cuda-programming-guide/04-special-topics/async-copies.html), [Hopper guide](https://docs.nvidia.com/cuda/archive/12.3.0/hopper-tuning-guide/index.html) | “TMA” is NVIDIA terminology. AMD TDM/Tensor DMA Descriptor must not be renamed TMA or claimed to be the same mechanism. Cross-backend discussion may compare observable semantics only. |

## Compiler/artifact facts frozen for collision review

- LLVM exposes async global↔LDS DMA and tensor load/store intrinsics; its tensor intrinsic names omit `.async` but LLVM explicitly says they are asynchronous. [LLVM AMDGPU Usage](https://llvm.org/docs/AMDGPUUsage.html)
- Clang documents `__builtin_amdgcn_tensor_load_to_lds` and `...store_from_lds`, descriptor chunks `D0`–`D4`, `TENSOR_CNT`/asyncmarks, and `gfx1250-insts`. It separately documents wave-cooperative WMMA (`D=A*B+C`), including Wave32 variants. [Clang builtins](https://clang.llvm.org/docs/AMDGPUBuiltinReference.html)
- Triton upstream 3.7 release notes state that AMD/HIP work is centred on “gfx1250 (RDNA4) maturation,” including TDM, AMD warp specialization/pipeline, WMMA, cluster/multi-CTA and multicast work. [Triton releases](https://github.com/triton-lang/triton/releases)
- Triton PR [#8586](https://github.com/triton-lang/triton/pull/8586), merged 2025-12-12, already adds AMD warp-pipelined loops and lowering using barriers. PR [#8947](https://github.com/triton-lang/triton/pull/8947), merged 2025-12-13, adds warp specialization for `gfx1250`. PR [#9342](https://github.com/triton-lang/triton/pull/9342), merged 2026-02-03, supplies a `gfx1250` multi-CTA GEMM that multicasts A/B subtiles and partitions accumulators across CTAs.

## Claim ceilings

1. **CDNA5 architecture claim:** documentation-only; no public same-object executable hardware evidence was located. Do not claim performance, occupancy, latency, energy, or correctness beyond the cited specification/marketing description.
2. **gfx1250 compiler claim:** source-level/repository facts and LLVM semantics are supportable. Performance requires a locked gfx1250 platform, versions, workloads, baselines, traffic/compile/host costs, and measurements; none was run here.
3. **Cross-backend claim:** only an explicitly parameterized semantic comparison is possible. It cannot be a cross-vendor speed/efficiency ranking and cannot hide descriptor, memory, or synchronization differences.
4. **Verification claim:** requires a reproduced real fault and a semantics-aware oracle; no fault is currently evidenced.

## Non-negotiable terminology

Use **AMD Tensor Data Mover (TDM)** and **AMD hardware tensor descriptor / Tensor DMA Descriptor** only for AMD material. Use **NVIDIA Tensor Memory Accelerator (TMA)** and **CUDA tensor map** only for NVIDIA material. The words may appear together only in a comparison table with their backend identity retained.

