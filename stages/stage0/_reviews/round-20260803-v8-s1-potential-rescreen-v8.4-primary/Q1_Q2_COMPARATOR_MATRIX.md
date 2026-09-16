# Q1/Q2 comparator matrix — S1-O6-MOBILE-TRAFFIC-CRITICALITY

本表校准成功后可发表的论文形状，绝不把邻近论文自动并成致死 union。

| 论文/来源 | 同对象关系 | 已覆盖内容 | 未自动覆盖的候选条件性核 | 校准作用 |
|---|---|---|---|---|
| Sereno, OSDI 2026 | 同 mobile LLM/foreground QoS 问题；软件层 | 商业手机自然干扰、speculative-decoding yield、jank/throughput tradeoff | 第一共享仲裁点的 request provenance+budget contract；事务级同信息预算对照 | Q1 systems: natural workload、强对照、端到端 QoS ledger |
| XSched, OSDI 2025 | 邻近 cross-XPU command scheduler | 可抢占命令队列与策略 | post-issue shared NoC/DRAM request arbitration；DRAM/fairness accounting | Q1 systems: 可推广机制与跨层实践 |
| Arm AXI/AMD Versal QoS 一手规范 | transaction-level direct subtractor | per-transaction QoS/traffic class、NoC QoS configuration | application-critical causal contract 是否在首仲裁点产生可证伪的增量；必须以它作基线 | Q2 最低线: 不得只重命名 QoS tag |

## 形状裁定

若 P 成立，论文有明确 Q2 N1 形状：一个请求级、带公平/预算语义的 first-arbiter contract，配以自然 mobile trace、同信息预算 transaction-QoS baseline 和 full-cost 评估。现阶段不足以宣称 Q1：当前尚没有自然 trace/mapping、跨设备可推广性或超出上述 Q1 systems 标准的证据。故 `TIER_B_Q2_VIABLE`，不是 `TIER_A_Q1_POTENTIAL`。

直接碰撞门采用 `same object + target + method + guarantee/result + cost + main claim` 六项全覆盖；本表没有任何一项满足六项全覆盖。
