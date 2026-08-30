# Exact public anchors — Source72

| RQ | Fixed object / stock oracle | Official primary anchor | Role |
|---|---|---|---|
| RQ-S72-01 | Fixed IR program, target and stock VMFB runtime result | Prior Source54 exact IREE VMFB current/stock-loader anchor | Exact history containment check; no rescreen without external delta. |
| RQ-S72-02 | Fixed network, builder profile/precision and stock TensorRT engine inference | https://docs.nvidia.com/deeplearning/tensorrt/latest/inference-library/capabilities.html | Current engine build/serialized-plan/runtime contract. |
| RQ-S72-03 | Fixed source/object set, target, executable ABI and GCC LTO semantics | https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html | Current `-flto` merge, partition, incremental/cache and linker-plugin action surface. |

Anchors are locators only; no current absence or novelty claim is inferred.
