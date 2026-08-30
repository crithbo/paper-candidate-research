# Question Card

- Denylist check: `DISTINCT` from predecessor entries before lookup; object is ONNX Runtime CUDA EP I/O binding, not PyTorch compile or vLLM cache.
- Exact current locus: ONNX Runtime CUDA EP documentation and I/O Binding documentation, retrieved 2026-08-24.
- Frozen object/action/endpoint: CUDA EP inference; device input/output buffer binding and capture/replay lifetime; request-level host/device full-cost effect.
- Contrary/current coverage: CUDA EP documents `enable_cuda_graph`, IOBinding, fixed CUDA virtual addresses, first-run allocation/capture, subsequent replay, user compute stream, copy stream and memory arena options; I/O Binding docs specify CPU/device input/output transfer behavior.
- Full cost: binding/allocation, H2D/D2H copies, stream/synchronization, first capture, cache/replay workspace and GPU execution.
- Falsifier met: current native mechanism expresses the frozen action and full-cost components. No non-generic discriminator remains.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_ORT_CUDA_EP_IOBINDING_CUDAGRAPH_ACTION_COVERAGE`; search stopped at first-party current sources.
