# Rule Audit Report

## 中文摘要

- 发现的问题：Source102 与 Source103 的 seed 供给充足，但所有已选 RQ/locator/source-closure 都未进入 `EVIDENCE_QUALIFIED_RAW`。首个归零转换是 `PRIMARY_RQ_OR_PRE_RQ_SOURCE_CLOSURE → EVIDENCE_QUALIFIED_RAW`，不是 deep review、Stage 0 或资源阶段。
- 对推进速度或研究质量的影响：继续堆叠更宽 seed、更多 generic/group-repository sketch 或更早 deep review，只会增加 locator/current-union 重复；降低 raw gate 则会制造弱题和误报。
- 建议修改：`NO_CHANGE`。不修改共享规则、模板或 skill；不在已经独立冻结的 Source104 上叠加第二个变化。保留 Source104 自身唯一的 `EXACT_PUBLIC_CARRIER_FIRST_DIVERSIFICATION`，待其完整结果和独立 Stage 0 反馈后再评价。
- 是否需要用户批准：否；本审计不提出新的政策改变。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE102-103-ZERO-BRIEF-A2`
- `assignment_id`: `RULE-AUDIT-20260824-SOURCE102-103-FIRST-FAILED-CONVERSION-A2`
- `trigger`: Source102、Source103 连续两个完整六路周期零 clean brief
- `requested_by`: AGENTS zero-yield rule / MAINLINE
- `date`: 2026-08-24
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE102-103-ZERO-BRIEF-A2`
- `shared_files_modified: false`

## Question and scope

- Question: 定位两轮 first failed conversion，区分来源饱和、规则/模板缺陷、执行违例和资源事件，并决定既有 pilot 的 `RETAIN / DOWNGRADE / REMOVE`。
- Inputs: 冻结 registry record、Source102/103 control、六份 accepted Source103 handoff。
- Forbidden and respected: 未读取 Source104 结果；未读取非最小历史树；无网络、下载、构建、实验、queue、backtest、状态转换或共享写。
- Source104 isolation: Source104 只从 plan/registry 被确认为并行独立 assignment；其结果不是本审计输入，本输出也不得回写 Source104。

## Funnel reconstruction

| Cycle | Seed / locator supply | Selected RQ or closure work | Evidence-qualified raw | Deep | Clean brief | First zero conversion |
|---|---:|---:|---:|---:|---:|---|
| Source102 | 36 seeds | 5 primary RQs | 0 | 0 | 0 | primary RQ/source closure → raw |
| Source103 | 56 seeds | 32 normalized selected RQ/locator/closure items | 0 | 0 | 0 | selected RQ/pre-RQ closure → raw |

Source103 的 32 为六 lane 已登记的 `8 + 3 + 4 + 5 + 7 + 5`，只用于定位转换，不把不同 lane 的字段名误当成同一科学分母。Source102 只登记 5 个 primary RQ，不能反推未登记的 exact-anchor 分母。

## Per-lane evidence

| Lane | Pre-raw work | Why no raw | Classification |
|---|---|---|---|
| S1 | 8 RQ/closure | 6 locator-only；2 current/terminal/generic pre-raw exclusion；多项缺 exact public same-object carrier | source/carrier saturation + valid gate |
| S2 | 3 nominations | 1 exact-object source closure blocked；1 anchor mismatch；1 current observability absorption | one bounded source event + valid gate |
| S3 | 4 locators | 1 token-level public carrier/action gap；3 current vLLM/SGLang/TraceLab/related absorption | carrier gap + current-union saturation |
| S4 | 5 exact anchors | strong benchmark/goodput/configuration subtractors；full-cost estimand或 immutable-current closure未闭合 | source saturation + correct comparator gate |
| S5 | 7 closures | ExecuTorch online action换对象；VLA-Cache direct coverage；vLLM/current literature吸收；3 locator-only generic residual | same-object/direct collision + saturation |
| S6 | 5 locators | generic solver、current native selector、无 exact public object；3 locator-only | generic-shell/current-union saturation |

所有 lane 都有 accepted handoff/manifest；无 group-repository 越界、无候选实验、无 persisted resource action。S2 的单一 source-closure blocker和 S4 的 bounded commit-resolution failure均明确 `NO_SCIENTIFIC_INFERENCE`，不能解释六路 aggregate zero。

## Root-cause classification

| Class | Verdict | Evidence |
|---|---|---|
| Source-family / current-union saturation | PRIMARY | 两种不同 portfolio 仍在 current native action、direct subtractor、generic shell、terminal identity 和 exact-carrier缺失处归零 |
| Public same-object carrier closure gap | MATERIAL SECONDARY | S1/S2/S3/S6 明示 locator、mirror/spec、token trace 或 exact object gap |
| Rule defect | NOT SHOWN | raw gate 正确阻止换对象、generic solver、direct absorption、无 full-cost/非通用动作的题 |
| Template defect | NOT DECISION-CAUSAL | handoff 字段异构但可重建 funnel；没有证据表明模板漏项导致科学候选被拒 |
| Execution defect | NOT SHOWN | 6/6 handoff 被主线接受；manifest 通过；无越权、污染或 outcome-aware backfill |
| Resource event | NOT AGGREGATE CAUSE | 仅局部 closure 可达性问题，资源动作均未运行且未作科学推断 |

## Prior-pilot disposition

| Pilot / behavior | Disposition | Reason |
|---|---|---|
| R40 canonical funnel and unchanged evidence-qualified raw gate | `RETAIN` | 两轮诚实阻止弱题；降低 gate 会破坏 Q2 硬门 |
| `RQ_REFINEMENT_STAGED_EVIDENCE_V1` production | `RETAIN` | 能把 seed 收敛为具体 RQ/closure 并暴露 first failure；没有漏斗错路证据 |
| Ordinary breadth as default allocation in named saturated source families | `DOWNGRADE` | Source102 36 seeds/5 RQ/0 raw；继续同类 breadth 的边际收益低，只作未来 assignment-level 临时降权，不形成 category cooldown |
| Source103 50/30/20 strategic allocation | `RETAIN` for advisor/resource alignment; `DOWNGRADE` as yield hypothesis | 战略对齐不应删除，但一轮未提高 raw yield，不能当录取或发现保证 |
| Group-repository snapshot | `RETAIN` as locator/resource-alignment only | 权限边界执行正确；不得升级为 novelty/candidate evidence |
| Claim-pack/quality/selective-depth `OFF` | `RETAIN` | 没有 raw/deep backlog；打开深度或新门不会补出 exact carrier/non-generic action |
| Outcome-aware backfill、proposal quota、broad cooldown | `REMOVE / KEEP_FORBIDDEN` | 会把零产出转成配额驱动弱题或误杀成熟方向 |
| Zero-brief legality and honest abstention | `RETAIN` | 本轮零 brief 是合法、高质量结果 |

## Recommendation

- Decision: `NO_CHANGE`。
- First failed conversion: `PRIMARY_RQ_OR_PRE_RQ_SOURCE_CLOSURE → EVIDENCE_QUALIFIED_RAW`。
- Minimum shared patch: none。
- Smaller operational alternative: use existing assignment-level source-family temporary downweight and exact-carrier-first allocation; do not add a production rule。
- Future bounded change: `NONE_NOW`。Source104 already carries one independently frozen allocation-only change, `EXACT_PUBLIC_CARRIER_FIRST_DIVERSIFICATION`; this audit neither uses its results nor adds another change. Stacking a second change would make attribution impossible and violate the one-change discipline。
- Next evaluation unit: actual Source104 `CLEAN_STAGE0_BRIEF` plus independent Stage 0 feedback; zero-brief families alone are not precision denominators。

## Safety and compatibility

- Q2 minimum, same-object, current collision, fair strong baseline, natural/canonical evidence, full-cost, reproducibility and claim ceiling unchanged。
- No existing ACTIVE/BLOCKED/HOLD/STOP/PASS state changes。
- No terminal revival, no category ban, no proposal quota。
- QNN/QRefine/V8 blockers unchanged。
- Source104 unaffected and may proceed independently。

## Validation and rollback

- Backtest required now: no, because no behavior change is proposed。
- Shadow required now: no new shadow mode。
- Rollback: not applicable; no shared patch。
- If a future audit proposes mandatory carrier/admission behavior, it must use isolated historical backtest and prospective shadow before production。

## Mainline handoff

- User approval already present: continuous pipeline and automatic zero-yield audit authority only。
- Files proposed for change: none。
- Registry migrations proposed: none。
- Shared files modified: `false`

