# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260810-V8_8-NOT-CALIBRATED-RESOLUTION-R6`
- `trigger`: consolidated V8.8-R3 独立 AUDITOR 返回 `FAIL / NOT_CALIBRATED`；失败阈值为 sentinel minimum-set recall `0/2` 与 structural negatives `5/6`，其余 8 项阈值以及 hash、boundary、contamination、角色独立性均通过。
- `requested_by`: 主线冻结 assignment；本任务是第二个长期 `RULE-AUDIT-SENTRY` 槽位，未参与 V8.8-R3 PACKER、EXECUTOR 或 AUDITOR。
- `date`: 2026-08-10（Asia/Shanghai）
- `write_directory`: `D:\project\writing\reserch\stages\rule-audit\RULE-AUDIT-20260810-V8_8-NOT-CALIBRATED-RESOLUTION-R6\`
- `shared_files_modified: false`
- `final_lane_state`: `IDLE_REUSABLE_AWAITING_USER_DIALOGUE`

## Question and scope

- User/process question: 区分失败来自 proposed v8.8 规则、sealed method contract/output schema/指令、executor 偏差、auditor key/阈值公平性，还是历史集过拟合/holdout 不足；比较维持 v8.7、一次 bounded v8.8-R3R1、放弃并重做 v8.8。
- Rules inspected: `AGENTS.md`、`plan.md`、`registry.yaml`、`rules/ROLE_RULE_AUDIT.md`、当前 `rules/ROLE_MAINLINE.md`、`rules/ROLE_DISCOVERY.md`、`rules/ROLE_DISCOVERY_BACKTEST.md`，以及 rule-audit 报告/提案模板。
- Frozen instruction lineage inspected: R1/R2 报告、提案与 handoff；R3 用户批准指令与 handoff；R5 用户排序指令与 handoff。
- Frozen packet inspected: V8.8-R3 PACKER/EXECUTOR/AUDITOR 的合同、case descriptors、输入/输出、auditor key、acceptance protocol、provenance、reports、handoffs 与三份 manifest。相关 source bytes 的路径、大小、SHA、角色和 cutoff 由 sealed manifest/case descriptors 全量核对；对 C01/C02/C04 的决定性 source/action 内容另作针对性复核。
- Academic method: 使用 `academic-research-suite` reviewer/calibration 路由，以方法审查、反方审查与综合裁决的只读边界执行；没有调用外部检索或跨模型服务。
- Out of scope: 不 repack、replay、shadow；不运行 R5-P1/P2；不执行 Discovery/Stage0/A/B、实验、下载、自动化或 production cutover；不修改共享控制文件、候选目录或旧 V8.8-R3 包。

## Frozen evidence and integrity

| Artifact | Frozen SHA-256 | Read-only verification |
|---|---|---|
| PACKER `HASH_MANIFEST.sha256` | `69357EE2B5F29FAE3CA590382EA36E87647DDAA031CFF6063AF1F6FF6AF59BBD` | 85/85 entries match |
| EXECUTOR `HASH_MANIFEST.sha256` | `070DEE14AE8D8B6EA713407CEA8AFF67B06E0A95354EBF6BB0267D8018B84194` | 3/3 entries match |
| AUDITOR `HASH_MANIFEST.sha256` | `4A84BE3E16AC4A73098CBC1CC513AA75B4F16B61608E95371BDF0CEA74A7E3D3` | 3/3 entries match |
| R1 report / proposal | `C4184683...BFD57` / `01779E73...AAC1` | matches frozen method contract |
| R2 report / proposal | `F578966D...3FCF` / `6EF8795A...EB5` | matches frozen method contract |
| R3 user directive | `69E8EF14...D7B` | matches frozen method contract |

PACKER 74 个 executor-readable files、55 个 source artifacts 与 37,726,016 bytes 的声明一致。没有发现 key 泄漏、外部材料、越界写入、candidate execution、Stage 运行或 shadow wave。manifest 使用的两种常见 sha256 文本格式均可机械解析，内容哈希全部匹配；本审计不推翻既有 hash/boundary PASS。

`registry.yaml` 在本审计读取期间被主线单写更新；初次完整读取的 SHA-256 为 `BBB210660CBEAC05F2FC4F5AA770B7289E0D7B05C24380F3E23EFF7EAB2F5FE4`，交付准备阶段观察到后续主线版本。该并发更新没有改变 R6 的只读边界：`v8_8_repack_or_revision_authorized=false`、`r5_p1_p2_execution_authorized=false`、`production_patch_authorized=false`。本报告的科学归因只依赖上述冻结 packet manifests，而不依赖并发 registry 新增内容。

## Current authoritative behavior

1. 生产权威仍为 v8.7 加已生效的非行为性澄清；V8.8-R3 是未校准 shadow 方法，不能用于生产裁决。
2. R3 用户批准只授权了原 consolidated V8.8-R3 sealed backtest；独立 FAIL 后没有自动 repack/revision 权限。
3. R5-P1/P2 在 V8.8 `NOT_CALIBRATED` 解决前保持 `NOT_STARTED`；P0 已完成，不应再次请求相同 generic approval。
4. 当前 `ROLE_DISCOVERY` 已清楚区分：
   - `STRUCTURAL_DROP` 需要直接碰撞、对象/保证不合法、current union 吸收或其他结构性事实；
   - `NOT_ADMITTED_UNFROZEN` 表示问题可能有价值，但完整动作、来源最小集或有限 closure 尚未冻结；
   - action-space overlap 不是算法吸收；吸收需要同信息、同合同并按 full-cost 重放核心方法/性质。
5. `ROLE_DISCOVERY_BACKTEST` 要求独立、串行、盲化的 PACKER → EXECUTOR → AUDITOR；回测失败不能写成候选证据或生产语义。

## Evidence of the mismatch

| Observation | Source/artifact | Classification |
|---|---|---|
| 10 个冻结阈值中 8 个通过：broad leakage 0/2、positive deep review 5/6、positive proposal/unfrozen 5/6、resource causality 4/4、proposal certificate 7/7、model/native 7/7、terminal revival 0、hard-gate bypass 0。 | `auditor/AUDIT_RESULTS.yaml` | 核心方法没有整体崩溃；失败局限于校准/表达边界。 |
| C01 的 `evidence_used` 为 S01/S02/S03，minimum set 也完整；collision text 只语义处置 S02 的 forest/depth repair，没有处置 S03 Zuckerli。 | `executor/EXECUTOR_RESULTS.yaml` C01 | 不是 source recall 失败，而是 per-source mechanism disposition 不完整。 |
| C02 的 `evidence_used` 为 S01–S04，minimum set 也完整；collision text 只显式处置 S03 global builder，未逐项语义处置 S04 generic b-matching 与 S01/S02 native local actions。 | 同文件 C02 | 同上；executor 输出粒度不足。 |
| hidden acceptance rule 要求“所有 source IDs 显式使用 + named decisive subtractor”，但 executor-visible `required_case_output` 没有 `mechanism_or_action_summary`、`collision_effect` 或“必须逐 subtractor 命名”的字段。 | `sealed_method_contract.yaml` vs `auditor_key/acceptance_protocol.yaml` | 合同/schema 与 hidden key 不对齐；key 对词面名称的要求超出了 visible schema。 |
| acceptance protocol 用 `proposed_v8_8.proposed_brief` 判断 negative packaging，但 sealed output schema 没有该字段，executor 实际输出 `proposal_grade`。 | 同上 | 明确 schema bug；auditor 做了人工解释，但合同不是自洽的。 |
| executor 字段 `hard_gate_violations` 用来列“该案例未通过的 admission gates”；auditor 的 `hard_gate_violation` 阈值却表示“方法是否绕过 hard gates”。 | contract / executor / acceptance protocol | 同名概念承载相反主体，存在误评分风险。 |
| C04 输出 `STRUCTURAL_DROP`，理由是当前 action 已表示、候选只是 lifecycle composition；但没有给出合同要求的 same-information、same-contract、full-cost replay，也承认 `A_c/P/W_m/F_n` 未冻结。 | `EXECUTOR_RESULTS.yaml` C04 | executor 过度推断吸收；按 visible v8.8 语义应为 `NOT_ADMITTED_UNFROZEN`。 |
| C04 key 期望 `NOT_ADMITTED_UNFROZEN` 与 cache-residency/retention boundary 未冻结；这个方向与 case descriptor、R2 证据一致，但 stratum 总名仍叫 `STRUCTURAL_NEGATIVE`。 | `case_key.yaml` C04 | 期望裁决基本公平；stratum 命名把“不得包装”与“已有结构性反证”混为一谈。 |
| C01/C02 正是 R2 的已知 sentinels，C04 也是 R2 固定的 underdefined case；18 题全是 R1/R2/R3 已知历史集，没有未参与规则形成的新 blind holdout。 | PACKER report / case key | 当前结果只能诊断开发集表现，不能证明修补后的泛化校准。 |

## Failure-source attribution

| Hypothesis | Finding | Weight |
|---|---|---|
| (a) Proposed v8.8 rule | 科学方向正确并被 8 个阈值支持；但 sealed 版本只枚举 dispositions，没有把现行规则中的证明责任写成 ordered decision table。 | 次要贡献；不支持放弃核心方法。 |
| (b) Sealed method contract/output schema/instruction | 缺 per-source mechanism disposition；缺 canonical `proposed_brief`；`hard_gate_violations` 语义冲突；缺 structural proof 与 unfrozen 的机器可判定分界。 | **主要根因**。 |
| (c) Executor deviation | C01/C02 没有逐决定性 mechanism 处置；C04 在缺 replay 证据时把未冻结 action 提升为 structural absorption。 | **实质次要根因**；不是资源/污染事件。 |
| (d) Auditor key/threshold unfairness | auditor 正确执行了冻结 key；但 sentinel 的 exact named-subtractor 要求未在 visible schema 中声明，属于 key-contract 不公平。C04 的期望方向不算过严。 | **实质共同根因**，集中在 sentinel 评分。 |
| (e) Historical-set overfit / holdout insufficiency | 没有新 blind holdout；对 C01/C02/C04 做定向修词就能“通过”开发集，却不能证明方法泛化。 | **校准证据缺口**；不是本次三项输出错误的直接原因，但阻止直接 patch。 |

结论不是“auditor 错了”或“executor 单独错了”。最准确的失败核是：**visible contract 没有提供 hidden key 要求的表达面，executor 又在一个 underdefined case 上越过了本应保守的证明责任；已知历史开发集无法安全验证任何定向修补。**

## Risk analysis

- False-negative risk: 若保留当前 C04 风格，未冻结但尚无结构性反证的机会会被误写成吸收/STOP，风险中高。
- False-positive/weak-paper risk: 若为追求 sentinel recall 只要求提及更多论文而不要求 collision effect，会制造形式合规但没有真正减法的 briefs，风险中。
- Scientific-integrity risk: 当前生产未切换，风险受控；若把开发集修词 PASS 当作校准，则风险高。
- Resource/time risk: full redesign 成本高且缺乏必要性；一次新 holdout 的 bounded R3R1 成本可控。
- State-migration risk: 推荐方案不迁移任何候选/状态；风险低。
- Terminal-revival risk: 必须保持 0；已知 C01/C02/C06–C08 只能作为诊断证据，不能重开。
- Evaluator-overfit risk: 当前高；必须让已知 18 题退出 R3R1 计分集。

## Option comparison

| Option | Safety | Information value | Cost | Audit judgment |
|---|---|---|---|---|
| Maintain v8.7 | 最高；无需新授权 | 不解决已确认的 schema/precision 缺口 | 最低 | 在用户裁决前的 mandatory default；可长期选择。 |
| One bounded V8.8-R3R1 | 保持全部 hard gates；用新 holdout 防止定向过拟合 | 能区分“合同修复后可泛化”与“方法本身不稳” | 中等、严格封顶 | **推荐**。 |
| Abandon/rebuild V8.8 now | 安全但丢失 8/10 已通过的有效结构 | 目前证据不足以证明必须重做 | 最高 | 暂不推荐；R3R1 再失败时成为默认。 |

## Recommendation

- Decision: `USER_POLICY_DECISION_REQUIRED`
- Recommended user choice: 授权且仅授权一次 `V8.8-R3R1` bounded calibration revision；在此之前维持 v8.7。
- Minimum effective change: 不改 v8.8 科学 hard gates，不重写 C01/C02/C04 答案；只修 sealed contract/schema/key 对齐和 disposition 证明责任，并以全新 blind holdout 计分。
- Why a smaller operational fix is insufficient: 让 executor 在旧结果里补写 `Zuckerli`、`b-matching` 或把 C04 标签改成 `NOT_ADMITTED_UNFROZEN` 会直接硬编码开发集答案，不能形成校准证据。
- Why full rebuild is unnecessary now: broad leakage、positive retention、resource causality、certificate、model/native、terminal 与 hard-gate 指标全部通过；没有证据表明核心 R1/R2 语义应被丢弃。
- Non-relaxable gates preserved: Q2、Q1 priority、same-object、latest collision、fair current strong baseline、natural object/evidence、full-cost、reproducibility、claim ceiling、STOP non-revival、resource-failure no-inference、用户 StageB/formal-project 门全部不变。

## Validation and rollback

- Historical cases/backtest required: 是，但旧 C01–C18 只作 design evidence，不进入 R3R1 计分，也不 replay。
- New blind holdout: 10 个从未进入 R1/R2/R3/R5 规则形成或 V8.8-R3 packet 的新 target families；精确 strata、阈值和成本见 `RULE_CHANGE_PROPOSAL.md`。
- Independence: 复用既有长期 PACKER、EXECUTOR、AUDITOR lanes，严格串行；key 在 executor manifest 冻结前不释放；R6 lane 不兼任任何角色。
- One-failure stop: 一个已 dispatchable 的 R3R1 若任一 primary threshold FAIL、`CONTAMINATION_UNKNOWN`、schema/key 不可评分或边界失败，立即结束当前 v8.8 lineage；禁止自动 R3R2。若 PACKER 在 sealed packet 形成前仅因网络/权限/transport 失败，则按 `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE` 精确阻塞，可在同一 attempt 内解阻，不能换弱来源凑数。生产继续 v8.7，后续 full redesign/new method version 只能由用户另批。
- PASS handling: R3R1 PASS 也不自动生产 cutover；主线必须提交 exact shared-file diff、回归证据、rollback point，并取得用户另一次明确批准。
- Rollback: R3R1 是独立新目录；回滚只需不采纳其 proposed semantics，不改变任何候选或现有生产文件。

## Mainline handoff

- User approval already present: 原 R3 backtest approval 已消费；`V8.8-R3R1` approval **不存在**。
- Files proposed for immediate change: 无共享文件。
- Proposed R3R1-only artifacts after user approval: 新 sealed method contract、output schema、auditor acceptance protocol、new blind case pack 与三个独立 role outputs；不得覆盖 V8.8-R3。
- Registry migrations proposed: 无 candidate/state migration；若用户批准，主线只登记一次新的 method-backtest assignment 与 approval ID。
- Existing active/blocked/hold/terminal topics affected: 无。
- R5 effect: P1/P2 继续 `NOT_STARTED`；只有 R3R1 独立 PASS 并被主线验收后，才能按既有 R5 条件授权解释继续 replay/shadow，production patch 仍需另批。
- Shared files modified: `false`
