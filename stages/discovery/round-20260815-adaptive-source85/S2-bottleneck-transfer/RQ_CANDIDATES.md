# Same-object research-question candidates

## Exact public anchor

Apache TVM’s official Relax VM documentation states that the default Relax pipeline includes graph-level transforms such as operator legalization, fusion and buffer planning, then VM code generation packages bytecode, constants and compiled kernels into one executable. The Relax transform reference documents `StaticPlanBlockMemory` as a static allocation-reuse pass.

## RQ-1 — primary

For a fixed Relax/TensorIR module, target/device configuration, model constants and output tensors, can a **fusion-boundary plus static-lifetime constructor** jointly select legal graph fusion boundaries and storage-reuse intervals to certify a non-dominated full-cost frontier (peak allocation, VM bytecode/dispatch, compilation CPU/RSS, executable bytes and end-to-end runtime), while preserving stock `VMExecutable` and output semantics?

Potential contribution only if later closed: target-specific `N2` algorithm, e.g. an exact/FPT/Pareto method parameterized by the module's bounded fusion-interface width. It is not a pass order, tuning grid, cache choice, or external wrapper.

## RQ-2 — alternative formulation

For the same fixed executable object, does a legal fusion decision necessarily change static allocation reuse enough to admit a certified Pareto improvement over separately composed stock graph fusion and block-memory planning?

RQ-2 is a testable restatement of the same family; it was not separately counted.
