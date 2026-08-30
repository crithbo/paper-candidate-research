# Source log — ANN-PQ-QUERYBUDGET

检索日期：2026-08-02。仅列支撑对象、artifact 和 collision 边界的来源；未执行实验。

| Source | Role | Evidence / limitation |
|---|---|---|
| [FAISS index documentation](https://github.com/facebookresearch/faiss/wiki/Faiss-indexes) | Primary artifact / baseline | 文档定义 `IndexIVFPQ`、`IndexIVFPQR`、`nprobe` 与 exact refinement；也说明 list 长度不等和 `nprobe/nlist` 只是近似。 |
| [FAISS FAQ](https://github.com/facebookresearch/faiss/wiki/FAQ) | Baseline diagnostic | 指出把 `nprobe` 提到全部 list 可区分 list-selection 和 PQ compression 误差；支持机制消融，不支持提案的新颖性。 |
| [FAISS C++ API](https://faiss.ai/cpp_api/struct/structfaiss_1_1IndexIVFPQ.html) | Object lock | 证实 IVFPQ 构造参数及搜索接口。 |

Collision result: `SEARCH_BOUNDED_OPEN`; 这是有限官方/API 检索，不是论文级 novelty closure。
