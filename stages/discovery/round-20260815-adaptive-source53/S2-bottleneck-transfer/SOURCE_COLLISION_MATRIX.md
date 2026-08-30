# Source and collision matrix

| Family | Exact object / same-function envelope | Current strongest union or direct history | Contrary / collision result | Final funnel disposition |
|---|---|---|---|---|
| cuFile batch descriptor + registration | Same file ranges, offsets, GPU buffers, bytes/status result | `cuFileBatchIOSetUp`/`Submit`/`GetStatus`/`Cancel`/`Destroy`, file+offset+size+pointer batch entries; Source37 same transaction/batch-completion/byte-status identity | Exact Source37 S2 identity. No external delta. | `EXCLUDED_EXACT_HISTORICAL_IDENTITY` |
| MPI partitioned persistent readiness | Same bytes, partitions, datatype, rank/tag/communicator, completion semantics | `Psend_init`/`Precv_init` plus `Pready`, `Pready_list`, `Pready_range` | The proposal names no action outside choosing native partition setup and readiness; a portable target-specific guarantee is absent. Prototype status is not a negative inference. | `PRE_RAW_DIRECT_CURRENT_UNION_ABSORPTION` |
| LLVM OpenMP offload image metadata layout | Same host/device program, target image, ABI and stock `libomptarget` accessibility | current embedding, linker wrapper, `__tgt_device_image` / descriptor registration and documented OffloadBinary table/string/image layout | Remaining layout is a generic string-map/image serialization, while loader-meaningful changes cross the fixed ABI/reader boundary. | `PRE_RAW_GENERIC_SERIALIZATION_OR_CHANGED_LOADER_BOUNDARY` |

This bounded matrix is not a novelty conclusion beyond the recorded exact history and current sources. No direct-paper collision search is claimed because neither surviving route reaches evidence-qualified raw; pre-raw direct union/generic fatal is decisive under the frozen rules.
