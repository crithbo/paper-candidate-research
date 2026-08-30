# Source117 S5 low-bit conformance/interoperability seed pool

Offline non-evidentiary seeds, frozen before source lookup.  A format/spec/test is a carrier only; no seed asserts a format gap, fault, novelty, or interoperability conclusion.

| Seed | Exact-carrier candidate | S5 scale/load/online robustness question | Pre-lookup denylist relation | Disposition |
|---|---|---|---|---|
| 117-S5-01 | ONNX QDQ quantized large-model graph | Can one fixed opset/QDQ quantization scheme retain same-tensor semantics and bounded long-context memory/load behavior across current backends? | DISTINCT_FORMAT_SEMANTICS | RQ01 |
| 117-S5-02 | GGUF k-quant large-model load path | Can one exact GGUF k-quant format/version and a current parser expose a same-model load-memory/online robustness residual beyond existing format compatibility? | DISTINCT_FORMAT_SEMANTICS | RQ02 |
| 117-S5-03 | torchao/ExecuTorch quantized LLM export path | Can one exact low-bit export scheme preserve same graph semantics at varying sequence lengths with a current backend comparator and finite conformance oracle? | DISTINCT_FORMAT_SEMANTICS | RQ03 |
| 117-S5-04 | generic conversion script | A conversion/dequant wrapper without an exact spec, current parser, canonical fixture/natural model, and same-graph endpoint is excluded before locator. | EXACT_OR_CONTAINS_DENYLIST | PRE_RQ_NONADMISSION |

No seed is a candidate raw record or a debug-fault claim.
