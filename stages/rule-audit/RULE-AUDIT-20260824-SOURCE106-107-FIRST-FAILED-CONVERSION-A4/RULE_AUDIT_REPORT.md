# Rule Audit Report

## 中文摘要

- Source106 与 Source107 的 first failed conversion 都是 `SELECTED_RQ_OR_SOURCE_CLOSURE → EVIDENCE_QUALIFIED_RAW`。
- Source107 可完整归一为 `47 seeds → 26 selected RQ/closure → 0 raw`；Source106 的 registered handoff 字段不统一，无法诚实补出完整 selected 分母，但六 lane 全部明确在 raw 前结束。
- 主因仍是具名 current-union/direct absorption、generic solver/tuning、same-object 或 exact public carrier + non-generic action 未同时闭合；未发现 rule/template/execution/resource defect。
- Decision: `NO_CHANGE`。Carrier-first 保留为顺序、降低 yield 预期；artifact rotation 保留多样性用途、降低当前具名族预期；single-GPU software rotation 只对本轮具名成熟族临时降权，不形成 broad category cooldown。
- Source108 完全隔离；本审计不读取、不回写，也不叠加第二个变化。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE106-107-FIRST-FAILED-CONVERSION-A4`
- `assignment_id`: same
- `trigger`: Source106 + Source107 complete zero-brief cycles
- `date`: 2026-08-24
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE106-107-FIRST-FAILED-CONVERSION-A4`
- `shared_files_modified: false`

## Scope and isolation

- Inputs: frozen A2/A3 accepted outputs, Source106/107 controls and twelve accepted handoffs, registry records.
- Source108 results/files: not read.
- Actions not performed: network, search, download, build, experiment, queue, backtest, automation, shared write, candidate/scientific state change.
- Terminal identity `CRFEPOCH-HBMPIM-LLM-GEMV-REV0` was treated only as a registry hold; its Stage 0 package/chat was not read or revived.

## Funnel reconstruction

| Cycle | Registered seed supply | Registered selected RQ/closure | Raw | Deep | Clean brief | First failed conversion |
|---|---:|---:|---:|---:|---:|---|
| Source106 | at least 27 from four count-bearing handoffs; S1/S5 counts not normalized | at least 14 plus S1/S5 unnormalized | 0 | 0 | 0 | selected RQ/locator/source closure → raw |
| Source107 | 47 | 26 | 0 | 0 | 0 | selected RQ/source closure → raw |

Source106 不得以缺失字段补零或猜测；first conversion 可由六份结论确定，但完整分母为 `NOT_YET_MEASURABLE_FROM_REGISTERED_HANDOFF_SCHEMA`。这属于 telemetry 可读性差异，不是导致零 raw 的 template defect。

## Cycle evidence

### Source106 — public accelerator/software cross-layer artifact rotation

- S1: Ramulator2/PIM components expose refresh、scheduler、row policy、address mapping；ordinary locality已有近期工作；缺同对象公开 LLM refresh carrier 与非通用动作。
- S2: no same-object public LLM transformer mapping carrier。
- S3: BitNet/bitnet.cpp、MXFP/vLLM repacking、AWQ current routes absorb generic low-bit actions；cross-mode carrier/action未闭合。
- S4: 5 closures，2 exact-action early fatal，3 bounded nonadmissions。
- S5: PowerInfer-2 segmented cache/cluster pipeline 与 KVPR partial recompute/transfer cover central actions；2 locator-only。
- S6: IREE Stream/tuning 与 TVM meta-schedule leave generic solver/tuning residual；3 excluded +1 locator。

### Source107 — single-GPU LLM software rotation

- S1: current torch.compile dynamic shapes/guards/recompile/fallback、TorchAO packing、CUDAGraph dynamic handling absorb generic proposals；no fixed codegen-only low-bit fallback action。
- S2: current torch.compile/CUDAGraph cache and memory controls cover the frozen action。
- S3: current vLLM/SGLang/MoE routing-locality、dispatch、grouped GEMM、residency and cost work cover the proposed action。
- S4: 5/5 selected RQs are exact-action early fatal under current single-GPU software union。
- S5: 4 current-union closures +1 locator-only without fixed decision endpoint。
- S6: 4/4 excluded before raw by current dynamic-shape/autotune/meta-schedule mechanisms；0 locator-only。

Source107 therefore shows stronger current-union saturation than Source106: moving closer to popular single-GPU LLM software improved resource realism but increased collision density.

## Defect classification

| Class | Verdict | Evidence |
|---|---|---|
| Current-union/source saturation | PRIMARY | all twelve lanes stop before raw; Source107 mature surfaces close nearly every selected action |
| Exact carrier/non-generic action gap | MATERIAL SECONDARY | Source106 S1/S2/S3/S5/S6 and Source107 S1/S5 retain bounded locator/action gaps |
| Rule defect | NOT SHOWN | raw gate correctly rejects generic tuning, current actions, changed objects and unfrozen endpoints |
| Template defect | NOT DECISION-CAUSAL | Source106 denominator fields are heterogeneous, but every lane's scientific disposition is unambiguous |
| Execution defect | NOT SHOWN | all handoffs/manifests accepted; isolation and identity holds complied |
| Resource event | NOT CAUSAL | no persisted resource action/build/experiment; no blocker drove aggregate zero |

## Pilot disposition

| Pilot | Disposition | Scope |
|---|---|---|
| Carrier-first | `RETAIN_AS_ORDERING__DOWNGRADE_AS_YIELD_INTERVENTION` | same as accepted A3; provenance benefit remains, yield support absent |
| Named public artifact rotation | `RETAIN_FOR_DIVERSITY__DOWNGRADE_CURRENT_NAMED_FAMILIES` | Source105 produced one brief but it stopped at Stage 0; Source106 produced zero; keep rotation, lower repeated named-family priority |
| Single-GPU LLM software rotation | `DOWNGRADE_FOR_IMMEDIATE_SUCCESSOR_ALLOCATION__RETAIN_STRATEGIC_MAINLINE` | current PyTorch/vLLM/SGLang/MoE surfaces are densely absorbed; do not ban the category or reduce long-term strategic importance |
| R40 funnel and raw gate | `RETAIN` | prevented weak/generic proposals without false resource inference |
| RQ frontend production | `RETAIN` | produced finite, auditable RQ/closure dispositions |
| Claim-pack/quality/selective depth OFF | `RETAIN` | no raw/deep backlog; enabling depth cannot create residual actions |
| Outcome-aware backfill, quotas, broad cooldown, terminal revival | `REMOVE / KEEP_FORBIDDEN` | violates project hard boundaries and one-change discipline |
| Honest zero-brief | `RETAIN` | correct result under mature current unions |

## Recommendation

- Decision: `NO_CHANGE`。
- Shared rule/template/skill patch: none。
- Future bounded change: `NONE_NOW`。Source108 already has one independently frozen contribution-type/artifact allocation rotation; A4 output is forbidden input and cannot be stacked onto it。
- After Source108, evaluate actual replication-negative/measurement/benchmark raw and independent Stage 0 feedback. Do not infer method precision from zero-brief families alone。
- Operationally, MAINLINE may use existing named-source-family temporary downweight for the specific saturated PyTorch/vLLM/SGLang/MoE/BitNet/PowerInfer artifacts at a future assignment boundary; this is already allowed scheduling, not a new rule or category cooldown。

## Safety and compatibility

- Q2/Q1 and all scientific hard gates unchanged。
- No ACTIVE/BLOCKED/HOLD/STOP/PASS state changes。
- No Source108 effect, backtest, migration or rollback required。
- QNN/QRefine/V8 blockers and CRFEPOCH terminal state unchanged。

## Mainline handoff

- Decision label: `NO_CHANGE`
- First failed conversion: `SELECTED_RQ_OR_SOURCE_CLOSURE_TO_EVIDENCE_QUALIFIED_RAW`
- Files proposed for change: none
- Shared files modified: `false`
