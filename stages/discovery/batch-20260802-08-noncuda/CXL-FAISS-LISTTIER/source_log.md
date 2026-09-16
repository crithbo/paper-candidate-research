# Source log — CXL-FAISS-LISTTIER

检索日期：2026-08-02；未执行 FAISS 或 CXL simulator。

| Source | Role | Evidence / limitation |
|---|---|---|
| [FAISS index documentation](https://github.com/facebookresearch/faiss/wiki/Faiss-indexes) | Primary retrieval artifact | 定义 IVF-PQ 与 query-time `nprobe`，并指出 list 长度不等；支持 exact object。 |
| [MQSim_CXL](https://github.com/spypaul/MQSim_CXL) | Open CXL-style simulation artifact | 项目声明有 memory tracing tool、trace-driven simulator 和研究 trace；不是 vector DB 或真实 CXL hardware evidence。 |
| [SupMario CXL analysis](https://arxiv.org/abs/2409.14317) | Adjacent literature | 研究 CXL memory characterization、page interleaving/tiering；属于 CXL tiering baseline/adjacent，不证明或否定本题联合 list/probe 决策。 |
| [CXL memory tiering study](https://arxiv.org/abs/2312.04789) | Adjacent baseline | 频率式 CXL tiering 作为候选 baseline；需 Stage 0 原文核验公平细节。 |

Collision result: `SEARCH_BOUNDED_OPEN`; CXL/ANN 交叉文献检索尚未完成。
