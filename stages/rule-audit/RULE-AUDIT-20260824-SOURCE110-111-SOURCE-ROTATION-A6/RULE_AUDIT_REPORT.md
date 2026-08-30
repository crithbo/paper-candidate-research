# Rule Audit Report

## 中文摘要

- Source110 edge-CPU/runtime/compiler rotation 与 Source111 kernel-corpus/DSL rotation 都未产生 evidence-qualified raw 或 clean brief。
- 两轮 first failed conversion 仍为 `VALID_SELECTED_RQ_OR_LOCATOR → EVIDENCE_QUALIFIED_RAW`；source rotation 没有改变瓶颈。
- 显式 denylist 继续有效：exact repeats 被保留为 prelookup/audit rows，不进入 valid selected 分母；但 valid routes 仍被 current union、缺 exact artifact/action 或 pre-RQ nonadmission 吸收。
- Decision: `NO_CHANGE`。保留 A5 `EXPLICIT_PREDECESSOR_IDENTITY_DENYLIST_V1` 的 backtest-required 状态，不提前安装 mandatory shared 语义；不新增第二个变化，不影响 Source112。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE110-111-SOURCE-ROTATION-A6`
- `assignment_id`: same
- `trigger`: Source110 + Source111 consecutive zero brief
- `date`: 2026-08-24
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE110-111-SOURCE-ROTATION-A6`
- `shared_files_modified: false`

## Scope and integrity

- Inputs: accepted A5 handoff, Source110/111 controls and twelve registered accepted handoffs.
- Source112 files/results: not read.
- Initial cold-start refusal was preserved; MAINLINE repaired context and accepted a new READY ACK before audit work.
- No network, search, download, build, experiment, queue, backtest, automation, shared write or state change.
- Evidence ceiling: registered Source110/111/A5 control and handoff artifacts only.

## Funnel comparison

| Cycle | Registered valid-selected lower bound | Unnormalized lane | Raw | Deep | Clean brief | First failed conversion |
|---|---:|---|---:|---:|---:|---|
| Source110 | at least 5 | S1 | 0 | 0 | 0 | valid selected RQ/locator → raw |
| Source111 | at least 3 | S1 | 0 | 0 | 0 | valid selected RQ/locator → raw |

Lower bounds use only explicit valid-selected fields from S2–S6. S1 records seed/RQ denylist checks but no normalized valid-selected total; no value is imputed. Counts diagnose transition location, not method precision.

## Source110 evidence — edge CPU runtime/compiler

- S1: OpenVINO GenAI CB PagedAttention and non-CB stateful KV are different objects; cache/INT4 KV paths already current; no same-object non-generic action.
- S2: ExecuTorch/XNNPACK partition/fallback action covered by current implementation.
- S3: llama.cpp CPU quant-kernel/repack action absorbs the only valid RQ; two exact repeats excluded.
- S4: five exact-artifact sketches all pre-RQ nonadmission.
- S5: MNN session/cache/KV lifecycle located, but two routes lack non-generic action or decision endpoint.
- S6: one valid locator, two exact repeats excluded, zero raw.

Result: resource-realistic public CPU surfaces are highly executable but current implementation coverage is dense; action novelty and fixed estimands remain absent.

## Source111 evidence — kernel corpus / DSL / compiler

- S1: KernelBench-Verified and TritonBench already cover multi-distribution correctness/performance verification and correct-but-slow concerns.
- S2: TileLang current kernel-cache/backend actions cover the route.
- S3: one valid locator; two exact repeats and one pre-RQ nonadmission; zero raw.
- S4: five kernel-artifact sketches all pre-RQ nonadmission.
- S5: MLIR/LLVM current union covers routes or Liger/Helion lacks exact artifact endpoint; one valid RQ, two pre-RQ nonadmissions.
- S6: two exact repeats + two pre-RQ nonadmissions; zero valid locator/raw.

Result: contribution-type rotation toward measurement/benchmark/DSL did not create a candidate because current corpus verification and DSL optimization surfaces already own the generic endpoints.

## Defect classification

| Class | Verdict | Evidence |
|---|---|---|
| Current-union/source saturation | PRIMARY | all valid routes in both cycles fail before raw on current action/benchmark/DSL coverage |
| Exact artifact/action/endpoint gap | MATERIAL SECONDARY | OpenVINO/MNN/llama/Liger/Helion/DSL routes lack one frozen non-generic contract |
| Scientific rule defect | NOT SHOWN | raw gate correctly rejects current, generic, changed-object and unfrozen routes |
| Execution defect | NOT SHOWN | denylist checks execute; exact repeats do not enter valid selected denominator |
| Template defect | NOT DECISION-CAUSAL | S1 valid-selected total remains unnormalized, but dispositions are unambiguous |
| Resource event | NOT CAUSAL | no persisted resource action/build/experiment or user blocker |

## Pilot disposition

| Pilot | Disposition | Rationale |
|---|---|---|
| A5 explicit predecessor denylist | `RETAIN_ASSIGNMENT_LOCAL__BACKTEST_PROPOSAL_PENDING` | exact repeats remain audit-only; no selected-repeat regression |
| Mandatory shared denylist behavior | `DO_NOT_INSTALL_YET` | A5 backtest/prospective shadow not run |
| Edge CPU runtime/compiler rotation | `RETAIN_STRATEGIC_AND_RESOURCE_REALISM__DOWNGRADE_CURRENT_NAMED_FAMILIES_FOR_NEAR_TERM_YIELD` | public CPU route is valuable, but Source110 0 raw and dense current union |
| Kernel corpus/DSL rotation | `RETAIN_MEASUREMENT_AND_BENCHMARK_DIVERSITY__DOWNGRADE_YIELD_HYPOTHESIS` | Source111 0 raw; current verification/DSL surfaces absorb generic claims |
| Carrier-first | `RETAIN_AS_ORDERING__DOWNGRADE_AS_YIELD_INTERVENTION` | prior accepted disposition unchanged |
| Artifact rotation | `RETAIN_FOR_DIVERSITY__DOWNGRADE_REPEATED_NAMED_FAMILIES` | prior A4 disposition unchanged |
| Single-GPU software rotation | `DOWNGRADE_IMMEDIATE_NAMED_FAMILIES__RETAIN_LONG_TERM_MAINLINE` | prior A4 disposition unchanged |
| R40 funnel, RQ frontend and honest abstention | `RETAIN` | correct scientific filtering |
| Quota, outcome-aware backfill, broad cooldown, terminal revival | `REMOVE / KEEP_FORBIDDEN` | violates hard boundaries |

## Recommendation

- Decision: `NO_CHANGE`。
- Shared rules/templates/skills: no patch。
- A5 proposal remains registered `BACKTEST_REQUIRED`; current assignment neither runs nor authorizes backtest。
- Future bounded change: `NONE_NOW`。Source112 already has one independently frozen VLA/multimodal source rotation; A6 output is forbidden input and must not be stacked onto it。
- After Source112, evaluate actual raw/brief and independent Stage 0 feedback before any successor change。
- Existing operational option remains: temporary downweight only the named saturated source families at a future assignment boundary, never the whole edge/kernel/LLM category。

## Safety and compatibility

- All Q2/Q1 and scientific gates unchanged.
- Existing active/blocked/hold/terminal states unchanged.
- Source112 unaffected.
- No migration, rollback, backtest or user action required.

## Mainline handoff

- Decision label: `NO_CHANGE`
- First failed conversion: `VALID_SELECTED_RQ_OR_LOCATOR_TO_EVIDENCE_QUALIFIED_RAW`
- Files proposed for change: none
- Shared files modified: `false`

