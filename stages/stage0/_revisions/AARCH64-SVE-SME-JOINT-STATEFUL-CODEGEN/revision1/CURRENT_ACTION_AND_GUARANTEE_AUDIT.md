# Current action and guarantee audit

## Audit result

`GATE_BEARING_STATIC_CERTIFICATE_PRESENT__CONDITIONAL_PASS_TO_INDEPENDENT_CLOSING`

The candidate is constrained to an action frontier that the observed current `MachineSMEABI` source exposes but does not purport to optimize jointly with Z/P pressure or certify exactly.  This is not an absence assertion about LLVM.  A credential failure when asking Git for a moving-branch SHA is `SEARCH_BOUNDED_OPEN`; it contributes no collision inference.

## Direct source findings

| Current source/action | Finding | Consequence |
|---|---|---|
| LLVM SME guide | ACLE attributes map to LLVM IR; PSTATE.SM and ZA calls are ABI controlled.  Mode changes can change VL, clear vector state, and restrict instructions. | Fixed attributes/interfaces are hard legality boundaries. |
| AAPCS64 2025Q4 | N/S/SC, ZA interface class, lazy-save, TPIDR2, and asynchronous-control obligations are prescribed. | A valid state must include ABI obligations, not pressure alone. |
| `MachineSMEABI` | Explicit states are `ACTIVE`, `ACTIVE_ZT0_SAVED`, `LOCAL_SAVED`, `LOCAL_COMMITTED`, `ENTRY`, `OFF`; source invokes `assignBundleZAStates`, then inserts native state changes. | Gives a finite target action alphabet. |
| Bundle policy | On conflicting desired incoming states, source falls back to `ACTIVE`; it then places transitions locally. | It is a concrete current policy, not an exact declared Pareto frontier over alternative legal boundary placements. |
| Lazy save/restore | Setup allocates/writes a TPIDR2 block and writes `TPIDR2_EL0`; restore enables ZA, uses the ABI restore support routine and clears TPIDR2. | The witness uses native ABI actions, not a synthetic save protocol. |
| Transition restriction | `ACTIVE -> LOCAL_COMMITTED` is documented in current source as ZT0-only with no ZA state. | It is excluded; treating it as a ZA option is a fatal false witness. |
| Existing RA/pipeline | Current pass runs in MachineIR SSA before ordinary RA; it does not make a full future-action/cost equivalence claim over typed scalable Z/P role states. | A frontier DP must include, and then beat, the complete composition rather than replace RA generically. |

## Completeness contract

The candidate's grammar is complete only for the declared bounded region and source pin.  It contains every action that the frozen source exposes for that region: prescribed SM boundary pseudos, the implemented ZA transition pairs, TPIDR2 lazy-save/runtime steps, legal scalable whole spills/reloads, fixed frame actions, and fixed exceptional/return ports.  The region oracle rejects unknown pseudos or configurations; it does not treat a missing action table row as freedom.

The strongest composition baseline is:

`fixed Clang attributes + fixed call lowering + current SM transition lowering + MachineSMEABI + SMEPeepholeOpt + normal RA/scavenger/spill/frame + post-RA scheduling + stock assembler/linker`.

Every baseline component sees the same IR, attributes, call graph, feature flags, and declared full-cost vector.  `-O`/pass controls may be comparators only where they preserve these contracts.  Attribute choice, inlining as an interface workaround, target-feature retuning, custom ABI/runtime, or profile-only input selection are not residual actions.

## Exactness argument

For a fixed bounded region, associate a DP path with the emitted sequence of native actions.  Induct over region decomposition bags.  The entry state contains all ABI/mode/live-role information needed by the suffix.  A transition is inserted only when the current action table permits it; an exit records the exact resulting obligations/cost.  Thus each DP path emits a legal trace.  Conversely, parse a legal trace by its native action boundaries, map its boundary facts to the stated canonical state, and choose the corresponding recurrence transition.  The merge predicate preserves the entire suffix action set and cost because it requires identical call/exception port, interface state, mode legality, typed future-use signature, group restriction, and spill slot.  Thus every legal bounded trace has a DP path and equal-cost traces merge only under a future-action/cost-preserving bijection.

This establishes exact Pareto output for the bounded class.  It does not assert polynomial time for unbounded MachineIR, nor use anonymous physical-register symmetry.  The output may be exponential; cap exceedance yields no candidate result.

## Non-absorption and limits

The witness is not a natural-result claim.  It shows two legal same-interface placements using existing native actions, while the observed bundle selector has a fixed conflict fallback.  The candidate remains alive only if StageA confirms that the full current composition neither emits nor certificates the same frontier.  Direct replay by the baseline is direct absorption.  The following also kill it: a required ABI/attribute change, an unsafe ZA/TPIDR2 transition, a Z/P value illegally crossing an SM/VL boundary, or a recurrence that falls back to generic RA/ILP/identity enumeration.

## Sources

- [LLVM AArch64 SME documentation](https://www.llvm.org/docs/AArch64SME.html)
- [Current LLVM `MachineSMEABIPass.cpp` source surface](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Target/AArch64/MachineSMEABIPass.cpp)
- [AAPCS64 2025Q4 source](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst)
- [ACLE 2026Q1 release](https://github.com/ARM-software/acle/releases/tag/r2026Q1)
