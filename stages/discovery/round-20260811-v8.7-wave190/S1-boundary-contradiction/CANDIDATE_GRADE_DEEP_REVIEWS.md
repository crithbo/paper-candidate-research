# CANDIDATE_GRADE_DEEP_REVIEWS

## U01 — Arm SME ZA cross-call state-transition construction

**Verdict:** `NOT_ADMITTED_UNFROZEN` — not a scientific DROP and not a proposal.

### Frozen semantic object and legality

The 2025Q4 AAPCS64 source (issued 2026-01-23) defines SME as Beta and fixes ZA storage, PSTATE.SM, PSTATE.ZA and TPIDR2_EL0. A dormant ZA call must preserve or commit the lazy save; the ABI also specifies handler/unwind interaction and requires ZA off for a `setjmp` return via `longjmp`. The function-level PSTATE.SM contract is exactly non-streaming, streaming, or streaming-compatible. ACLE defines streaming ZA operations such as `__arm_streaming __arm_inout("za")`; these establish the producer-side interface, rather than a missing interface.

### Current union and direct subtractors

The union that a candidate must beat is: (1) ABI-defined SM/ZA/TPIDR2 state transitions, helper routines and save/restore requirements; (2) ACLE attributes controlling the stated interface and ZA sharing; (3) current LLVM AArch64 SME ABI lowering, including its `MachineSMEABIPass`, save/restore/lazy-save handling and the LLVM 22 cross-call reduction of unnecessary transitions; and (4) platform runtime/unwinder and emulator semantics. Arm's LLVM 22 report gives a direct counterexample to the proposed minimal witness: two consecutive normal calls after one lazy-save are already merged rather than surrounded by repeated save/restore transitions.

Thus a new action would have to be a whole-program state-transition constructor over the same attribute-annotated call graph, retaining every PCS and unwind guarantee. A policy that only changes `__arm_*` attributes, `-march`/target selection, inlining, or an emulator is excluded. A save-placement heuristic not demonstrably distinct from LLVM's existing pass is absorbed.

### Six-dimensional residual check

| Dimension | Finding |
|---|---|
| Decision rule | Existing ABI/compiler actions choose lazy-save, preserve/commit and transition placement; a candidate must enumerate legal state paths, not call a selector. |
| Information | Candidate and baseline both see callee interface attributes and call graph; granting profile/oracle-only information would be unfair. |
| Complexity/resource | Any proposed dynamic program would need to charge compile time, code size, state-buffer/stack, transitions and emulated time. No distinct algorithm is frozen. |
| Quality/guarantee | AAPCS64 normal return, ZA/ZT0, SM, asynchronous control and unwind guarantees are fixed. Relaxing one changes object. |
| Full-cost | Exact denominator is frozen above; no performance claim was run or inferred. |
| Generalization/no-gain | LLVM 22 already merges the minimal adjacent-call witness. Without a commit-pinned source enumeration, a wider residual cannot honestly be asserted. |

### Fidelity closure and finite killer

**Closure plan, if reopened by a future assignment:** pin an LLVM main commit and the linked `clang/test` and `llvm/test/CodeGen/AArch64` SME tests; pin the platform runtime/unwinder and QEMU revision; construct one small ACLE matrix kernel with an active/dormant ZA caller, two helper calls, and one exception or `longjmp` edge; compare all ABI-legal state/result traces and charge the frozen full cost.

**72-hour killer (not run):** if the pinned LLVM test/source shows an existing path-equivalent construction for every legal call-state path in the small witness, or if the alleged improvement requires a different PCS guarantee or an attribute/flag/inlining choice, terminate as `DROP__CURRENT_UNION_ABSORPTION_OR_NONMECHANISM`. If the sources enumerate an unabsorbed whole action, re-admit only then.

### Why not a brief

The mechanism is not rejected for lack of hardware, implementation, result, or AI readiness. It is not proposed because the required current LLVM source/test/runtime action union was not pinned to a retrievable current commit in this assignment; a branch-level source description and a feature report cannot certify implementation absence. No `PROPOSE_STAGE0` is emitted.

