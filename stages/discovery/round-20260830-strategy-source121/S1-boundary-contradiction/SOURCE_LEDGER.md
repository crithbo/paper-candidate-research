# Source121 S1 Source Ledger

- Assignment: `DISCOVERY-S1-20260830-SOURCE121`
- Cutoff: `2026-08-30 Asia/Shanghai`
- Source calls: `24/24`
- Method: official/primary source search and open only; no download, build, experiment, or result-aware backfill.

## Call accounting

| Calls | Role | Surfaces | Decision effect |
|---|---|---|---|
| 1-4 | ANCHOR | ONNX Q/DQ schemas/tests; ONNX Runtime; ExecuTorch quantization | Located exact carriers for the eight frozen RQs. |
| 5-8 | CURRENT | ExecuTorch quantization, developer tools, backend fallback; ORT transformer queries | Confirmed backend-specific quantization, CPU fallback and observable delegated events. |
| 9-12 | CURRENT | ExecuTorch partition/export tests/configs; ORT QDQ transformer source queries | Found current config/partition observability; no missing-action claim retained. |
| 13-16 | CURRENT/CONTRARY | ONNX-MLIR backend exclusions; ORT quantizer/registry/current source | ONNX-MLIR per-axis item reduced to ordinary missing support; ORT current union absorbed RQ03-RQ05. |
| 17-20 | ESCAPE/CONTRARY | ExecuTorch/fallback benchmarking and adjacent delegate literature | Found general fallback-overhead work and current framework benchmarking, but no same-object direct coverage of the frozen ranking-validity estimand within the bound. |
| 21-24 | DECISIVE OPEN | ExecuTorch backend overview, Inspector API, LLM export/quantization docs, QNN debugger | Closed the RQ08 carrier, observable estimand, comparator and numerical-validity boundary. |

## Decisive primary sources

1. [ONNX QuantizeLinear schema](https://onnx.ai/onnx/operators/onnx__QuantizeLinear.html) — exact rounding, saturation, axis, blocked and low-bit semantics.
2. [ONNX backend-test contract](https://github.com/onnx/onnx/blob/main/docs/OnnxBackendTest.md) — backend verification and operator expected-behavior carrier.
3. [ONNX-MLIR backend test configuration](https://github.com/onnx/onnx-mlir/blob/main/test/backend/inference_backend.py) — current per-axis DequantizeLinear exclusion and supported per-tensor route.
4. [ONNX Runtime QDQ quantizer](https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/quantization/qdq_quantizer.py) and [quantization registry](https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/quantization/registry.py) — current producer/operator union.
5. [ExecuTorch backend overview](https://github.com/pytorch/executorch/blob/main/docs/source/backends-overview.md) — AOT partitioning, portable CPU fallback and backend-specific artifacts.
6. [ExecuTorch LLM export](https://github.com/pytorch/executorch/blob/main/docs/source/llm/export-llm.md) — fixed quantization/backend configuration, `extended_ops`, verbose delegation table and ETRecord generation.
7. [ExecuTorch Inspector API](https://docs.pytorch.org/executorch/stable/model-inspector.html) — per-event performance, delegated status/backend identity, graph linkage and numerical-gap API.
8. [ExecuTorch quantization overview](https://github.com/pytorch/executorch/blob/main/docs/source/quantization-overview.md) — backend-specific quantizers and warning that device numerics can differ from PyTorch.
9. [ExecuTorch QNN debugger](https://github.com/pytorch/executorch/blob/main/backends/qualcomm/debugger/README.md) — contrary validity warning: transformed edge output must be checked against the original module before it is used as a golden reference.
10. [ExecuTorch system paper locator](https://openreview.net/pdf?id=jmE5nwC9kb) — current system-level benchmark/genealogy locator; full same-object facet audit remains Stage 0 debt.

## Search boundary and stopping

The official-source budget is exhausted. RQ01-RQ05 are absorbed by native schema/test/quantizer/transformer surfaces; RQ06 is an explicit implementation support limitation without paper-scale residual. RQ07 merges into RQ08 as the partition-observability prerequisite. RQ08 remains `SEARCH_BOUNDED_OPEN`, not a novelty claim: Stage 0 must independently audit the system paper and same-object measurement tools.
