# Candidate-grade deep reviews

## D1 — OpenACM accuracy-constrained DCiM mapping

**Same object.** Fixed DNN graph and weights, fixed SRAM/DCiM macro library and target constraints, and the same allowed application-error contract.  A fair output must preserve the model's designated inference semantics; changing the model, hardware library or error boundary is outside the object.

**Current/source reality.** The 2026 primary paper identifies prior DCiM compilers' exact-arithmetic restriction as a limitation, then explicitly describes OpenACM as an open-source accuracy-aware compiler with an integrated library of exact, tunable-approximate and logarithmic multipliers, plus variation-aware characterization and an OpenROAD/FreePDK45 flow.  Thus the current first-party implementation/paper already contains the prospective joint action family.  The bounded review found no source-supported reason to call that action absent.

**Strong comparator and subtraction.** OpenACM's own whole flow, including its accuracy-energy tradeoff construction, is the direct same-object subtractor; exact-arithmetic compilers are weaker historical comparators.  A proposed “joint multiplier/macro/mapping Pareto planner” simply restates the published whole algorithm unless it supplies a new target-specific state restriction and theorem.  None is presently named; generic Pareto/ILP co-optimization is explicitly outside the contract.

**Natural/full-cost route and finite falsifier.** The paper's public CNN/design-flow examples could be frozen as a natural carrier.  A later Stage-A gate would hold DNN and macro library constant, check output/error equality, and charge compilation, characterization, physical-flow time/RSS/temp, energy/area and accuracy.  The fastest falsifier is showing the proposed state/guarantee is already implemented by the current accuracy-aware flow.  This is already the source-supported position.

**Decision.** `STRUCTURAL_DROP__PRIMARY_PAPER_ALREADY_SUPPLIES_THE_WHOLE_TARGET_SPECIFIC_CONSTRUCTOR`. This is not a readiness inference.

## D2 — DX100 indirect-access offload program construction

**Same object.** Fixed legacy loop/access semantics, fixed DX100 ISA and host-visible result, same MLIR-to-DX100 transformation semantics.  A valid output may alter legal accelerator command order but cannot change access values, control meaning or target ISA.

**Current/source reality.** The ISCA 2025 primary paper and first-party artifact identify a programmable accelerator that reorders, interleaves and coalesces memory requests; its associated MLIR passes transform legacy code to use the accelerator.  The artifact includes the source/benchmarks, while its simulation route is large and not executed here.  The relevant action family is therefore current and native, not inferred from a missing feature.

**Witness and subtraction.** A legal two-plan skeleton exists: the same extracted indirect-access region can produce two different command streams that preserve values but coalesce/interleave accesses differently.  However, DX100 itself is the direct cross-layer whole construction for exactly those actions.  What remains is either a generic request-ordering/reuse planner or a runtime controller. Neither is a target-specific new N2 with a distinct guarantee after subtracting the paper and the accelerator's compiler path.

**Natural/full-cost route and finite falsifier.** NAS, GAP, hash-join, UME and Spatter routes documented by the artifact are natural carriers.  Full cost would include compiler transformation, command-program size, host/DX100 execution, DRAM bandwidth/row-buffer behavior, CPU/RSS and any accelerator/simulator costs. A finite falsifier is a single same-ISA region where the alleged action is expressed by the current MLIR/DX100 construction. No experiment was run.

**Decision.** `STRUCTURAL_DROP__DIRECT_CROSS_LAYER_CONSTRUCTOR_ALREADY_PRESENT__REMAINDER_CONTROLLER_OR_GENERIC_ORDERING`.

