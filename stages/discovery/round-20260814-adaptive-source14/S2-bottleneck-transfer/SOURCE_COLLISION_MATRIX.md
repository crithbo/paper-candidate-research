# Source / collision matrix — Source14

| family | official current source | complete union evidence | disposition |
|---|---|---|---|
| OpenXLA GPU buffer/schedule | https://openxla.org/xla/gpu_architecture ; https://openxla.org/xla/flags_guidance | buffer assignment, scheduler alternatives, latency hiding and analytical overlap controls | DROP: selector/config or generic scheduling |
| PRIVATE_TOOLCHAIN AMDGPU async DMA | https://PRIVATE_TOOLCHAIN.dev/reference/mlir-passes/CodegenCommonGPU/ | async-DMA lowering, shared-memory resource checks, pipeline-depth option | DROP: pipeline-depth/config sketch; no target-specific residual frozen |
| PTX cluster mapping | https://docs.nvidia.com/cuda/parallel-thread-execution/ | CTA clusters, cluster shared memory, barriers, mapping | EXCLUDED: Source13 adjacent data-movement boundary |
| tcgen05 memory placement | https://docs.nvidia.com/cutlass/latest/media/docs/pythonDSL/mma_docs/tcgen05_programming.html | SMEM/TMEM requirements | NOT_ADMITTED_UNFROZEN: stock equivalence and legal two-plan witness unclosed |
| XLA TPU collective scheduling | https://openxla.org/xla/flags_guidance | latency-hiding scheduler and relevant options | DROP: current policy union |
| GPU library fusion selection | https://openxla.org/xla/hlo_to_thunks | scheduler, compiled-kernel/library thunks | DROP: selector only |

Search is bounded and does not assert global novelty.
