# LLVM-APX-PREFIX-PRESSURE-PARETODP Stage A Report

## 中文摘要

冻结的自然 claim packet 仅运行一次即按首败策略停止。4×2 的固定分母需要 8 行、72 条命令；实际启动 19 条，完整完成 S01 的两个 replay 后，S02/R1 的 `prepare_same_object_trace` 以 exit code 2 失败。该自然行保留同程序语义与 ABI，但冻结动作选项数为 0。

因此，不汇总候选或基线的相对效果，也不形成性能、Pareto 或方向性 claim。全部 pre-failure raw receipts、失败行与 control 行快照均保留，等待独立 Stage A gate 判断该冻结自然行覆盖失败的后续处置。

- Lane id: CANDIDATE_EXECUTION_LANE_2
- Assignment id: STAGEA-L2-20260829-LLVM-APX-R9-NATURAL-CLAIM
- Decision: `NO_OWNER_STAGEA_PASS_OR_STOP__INDEPENDENT_GATE_REQUIRED`
- Quality tier: `NOT_ASSESSED__INCOMPLETE_FROZEN_DENOMINATOR`
- Evidence ceiling: `INCOMPLETE_FROZEN_DENOMINATOR__NO_DIRECTIONAL_CLAIM`
- Stage semantics: real Stage A claim run; no paper main claim established.

## Pre-claim contract fidelity gate

- Gate status: `PASS` by independent preclaim review, SHA-256 `C10A32BFDA007AA5EC47C8CF1A8B4C182E199659B8B051E46DF6C46BAF58DC5F`.
- Frozen implementation, comparator, native-arm separation, denominator/full-cost paths and E2 non-claim control were accepted before claim visibility.
- Claim-bearing run started only after PASS: `true`.

## Frozen contract and execution

- Natural denominator: four selected inputs × two replays = eight rows; nine commands per row; 72 commands total.
- Run policy: one attempt, zero retry, no reserve backfill, no result-based exclusion, no code/input/baseline/denominator change.
- Preserved E2 control output: 30 files / 278,243 bytes; snapshot manifest `CONTROL_ROW_SNAPSHOT_MANIFEST.yaml` SHA-256 `611ED92D634E6FDB5F77C86B9695DDFD0BF8B975718D5275F9BCB3DE38986DC8`.

## Highest-risk probe result

- Complete rows: `APX-R8-S01-R1`, `APX-R8-S01-R2` (18 process receipts retained).
- First failure: `APX-R8-S02-R1` / `neg8r` / `prepare_same_object_trace`; exit code 2, no timeout.
- Failure-region observation: the frozen S02 row retained same-program semantics and ABI, but produced zero frozen action options.
- Consequence: five rows were not started; pre-failure outputs are not aggregated or interpreted as a directional result.

## Current critical-cost and reproducibility record

- Controller ledger: `resources/logs/claim/controller/outer_full_cost_ledger.json`.
- Raw command receipts preserve exit, timeout, CPU, wall time, Windows peak RSS, input bytes, output bytes and persisted bytes.
- Resource tree at sealing: retained and inventoried; network=0, retries=0, reparse traversal=0.

## Supported and unsupported claims

- Supported observation: the exact frozen S02 natural row has an action-coverage failure before a full row can close.
- Unsupported: candidate advantage, baseline comparison, directional full-cost, Pareto relation, generality, Stage A PASS, scientific STOP, Stage B readiness.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: pending.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B authorized: false.

## Next action

No additional owner execution is authorized. The independent Stage A gate must review the incomplete frozen denominator and retained raw evidence; any revision, pivot, state transition, or cleanup remains MAINLINE-controlled.
