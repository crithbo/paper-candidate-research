# Exact public anchor

| Field | Frozen value |
|---|---|
| Signature | `ONNXRUNTIME__FIXED_ONNX_GRAPH_INFERENCESESSION__EP_PARTITION_REPEATED_ALLOCATION_PATTERN_JOINT_CONSTRUCTOR__BUILD_REPEAT_FULL_COST` |
| Official sources | `microsoft/onnxruntime` current source: `onnxruntime_session_options_config_keys.h` and C API/session headers, observed 2026-08-15 |
| Exact object | Fixed ONNX graph, weights, provider set/configuration, input shapes/values and stock InferenceSession output semantics |
| Oracle | Stock ONNX Runtime output equality and provider/session legality |
| Strong union | Graph transformations/partitioning, sequential memory pattern, CPU/GPU arenas, memory optimizer and relevant documented provider configuration |
| Carrier route | One version-pinned public ONNX model selected deterministically from the official ONNX Model Zoo after a single source commit/tag is resolved |
| Full cost | Session build/optimization CPU/RSS, allocation pattern construction, repeated-run dispatch/latency, peak RSS/device memory, model/EP bytes and host-device transfers |

The anchor proves stock controls exist, not a current absence or a residual.
