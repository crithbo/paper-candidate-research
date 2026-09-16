# Source121 S1 Frozen Primary RQs

- Freeze point: before the first external source call.
- Object/guarantee may not be changed after evidence lookup.
- No optional alternate RQ is needed; each primary question is independently answerable.

## RQ01 — ONNX QuantizeLinear semantic coverage

Can the official ONNX QuantizeLinear schema and node-test carrier support a decision-relevant, coverage-weighted backend conformance claim across axis, block, rounding, saturation and low-bit classes without treating unsupported schema regions as passing?

## RQ02 — ONNX DequantizeLinear boundary coverage

Does the official DequantizeLinear test carrier distinguish per-tensor, per-axis, blocked and low-bit semantics strongly enough to change a backend’s declared conformance envelope under one fixed denominator?

## RQ03 — ONNX Runtime schema-to-provider conformance

For the exact ONNX QuantizeLinear/DequantizeLinear contract, can schema-derived fixtures reveal a reproducible current CPU-provider semantic or error-policy boundary not already represented by ONNX Runtime’s native tests?

## RQ04 — ONNX Runtime QDQ rewrite semantic boundary

Can an exact QDQ transformer fixture define a non-generic oracle that distinguishes value-preserving graph cleanup from preservation of quantization-domain boundaries needed by subsequent fusion or partition decisions?

## RQ05 — producer-to-selector fallback envelope

Can frozen ONNX Runtime quantizer outputs and execution-provider QDQ selector rules define a same-model fixture panel whose fallback classification changes a fixed deployability or full-cost decision rather than merely reporting unsupported operators?

## RQ06 — ONNX-MLIR per-axis negative replication

Can the explicitly disabled per-axis DequantizeLinear backend fixture support a faithful, current negative replication that changes ONNX-MLIR’s declared conformance envelope and remains paper-scale after comparison with current supporting implementations?

## RQ07 — ExecuTorch XNNPACK quantized partition boundary

Can official quantizer and partitioner fixtures define a canonical panel where identical exported quantized semantics lead to backend delegation/fallback splits that change a fixed placement decision under complete boundary-conversion cost?

## RQ08 — ExecuTorch quantized fallback full-cost validity

Do official delegate/fallback fixtures permit a benchmark-validity contribution showing when output-correct quantized fallback reverses a backend ranking after conversion, layout, synchronization and host costs are charged?

## Precommitted source roles

| RQ | ANCHOR | CURRENT | CONTRARY | Minimum stop condition |
|---|---|---|---|---|
| RQ01-02 | ONNX schemas + node tests | current ONNX source/tests | existing backend-test semantics | native carrier already defines proposed denominator/action |
| RQ03-05 | ONNX Runtime kernels/transformer/quantizer tests | current source and flags | current native test/selector union | proposed oracle/action already implemented or only generic coverage remains |
| RQ06 | ONNX-MLIR disabled test | current backend support source | a current supporting backend and ONNX-MLIR recent source | ordinary missing support with no general endpoint |
| RQ07-08 | ExecuTorch XNNPACK quantizer/partitioner/fallback tests | current docs/source/config | current delegate profiling/partition tools | current union already exposes the same decision/full-cost endpoint |

No seed or RQ may be added after this freeze. Transport fallback may change only how the same official source is reached.
