# Source / collision matrix — Source13

| family | primary current source | current action/config union | collision or blocking facet | disposition |
|---|---|---|---|---|
| CUDA TMA descriptor + pipeline | CUDA Programming Guide §§4.10–4.11, including TMA | bulk tensor async copy, tensor-map descriptor use, pipeline/synchronization, producer-consumer warp specialization | proposed descriptor/layout/schedule is not yet a target-specific algorithm with a distinct guarantee; selector form prohibited | DROP |
| CUDA async-copy group + layout | CUDA advanced-kernel guidance; MLIR NVGPU dialect | device_async_copy, group creation, wait, source extent, shared-memory destination, bypassL1 hint | complete copy-group/wait composition already current-native; no union-external atomic action frozen | DROP |
| MLIR NVGPU lowering | MLIR NVGPU dialect | target bridge, async copy/group/wait, memory spaces | assignment exclusion: active MLIR family | EXCLUDED |
| LLVM schedule/RA/memory pipeline | llvm-mca documentation | scheduler resources, dependencies, register-file model | active GlobalISel/MLIR plus generic RA/frame-packing boundary | EXCLUDED |
| Intel GPU tile/DMA lowering | official oneAPI documentation search boundary | not sufficiently source-pinned | no complete two-plan action union / stock oracle frozen | NOT_ADMITTED_UNFROZEN |
| NPU layout/DMA constructor | official public current-source search boundary | not sufficiently source-pinned | fixed object and stock oracle remain unclosed | NOT_ADMITTED_UNFROZEN |

## Direct-subtractor note

The CUDA and NVGPU sources are deployment baselines and current-source counter-evidence, not papers claimed to prove global novelty. They demonstrate why this wave's proposed copy-group and wait actions cannot be treated as absent from the native union.
