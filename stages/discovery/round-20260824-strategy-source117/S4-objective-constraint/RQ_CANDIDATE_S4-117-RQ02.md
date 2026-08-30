# S4-117-RQ02

- Pre-lookup denylist check: `DISTINCT`.
- Frozen question: can ONNX blocked QDQ semantics remain interoperable for a fixed sub-byte tensor across current parsers?
- Bounded carrier: ORT current `quantize_linear.cc` source, which exposes blocked/per-axis shape checks and the dequantization computation path.
- Result: `PRE_RQ_NONADMISSION`. Current source alone does not freeze an ONNX opset fixture, same-tensor comparator output, parser/lowering flag state, full-cost denominator, or finite falsifier.

