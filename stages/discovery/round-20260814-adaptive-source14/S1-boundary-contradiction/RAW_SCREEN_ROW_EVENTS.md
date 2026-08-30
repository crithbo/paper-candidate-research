# Raw screen row events

| ID | Family / exact native object | Source class | Native two-plan thought | Outcome |
|---|---|---|---|---|
| R01 | Objective-C ARC return-value handoff | Clang ARC specification + CodeGen source | retained/autoreleased ABI handoff | DEEP_D1 |
| R02 | XLA async custom-call start/done buffer boundary | OpenXLA async-HLO/FFI docs | asynchronous custom-call versus synchronous call | RAW_ONLY |
| R03 | IREE VM reference lifetime across invocation ABI | IREE VM/HAL source documentation | ref retain/release at producer/consumer seam | RAW_ONLY |
| R04 | CUDA cluster distributed-shared-memory histogram | NVIDIA CUDA Programming Guide | local shared-memory / cluster DSM placement | DEEP_D2 |
| R05 | CUDA `cuda::pipeline` async-copy commit/wait boundary | NVIDIA CUDA C++ programming-model source route | staged asynchronous copy and ordinary load path | RAW_ONLY |
| R06 | cuDNN finalized graph engine-plan selection | NVIDIA cuDNN graph API | legal engine-plan selection for same graph | RAW_ONLY |

All screen rows are compiler/runtime/accelerator semantics. No security or exploit topic was screened.
