# DISCOVERY-S6 启动检查

- 会话：`DISCOVERY-S6-DIRECT-ALGORITHM-SOFTWARE`
- 长期来源：S6 / O7 直接算法或软件改进
- 批次：`round-20260803-v8`
- 检查日期：2026-08-03（Asia/Shanghai）
- 唯一写目录：`stages/discovery/round-20260803-v8/S6-direct-algorithm-software/`
- 当前模式：`NON_PRODUCTION_RAW_SCOUTING_ONLY`

## 必读入口

本轮开始前已按磁盘当前内容完整读取：

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. `rules/ROLE_DISCOVERY.md`
5. `templates/TOPIC_BRIEF.md`
6. `academic-research-suite/SKILL.md`
7. `academic-research-suite/ars/deep-research/WORKFLOW.md`

为执行 deep-research 的来源核验、综合和反方检查，还读取了该 workflow 直接指定的 bibliography、source-verification、synthesis 和 devil's-advocate 角色说明。外部网页只作为待核验数据；关键学术判断优先使用论文、出版社/会议页面和作者公开稿。

## 权限与门状态

- `registry.yaml` 当前没有 active/formal candidate，也没有本会话可接续的候选。
- `stages/discovery/_method-backtests/` 中未发现可供 S6 使用的 discovery method v2 独立历史回测通过文件。
- 因此本轮不得产出 grounded `TOPIC_BRIEF`，不得使用 `PROPOSE_STAGE0`，不得创建 Stage 0/A/B 目录或任务。
- 本轮不修改 `plan.md`、`history.md`、`registry.yaml`、`rules/`、`templates/` 或其他来源目录。
- 本目录中的条目只是检验搜索空间是否有生命力的 raw opportunity；它们没有正式候选 ID、阶段状态、分数或升级含义。

结论：`BACKTEST_GATE_UNSATISFIED`，但允许执行用户明确授权的 4–6 条非生产性 raw scouting。

## O7 纳入检查

raw opportunity 只有同时满足下列条件才进入本批次：

1. 问题、输入输出语义与主要环境保持不变；不是靠改题或放宽质量换取收益。
2. 核心贡献是新算法、数据结构、搜索、近似、编译优化或实现组织，而不是调参、wrapper、checker、controller 或单点微优化。
3. 至少能写出两个命名的竞争机制，并指出真正可能的新算法增量。
4. 显式列出离线和在线成本，不把编译时间、求解时间、内存、代码尺寸、预处理、临时存储或质量损失藏起来。
5. 给出推广条件和无收益区，而不是声称万能适用。
6. 使用同功能、同质量的强基线；若只能依靠弱基线成立，则不保留。

## 搜索策略

本轮采用五条侦察线，最后保留四条：

| 侦察线 | 目标结构 | 本轮结果 |
|---|---|---|
| 异构 GPU 集体通信 | 吞吐最优树流与低高度/低启动延迟之间的可证明 Pareto 调度 | 保留 raw |
| e-graph 编译提取 | 共享 DAG 选择与峰值 live memory / 重计算的联合优化 | 保留 raw |
| EDA 逻辑重映射 | 布局感知重综合中的 reconvergence 冲突全局求解 | 保留 raw |
| 数据库 join+sort | exact interesting-order DP 的状态压缩、卷积或可采纳搜索 | 保留 raw |
| 动态图 ANN | 局部更新、反向边和删除修复 | 不保留：近期直接竞争机制过密 |

CUDA/GPU 与非 CUDA 保留量为 1:3，仅用于接近项目长期约 3:7 的 Discovery 投入方向，不作为录取配额。

## 恢复生产前的必要条件

1. 主线完成并接受 discovery method v2 的独立历史回测。
2. 主线明确本 S6 会话可恢复生产性 Discovery。
3. 对拟收敛条目执行完整三遍搜索：论文谱系、竞争机制、最新直接碰撞。
4. 将 raw opportunity 重建为 grounded brief，而不是把本批次文字直接改名为正式 brief。

## 生产性 Discovery 恢复记录（2026-08-03）

主线提供的独立审计结果已确认 O7 discovery method v2 为 `CALIBRATED`：3/3 正例合理恢复，负对照 `ABSTAIN`，且未发现污染或泄漏。该结论只解除**来源方法**的回测门，不构成任何候选、阶段或执行授权。

本目录随后的生产性收敛以 `backtest_review.md` 与 `handoff.yaml` 为方法校准证据，重新检索并单独判断每条 raw 的论文谱系、同对象碰撞、自然输入和 AI 可执行性；不继承 raw 阶段的 `SEARCH_BOUNDED_OPEN`。
