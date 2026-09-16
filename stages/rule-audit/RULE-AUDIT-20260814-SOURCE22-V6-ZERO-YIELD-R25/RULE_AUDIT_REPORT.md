# Rule Audit Report：Source22 V6 零产出与下一轮题源修正

## 中文摘要

- 得到什么：V6 的局部 action-survival 检查本身有效。三个达到触发条件的对象全部完成 trace，也全部证明动作确实能到达 selector；之后分别因当前原生 union、同对象直接算法碰撞和通用分区求解结构被淘汰。这三次属于健康克制，不应通过放松门槛挽救。
- 真正瓶颈：其余四路停在 trace 之前。S1/S2 主要是题源只有映射、配置、领域桶或未闭合的 source union；S3 回到已饱和的 GCC/Rust 分区表面；S4 的四个 locator 全是论文已拥有的精确 constructor。V6 修正了“动作是否活到 selector”的误差，却没有修正“从什么证据起题”。
- 建议：下一安全边界只运行一轮 `PUBLIC_NATURAL_PROBLEM_CARRIER_TYPE_SPLIT_V7`。先冻结独立于论文与成熟工具的自然问题载体，再按贡献类型使用不同的 C0 入口；成熟 compiler/tool 只可作为 current union、比较器或实现载体，paper-owned constructor 只可作为 subtractor。V6 trace 保留为近 D1 的低成本检查，不继续扩写成完整 catalogue。
- 是否需要用户动作：不需要新的 generic approval。现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 覆盖一次不增 lane/容量、不改科学门、V9 OFF 的 assignment-local 题源调度试点。审计会话不实施；主线只能在下一安全 assignment 边界冻结执行。永久共享规则修改仍需另行用户批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE22-V6-ZERO-YIELD-R25`
- `trigger`: Source22 V6 六路均完成但零 `CLEAN_STAGE0_BRIEF`
- `requested_by`: 主线
- `date`: 2026-08-14
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE22-V6-ZERO-YIELD-R25`
- `shared_files_modified: false`

## 1. 审查范围与现行边界

本审计读取了 `AGENTS.md`、`plan.md`、`registry.yaml`、`rules/ROLE_RULE_AUDIT.md`、R24 报告/提案/交接、Source22 control 与六路 handoff/log，以及 Machine Outliner Stage0 revision1 的动作目录、claim matrix、报告与交接。

现行规则要求：连续零产出时可改变题源投入，但不能设提案配额、降低 Q2/same-object/current collision/strong baseline/natural/full-cost/reproducibility 门或启用 V9。Discovery 只需给出有限闭合路线，不要求实现和结果；Stage0 继续负责完整动作目录、独立碰撞与 Q1/Q2 裁决。终态 STOP 不得复活。

## 2. Source22 实际漏斗与分母

| Lane | Locator | Raw 前排除 | 报告 fresh raw | C0 | Trace | D1 | Deep | Brief |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| S1 | 4 | 2 | 2 | 0 | 0 | 0 | 0 | 0 |
| S2 | 4 | 0 | 4 | 0 | 0 | 0 | 0 | 0 |
| S3 | 5 | 3 | 2 | 2 | 0 | 0 | 0 | 0 |
| S4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 |
| S5 | 8 | 4 | 4 | 2 | 1 | 0 | 0 | 0 |
| S6 | 8 | 4 | 4 | 2 | 2 | 2 | 2 | 0 |
| 合计 | 33 | 17 | 16 | 6 | 3 | 2 | 2 | 0 |

机械计数可对账：`33 locator = 17 excluded + 16 reported raw`；16 raw→6 C0（37.5%），6 C0→3 trace（50%），三个实际触发项的 trace 覆盖率为 100%，其中三条均到达 selector；2 D1→2 deep（100%），2 deep→0 brief。

但 raw 的语义分母仍不完全可信。S2 的四条记录只是 `GPU/NPU movement`、`NPU command stream`、`compiler-runtime cliff`、`NDP/PIM primitive` 领域桶，没有 exact project/version/source locus；这重复了 R24 已指出的 raw identity 缺陷。其余 12 条至少有具名 family/project 行，但部分也未冻结 exact release/commit。因此：

- 33/16 可以作为本轮事件计数，不能当作 16 个已审计唯一机会族；
- raw→C0 比率只能用于粗略流程观察，不能作为方法精度；
- 3 个 trace 与 2 个 deep 是当前最可识别的科学分母；
- 下一轮必须让每条 raw 先有可审计 identity，不能再用领域桶占用 raw。

## 3. 三条 trace 后淘汰：健康克制

### Verible changed-line formatting

单行变更经 diff helper 形成 `--lines`，确实到达 formatter selector；但这条局部动作已由当前 whole-file + partial-line formatter union 直接表达。把它改写成 interval retention/selection 只剩通用选择器。结论是 `CURRENT_UNION_ABSORPTION`，不是 trace 失败。

### Ginkgo block-Jacobi partition

两个合法 bounded partition 都能到达选择点，但剩余问题只是 target-independent matrix partition/packing；没有领域原生的非乘积状态或新保证。结论是 `GENERIC_PARTITION_SOLVER`。

### LLVM MachineBlockPlacement

两个 CFG 合法布局都能进入 selector，但 Codestitcher/ExtTSP 已提供同对象全局块布局算法。结论是 `DIRECT_SAME_OBJECT_COLLISION`。

三者说明 action survival 是必要检查，不是论文性证明。提高 brief 数不能靠删除 current-union、same-object 或 generic-kernel 门。

## 4. 四路未触发 trace：题源与 source-closure 瓶颈

| Lane | 实际停点 | 诊断 |
|---|---|---|
| S1 | 2 raw，0 C0 | Zalasr 只有 target mapping；OpenCL device enqueue 退化为通用调度，缺独立同对象动作、自然 carrier 与 subtractor 联合闭合。 |
| S2 | 4 报告 raw，0 C0 | 四条均为抽象领域桶；缺具名 upstream/ABI/model/oracle。这里既有执行口径缺陷，也有题源过浅。 |
| S3 | 2 C0，0 trace | GCC LTO 与 Rust CGU 都是成熟分区表面；自然 carrier、原子动作或 distinct object 未闭合，并受当前 union/历史相邻题限制。 |
| S4 | 4 locator，0 raw | SIRIUS、Weaver、GPreempt、Multiverse 都由论文拥有精确 constructor/characterization；论文被当成主题源，而不是 subtractor。 |

因此“未触发 trace”不是 V6 漏执行。四路中 S1/S2/S4 停在 C0 前，S3 虽有两个 C0，也停在其他 D1 字段闭合之前。共同原因是题源先从成熟工具、论文动作或宽领域名词出发，再试图寻找残差；这比从自然问题载体出发更容易落入完整 current union 或 paper-owned constructor。

## 5. V6 是否有正价值

有，但价值是诊断精度，不是产出提升：

1. 三个触发项全部生成 trace，没有漏做；四路无触发项没有伪造动作路径。
2. 它排除了“候选在前序变换中消失”这一类假阳性，同时证明 surviving action 仍可能被更强硬门淘汰。
3. Machine Outliner revision1 进一步验证这个边界：完整动作目录显示 local overlap pre-pruning 与 CGData union；即使保留动作，余项也退化为通用 interval/conflict packing。不能把完整 catalogue 前移到 Discovery。
4. 数值记账比 Source21 更一致，但 S2 的 raw identity 仍未按 R24 修复，说明 V6 的 telemetry 条款执行不完整。

结论：保留 V6 trace 的最小机制；停止继续加深同一批成熟 tool surface。下一轮应改变“题从哪里来”和“不同贡献类型如何进入 C0”。

## 6. 推荐的一轮 V7 策略

### 6.1 先有自然问题载体，再看工具和论文

每条 fresh raw 必须先形成 `PUBLIC_PROBLEM_CARRIER_PAIR`：

1. exact public carrier：具名、版本化、可再次定位的自然 workload、trace、benchmark panel、conformance/regression corpus、instance family 或官方语义变更；
2. exact problem/estimand：在不引用拟议算法的情况下，能够说明同一对象上的 cliff、缺失量、稳定规律、保证缺口或 full-cost 矛盾；
3. contribution-type contract：明确属于 method/system/compiler/measurement/benchmark/theory 中哪一种；
4. finite closure route：列出随后需要核对的 current official source、最强 subtractor 与 stock/formal oracle，但 raw 阶段不要求核心结论或实现。

本轮 `mature_compiler_or_tool_as_primary_origin_cap=0`，`paper_owned_constructor_as_primary_origin_cap=0`。成熟工具仍可作为 current union、比较器、实现载体或 source reality check；近期论文仍可作为 locator/anchor/contrary/subtractor。禁止把工具名、pass 名、formatter/parser/selector 配置面或论文自带动作直接当作研究问题。

### 6.2 按贡献类型拆分 C0，不再一刀切要求 partial native primitive

- Method/compiler/system：需要 source-closed 当前动作、一个同对象原子 residual 与有限 legality witness。
- Measurement/benchmark/N3：需要 public panel/trace、固定 estimand、独立 oracle/重算路线与未被现有 characterization 覆盖的 missing facet；不要求 native repair primitive。
- Theory/formal：需要 canonical instance family、当前最强 bound/baseline、可检查证明/反例路线；不要求产品实现。
- Architecture/cross-layer：需要公开 workload/model/interface、固定 full-cost 分母和非通用的跨层动作边界；缺商品硬件不影响 Discovery 录取。

原有 D1、same-object、current union、strong baseline、natural evidence、full-cost 和 falsifier 字段全部保留。V6 的单 witness、单 mode、四节点 action/observation survival 只对其他 D1 字段已闭合的 C0 触发，不增加 artifact 或容量。

### 6.3 六路精确题源与 deep 调度

| Lane | 下一轮 primary origin | 明确避免 | Deep ceiling |
|---|---|---|---:|
| S1 | 官方 ISA/ABI/标准语义变化 + 独立 conformance/regression corpus；先冻结跨版本语义矛盾，再检查 compiler/runtime source | 以某个 pass、feature flag 或 target mapping 本身起题 | 2 |
| S2 | 公开跨硬件/跨版本 workload trace 或 benchmark result panel中的 bottleneck migration/full-cost cliff | GPU/NPU 领域桶、driver/config selector、没有 public model 的 NDP/PIM 猜想 | 2 |
| S3 | 至少两个版本的自然 workload/model/operator/artifact corpus，寻找稳定结构、漂移或失配；工具只作承载 | GCC/Rust/LLVM 等成熟 partition/cache/index 表面作为主题 | 2 |
| S4 | 官方 benchmark 提交表、公开运行日志、coverage/missingness/reproducibility panel，先冻结 estimand 与可重算路线 | 近期系统论文自带 measurement constructor 作为主题 | 3 |
| S5 | 版本化 canonical instance/conformance corpus + stock checker，寻找 domain-native online/recourse/formal residual | EDA simulator/formatter/parser UI、通用 CP/ILP/SMT wrapper | 1 |
| S6 | 公开 domain dataset/trace/checker 中的 source-independent 算法缺口，随后再映射到 GPU/NPU/architecture/software | named selector、generic partition/layout/packing、成熟 tool pass 作为题源 | 2 |

总容量仍为 locator≤48、fresh raw≤24、C0≤12、deep≤12；每路 raw≤4、C0≤2；六 lane 不变。deep 只在 carrier、current union 和 strongest subtractor 均闭合且 residual 非通用时使用。每个 C0 的五类 artifact ceiling 不变，优先覆盖 `problem carrier / current official union / strongest contrary-subtractor`，不以无目标增加文献数量替代战略证据覆盖。

## 7. 风险与控制

- 风险：一轮禁止成熟工具作为 primary origin，可能暂时漏掉真实的 tool-specific residual。控制：仅一轮；工具仍可作为 current union/实现载体，下一边界可回滚。
- 风险：carrier-first 容易偏向 measurement。控制：六路使用不同 type contract，但不设录取配额；任何类型仍需 Q2 论文形状。
- 风险：公开问题载体也可能导向通用算法。控制：C0 继续要求领域原生非乘积状态或 type-appropriate 独立贡献；generic solver 仍淘汰。
- 风险：source qualification 增加前置阅读。控制：总 locator/raw/C0/deep 与五 artifact roles 不增，只把阅读顺序改为 carrier→current union→contrary。
- 终态风险：无。Machine Outliner、Verilator 等 STOP 身份继续排除，绝不借新策略复活。

## 8. 验收、停止与回滚

机械验收：

1. 每条 raw 均有 exact carrier identity、版本/日期、问题/estimand、type contract 和有限 source-closure route；领域桶 raw=0。
2. paper-owned exact constructor primary raw=0；mature compiler/tool primary-origin raw=0。
3. locator、排除、raw、C0、trace、D1、deep、brief 逐行对账；excluded 不消耗 raw/C0。
4. 所有实际 trace trigger 均有单 witness/单 mode trace；不触发则写明缺失字段，不伪造。
5. 无 outcome-aware backfill、提案配额、Stage/实验/下载/V9 输出。

效果判断不设 brief 配额。若有 brief，立即交独立 Stage0，并记录是否仍因 paper ownership、mature current union、generic kernel 或 source identity 缺陷失败。若整轮仍零 brief：

- 若所有 raw 均合格且仅被硬碰撞淘汰，记为 healthy abstention；
- 若四路以上仍停在 source-closure 或出现领域桶/paper-owned/theme-origin，判 V7 题源修正未解决入口问题，不自动重复；
- 无论结果如何，只运行这一轮，下一轮必须重新审计或恢复现行 v8.7 调度。

回滚只需在下一安全 assignment 边界撤销 V7 source profile 与 type-split C0 入场说明；保留所有 ledger、负证据、dormancy 和状态，不迁移候选、不复活 STOP。

## 9. Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- Historical backtest: 不需要；canonical v8.7 科学判断不变，修改的是一轮题源与阅读顺序。
- Prospective validation: 一个完整六路周期，之后停止自动续跑。
- User approval: `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 已覆盖。
- Mainline action: 在下一安全边界冻结一个 V7 control 和六路 assignment；审计会话不实施、不联系 Discovery。
- Permanent shared patch: 不在本授权内，若未来永久化需用户另批并由主线单写者实施。
