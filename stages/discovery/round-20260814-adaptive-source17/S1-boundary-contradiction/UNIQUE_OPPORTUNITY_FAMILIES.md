# Opportunity-family cards

| Signature | Research question / two-plan tension | Fairness, cost and finite falsifier |
|---|---|---|
| STABLEHLO_VHLO__PORTABLE_ARTIFACT__CROSS_VERSION_SEMANTIC_CONFORMANCE | Can a versioned artifact be converted by a different complete action while retaining the exact StableHLO semantic guarantee? | Current VHLO converter is strongest subtractor. Compatibility corpus/interpreter; serialize/deserialize CPU-RSS, artifact bytes, conversion time and result equivalence; one inequivalent result or unsupported downgrade kills. |
| CUDA_GRID_CONSTANT__GRID_LIFETIME_PARAMETER__FIXED_KERNEL_SEMANTICS | Can parameter materialization change while preserving shared address, read-only and grid lifetime? | CUDA compiler extension is subtractor; public kernel/semantic oracle; compile CPU-RSS, local memory, bytes and runtime; any address/lifetime difference kills. |
| ROCR_AQL_QUEUE__COMPLETION_SIGNAL__FIXED_OBSERVABILITY | Can packet/completion placement change without changing completion observable order? | ROCR queue/signal contract subtractor; queue/status oracle; enqueue CPU, signal latency, packet bytes and memory; order violation kills. |
| CUDA_TILE_CONSTANT__SPECIALIZATION_BOUNDARY__FIXED_TENSOR_RESULT | Can runtime/compile-time constant placement preserve kernel result and compilation contract? | Tile compiler specialization subtractor; tile examples/result oracle; compile CPU-RSS, code bytes, device time and memory; changed specialization/result kills. |
