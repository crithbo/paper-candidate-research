# Cross-lane deduplication

This resource-lifetime screen excludes the active AMDGPU register/occupancy project (`S5-OCCUPANCY-CLIFF-JOINTCODEGEN`) and does not reopen earlier S4 GPU compiler objects. The exact target boundaries are independent.

| id | fixed target/object |
|---|---|
| R01 | CUDA SM90a producer-consumer pipeline with staged shared-memory tiles |
| R02 | CUTLASS SM90a GEMM mainloop shared-memory/register double buffering |
| R03 | CUTLASS SM100a GEMM TMEM allocation, staged SMEM, and deallocation |
| R04 | Triton fixed Hopper/Blackwell matmul-style warp-specialized loop |
| R05 | ROCm Composable Kernel fixed AMD HIP tile kernel with LDS/register tensors |
| R06 | MLIR GPU shared-memory allocation/lowering for a fixed GPU kernel |

No GFX12/CDNA5 identity assumption and no AMD/NVIDIA copy-primitive substitution is made.
