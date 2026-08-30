# S4-117-RQ01

- Pre-lookup denylist check: `DISTINCT`.
- Frozen question: can ONNX QuantizeLinear/DequantizeLinear per-axis or blocked semantics define a bit-exact cross-backend conformance endpoint?
- Bounded carriers: ONNX 1.23 QuantizeLinear specification and ONNX backend QuantizeLinear test source; ORT current CPU quantization source.
- Result: `PRE_RQ_NONADMISSION`. No single frozen opset/fixture input-output hash, current competing backend result, default/non-default parser/lowering flags, complete conversion/dequant cost, or finite cross-backend falsifier is present in the bounded loci.

