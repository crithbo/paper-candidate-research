# Full-action / collision matrix — S3 wave 11

| ID | Exact natural object | Frozen strongest union | Candidate action-gap certificate | Native semantics and full-cost denominator | Counterfactual finite Stage-A killer | Decision |
|---|---|---|---|---|---|---|
| W11-LLVM-01 | Fixed LLVM MIR MachineFunction → target-correct emitted machine code, with cross-basic-block scheduling permitted only when target legality/liveness holds. | Current LLVM per-block MachineScheduler + upstream HexagonGlobalScheduler’s superblock speculative/predicative/pull-up action space. | `EMPTY__GLOBAL_SUPERBLOCK_SCHEDULE_ALREADY_EXPRESSED`. | `llc` target semantics, `-verify-machineinstrs`, liveness, compile time, peak RSS, emitted code size, and execution cost where hardware is legally available. | 20–50 natural MIR/program inputs; reject on verifier failure, changed native behavior, or no full-cost Pareto residual. Must run the actual global action, not a local swap. Not run. | `DROP__DIRECT_ACTION_SPACE_ABSORPTION` |
| W11-GPU-01 | Fixed Triton blocked program → same kernel semantics with compiler-managed multi-warp movement/synchronization. | TLX MIMW and ML-Triton multi-level orchestration/lowering. | `EMPTY__MIMW_ORCHESTRATION_ALREADY_EXPRESSED`. | Triton/target compiler legality, compile time, IR/code size, synchronization/movement costs, and same-kernel output contract. | 20–50 official kernel/test inputs; reject on compiler failure, incorrect output, or no full-cost frontier. A schedule selection proxy is invalid. Not run. | `DROP__DIRECT_ACTION_SPACE_ABSORPTION_AND_SELECTOR_GUARD` |
| W11-LLVM-02 | Generic LLVM cross-block scheduling over arbitrary targets. | Generic local scheduler plus existing target-specific global scheduling and historical superblock/trace construction. | `EMPTY__NO_TARGET_SEMANTICS_COMPLETE_PORTABLE_ACTION`. | Must be target-specific enough to prove legality, so a generic-only comparison has no single native denominator. | No finite same-object killer can be frozen before fixing one target/semantics; merely choosing a target would be a backend mapping. | `DROP__NO_FINITE_PRECLAIM_FAITHFUL_CONTRACT` |

## Preclaim-fidelity note

The matrix intentionally treats a local greedy/window schedule as a control only.  It cannot support either a positive claim or a scientific negative for a purported global scheduler.  `EMPTY` certificates arise from direct action-space absorption or missing full-action semantics, not from unrun experiments.

No brief is emitted: every row lacks the required non-empty atomic action-gap certificate.
