# DISCOVERY-S3-NATURAL-STRUCTURE 启动检查

- 会话：`DISCOVERY-S3-NATURAL-STRUCTURE`
- 轮次：`round-20260803-v8`
- 来源模式：`O3 / S3 natural structure`
- 检查日期：`2026-08-03`（Asia/Shanghai）
- 当前状态：`STARTUP_COMPLETE_BACKTEST_BLOCKED`
- 产出性质：仅非生产性 raw opportunity 侦察

## 权限与阶段门

本会话只写入 `stages/discovery/round-20260803-v8/S3-natural-structure/`，不修改
`plan.md`、`history.md`、`registry.yaml`、`rules/`、`templates/` 或其他候选目录。

磁盘中的 discovery method v2 尚未完成独立历史回测，因此本轮明确冻结以下动作：

- 不生成 canonical grounded topic brief；
- 不提交 `PROPOSE_STAGE0`；
- 不创建 Stage 0、Stage A 或 Stage B 工作区；
- 不进行评分、晋级或自审；
- 不把 raw opportunity 视为正式候选。

解除条件是主线在机器可读状态中确认 method v2 的历史回测已经通过，并重新授权本来源会话进行 production discovery。

## 已完整读取

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. `rules/ROLE_DISCOVERY.md`
5. `templates/TOPIC_BRIEF.md`
6. `academic-research-suite/SKILL.md`
7. `academic-research-suite/ars/deep-research/WORKFLOW.md`

按 deep-research workflow 又读取了本轮实际采用的来源核验、书目、综合与反方审查 agent 说明，以及硬件/体系结构领域参考说明。本轮只采用其“可复现检索、来源分级、事实—推断分离、反例搜索”部分，不把 raw 侦察扩展成完整研究报告。

## O3 搜索对象冻结

先冻结真实 workload 与同语义公开载体，再搜索结构和机制。可接受结构包括：

- 局部性、偏斜与重复；
- 稀疏结构及其稳定的局部变化；
- 时间相关和版本间小增量；
- 拓扑、motif、邻域或路径重复；
- 可精确验证的数值结构。

每个保留侦察项必须同时记录：

1. 精确对象与公开载体；
2. 哪些结构事实已由来源支持，哪些只是待测假设；
3. 至少一个非 wrapper 的算法或数据结构机制；
4. 直接相邻工作和剩余差异；
5. 一个可以尽早杀死该方向的定量测试。

以下对象不进入保留集：先造结构再找场景、单 issue、checker/controller/wrapper、万能 union、改名迁移、只有参数调节或单点微优化的题目。

## 本轮结果概览

- 保留 raw opportunities：5
- 直接碰撞/排除侦察：4
- 正式候选：0
- Stage 0 提案：0
- 用户资源请求：0
- 文件冲突：0

保留集覆盖推荐系统嵌入、AMR 多重网格、GPU SpGEMM、泛基因组索引和张量编译器。CUDA/GPU 主对象为 1/5；这只是本批记录，不是录取配额。所有保留项仍需在 method v2 回测通过后重新检索并用冻结 trace 做结构强度测量，才能决定是否形成 grounded brief。

