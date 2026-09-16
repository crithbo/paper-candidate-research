# Source120 S1 Primary RQs

1. `RQ01`: Do the frozen StableHLO quantized golden tests define a backend-independent bit-exact oracle whose disagreements change whether a consumer may claim quantized-op conformance?
2. `RQ02`: Can the frozen VHLO compatibility corpus be extended from syntactic identity to semantic interpreter equivalence without changing StableHLO's stated compatibility guarantee?
3. `RQ03`: Do frozen spec/interpreter fixtures expose a reproducible class of spec-covered operations whose reference execution remains unavailable or divergent enough to change consumer validation?
4. `RQ04`: Do frozen ONNX QuantizeLinear node fixtures distinguish backend rounding/saturation behavior strongly enough to change backend conformance decisions?
5. `RQ05`: Do frozen ONNX DequantizeLinear fixtures cover per-axis and low-bit boundaries strongly enough to prevent a backend from passing while omitting decision-relevant semantics?
6. `RQ06`: Can the frozen ONNX-MLIR disabled per-axis DequantizeLinear fixture support a faithful negative replication that changes the backend's declared conformance envelope?
7. `RQ07`: Can frozen PRIVATE_TOOLCHAIN comparative artifacts and input/output arrays define a same-workload cross-compiler accuracy/ranking validity benchmark with complete setup cost?
8. `RQ08`: Does the frozen StableHLO quant-to-int/QDQ fallback fixture define a non-generic lowering action that preserves quantization semantics while avoiding pipeline failure?

Each RQ keeps the carrier, semantic guarantee and contribution type stable; no result-aware reformulation or backfill is allowed.
