# RULE AUDIT REPORT

## 1. 审计身份

- `audit_id`: `RULE-AUDIT-20260811-POLICY-HOLD-FOUR-TOPICS-R2E`
- 授权：`POLICY-HOLD-AUDIT-ONLY-20260811-R2E`
- 日期：`2026-08-11`
- 角色：长期 `RULE-AUDIT-SENTRY`
- 决策标签：`USER_POLICY_DECISION_REQUIRED`
- 工作根：`D:\project\writing\reserch`
- 唯一写目录：本审计目录
- 共享控制文件修改：`false`
- 候选目录修改：`false`
- 实验、下载、候选运行、Stage B：`false`

## 2. 输入冻结与审计边界

审计开始时，下列四个冻结哈希均核验一致：

| 输入 | 冻结 SHA256 | 开始时核验 |
|---|---|---|
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | PASS |
| `plan.md` | `6CE3E9207E02F4DC24D7B4126EEB7A9E9210AC51FF1D64440F2C7FF1BE12373D` | PASS |
| `registry.yaml` | `E18E1145EDCF11DF0A0843DD93AE9FB65A26C8CF41C64E4B300CA567F175C33D` | PASS |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` | PASS |

审计过程中主线继续写入共享状态，`registry.yaml` 后续只读复核时已变为 `5C1B22A9D06ECDAD8894F40898313F5AD2928BC274824286F8630793623C07FB`。本报告不采纳该漂移后的新状态，不混用两份 registry；四题事实以开始时已核验的冻结快照和各题不可变的 Stage 0、Stage A、gate、handoff 证据为准。此漂移不是审计写入造成的。

本轮只回答四题为何不能可信 PASS、也不能科学 STOP，以及用户可选择的政策处置。报告不授权第二次 scientific revision，也不改变任何候选状态。

## 3. 总体结论

四个 `INCONCLUSIVE_POLICY_HOLD` 均是合理的 fail-closed 结果，不是质量门误杀，也不是应自动转为 STOP 的普通负结果。共同结构是：唯一 revision 已实际消耗，但决定结论所需的构造、比较器、形式证书或基线外部性仍无效；现有记录又没有提供 direct absorption、形式反证、自然对象上的决定性反例或 full-cost 下 residual 消失等科学 STOP 证据。

因此：

1. 不建议放宽 Q2、same-object、current collision、公平强基线、自然输入、full-cost、fidelity、复现或证据诚实门。
2. 不建议把任何一题自动判为 `HUMAN_RESEARCH_RESERVE` 或资源 blocker；剩余问题原则上仍可由 AI 有限完成，只是需要用户是否破例允许额外 scientific revision 的政策决定。
3. 不建议四题同时破例。若用户只授权一个高信息增益、边界清晰的例外，优先 `PARQUET-PAGE-COSEGMENT` 的 fidelity-only repair。
4. `S4-SLO-PAGEPACK`、`GIN-POSTING-CUT-DP` 暂留 HOLD；`KALLSYMS-VERSIONAWARE-TOKEN-STABILITY` 暂留 HOLD 且最低优先，用户若要缩短队列可选择“撤回但不记科学 STOP”。
5. 现有 HOLD 规则无需放松；建议另行批准一个只对未来 assignment 生效的 revision-admissibility 澄清补丁，降低“把唯一 revision 花在不可采信构造上”的概率。

## 4. 逐题证据与判定

### 4.1 `S4-SLO-PAGEPACK`

冻结研究残差是 same-object 的精确联合 page packing，相对 faithful `OBASE → MDK` 的完整成本比较。owner revision 报告称 3 个测试中 0 个形成严格 residual，并建议 STOP；独立 gate 正确拒绝该结论。

已核验的决定性缺陷：

- relocation destination allocator 在 6 个 method/epoch 状态中的 4 个允许 live byte interval 重叠，候选构造的合法性不闭合；
- comparator 固定使用 `CIW=3` 和 next-fit，不是冻结要求的 adaptive OBASE 与 first-fit；
- comparator 扩展 page count 时，benefit 使用的分母不可比；
- “non-dominated” 实际实现为候选在每个字段都不差的 dominance 条件，且缺少 planning-work budget。

为什么不能 PASS：候选可行性、公平比较器、指标分母和判定逻辑同时失真，0/3 或其他数值均不能支持机制。

为什么不能 STOP：执行过的 comparator 并未代表冻结强基线，且至少一个 epoch 的 comparator 本身 SLO-illegal；没有证明 faithful union 吸收候选，也没有自然对象上的决定性反例。

分类：`CONSTRUCTION_INVALIDITY + COMPARATOR_MISMATCH + METRIC_DENOMINATOR_CONFLICT`。修复是多轴重构，不是机械勘误；当前不值得优先消耗例外。

证据锚点：owner revision report `D76C27BAB2E3AF16BAE226AB33903D3EC000BE8193BA31717AA136555829A89D`；closing gate report `AB6B3A416AF1D5D29D5F767708E401A7811BB0E71837D760015A6EC87DCA05`；closing handoff `36514E7AC96F77ACBFA18D9111675968021318A6E3DD6246DCAB15F2716B6419`。

### 4.2 `PARQUET-PAGE-COSEGMENT`

现有非时序事实具有较高信息价值：20 个完整自然 NYC TLC 文件，两次 replay 均保持 20/20 语义一致，340/340 输出 hash 一致；126/1608 个 action 稳定，implemented heuristic 的 useful-action rate 为 `7.8358%`，文件约小 `3.06%`。但 owner 用于 STOP 的 `126–131×` full-cost 比例不可信。

已核验的决定性缺陷：

- 冻结的 deterministic Latin rotation 未执行，union 总是在 candidate 前计时；
- 一个 combined timer 把 12 个 fixed grid、3 个 CDC grid 的生成/评分及 candidate DP 全部计入 candidate，同时给 baseline planning 记为零；
- 实际 representation family 比 Stage 0 冻结的完整 native family 更窄。

移除混杂 planning bucket 后，candidate/union 的 write+query 比例约为 `0.978×` 与 `1.011×`，说明 `126–131×` 主要是成本归因伪影，而非机制性 full-cost 失败。

为什么不能 PASS：完整 representation family、对称计价和顺序平衡未闭合，现有 timing 不能支持性能主张。

为什么不能 STOP：`7.8358%` 只描述已实现 heuristic；398 个 outside-family action、较小文件和近似持平的去混杂 write+query 数值均说明 residual 尚未被公平强基线决定性消除。

分类：`COMPARATOR_COST_ATTRIBUTION + ARM_SCHEDULING + REPRESENTATION_FAMILY_CLOSURE`。四题中它的修复边界最窄、自然证据最完整、预期信息增益最高。

证据锚点：owner report `84184606C71C8D648FF3664C3DA4D57AE48D75758BCDE0F2479AC73D63121890`；results `ADB99DB20D4B79F8F142318BF867706C3B4F0CF6A1BAA8B019D9365920642C47`；closing gate report `58A5549A5F75DD2078227334614E72303DC3350DCB0C8BB67288F18DA93E76A`；closing handoff `E737B0C75260B34C2134C95AC6E00785D6E76E2B6599034F65F21580DB51EA59`。

### 4.3 `GIN-POSTING-CUT-DP`

Stage 0 revision 提出 native GIN hierarchy 上的 exact open-frontier DP，并以 logical `next_gt` event 作为冻结动作。独立 closing review 发现，形式证书没有匹配冻结的 PostgreSQL `REL_18_STABLE@a4c41…` 语义。

已核验的决定性缺陷：

- exact `advancePast` 在进入 `ginFindLeafPage` 前已转换为 strict successor；witness 声称先下降到 `L_{K+1}` 再沿 right link 到 `L_{K+2}`，而实际下降目标已经是 `L_{K+2}`，比较次数和节省公式失效；
- `rho` 未证明 Markov-sufficient，缺失当前 buffer page/validity、list/offset/nlist suffix end、closed source leaf descriptor/settlement、event temporal state，以及 exact/lossy/end 转移；
- per-key 独立求解与全局 multikey warm cache 不相容，除非明确冻结 `Bc=0` cold proxy，或改为 joint multikey state。

为什么不能 PASS：关键 witness 与 current-source semantics 不一致，且 DP state sufficiency 未闭合。

为什么不能 STOP：native hierarchy 的结构映射仍有合理部分，当前 union 也没有证明在同函数同保证下吸收任意 regroup；没有 direct collision 或不可能性证明。

分类：`CURRENT_SOURCE_SEMANTICS + CERTIFICATE_INVALIDITY + STATE_SUFFICIENCY`。修复需要新的证书/witness，而不是改一个数字；设计风险中高。

证据锚点：revision report `B6568075DD51EE5AA66A6ACF8BB631BD0725F12821135C12E5C3C03C6C6A01CA`；closing review `F039A2ED1872868A344F1C3A2F7FA7D974BFEEC3B98B8086A6D403B8B233B975`；closing handoff `74911156062FD4BBA60CF73D6E6760B08E94281D899375D0E8BEB38C02E0AFB7`。

### 4.4 `KALLSYMS-VERSIONAWARE-TOKEN-STABILITY`

same-object 的 `ONLINE_FIXED_PREDECESSOR/R0` 表述和受限 exact LKF 路线本身尚可讨论；但唯一 `ab/xy` slot witness 以保留 predecessor identities 获得 `8` 对 `15` delta bytes 的优势时，使用的动作已经落入它自己冻结的强基线 union。

已核验的决定性缺陷：

- union 明确包含 finite predecessor-token-stability heuristic grid；
- 该 grid 获得与 witness 相同的 predecessor/target 信息；
- 冻结材料没有给出限制，能排除 grid 表达同一 slot-preservation action。

为什么不能 PASS：唯一 novelty witness 不是 union-external，不能证明 N2 divergence。

为什么不能 STOP：该 witness 被吸收不等于完整 LKF/R0 frontier 被吸收，更不等于形式不可能；缺少对整类 action 的覆盖证明。

分类：`BASELINE_UNION_EXTERNALITY_FAILURE`。要继续必须找到真正 same-object、union-external 的动作与 witness，最容易发生事后构造和历史过拟合，当前优先级最低。

证据锚点：revision report `FBC7523574D8A820FD2611611DF6850B0BFA1A932A2BE13A280B4EEB76A1D470`；closing review `158CEA98F70E19869815DD050D515A55C4BD69208B44B3CEADAB955EAD04B14D`；closing handoff `75C1B8F92D59A1C1C8504344C13DF9253BB35A0343D51A77CF43960EDB424991`。

## 5. 规则冲突诊断

这里不存在“规则要求同时 PASS 和 STOP”的规范冲突。实际冲突是候选执行产物与冻结合同之间的 admissibility 冲突：

| 题目 | 主冲突 | HOLD 是否合规 |
|---|---|---|
| S4 | 非法构造、非冻结比较器、不可比分母 | 是 |
| Parquet | 非对称计价、未执行轮转、比较器族不全 | 是 |
| GIN | 当前源码语义与 witness 不一致、状态不充分 | 是 |
| KALLSYMS | novelty witness 被自身强基线覆盖 | 是 |

`INCONCLUSIVE_POLICY_HOLD` 正好阻止了两类证据不诚实：用 invalid proxy 判 PASS，或把 comparator/certificate 缺陷包装成科学 STOP。问题不在 HOLD 状态，而在唯一 revision 开始前缺少一份可执行的 admissibility 断言矩阵。

## 6. 建议的用户政策选择

推荐组合：

1. 仅对 `PARQUET-PAGE-COSEGMENT` 授权一次 `EXCEPTIONAL_FIDELITY_REPAIR`；授权必须逐项冻结在 `TOPIC_DECISION_MATRIX.md` 所列边界内，不能改变机制、自然 corpus、阈值或问题对象。
2. `S4-SLO-PAGEPACK` 与 `GIN-POSTING-CUT-DP` 继续 HOLD，不立即授权例外。
3. `KALLSYMS-VERSIONAWARE-TOKEN-STABILITY` 继续低优先 HOLD；若用户以队列简化为先，可明确撤回，但不得登记为科学 STOP。
4. 另行批准未来规则澄清补丁，并先做两次 assignment shadow；shadow 只检查工件完备率和额外成本，不改变候选录取结果。

该组合不保证 Parquet PASS；它只保证下一次观察在公平、同对象、完整计价且可复核的合同下产生。有效修复后，独立 gate 可以据真实结果给 PASS 或科学 STOP。若修复再次违反冻结边界，则不得再给第三次机会，回 HOLD 交用户最终处置。

## 7. 风险、预期收益与验收

| 建议 | 主要风险 | 预期收益 | 验收指标 |
|---|---|---|---|
| Parquet 单题例外 | 形成“失败就追加 revision”的先例 | 以最小重跑成本恢复最接近可判定的一题 | 100% Latin rotation；三类计时分离；对称 allocation；完整 native family；独立 gate 可判 |
| 其余三题继续 HOLD | 潜在好题延迟 | 避免高风险重构占用 Stage A 吞吐 | 状态不漂移；无实验/下载；未来只有新用户政策 ID 才能恢复 |
| revision-admissibility 澄清 | 增加工件和预检时间 | 减少 invalid revision 与政策 HOLD | 两次 shadow 中 hard-predicate coverage=100%；漏检关键构造冲突=0；额外人工时间接近 0 |

## 8. 回滚与非影响边界

- 本审计没有可回滚的共享修改。
- 若用户不批准任何例外，四题保持原 HOLD；不会产生状态迁移。
- 若用户批准 Parquet 例外，主线必须创建新的、冻结的 exception assignment；旧证据目录只读，不能覆盖。
- 若未来澄清补丁的两次 shadow 显示预检成本过高或造成误阻塞，只撤销新字段的 mandatory 属性；不删除 shadow 证据，不改变历史候选结论，不放松任何科学门。
- 任何正式规则写入仍只能由主线在安全 assignment 边界执行。

## 9. 交接

- 当前角色状态：`IDLE_REUSABLE_AWAITING_MAINLINE_AND_USER_DECISION`
- 请求用户裁决：是否批准 Parquet 的一次 fidelity-only 例外；是否批准未来 revision-admissibility 两次 shadow。
- 主线在用户裁决前不得启动四题的实验、candidate run、Stage A/B、下载或状态迁移。

