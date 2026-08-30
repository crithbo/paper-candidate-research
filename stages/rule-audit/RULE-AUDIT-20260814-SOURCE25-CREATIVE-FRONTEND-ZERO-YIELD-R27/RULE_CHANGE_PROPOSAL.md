# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE25-CREATIVE-FRONTEND-ZERO-YIELD-R27`
- `proposal_id`: `SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1`
- `decision_label`: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_PILOT_ONLY`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`
- `prospective_one_cycle_validation_required`: `true`
- `shared_files_modified`: `false`

## Problem statement

Source25 证明创意发散层能够生成多样 seed，也证明 direct-current-union 控制仍有效，但没有证明 end-to-end 发现召回。六路报告 `66 seed → 24 locator → 1 raw → 1 C0 → 0 D1/deep/brief`。S2 的 4 个 locator 没有精确身份、Question Card、碰撞表或网络核验，只能视为自报事件；其他 lane 中，多项卡片因公开源码、官方规则/结果 export、schema、current action union 或小 carrier 未闭合而停止，但并未耗尽 Source25 已允许的公开资料路线。

盲回测 3/3 的正例材料已包含 exact object、强 comparator、full-cost 和 finite witness；它校准的是“从富集材料恢复问题形状”，没有校准“从前瞻 seed 找齐材料”。因此不能通过放松 Question Card 解决，也不能把零 brief 全部解释为科学克制。

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md` / “第三层：Research Question Card 决定能否进入 raw”
- Current behavior: 必填字段同时明确后才计 fresh raw；字段未知保持 locator-only。
- File/heading: `rules/ROLE_DISCOVERY.md` / “资源失败不得伪装为学术淘汰”
- Current behavior: assignment 引用公开资料授权时，可在冻结预算内获取公开一手源码、论文、数据、trace 与规范，必须记录来源、版本、许可、响应字节和哈希。
- Why insufficient operationally: 规则没有在本次 assignment 中强制指定“哪些可公开闭合的未知字段必须先使用 retrieval ticket”，使得只看 landing page 或一次页面失败后即可结束；同时没有交付级机制阻止 S2 以泛化类别充当 locator。

## Proposed minimum delta

不修改共享文件。本轮只让主线在 Source26 的新 control/assignment 中冻结以下单一策略。

| File | Heading/field | Current Source25 semantics | Proposed Source26 semantics |
|---|---|---|---|
| `Source26/control/CONTROL.yaml` | profile | creative seed + Question Card | `DIVERGENCE_SEED_POOL_V1R1__SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1` |
| 同上 | capacity | seeds 12/lane, locators up to 8/lane, raw 4/lane, C0 2/lane, lane deep ceilings | seeds/raw/C0/deep ceilings不变；Source26 evidence-closure locators最多4/lane、无最低数、无 backfill |
| 同上 | source roles | 未强制三种决定性来源都实际触达 | 每 locator 预承诺 `ANCHOR / CURRENT_UNION / CONTRARY`；不存在可查官方路线时不进入 retrieval |
| 同上 | retrieval trigger | 可在浅页面查阅后直接 locator-only | target-specific consequence 与 planned official route 均存在时必须执行 bounded retrieval；direct structural risk 可先行终止 |
| 同上 | retrieval cap | 64 MiB response、128 MiB storage/lane | 总 cap 不变；每 locator 最多2条预登记路线，每条成功响应最多8 MiB，每 locator 持久化最多16 MiB |
| 同上 | telemetry | 实际未统一记 exact bytes/hash | 每次记录 URL/选择规则、version/date、license/provenance、source role、response bytes、SHA-256、result |
| 六份 lane assignment | source mix | 宽 archetype，部分仍是类别词 | 使用报告给出的六路 exact-source 路由；S2 禁止泛化硬件类别作为 locator，S3 禁止全量巨型载体为唯一路线，S4 优先 versioned export/schema |
| 六份 lane handoff | funnel | locator 自报数可与 exact locator 混合 | 同时报 `reported_locator_events`、`auditable_exact_locators`、`retrieval_triggered`、`source_role_closed` 及 canonical funnel |

## Exact Source26 directive

```yaml
profile_id: SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1
scope: ONE_SIX_LANE_ASSIGNMENT_ONLY
canonical_method: V8_7_POTENTIAL_READINESS_SEPARATED
discovery_claim_pack_mode: OFF
v9_output_allowed: false
network_security_topics_allowed: false

capacity:
  seed_ceiling_per_lane: 12
  evidence_closure_locator_ceiling_per_lane: 4
  fresh_raw_ceiling_per_lane: 4
  C0_ceiling_per_lane: 2
  deep_by_lane: {S1: 2, S2: 2, S3: 2, S4: 3, S5: 1, S6: 2}
  proposal_quota: none
  outcome_aware_backfill: false

precommit_before_lookup:
  required: [locator_exact_object_hypothesis, target_specific_counterfactual,
             planned_anchor_route, planned_current_union_route,
             planned_contrary_route, primary_and_fallback_order]
  exclude: [GENERIC_SHELL, ACTIVE_OR_STOP_EXACT_IDENTITY,
            CHANGED_OBJECT_OR_GUARANTEE, KNOWN_DIRECT_ABSORPTION]

retrieval:
  authority: USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814
  attempts_per_locator_max: 2
  successful_response_bytes_per_attempt_max: 8388608
  persisted_bytes_per_locator_max: 16777216
  successful_response_bytes_per_lane_max: 67108864
  storage_bytes_per_lane_max: 134217728
  full_dataset_download_required: false
  prefer: [official_source_file, official_rules_or_schema, official_result_export,
           official_API_metadata, deterministic_small_slice, primary_paper]
  log_required: [url_or_deterministic_rule, source_role, version_or_date,
                 license_or_provenance, response_bytes, sha256, disposition]
  contrary_not_found_semantics: NOT_FOUND_WITHIN_SEARCH__NOT_GLOBAL_ABSENCE

disposition:
  direct_absorption_or_same_object_failure: STRUCTURAL_DROP
  complete_card_without_main_result: FRESH_RAW_OPPORTUNITY
  two_routes_failed_or_over_cap: LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED
  missing_implementation_or_result_alone: NOT_A_SCIENTIFIC_DROP

completion:
  required_funnel: [seed, reported_locator_events, auditable_exact_locators,
                    retrieval_triggered, source_role_closed, raw, C0, D1, deep, brief]
  zero_brief_allowed: true
  no_replacement_after_precommit: true
```

该 directive 的 `evidence_closure_locator_ceiling_per_lane=4` 是最大工作量，不是录取配额；lane 可以选择 0–4 条。现有总 locator ceiling没有增加，raw/C0/deep 和科学门也没有增加或降低。

## Lane source routing

| Lane | Frozen Source26 route |
|---|---|
| S1 | 一个明确 compiler/runtime/ABI/ISA stack；spec + 当前 producer/runtime source + small legal witness |
| S2 | exact versioned GPU/NPU/PIM profiler/trace/benchmark + 当前 software/hardware action union + strongest competing mechanism；禁止抽象类别 locator |
| S3 | official API/manifest/small deterministic slice 的自然变化 carrier + stock reader/writer union；禁止成熟 cache/index/registry 普通构造器 |
| S4 | canonical benchmark rules + versioned result export/schema/archive + native ranking/validity comparator；只允许 suite-specific claim ceiling |
| S5 | target-specific partial primitive + stock checker/oracle + versioned carrier；generic solver/MLIR/layout 不进入 locator |
| S6 | 当前 backend/ISA source action catalogue + exact workload/program carrier + non-parameter algorithmic residual；现有 RVV VSETVLI exact identity不重开 |

## Safety invariants

- Q2 minimum preserved: `true`
- Q1 priority preserved: `true`
- Same-object preserved: `true`
- Latest collision preserved: `true`; current-source union retrieval被加强
- Fair current strong baseline preserved: `true`
- Natural/canonical input and evidence preserved: `true`; canonical benchmark仍禁止自然外推
- Full-cost preserved: `true`
- Reproducibility preserved: `true`; response bytes/hash/provenance成为必填遥测
- Claim ceiling preserved: `true`
- STOP non-revival preserved: `true`
- User StageB approval preserved: `true`
- No V9/network-security/experiment/Stage/build/install/automation: `true`

## State and compatibility migration

- Existing states affected: `NONE`
- Existing assignments affected: Source25 保持 immutable complete；不回写其 lane artifacts。
- Source25 locator-only reopening: 只有 Source26 control 在启动前已经冻结新的公开证据路线或确定性 evidence-increment 规则时才可重开；不得直接继承 seed 叙事为证据。
- Template compatibility: 使用现有 seed pool、Question Card、topic brief；无需修改模板。
- One-time migration required: `NO`
- Rollback path: Source26 完成后该 profile自动到期；若出现超预算、无 ledger、precommit 后替换或科学门漂移，下一轮恢复当前 v8.7 creative frontend，不迁移任何科学状态。

## Validation plan

- Historical/time-slice cases: 不重放现有 3/3；它们不覆盖前瞻 source qualification。
- Negative controls: Source26 中任何 current direct absorption 必须停止且不得用新措辞重包；任意 unavailable source 不得变成 absence/STOP。
- Expected behavior changes: `locator → source-role-closed` 的可识别率提高，S2 类泛化 locator 消失，可公开闭合的卡不再停在 landing page。
- Forbidden regressions: 为达到 raw/brief 数而换对象、弱化 current union、把有限计划写成已有结果、增加 locator、回填 backlog、超资源预算或复活 STOP。
- Acceptance threshold:
  - exact locator/card traceability `100%`；
  - retrieval-triggered ledger completeness `100%`；
  - funnel arithmetic `100%`；
  - scientific hard-gate violations `0`；
  - brief 数量不设最低阈值。

## Decision request

现有用户授权已经覆盖主线在下一安全 assignment 边界实施一次 `SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1`，无需再次请求同一 generic approval。主线只能创建 Source26 control 与六份 lane assignment，并按上面的预算、预承诺、无回填和遥测要求运行；不得借此修改共享规则、启用 V9、进入网络安全、运行实验或 Stage、增加 lane/容量，或改变任何既有候选状态。
