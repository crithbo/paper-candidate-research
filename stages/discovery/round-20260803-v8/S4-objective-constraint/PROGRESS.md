# S4 Production Convergence — 2026-08-03

## Gate consumed

O4 的独立回测已被审计为 `CALIBRATED`：3/3 正例合理恢复，负对照 ABSTAIN，无污染或泄漏。该裁决只解除本 lens 的生产性 Discovery 禁令；它不构成任一题目的新颖性、可行性、候选登记或 Stage 0 通过证据。

## 三遍收敛结果

| Raw opportunity | 谱系 / seed-distance | competing mechanism 与同对象碰撞 | artifact / 自然输入 / AI | 本轮决定 |
|---|---|---|---|---|
| `RAW-O4-01` 峰值电流 NPU fusion | 2026 工作已把 fusion-induced power burst、测量图改写与 barrier 作为核心动作 | certificate/temporal tiling 的剩余与其 graph rewrite 距离不足，容易只是细化 | 需移动 SoC/PMIC 实测；公开可复现证据上限低 | `DROP`：高直接碰撞，无清晰残差 |
| `RAW-O4-02` GPU tail-risk granularity | fusion/抢占谱系包含 MonoNN、GPREEMPT 与 Reef | Reef 已以 TVM 定制 kernel、reset-based preemption/dynamic padding 处理实时 GPU tail；再提 compiler-side yield/fusion 缺少独立动作 | GPU 资源和端到端队列干扰会遮蔽 compiler 因果 | `DROP`：同对象机制被覆盖 |
| `RAW-O4-03` anytime tensor compilation | AdaTune 已直接以同 wall-clock budget 和 best-so-far tuning quality 优化 tensor compilation | early measurement termination、uncertainty surrogate、contextual optimizer 已构成核心动作；“always deployable”不足以形成新算法 | TVM artifact 很好，但 residual 会退化为 early-stop wrapper | `DROP`：直接减法后无非平凡决策变量 |
| `RAW-O4-04` cache-local dynamic learned index | PGM → ESA 2025 worst-case ε-cover → HIRE/PVLDB attack 构成清晰谱系 | ESA 2025 明示 random-access cache penalty 与 memory-access-efficient open residual；HIRE 覆盖 hybrid/recalibration，但没有页面级 ε-cover + worst-case residual | PGM/ALEX、OSM replication 与 B+tree 路径公开；证明仍需人工审计 | `PROPOSE_STAGE0`：见 `O4-DYNCACHE-PGM.md` |
| `RAW-O4-05` repairable prefix KV | shared-prefix bit-flip、DéjàVu、ECC/recompute 谱系密集 | checksum、replication、encoding/recompute 已紧密覆盖，且真实故障发生率不清 | vLLM 可用，但主张易落为 checker/可靠性 wrapper | `DROP`：机制空间不足且自然正证据弱 |

## 结论

本轮只产生 **1** 份建议性 grounded brief，未为数量包装第二题。没有创建 Stage 0/A/B 目录，没有修改主控文件，也没有登记正式候选。

## AI-assisted research disclosure

本收敛由 AI 辅助检索、来源比对和文档编制；新颖性被明确限定为搜索边界，不被表述为全球优先权结论。
