# Current-upstream reality check

## Observed current action union

Official Relax VM documentation describes `tvm.compile()` applying a default Relax transformation pipeline containing operator legalization, fusion and buffer planning; VM code generation then packages bytecode, a constant pool and compiled kernels into a `VMExecutable`. The transform reference states that `StaticPlanBlockMemory` statically reuses allocation memory, while `AllocateWorkspace` and `LowerAllocTensor` cover additional allocation forms.

The fair stock union therefore includes all documented graph fusion, buffer/static-memory planning, workspace allocation, allocation lowering, VM code generation and runtime allocation choices, plus relevant default/non-default target and VM configuration supplied with the same information to a candidate.

## Pin and contrary evidence

Documentation was observed on 2026-08-15. The exact `apache/tvm` main commit and source implementations have not been resolved, so this packet deliberately makes no current-absence claim. Existing documented constituent actions are contrary evidence against treating ordinary fusion, memory planning, workspace flags or pass ordering as a residual.

## Result

`CURRENT_UNION_PARTIALLY_FROZEN__NO_ABSENCE_OR_DIRECT_COLLISION_CLAIM__DETERMINISTIC_SOURCE_CLOSURE_REQUIRED`.
