# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE34-35-CONSECUTIVE-ZERO-BRIEF-R33`
- `proposal_id`: `SOURCE37_STAGE_SEPARATED_IDENTITY_AND_TYPE_ROUTING_V1`
- `decision_label`: `CLARIFY`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`
- `shared_patch_authorized`: `false`
- `assignment_local_mainline_implementation_authorized`: `true`

## Problem statement

Source34/35 两轮合计 85 seed、19 RQ、0 raw。部分 lane 在 RQ 前要求 raw/Question Card 证据闭合，部分 lane 把共享 source/tool/ISA 或 broad genealogy 当作 exact-identity cooldown；与此同时题源反复收敛到成熟配置、selector、allocation 和 generic lowering。Source35 non-product shadow 因无 base raw 而六路全 N/A，继续运行不能诊断当前瓶颈。

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md` 的“前端分层”“Question Card/raw 准入”“贡献类型入口”。
- Current behavior: selected seed 先形成 RQ；raw 才冻结最低证据合同；完整 union/witness/实现/结果是 closure debt；exact identity 与 broad family 不等价。
- Why clarification is needed: Source34/35 的执行材料重复显示阶段信息要求前移、identity 证书缺失及贡献类型路由失衡。共享规则原则正确，先用一个 assignment-local 合规 pilot 验证即可。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| Source37 mainline assignment contract only | `DISCOVERY_FRONTEND_VARIANT` | base RQ production | `SOURCE37_STAGE_SEPARATED_IDENTITY_AND_TYPE_ROUTING_V1`，仅一轮 |
| Same assignment | `SEED_TO_RQ_ORDER` | 容易被执行成证据齐全后才形成 RQ | selected seed 必须先形成 2–3 个 RQ；current locus/full-cost/witness/union/result 不得作为 RQ 前置项 |
| Same assignment | `EXACT_IDENTITY_CERTIFICATE` | cooldown/containment 理由可只写 broad family | 比较 object/endpoint/action-or-estimator/mechanism/comparator-guarantee；family overlap 仅 related |
| Same assignment | `TERMINAL_CONTAINMENT_CERTIFICATE` | 可能凭同平台或同主题声称 terminal containment | 只有决定性字段子集/等价且旧负 witness 单调迁移时才排除；否则新 ID 正常审查，绝不复活旧 STOP |
| Same assignment | `CONTRIBUTION_TYPE_ROUTE` | 算法/constructor 形状主导 | measurement/benchmark、theory/formal、algorithm/system/compiler 分别使用现行类型合同 |
| Same assignment | `SOURCE_ROLE_HINTS` | 六路实际集中于成熟配置/selector | S1边界矛盾；S2非乘积后果；S3测量刻画；S4 benchmark/formal；S5算法/数据结构/formal；S6近期限制+当前源码直接残差 |
| Same assignment | `NON_PRODUCT_COUPLING_SURVIVAL` | Source35 shadow | `OFF` |

这不是共享规则 patch。若 Source37 的证据显示问题重复且纠偏有效，再单独提议是否把 identity certificate/telemetry 写入共享模板。

## Exact assignment-local invariants

- 六 lane 与每 lane 容量不变；不设最低 seed/RQ/raw/brief 数。
- `DISCOVERY_CLAIM_PACK_MODE`/V9 保持 `OFF`；RQ frontend 维持现行 Production revision。
- 网络安全继续排除；不得 outcome-aware backfill。
- raw 准入字段不减；完整 current union、强基线和 Q2 仍在原阶段独立闭合。
- NVPTX tcgen05 只维持 bounded unresolved，不占 quota、不自动 backfill、不升级为 clean brief。
- Source36 不暂停、不追溯修改。

## Six-lane routing table

| Lane | Source37 primary entry | Explicit avoid list |
|---|---|---|
| S1 | Recent limitation/current-source boundary or semantic contradiction | Mere feature/configuration novelty |
| S2 | Bottleneck transfer with a frozen dependent non-product consequence | API allocation/placement/config composition |
| S3 | Natural/canonical measurement or characterization law | Requiring an algorithmic constructor before RQ |
| S4 | Canonical benchmark + estimator/validity, or theory/formal model | Requiring a natural carrier for canonical-only claims |
| S5 | Scale/online algorithm, data structure, or formal bound | Mature compiler/runtime configuration surfaces |
| S6 | Recent explicit limitation with current-source-verifiable direct algorithmic residual | RA/selector/generic constructor themes |

This table allocates search attention, not admissions. A lane may legitimately return zero.

## Safety invariants

- Q2 minimum preserved: `true`
- Q1 priority preserved: `true`
- Same-object preserved: `true`
- Latest collision preserved: `true`
- Fair current strong baseline preserved: `true`
- Natural/canonical input/evidence preserved: `true`
- Full-cost preserved: `true`
- Reproducibility preserved: `true`
- Claim ceiling preserved: `true`
- STOP non-revival preserved: `true`
- User StageB approval preserved: `true`

## State and compatibility migration

- Existing states affected: `none`
- Existing assignments affected: `Source37 only; Source36 unaffected`
- Template compatibility: uses current templates; certificate/telemetry may be assignment-local appendices
- Old filename compatibility: no change
- One-time migration required: no
- Rollback path: set Source38 and later back to unmodified base-RQ assignment semantics; retain Source37 artifacts as diagnostic evidence. No candidate state is reversed.

## Validation plan

- Historical/time-slice cases: not required for a one-cycle enforcement clarification
- Negative controls: exact STOP duplicate; same tool but distinct endpoint/action; measurement entry without constructor; generic wrapper; direct current-union absorption
- Expected behavior changes: fewer undocumented pre-RQ exclusions; more explicit RQ and identity decisions; possibly more raw, but no minimum yield is promised
- Forbidden regressions: semantic STOP revival, same-object drift, raw-field omission, generic solver admission, weaker current-union/full-cost/Q2 review
- Acceptance threshold: 100% of selected seeds obey RQ-before-evidence ordering; 100% of identity/terminal exclusions carry the required certificate; 0 hard-gate relaxation or outcome-aware refill. Yield remains observational.

## Authorization judgment

`USER_POLICY_APPROVAL_REQUIRED=false`. The existing user authority to continue adaptive Discovery until five independent StageA gate PASS, together with the mandatory two-zero-cycle audit rule, covers this single prospective assignment-local clarification. It does not authorize shared-file changes or later permanent rollout.

## Exact mainline directive

> 在 Source36 不暂停、不回写的前提下，主线可在 Source37 的下一安全 assignment 边界冻结 `SOURCE37_STAGE_SEPARATED_IDENTITY_AND_TYPE_ROUTING_V1`，仅运行一个完整六路周期。该周期按现行 v8.7/RQ Production 科学门执行，增加 seed→RQ→raw 阶段分离、exact identity/terminal containment 证书与贡献类型路由，关闭 Source35 的 non-product coupling shadow；六 lane、容量、预算、网络安全排除、V9 OFF、零配额和无结果回填均不变。不得改共享规则、既有状态或复活 STOP；周期完成后以真实漏斗及独立 Stage0 反馈复审，不能按产出数量自动续用。

## Decision request

No fresh user decision is requested. Mainline may implement the exact one-cycle directive above. Anything beyond Source37, any shared-rule/template patch, a capacity/budget change, V9 activation, scientific-gate change, or historical state migration remains unauthorized.
