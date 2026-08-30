# DISCOVERY-S2-BOTTLENECK-TRANSFER 启动检查

- 会话：`DISCOVERY-S2-BOTTLENECK-TRANSFER`
- 机会镜头：`O2_BOTTLENECK_TRANSFER`
- Discovery method revision：`v2`
- 批次：`round-20260803-v8`
- 检查时间：`2026-08-03T14:03:55+08:00`
- 唯一写目录：`stages/discovery/round-20260803-v8/S2-bottleneck-transfer/`
- 当前结论：`READY_FOR_NON_PRODUCTION_SCOUTING`
- 生产门：`BLOCKED_BY_UNCALIBRATED_BACKTEST`

## 1. 最小读取与权限核验

已完整读取：

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. `rules/ROLE_DISCOVERY.md`
5. `templates/TOPIC_BRIEF.md`
6. `academic-research-suite/SKILL.md`
7. `academic-research-suite/ars/deep-research/WORKFLOW.md`
8. deep-research 本轮需要的 bibliography、source-verification、synthesis、devil's-advocate agent prompts
9. `source_quality_hierarchy.md`
10. 硬件题所需的 `hardware_design_papers.md` 与 `npu_ndp_architecture_papers.md`
11. `stages/discovery/_method-backtests/README.md`
12. `stages/discovery/round-20260803-v8/ROUND_MANIFEST.yaml`

未读取无关历史候选目录或其他角色规则。未修改 `plan.md`、`history.md`、`registry.yaml`、`rules/`、`templates/` 或其他来源目录。

## 2. 回测与批次状态

磁盘事实如下：

- `_method-backtests/README.md` 在 `2026-08-03 00:52 Asia/Shanghai` 记录已完成回测数为 `0`。
- `ROUND_MANIFEST.yaml` 把本轮标为 `PRE_BACKTEST_NON_PRODUCTION`，并明确 `stage0_submission_allowed: false`。
- S2 在 manifest 中的状态是 `ACTIVE_PRE_BACKTEST_SCOUTING`。
- backtest packer 为 `ACTIVE`；executor 与 auditor 尚未派发。
- 本目录没有可用的 S2 `CALIBRATED` handoff，也没有允许生产收敛的来源输入包。
- manifest 明确禁止 GPU、benchmark、大下载、正式实验和项目级 mutation。

因此，本批所有检索产物都只是方法回测前的 raw scouting，不是候选、新颖性证据或 Stage 0 输入。本目录不生成 `TOPIC_BRIEF.md`，不使用 `PROPOSE_STAGE0`，不创建 Stage 0/A/B。

## 3. O2 检索策略

### 3.1 固定变换链

每条线索必须能用下列链条描述：

`已部署或已论文验证的优化动作`
→ `原主成本下降`
→ `相邻成本在自然 workload 中成为主导或明显放大`
→ `出现不同于原优化的新决策变量`
→ `至少两个非同义机制可以比较`

只出现“优化后还有一点开销”不够。必须有论文、artifact、profile 或规范中的量化锚点，并能说明新对象不是普通 fusion、缓存、调参、预取或尾项实现。

### 3.2 来源谱系搜索顺序

1. **当前 anchor**：2024–2026 年系统、体系结构、编译器、MLSys/HPC/存储论文中明确写出 after-optimization bottleneck 的工作。
2. **前置动作**：确认原优化究竟删除或压缩了什么成本。
3. **后续/竞争动作**：搜索是否已经直接优化新瓶颈，特别是联合优化、在线选择、异步化、近内存执行和代数重写。
4. **反证与边界**：优先寻找“该瓶颈只在某平台/规模出现”“简单基线已经足够”“新动作反而增加另一成本”的结果。
5. **artifact/部署基线**：公开代码、官方编译器选项、生产系统或标准库；本轮只登记，不下载、不运行。
6. **去方法名检索**：删除 CUDA、Triton、KV cache、MoE、quantization、learning 等名词后，以 exact object、决策变量和约束重搜。

### 3.3 纳入标准

- 自然 workload 或公开 trace/benchmark 中的量化成本迁移；
- 新瓶颈属于内存、通信、metadata、编译、初始化、调度或相邻阶段；
- 能冻结 exact object、输入信息、决策变量和完整成本账本；
- 至少存在一个不是 wrapper/checker/controller 的 N1/N2/N3 假设；
- 硬件结果按实际证据层级表述，不把模型或模拟结果冒充硅上实测。

### 3.4 排除标准

- 单 issue、单 kernel 微调、只换 API/后端/硬件名；
- “加一个控制器自动选择现有组件”或不可部署的万能 union；
- 只报告某项 overhead，没有新的决策结构；
- 忽略训练、编译、初始化、迁移、metadata、精度或能耗成本；
- anchor 本身已经覆盖 exact object、核心动作与主要 claim；
- 仅从论文 limitation 句子反推题目而无自然 headroom。

## 4. 本轮输出边界

本轮只写：

- `STARTUP.md`
- `RAW_OPPORTUNITIES.md`
- `SEARCH_LOG.md`
- `handoff.yaml`

其中 raw disposition 只表示侦察优先级，不是 `PROPOSE_STAGE0 / DROP` 的生产裁决。下一步必须等待主线提供 S2 方法回测 `CALIBRATED` 通知；收到后才能重新检索、收敛 grounded briefs，并按当时磁盘状态重做最新碰撞审查。

