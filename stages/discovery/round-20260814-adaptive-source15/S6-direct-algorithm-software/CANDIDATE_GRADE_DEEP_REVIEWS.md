# Candidate-grade deep reviews — Source15

| ID | Fixed native semantics / two-plan test | Current union and fair subtractor | Disposition |
|---|---|---|---|
| D1 AMDGPU atomic aggregation plus fence | Fixed atomic result, order, scope, local/global memory result; all-lane versus native eligible elected-lane issuance. | AMDGPUAtomicOptimizer, target fence lowering, annotation-controlled synchronization union. | `STRUCTURAL_DROP__CURRENT_ATOMIC_OPTIMIZER_OR_CHANGED_MEMORY_CONTRACT` |
| D2 NVPTX mbarrier phase construction | Fixed barrier phase, arrival/expected and transaction counts; moving arrival/tx/wait changes phase conditions unless equivalence is proven. | Official mbarrier state machine and stock lowering. | `NOT_ADMITTED_UNFROZEN__NO_COMPLETE_SAME_CONTRACT_TWO_PLAN_WITNESS` |

No clean brief: D1 leaves only current optimization or generic aggregation; D2
does not close a complete native same-object action.
