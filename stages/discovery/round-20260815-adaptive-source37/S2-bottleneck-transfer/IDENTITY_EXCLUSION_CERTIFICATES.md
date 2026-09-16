# Identity / terminal-containment certificates — Source37 S2

No selected Source37 locator is excluded as an exact Source25–36 identity or as terminal containment.

| Source37 family | object | endpoint | action / estimator | mechanism | comparator / guarantee | relation to earlier surface |
|---|---|---|---|---|---|---|
| GPUDirect Storage cuFile batch construction | fixed file-offset/GPU-buffer I/O transaction set under cuFile semantics | read/write completion and byte/status semantics | build a batch/stream submission | direct storage DMA / async completion | stock cuFile status and FIFO semantics | Related to prior data-movement theme only; not same object/action/endpoint. |
| Vulkan device-generated commands | fixed Vulkan indirect-command workload and command-buffer semantics | generated command execution semantics | device command layout/preprocess construction | device-side command materialization | Vulkan DGC validity/synchronization contract | Related accelerator command-materialization surface only; not same tool or endpoint. |
| CUDA Cluster Launch Control | fixed irregular CUDA kernel and output/memory contract | kernel completion/output contract | in-kernel cancel/claim work action | cluster work stealing | CUDA cluster-launch-control semantics | Related to prior CUDA cluster/DSM only; distinct action and endpoint. |

No STOP/terminal negative witness was transferred. Broad tool, GPU, ISA, carrier, or genealogy overlap is `RELATED_ONLY`, as required.
