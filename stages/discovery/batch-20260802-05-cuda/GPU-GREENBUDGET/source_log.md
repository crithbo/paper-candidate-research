# GPU-GREENBUDGET source log

Search date: 2026-08-02. Query families: `CUDA Green Context resource partition latency throughput`, `Green Context SM workqueue dynamic scheduling`, `CUDA MPS active thread percentage Green Context`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [CUDA Green Contexts](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/green-contexts.html) | official documentation | exact API semantics, static-isolation baseline, legal resource splits, workqueue caveat, and non-guaranteed-concurrency warning |
| [CUDA Driver API: Green Contexts](https://docs.nvidia.com/cuda/cuda-driver-api/group__CUDA__GREEN__CONTEXTS.html) | official API reference | resource descriptors, split constraints, reuse, and explicit concurrency limits |
| [CUDA MPS active thread percentage](https://docs.nvidia.com/deploy/topics/topic_5_2_5.html) | official documentation | MPS baseline control surface |
| [CUPTI Green Context release notes](https://docs.nvidia.com/cuda/developer-preview/13.4/cupti/release-notes/release-notes.html) | official documentation | trace/profiling support for green-context allocations |

Search-bounded result: found official static partitioning mechanisms and observability, but no verified request-class-aware epochal controller with complete idle/reconfiguration accounting. Stage 0 must verify whether APIs permit the planned transition protocol and search for prior systems work.

