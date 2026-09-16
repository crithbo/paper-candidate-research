# Stage 0 / Stage A Q2+ Local-Resource Backtest Protocol

## 1. Purpose

本试点估计两个不同问题：

1. `academic_survival_rate`：真实、合格的 Q2+ 或同等级论文，在按其历史时间点重建为候选后，是否被当前规则错误判成科学 `STOP`。
2. `operational_advancement_rate`：在本机资源边界内可做最小证伪实验的正控，是否能完成有效 Stage A 构造并获得独立 gate 的 PASS 或一次合法修订后的 PASS。

它不以“已发表”替代科学硬门，也不以提高通过率为目标。

## 2. Pre-registered resource envelope

Stage A 主分母只纳入在封包前满足以下条件的案例：

- Windows 原生可执行；不得依赖 WSL、Docker daemon、商业许可或系统级环境修改。
- 公开论文、公开源码或作者 artifact；资源动作必须服从独立 assignment 的 `RESOURCE_LOCALIZATION` 与 lifecycle 合同。
- 下载与解压后的 assignment-local 资源预计不超过 20 GB。
- 单次构建预计不超过 2 小时；一个决定性、非 claim-complete 的 probe 预计不超过 6 小时。
- CPU、内存和单张 RTX 4070 足够；不得要求多机、多 GPU、FPGA/ASIC、专用 NPU/PIM、私有 trace 或真实生产流量。
- 允许论文原生 benchmark 的公开、小规模、自然/canonical 子集，但不得换对象、换指标或降保证。

资源预检发生在盲包分配之前，只检查平台、依赖、体量、命令入口和数据可得性，不运行科研假设。预检失败的案例按预登记替补顺序更换；替换理由必须在揭盲前落盘，不能根据预期审查结果回填。

## 3. Isolation and blindness

### Success-concealment rule

只有 PACKER 与最终 AUDITOR 可以知道案例来自既有论文、属于正控/负控、venue 等级或真实结局。MAINLINE 仅负责机械冻结与路由，不得在发送给执行支线的任务标题、prompt、context、目录名、文件名或口头说明中出现以下信息：

- `backtest`、`calibration`、`historical paper`、`published`、`Q1/Q2`、`positive control`、`negative control`；
- 论文题名、作者、机构、venue、年份、DOI、artifact 仓库、奖项或真实结果；
- “该题应当通过”“这是已有成果”“用于测误杀率”等会暗示金标的措辞。

执行支线必须把输入当作普通、新发现的候选，按现行角色规则独立完成审查、检索、实现和 gate 判断。每个执行包使用与论文无关的随机中性 ID，且不得位于本审计目录或包含 `RULE_AUDIT` 的可见路径。执行支线不得读取 `CASE_POOL.yaml`、`SOURCE_LEDGER.md`、本协议或 PACKER/AUDITOR 的密封记录。

如果执行者从既有记忆、搜索结果、代码元数据或措辞中识别出论文身份，必须只报告 `BLINDING_CONTAMINATION` 并停止该案；不得继续给出科学判断。该案按预登记替补更换，不计入通过率，也不得把识别后的判断当作结果。

### PACKER

- 读取完整论文、artifact、venue 证据和历史 cutoff 资料。
- 冻结 exact object、primary claim、原子动作、机制、比较器、自然/canonical evidence route、full-cost 维度和最小 falsifier。
- 验证 publication identity，并固定“投稿/发表时期”的信息截止点。
- 生成中性包，隐藏题名、作者、venue、引用、论文最终数值、接受事实和后来的成功采用。
- 改写而非复制论文摘要、章节标题或可反向检索的独特句子；候选包只保留 exact object、原子动作、机制、比较器、证据路线和 falsifier 所需的技术语义。
- 生成 executor-visible 与 auditor-only 两套目录；前者不得以路径、manifest、注释、许可证头、数据元信息或 Git remote 泄漏论文身份。
- 不参与 EXECUTOR 或 AUDITOR 判断。

### Stage 0 EXECUTOR

- 只看中性候选包和 cutoff 以前可用的 current-union 资料。
- 按当前 `ROLE_STAGE0_REVIEW` 给出 `PROPOSE_STAGEA / REVISE_ONCE / HUMAN_RESEARCH_RESERVE / BLOCKED_USER_ACTION_REQUIRED / BELOW_Q2_STOP` 建议及理由。
- 不通过互联网反向搜索候选短语、代码结构或隐藏身份。正常的 current-collision 检索只能使用 PACKER 冻结、去身份化、截止于候选最早公开日期之前的 source universe；不得用 2026 年检索结果判断历史候选。

### Stage A EXECUTOR + independent gate

- 只接收 Stage 0 合法存活且通过资源预检的案例。
- PACKER 提供可实现的最小 probe 合同、去身份化的自然/canonical 输入与公平 comparator 接口，但不提供作者方法实现、作者 artifact 路径、论文最终结果或复现实验脚本。
- owner 必须依据冻结的候选机制自行实现最小 probe，就像处理普通 Stage A 题目；PACKER 只可在 auditor-only 区使用作者 artifact 验证 gold label、资源上限与最终 evidence ceiling。
- 首个 claim-bearing run 前必须通过现行 fidelity gate；无效构造先修复，不得把 proxy 结果用于 PASS/STOP。
- gate 与 owner 分离；一次合法 scientific revision 单列 `after_one_revision`。

### AUDITOR

- 最后揭盲，复核论文身份、历史 cutoff、金标资格、资源归类和规则适用是否正确。
- 将偏差分类为：`wrongful_scientific_stop`、`correct_revise`、`correct_reserve`、`correct_block`、`invalid_construction`、`identity_or_cutoff_leakage`、`gold_label_invalid`。

## 4. Gold-label qualification

每个正控只有同时满足下列条件才进入分母：

- 真实、同行评审、达到 Q2 期刊或领域公认同等级 venue；期刊优先冻结论文发表年度的公开分区证据。
- 在其历史 cutoff 下，没有已知 same-object direct absorption。
- 论文的主贡献能按 `METHOD_ALGORITHM / SYSTEM_ARCHITECTURE / COMPILER_TOOL / MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET / THEORY_FORMAL / REPLICATION_NEGATIVE` 之一形成完整论文结构。
- 论文原始证据路线具有自然/canonical 输入、公平比较和可复现性；若论文自身遗漏决定性 full-cost 或换对象，则不能作为 qualified positive。

已发表但不满足以上条件的论文不是规则误杀证据，必须在 EXECUTOR 运行前由 PACKER 替换或标记为 gold-label exclusion。

## 5. Outcomes and denominators

### Stage 0 academic survival

分子：`PROPOSE_STAGEA`、一次合法修订后 `PROPOSE_STAGEA`、正确 `HUMAN_RESEARCH_RESERVE`、正确 `BLOCKED_USER_ACTION_REQUIRED` 或不含科学否定的 `HOLD`。

分母：完成 PACKER 金标核验的 qualified positives。

只有被当前规则错误判为 `BELOW_Q2_STOP` 才是 `wrongful_scientific_stop`。

### Stage A academic survival

分子：gate PASS、一次合法修订后 PASS、或在 claim-bearing observation 前被正确路由为资源/人工保留而未形成科学 STOP。

分母：进入 Stage A 的 qualified positives。该指标回答规则是否误杀，不代表可执行吞吐。

### Stage A operational advancement

分子：通过 fidelity gate 后获得独立 Stage A PASS（含一次合法修订后 PASS）。

分母：封包前已满足本地资源 envelope、且 artifact 构造有效的 Stage A 正控。

资源预检失败、identity leak、gold-label invalid 和无效构造不进入该分母，但都必须报告次数；不得静默删除。

## 6. Pilot thresholds

- Stage 0 正控目标：至少 `11/12` academic survival；`10/12` 以下或出现重复同因误杀，标记过严风险。
- Stage A 本地正控目标：至少 `7/8` academic survival，并分别报告 first-pass 与 after-one-revision；operational advancement 不设掩盖构造问题的宽松阈值。
- 负控目标：`4/4` 被正确拒绝或收缩。任一 same-object direct-fatal 负控被 PASS，触发 `PILOT_FLAGS_UNSAFE_RELAXATION`，不得用高正控召回率抵消。
- 额外过严触发：正控中 `>=3/12` wrongful scientific STOP；或 `>=2` 个案例被同一个非硬门、非贡献类型合同理由误杀；或任何完整证据上限包仅因“不像性能优化论文”而被误杀。
- 每个比例报告 Wilson 95% interval。示例：`9/12=75%` 的区间约为 `46.8%–91.1%`，不能据此宣称已稳定达到 75%；试点后至少需要约 40–60 个冻结案例的确认性回测。

“75%”不应分别要求每一门：`0.75 × 0.75 = 56.25%`。若控制面希望端到端约 75%，一个可讨论但不写入 production 的组合目标是 Stage 0 `>=90%`、Stage A `>=85%`，即约 `76.5%`。

## 7. Decision logic

- `PILOT_SUPPORTS_CONFIRMATORY`: 正控误杀未触发阈值、负控 4/4 正确、无系统性构造/资源混淆；继续扩大到 40–60 例，不改硬门。
- `PILOT_FLAGS_OVERSTRICTNESS`: 触发正控误杀条件，且 AUDITOR 将原因定位为同一规则语义或贡献类型错配；只提一个最小澄清/补丁。
- `PILOT_FLAGS_UNSAFE_RELAXATION`: 任一 direct-fatal 负控错误存活；优先修正审查一致性，不提高召回目标。
- `INCONCLUSIVE`: 样本身份、cutoff、盲化、artifact 构造或资源预检不足以识别规则效应；重封或换预登记替补，不推断规则松紧。

## 8. Forbidden shortcuts

- 不用 2026 年 current union 淘汰历史论文；必须使用论文当时 cutoff。
- 不把重型 Linux/集群案例放进本地 Stage A operational denominator。
- 不把资源、license、设备、网络或工具链失败写成科学 STOP。
- 不把 Stage A 的小 probe 当论文主结论已完成。
- 不按结果更换案例、删负控、删强基线或缩分母。
- 不由同一任务兼任 PACKER、EXECUTOR、AUDITOR。
- 不向执行支线透露这是回测、已发表成果、Q2+ 正控或预期 PASS。
- 不把作者实现、论文 artifact 仓库或带论文身份的复现脚本交给 Stage A owner/gate。
