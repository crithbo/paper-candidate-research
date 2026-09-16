# LLVM-APX-PREFIX-PRESSURE-PARETODP r10 Revision1 Stage A Report

## 中文摘要

唯一的同对象 `REVISE_ONCE` 已在首个 patched-driver process 启动时消耗。修订使 S02 的两个 replay 成为显式零成本 `NO_APX_ACTION_IDENTITY` 负例，保留 failure region，且不计为 candidate gain。随后完整冻结分母的唯一一次执行在 S04/R1 的 `prepare_same_object_trace` 首败，未产生 trace 输出；后续 S04/R2 未启动。

因此，8 行 / 72 命令的冻结分母未闭合。六个完整行的 raw checker/full-cost receipts 全部保留，但不汇总候选相对效果、Pareto、速度或方向性 full-cost。revision 已耗尽，owner 不提出第二修订；后续仅能由独立 formal Stage A gate 决定处置。

- Assignment id: STAGEA-L2-20260829-LLVM-APX-R10-REVISION1-CLAIM
- Decision: `INCONCLUSIVE__REVISION_CONSUMED__INDEPENDENT_GATE_REQUIRED`
- Evidence ceiling: `REVISION_CONSUMED__INCOMPLETE_FROZEN_DENOMINATOR__INDEPENDENT_GATE_REQUIRED`
- Stage B authorized: false

## Fidelity and revision accounting

- 独立 preclaim fidelity：`ACCEPT_PRECLAIM_FIDELITY`。
- 输入复制：10/10 hash-accepted，216,618 bytes，network=0。
- revision consumption：S01/R1 的首个 patched `prepare` 启动即消耗 1/1；记录见 `REVISION_CONSUMPTION.yaml`。
- 对非空 action 行，source driver 的 prepare 外前缀和后缀保持一致；S02 空 action 行只新增固定 no-action identity 及三项 trace booleans。

## Frozen denominator and observed boundary

- Frozen contract：4 selected inputs × 2 replays = 8 rows；每行 9 命令；共 72 命令；零 retry、backfill、输入/基线/分母/成本字段变更。
- 实际：55 条命令启动；S01、S02、S03 的 6 行完整；S04/R1 partial，S04/R2 未启动。
- 首败：S04 / `asmconstraint` / `prepare_same_object_trace`，exit code 2，未超时，raw stderr 记录 `prepare llc failed`。

## Required no-action and comparator facts

- S02/R1、S02/R2：`native_action_applicable=false`、`no_action_identity=true`、`failure_region_retained=true`；每行仅保留一个 `NO_APX_ACTION_IDENTITY` 记录，绝不计为 candidate gain。
- S01/S03 的四个完整 replay：native action applicable=true，no-action=false。
- 六个完整行：candidate/labeled/generic/oracle exact relation=true；native current/tuning arms separate=true。

## Claim honesty and next gate

- Unsupported：候选 gain、baseline relative effect、Pareto、方向性 full-cost、Stage A PASS、scientific STOP、Stage B readiness。
- Raw ledger、完整行和 S04 失败行已保留；不得排除 S04、不得重试、不得执行第二 revision。
- 下一步：独立 formal Stage A gate 审查。本 owner 停止执行并不启动 Stage B 或 cleanup。
