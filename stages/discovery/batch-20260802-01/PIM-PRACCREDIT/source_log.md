# PIM-PRACCREDIT source log

## Search coverage

查询族：`PRAC RFM PIM activation scheduling`、`PRAC backoff processing in memory`、`CPU PIM co-scheduling Ramulator2`、`QPRAC MOAT`、`P-PIM RowHammer`、`GDDR6 AiM simulator`。日期 2026-08-02。

## Verified sources

| 来源 | 类型/核验 | 支持事实 | 质量与限制 |
|---|---|---|---|
| [Understanding PRAC](https://arxiv.org/abs/2406.19094) / [作者 PDF](https://dramsec.ethz.ch/papers/UnderstandingPRAC_CR_aug_07_2024.pdf) | 作者稿/预印本 | PRAC back-off/RFM 语义、低阈值的性能约束、Ramulator2 路线 | Grade B；不是 JEDEC 规范全文 |
| [Ramulator2](https://github.com/CMU-SAFARI/ramulator2) | 官方开源 repo | cycle-level DRAM 模拟和 RowHammer mitigation 执行入口 | Artifact Grade A；simulator evidence 不等于 silicon |
| [QPRAC](https://arxiv.org/abs/2501.18861) | 预印本；另有公开 traces 索引 | secure/practical PRAC controller 与 priority tracking | Grade B；Stage 0 需核 artifact/安全证明 |
| [MOAT](https://arxiv.org/abs/2407.09995) | arXiv 作者稿 | provably secure PRAC/ABO 设计 | Grade B；作为安全最强基线 |
| [P-PIM DOI](https://doi.org/10.23919/DATE56975.2023.10137204) / [DATE PDF](https://past.date-conference.com/proceedings-archive/2023/DATA/584.pdf) | DOI + 会议论文 | PIM-side self-tracking/mitigation of RowHammer | 同行评审 Grade A/B；架构对象与候选不同 |
| [COSM](https://arxiv.org/abs/2606.30553) | 2026 arXiv 预印本 | CPU/PIM co-scheduling、idleness-aware insertion、preemptable PIM command | Grade B；最新预印本，需 Stage 0 artifact 核验 |
| [GDDR6-AiM simulator](https://github.com/arkhadem/aim_simulator) | 作者开源 repo | 基于 Ramulator2 的公开 PIM command 模型入口 | Artifact Grade B；具体与 PRAC 组合语义未验证 |

## Verification conclusion

- 已核验 PRAC 与 CPU/PIM co-scheduling 两条公开工作线，但“PIM 内部 operation 是否计入 PRAC”没有从公开标准全文闭合，故被置为第一个对象 falsifier。
- 厂商/作者模拟器只支持可执行路径，不支持真实器件效果。
- 在记录查询中未找到 security-credit host/PIM scheduler，不代表绝对首次。

