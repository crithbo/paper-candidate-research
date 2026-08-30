# Source log — ORT-ACTGUARD

- [ONNX Runtime quantization documentation](https://onnxruntime.ai/docs/performance/model-optimizations/quantization.html) — 一手文档：static QDQ 将参数写入图，dynamic 会插入在线参数计算；定义精确对象与端点基线。
- [ONNX Runtime quantization tool README](https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/quantization/README.md) — 一手源码文档：静态工具、per-channel 与 tensor override 入口；确认可改造工件。
- [QONNX](https://arxiv.org/abs/2206.07527) — 相邻量化表示工作；用于限制 claim，不作为直接覆盖断言。

检索：官方 ORT 文档、源码和 QDQ/动态量化关键词。未定位“风险合同 + 全边界成本下局部在线参数”完全同对象工作；状态 `SEARCH_BOUNDED_OPEN`。
