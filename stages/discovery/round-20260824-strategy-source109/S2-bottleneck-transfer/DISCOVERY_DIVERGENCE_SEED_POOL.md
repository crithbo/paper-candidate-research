# Source109 S2 seed pool

| Seed | Denylist check before lookup | Sketch |
|---|---|---|
| S2-109-01 | `DISTINCT`: ONNX Runtime CUDA EP I/O binding host-device transfer, distinct object/action/endpoint from PyTorch compilation cache and vLLM KV policy. | Fixed ORT CUDA inference carrier may avoid host/device copies through bound inputs/outputs; full cost includes binding, allocation, synchronization and host overhead. |
| S2-109-02 | `RELATED_ONLY`: TensorRT/ORT provider transfer optimization; distinct only if ORT I/O binding semantics expose an action unavailable to provider configuration. | Test whether a non-generic buffer-lifetime action survives current ORT controls. |

Selected before lookup: `S2-109-RQ01` from S2-109-01. Exact object: version-pinned ONNX Runtime CUDA Execution Provider I/O-binding inference carrier; endpoint: a target-native host/device full-cost action, not generic transfer profiling.
