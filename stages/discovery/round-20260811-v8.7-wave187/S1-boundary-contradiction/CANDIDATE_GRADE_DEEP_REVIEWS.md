# CANDIDATE_GRADE_DEEP_REVIEWS

## R01 RISC-V V state — `DROP__CURRENT_UNION_OR_FLAG`

Minimal witness: two legal vector instruction sequences can establish the same `vtype`/`vl` and result. Exact object includes V state, calling convention and result; strongest union is ISA semantics, LLVM lowering, runtime ABI and QEMU/Spike interpreter. A sequence/order change is target lowering/flag tuning unless it adds a complete same-contract algorithm. Oracle: ISA compliance/differential execution. 72h killer (not run): one public vector test, fixed ISA/ABI, compare exact state/result and charge compile/binary/emulate/RSS.

## R02 vector ABI calls — `DROP__ABI_CONFIGURATION`

Witness: register save/restore layouts for an unchanged vector call. The required caller/callee state guarantee makes any altered layout either existing ABI lowering or ABI change. Same carrier/oracle/full-cost and finite killer as R01; no experiment run.

## R03 Arm SME state — `NOT_ADMITTED_UNFROZEN`

Streaming/ZA state is a real seam, but the bounded official Arm endpoint did not yield a source-pinned compiler/emulator contract. No complete atomic action or fair union can be claimed. A future finite killer must pin official SME ABI/compiler/QEMU sources, run one public state-preserving call test and reject flag/ABI changes.

No N1/N2/N3 survives; no brief.
