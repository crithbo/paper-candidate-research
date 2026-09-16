# Unique resource-lifetime families

| id | natural kernel corpus and native oracle | strongest fair union / complete cost denominator | post-subtraction status |
|---|---|---|---|
| R01 | CUDA tensor-copy/GEMM-like examples; output plus bounds oracle | every legal SM90a copy pipeline/barrier/stage configuration; compile, tensor-map setup, copy, synchronization, shared memory, registers, launch | current union closes |
| R02 | CUTLASS GEMM/convolution testbeds/reference checks on SM90a | collective mainloop, TMA/GMMA, double buffers, stages and warp roles; compile/JIT, register/shared footprint, sync, epilogue, launch | current union closes |
| R03 | CUTLASS SM100a GEMM/reference testbeds | TCGen05, `TmemAllocator`, TMEM/SMEM/RMEM copies, column constraints, two-CTA barriers/dealloc; compile, allocation, sync, all memory footprints, launch | current union closes |
| R04 | Triton official matmul-style tutorials with output check on matching hardware | `tl.range` stages/multi-buffer controls, Gluon groups, producer commit/lowering; compile, register/shared use, synchronization, launch | current union closes |
| R05 | CK tile tests/reference HIP operators on a fixed AMD target | static distributed/register/LDS tensors, buffer views, coordinate transformation, invoker; compile, LDS/register/data movement, launch | no witness |
| R06 | official MLIR GPU examples/reference lowering on a fixed target | incomplete native source/target/allocation union | no witness |

The active S5 occupancy object is excluded rather than used as an unfair comparator.
