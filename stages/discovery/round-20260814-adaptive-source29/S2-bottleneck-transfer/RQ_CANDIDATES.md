# Source29 research-question convergence

| RQ | same-object versions written before evidence | selected formulation | source route |
|---|---|---|---|
| RQ-01 | accessor-lowering+ABI; lowering only; runtime ABI only | For a fixed ESIMD kernel's outputs and ABI, is there a target-specific joint lowering guarantee beyond current ESIMD compiler/runtime composition? | Intel ESIMD design notes |
| RQ-02 | DMA descriptor+lifetime; DMA order; runtime parameter update | For a fixed MLIR-AIE NPU program, can a native DMA/lifetime constructor preserve AIE results while bounding materialization costs? | MLIR-AIE runtime sequence reference |
| RQ-03 | ping-pong BO constructor; async queue order; host selector | For a fixed XRT graph/output, does a non-controller BO/GMIO constructor exist beyond XRT's native sync/async/ping-pong union? | XRT 2024.2 native APIs |
| RQ-04 | graph memory constructor; node update; queue selector | For a fixed SYCL command graph, can memory materialization be jointly constructed without relying on graph scheduling? | DPC++ command-graph design |

All variants preserve their stated object and semantic contract; FINER-lite only schedules bounded checking.
