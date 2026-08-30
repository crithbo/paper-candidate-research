# Source closure

The primary RQ was closed only against first-party PyTorch sources. `torch.compile` already provides graph compilation caches, guard/recompile limits, eager fallback, `reduce-overhead` CUDA-graph mode and workspace caching; CUDA Graph APIs provide capture and graph-pool semantics; CUDAGraph Trees provide native memory/iteration management. The PyTorch caching guide documents compiler/FX/Triton/PGO/autotuning cache surfaces and their cost-relevant scope.

Therefore the frozen capture/cache proposal has no distinct target-native action, information condition, or full-cost construction. It is excluded before raw as a generic wrapper/configuration of the existing controls. This conclusion is limited to the frozen RQ and does not generalize to other compiler or LLM-runtime opportunities.
