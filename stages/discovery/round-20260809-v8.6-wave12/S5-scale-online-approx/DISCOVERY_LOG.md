# DISCOVERY-S5-20260809-V8.6-WAVE12 — Discovery Log

**Evidence cutoff:** 2026-08-09  
**Method:** accepted production v2/v8.1 plus calibrated v8.6 `FIDELITY_CLOSURE_PLAN` admission (6 TP / 0 FN / 6 TN / 0 FP). The blocked two-axis v8.2r2 method was not used.  
**Decision:** `COMPLETE_ZERO_PROPOSALS`.

## v8.6 admission interpretation

Discovery did not require a finished interface, format, checker, implementation, oracle, witness, or claim-bearing result. A valid proposal could instead carry `READY_TO_CLOSE_IN_STAGEA`, `FINITE_FIDELITY_GAP`, `HUMAN_CORE_FIDELITY_GAP`, or `RESOURCE_BLOCKED_FIDELITY_GAP` together with an auditable closure plan. Only `STRUCTURALLY_UNCLOSABLE`, direct absorption, wrapper/selector form, or same-object/guarantee failure is a Discovery drop.

No seed below was dropped for readiness. Every drop occurred because the same-object action was already occupied or no atomic action outside the strongest union could be named.

## Baseline-residual-first scan

| Seed | Same-object contract frozen before ideation | Current strongest union | Residual/action-gap verdict | v8.6 closure outcome |
|---|---|---|---|---|
| Incremental backend register allocation | A sequence of small edits to one LLVM MachineFunction → native code preserving program semantics and ABI → compilation latency, allocator analysis memory, spill/reload/code-size/runtime cost | LLVM Fast/Basic/Greedy/PBQP allocators; full recompilation with Greedy is a ceiling; incremental structured-IR allocator is an adjacent specialized backend | `NO_ACTION_GAP`: an “incremental allocator” alone is already within LLVM's Basic/Greedy allocator family; retaining/reusing live-range state across edits lacks a frozen invariant and could silently change the allocation object. | `STRUCTURALLY_UNCLOSABLE`; there is no same-function, finite closure plan until a distinct state invariant and direct subtractor are specified. |
| Incremental re-execution of unmodified shell programs | Changed shell program / inputs → behaviorally indistinguishable re-execution including non-idempotent effects → re-execution latency, dependency/effect tracking, cache storage and invalidation cost | Bash full re-execution; Incr dependency/effect tracking plus static/dynamic incrementalization | `DIRECT_ABSORPTION`: reuse of key intermediates with effect-aware correct re-execution is Incr's core action. A cache policy/reuse threshold is a selector. | `STRUCTURALLY_UNCLOSABLE`; a fidelity plan would only reproduce Incr's action. |
| Consistent incremental RPKI dissemination | RPKI publication updates → router-visible data preserving strong consistency → end-to-end latency, conflict handling, router overhead and recovery cost | Monolithic consistent supply chain; cc-pipe predictive conflict graph and concurrent conflict-free pipeline | `DIRECT_ABSORPTION`: conflict-graph-based incremental dissemination under strong consistency is the central cc-pipe construction. | `STRUCTURALLY_UNCLOSABLE`; neither a finite oracle nor a new atomic mechanism remains. |
| Exact data-movement elimination in tensor compilation | Tensor program → semantically identical execution → data movement, memory footprint, compile cost and runtime | Existing layout/fusion transformations; VTC virtual tensors and its profitable-creation algorithm | `DIRECT_ABSORPTION`: index-mapped virtual tensors that eliminate unnecessary transfers across arbitrary compositions are the identified construction. | `STRUCTURALLY_UNCLOSABLE`; changing to an approximate or a different operator set would change the frozen object/guarantee. |

## Fidelity-closure audit

The proposed-vs-drop distinction is explicit:

- An absent verifier or small semantic witness would have been a **finite fidelity gap**, not a reason to reject.
- Here, the absence is upstream of implementation: there is no union-external action to implement, no direct subtractor left to attack fairly, and no finite natural killer that could separate a new mechanism from the existing one.
- Therefore no `FIDELITY_CLOSURE_PLAN` is emitted for a non-existent candidate, and no topic brief is produced.

## Natural inputs and finite-killer boundary

- LLVM's official code generator and upstream source provide a natural formal compiler object, but a code-edit corpus alone does not create a new allocation action.
- Incr evaluates real-world shell scenarios and behavioral indistinguishability; this is natural input, but the identified reuse/effect mechanism is already direct prior art.
- cc-pipe is evaluated in a real-world RPKI deployment under strong consistency; its conflict graph is direct prior art.
- VTC's tensor programs are natural compiler workloads; replacing its exact preservation with an approximation would require an explicitly new quality contract and fair union, neither of which was found here.

No experiment, benchmark, Stage 0/A/B directory, resource request, or Stage B authorization was made.

## Primary-source ledger

1. LLVM Project, **The LLVM Target-Independent Code Generator** (official documentation): <https://llvm.org/docs/CodeGenerator.html>.
2. Lopoukhine et al., **A Multi-level Compiler Backend for Accelerated Micro-kernels Targeting RISC-V ISA Extensions** (CGO 2025 author preprint): <https://arxiv.org/abs/2502.04063>.
3. Xie et al., **Incr: Faster Re-Execution via Bolt-On Incrementalization** (OSDI 2026 official proceedings): <https://www.usenix.org/conference/osdi26/presentation/xie-yizheng>.
4. Yu et al., **cc-pipe: Breaking Systemic Bottlenecks in RPKI Data Supply Chain with Concurrent and Conflict-Free Pipelines** (NSDI 2026 official proceedings): <https://www.usenix.org/conference/nsdi26/presentation/yu>.
5. Hu et al., **VTC: DNN Compilation with Virtual Tensors for Data Movement Elimination** (OSDI 2026 official proceedings): <https://www.usenix.org/conference/osdi26/presentation/hu-muyan>.
