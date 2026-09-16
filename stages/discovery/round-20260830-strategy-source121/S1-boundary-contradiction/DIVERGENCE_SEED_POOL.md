# Source121 S1 Exact-Carrier Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260830-SOURCE121 / DISCOVERY_S1`
- Frozen profile: `EXACT_PUBLIC_CARRIER_FIRST / BOUNDARY_CONTRADICTION`
- Seed ceiling: `10 <= 12`
- RQ candidate ceiling: `8 <= 8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Excluded predecessor family: `SOURCE120-S1-VHLO-SEMANTIC-COMPAT`
- Scientific status: seeds are non-evidence sketches and make no novelty/current-absence/Q2 claim.

## Frozen seed records

| Seed | Exact public anchor candidate | Boundary/contradiction sketch | Preliminary disposition |
|---|---|---|---|
| S121-S1-01 | ONNX `QuantizeLinear` operator schema and official node backend tests | Schema-defined rounding, saturation, axis, block and low-bit boundaries may not be decision-equivalent to aggregate backend “supported” labels. | KEEP_FOR_CONVERGENCE |
| S121-S1-02 | ONNX `DequantizeLinear` schema and official node backend tests | Per-tensor/per-axis/blocked/low-bit cases may expose a coverage-envelope boundary hidden by a single pass/fail conformance label. | KEEP_FOR_CONVERGENCE |
| S121-S1-03 | ONNX Runtime CPU QuantizeLinear/DequantizeLinear provider tests and kernels | Current provider execution paths may implement a different subset or error policy from schema-level fixtures; the exact mismatch must be source-checked. | KEEP_FOR_CONVERGENCE |
| S121-S1-04 | ONNX Runtime QDQ transformer tests and graph rewrite source | A graph rewrite may preserve tensor values locally while changing quantization-domain boundaries that determine later partition/fusion legality. | KEEP_FOR_CONVERGENCE |
| S121-S1-05 | ONNX Runtime quantization Python test fixtures/quantizer selector paths | The exporter/quantizer may emit QDQ patterns accepted by the graph but excluded by execution-provider selectors, creating a canonical fallback carrier. | KEEP_FOR_CONVERGENCE |
| S121-S1-06 | ONNX-MLIR `test/backend/inference_backend.py` disabled per-axis DequantizeLinear case | An explicit disabled conformance fixture may support a faithful negative-replication envelope, but may collapse to ordinary missing support. | KEEP_FOR_CONVERGENCE |
| S121-S1-07 | ExecuTorch XNNPACK quantizer tests and backend partitioner fixtures | Quantized nodes may be legal in exported IR yet split into delegated and fallback regions under backend-specific constraints; exact semantics and cost must remain fixed. | KEEP_FOR_CONVERGENCE |
| S121-S1-08 | ExecuTorch backend/delegate fallback tests for quantized operators | Fallback correctness can preserve outputs while incurring boundary conversion, layout or host costs absent from operator-support summaries. | KEEP_FOR_CONVERGENCE |
| S121-S1-09 | PyTorch PT2E reference quantized representation and ExecuTorch lowering tests | Reference Q/DQ representation and target backend representation may be semantically equivalent only under a bounded observer/scale/zero-point contract. | KEEP_FOR_CONVERGENCE |
| S121-S1-10 | ONNX low-bit (`int4/uint4/float8`) type/operator test fixtures | Packing, nibble order and saturation rules form exact semantic boundaries, but a standalone conformance extension risks being ordinary test maintenance. | KEEP_FOR_CONVERGENCE |

## Convergence freeze

| Selected seed | Coverage reason | Frozen RQ |
|---|---|---|
| S121-S1-01 | canonical schema/test boundary | RQ01 |
| S121-S1-02 | canonical dequantization coverage boundary | RQ02 |
| S121-S1-03 | current implementation-vs-schema boundary | RQ03 |
| S121-S1-04 | rewrite legality/value-equivalence boundary | RQ04 |
| S121-S1-05 | producer-selector fallback boundary | RQ05 |
| S121-S1-06 | exact negative-replication carrier | RQ06 |
| S121-S1-07 | current exported-IR/delegate boundary | RQ07 |
| S121-S1-08 | correctness/full-cost fallback boundary | RQ08 |

S121-S1-09 and S121-S1-10 remain append-only non-evidence backlog. No result-aware replacement is permitted after targeted source lookup begins.

## Advisory

- Engines used: `BOUNDARY_OR_FAILURE`, `JANUSIAN_TENSION`, `COMPOSE_DECOMPOSE_SIMPLIFY`, `NATURAL_OR_CANONICAL_EVIDENCE`
- Perspective roles: backend engineer, compiler maintainer, measurement reviewer, operator
- Largest surface share: ONNX/ONNX Runtime QDQ
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
