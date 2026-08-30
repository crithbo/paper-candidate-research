# CANDIDATE_GRADE_DEEP_REVIEWS

## R01 — Intel AMX tile state

`DROP__CURRENT_UNION_OR_LOWERING`. Intel documents that AMX requires OS permission and enlarged signal context; its official LLVM material already emits `tilerelease` at a function end to reduce context-switch cost. A same-program action that only hoists/releases tile state is existing target lowering/scheduling. A different XSTATE/signal-save behavior changes the precise state guarantee. 72h killer (not run): one AMX kernel with a signal edge, compare output/XSTATE trace and full compile+runtime+signal cost.

## R02 — Intel CET shadow stack

`DROP__ARCHITECTURAL_STATE_MACHINE`. CET's hardware shadow stack maintains CPU-stored return-address copies and reports a mismatch as an OS exception. A whole-function plan must emit balanced protected call/return and unwind behavior; changing it is compiler instrumentation/flag choice or changes CFI. 72h killer (not run): a public C++ throw/catch call chain under CET, validate normal and unwind shadow stacks and charge binary/runtime/unwind cost.

## R03 — Arm MTE tag-fault state

`NOT_ADMITTED_UNFROZEN`. MTE's tag comparison/fault mode is real: synchronous mode identifies the faulting instruction, asynchronous mode changes observability. A global allocation-tag lifetime constructor could only be same-object if the exact detection probability, mode, allocator/runtime and handler contract are pinned. Current official material establishes the state semantics but this assignment did not freeze a complete current allocator+libc+LLVM source union; no absence is inferred. 72h killer if reopened: fixed SYNC policy, public allocator corpus, tag/address/fault oracle, and compile+allocation+fault+RSS denominator.

## R04 — RISC-V Zicfiss shadow stack

`NOT_ADMITTED_UNFROZEN`. Zicfiss fixes `ssp`, shadow stack push/pop and `SSPOPCHK` mismatch behavior. A candidate must include exact exception/unwind and current compiler/runtime support, not merely add instrumentation. The ISA leaves no union-external per-return primitive, but the complete current LLVM/GCC/runtime support set was not commit-pinned; retain unfrozen rather than infer absence. 72h killer if reopened: fixed Zicfiss non-leaf call chain with trap/unwind trace, check `ssp`/link-register result and full compile/emulate/stack cost.

### Six-dimensional check

For each deep item, the decision rule is fixed by ISA or current lowering; fair information is limited to the same call graph/state; state save/restore and unwind enter full cost; changing the security/fault guarantee changes the object; and no natural-corpus gain has been claimed. No nontrivial union-external algorithm and guarantee survived.

