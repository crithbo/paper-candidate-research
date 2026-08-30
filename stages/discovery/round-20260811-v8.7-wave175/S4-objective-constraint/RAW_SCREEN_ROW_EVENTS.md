# Raw screen event

| id | fixed same-function contract | candidate action | status |
|---|---|---|---|
| R01 | a fixed `gpu`/`nvgpu` MLIR kernel with identical output, bounds, async dependencies, shared-memory address space, and matching NVVM/NVIDIA lowering | token-aware interval construction that jointly assigns/reuses shared-memory buffers only after all `device_async`/mbarrier/TMA dependences have completed | `DEEP_DIVE_REQUIRED__CURRENT_SOURCE_UNION_NOT_YET_CLOSED` |

Minimum intended witness: two non-overlapping asynchronous shared-buffer intervals whose reuse preserves all explicit device async tokens and mbarrier phases, reduces the peak shared-memory footprint, and does not alter tensor map, output, bounds, or target ISA. No claim is made that this witness exists before source-level closure.
