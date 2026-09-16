# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-V8_8-NOT-CALIBRATED-RESOLUTION-R6`
- `proposal_id`: `V8_8-R3R1-CONTRACT-SCHEMA-BLIND-HOLDOUT-RESOLUTION`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: `true`
- `backtest_required`: `true`
- `production_patch_authorized`: `false`
- `r3r1_execution_authorized`: `false`

## Problem statement

V8.8-R3 不是全面失败：10 个冻结阈值中 8 个通过，完整性、污染与独立性也通过。两个 failed threshold 暴露的是一个窄但决定性的校准缺口：

1. sentinel cases 已读并登记完整 minimum-set source IDs，但输出 schema 没有逐 source 记录 mechanism/action 与 collision effect 的位置；hidden key 却要求 exact named decisive subtractor；
2. underdefined C04 缺 candidate action/property/witness/falsifier，executor 却在没有 same-information/same-contract/full-cost replay 的情况下写成 `STRUCTURAL_DROP`；
3. acceptance protocol 引用 schema 不存在的 `proposed_brief`，并把“候选未过的 gate”与“方法绕过 hard gate”都称作 violation；
4. C01/C02/C04 都是规则形成时已知的开发案例，直接修这三题不能证明泛化。

因此最小安全解决不是 production patch，也不是在原包上补答案，而是一次全新目录、全新 blind holdout 的 bounded R3R1。

## Current rule and why it is insufficient for one more calibration

- File/heading: V8.8-R3 `packer/sealed_method_contract.yaml` — `proposed_v8_8_behavior` 与 `required_case_output`。
- Current behavior: scientific semantics 正确，但 dispositions 只有枚举，没有 ordered proof table；minimum set 只有 source-ID lists；没有 per-source semantic disposition；没有 canonical proposed-package boolean。
- File/heading: V8.8-R3 `packer/auditor_key/acceptance_protocol.yaml` — `classification_rules`。
- Current behavior: sentinel scoring 需要 named decisive subtractor，negative scoring 读取不存在的 `proposed_brief`；这些要求没有完全映射到 executor-visible schema。
- File/heading: V8.8-R3 `packer/auditor_key/case_key.yaml` — case strata。
- Current behavior: `STRUCTURAL_NEGATIVE` 同时包含 true structural absorption 和应为 `NOT_ADMITTED_UNFROZEN` 的 underdefined nonpackage cases，术语容易诱导过强结构结论。

## Exact minimal R3R1 delta

这些 delta 只进入新 R3R1 sealed validation contract；在 R3R1 PASS 和用户另批 production patch 前，不修改任何权威 rule/template。

### 1. Canonical output fields

每个 proposed-method case 必须输出：

```yaml
disposition: STRUCTURAL_DROP | NOT_ADMITTED_UNFROZEN | RESOURCE_BLOCKED | DEEP_DIVE_REQUIRED | EXCLUDED
proposed_brief: true | false
candidate_grade_deep_review: true | false
proposal_grade: true | false
disposition_basis: DIRECT_ABSORPTION | SAME_OBJECT_FAILURE | CHANGED_GUARANTEE | STRUCTURALLY_UNCLOSABLE | UNFROZEN_ACTION | RESOURCE_ONLY | COMPLETE_RESIDUAL | SCOPE_EXCLUSION
minimum_set_assessment:
  nearest_same_object:
    source_ids: []
    mechanism_or_action_summary: string
    collision_effect: DIRECT_ABSORB_BROAD_CLAIM | DIRECT_SUBTRACT | STRONG_BASELINE_ONLY | NO_RELEVANT_ACTION_FOUND | RESOURCE_UNKNOWN
    evidence_pointer: string
  first_party_family: {source_ids: [], mechanism_or_action_summary: string, collision_effect: enum, evidence_pointer: string}
  generic_kernel: {source_ids: [], mechanism_or_action_summary: string, collision_effect: enum, evidence_pointer: string}
  strongest_deployed_union: {source_ids: [], mechanism_or_action_summary: string, collision_effect: enum, evidence_pointer: string}
structural_proof:
  type: SAME_INFORMATION_SAME_CONTRACT_FULL_COST_REPLAY | SAME_OBJECT_FAILURE | CHANGED_GUARANTEE | STRUCTURALLY_UNCLOSABLE | NONE
  evidence: string_or_null
failed_candidate_gates: []
method_hard_gate_bypasses: []
```

- `evidence_used` 可保留，但不能替代逐 minimum-set mechanism disposition。
- 删除歧义字段 `hard_gate_violations`；候选自身不足写入 `failed_candidate_gates`，方法违规只写入 `method_hard_gate_bypasses`。
- acceptance protocol 与 executor schema 只能引用同一 canonical `proposed_brief`，不得隐式把 `proposal_grade` 当作同义字段。

### 2. Ordered disposition decision table

按以下顺序判定，禁止逆序补理由：

1. exact object/function/guarantee 改变，或 finite closure 必然降保证/换对象 → `STRUCTURAL_DROP`；
2. 有 source-grounded 的 same-information、same-contract、full-cost replay，直接吸收所声称 residual → `STRUCTURAL_DROP`；
3. 没有上述 structural proof，但 `A_c/P/W_m/F_n` 等 action certificate 尚未冻结 → `NOT_ADMITTED_UNFROZEN`；
4. source/data/tool resource 阻止冻结且没有 claim-bearing observation → `RESOURCE_BLOCKED`；
5. residual 与 finite falsifier 完整、仍需候选级碰撞/证书攻击 → `DEEP_DIVE_REQUIRED`；
6. assignment scope/exclusion 命中 → `EXCLUDED`。

“现有系统已经包含若干动作”“候选像 wrapper/composition”“没有 distinct decision rule”本身只证明 action 未冻结；除非同时提供第 2 项 replay 证据，否则不得升级为 structural absorption。

### 3. Key/schema fairness rule

- hidden key 可存储 gold mechanism/action invariants，但不能要求 executor 复述未在 visible schema 中要求的 exact token。
- sentinel recall 使用 semantic equivalence：每个 required minimum-set source/category 都必须有非空 mechanism/action summary 与 collision effect，并语义覆盖 gold decisive subtractor 对 broad/residual claim 的影响；纯 `source_id` 或 `evidence_used` 不计 recall。
- exact 字符串不匹配不能单独 FAIL；若描述无法唯一映射到 gold mechanism，则 FAIL semantic recall。
- PACKER 在 dispatch 前生成不含答案的 `scoreability_schema.yaml`，证明每个 hidden acceptance predicate 都能映射到一个 executor-visible field。任何 predicate 无映射 → `FAILED_NOT_DISPATCHABLE`，不得让 AUDITOR 事后猜测。

### 4. Negative-control strata rename

将总 stratum `STRUCTURAL_NEGATIVE` 改为 `NONPACKAGE_NEGATIVE_CONTROL`，再分：

- `UNDERDEFINED_NONSTRUCTURAL`：期望 `NOT_ADMITTED_UNFROZEN`；
- `TRUE_STRUCTURAL`：期望 `STRUCTURAL_DROP` 且必须有 structural proof。

这只改回测术语与评分清晰度，不新增生产候选状态。

### 5. What must not change

- 不修改 v8.8 的 Q2、same-object、current collision、fair strong baseline、natural evidence、full-cost、reproducibility、claim ceiling、STOP non-revival、resource-failure 与用户审批语义。
- 不降低原冻结 threshold；不把“多提及 source”当作 proposal；不要求实现/native output/positive result进入 Discovery/Stage0 admission。
- 禁止在合同、case descriptors 或 prompts 中出现 C01/C02/C04 的 target、专名答案或同义答案模板。

## New blind holdout requirement

旧 C01–C18 只保留为不可修改的 diagnosis/development evidence，不进入 R3R1 executor input、计分或 PASS 分母。

R3R1 PACKER 必须冻结 **10 个新 target families**，全部满足：未进入 R1/R2/R3/R5 的规则形成案例；未进入 V8.8-R3；不是 C01/C02/C04 的改名或同一 exact object；cutoff 早于 outcome；每题 3–4 个 complete primary artifacts；executor 只见 opaque IDs。

| Blind stratum | Count | Required threshold |
|---|---:|---|
| unseen current-collision sentinel | 2 | semantic minimum-set recall 2/2；broad leakage 0/2 |
| underdefined nonstructural transition/action | 2 | `NOT_ADMITTED_UNFROZEN` 2/2；invented structural proof 0 |
| true structural absorption/object/guarantee control | 2 | not packaged 2/2；correct structural proof 2/2 |
| historical positive Stage0 shape | 2 | candidate-grade deep review 2/2；至少 1/2 proposal-grade 或明确单一 bounded nonstructural gap |
| resource/unimplemented control | 2 | runtime/resource event 单独导致 structural disposition 0/2 |

全体共同阈值：

- every proposed brief has full O/I/A_b/A_c/P/W_m/C/F_n certificate: 100%；
- every proposed/deep case preserves model/native boundary: 100%；
- terminal revival: 0；
- method hard-gate bypass: 0；
- contamination/boundary/hash: PASS；
- scoreability schema: PASS before executor dispatch。

10 题全部计分；不得在 executor 运行后替换、删除、降权或重分 strata。若在完成获批的 bounded selection 后仍找不到满足来源/cutoff/独立性的 10 题，应 `FAILED_NOT_DISPATCHABLE`，不得复用旧三题填数。若只是网络/权限/transport 导致完整 primary bytes 暂不可得，则提交精确 resource blocker，保持同一 selection/attempt，不能以 stub、snippet 或较弱 source 替代。

## Independence and long-lived lane reuse

1. MAINLINE 创建一个新的、不可覆盖的 `V8.8-R3R1` method-backtest directory，冻结 approval ID、contract SHA、case manifest SHA 与唯一写目录。
2. 反归档/复用既有长期 `DISCOVERY-BACKTEST-PACKER-LANE`；PACKER 只打包，不运行方法或评分。
3. 主线机械验收 PACKER 后，复用既有长期 `EXECUTOR-LANE`；EXECUTOR 不得读 key、R6 报告或旧 C01–C18 outputs，不得外搜。
4. executor manifest 冻结并由主线验收后，才向既有长期 `AUDITOR-LANE` 释放 key；AUDITOR 不改 PACKER/EXECUTOR 输出。
5. 三角色严格串行、不得由同一 task/conversation 兼任；不得创建 per-backtest one-off task。R6 审计 lane 不参与三角色。
6. 每个 lane 完成交付并验收后回到 `IDLE_REUSABLE`；没有后续授权则冷归档，不改变 assignment/evidence。

## One-failure stop rule

R3R1 是当前 v8.8 lineage 的唯一一次 bounded calibration revision。

- 对已经 `SEALED_DISPATCHABLE` 的 packet，任一 primary threshold FAIL、`CONTAMINATION_UNKNOWN`、scoreability mismatch、hash/boundary failure，整体均为 `FAIL / NOT_CALIBRATED`。完成 bounded selection 后仍没有 10 个合格独立 cases 的 `FAILED_NOT_DISPATCHABLE` 也结束本次方法 revision。
- 纯网络、权限、许可或 transport acquisition 失败发生在 sealed packet 与 claim-bearing method replay 前时，只形成 `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE` blocker；用户解阻后恢复同一 R3R1 attempt，不消耗另一次方法 revision，也不得更换为弱来源。
- 失败后禁止自动 R3R2、repack、replay、shadow 或 production patch；v8.7 继续权威，当前 v8.8 lineage 记为 abandoned-for-production。
- 只有用户在阅读 R3R1 新失败核后，才可另行批准一个 **新 method version 的 full redesign**；不得把它叫作 R3R2 继续消耗例外。
- R3R1 PASS 也不自动切生产；必须返回 exact shared-file patch 与 regression evidence 给用户另批。

## Cost ceiling

- Cases: exactly 10.
- Source artifacts: 30–34 complete primary artifacts；不接受 snippets/error pages/stubs。
- Network acquisition if separately approved with R3R1: public-source bytes最多 50 MiB；workspace temporary+sealed storage最多 100 MiB；禁止系统安装、全局环境修改、大型模型/数据集或候选 corpus 下载。
- Compute: 3 个串行长期 lane assignments；executor 固定 20 case-runs（control + proposed），不运行 candidate/native experiment。
- Mainline service: PACKER、EXECUTOR、AUDITOR 三次机械验收，各在下一控制周期完成。
- User attention: 当前只需一次是否批准 R3R1 的政策决定；PASS 后 production patch 另需一次逐包决定。每次建议预留约 10–20 分钟审阅，不承诺固定 wall-clock 完成时间。

任何超过上述 case/source/storage/compute ceiling 的需求都必须停止并向用户提出新的精确授权，不得自行扩容。

## Safety invariants

- Q2 minimum preserved: yes.
- Q1 priority preserved: yes.
- Same-object preserved: yes.
- Latest collision preserved: strengthened by per-source semantic disposition.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes.
- Full-cost preserved: yes.
- Reproducibility preserved: strengthened by scoreability schema and frozen holdout.
- Claim ceiling preserved: yes.
- STOP non-revival preserved: yes.
- User StageB/formal-project approval preserved: yes.

## State and compatibility

- Existing states affected: none.
- Existing assignments affected: none; V8.8-R3 remains immutable FAIL evidence.
- Template compatibility: no production template changes in R3R1 authorization.
- One-time migration required: none.
- R5: P1/P2 remain not started until an independently accepted R3R1 PASS resolves V8.8 calibration; R5 production cutover remains separately gated.
- Rollback path: do not adopt R3R1 semantics; no candidate/state rollback is needed.

## Decision request

请用户在以下三项中选择：

1. **推荐：批准一次 bounded `V8.8-R3R1`**，范围严格等于本文 contract/schema delta、新 10-case blind holdout、长期 lane 串行复用和成本 ceiling；建议 approval ID 为 `V8_8-R3R1-BOUNDED-CALIBRATION-20260810`。
2. 维持 v8.7 并停止当前 v8.8 lineage，不再投入回测成本。
3. 放弃当前 v8.8 并另起 full redesign；当前证据不推荐立即选择。

在用户明确批准第 1 项前，主线不得创建 R3R1 assignment、获取新 source、repack/replay、启动 R5-P1/P2、修改生产规则或运行 shadow。审计 lane 仍无共享写权。
