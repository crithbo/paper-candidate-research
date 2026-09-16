# Source / collision matrix — Source15

| family | current first-party source | current union / counter-evidence | disposition |
|---|---|---|---|
| AMDGPU availability/visibility lowering | https://llvm.org/docs/AMDGPUMemoryModel.html ; https://llvm.org/docs/AMDGPUUsage.html | load-visible/store-available, atomic/fence semantics, metadata, address spaces, machine-code mapping | DROP: no new target-specific bounded algorithm/guarantee frozen |
| PTX atomic ABI lowering | https://docs.nvidia.com/cuda/developer-preview/13.4/ptx-writers-guide-to-interoperability/atomic-abi.html | acquire/release/acq_rel/relaxed mappings; legal strengthening; mapping choice accepted in one binary | DROP: existing ABI mapping composition |
| AMDGPU barriers / LDS | https://llvm.org/docs/AMDGPUExecutionSynchronization.html | formal barrier behavior plus memory-model interaction | DROP: native formal union |
| AMDGPU async completion | https://llvm.org/docs/UserGuides.html | first-party async operations path | NOT_ADMITTED_UNFROZEN |
| heterogeneous DWARF memory spaces | https://llvm.org/docs/AMDGPUUsage.html | documented DWARF mapping | EXCLUDED: historical debug family |
| NPU memory ordering ABI | bounded official search | no fixed current object/oracle | NOT_ADMITTED_UNFROZEN |

SEARCH_BOUNDED_OPEN: this is not a global novelty assertion.
