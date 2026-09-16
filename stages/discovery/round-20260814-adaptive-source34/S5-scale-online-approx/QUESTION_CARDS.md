# Source34 question cards

| Card | Current primary evidence | Disposition |
|---|---|---|
| QC34-A AMDGPU dynamic VGPR | LLVM current intrinsics define `s_alloc_vgpr`; target machine exposes SGPR/VGPR/WWM allocators and `amdgpu-reassign-regs`. | `LOCATOR_ONLY__CURRENT_UNION_ALREADY_EXPRESSES_NAMED_ALLOCATION_DIMENSION`. |
| QC34-B AMDGPU RA/scheduling | current source exposes allocator and scheduler strategy flags. | `EXCLUDED_BEFORE_RAW__GENERIC_COMPILER_CONFIGURATION`. |
| QC34-C Intel IGC | official README defines the LLVM-based complete OpenCL compiler. | `EXCLUDED_BEFORE_RAW__PROJECT_OWNED_COMPLETE_CONSTRUCTOR`. |

No raw; Source32/33 coupling check: OFF by frozen Source34 contract.
