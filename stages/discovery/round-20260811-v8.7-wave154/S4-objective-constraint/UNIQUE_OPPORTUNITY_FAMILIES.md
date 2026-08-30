# Unique GPU/compiler families

| id | natural kernel route / oracle | strongest fair union and full-cost denominator | status after witness subtraction |
|---|---|---|---|
| R01 | CUDA tensor-copy/GEMM-like kernels; same output plus bounds oracle | all legal TMA/bulk-copy pipeline variants for SM90; tensor-map encoding, copy, barrier, registers, shared memory, runtime | current union closes |
| R02 | CUTLASS GEMM/convolution testbed reference checks on SM90 | CollectiveMma plus `KernelTmaWarpSpecialized`, Pingpong, Cooperative; compile/JIT, tensor-map, registers/LDS, launch, epilogue | current union closes |
| R03 | CUTLASS Blackwell GEMM/reference checks on SM100 | TCGen05/TMEM/CLC, Blackwell dispatch/mainloop/epilogue and supported schedules; compilation, TMEM/register/LDS, launch, epilogue | current union closes; cannot borrow SM90 TMA claim |
| R04 | Triton tutorial matmul-style kernel with output oracle on matching target | existing `nvws.warp_group`, producer commit, async partitioning, target support; compiler, registers/shared memory, sync, launch | current union closes |
| R05 | LLVM AMDGPU codegen tests and kernel output/OOB oracle for gfx90a | backend register allocation plus `waves-per-eu`, flat-workgroup, VGPR/SGPR/LDS constraints; compile time, spills, occupancy, code size | no complete divergence witness |
| R06 | CK tile test/reference implementations on one fixed AMD target | documented tile operator/coordinate transformation/invoker composition; compilation, registers/LDS, data motion, launch | no atomic divergence witness |

All retained-deep natural routes are official reference/test kernels; no GPU run is asserted or performed.
