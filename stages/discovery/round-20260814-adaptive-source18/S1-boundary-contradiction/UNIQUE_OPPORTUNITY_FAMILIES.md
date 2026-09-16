# Unique opportunity families

The six rows in `RAW_SCREEN_ROW_EVENTS.md` are distinct within this batch and are not aliases of the Source17 identities. “Unique” here means fresh to the screened inventory, not that a research residual has been established.

| Signature | Exact object / fixed guarantee | Natural carrier and stock oracle | Strongest current same-object union |
|---|---|---|---|
| CUDA PTX forward compatibility | CUDA application/device code with fixed kernel outputs and supported deployment contract | CUDA sample/application bundle; CUDA compatibility error codes and driver/runtime loading outcomes | CUDA binary/minor/forward-compatibility matrices plus compatibility package and driver checks |
| Vulkan pipeline cache | Pipeline cache data with fixed pipeline result | Vulkan application cache blob; Vulkan validation/creation outcomes | Driver-owned cache serialization/deserialization contract |
| oneAPI SYCLBIN | `.syclbin` object inputs and linked `kernel_bundle` semantics | Separate SYCL device modules; runtime `sycl::link` success/failure and kernel-bundle behavior | `sycl-post-link`, `clang-linker-wrapper`, SYCLBIN metadata parser, per-device link graph, runtime ProgramManager |
| DPC++ optional feature metadata | Device image plus fixed admissibility requirements | SYCL device image/property set; runtime compatibility decision | `sycl-post-link` property emission and runtime aspect/target checking |
| SPIR-V specialization | SPIR-V module and specialized shader result | Public SPIR-V modules; SPIR-V validator and specialization semantics | Standard specialization rule and consumer implementation |
| LLVM OpenMP device image | OpenMP target region plus target-device runtime semantics | LLVM OpenMP tests; target image/runtime load behavior | device bitcode link, libomptarget host runtime and RTL plugin stack |
