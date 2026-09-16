# Rule Audit Report

## 中文摘要

- Source108 hidden predecessor hold 没有形成可执行的逐 seed/RQ 检查，产生 `13` 个 predecessor exact-repeat rows、`3` 个 pre-RQ nonadmission，仅留下 `2` 个 valid selected locator。
- Source109 使用显式 `PREDECESSOR_IDENTITY_DENYLIST.yaml` 并在 lookup 前检查；registered handoff 至少记录 `8` 个 exact/contains prelookup exclusion，且 exact/contains 不进入 valid locator，留下约 `10` 个 valid selected locator。
- Raw yield 未改善：Source108、Source109 都是 `0 evidence-qualified raw / 0 clean brief`。Denylist 改善执行效率和分母诚实性，不是科学召回提升证据。
- Decision: `PATCH_RECOMMENDED__BACKTEST_REQUIRED`。建议把显式 denylist 规范为 assignment-local、exact/contains-only 的控制 artifact；不得形成 broad cooldown、related-only 排除、quota 或 novelty inference。共享强制语义在独立 backtest/shadow 前不得 production。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE108-109-DENYLIST-EVALUATION-A5`
- `assignment_id`: same
- `trigger`: Source108/109 consecutive zero brief and explicit denylist evaluation
- `date`: 2026-08-24
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE108-109-DENYLIST-EVALUATION-A5`
- `shared_files_modified: false`

## Scope and isolation

- Inputs: A4 accepted handoff, Source108/109 registered controls, twelve registered accepted handoffs, Source109 denylist.
- Source110 results/files: not read.
- No network, search, download, build, experiment, queue, backtest, automation, shared write or candidate/scientific state change.

## Funnel comparison

| Cycle | Predecessor check form | Exact-repeat rows | Pre-RQ nonadmission | Valid selected locator | Raw | Clean brief |
|---|---|---:|---:|---:|---:|---:|
| Source108 | hidden free-text predecessor hold | 13 | 3 | 2 | 0 | 0 |
| Source109 | explicit denylist checked before lookup | at least 8 excluded prelookup; 0 selected repeats | present and separately recorded | about 10 | 0 | 0 |

Source109 的约 10 valid locator 来自主线 registry。各 lane 对 heterogeneous fields 的合计只用于流程比较，不是 scientific precision denominator。

## What changed and what did not

### Execution-quality change

- Source108 S2/S3/S4/S5/S6 repeatedly materialized predecessor exact identities, then removed them as protocol-noncompliant rows.
- Source109 materialized the predecessor identities into one versioned denylist with hash and required seed/RQ prelookup checks.
- Source109 S1 reports 8 seed + 7 RQ checks, 0 exact/contains selected locators and 0 replacement/backfill; related-only was allowed only with an explicit discriminator.
- Source109 S4/S5/S6 record exact exclusions before lookup rather than counting them as selected locator or scientific negatives.

Conclusion: the explicit artifact repaired an execution/control-surface defect—hidden identity holds were not actionable enough at seed/RQ construction time.

### Scientific conversion

The first valid scientific conversion still fails at `VALID_SELECTED_LOCATOR_OR_RQ → EVIDENCE_QUALIFIED_RAW`:

- Source109 valid routes were absorbed by current TensorRT-LLM/ORT/TGI/llama.cpp/LLVM/MLIR/runtime unions, lacked same-object native carriers, or remained pre-RQ unfrozen.
- Source109 produced no raw, deep review or clean brief.
- No resource event caused the zero; all resource actions were absent/non-producing.

Conclusion: denylist does not increase raw yield in this observation; it exposes the remaining current-union/carrier/action problem with a cleaner denominator.

## Defect classification

| Class | Verdict | Evidence |
|---|---|---|
| Hidden-control execution defect | CONFIRMED IN SOURCE108 | 13 exact-repeat rows despite predecessor hold |
| Explicit denylist fix | EFFECTIVE FOR EXECUTION REPEAT | 0 exact/contains selected locators in Source109; checks precede lookup |
| Rule scientific-gate defect | NOT SHOWN | raw gate continues to reject current/generic/unfrozen routes correctly |
| Template/control artifact gap | CONFIRMED | hidden hold lacked canonical per-entry semantics and mandatory check ledger |
| Source/current-union saturation | REMAINS PRIMARY SCIENTIFIC CAUSE | 10 valid locator approx, 0 raw |
| Resource defect | NOT SHOWN | no persisted resource/build/experiment action |

## Pilot disposition

| Pilot | Disposition | Rationale |
|---|---|---|
| Hidden predecessor identity hold only | `REMOVE / REPLACE` | not executable enough; permits repeated RQ work before exclusion |
| Explicit predecessor denylist artifact | `RETAIN` | reduces execution repeat and makes denominator auditable |
| Exact-or-contains prelookup exclusion | `RETAIN` | existing scientific identity semantics; no novelty inference |
| Related-only with explicit five-field discriminator | `RETAIN` | prevents broad cooldown and preserves legitimate adjacent questions |
| Outcome-aware replacement/backfill | `REMOVE / KEEP_FORBIDDEN` | would bias yield and violate frozen assignment |
| Temporary named source-family downweight | `RETAIN_AS_ALLOCATION_ONLY` | operationally useful, not an admission rule |
| Artifact/replication/measurement rotation | `DOWNGRADE_AS_YIELD_INTERVENTION__RETAIN_CONTRIBUTION_TYPE_DIVERSITY` | Source108 0 raw; exact repeat defect confounds its yield evaluation |
| Carrier-first | `RETAIN_AS_ORDERING__DOWNGRADE_AS_YIELD_INTERVENTION` | accepted A3 conclusion unchanged |
| Canonical raw gate/RQ frontend/honest abstention | `RETAIN` | scientific selection remains correct |

## Proposed one bounded future change

`EXPLICIT_PREDECESSOR_IDENTITY_DENYLIST_V1`

- MAINLINE generates a hash-pinned assignment-local denylist from registered immediate-predecessor and terminal `EXACT / provable TERMINAL_CONTAINS` identities.
- Each entry freezes five-field identity: object, action-or-estimand, endpoint, guarantee, full-cost boundary, plus source artifact/hash.
- Every seed and RQ records `EXACT / CONTAINS / RELATED_ONLY / NONE` before lookup.
- `EXACT / CONTAINS` is excluded without scientific inference and cannot be result-aware replaced in that assignment.
- `RELATED_ONLY` remains eligible only with a distinct five-field discriminator.
- It never creates a broad category cooldown, quota, global absence or novelty evidence.

This is one process behavior change. It should enter `SHADOW/BACKTEST`, not immediate production shared semantics. Source110 is already running independently and must not be changed.

## Validation and rollback

- Historical backtest packet: Source108 as hidden-hold positive failure case; Source109 as explicit-denylist execution case; include related-only negative controls.
- Acceptance:
  - detect Source108 exact-repeat rows 13/13;
  - Source109 selected exact repeats remain 0;
  - related-only false exclusion 0;
  - canonical raw/brief decisions unchanged;
  - no backfill, quota, terminal revival or scientific inference from exclusion.
- Prospective shadow: one future cycle after a separately frozen assignment; shadow verdict does not alter admissions until accepted.
- Rollback: mode `OFF`; retain only telemetry and existing registry identity holds.

## Safety and compatibility

- Q2/Q1 and all scientific gates unchanged.
- Existing candidate and terminal states unchanged.
- Source110 unaffected.
- Missing denylist in legacy assignments must be `NOT_APPLICABLE_LEGACY`, not reconstructed into historical scientific decisions.

## Mainline handoff

- Decision: `PATCH_RECOMMENDED__BACKTEST_REQUIRED`
- Proposed targets: `ROLE_MAINLINE`, `ROLE_DISCOVERY`, new denylist template/control schema
- User policy decision: not needed for proposal; mandatory production cutover requires accepted backtest and MAINLINE safe boundary
- Shared files modified: `false`

