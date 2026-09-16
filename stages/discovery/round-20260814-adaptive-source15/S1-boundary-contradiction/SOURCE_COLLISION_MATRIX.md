# Source/collision matrix

| Family | Official/primary current source | Current-union conclusion |
|---|---|---|
| Rust AsyncDrop | [Rust AsyncDrop API](https://doc.rust-lang.org/stable/core/future/trait.AsyncDrop.html); [panic source](https://doc.rust-lang.org/stable/src/core/panicking.rs.html) | Nightly experimental API; whole source/config/action union not bounded: raw only. |
| Clang BMI | [Clang standard C++ modules](https://clang.llvm.org/docs/StandardCPlusPlusModules.html) | One/two phase production is build orchestration; no noncontroller same-object mechanism. |
| HIPRTC | [HIPRTC source/API](https://rocm.docs.amd.com/projects/HIP/en/latest/doxygen/html/hiprtc_8h.html) | Explicit current compilation/link composition absorbs the proposed selector. |
| ROCR executable | [ROCR current documentation](https://rocm.docs.amd.com/_/downloads/ROCR-Runtime/en/master/pdf/) | Code object must outlive loaded executable; supposed alternate breaks fixed guarantee. |
| CUDA device graph launch | [CUDA graph guide](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/cuda-graphs.html) | Device/host dispatch and graph topology contract not closed as a same-interface algorithm: raw only. |
| Pallas/Mosaic DMA | [OpenXLA async operations](https://openxla.org/xla/async_ops) | Source/config/action union not bounded: `NOT_ADMITTED_UNFROZEN`. |

Search is bounded to 2026-08-14 and uses no issues, future-work statements or prohibited security material as absence evidence.
