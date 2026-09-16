# S2 adaptive-source01 — canonical discovery

Method: `V8_7_POTENTIAL_READINESS_SEPARATED`; V9 is OFF. The screening intentionally prioritized cross-layer compiler/architecture/runtime decisions rather than cache/index constructors.

## Breadth and disposition

| ID | opportunity family | cross-layer shift and initial action test | disposition |
|---|---|---|---|
| F01 | LLVM GlobalISel register-bank / instruction-selection joint planning | Local register-bank decisions insert cross-bank copies; a whole-function plan can jointly select legal target mappings and repair placements before register allocation. | `PROPOSE_STAGE0` (finite fidelity gap). |
| F02 | MLIR n-D vector lowering / physical-register pressure | High-level vector shape/lowering constrains later register allocation and spills. | `NOT_ADMITTED_UNFROZEN`: target-specific complete action and strong union were not frozen. |
| F03 | Triton layout / warp-specialization / shared-memory pressure | Warp specialization moves cost from compute to synchronization, shared memory and registers. | `DROP`: current compiler controls already partition memory/MMA/vector work; remaining proposal was a controller/configuration. |
| F04 | LLVM OpenMP target map / runtime transport | Mapping decisions transfer cost to host-device map-table and runtime transport. | `DROP`: map/nowait/depend/runtime/plugin union covers the stated action; only runtime policy remains. |
| F05 | LLVM MachineOutliner / liveness / code-size tradeoff | Outlining moves code-size pressure to call and liveness constraints. | `EXCLUDED_REPEATED`: historical BOLT/MachineOutliner family. |
| F06 | Wasmtime Cranelift codegen / runtime boundary | JIT compilation shifts cost between code generation and runtime residency. | `EXCLUDED_REPEATED`: Wave342 family. |

One grounded brief is proposed, not as a quota: GlobalISel has an explicit current source witness that the baseline is local; the candidate changes the decision structure to a target-specific bounded-width exact/FPT joint plan and preserves identical MIR legality/output semantics. All other rows remain nonterminal or are current-union/repeat exclusions.
