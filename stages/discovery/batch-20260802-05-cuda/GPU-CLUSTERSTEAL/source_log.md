# GPU-CLUSTERSTEAL source log

Search date: 2026-08-02. Query families: `CUDA Cluster Launch Control work stealing Blackwell`, `GPU irregular tiles work stealing CUDA`, `cluster launch control preemption load balance`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [CUDA Cluster Launch Control](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/cluster-launch-control.html) | official documentation | defines CLC, cancellation, work stealing, and its stated fixed-work/fixed-block trade-off |
| [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-programming-guide/) | official documentation | architecture and programming-semantics reference |
| [Triton persistent matmul tutorial](https://github.com/triton-lang/triton/blob/main/python/tutorials/09-persistent-matmul.py) | open artifact | persistent-kernel baseline substrate |
| [Triton repository](https://github.com/triton-lang/triton) | open artifact | public kernel/workload source and build substrate |

Search-bounded result: found the primitive and conventional persistent baseline but no verified cancellation-budgeted, locality-aware policy with a measured preemption objective. Stage 0 must inspect NVIDIA samples and Blackwell-related kernel code.

