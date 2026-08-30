# Source117 S5 frozen RQ candidates

- **RQ01:** For one versioned ONNX opset/QDQ quantization scheme and a canonical fixture or natural LLM graph, is there a same-tensor long-context memory/load robustness residual across current backend parsers/lowerings that changes a defined interoperability decision?
- **RQ02:** For one versioned GGUF k-quant format and natural model artifact, is there a current parser/lowering residual at a fixed model-load or online-context endpoint that remains outside documented compatibility/configuration behavior?
- **RQ03:** For one versioned torchao/ExecuTorch low-bit LLM export scheme, is there a current same-graph sequence-length conformance residual with a fixed oracle and a non-local robust action?

The precommitted route for each RQ is exact format/spec/opset/quant scheme → current parser/lowering source → default/non-default flags → canonical fixture or natural model → current strong backend comparator → finite bit-exact/semantic falsifier and full-cost boundary.  No route may replace the frozen object after results appear.
