# CUDA/GPU Discovery 第14波：来源与检索边界

检索日期：2026-08-02。仅作 Discovery 的一手来源核验；没有执行 CUDA、GPU 或大实验。

| 领域 | 已核验一手来源 | 对筛查的用途 |
|---|---|---|
| CUDA 同步 | [CUDA Programming Guide: Cooperative Groups](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/cooperative-groups.html) | 确认 `sync`/barrier 的集体语义与成员参与限制；不能把 barrier 插入包装成新机制。 |
| cuFFT | [cuFFT 13.3 documentation](https://docs.nvidia.com/cuda/cufft/index.html) | 确认 plan 初始化含 heuristic/JIT 与 driver cache；其余只是缓存/预热 selector 的候选直接扣减。 |
| cuFFT callbacks | [cuFFT callback documentation](https://docs.nvidia.com/cuda/archive/11.0/cufft/index.html#callback-routines) | 确认 callback 功能、factorization/同步限制；不足以构成自然 workload。 |
| CUTLASS | [NVIDIA CUTLASS repository](https://github.com/NVIDIA/cutlass)；[profiler instructions](https://github.com/NVIDIA/cutlass#performance-profiling) | 确认有可审计 kernel/profiler 与完整 tile/layout/schedule 空间，作为强联合基线。 |
| CUDA samples | [NVIDIA CUDA Samples](https://github.com/NVIDIA/cuda-samples) | 样例是 API 演示，不能自动升级为自然 workload。 |
| TensorRT | [ONNX-TensorRT](https://github.com/onnx/onnx-tensorrt)；[TensorRT-LLM piecewise graph notes](https://github.com/NVIDIA/TensorRT-LLM/blob/main/docs/source/features/torch_compile_and_piecewise_cuda_graph.md) | 确认动态 shape/分段图存在；profile/graph portfolio 与已有 graph/guard 核碰撞。 |
| cuSOLVER | [cuSOLVER 13.3 documentation](https://docs.nvidia.com/cuda/cusolver/) | 确认库有 mixed-precision iterative refinement、低精度 factorization 和失败时高精度 fallback；这是候选必须超越的原生行为。 |
| CUB segmented radix | [CCCL `DeviceSegmentedRadixSort` API](https://nvidia.github.io/cccl/unstable/cub/api/structcub_1_1DeviceSegmentedRadixSort.html) | 确认 segment-offset、stable key/value sorting、bit-subrange 与临时存储语义；这些构成冻结对象与 full-cost 边界。 |
| 自然稀疏输入 | [SuiteSparse Matrix Collection](https://sparse.tamu.edu/) | 确认存在广泛应用来源的公开稀疏矩阵集合；RHS/预条件器和版本化清单仍须 Stage 0 冻结。 |
| 既有 IR | [Mixed precision iterative refinement using tensor cores on GPUs](https://pmc.ncbi.nlm.nih.gov/articles/PMC7735315/)；[adaptive sparse approximate-inverse IR](https://doi.org/10.1007/s00366-025-02187-z) | 是 GPU mixed-precision/自适应 preconditioner 的直接扣减；尚未作为“已完全同一 certificate”处理。 |

## 检索式与边界

- `site:docs.nvidia.com CUDA cuBLASLt heuristics API workspace preference`
- `site:docs.nvidia.com CUDA CUB DeviceSegmentedRadixSort`
- `site:docs.nvidia.com CUDA cuFFT callback plan cache`
- `site:docs.nvidia.com CUDA Cooperative Groups grid group synchronization`
- `site:github.com NVIDIA CUTLASS profiler kernel manifest`
- `site:github.com NVIDIA TensorRT dynamic shapes`

以上仅支持对象/API/artifact 存在性。对论文新颖性均标记为 `SEARCH_BOUNDED_OPEN`，不声称首次提出。
