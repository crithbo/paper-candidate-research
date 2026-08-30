# Rule Audit Report：Source19/20 连续零产出的原因与下一轮策略

## 中文摘要

- 发现的问题：两轮共报告 74 个 locator、60 个 fresh raw，却只有 1 个 D1、1 个深审和 0 个 clean brief。主要窄口在 D1 之前，不是深审数量不足。
- 为什么重要：当前流程把“尚差一项决定性来源、可在有限范围补齐”的题和真正结构性淘汰混在一起；同时部分 repeat/active/historical/contained 行仍被计入 raw，导致漏斗看起来比实际更健康。
- 建议修改：下一安全边界仅试运行一轮 `AFFIRMATIVE_CLIFF_PARTIAL_PRIMITIVE_RESIDUAL_V5`。减少 raw 上限，把等量精力投入最多 12 个预先选定的 source-closure；改为“当前源码明确 cliff + 已存在局部修复原语 + 目标特定不变量”先行，再用近期论文作最强减法器。
- 是否需要用户批准：现有持续 Discovery 授权已经覆盖一次不扩资源、不改科学门的 assignment-local 试点；无需新的 generic approval。永久写入共享规则仍需用户批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE19-20-CONSECUTIVE-ZERO-YIELD-R23`
- `trigger`: Source19 与 Source20 连续两个完整六路周期零 clean brief
- `requested_by`: 主线
- `date`: 2026-08-14
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE19-20-CONSECUTIVE-ZERO-YIELD-R23`
- `shared_files_modified: false`

## 1. 审计范围与权威规则

本审计只读检查 Source19/20 的 control、六路 assignment、handoff、日志、碰撞矩阵和必要的深审材料，并用 Source17/18 的两个 clean brief 作正向对照。没有执行检索、下载、实验或任何 Stage。

现行 `rules/ROLE_DISCOVERY.md` 已明确：

- `NOT_ADMITTED_UNFROZEN` 不是科学 STOP；
- Discovery 不要求实现、结果或完成 Stage A fidelity gate；
- action gap 可以是交给 Stage 0 攻击的结构假设，只需说明为什么没有被已知 union 明显表达及有限区分路线；
- current-source reality check 必须同时看当前文档、源码和 flags；
- raw、repeat、unique family、deep 和 brief 必须分开计数；
- 来源 lane 不是贡献类型配额，零 brief 合法。

因此本轮问题主要是 assignment 策略与执行口径，不是这些科学硬门本身错误。

## 2. 漏斗重建

| 周期 | Locator | 报告 fresh raw | D1 | Deep | Clean brief |
|---|---:|---:|---:|---:|---:|
| Source19 | 36 | 30 | 1 | 1 | 0 |
| Source20 | 38 | 30 | 0 | 0 | 0 |
| 合计 | 74 | 60 | 1 | 1 | 0 |

按报告口径，raw→D1 只有 1/60（1.7%）。D1→deep 为 1/1，说明执行者不是“有 D1 却没深挖”；真正损失发生在 raw 与 D1 之间。唯一的 Source19 D1 是 AArch64 FPMR FP8，深审后被当前 GCC 同一见证上的冗余写消除直接吸收。

但 raw 分母本身不干净。两轮至少有 22/74 个 locator 行明确属于 repeat、active、historical、contained 或前轮身份；Source19 S3/S5、Source20 S5/S6 等 handoff 又把其中部分写进 raw_count/fresh_raw。Source19 S6 的 fresh-raw 数与 disposition 明细也无法一一对齐。这里不是哈希或格式问题，而是分母定义错误：不能用这 60 条估计真正新 family 的转化率。

另一个重要数字是 24 个 `NOT_ADMITTED_UNFROZEN`：Source19 为 13，Source20 为 11。它们没有形成 brief，但也不是被科学否定。其常见缺口是 current union、自然 carrier、stock oracle、独立 subtractor 或一个具名同对象动作尚未同时闭合。

## 3. 具体损失来自哪里

### 3.1 重复和成熟 union：大部分是真实负面，但进入得太晚

重复/活动身份本应在 raw 之前剔除。Source19/20 仍反复出现 Verilator、QEMU、gem5、MIOpen、Composable Kernel、TPCx-AI、CUDA memory domain、AArch64 FPMR 等前轮或活动对象。即使最终正确排除，它们也占用了 locator、raw 表格和解释成本。

成熟 union 的结构性淘汰大多合理：现有 selector/configuration、通用 layout/scheduling/formal wrapper、改变设备接口或对象语义，不能靠改名变成 N2。审计没有发现降低 same-object 或 current-source 门的理由。

### 3.2 Source20 的“近期论文先行”经常把完整答案一起带进来

Source20 至少 8 条被近期论文直接碰撞或由 anchor paper 自带完整 constructor：MLIR-AIR、WAMI、μNPU benchmark、TinyML phase accounting、Neutrino、KPerfIR、NITRO/OpenVINO 路线和 Dato mapping。近期论文确实提高了问题真实性，却同时显著提高了“论文已经把这个问题做完”的概率。

因此“再多读近期论文”不是充分解。更有效的顺序是：先从当前源码找到一个肯定存在的 cliff、coarse fallback 或静态动作，并确认代码中还存在能维护同一不变量的细粒度原语；再查近期论文是否已经组合出同一完整动作。近期论文主要承担 subtractor 和边界约束，而不是默认充当选题生成器。

### 3.3 过早闭合把 source work 当成了完成方案

Source19 S2 明确要求在 D1 前同时给出“两套完整合法计划”；其他 lane 也把完整 action、完整 union、carrier、oracle 和 subtractor 全部设成深审前置条件。原则上这些字段最终都要闭合，但当前调度没有给近门槛 family 一次有界 source-repair：缺一项就直接 `NOT_ADMITTED_UNFROZEN`，所有 deep 容量作废。

Discovery 在 D1 前应要求同对象义务、肯定性问题证据、现有局部原语和一个非通用 residual skeleton；不应要求已经实现两套完整方案。clean brief 才冻结完整原子动作和 fidelity plan，Stage 0 再独立核对完整 current action catalog。Source17/18 的 Verilator 和 QEMU brief 也证明，Discovery 能提出精确动作，但 Stage 0 仍需要 pinned action catalog/certificate；两题目前都只是 primary `REVISE_ONCE`，尚未得到 Stage 0 confirmation PASS，所以不能把它们当成成功率证明。

### 3.4 贡献类型固定过早

Source20 S3 将 NPUEval 判为“benchmark 不是 natural carrier”，对 N3 自然规律题是正确的；但如果实际论文合同是 `BENCHMARK_DATASET`，它应按代表性、覆盖、外部效度和版本化 population 审查，而不是因不属于自然 workload history 直接失去入口。贡献类型可以在 raw 前重路由一次；重路由不降低自然证据门，只是改用正确的类型合同。

### 3.5 深审数量和 lane 数不是当前瓶颈

两轮总 deep ceiling 为 24，实际只使用 1。继续增加并行 lane 或 deep ceiling不会解决问题，只会产生更多未闭合 raw。应先把 shallow screening 的一部分预算改成 source closure，并要求漏斗单位可对账。

## 4. 正向对照揭示的有效题源形状

Source17 的 Verilator 和 Source18 的 QEMU brief 共享四个条件：

1. 当前第一方材料肯定地记录一个 cliff 或限制，而不是仅靠 future-work 推断缺口；
2. 当前 union 已有局部原语：Verilator 有静态 MTask、依赖图和 profile；QEMU 有 full flush、细粒度 invalidation 和引用修复；
3. 候选不是 selector，而是维护目标特定不变量的完整表示/状态转换；
4. 有 stock 语义 oracle、自然版本化 carrier 和小 legality witness。

这比“从论文标题找未解方向”更有利于 AI 自主完成：源码定位、状态不变量、最小 witness 和公平 baseline 都可审计。但两个 brief 仍在 Stage 0 revision，说明下一轮还要提高 action inventory 的精度，不能照抄题名或假设它们已通过。

## 5. 建议的下一轮：V5 单周期试点

### 5.1 全局容量

保持六个长期 lane，不增加并行数。每路最多 8 个 locator、最多 4 个真正 fresh raw；总 locator≤48、fresh raw≤24。减少的 raw 数不转成更多枚举，而是为每路最多 2 个 `C0_SOURCE_REPAIRABLE` 提供一次 source-closure，总 C0≤12。

每个 C0 最多读取/冻结 5 个决定性 artifact 角色：问题锚点、当前官方文档、当前源码路径/commit、自然 carrier、stock oracle/最强 subtractor。不是要求五份不同文档，而是五个角色都必须有结果或诚实写明未闭合。每个 family/facet 只允许一次 C0 closure；不能因结果不好替换候选。

深审总上限仍为 12，预先分配：S1=2、S2=2、S3=1、S4=3、S5=2、S6=2。只有完成 D1 的卡片能进入 deep；不足时容量失效。

### 5.2 新漏斗定义

`LOCATOR → EXCLUDED_BEFORE_RAW / FRESH_RAW → C0_SOURCE_REPAIRABLE → D1_SOURCE_CLOSED → DEEP → BRIEF`

- `LOCATOR`：所有被查看的线索，包括重复和排除项；
- `FRESH_RAW`：身份/休眠过滤后，已有 exact object、固定保证和肯定性问题证据的唯一 family；
- `C0_SOURCE_REPAIRABLE`：没有 direct collision、换对象、纯 selector 或 generic-wrapper 硬失败；已具备 source-declared cliff、至少一个当前局部原语和 provisional residual，只允许缺 current-union 完整表、carrier/oracle pin 或 small witness 中的一项；
- `D1_SOURCE_CLOSED`：补齐 current union、独立 subtractor、自然 carrier、stock oracle、非通用 action skeleton 和最小 witness；不要求实现、结果或两套完整程序；
- `DEEP/BRIEF`：冻结完整原子动作、信息条件、公平强基线、full-cost、失败区和有限 fidelity plan。

C0 的选择在 closure 结果前完成，按确定性顺序排序：问题证据是否肯定、局部原语是否源码可定位、carrier/oracle 是否已公开、缺口项数、locator 顺序。禁止使用模型自报置信度。

### 5.3 六路题源与深审策略

下列数量是每路 raw≤4 内的题源组合指引，不是录取或提案配额；找不到合格对象时允许空缺。

| Lane | 优先题源 | 避免项 | Deep 上限 |
|---|---|---|---:|
| S1 | ABI/ISA/编译器/accelerator runtime 中“全局 reset、fallback、revalidate”与已存在局部 repair primitive 的语义不对称；固定状态和可观测语义 | 单纯 flag、target choice、已实现同一修复 | 2 |
| S2 | GPU/NPU data movement、spill、serialization、host-device copy、NDP/PIM mapping 中肯定存在的 full-cost cliff，并有公开 runtime/simulator 和局部搬移/记账原语 | 只说 bandwidth 很高、无固定模型/ABI、改表示绕过成本 | 2 |
| S3 | 先冻结真实版本化 release/trace/RTL/model history 与 stock validator，再寻找可重复的变化规律或利用动作；允许一次贡献类型重路由 | profiler 生成的临时 telemetry 冒充自然 carrier；测试套件冒充 population | 1 |
| S4 | 已有公开结果 panel、提交记录或测量 log 的缺失性、代表性、排序稳定、复现性和 end-to-end full-cost；优先无需新增硬件即可先证伪的对象 | 把 NR/缺失直接当未测系统结论；复述近期 benchmark paper | 3 |
| S5 | 非活动身份中的 target-specific repair、compaction、recovery、bounded recourse：当前 coarse action 与 fine invariant-repair primitive 并存；另保留 target-specific formal/checker 入口 | generic formal wrapper、通用 P&R/search、论文自带完整 constructor | 2 |
| S6 | GPU/NPU 或非 backend 系统中的直接数据结构/表示转换；必须有固定 I/O、stock checker、源码局部原语和非 controller whole action | solution selector、generic fusion/layout/scheduling、设备接口改义 | 2 |

S4 的 `MEASUREMENT_CHARACTERIZATION` 与 `BENCHMARK_DATASET` 保持独立合法入口。S3 遇到 benchmark corpus 时，先判定是否应按 benchmark 类型审查；不得仅因它不是 N3 natural carrier 就丢弃，也不得因此免除代表性和外部效度要求。

### 5.4 文献与 current source 的顺序

S1/S2/S5/S6 默认顺序改为：

1. 当前源码/官方文档中的 affirmative cliff 或 coarse action；
2. 同一对象中已存在的局部 repair/validation/accounting primitive；
3. exact invariant、natural carrier 和 stock oracle；
4. proposed complete residual transition；
5. 最近论文、paper artifact 和 generic kernel 作最强 collision/subtractor。

S3/S4 仍可由论文或公开数据形成问题锚点，但论文自己的贡献、artifact 和结果必须先划出边界。`paper-owned constructor` 只有在 exact object、atomic action、information、guarantee 和 cost 都实质相同才直接淘汰；若只是同一问题而候选是有独立来源支持的正交动作，应进入六维差异表继续审查。action-space 相似不能代替直接吸收证据。

## 6. 风险、验收与回滚

### 风险

- raw 数会下降，单个近门槛 family 的 source work 增加；
- “partial primitive + cliff”可能诱导过度组合，产生看似精巧但没有 Q2 广度的机制；
- 如果 current source inventory 做得不完整，会提高假 residual 的假阳性；
- S4 公开 panel 优先可能偏向容易分析而不够重要的数据。

### 机械验收

1. locator、excluded-before-raw、fresh raw、C0、D1、deep、brief 七个计数逐路可对账；
2. fresh raw 中 repeat/active/hold/STOP/dormant 为 0；
3. 每个 C0 在结果前选定，每个 family/facet 最多一次 closure，最多五个决定性 artifact 角色；
4. 每个 deep 都有 D1；没有 outcome-aware replacement；
5. 每个 brief 都有 source-located action inventory skeleton、current union、contrary evidence、自然 carrier、oracle、full-cost 和小 witness；
6. 不改变 Q2、same-object、current-source、强基线、自然证据、full-cost、复现或 claim ceiling。

brief 数不是验收配额。试点应报告 C0→D1、D1→brief 及实际 Stage 0 repair vector；只有出现真实 clean brief 后，Stage 0 反馈才可用于判断 precision。若再次零 brief，不自动复制 V5、不扩大 raw/deep/lane，也不启用 V9，而是用此次可辨识漏斗决定下一次策略。

### 回滚

V5 只存在于一个 assignment 的 control 和六路 assignment 文件。出现 source work 显著膨胀、C0 定义被当成候选状态、current-source inventory 质量不足、泛化组合题增多或漏斗无法对账时，下一安全边界删除该 profile，恢复现行 canonical v8.7 可变题源调度。所有 ledger、结构性负证据、dormancy 和 STOP 保持，不迁移候选状态。

## 7. Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- 最小有效修改：只在下一轮 control/六路 assignment 加入 V5 题源顺序、C0 closure、严格漏斗计数和 lane 容量；不修改共享规则。
- 历史回测：不要求。它改变 source allocation 和前置 source work，不改变 canonical 科学判定。
- 前瞻验证：必须运行且只运行一个完整六路周期；在考虑永久共享 patch 前读取实际 clean brief 的独立 Stage 0 反馈。
- 用户批准：现有持续授权已覆盖该单周期试点；永久共享 patch、资源扩张、V9 或科学门变化仍需另行批准。

## Mainline handoff

- User approval already present: `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814`
- Files proposed for immediate change: 仅下一轮 assignment-local `control/CONTROL.yaml` 与 `DISCOVERY_S1...S6_ASSIGNMENT.yaml`
- Shared files proposed now: 无
- Registry migrations proposed: 无；只由主线登记新 assignment
- Existing active/blocked/hold/terminal topics affected: 无
- Shared files modified: `false`

