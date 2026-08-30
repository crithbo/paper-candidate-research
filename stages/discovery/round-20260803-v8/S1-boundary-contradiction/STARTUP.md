# DISCOVERY-S1 启动检查

- 会话：`DISCOVERY-S1-BOUNDARY-CONTRADICTION`
- 批次：`round-20260803-v8`
- 机会镜头：`O1_ASSUMPTION_BREAK`、`O6_CONTRADICTION_ANOMALY_OR_PRIMITIVE_MISMATCH`
- 检查时间：2026-08-03（Asia/Shanghai）
- 当前性质：`PRE_BACKTEST_NON_PRODUCTION_SCOUTING`

## 1. 生产门状态

本轮不能产出正式候选或进入 Stage 0。

磁盘权威状态给出的依据是：

1. `registry.yaml` 将 Discovery method 标为 revision `v2`，并要求在首次生产使用前完成独立历史时间切片回测；
2. `plan.md` 当前没有 active candidate 或 active task；
3. `ROUND_MANIFEST.yaml` 明确：
   - `production_state: PRE_BACKTEST_NON_PRODUCTION`
   - `stage0_submission_allowed: false`
   - backtest PACKER 尚在执行，EXECUTOR/AUDITOR 尚未派发；
4. 用户本轮授权仅包括启动检查、来源谱系策略和 4–6 条非生产性 raw opportunity 侦察。

因此，本目录中的任何机会：

- 都不是 candidate；
- 都不是 novelty evidence；
- 都没有 `PROPOSE_STAGE0`、`DROP` 或其他正式阶段结论；
- 在收到主线的独立回测 `CALIBRATED` 通过通知前，不会被改写成 grounded brief。

## 2. 权限与所有权检查

- 唯一写目录：`stages\discovery\round-20260803-v8\S1-boundary-contradiction\`
- 本轮仅创建：
  - `STARTUP.md`
  - `RAW_OPPORTUNITIES.md`
  - `SEARCH_LOG.md`
  - `handoff.yaml`
- 未修改 `plan.md`、`history.md`、`registry.yaml`、`rules/`、`templates/` 或其他来源会话目录。
- 未创建 Stage 0/A/B 目录或任务。
- 未运行 GPU、NPU、CXL、FPGA 或 benchmark 实验；未下载大模型、数据集或专有 SDK。
- 未发现同目录已有文件，启动时无文件冲突。

## 3. 本轮来源谱系搜索策略

本轮采用 academic-research-suite 的 deep-research 工作流中与当前任务相符的两部分：bibliography genealogy 与 source verification；不进入完整综合和论文写作。

每条 raw opportunity 按以下顺序侦察：

1. **界定矛盾或失效假设**
   - 找至少两个独立工作在相同表面命题上给出相反结论，或找现实工作负载使既有原语的语义假设失效。
   - 优先结论反转、排名反转、优先级反转和“同规格对象并不等价”。

2. **建立最小谱系**
   - 先找同行评议的机制/系统锚点；
   - 再找最新预印本作为当前边界；
   - 再找作者 artifact、当前源码、官方文档或 benchmark；
   - 最后主动搜索反证和直接碰撞。

3. **寻找可量化 headroom**
   - 只记录原始论文/官方页面支持的延迟、吞吐、能耗、干扰或失败幅度；
   - 不把 limitation sentence 单独当作机会；
   - headroom 必须能对应后续明确的决策变量或机制对象。

4. **碰撞分类**
   - 区分已解决同一对象、同一机制的直接碰撞，与仅提供传感器、观测方法、部署基线或相邻场景的工作；
   - 对 2026 年近期预印本保持 `SEARCH_BOUNDED_OPEN`，不声称“首次”。

5. **执行边界**
   - 公开 artifact 只用于判断未来可复现性；
   - 商品手机 NPU、CXL 设备、MIG/MPS GPU 和专有 SDK 的缺失只降低 AI 执行证据上限，不构成学术 STOP；
   - 若核心 claim 必须依赖这些资源，则未来应明确资源请求或进入 `HUMAN_RESEARCH_RESERVE`，不能用轻量模拟冒充实机证据。

## 4. 明确排除

本轮不保留下列对象：

- 将多个现有 profiler、checker、scheduler 或 controller 包装在一起；
- 单个 GitHub issue 的复现或修复；
- 只做统一接口、万能 union、换名、后端替换或参数调优；
- 仅根据一篇论文的 future-work 句子生成题目；
- 没有自然 workload、可量化后果或论文级机制对象的微基准异常；
- 已被近期工作直接覆盖、且未找到剩余研究对象的拥挤线。

本轮已将 filtered ANN hardness、HLS QoR 预测、混合注意力/SSM prefix caching、结构化稀疏 GPU kernel 等线索留在搜索负证据中，没有把它们计入 4 条 raw opportunity。

## 5. 下一状态

当前状态固定为 `AWAITING_INDEPENDENT_BACKTEST_ACCEPTANCE`。收到主线明确的 backtest 通过通知后，才会对 raw opportunity 重新做三遍检索、最新碰撞审查和 grounded brief 收敛。
