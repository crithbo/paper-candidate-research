# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE26-EVIDENCE-CLOSURE-ZERO-YIELD-R28`
- `proposal_id`: `SOURCE27_ORIGIN_GROUNDED_ORTHOGONAL_RESIDUAL_V1`
- `decision_label`: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_PILOT_ONLY`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false` for one assignment-local source scheduler; permanent canonical adoption is not proposed
- `shared_files_modified`: `false`

## Problem statement

Source26 在 Source25 的 creative frontend 上增加了 anchor/current-union/contrary 三联预承诺，但前瞻漏斗仍从 `66 seeds → 19 reported locator events → 15 auditable exact locators → 0 raw/brief` 归零。逐项核验表明：

- 6 项是有决定性来源支持的健康结构性 abstention；
- 9 项有 exact identity，但 action/estimand、carrier、current union 或 strongest contrary 尚未完成公开证据闭合；
- S2 的 4 项没有 exact identity、Question Card 或逐项 source record，属于执行/遥测不足，不是科学 negative；
- 15 个 exact locator 中 10 个仍是 compiler/tool/method constructor、5 个是 measurement/N3/benchmark，0 个闭合为 theory/formal 或 exact system-architecture；所有 15 项都位于成熟工具或 benchmark 表面；
- 三个来源角色经常由同一 repository/page family兼任。它们足以杀掉明显错误前提，却不足以证明 surviving locator 的 carrier、当前 action union 与 strongest contrary 已分别闭合。

因此下一步不应降低 Question Card，也不应继续增加 creative engine、lane、locator 或检索预算。最小有效改变是把“创意多样性”从引擎标签改为研究合同正交性，并在 locator 进入检索前绑定 exact source origin。

## Current rule

- File/heading: `AGENTS.md` / “Discovery 前端在证据门之前增加非证据性的创意发散层”
- Current behavior: 多种创意引擎生成、聚类 seed；只有 Question Card 全字段冻结后才计 raw；seed 多样性不替代科学门。
- File/heading: Source26 `control/CONTROL.yaml` / `precommit_before_lookup` 与 `retrieval`
- Current behavior: 每 lane 最多4个 locator，预承诺三种 source role，每 locator 两次小型路线，不补位。
- Why insufficient operationally: Source26 检查了 source-role 标签，但没有要求 selected locators 在 object/contribution/action/carrier/falsifier 上真正不同；也没有阻止 abstract domain bucket 或同一页面三角色闭合。结果是创意措辞多样、对象和 endpoint 分布仍高度集中。

## Proposed minimum delta

不修改共享规则。本轮只建议主线在下一安全 assignment 边界创建一次 Source27 control/六 lane assignment。

| Assignment field | Source26 | Source27 minimum delta |
|---|---|---|
| canonical method | v8.7 creative frontend + Question Card | 不变 |
| source origin | seed 可直接围绕熟悉工具面收敛 | 每 lane 最多2个 exact versioned `SOURCE_ORIGIN_CAPSULE`，每 capsule 最多6 seeds |
| diversity evidence | engine/perspective coverage | engine 仍记录；selected locators 还需在五个 research-contract 轴中至少两轴 pairwise 不同 |
| locator ceiling | 4/lane | 3/lane；无最低数、无补位 |
| surface repeat | exact STOP/ACTIVE 去重 | Source25/26 同 exact identity 或同 `tool surface + endpoint` 一轮 cooldown；只有预承诺 evidence delta 可再入 |
| source-role closure | role 可由同一页面兼任 | decisive exclusion 可单源早停；surviving locator 禁止 same-document 三角色闭合 |
| telemetry | 允许 runtime-unobserved 明示 | 保持诚实明示；surviving locator 至少持久化 content-addressable anchor/current-union artifact，否则分类为 source/telemetry-unclosed |
| scientific gates | unchanged | unchanged |

## Exact Source27 assignment-local directive

```yaml
profile_id: SOURCE27_ORIGIN_GROUNDED_ORTHOGONAL_RESIDUAL_V1
scope: ONE_SIX_LANE_ASSIGNMENT_ONLY
authority:
  continuous_discovery: USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814
  bounded_public_acquisition: USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814
canonical_method: V8_7_POTENTIAL_READINESS_SEPARATED
creative_method: DIVERGENCE_SEED_POOL_V1R1__EVIDENCE_GATED_QUESTION_CARD_V7R2
discovery_claim_pack_mode: OFF
v9_output_allowed: false
network_security_topics_allowed: false

capacity:
  source_origin_capsules_per_lane_max: 2
  offline_seeds_per_lane_max: 12
  offline_seeds_per_origin_capsule_max: 6
  exact_locators_per_lane_max: 3
  fresh_raw_per_lane_max: 3
  C0_per_lane_max: 2
  deep_by_lane: {S1: 2, S2: 2, S3: 2, S4: 3, S5: 1, S6: 2}
  proposal_quota: none
  outcome_aware_backfill: false
  no_replacement_after_precommit: true

source_origin_capsule:
  frozen_before_lane_dispatch:
    - exact_public_artifact_or_deterministic_locator
    - version_date_or_commit_selection_rule
    - provenance_and_license_class
    - object_class
    - allowed_carrier_class
    - why_not_same_source25_source26_surface_without_evidence_delta
  must_not_contain:
    - novelty_conclusion
    - desired_outcome
    - fabricated_absence
    - answer_aware_ranking
  capsule_is_evidence_of_candidate_quality: false

seed_and_convergence:
  seed_before_candidate_directed_lookup: true
  engine_coverage_required: true
  engine_name_counts_as_contract_diversity: false
  selected_locator_required_fields:
    - exact_object
    - contribution_type
    - claim_endpoint
    - atomic_action_or_estimand
    - native_or_canonical_carrier
    - cheapest_falsifier
    - source_origin_capsule_id
  pairwise_selected_locator_orthogonality:
    axes: [exact_object, contribution_type, atomic_action_or_estimand, carrier, falsifier]
    minimum_different_axes: 2
  abstract_domain_bucket_as_locator_allowed: false
  one_cycle_cooldown:
    scope: SOURCE25_SOURCE26_EXACT_IDENTITY_OR_SAME_TOOL_SURFACE_PLUS_ENDPOINT
    override_only_if: PRECOMMITTED_CONTENT_ADDRESSABLE_EVIDENCE_DELTA
    scientific_stop_or_permanent_exclusion: false

source_role_closure:
  roles: [ANCHOR, CURRENT_UNION, CONTRARY]
  decisive_structural_exclusion:
    one_decision_bearing_source_may_terminate: true
    formal_three_role_completion_required_after_termination: false
  surviving_locator:
    same_document_fills_all_three_roles: false
    minimum_content_addressable_artifacts:
      - carrier_or_anchor
      - current_source_or_action_union
    contrary_requirement: PRIMARY_SAME_OBJECT_ROUTE_OR_BOUNDED_NOT_FOUND_WITHIN_SEARCH_RECORD
  not_found_semantics: NOT_FOUND_WITHIN_SEARCH__NOT_GLOBAL_ABSENCE

retrieval:
  attempts_per_locator_max: 2
  successful_response_bytes_per_attempt_max: 8388608
  persisted_bytes_per_locator_max: 16777216
  successful_response_bytes_per_lane_max: 67108864
  storage_bytes_per_lane_max: 134217728
  full_dataset_download_required: false
  required_ledger_fields:
    - url_or_deterministic_rule
    - source_role
    - version_or_date
    - license_or_provenance
    - response_bytes_or_runtime_unobserved_marker
    - sha256_or_runtime_unobserved_marker
    - persisted_artifact_path_if_any
    - disposition
  build_install_experiment_E2_allowed: false

classification:
  categories:
    - HEALTHY_STRUCTURAL_ABSTENTION
    - PUBLIC_EVIDENCE_UNCLOSED
    - EXECUTION_OR_TELEMETRY_LIMITED
  missing_implementation_or_main_result_alone: NOT_A_SCIENTIFIC_NEGATIVE
  complete_question_card_without_main_result: FRESH_RAW_OPPORTUNITY
  zero_clean_brief_allowed: true
```

## Lane source-origin routing

以下六项属于同一个 Source27 profile，不是六种新方法，也不是录取配额：

| Lane | Allowed origin capsule | Locator 前必须能写出的最小 consequence |
|---|---|---|
| S1 | 单一 versioned spec/ABI/ISA + current producer/consumer source path | 某个 target-native action 如何改变同一程序/ABI 结果，而非“feature 可优化” |
| S2 | exact GPU/NPU/PIM trace/result export/simulator/runtime/command schema | 固定 estimand、movement/resource bottleneck 与可改变它的 native action |
| S3 | small deterministic natural release/change chain + manifest/API + stock reader | 稳定 law 的 confound plan 和 decision-changing consequence |
| S4 | machine-readable current benchmark rules/export/schema + native comparator | suite-specific estimand、availability rule、holdout/falsifier；无需自然部署外推 |
| S5 | target-specific partial primitive + checker/oracle + formal invariant/counterexample route | 非 generic 的 action 和保证；不能只给 repository/solver 名 |
| S6 | current backend/ISA action catalogue + exact program/test carrier | 至少两个 native legal actions 与 union 外 residual 的原子区别 |

## Safety invariants

- Q2 minimum preserved: `true`
- Q1 priority preserved: `true`
- Same-object preserved: `true`
- Latest collision preserved: `true`
- Fair current strong baseline preserved: `true`
- Natural/canonical input and evidence preserved: `true`
- Full-cost preserved: `true`
- Reproducibility preserved: `true`
- Claim ceiling preserved: `true`
- STOP non-revival preserved: `true`
- User StageB approval preserved: `true`
- Missing implementation/result cannot cause scientific DROP: `true`
- V9/Production/network-security/Stage/experiment/build/install/automation: `false`

## State and compatibility migration

- Existing states affected: `NONE`
- Existing assignments affected: Source25 and Source26 remain immutable complete.
- Candidate or locator reopening: no automatic reopening. Cooldown override requires a pre-dispatch, content-addressable evidence delta and still cannot revive STOP.
- Template compatibility: existing seed-pool and Question Card templates remain usable; Source27 control adds assignment-local capsule/orthogonality fields.
- Shared-file patch: `NONE`
- One-time migration required: `NO`
- Rollback path: profile expires after one full six-lane cycle; any process violation returns the next assignment to current v8.7 frontend without state migration.

## Validation plan

- Historical/time-slice cases: not required for this one-cycle source scheduler because admission semantics do not change. Permanent canonical adoption would require a new rule audit and the backtest determination required by `AGENTS.md`.
- Negative controls:
  - one decisive current source may eliminate a locator without artificial role padding;
  - a source-unavailable or telemetry-unobservable route may not become absence/STOP;
  - Source25/26 same surface without evidence delta may not be renamed by another creative engine;
  - canonical benchmark may not be rejected solely for lack of natural deployment carrier, nor extrapolated beyond suite semantics.
- Expected behavior changes:
  - reported locators and exact locators become identical;
  - S2 cannot report domain categories as locator events;
  - selected locators show measurable contract-axis diversity;
  - source role collapse remains usable for efficient negative decisions but not for surviving-card closure;
  - telemetry/source limitation is visible as its own class.
- Forbidden regressions: outcome-aware capsule/locator replacement, proposal quota, capacity increase, weak baseline, changed object/guarantee, missing full-cost/falsifier, STOP revival, or V9/Stage action.
- Acceptance threshold:
  1. exact-locator traceability `100%`;
  2. origin/endpoint/action/carrier/falsifier fields `100%` for selected locators;
  3. pairwise orthogonality checks `100%`;
  4. same-document three-role closure on surviving locators `0`;
  5. scientific hard-gate violations `0`;
  6. funnel arithmetic and three-way cause classification `100%`;
  7. minimum raw or brief count: `NONE`.

## Decision request

现有用户授权已覆盖主线在下一安全边界实施一次 `SOURCE27_ORIGIN_GROUNDED_ORTHOGONAL_RESIDUAL_V1`，不需要再次请求相同 generic approval。主线可以创建一个 Source27 control 与六份长期 lane assignment；不得修改共享规则、启用 V9/Production、扩大 lane/预算、进入网络安全、运行实验/Stage/构建/安装/自动化、改变既有候选状态或复活 STOP。Source27 完成后，是否永久写入共享规则必须另行审计决定。
