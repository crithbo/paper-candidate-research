# DISCOVERY-S2-20260809-V8.6-WAVE12 — Discovery log

## Assignment closure

- Assignment: `DISCOVERY-S2-20260809-V8.6-WAVE12`
- Method used: accepted production Discovery `v2/v8.1`, plus calibrated v8.6 `FIDELITY_CLOSURE_PLAN` admission (`6TP/0FN/6TN/0FP`). The TLS-blocked two-axis `v8.2r2` was not used.
- Cut-off: 2026-08-09; technical sources are primary papers, official proceedings, or upstream project material.
- Scope examined: Linux eBPF program compilation, verifier admission, and native-JIT execution of the same loaded eBPF program.
- Result: `COMPLETE_ZERO_PROPOSALS`; no Stage 0 recommendation and no topic brief.

## Why this object was screened

The prior single-pass eBPF JIT loses cross-instruction optimization after safety verification. That is an O2 bottleneck transfer from ordinary compilation to verifier/proof representation and native emission. It initially appears to invite a cross-stage action: choose a lowering together with a proof/certificate and native realization, under unchanged verifier safety semantics.

Two current strong works satisfy the same-object entry test:

1. **VEP (NSDI 2025)**: compiles annotated eBPF to annotated bytecode and includes a bytecode-level proof checker; its exact object is verifier-admitted eBPF programs.
2. **Kops (2026 preprint, primary author version)**: lowers each extended eBPF operation to a vanilla-eBPF proof sequence for the existing verifier and restores it to a per-architecture native emit for the JIT; its exact object is also a verifier-admitted, JIT-executed eBPF program.

K2 is an additional official-project baseline: it optimizes the same eBPF bytecode subject to the final Linux kernel checker. BeePL is a different, source-language-centered verified-compilation lineage and is retained only as counter-evidence that a source-level type discipline is not an unclaimed residual.

## Primary-source search record

| Date | Query / inspection | Decision-relevant finding |
|---|---|---|
| 2026-08-09 | Official USENIX NSDI 2025 VEP page | VEP already couples annotated compilation with a bytecode proof checker for the eBPF verifier. |
| 2026-08-09 | Kops author paper / code-linked primary paper | Kops already couples a verifier-checked vanilla proof sequence, native-emission descriptor, lowering and restore; it also states unchanged verifier safety semantics. |
| 2026-08-09 | K2 official project and artifact links | Safety-aware compiler optimization with final kernel-checker admission is an available same-object baseline. |
| 2026-08-09 | BeePL primary paper | Correct-by-compilation/type-soundness route is a direct source-level alternative, not a missing generic proof abstraction. |
| 2026-08-09 | Upstream Linux BPF proof-checker RFC search | Current upstream work also investigates compact proof checking; it reinforces, but is not needed for, the direct-subtraction decision. |

Sources:

- VEP, official USENIX NSDI 2025: <https://www.usenix.org/conference/nsdi25/presentation/wu-xiwei>.
- Kops, authors' primary paper: <https://arxiv.org/abs/2606.24213>.
- K2 official project/source and artifact entry: <https://k2.cs.rutgers.edu/>.
- BeePL, authors' primary paper: <https://arxiv.org/abs/2507.09883>.

## v8.6 fidelity admission assessment

The inability to point to a completed kernel module, verifier extension, native descriptor, or legality witness would **not** itself be a Discovery rejection. A valid candidate could have been marked `FINITE_FIDELITY_GAP` if it froze an independent same-object action and a finite plan to close native semantics, full-cost, and a small program witness in Stage A.

That condition is not met here for a different reason: after subtracting VEP and Kops, every concrete proposed joint action is already expressed by their combined action space—certificate/proof sequence, compiler lowering, verifier checking, and architecture-specific native realization. What remains is choosing patterns, certificate sizes, or deployment variants, i.e. a selector/controller or ordinary tuning. Thus no honest `FIDELITY_CLOSURE_PLAN` status can be assigned to a retained topic; treating the absence of a new interface as `FINITE_FIDELITY_GAP` would conceal direct absorption.

## Final disposition

`COMPLETE_ZERO_PROPOSALS` (`DROP_DIRECT_ABSORPTION` / `DROP_FORBIDDEN_SELECTOR` at mechanism level). This is not a resource, implementation, core-result, checker-interface, or AI-readiness decision. Lane state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
