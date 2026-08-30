# DISCOVERY-S4-OBJECTIVE-CONSTRAINT 启动检查

## 元数据

- 会话：`DISCOVERY-S4-OBJECTIVE-CONSTRAINT`
- 批次：`round-20260803-v8`
- 角色：O4 目标或约束变化来源
- 执行日期：2026-08-03（Asia/Shanghai）
- 唯一写目录：`stages/discovery/round-20260803-v8/S4-objective-constraint/`
- 产物等级：非生产性 raw opportunity 侦察

## 启动结论

`discovery_method_v2` 的独立历史回测尚未完成：`registry.yaml` 中不存在已完成的 discovery backtest，`stages/discovery/_method-backtests/README.md` 也记录完成数为 0。因此，本批次不创建正式候选、不生成 grounded brief、不提交 Stage 0，也不创建 Stage 0/A/B 目录。所有条目均是待校准方法下的搜索假说，不具有晋级含义。

启动时目标目录不存在，未发现同目录文件冲突。`registry.yaml` 的正式候选和活动任务均为空；本分支不修改 `plan.md`、`history.md`、`registry.yaml`、规则、模板或其他题目目录。

## 已完整读取

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. `rules/ROLE_DISCOVERY.md`
5. `templates/TOPIC_BRIEF.md`
6. `academic-research-suite/SKILL.md`
7. `academic-research-suite/ars/deep-research/WORKFLOW.md`
8. deep-research 中本轮实际采用的 bibliography、source-verification、synthesis、devil's-advocate 说明

本轮采用 academic-research-suite 的轻量三向扫描：先建谱系与搜索账本，再核验一手来源，最后用反方审查压制“换权重”“重跑 selector”“控制器包装”和与直接工作碰撞的伪机会。由于本批次只允许 raw scout，没有执行完整论文级深研、正式评分或候选提名。

## O4 搜索判据

一个 raw 机会只有同时满足以下条件才进入 `RAW_OPPORTUNITIES.md`：

1. **目标变化有自然来源**：例如电池/供电包络、尾延迟 SLO、编译墙钟期限、最坏情况保证、故障影响半径，而非人为加入一个权重。
2. **最优动作发生结构变化**：目标变化必须改变 fusion 边界、tile/抢占粒度、schedule 表示、数据结构布局或冗余/恢复布局；仅把现有 selector 换目标函数不计。
3. **存在两个以上对象级机制草图**：机制必须进入编译器、算法、数据结构或运行时的核心表示与动作，不能是 wrapper、checker 或通用 controller。
4. **能定义完整 Pareto 计价**：同时记录性能收益和新增的编译时间、内存、能耗、流量、冗余或尾部风险。
5. **可快速证伪**：至少给出一个小实验或理论检查，使方向可以在 Stage 0 前被淘汰。
6. **显式碰撞**：直接工作、方法邻近工作和最强反对意见必须在 raw 阶段可见。

## 三遍搜索策略

### Pass 1：目标变化与自然信号

围绕五组“旧目标 → 新约束”建立线索：

- 平均延迟/吞吐 → 电池衰减下的峰值电流或瞬态供电包络；
- 平均吞吐 → 相关性尾延迟与可抢占服务时间上界；
- 最终内核性能 → 硬编译期限下任意时刻可部署的性能；
- 良性平均访问 → 对抗/突发更新下的最坏时间与空间上界；
- 前缀缓存命中率 → 共享状态故障的影响半径与可修复性。

### Pass 2：谱系与竞争动作

每个对象至少搜索：

- 直接解决相同目标变化的论文；
- 旧目标下最强代表机制；
- 与拟议动作相邻、可能吸收增量的后续工作；
- 可复用开源实现、benchmark、公开 trace 或模拟资源。

### Pass 3：反方与淘汰

优先提出四个反证问题：

1. 简单 early-stop、静态阈值或重跑已有 tuner 是否已经达到同一 Pareto 点？
2. 现有论文是否已经同时提出相同对象、目标与动作？
3. 新约束是否只在合成异常或单一 issue 中存在？
4. 完整计价后，新的动作是否仍优于 B-tree、保守 fusion、默认 preemption、复制或重算等朴素基线？

## 范围控制

- 本批次保留 5 个 raw 机会：1 个 CUDA/GPU，4 个非 CUDA/通用系统、编译器或算法方向；这符合项目对 Discovery 投入大致 3:7 的长期倾向，但不是录取配额。
- 没有使用单个 GitHub issue 作为证据。
- 没有把异常检测器、校验器、策略 wrapper、通用控制器或“所有策略取并集”作为贡献。
- 2026 年预印本只用作碰撞与现象线索，不视为经同行评审的定论。
- 本轮没有获得正式大规模实验、设备占用或现有项目写入授权，也未进行此类操作。

## 启动状态

`STARTUP_CHECK_COMPLETE_NON_PRODUCTION_ONLY`

解除限制所需事件：主线完成并接受 discovery method v2 的独立历史回测，然后显式交接下一轮 grounded brief 收敛任务。
