# Source117 S3 static source-closure log

## Scope and resource record

- Scientific mode: public static source/specification closure only; no build, experiment, download, source-tree copy, or system action.
- `RESOURCE_INVENTORY.yaml`: precreated empty inventory; no resource update.
- Forbidden inputs not read: group repository, CRFEPOCH materials, Source117 future audit.
- Strong-model/selective-depth slot: `NOT_RUN` (frozen `selective_depth=OFF`).

## Source roles and bounded results

| RQ | Role | Exact public source/version | Current locus / flags checked | Contrary or limiting fact | Closure result |
|---|---|---|---|---|---|
| S3-117-RQ01 | operator semantics + current backend | ONNX 1.23.0 QuantizeLinear/DequantizeLinear docs; ORT `main` `onnxruntime/python/tools/quantization/quantize.py` | QDQ config, `per_channel`, opset 21 type handling, `UseQDQContribOps` | no frozen natural graph or endpoint; current options make a generic missing-path premise unsafe | `PRE_RQ_NONADMISSION` |
| S3-117-RQ02 | exact format specification | ggml `master` `docs/gguf.md` (GGUF v3) | tensor type, alignment, quantization metadata | encoding arrangement may be user-code dependent; no frozen loader pair/model or conversion endpoint | `PRE_RQ_NONADMISSION` |
| S3-117-RQ03 | typed IR specification | StableHLO current spec and quantization guide | `uniform_quantize`, `uniform_dequantize`, per-axis quantized dimension, same-shape constraints | no current backend parser/lowering/flag plus no named natural IR fixture | `PRE_RQ_NONADMISSION` |

## Search boundary

- One bounded official-spec/current-source route per selected RQ; no paper sweep, artifact download, or substitute-topic search was performed.
- Search stopping condition: if the frozen tuple lacks any of `natural/canonical fixture`, `current parser/lowering with flags`, `same-object current comparator`, or `decision endpoint`, it cannot enter raw. Each selected RQ reached this condition.
- `SEARCH_BOUNDED_OPEN` is not asserted because no raw candidate was admitted; no `NO_MATCH` claim is made.

## Source locators

- ONNX QuantizeLinear 1.23.0: https://onnx.ai/onnx/operators/onnx__QuantizeLinear.html
- ONNX DequantizeLinear 1.23.0: https://onnx.ai/onnx/operators/onnx__DequantizeLinear.html
- ONNX Runtime main quantize path: https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/quantization/quantize.py
- GGUF v3 specification: https://github.com/ggml-org/ggml/blob/master/docs/gguf.md
- StableHLO specification: https://openxla.org/stablehlo/spec
- StableHLO quantization guide: https://openxla.org/stablehlo/quantization
