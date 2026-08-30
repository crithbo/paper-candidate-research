# Collision / Action-Space Matrix — Wave 12

**Admission rule:** an unimplemented fidelity item is admissible only after a distinct same-object action survives the union subtraction. It does not repair a direct collision.

| Exact object | Information and guarantee | Fair strongest union / full-cost | Claimed-looking action | Collision and action-gap test | FIDELITY_CLOSURE_PLAN status |
|---|---|---|---|---|---|
| LLVM code-edit register allocation | MachineFunction edits; semantic and ABI preservation, not allocation-bit identity | Fast/Basic/Greedy/PBQP; compile latency, liveness/matrix memory, spill/reload, code size and runtime | Preserve/reuse allocation state after local edit | LLVM documents Basic as incremental and Greedy as its tuned global allocator. No invariant defines which retained state is legal while remaining a new action rather than a different allocation object. | `STRUCTURALLY_UNCLOSABLE` — no frozen atomic action, comparator contract, or finite killer. |
| Unmodified shell re-execution | Program/input changes; behavioral indistinguishability including non-idempotent effects | Bash full execution; Incr; runtime, storage, dependency/effect tracking and invalidation full cost | Effect-aware memoized intermediate reuse | Incr directly analyzes/tracks dependencies and effects, stores intermediates, and reuses them correctly. Choosing reuse is a selector. | `STRUCTURALLY_UNCLOSABLE` — direct subtractor occupies core action. |
| RPKI incremental dissemination | Publication updates; strong consistency at router; fault/incorrect-update behavior unchanged | Monolithic pipeline; cc-pipe; latency, router overhead, conflict prediction and recovery | Concurrent conflict-free propagation using dependency/conflict graph | cc-pipe directly provides a predictive conflict graph and concurrent pipeline with strong consistency. | `STRUCTURALLY_UNCLOSABLE` — direct subtractor occupies core action. |
| Tensor data-movement compilation | Same tensor-program function; exact output semantics | Layout/fusion; VTC; transfer bytes, peak memory, compile time and runtime | Maintain virtual/index-mapped tensors rather than materialize copies | VTC's virtual tensor plus creation algorithm is the same construction. “Approximate view” changes guarantee and is not comparable without a new frozen quality contract. | `STRUCTURALLY_UNCLOSABLE` — no same-object residual. |

## Finite-killer rule application

None of the four rows produces a Stage-A killer because there is no proposed mechanism to falsify. A valid future proposal would need all of the following before `PROPOSE_STAGE0`:

1. an action-gap certificate that names one atomic operation unavailable to every union member;
2. a natural corpus/trace (or naturally formal upstream object) of 20–50 instances;
3. a falsifiable full-cost threshold; and
4. an auditable closure plan for native comparator semantics, full action, denominator, and at least one legality/equivalence witness.

## Source URLs

- <https://llvm.org/docs/CodeGenerator.html>
- <https://arxiv.org/abs/2502.04063>
- <https://www.usenix.org/conference/osdi26/presentation/xie-yizheng>
- <https://www.usenix.org/conference/nsdi26/presentation/yu>
- <https://www.usenix.org/conference/osdi26/presentation/hu-muyan>
