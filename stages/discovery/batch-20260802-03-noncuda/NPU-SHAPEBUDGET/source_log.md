# NPU-SHAPEBUDGET source log

检索日期：2026-08-02；查询族：`dynamic shape compiler NPU fusion`, `shape polymorphism compiler specialization cache`, `mobile NPU dynamic shape partition`。

| Source | Type | Relevance / collision class |
|---|---|---|
| [DISC](https://arxiv.org/abs/2103.05288) | paper | direct subtract：动态 shape、shape propagation、fusion；Stage 0 必须核代码/策略 |
| [IREE](https://github.com/iree-org/iree) | open compiler artifact | executable graph compiler alternative |
| [MLIR](https://mlir.llvm.org/) | official compiler framework | executable lowering/analysis substrate |
| [Mobile SoC characterization](https://ipads.se.sjtu.edu.cn/zh/publications/sosp25-chen.pdf) | paper | adjacent evidence：移动 NPU shape-dependent degradation/partitioning |

未在有限检索中定位同时以在线 compile budget、region variant portfolio 和 reserved-buffer envelope 为主要决策的同对象论文；需 Stage 0 做 DIRECT_FATAL 审计。
