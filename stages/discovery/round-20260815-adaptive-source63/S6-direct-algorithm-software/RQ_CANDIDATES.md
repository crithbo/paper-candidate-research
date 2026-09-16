# Source63 primary RQs

## RQ01 — Flambda2 closure-set/group construction

For a fixed OCaml Lambda/Closure program, compiler/runtime version and observable execution behavior, can a target-specific constructor jointly choose closure-set grouping, free-variable environment representation and direct-call closure layout with a non-generic exact/FPT/Pareto guarantee over code size, allocation and entry cost beyond Flambda2’s current closure-conversion producer?

Minimum falsifier: current Flambda2 source/docs show that the same group/environment/direct-call construction already occurs, or the candidate collapses to generic closure conversion/layout.

## RQ02 — GCC loop-distribution partition construction

For a fixed GIMPLE loop, dependence/alias facts, target features and observable program behavior, can a target-specific whole-loop constructor jointly partition/fuse statements and construct legality-preserving loops with a non-generic exact/FPT/Pareto guarantee beyond current GCC loop distribution/vectorization composition?

Minimum falsifier: current GCC source/docs already implement the same legal partition choice, or the residual is generic loop partitioning/tuning rather than a target-specific action.

The other seeds do not pass to source closure and are not scientific raw rows.
