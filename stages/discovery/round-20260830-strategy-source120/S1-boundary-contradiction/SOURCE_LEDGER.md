# Source120 S1 Source Ledger

- Assignment: `DISCOVERY-S1-20260830-SOURCE120-EXACT-CARRIER`
- Cutoff: `2026-08-30 Asia/Shanghai`
- Source-call accounting: `24/24` official-source search/open calls; no non-official source was used as decisive evidence.
- Read mode: documentation/source inspection only; no download, build, execution, or experiment.

## Calls and decision-changing evidence

| Call range | Official surface | Read depth | Decision-changing result |
|---|---|---|---|
| 1-4 | StableHLO, ONNX, MLIR/PRIVATE_TOOLCHAIN official repositories and documentation | search snippets | Located eight exact public carriers before RQ convergence. |
| 5-8 | StableHLO quantization/VHLO tests; ONNX QuantizeLinear/DequantizeLinear backend tests | search snippets | Confirmed canonical test-corpus identities and narrowed RQ01-RQ06. |
| 9-14 | StableHLO compatibility/interpreter/quantization/Python/VHLO; ONNX-MLIR inference backend | sections/source | Compatibility guarantee is semantic, current VHLO suite is syntactic; interpreter/check APIs exist; ONNX-MLIR explicitly disables a per-axis DequantizeLinear test. |
| 15-18 | StableHLO issues/current source; ONNX Runtime current quantization source; PRIVATE_TOOLCHAIN comparative benchmark | search snippets/source | Found official future-work absorption for the generic “run the interpreter” action; found contrary current per-axis/blocked support in ONNX Runtime; froze PRIVATE_TOOLCHAIN artifact capabilities. |
| 19 | [StableHLO compatibility](https://github.com/openxla/stablehlo/blob/main/docs/compatibility.md) | full relevant sections | Five-year backward/two-year forward guarantees require same semantics; current suite checks syntactic identity; semantic reference testing is future work; numerical accuracy is out of scope. |
| 20 | [StableHLO interpreter design](https://github.com/openxla/stablehlo/blob/main/docs/reference.md) | full relevant sections | Interpreter is a readable reference implementation and supports exact and tolerance-aware check operations. |
| 21 | [StableHLO quantization](https://github.com/openxla/stablehlo/blob/main/docs/quantization.md) | sections | Official quantized golden tests are intended for cross-validation, but do not by themselves establish compatibility coverage. |
| 22 | [StableHLO VHLO test directory](https://github.com/openxla/stablehlo/tree/main/stablehlo/tests/vhlo) | repository surface | Directory carrier is current; web renderer failed, so conclusions rely on the separately inspected test file and compatibility documentation. |
| 23 | [StableHLO issue #1245](https://github.com/openxla/stablehlo/issues/1245) | issue sections | Directly absorbs the generic action “use the interpreter in testdata”; any candidate must make a stricter residual contribution. |
| 24 | [StableHLO specification](https://github.com/openxla/stablehlo/blob/main/docs/spec.md) | specification sections | The specification is the semantic authority, but includes implementation-defined/undefined regions requiring typed oracle classes rather than blanket numerical equality. |

## Additional exact official locators used in calls 9-18

- [StableHLO Python tests](https://github.com/openxla/stablehlo/blob/main/stablehlo/integrations/python/tests/stablehlo.py)
- [StableHLO VHLO compatibility test file](https://github.com/openxla/stablehlo/blob/main/stablehlo/tests/vhlo/serialize_compatibility.mlir)
- [ONNX QuantizeLinear node tests](https://github.com/onnx/onnx/blob/main/onnx/backend/test/case/node/quantizelinear.py)
- [ONNX DequantizeLinear node tests](https://github.com/onnx/onnx/blob/main/onnx/backend/test/case/node/dequantizelinear.py)
- [ONNX-MLIR inference backend exclusions](https://github.com/onnx/onnx-mlir/blob/main/test/backend/inference_backend.py)
- [ONNX Runtime CPU quantize/dequantize source](https://github.com/microsoft/onnxruntime/tree/main/onnxruntime/core/providers/cpu/quantization)
- [PRIVATE_TOOLCHAIN comparative benchmark](https://github.com/PRIVATE_TOOLCHAIN-org/PRIVATE_TOOLCHAIN/tree/main/experimental/regression_suite)

## Stopping rationale

The high-impact official surfaces are bounded. RQ02 is decision-ready for a cautious Stage 0 proposal only after subtracting the official #1245 plan. RQ01/RQ03 are contained strata of RQ02; RQ04/RQ05/RQ07 are already largely represented by their native test/benchmark unions; RQ06 is a backend support gap with contrary implementation evidence; RQ08 is absorbed by current fallback/pass work. Further calls would exceed the frozen budget and are not required to state these bounded dispositions.
