# Source log — FINN-BACKPRESSUREPARETO

检索日期：2026-08-02；未执行 FINN。

| Source | Role | Evidence / limitation |
|---|---|---|
| [FINN repository](https://github.com/Xilinx/finn) | Primary artifact | 确认 FINN 是 FPGA quantized neural network dataflow compiler，提供公开 tool flow。 |
| [FINN FAQ](https://finn.readthedocs.io/en/latest/faq.html) | Object/baseline | 文档说明 build_dataflow 支持 per-layer folding config，auto FIFO sizing 依赖 RTL simulation 中的 occupancy；这是 baseline capability，不支持新算法。 |
| [FINN project site](https://xilinx.github.io/finn/) | Context | 描述 FINN 生成 dataflow architectures；用于对象边界。 |

Collision result: `SEARCH_BOUNDED_OPEN`; 仍须以论文/源码定位是否已有全图 sensitivity + folded mapping 的直接覆盖。
