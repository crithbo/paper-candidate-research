# Source16 source / residual matrix

| family | first-party source | residual survival test | disposition |
|---|---|---|---|
| AMDGPU barriers | https://llvm.org/docs/AMDGPUExecutionSynchronization.html | current formal barrier + memory union expresses legal plans | DROP |
| AMDGPU availability/visibility | https://llvm.org/docs/AMDGPUMemoryModel.html | Source15 repeated identity; no re-screen | EXCLUDED |
| PTX atomic ABI | https://docs.nvidia.com/cuda/developer-preview/13.4/ptx-writers-guide-to-interoperability/atomic-abi.html | Source15 repeated identity; no re-screen | EXCLUDED |
| AMDGPU async completion | https://llvm.org/docs/UserGuides.html | source pass fails to close stock two-plan witness; no repeated closure | NOT_ADMITTED_UNFROZEN |
| GPU DWARF mapping | https://llvm.org/docs/AMDGPUUsage.html | historical debug family | EXCLUDED |
| NPU ordering ABI | bounded first-party search | no pinned source/oracle | NOT_ADMITTED_UNFROZEN |

SEARCH_BOUNDED_OPEN; no global novelty assertion.
