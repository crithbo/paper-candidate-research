# Source117 S4 low-bit conformance pre-RQ closure ledger

## Bounded primary carriers

- ONNX 1.23 QuantizeLinear specification: `https://onnx.ai/onnx/operators/onnx__QuantizeLinear.html`.
- ONNX backend QuantizeLinear test source: `https://github.com/onnx/onnx/blob/main/onnx/backend/test/case/node/quantizelinear.py`.
- ONNX Runtime current CPU QDQ source: `https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/core/providers/cpu/quantization/quantize_linear.cc`.
- GGUF current specification: `https://github.com/ggml-org/ggml/blob/master/docs/gguf.md`.
- TorchAO public current overview/configuration: `https://github.com/pytorch/ao`.

## Required packet fields and result

Every admitted RQ needs exact format/spec/opset/quant scheme; current parser/lowering source and default/non-default flags; canonical fixture or natural model; same-tensor/graph semantics; strong current backend comparator; full cost; and finite falsifier. Debug additionally needs a true fault.

| RQ | carrier obtained | missing field bundle | disposition |
|---|---|---|---|
| S4-117-RQ01 | ONNX spec/test + ORT source | frozen fixture/output, comparator, flags, full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-117-RQ02 | ORT source | opset fixture, comparator, flags, full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-117-RQ03 | GGUF spec | fixture, comparator, flags, same-tensor result, full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-117-RQ04 | TorchAO config surface | exact source/test/fixture, true fault, comparator, full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-117-RQ05 | generic public carrier surfaces | complete same-object packet | PRE_RQ_NONADMISSION |

No carrier is treated as novelty, absence, true fault, selected locator, raw admission, scientific DROP, or STOP. No source was downloaded, built, or executed.

