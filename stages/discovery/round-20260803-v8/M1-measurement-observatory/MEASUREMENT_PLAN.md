# M1 横向测量与 benchmark-gap 观测计划

## 1. 计划状态

- Plan owner: `DISCOVERY-M1-MEASUREMENT-OBSERVATORY`
- Opportunity origin: `O8_MEASUREMENT_CHARACTERIZATION_OR_BENCHMARK_GAP`
- Method revision: `v2`
- Status: `PLAN_ONLY_NOT_ACTIVATED`
- Default cadence: 每两波一次，或由主线指出的具体缺口触发
- Production gate: M1 v2 独立回测 PASS 且主线明确触发
- Current data state: 未搜索、未下载、未采集、未运行、未生成候选

本计划定义未来被唤醒后的横向观测协议，不预注册任何尚不存在的经验结果，也不预设必须发现异常或候选。

## 2. 观测目标与判定对象

M1 不以“增加数据量”为目标，而以识别可复现、可解释且能改变研究或评价决策的测量事实为目标。每个被激活的观测单元必须冻结：

1. `exact object`：被比较的 workload、算子、图、trace 事件、系统阶段、算法或平台边界；
2. `semantics/quality contract`：输入、输出、精度、误差、正确性、fallback 和允许近似；
3. `measurement boundary`：是否包含 preprocessing、compile、initialization、host、transfer、metadata、synchronization、warm-up 与 teardown；
4. `decision consequence`：观察若成立，具体会改变哪项评价、平台选择、基线排序、机制设计或研究假设；
5. `decisive falsifier`：什么结果会否定稳定规律或 benchmark-gap 解释；
6. `claim ceiling`：依据来源和执行层级能支持到何种强度。

## 3. 五类优先观察信号

| 信号 | 最小可检验形式 | 常见伪象 | 只有在何时值得路由 |
|---|---|---|---|
| 稳定规律 | 在预先定义的多个自然切片、版本或 workload family 上方向一致，并报告异质性和例外 | 单一数据集、重复样本、共同上游偏差 | 规律有结构解释，且能指导机制、评价或资源决策 |
| 成本拐点 | 成本随规模、shape、precision、并发或资源变化出现可重复的斜率/主导项转换 | 计时器分辨率、缓存预热、batch 边界、编译摊销 | 拐点改变最优策略或暴露新的瓶颈阶段 |
| 排名反转 | 同语义、同质量和完整成本下，A/B 排序随明确条件改变 | 平台/版本/编译选项不一致或遗漏 fallback | 可给出条件化选择规律或新的联合机制 |
| 评价偏差 | benchmark 的覆盖、权重、聚合、指标或边界系统性改变结论 | 随意重加权、事后挑切片、不可复现清洗 | 能纠正已有评价结论，或提出可验证的评价机制 |
| 规模效应 | 效果量、瓶颈或可行域随规模/在线信息/近似预算有稳定变化 | 外推、幸存者偏差、OOM 样本删除 | 能解释现有方法为何失效，或界定新的机制区域 |

`benchmark gap` 只有在缺口造成遗漏的自然 workload 区域、错误排名、错误外推、成本漏计或机制盲区时才成立。单纯缺一个数据集、平台或可视化不是论文机会。

## 4. 覆盖面与采样纪律

### 4.1 领域是标签，不是会话所有权

横向窗口可覆盖：

- CUDA/GPU；
- AI accelerator、NPU、FPGA；
- PIM/NDP 与 memory system；
- quantization、approximate computing 与 bit-exact semantics；
- algorithm/data structure；
- compiler、runtime、system；
- architecture、theory、verification/debugging。

记录 CUDA/GPU 与非 CUDA 的实际投入，供主线维持约 `3:7` 的 Discovery 努力结构；该比例不是录取配额，也不允许为凑比例降低学术标准。

### 4.2 公开材料优先级

被唤醒后按问题需要选择，而不是默认全量抓取：

1. 官方或论文作者发布的 benchmark、trace、profile、artifact 和版本化结果；
2. 可复现的公开 workload/dataset 与开源实现；
3. 规范、官方文档、release notes 和公开硬件/软件测量说明；
4. 经条件核对后可用的论文表格或补充材料；
5. issue/blog 只作线索或反证，不单独作为决定性证据。

每项材料未来需记录来源 URL/DOI、发布日期、访问日、版本或 commit、许可证/使用边界、文件校验值、生成环境、原始条件和它在证据链中的角色。无法找到所需材料时使用 `NOT_FOUND_WITHIN_SEARCH`。

### 4.3 采样与时间切片

- 先冻结 inclusion/exclusion、版本窗口和自然切片，再查看聚合结论。
- 区分探索切片与确认切片；避免同一数据反复提出并验证规律。
- 保留反证、不同结论和 negative result，不能只筛选支持性 workload。
- 明确 missingness、超时、OOM、unsupported、fallback 和测量失败，不把它们静默删除。
- 最新事实、工具版本和 venue 政策在使用时重新核验；本启动计划不代替届时检索。

## 5. 激活后的分阶段协议

### Phase 0：触发与门禁检查

1. 验证主线触发及唯一写目录。
2. 核验 M1 v2 backtest handoff。
3. 若回测未 PASS，状态置为 `PLAN_ONLY_BLOCKED_BY_BACKTEST`，只准备协议或回测输入，不进行生产候选工作。
4. 核验数据、网络、计算、设备、许可和时间预算；未授权项标为 unavailable，不自行扩大权限。

### Phase 1：问题与分析冻结

为每个具体 gap 写最小 protocol：

- research/measurement question；
- exact object 与同语义条件；
- primary metric、secondary metrics 和单位/分母；
- platform/workload/scale strata；
- measurement boundary 与 full-cost ledger；
- 预期机制签名及至少一个替代解释；
- negative control、sensitivity 与 decisive falsifier；
- 可支持和不可支持的 claim。

只有在主线提供清楚 gap 后执行本阶段；不得先有结果再补问题。

### Phase 2：来源图与资格筛选

构建“来源—版本—条件—角色”矩阵，区分：

- raw trace/profile/workload；
- 作者提供的 processed result；
- 独立复现；
- analytical model 或 simulator；
- 真实硬件测量；
- counter-evidence 或边界材料。

筛掉来源不明、许可不清、版本不可定位、语义不可对齐、只给归一化图但无分母、平台条件缺失或无法区分估计/实测的材料。筛除理由必须保留。

### Phase 3：可复现测量与变换

只有后续触发明确授权时才执行：

- 原始材料保持不可变；派生数据与脚本分离；
- 记录获取、解析、清洗、对齐和聚合步骤；
- 给每个派生结果建立 source lineage；
- 冻结随机种子、软件版本、编译选项和配置；
- 优先复用公开 trace/profile；不默认占用 GPU/NPU/FPGA；
- 测量工具开销、采样偏差、计时分辨率和冷/暖态分开报告；
- 对失败、缺失和 unsupported 样本保持显式状态。

### Phase 4：观察与稳健性检验

按信号类型选择最小充分分析：

- 稳定规律：分层效果、方向一致性、异质性和 leave-one-group-out；
- 成本拐点：预先限定候选尺度，比较分段与非分段解释，并检查边界/预热伪象；
- 排名反转：使用配对、同语义数据，报告交互条件、效应量和置信区间；
- 评价偏差：建立 coverage matrix，比较原始聚合与预注册的替代权重/边界；
- 规模效应：报告有限范围内的斜率或 regime，不越界外推。

探索性分析必须标记为 exploratory；多切片/多指标搜索要披露比较数量，并采用适当的 multiplicity、bootstrap 或 held-out 检验。显著性不能替代实际效果量、机制解释和决策后果。

### Phase 5：竞争解释与机制压力测试

每个可报告观察至少比较两个非同义解释：

- 目标机制解释；
- 配置/边界/采样/版本/平台差异造成的替代解释；
- 可用时加入简单 null 或 deployment explanation。

要求每个解释给出特异预测、适用区间、失败区域和验证成本。若完整成本或语义对齐消除观察，应记为 DROP/负结果，不修辞性保留。

### Phase 6：学术路由

先输出观察，再判断是否存在论文机会：

- 假设失效、矛盾或原语错配 → S1；
- 优化后瓶颈迁移 → S2；
- 自然 locality/skew/repetition/sparsity/temporal/topology/numeric structure → S3；
- 目标、约束或 Pareto 边界变化 → S4；
- 规模、在线信息或近似预算效应 → S5；
- 观察直接暴露新的算法/软件动作空间 → S6；
- 评价修正、稳定经验规律及利用机制本身构成贡献 → 保留在 M1/O8。

不能自然分类且有充分证据时可用 `OTHER_EVIDENCE_BACKED_ORIGIN`。路由不是升级；对应来源会话或主线仍需独立判断。

## 6. 公平比较与完整成本

未来测量至少核对：

- same function、same quality 和 correctness/approximation contract；
- workload/model/dataset、shape、batch、precision、sparsity 和 layout；
- 软件、驱动、编译器、库、算法与硬件版本；
- 冷/暖执行、compile、initialization、host、transfer、synchronization；
- metadata、control、conversion、fallback、unsupported 与失败成本；
- on-chip capacity、external bandwidth、memory hierarchy 和 cache effects；
- latency boundary、throughput denominator、tail metric 与能耗测法；
- 采样率、计数器复用、instrumentation overhead 和聚合规则。

对于硬件/体系结构材料，明确区分 analytical、cycle simulation、RTL simulation、post-synthesis、post-P&R、FPGA/board 和 measured silicon。不得直接把 FPGA resource 当 ASIC area，或把模拟/估计结果当实测。

跨平台比较优先报告同平台结论；文献跨平台数字必须披露 node、voltage、frequency、memory、tool flow、precision、workload 和边界差异。technology scaling 只能作为带敏感性分析的辅助结果，不能制造 headline。

量化与 NPU 结果需要锁定 signedness、zero point、scale granularity、rounding、saturation、overflow、clipping、requantization、fallback 和 operator coverage；缺少 bit-exact 边界验证时，不宣称全局语义闭合。

PIM/NDP 结果必须计入 command/timing/contention、host interaction、metadata/control traffic、conversion、capacity displacement、同步和剩余数据移动；理论 internal bandwidth 不等于可用应用带宽。

## 7. O8 观察的最低保留门

一个观察只有同时满足以下条件才进入后续学术路由：

1. 来源、版本、条件和变换可追溯；
2. exact object 与测量边界明确；
3. 至少跨两个预先定义的自然切片，或有同等强度的时间/平台/规模复核；
4. 观察不由明显的语义错配、成本漏计、缓存预热、计时器或采样伪象解释；
5. 有效果量、边界和反例，不只报告方向或显著性；
6. 至少两个非同义机制/解释接受压力测试；
7. 有明确的评价修正、决策后果或利用机制；
8. 可以提出有限的 72 小时 probe 和 decisive falsifier；
9. 学术故事不退化成 dashboard、数据清洗或 benchmark 扩容；
10. claim 不超过证据 ceiling。

不满足时保留负结果或 `NO_ACTIONABLE_SIGNAL`，不强行包装。

## 8. 从观察到候选的额外门

即使观察通过最低保留门，也只有在下列条件全部满足后才可使用 `templates\TOPIC_BRIEF.md`：

- M1 v2 独立 backtest PASS；
- 主线明确授权本轮进入生产发现；
- 机会包不是单篇 seed，含 anchor、2–4 篇关键前置、1–3 篇后续/竞争、至少一份反证/边界材料及可得 artifact；
- 三遍发现法完成；
- 至少两个非同义机制，且 N1/N2/N3 至少一条可能成立；
- 冻结 2–4 个具名、有限、可部署且完整计价的基线；
- seed-distance 不是应用、后端、API 或组件换名；
- 没有同 exact object、目标、核心方法、结果/保证和成本边界的 `DIRECT_FATAL`；
- 有一区或近一区的完整论文路径，而非只有一张测量图。

唯一允许的 Discovery 结论是 `PROPOSE_STAGE0` 或 `DROP`；M1 只能建议，不能自行升级或创建 Stage 0。当前计划阶段禁止产生两者。

## 9. 未来单次观测交付结构

每次被唤醒后的最小横向报告应包括：

1. trigger 与 backtest 状态；
2. scope、search boundary 和 source manifest；
3. exact object、semantics 和 measurement boundary；
4. 观察表：方向、效果量、置信度、切片、例外；
5. full-cost ledger；
6. 机制 A/B、替代解释和 decisive falsifier；
7. evidence class 与 claim ceiling；
8. 负结果、missingness 和局限；
9. `NO_ACTIONABLE_SIGNAL`、`ROUTE_TO_S1...S6` 或 `O8_BRIEF_ELIGIBLE` 建议；
10. 可复现路径与下一次 cadence。

普通搜索和中间分析只写本目录；阶段报告、PROPOSE/DROP、跨题 `DIRECT_FATAL`、权限/所有权问题或文件冲突才通知主线。

## 10. 当前不执行清单

- 不建立 source manifest，因为尚无触发问题或允许来源范围。
- 不检索论文、规范、workload、trace、profile 或 benchmark。
- 不下载、解析、清洗或重放任何数据。
- 不运行 CPU/GPU/NPU/FPGA benchmark 或 simulator。
- 不评估任何具体候选，不做新颖性碰撞。
- 不创建 `TOPIC_BRIEF`，不提交 `PROPOSE_STAGE0`。

下一动作：保持 `PLAN_ONLY_NOT_ACTIVATED`，等待主线提供 cadence/gap trigger 与 M1 v2 backtest handoff。
