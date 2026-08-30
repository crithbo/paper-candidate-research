# Raw screen row events

| ID | Fresh family / fixed object | Primary snapshot | Native plan pair | Outcome |
|---|---|---|---|---|
| R01 | Rust AsyncDrop coroutine destruction | Rust `AsyncDrop` API and panic source | ordinary destruction / async drop state | RAW_ONLY |
| R02 | Clang C++20 BMI and object counterpart emission | Clang standard-modules documentation | one-phase / two-phase BMI production | RAW_ONLY |
| R03 | HIPRTC bitcode/code-object linking and module load | ROCm HIPRTC API | compile image / link image before module load | DEEP_D1 |
| R04 | ROCR executable freeze and code-object lifetime | current ROCR runtime documentation | load code object / freeze executable lifecycle | DEEP_D2 |
| R05 | CUDA device graph-launch dispatch boundary | CUDA programming-model/graph documentation | device-side graph dispatch / host launch path | RAW_ONLY |
| R06 | XLA Pallas/Mosaic async DMA semaphore program | OpenXLA Pallas source route | asynchronous DMA token / ordinary staged operation | NOT_ADMITTED_UNFROZEN |

No row concerns security, vulnerabilities, attack behavior, traffic, exploit development or protocol security.
