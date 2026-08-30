# Source117 S1 offline seed pool

All seeds pass Source116 denylist before lookup; no exact/contains selection.

| Seed | Frozen pre-evidence idea |
|---|---|
| S117-01 | ONNX QDQ rounding/zero-point/axis may map differently into a current backend; only a same graph/fault/canonical fixture route qualifies. |
| S117-02 | TorchAO derived dtype semantics may not survive export/lowering; require current source plus exact format/flags and strong backend comparator. |
| S117-03 | GGUF k-quant metadata and a public parser may differ on overflow/scale interpretation; require true current fault, not format support. |
| S117-04 | StableHLO/MLIR quantization lowering may lose axis semantics; require exact opset/spec/current test and native model graph. |
| S117-05 | ExecuTorch/OpenVINO low-bit fallback may alter rounding behavior; require current source/flags and same tensor endpoint. |
| S117-06 | A conformance suite could be a benchmark contribution only if it changes a fixed cross-backend decision beyond existing spec tests. |

Selected RQs S117-01..06; no outcome-aware replacement.
