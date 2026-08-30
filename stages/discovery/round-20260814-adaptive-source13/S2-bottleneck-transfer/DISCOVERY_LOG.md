# Discovery log — Source13

- assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE13
- method: V8_7_POTENTIAL_READINESS_SEPARATED
- claim-pack / V9: OFF
- cut-off: 2026-08-14
- scope exclusion: network security, protocol security, vulnerability, exploit, traffic-security and replay topics.

## Funnel

| unit | family / object | status | reason |
|---|---|---|---|
| RAW_SCREEN_ROW_EVENT | CUDA Hopper TMA descriptor + producer/consumer warp schedule | DEEP_DIVE_REQUIRED | legal data-movement actions are explicit; needs current union audit |
| RAW_SCREEN_ROW_EVENT | CUDA bulk async-copy group formation + shared-memory tile layout | DEEP_DIVE_REQUIRED | same kernel semantics possible, but likely composition already exposed |
| RAW_SCREEN_ROW_EVENT | MLIR NVGPU async-copy group/wait lowering | EXCLUDED | active MLIR family boundary |
| RAW_SCREEN_ROW_EVENT | LLVM machine scheduling + register-pressure / memory pipeline | EXCLUDED | overlaps active GlobalISel/MLIR and generic RA boundary |
| RAW_SCREEN_ROW_EVENT | Intel GPU/Xe tile-memory lowering | NOT_ADMITTED_UNFROZEN | bounded two-native-plan witness not frozen from current official source |
| RAW_SCREEN_ROW_EVENT | NPU compiler tensor-layout / DMA construction | NOT_ADMITTED_UNFROZEN | no fixed public current object and stock oracle closed within bounded search |

## Candidate-grade deep review

### D01 — CUDA TMA descriptor, tensor layout and producer-consumer pipeline

- fixed object attempted: one Hopper-or-later CUDA kernel, fixed tensor values/shapes, output, numerical contract and hardware target.
- pre/post shift: TMA offloads multidimensional global-to-shared address calculation; residual cost would be descriptor setup, shared-memory layout, barriers and consumer availability.
- two native legal plans: bulk tensor asynchronous copies through TMA with a descriptor/pipeline, versus documented asynchronous-copy/group/wait construction where applicable.
- current union: CUDA Programming Guide exposes TMA, asynchronous copies, pipeline synchronization and warp-specialization patterns. The public semantics already make descriptor, copy grouping, wait and producer/consumer placement first-class choices.
- verdict: DROP. A source-grounded target-specific whole-constructor algorithm and certified guarantee beyond this native composition was not frozen. A descriptor/warp selector would be a controller; a generic schedule/layout search would violate the assignment.

### D02 — CUDA async-copy grouping, shared-memory layout and compute schedule

- fixed object attempted: same kernel output and source/destination tensor slices under the CUDA memory model.
- official counter-evidence: the NVGPU dialect exposes device_async_copy, device_async_create_group, device_async_wait, optional source extent and bypass-L1 hint. This already represents the claimed copy grouping and synchronization composition; CUDA documents asynchronous-copy prefetching and warp specialization.
- verdict: DROP as direct current-union absorption for the candidate sketched in this wave. No new action, target-specific algorithm/guarantee, or finite non-generic residual was identified.

## Search boundary and evidence discipline

Primary/official sources checked: current CUDA Programming Guide (updated 2026-05-27), CUDA advanced-kernel/TMA chapters, MLIR GPU and NVGPU current dialect documentation, and LLVM machine-analysis documentation. This bounded search is not a global novelty claim. No implementation, experiment, benchmark, download, or resource-based scientific inference was performed.

## Final disposition

COMPLETE_ZERO_PROPOSALS: no PROPOSE_STAGE0. Both deep candidates either collapse to already expressible native compositions or lack a non-generic target-specific bounded-state guarantee. This is a structural conclusion, not a result/readiness judgment.
