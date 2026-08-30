# Rule Audit Report

## 中文摘要

- 核心判断：Source13/14 的低产出同时包含“健康淘汰”和“题源选择效率不足”。两轮共报告 72 个 raw/scoped screening events、约 68 个去重 family、23 次 candidate-grade deep review，形成 1 份 clean brief；约 74% 的深审对象最终被同对象保证差异、current native union、selector/controller 或通用 scheduling/layout/packing kernel 淘汰。硬门正在正确阻止弱题，但这些风险多数在投入深审后才暴露，说明深审排序仍可改善。
- GPU/NPU 不是投入不足：两轮 assignment 的 GPU/NPU 指导槽位约为 35/72，Source14 又把占比提高到 20/36，却仍为零 brief。只增加 GPU/NPU 名词或近期 backend/API 数量，会继续得到“已有旋钮的重新选择”或“通用算法换硬件外壳”。
- S4 能形成 brief 的原因：它先有当前一手文档明确支持的测量有效性威胁，再由 MLPerf 冻结自然 workload、质量和 wall-power 对象；研究残差是“同一 workload 下测量结论是否因 native counter compatibility/multiplexing 改变”，不是新 profiler flag、dashboard 或 runtime controller。CounterPoint 作为近期方法扣减项又限制了 claim ceiling。这个证据角色组合在大多数算法/编译器 family 中没有同样完整地出现。
- 建议：保持正在运行的 Source15 不变。下一安全 assignment 使用一次有界 `SEMANTIC_RESIDUAL_SOURCE_TRIAGE_V1`：仍为六路、每路 raw guidance 6、基础深审 2；只在至少三份预先冻结的 role-complete residual card 都达到 `D1_WITNESSABLE` 时允许第三次深审。改变的是题源与排序，不是录取门。
- 对反复未冻结对象：初次深审后最多允许一次预登记、source-only carry-forward closure。若同一缺失 facet 仍未闭合，则进入调度标签 `DORMANT_SOURCE_SATURATED_UNFROZEN`，至少三个完整六路周期不再消耗 raw/depth；这不是 STOP、reserve 或候选状态，只有新的官方版本/源码、近期独立论文、公开 oracle/natural carrier 或用户/主线定向授权才可恢复。
- 用户动作：现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 已覆盖一次不改科学门、不开 V9、不增 lane 的 assignment-local 试点，无需再次请求 generic approval。永久写入共享规则、自动抑制器、常态化增预算或改变录取语义仍需用户单独批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE13-14-GPU-NPU-ZERO-YIELD-R21`
- `trigger`: Source13 仅 S4 形成一份 clean brief；Source14 在进一步提高 GPU/NPU 题源比重后六路零 brief
- `requested_by`: mainline under continuing adaptive-discovery authority
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE13-14-GPU-NPU-ZERO-YIELD-R21/`
- `shared_files_modified: false`

## 问题与范围

- 审计问题：Source13/14 的漏斗损失来自题源饱和、重复负担、current-union 吸收、自然载体缺失、过早闭合要求还是残差机制本身薄弱；为什么 S4 有一个 measurement brief；下一安全边界如何提高 clean-brief yield。
- 规则输入：`AGENTS.md`、`plan.md`、相关 `registry.yaml` 记录、`rules/ROLE_RULE_AUDIT.md`、`rules/ROLE_DISCOVERY.md`。
- 证据输入：R17、R18 全包；Source13/14 十二个 lane 的 assignment、handoff、日志、collision matrix、deep review；Source13 S4 brief；只读核对了正在运行的 Source15 合同以避免提出重复或中途变更。
- 范围外：修改共享文件；暂停或联系 Discovery；启动候选、Stage0/A/B；实验、构建、安装、下载；V9、阈值、候选状态或终态变更。

## 现行权威行为

现行科学边界总体合理：

1. 零 brief 合法，不得用提案配额补数；
2. same-object、current collision、强 baseline、自然证据、full-cost、可复现和 claim ceiling 不可放松；
3. Discovery 只需形成可攻击的条件性研究包和有限 fidelity closure plan，不要求实现、结果或核心结论；
4. `NOT_ADMITTED_UNFROZEN` 不能伪装成科学 STOP；
5. measurement/characterization 与 benchmark correction 是独立合法入口，不必虚构 N2 优化器；
6. 重复零产出后可以在下一安全 assignment 改变题源配比，但 V9 保持 `OFF`。

R17 已提出 saturation-aware source roles，R18 已提出 raw 与 full depth 之间的 residual-survival card。Source13/14 实际落实了领域重配和 measurement 独立入口，但没有系统冻结“机会锚点—当前 union—最强扣减—自然载体/oracle”的深审前角色完整性；Source15 已进一步尝试 native-semantic refocus 和一个 S4 carry-forward，本审计不得改动它。

## 漏斗证据

### 1. 两轮漏斗

| 周期 | lane-reported raw/scoped events | audit-reconciled unique families | deep reviews | clean briefs | 备注 |
|---|---:|---:|---:|---:|---|
| Source13 | 36 | 34 | 11 | 1 | S4 `DCGM × MLPerf`；其余五路零 |
| Source14 | 36 | 34 | 12 | 0 | 六路零；触发 R21 |
| 合计 | 72 | 68 | 23 | 1 | raw→brief 1.39%；deep→brief 4.35%，均只是描述性漏斗，不是 Discovery recall |

各 lane 对 raw、scoped、unique 的词汇略有差异，因此 68 是依据逐路 handoff 重建的 family 数；72 是 lane 报告的 screening-event/scoped 总数，不能把两者混作统计分母。

对 72 行作审计归一化时，36 行有结构性淘汰证据，24 行保持 unfrozen，11 行是重复/active/前轮 identity 排除，1 行形成 brief。对 23 次深审，17 次结构性淘汰、5 次 unfrozen、1 次 brief。也就是说，深审后结构性淘汰约为 73.9%。这不是“门太严”的证据；它说明 current-union 检查有效，但深审槽位频繁投给了可更早识别为高吸收风险的对象。

### 2. 健康淘汰占相当部分

以下结论应保留，不能为提高 yield 而撤销：

- AArch64 MOPS、Objective-C ARC、PJRT donation 等表面两计划实际改变 fault/restart、ownership 或 resource/lifetime 保证；
- CUDA TMA/async copy、OpenXLA scheduling、IREE DMA、TensorRT-LLM/OpenVINO mapping、ONNX Runtime/torchao quantization 等候选动作已在当前 native option/action union 中；
- Hexagon/NVPTX/Vela/IREE LLVMGPU 等剩余机制退化为通用 instruction selection、resource scheduling、layout/packing 或 pass/config selector；
- dashboard、metric restatement、既有 profiler mode 选择没有独立论文形状；
- active/hold/前轮 identity 被正确排除，没有复活终态或重复题。

这些是 same-object、fair-current-union 和非通用机制门正常工作，属于 healthy abstention。

### 3. 可修复的筛选效率问题

#### 3.1 增加 GPU/NPU 比例没有改变题源原型

Source13 的 assignment 指导中约 15/36 是 GPU/NPU/accelerator 槽位；Source14 提高到约 20/36。Source14 仍为零 brief，说明领域比重不是主要限制。

许多题从当前工具文档、backend 目录、flag/config surface 或完整 compiler constructor 出发，再寻找两个计划。这样的 source archetype 天然容易得到：

- 当前 union 内的选项组合；
- selector/controller；
- 通用 scheduling/layout/packing/ISel；
- 缺少公开 stock oracle 的 proprietary NPU graph；
- 改变 ABI、ownership、resource 或 numerical guarantee 的伪 same-object 对照。

这会提高 current collision 的发现率，却不会同步提高 union 外研究残差的先验概率。领域标签变了，机会生成机制没有充分改变。

#### 3.2 文献问题是角色不平衡，而非统一增加篇数

Source13/14 的决定性文件普遍具有较好的 current first-party documentation/source 覆盖，这是可靠 subtractor；但除 S4 外，近期论文机会锚点、独立 contrary/generic-kernel 文献、自然 carrier/oracle 通常没有在深审前同时冻结。于是审查先从当前 action surface 生成想法，又由同一 surface 把想法吸收。

因此不建议对每个 raw family 增加固定论文篇数。应在稀缺 depth 前补齐四个功能角色：

1. `OPPORTUNITY_ANCHOR`：近期原始论文的明确边界、版本化测量异常、定理边界或一手 artifact 行为；
2. `CURRENT_NATIVE_UNION`：当前官方文档、源码、默认与非默认入口；
3. `STRONGEST_SUBTRACTOR`：同对象近期方法或通用/formal kernel；
4. `CARRIER_OR_ORACLE`：版本化自然 corpus、stock semantic checker 或可执行同语义 oracle。

只对满足有限闭合路线的高潜力 family 做定向 genealogy expansion；不得用无方向的“多读几篇”替代缺失角色。

#### 3.3 自然载体与 target-specific guarantee 是主要 unfrozen 缺口

Source14 S3 的 OpenXLA、ExecuTorch，以及 S4 的 ROCprofiler、Nsight Compute 都有可信问题或机制，但没有同时冻结 checksum/version-pinned natural panel、estimand/confounds、held-out falsifier 与 union 外动作或结论阈值。S1/S2/S5/S6 的多个 near-miss 则缺少 stock oracle 或 target-specific guarantee。

这不是“缺结果/缺实现”造成的错误淘汰；它是进入 depth 前没有充分验证 carrier/oracle 可获得性和 residual 是否能在同保证下存活。该缺口适合调整排序，不适合降低 brief 门。

## 为什么 S4 能形成一个 measurement brief

`S4_DCGM_MLPERF_COUNTER_COMPATIBILITY` 同时具备六个少见条件：

1. **问题由肯定证据支持**：DCGM 当前文档明确记载 counter-group 兼容性、自动 multiplex 和高频零值风险，不依赖“未找到某动作”的 absence claim；
2. **自然对象已冻结**：MLPerf Inference 固定 workload、scenario、quality、SUT 与系统级 wall power；
3. **比较器同对象**：native multiplexed stream 与 compatible-group repeated windows 只改变 collection plan；
4. **贡献类型匹配**：残差是 measurement validity/characterization，而不是 profiler flag selector 或新控制器；
5. **扣减项明确**：CounterPoint 限制了普适 counter-noise 新颖性，claim 只保留 DCGM-native group contract 与 MLPerf full-cost contract 的交集；
6. **可证伪且诚实**：held-out workload/GPU stratum 无结论差异就是 killer，Discovery 没有宣称已观察到排名反转。

Source14 S4 的两个 near-miss 反向验证了这个模型：ROCprofiler 与 Nsight 都有真实测量 tension，但缺少预先冻结的自然并发 workload panel、estimand、confound/full-cost 与 held-out consequence threshold，所以保留为 unfrozen 是合理的。Source15 已给 ROCprofiler 一次有限 carry-forward；本审计不应增加第二次无限延期。

## 根因判定

| 原因 | 证据强度 | R21 判定 |
|---|---|---|
| Q2/same-object/current-union 门过严 | 低 | 不支持；大量淘汰有明确结构性证据 |
| GPU/NPU 题源数量不足 | 低 | 不支持；Source14 已显著提高占比仍零产出 |
| current-source 覆盖不足 | 混合 | 作为 subtractor 覆盖较强；作为机会锚点不够 |
| 论文谱系总量不足 | 中低 | 不能简单按篇数判断；主要缺战略角色组合 |
| selector/current-union/generic 风险发现太晚 | 高 | 主要可修复瓶颈 |
| 自然 carrier/stock oracle 未在 depth 前确认 | 高 | unfrozen 的主要可修复来源 |
| target-specific residual/guarantee 薄弱 | 高 | 算法/编译器题零产出的主要科学原因 |
| measurement 独立入口有效 | 中；目前仅一例且 Stage0 尚未完成 | 值得保留，不可过度外推 |
| 六路并行不足 | 无支持 | 不增 lane；提高每个 depth 的先验质量 |

## 建议

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_AFTER_SOURCE15`
- 最小有效变化：Source15 完成后，在下一安全 assignment 运行一次 `SEMANTIC_RESIDUAL_SOURCE_TRIAGE_V1`，详细字段见 `RULE_CHANGE_PROPOSAL.md`。
- 不修改 Source15：它已经实施 native-semantic refocus 和一次 S4 carry-forward，应先形成可识别结果。
- 不增加长期并行数：继续六路；raw guidance 6/lane、base depth 2/lane 不变。
- 有条件第三深审：仅当同一 lane 至少三份 residual card 在任何 depth 结果出现前均机械达到 `D1_WITNESSABLE`，才可预登记第三项；不得事后补位。
- 题源优先级：从有明确问题证据与语义 seam 的 sources 出发，而不是从 option grid/backend directory 反推题；GPU/NPU 领域仍优先，但不设配额。
- S4 measurement/benchmark 保留独立入口；carrier-first，而非 profiler-flag-first。
- unfrozen 有限化：同一 family 最多一次 source-only carry-forward；再次缺同一 facet 后转为可恢复的调度休眠，不作科学 STOP。

## Discovery 与 Stage0 的边界

Discovery 在 clean brief 前应完成：exact object/guarantee、问题锚点、原子 residual sketch、同对象 witness skeleton、current-union fingerprint、最强 subtractor 类、自然 carrier/oracle route、full-cost axes、最多三个决定性 closure question 与有限 fidelity plan。

Discovery 不应完成：穷尽全球新颖性、Stage0 的独立 current-union 重建、正式 Q1/Q2 终裁、实现/结果、Stage A killer 的执行或候选状态变更。一个 source card 只是 depth 调度证据，不能把“未闭合”自动升级为 DROP。

## 验证与回滚

- 比较单位：Source13、Source14、Source15 和下一 pilot 分开报告，不合并成 IID 样本；以 raw event、unique family、deep review、brief、Stage0 disposition 分层计数。
- 机械完整性：100% depth rows 在结果前已有四角色覆盖或明确的一步闭合路线、native-action fingerprint、carrier/oracle route 和 primary risk；第三深审必须有时间先后证据。
- 方向性过程指标，不是 proposal quota：
  - deep 后 selector/current-union/generic/changed-guarantee 淘汰占比应相对 Source13/14 的 17/23 下降；
  - 每个 carry-forward 在一次重试内进入 brief、结构性 drop 或 dormant，不再无限 unfrozen；
  - measurement depth 不再因缺自然 carrier/estimand 才在深审末尾失败；
  - raw→family→depth→brief 与 reason code 100% 可对账。
- 科学指标：任何 brief 的独立 Stage0 结果及 repair vector；尤其观察 `ATOMIC_ACTION_UNCLEAR`、`OMITTED_CURRENT_SAME_OBJECT`、`NATURAL_CARRIER_GAP`、`FULL_COST_GAP`。Source13 S4 目前仅排队，不能当作 Stage0 precision 证据。
- 永久化门：至少一个完整 prospective pilot，并获得其中真实 brief 的独立 Stage0 反馈；若仍无 brief，只能判断过程，不足以永久改规则。
- 回滚：若 source-role card 重新造成 raw starvation、显著增加无方向文献成本、压制高价值 human-core 方向，或 Stage0 repair burden 无改善，则在下一安全边界移除该 assignment-local profile；保留所有日志和状态，不复活 STOP。

## 风险分析

- False-negative：显式语义 seam 优先可能漏掉尚无清楚 action 的新颖想法。缓解：raw problem lead 仍可记录；未选 depth 不是 STOP，三周期 dormant 后有新证据可恢复。
- False-positive：近期 limitation 句子可能被包装成题。缓解：仍要求 current union、same-object witness、carrier/oracle 与 generic-kernel subtraction。
- 文献成本：四角色可能诱发无界阅读。缓解：每个 depth 最多三个决定性问题；只为未闭合 facet 增加来源，不设论文数量目标。
- measurement 泛化：S4 单例可能诱发大量 profiler 题。缓解：必须有自然 carrier、估计量/混杂、结论后果、full-cost 和 held-out killer；flag/dashboard 继续淘汰。
- 高价值但 AI 难执行：不得因 oracle/hardware 不足判 STOP。若论文潜力在 Stage0 后成立但 AI 核心执行不足，仍按现行规则进入 `HUMAN_RESEARCH_RESERVE`；Discovery 这里只调整优先级。

## Mainline handoff

- User approval already present: 一次 assignment-local、六路不增并行、不改科学门的 source/depth pilot 已由持续 adaptive-discovery authority 覆盖。
- User approval still required: 永久共享规则/模板 patch；自动分类或黑名单；常态化提高 raw/depth/并行预算；V9 SHADOW/PRODUCTION；任何质量门、状态语义或终态变更。
- Files proposed for shared change now: none.
- Registry migrations proposed now: none.
- Active Source15 affected: no.
- Existing candidates/holds/STOP affected: none.
- Shared files modified: `false`.

