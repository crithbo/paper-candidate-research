# RQ candidates

## Primary RQ — S80-RQ-01

For a fixed LLVM IR module set, target triple, symbol lookup sequence, and observable program semantics, is there a target-specific, nonseparable materialization-and-link constructor that improves complete JIT cost after compilation cost shifts to lookup-time materialization, relative to the complete stock ORCv2 eager/lazy/materialization-unit composition, with a stated exact, FPT, approximation, or certified-Pareto guarantee?

The endpoint is the same executable behavior at the same ORC lookup interface; custom runtime replacement, changed program semantics, and online controller-only policies are outside the question.

## Rejected alternate framing

Selecting eager versus lazy compilation by workload is a policy/controller formulation rather than a complete target-specific N1/N2 action. It is not carried forward.
