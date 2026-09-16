# Rule Audit Report：Source21 与 Machine Outliner Stage 0 反馈

## 中文摘要

- 得到了什么：R23 的 C0 source-closure 确实恢复了一个可攻击的 clean brief；Source21 从 10 个报告 C0 中形成 1 个 D1、1 个 deep 和 1 个 Machine Outliner brief。
- 仍有什么问题：PRIMARY 与独立 confirmation 都判 `REVISE_ONCE`。Discovery 识别了“候选全局选择”残差，却没有确认拟议选择器所需的合法动作是否在前序 overlap pruning 后仍然存在，也没有完整扣除 CGData 已有的 global discovery。
- 建议怎样改：下一轮保留 V5 容量和题源原则，只在“即将进入 D1”的 C0 上加入单见证、单模式、四节点的 `WITNESS_LOCAL_ACTION_SURVIVAL_TRACE`。它验证动作是否活到选择器输入，不枚举全部 target、backend、flag 或论文。
- 是否需要用户动作：不需要。现有持续 Discovery 授权覆盖一个 assignment-local 单周期试点；永久共享 patch 仍需用户批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE21-MACHINEOUTLINER-FEEDBACK-R24`
- `trigger`: Source21 形成一个 brief，但 Stage 0 发现 action-enumeration survival 缺口
- `requested_by`: 主线
- `date`: 2026-08-14
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE21-MACHINEOUTLINER-FEEDBACK-R24`
- `shared_files_modified: false`

## 1. Source21 实际漏斗

| Lane | Locator | 报告 fresh raw | C0 | D1 | Deep | Brief |
|---|---:|---:|---:|---:|---:|---:|
| S1 | 4 | 2 | 2 | 0 | 0 | 0 |
| S2 | 4 | 4 | 0 | 0 | 0 | 0 |
| S3 | 4 | 4 | 2 | 0 | 0 | 0 |
| S4 | 4 | 4 | 2 | 0 | 0 | 0 |
| S5 | 8 | 4 | 2 | 0 | 0 | 0 |
| S6 | 8 | 4 | 2 | 1 | 1 | 1 |
| 合计 | 32 | 22 | 10 | 1 | 1 | 1 |

按报告口径，raw→C0 为 45.5%，C0→D1 为 10%。和 Source19/20 的合计 60 raw→1 D1 相比，C0 至少把一个真正可由 Stage 0 攻击的题送了出来；因此不应撤销 C0 或恢复大批浅筛。

但漏斗仍有三个执行问题：

1. S3 报告 locator=4、raw=4，同时又说其中 CDS 与 OpenTitan 两条在 C0 前被排除；按行重算，fresh raw 应为 2。
2. S1 的 CUDA mbarrier 在 C0 后才被确认为历史 TMA/异步屏障包含身份，说明一个 excluded identity 消耗了 C0；C0 应只能服务 fresh raw。
3. S2 的四条 raw 是“GPU memory/interconnect cliff”等领域桶，而不是 exact project、version、source locus 和 family identity；它们不能形成可审计的 raw 分母。

按实际行重算，Source21 约为 20 个 fresh raw、9 个来自 fresh raw 的有效 C0、1 个 D1/brief。该修正只用于本次流程诊断，不改写冻结 handoff。

## 2. Machine Outliner 的真实 Stage 0 修复向量

### Discovery 做对了什么

S6 找到一个肯定存在的当前机制：MachineOutliner 已有 suffix-tree 候选发现、target legality/call/frame hooks、合法替换和 greedy selection。它还给出了同一 MachineIR、固定 ABI/unwind/relocation 的小冲突见证，避免把题目写成普通 flag selector 或抽象 solver。

这足以形成条件性 `TIER_B_Q2_VIABLE` 论文形状，所以 PRIMARY 和 confirmation 都没有 STOP，而是允许一次静态 revision。

### Discovery 漏了什么

PRIMARY 的修复向量为：

- `OMITTED_FIRST_PARTY_FEATURE`：CGData Write/Read 与 `llvm-cgdata` 已经实现跨模块/global candidate discovery；“global”本身不是 residual。
- `ATOMIC_ACTION_UNCLEAR`：尚未确定候选只是选择当前已枚举动作，还是必须修改候选生成/保留过程。
- `EVIDENCE_LOCATOR_OR_VERSION_GAP`：brief 没有冻结 exact LLVM commit、target 和完整 source path。

独立 confirmation 又指出更细的风险：local repeated-string path 可能在后续 selector 之前就丢弃重叠 occurrence；CGData global path 的 match enumeration 又是另一条动作形成路径。因此，仅查看 `FunctionList` 或最终 greedy loop，不能证明它包含所有拟议 Pareto selector 需要的 native-legal actions。

换句话说，brief 说的是“在现有候选上做更好的选择”，但其小见证中的某个候选可能根本活不到选择器。如果需要改变早期 enumeration/pre-pruning，贡献必须明确成为“候选保留/枚举 + 选择”，并重新接受 current-union、复杂度和 generic-kernel 攻击。

## 3. 为什么不能把完整 catalogue 前移到 Discovery

Stage 0 的 revision gate要求完整列出 local/global CGData、target hooks、flags、reruns、frame/call、所有候选路径，并构造 target-specific recurrence 与 degeneration map。这是新颖性和论文形状的决定性工作，若全部前移，会让每个 Discovery C0 都变成一次小型 Stage 0，恢复旧的低吞吐问题。

Discovery 真正需要回答的更小问题只有：**我声明的这一条合法动作，在我声明的这一个 pipeline mode 中，是否从生成点一路存活到拟议 selector 的输入？**

这是一条 witness-local source trace，不是 complete catalogue。它只能排除“选择器优化了一个不存在的动作集”这种明显假阳性；不能证明全局新颖性、Q2、最优性或完整 current union。

## 4. 建议下一轮：V6 单周期试点

### 4.1 总体容量完全不增加

保留 V5 的六 lane 和容量：每路 locator≤8、fresh raw≤4、C0≤2；全局 locator≤48、fresh raw≤24、C0≤12、deep≤12。deep 上限继续为 `S1/S2/S3/S4/S5/S6=2/2/1/3/2/2`。

新增检查不增加 artifact budget。每个 C0 仍最多五个决定性 artifact 角色；`action_survival_trace` 从已经读取的 current-source artifact 中提取，只对其他 D1 字段已经闭合、即将进入 D1 的行执行。

### 4.2 四节点 witness-local survival trace

每个 selection/optimization 型近 D1 卡必须冻结：

1. `claimed_pipeline_mode`：例如 local、CGData Read、特定 compiler/runtime path，不得混写多个模式；
2. `action_origin_locus`：拟议原子动作第一次被当前系统识别或生成的 source symbol/data structure；
3. `preselection_transform_chain`：到 selector 之前的 legality、canonicalization、dedup、merge、overlap prune、fusion、fallback 或 sampling/aggregation；
4. `selector_input_locus_and_survival`：该 witness 的每个备选动作是否仍以可区分、native-legal 单元进入 selector。

输出只允许四种：

- `SURVIVES_TO_SELECTOR`：selection-only 表述可保留；
- `PRUNED_BUT_SAME_OBJECT_RECOVERABLE`：必须在 brief 前把原子动作改写为 enumeration/retention + selection，并重新检查 generic kernel、full-cost 与 current union；
- `PRUNED_BY_LEGALITY_OR_OBJECT_CHANGE`：结构性淘汰；
- `UNKNOWN_UNFROZEN`：来源未闭合，不得形成 brief，也不是 STOP。

Machine Outliner 若使用这项检查，必须分别声明 local 或 CGData mode，并跟踪冲突 witness 的 occurrence 是否在早期 overlap discard 后仍在。若不在，就不能继续称为纯 global selection。

### 4.3 六路应用方式

| Lane | V6 survival 检查重点 | 仍保留的题源方向 |
|---|---|---|
| S1 | IR/ABI/ISA 状态动作经过 legalize、combine、lowering 和 target filtering 后是否仍可选 | compiler/ABI/ISA 与 GPU/NPU runtime 语义 cliff |
| S2 | 数据移动候选经过 partition、fusion、fallback、driver/runtime scheduling 后是否仍存在 | GPU/NPU、NDP/PIM、host-device full-cost cliff；raw 必须具名项目和源码 locus |
| S3 | 规律或利用动作所依赖的 observation 经筛选、dedup、版本对齐后是否仍可观测 | 真实版本化 workload/release/trace；允许一次类型重路由 |
| S4 | measurement/benchmark 信号经 missingness、aggregation、normalization 和报告过滤后是否仍支持同一 estimand | 公开 panel、覆盖、排名稳定、复现与 GPU/NPU full-cost |
| S5 | repair/recourse 候选在 legality、canonical repair、prepass 和当前 solver 输入前是否存活 | target-specific EDA/simulation/非编译器 recourse；排除 generic wrapper |
| S6 | 直接算法候选在生成、去重、冲突/overlap pruning 后是否进入拟议 selector | GPU/NPU direct algorithm、architecture data structure、非 backend system primitive |

S3/S4 不强迫使用“动作枚举”术语：它们使用同构的 `observation survival`，确保自然 evidence 在抽样/聚合前后仍支持同一 estimand。测量与 benchmark 继续是独立贡献入口。

## 5. Discovery 与 Stage 0 的明确分工

Discovery 只需：

- 一个 exact object/guarantee；
- 一个具名 current-source witness；
- 一个明确 claimed mode；
- 四节点 survival trace；
- action wording 与 survival 结果一致；
- current union、自然 carrier、oracle、full-cost 和有限 falsifier 的现有 D1/brief 字段。

Discovery 不需要：

- 枚举所有 target/backend/mode/default/nondefault flag；
- 构造完整 action catalogue；
- 证明 recurrence、FPT bound 或 Pareto completeness；
- 完成全量近期论文碰撞；
- build、实现、实验或结果。

Stage 0 继续独立负责完整 current action/flag catalogue、所有重要模式的反方核验、target-specific 与 generic solver 的区分、外部同对象碰撞、Q1/Q2 校准和正式 revision gate。这样既能减少明显假阳性，又不会把 Discovery 变成 Stage 0。

## 6. 风险、验收与回滚

### 风险

- 单条 C0 的源码阅读略增，可能进一步降低 raw 吞吐；
- 单见证存活不能证明其他 mode/target 也存活，可能产生虚假安全感；
- `PRUNED_BUT_RECOVERABLE` 容易把一个窄 selection 题扩成过大的 enumeration+selection 系统；
- 对 S3/S4，机械套用 compiler 术语会误伤合法 measurement 题。

### 控制

- 只对即将进入 D1 的 C0 做一次、一个 witness、一个 claimed mode 的 trace；
- 不增加 C0、artifact、deep 或 lane 容量；
- recoverable 时必须重新检查 same-object、generic kernel 和 full-cost，不能自动升级；
- S3/S4 使用 observation-survival 合同；
- Stage 0 永远重新做完整 catalogue，不能继承 Discovery 的“complete”声明。

### 机械验收

1. locator、excluded-before-raw、fresh raw、C0、D1、deep、brief 可逐行对账；
2. fresh raw 必须具名 exact project/release/source locus，不能是领域桶；
3. excluded identity 消耗 C0 的数量为 0；
4. 每个 selection/measurement 型 D1 均有一条 witness-local survival trace；
5. `SURVIVES` 才允许 selection-only claim；`PRUNED_BUT_RECOVERABLE` 必须重写 action；`UNKNOWN` 不得 brief；
6. 没有 outcome-aware backfill；所有科学硬门不变。

brief 数不是配额。若下一轮形成 brief，记录 Stage 0 是否仍给出由 preselection survival 遗漏导致的 `OMITTED_FIRST_PARTY_FEATURE` 或 `ATOMIC_ACTION_UNCLEAR`；这是诊断指标，不是自动 PASS 条件。若零 brief 或 trace 成本失控，不自动续跑 V6。

### 回滚

V6 只写入一个新的 assignment-local control 和六路 assignment。下一安全边界可撤销 survival trace，恢复 V5/现行 v8.7 调度；保留所有 ledger、负证据、dormancy 和候选状态，不复活 STOP。

## 7. Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- 历史回测：不需要；这是 current-source 见证检查和调度澄清，不改变 canonical 科学门。
- 前瞻验证：仅一个完整六路周期；永久共享 patch 前必须读取真实 Stage 0 repair vector。
- 用户批准：现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 已覆盖本轮；无需新的 generic approval。
- 共享文件：本审计不修改；若以后永久化，需另行用户批准并由主线单写者实施。

