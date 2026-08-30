# Rule Audit Report

## 中文摘要

- 发现的问题：Source104 的 exact-public-carrier-first allocation 没有改变漏斗首个归零点，也没有在一轮内产生 raw 或 clean brief。
- 得到的正面效果：carrier 和 current mechanism 更早被命名，部分泛化 sketch 更快收敛为 direct/current absorption 或明确 locator-only；这提高诊断清晰度，但不是 yield 提升证据。
- 建议：`NO_CHANGE`。Carrier-first 对检索顺序 `RETAIN`，作为 yield intervention `DOWNGRADE`；不删除、不升级为 admission gate、quota 或 production micro-rule。
- Source105：完全隔离。本审计未读取其结果，也不回写；Source105 已独立冻结 source-family/artifact rotation，本审计不叠加第二个变化。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE103-104-CARRIER-FIRST-A3`
- `assignment_id`: `RULE-AUDIT-20260824-SOURCE104-CARRIER-FIRST-EVALUATION-A3`
- `trigger`: Source104 carrier-first 后仍为完整六路零 clean brief
- `date`: 2026-08-24
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE103-104-CARRIER-FIRST-A3`
- `shared_files_modified: false`

## Question and scope

- Compare Source103 and Source104 first failed conversion and failure composition.
- Evaluate carrier-first as `RETAIN / DOWNGRADE / REMOVE`.
- Inputs: accepted A2 report/handoff, Source103/104 controls, six Source104 accepted handoffs, registry funnel records.
- Excluded: Source105 files/results, network, search, resources, backtest, queue, science/state changes and shared writes.

## Funnel comparison

| Cycle | Seeds | Normalized selected RQ/locator/closure | Evidence-qualified raw | Deep | Clean brief | First failed conversion |
|---|---:|---:|---:|---:|---:|---|
| Source103 | 56 | 32 | 0 | 0 | 0 | selected RQ/pre-RQ closure → raw |
| Source104 | 54 | 32 | 0 | 0 | 0 | selected RQ/pre-RQ closure → raw |

The selected count is a transition-localization normalization across heterogeneous lane fields, not a scientific precision denominator. Carrier-first changed source ordering only; gates, model route, RQ frontend, claim-pack, quality mode and selective depth were unchanged.

## Source104 lane evidence

| Lane | Carrier-first result | Pre-raw outcome |
|---|---|---|
| S1 | TorchAO/ExecuTorch/MLIR/llama.cpp named first | current packing/kernel actions, routine tuning, device-dependent issue, or missing single target carrier; 3 excluded + 5 locator-only |
| S2 | vLLM/TensorRT-LLM/FlashInfer public carriers | 2 current-native direct coverage + 1 generic threshold residual; 3/3 definitive pre-raw exclusions |
| S3 | TraceLab/AIPerf/MLPerf/vLLM replay carriers | event replay, cache semantics and sanitization covered by current workflows; 4/4 pre-raw exclusions |
| S4 | five public carrier closures | 3 early-fatal exact actions + 2 bounded nonadmissions; no raw |
| S5 | llama.cpp/MLC LLM carriers | 2 current/generic identity fatalities + 5 locator-only without non-generic action |
| S6 | CUTLASS/Triton grouped/irregular GEMM carriers | current scheduler/generic solver absorption; 3 exclusions + 2 locator-only |

Source104 has 18 clearly excluded/current-absorbed items and 14 locator/bounded nonadmissions, totaling 32. Source103 can be reconstructed to the same broad 18/14 split, with one local blocked closure; therefore carrier-first did not measurably reduce the pre-raw unresolved share in this single cycle.

## Causal interpretation

- Yield hypothesis: `NOT_SUPPORTED_IN_ONE_CYCLE`。Raw and clean-brief counts remained zero.
- Diagnostic hypothesis: `DIRECTIONALLY_SUPPORTED`。Handoffs more consistently name exact carriers and current mechanisms before generic sketch expansion.
- Scientific gate effect: none. No evidence that raw admission is too strict; exclusions remain same-object/current-union/genericity/full-cost honest.
- Resource effect: none aggregate. No persisted resource actions, builds or experiments occurred.
- Execution/template defect: not shown. Six handoffs and manifests were accepted; isolation and write boundaries held.

## Pilot disposition

| Pilot / behavior | Disposition | Rationale |
|---|---|---|
| Exact-public-carrier-first ordering | `RETAIN` | improves auditability and early current-upstream subtraction without changing gates |
| Carrier-first as a yield-improvement intervention | `DOWNGRADE` | 32→0 in both cycles; no raw or brief uplift |
| Carrier-first as mandatory admission prerequisite | `REMOVE / DO_NOT_INSTALL` | would reject legitimate finite carrier-closure debt and add a new gate without backtest |
| R40 funnel and evidence-qualified raw gate | `RETAIN` | correctly filters direct/current/generic/same-object failures |
| RQ frontend production | `RETAIN` | preserves explicit RQ and source-closure dispositions |
| 50/30/20 strategic allocation | `RETAIN` for alignment; `DOWNGRADE` for yield | two cycles show no yield support; still useful for advisor/resource alignment |
| Group repository as locator-only after public carrier | `RETAIN` | boundary was respected and did not contaminate evidence |
| Claim-pack/quality/selective-depth OFF | `RETAIN` | no raw/deep backlog; turning on depth cannot repair current absorption |
| Outcome-aware backfill, quota, broad cooldown | `REMOVE / KEEP_FORBIDDEN` | would weaken scientific selection or create unjustified category exclusion |

## Root-cause update from A2

- A2 primary classification `SOURCE_FAMILY_AND_CURRENT_UNION_SATURATION` is retained and strengthened.
- A2 secondary `EXACT_PUBLIC_SAME_OBJECT_CARRIER_CLOSURE_GAP` is narrowed: carrier-first names carriers earlier but does not eliminate locator-only/no-non-generic-action cases.
- First failed conversion remains unchanged.
- No rule, template, execution or aggregate resource defect is established.

## Recommendation

- Decision: `NO_CHANGE`。
- Shared patch: none。
- Future bounded change: `NONE_NOW`。Source105 already has one independently frozen source-family/public-artifact rotation; A3 output is forbidden input and must not be stacked onto it。
- After Source105 completion, evaluate its actual raw/brief/independent Stage 0 outcomes before considering another change. Do not use zero-brief families as precision denominators.
- Carrier-first may remain an advisory query-order heuristic, never a quota, raw prerequisite or evidence shortcut.

## Safety and compatibility

- Q2/Q1 target and all scientific gates unchanged.
- No existing ACTIVE/BLOCKED/HOLD/STOP/PASS state changed.
- No category cooldown, quota, terminal revival or Source105 effect.
- No backtest or rollback is needed because no behavior change is proposed.

## Mainline handoff

- Decision label: `NO_CHANGE`
- Carrier-first: `RETAIN_AS_ORDERING__DOWNGRADE_AS_YIELD_INTERVENTION`
- Files proposed for change: none
- Shared files modified: `false`

