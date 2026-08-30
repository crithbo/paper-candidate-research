# Source57 S6 — primary RQ

## Exact public anchor

LLVM's versioned GlobalISel rule descriptions processed by `llvm-tblgen -gen-global-isel`, with a fixed target, IR/MachineIR semantics and stock GlobalISel match result.

## Primary RQ

For fixed target rules and MachineIR semantics, can a target-specific joint constructor over matcher tests, rule order, failure continuations and table sharing give a non-generic exact/FPT/approximation/certified-Pareto guarantee on generated matcher bytes and selection work beyond LLVM's current GlobalISel match-table composition?

## Boundary and falsifier

The output instruction-selection semantics and target rules remain fixed. A changed target description, generic decision-tree/rule-compilation solver, pass-order tuning, or wrapper is excluded. The RQ is falsified if LLVM's current producer already optimizes match tables in the relevant action space or if the apparent residual has no target-specific decision/guarantee. Ordinary closure is restricted to current official docs/source and a direct generic-kernel subtractor; no build or experiment is allowed.
