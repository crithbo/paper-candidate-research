# R21 raw screen rows

| ID | Opportunity anchor | Current native union / strongest subtractor | Carrier / oracle | D1 outcome |
|---|---|---|---|---|
| R01 | LLVM stackmap/deopt state reconstruction | LLVM stackmap/statepoint lowering and runtime consumer | LLVM tests + stackmap parser | DEEP_D1 |
| R02 | Clang C++ module BMI/object emission | Clang one/two-phase module production | public module tests + `llvm-cxxfilt` | RAW_ONLY |
| R03 | CUDA stream memory operations ordering | CUDA stream memory operation API and stream dependency semantics | CUDA samples/API status oracle | DEEP_D2 |
| R04 | HIP stream memory operations ordering | HIP current stream/event/memory-operation union | ROCm API tests/status oracle | SOURCE_ONLY_UNFROZEN |
| R05 | OpenXLA Async HLO start/done result boundary | HLO async operation lowering/runtime composition | OpenXLA test corpus/HLO verifier | SOURCE_ONLY_UNFROZEN |
| R06 | CUDA device-side graph launch completion visibility | CUDA graph/device launch producer-consumer contract | CUDA graph API/stock graph oracle | RAW_ONLY |

All six are non-security compiler/runtime/accelerator families and each has the R21 triad before any status decision.
