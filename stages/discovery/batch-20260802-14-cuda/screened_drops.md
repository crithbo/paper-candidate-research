# 已筛除对象（不建立候选目录）

这些是独立对象，而不是对保留题的同义改名；筛除只依据明确的 hard gate 或 strongest-union，不把资源不足作为理由。

| ID | 触发的筛除条件 |
|---|---|
| GPU-CUBLASLT-HEURISTIC-PORTFOLIO | `DIRECT_FATAL`: 完整 algorithm/workspace/heuristic selector 拥有同一状态和动作。 |
| GPU-CUB-SEGMENTED-RADIX-ADAPT | `DIRECT_FATAL / object gate`: 公共 CUB API 没有 pass-local digit-width 或 segment coalescing 动作；实现它即更换对象。 |
| GPU-CUFFT-PLAN-PREWARM | `DIRECT_FATAL`: 原生 JIT cache + cache/admission union。 |
| GPU-CUFFT-CALLBACK-FUSE | 缺自然 callback artifact；剩余为 fusion selector。 |
| GPU-CG-PERSISTENT-GRID | CUDA Samples 是演示，非自然 workload；Cartesian DSE 覆盖。 |
| GPU-CUTLASS-DSL-COMPILEBUDGET | 编译预算 portfolio 是普通 selector，且与动态编译失败核邻接。 |
| GPU-TENSORRT-SHAPE-PROFILECUT | profile/engine/fallback union 与 guard/graph 核无独立 residual。 |
| GPU-CUSPARSE-FORMAT-TRANSITION | format/conversion/kernel 完整全成本 union。 |
| GPU-CUB-SCAN-LOOKBACK | 仅实现参数直积，缺自然机制触发。 |
| GPU-COOPGROUP-PARTITION-REPAIR | 禁止复活 CUDA sanitizer/legal-edit repair 核。 |
| GPU-CUDAMEMCPY-ENGINE-ORCHESTRA | 普通依赖调度，无特异 paper kernel。 |
| GPU-CUDA-GRAPH-FFT-REPLAY | 禁止复活 CUDA Graph capture/replay/lifecycle 核。 |
| GPU-NCCL-SKEW-COLLECTIVE | 缺自然 channel-demand trace；不得以 nccl-tests scan 代替。 |
