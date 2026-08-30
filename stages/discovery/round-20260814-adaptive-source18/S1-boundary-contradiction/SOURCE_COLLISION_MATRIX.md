# Source and collision matrix

All sources below are first-party/official. Retrieved and reviewed 2026-08-14; this was read-only bounded web/source documentation research, not a build or runtime probe.

| Family | Official snapshot / current source-design locus | What it establishes | Collision / result |
|---|---|---|---|
| CUDA PTX forward compatibility | NVIDIA, [Forward Compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/forward-compatibility.html) and [FAQ](https://docs.nvidia.com/deploy/cuda-compatibility/frequently-asked-questions.html) | Matrix, package/driver limits, PTX-JIT and feature exceptions | No target-specific N2 action; configuration selector excluded |
| Vulkan pipeline cache | Khronos [Vulkan Registry](https://registry.khronos.org/vulkan/) | Pipeline-cache contract is implementation/driver-owned rather than cross-driver portable | Same-guarantee premise fails |
| oneAPI SYCLBIN | Intel LLVM, [SYCLBIN design](https://intel.github.io/llvm/design/SYCLBINDesign.html), [compiler/runtime design](https://intel.github.io/llvm/design/CompilerAndRuntimeDesign.html), [property sets](https://intel.github.io/llvm/design/PropertySets.html) | Current producer, metadata, runtime parser, complete per-device graph and supported configuration union | Direct positive absorption: any proposed constructor is generic graph/link/layout work |
| DPC++ optional features | Intel LLVM, [Optional Device Features](https://intel.github.io/llvm/design/OptionalDeviceFeatures.html) | Requirement metadata and device-image admissibility | Flag/target selection only |
| SPIR-V specialization | Khronos, [SPIR-V specification](https://registry.khronos.org/SPIR-V/specs/unified1/SPIRV.html) | Specialization semantics; optimizing transform is not needed for functional correctness | Generic compiler action only |
| LLVM OpenMP offload | LLVM, [OpenMP Runtimes](https://openmp.llvm.org/design/Runtimes.html) | Host/plugin/device-runtime composition and image handling | Existing packaging/runtime union; wrapper/controller only |

No current-absence proposition is used. Thus no claim rests on an unfound paper, unobserved flag, or a missing source symbol.
