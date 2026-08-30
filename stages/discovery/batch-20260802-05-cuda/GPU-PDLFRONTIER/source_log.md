# GPU-PDLFRONTIER source log

Search date: 2026-08-02. Query families: `CUDA programmatic dependent launch compiler optimization`, `dependent launch compiler frontier`, `CUTLASS dependent kernel launch`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [CUDA Programmatic Dependent Launch and Synchronization](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/programmatic-dependent-launch.html) | official documentation | defines the primary/secondary contract, trigger, mandatory synchronization, opportunistic-overlap limit, graph-edge form, and CC 9.0 requirement |
| [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-programming-guide/) | official documentation | canonical CUDA feature and execution-semantics reference |
| [CUDA 13.0 programming-guide archive](https://docs.nvidia.com/cuda/archive/13.0.0/cuda-c-programming-guide/index.html) | official documentation | independently records the dependent-launch availability and intended overlap model |
| [CUTLASS repository](https://github.com/NVIDIA/cutlass) | open artifact | source substrate for natural producer/consumer kernel pairs and dependent-launch examples to inspect |

Search-bounded result: official material specifies safe manual PDL but no verified compiler that searches producer readiness frontiers with the stated cost model. Stage 0 must search papers and inspect CUDA/CUTLASS PDL implementations before claiming novelty.

