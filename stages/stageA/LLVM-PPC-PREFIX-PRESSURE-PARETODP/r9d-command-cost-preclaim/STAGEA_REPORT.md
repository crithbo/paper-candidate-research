# LLVM-PPC-PREFIX-PRESSURE-PARETODP r9d Stage A Preclaim Report

## 中文摘要

- 本轮得到什么：在不重跑任何 compiler/linker/readobj/objdump/checker 的前提下，两棵冻结 r9c control replay 的 56 条 current-union command metrics 均完成 exact-edge 消费；共享 compile 按 configuration 只计一次、双 link arm 引用保留，unknown/orphan 为 0。
- 最重要证据：两次 replay 均为 56/56；三项预登记负控均按预期 fail closed；未来 r10 每进程的 128 compile、256 link、512 inspection 共 896 个 command costs 全部进入 producer→checker/full-cost 依赖链。
- 当前证据上限：`PRECLAIM_ENGINEERING_FIDELITY_ONLY__NO_SELECTED_OR_SCIENTIFIC_INFERENCE`。
- 下一步：返回同一个独立 Stage A preclaim gate；不需要用户动作。本 owner 不创建 r10 assignment、不运行计划、不写科学或正式状态。

- Lane id: `CANDIDATE_EXECUTION_LANE_2`
- Assignment id: `STAGEA-L2-20260826-LLVM-PPC-R9D-COMMAND-COST-PRECLAIM`
- Input freeze SHA-256: context `10AD82CFAFA3529BD0EBF1A071E2E3E7E88CA0B93190849655C57FE3C22F856E`; control `EE637D1E6B9DF8FF8CA5B50D0989BB3131F492981743C993C458453EA2BC565A`
- Cross-assignment contamination declaration: only the exact frozen r9c subtrees and seven accepted top-level audit files were copied; no other topic or rejected source was read into execution.
- Owner disposition: `PPC_R9D_PRECLAIM_ENGINEERING_FIDELITY_PASS__RETURN_SAME_INDEPENDENT_GATE`
- Formal scientific decision / quality tier: unchanged; owner has no state-write authority.
- Evidence ceiling: `PRECLAIM_ENGINEERING_FIDELITY_ONLY__NO_SELECTED_OR_SCIENTIFIC_INFERENCE`
- Stage semantics: control-only engineering-fidelity correction; not a claim-bearing Stage A result.

## Pre-claim contract fidelity gate

- Gate status: owner-side C0–C5 `PASS`; independent gate still required.
- Frozen action mapped to implementation: exact command-metric ID resolution, de-duplicated shared compile accounting, producer precedence, and complete future command-cost dependency.
- Comparator/native semantics: frozen r9c raw outputs and metrics were consumed read-only; native tools were not rerun.
- Metric denominator and unit parity: 56 exact current-union command IDs per replay; CPU seconds, wall seconds, peak RSS bytes, status, exit code and full-cost retained per ID.
- Full-cost collection paths: exact graph edge → exact command metric ID → per-command cost row → unique-ID aggregate; no tolerance or exclusion added.
- Small witness: three destructive mutations—missing edge, unknown edge, and cost/status mutation—each failed closed as preregistered.
- Non-claim-bearing control outputs retained: both command-cost audits, cross-replay audit, negative-control output, structural r10 plan and validation.
- Claim-bearing run started only after PASS: `false`; no claim-bearing run was authorized or performed.

## C0–C6 results

- C0: 329 copied files / 61,459,088 bytes; 0 mismatch; 0 reparse.
- C1: replay 1 and replay 2 each close 56/56 metric IDs. Each has 8 compile IDs counted once and 16 compile bundle references; unknown/orphan = 0.
- C2: 3/3 expected-fail negative controls pass; no tolerance/filter/exclusion.
- C3: all 32 future rows declare baseline graph as producer output before checker/full-cost; it is not a candidate input.
- C4: per future process 128 compile + 256 link + 512 inspection = 896 unique costs; 896/896 consumed; plan not executed.
- C5: retained replay roots only; cross-replay ID sets, reference counts and status/exit/phase/timeout semantics match.
- C6: canonical root reports, inventory, retention, capsule, handoff and manifest are sealed at closeout.

## Full-cost evidence

- Replay 1 unique command costs: CPU 2.09375 s; wall 4.910944799999925 s; peak RSS 24,887,296 bytes.
- Replay 2 unique command costs: CPU 2.28125 s; wall 4.380197100001169 s; peak RSS 24,887,296 bytes.
- These are retained control metrics, not newly executed native work and not candidate performance evidence.
- Controller Python CPU and exact assignment wall cost were not emitted by the runner; no estimate is made.

## Reproducibility and integrity

- Static compile attempts: 1; controller/generator commands: 5; automatic retries: 0.
- Native compiler/linker/readobj/objdump/checker commands: 0.
- Selected/reserve corpus tool invocations: 0; natural processes: 0; claim-bearing runs: 0; network bytes: 0.
- r10 plan rows: 32; fully expanded structural plan only; execution performed: false; r10 assignment directory absent.
- Resource root at pre-closeout inventory: 340 files / 127,698,561 logical bytes / 0 reparse entries.
- Active exact native processes and bundled Python processes at closeout preflight: 0 / 0.

## Supported and unsupported claims

Supported only at the control-fidelity level: the frozen r9c command-cost edges can be resolved exactly and the corrected future r10 plan structurally requires all 896 costs after an explicit baseline-graph producer.

Unsupported: candidate benefit, natural-workload effect, performance, mechanism effectiveness, scientific PASS/STOP, revision/pivot disposition, Stage transition, Stage B readiness, or permission to execute r10.

## Mandatory next gate

- Independent Stage A gate decision: pending.
- Next consumer: `SAME_INDEPENDENT_STAGEA_GATE`.
- User action required: no.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B authorized: false.
