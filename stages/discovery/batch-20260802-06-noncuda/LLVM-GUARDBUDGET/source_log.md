# Source log — LLVM-GUARDBUDGET

- [LLVM Vectorizers documentation](https://llvm.org/docs/Vectorizers.html) — 一手文档：Loop Vectorizer 会生成 runtime pointer checks 与 scalar fallback，且有 cost model。
- [LLVM LoopVersioning API](https://llvm.org/doxygen/classllvm_1_1LoopVersioning.html) — 一手 API：versioned/non-versioned loop 与 alias metadata；支持最小实现路径。
- [LLVM VectorizationPlan documentation](https://llvm.org/docs/VectorizationPlan.html) — 一手设计文档：legality、成本与 versioning 需求的边界。

检索聚焦 LLVM runtime checks、loop versioning、guard hoisting。尚未关闭跨循环共享 guard 的直接碰撞；`SEARCH_BOUNDED_OPEN`，Stage 0 须作论文级 collision search。
