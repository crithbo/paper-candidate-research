# Independent Stage 0 confirmation

**Assignment:** `STAGE0-C2-20260814-GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN-CONFIRM-V8.7`  
**Mode:** `SENTRY`  
**PRIMARY decision reviewed:** `REVISE_ONCE`  
**Confirmation decision:** `CONFIRM_REVISE_ONCE`  
**Tier if the gate closes:** `TIER_B_Q2_VIABLE`  
**Evidence ceiling:** `STATIC_CURRENT_SOURCE_AND_FIDELITY_PLAN__NO_COMPILE_OR_PERFORMANCE_CLAIM`  
**StageA/B:** `false`

## Independent result

The PRIMARY has correctly identified a narrow, potentially publishable N2 residual, but it has not yet established the required same-object instance.  A single finite revision remains warranted:

`PINNED_RBI_ACTION_CATALOG__NONLOCAL_BOUNDED_REGION_CERTIFICATE`

This is not a PASS.  It is also not a STOP: no current same-object source found here supplies a complete target-RBI, multi-instruction mapping-plus-repair optimizer with the requested exact/FPT/certified-frontier guarantee.  Conversely, the existing action grammar is already materially stronger than a simple per-instruction COPY counter and prevents any generic-DP or local-tuning claim from proceeding.

## Current-union attack

LLVM's current RegBankSelect documentation, updated 2026-08-13, says the pass maps a `MachineFunction` top-down; target `RegisterBankInfo` provides the default and alternative mappings; and the pass can introduce copies.  It names only two current modes: Fast uses the default mapping and Greedy picks the cheapest target-provided alternative for each instruction.  The documented multi-instruction Global mode remains an intended future mode. [LLVM RegBankSelect](https://llvm.org/docs/GlobalISel/RegBankSelect.html)

The source-level union is not merely Fast versus a naive greedy selector.  In Greedy mode `getInstrPossibleMappings` is queried, a valid best mapping is selected, and the mapping is applied.  The source creates `RepairingPlacement` actions that can reassign, insert, reject an impossible mapping, consider splitting, and create insertion points on CFG edges.  It also exposes block-frequency analysis. [Current RegBankSelect source](https://llvm.org/doxygen/RegBankSelect_8cpp_source.html)

Therefore the complete comparator is:

`fixed target RBI + Fast + Greedy + all legal RepairingPlacement/edge actions + identical MBFI/MBPI information + InstructionSelect + ordinary RA/scavenging/frame/scheduling/MC`.

This union absorbs all proposals that merely change an RBI local cost, select another legal Greedy configuration, relocate an already-selected repair locally, count copies only, or wrap the existing local action table in a generic optimizer.  The documentation still supports the PRIMARY's narrower possibility: it explicitly distinguishes an across-multiple-instructions Global selection from current Fast/Greedy.  That distinction is opportunity evidence, not proof that a particular target has a residual.

## Why the atomic revision is necessary and finite

The PRIMARY packet does not freeze a target triple/subtarget, immutable LLVM/RBI source table, or a complete legal action catalog for one instruction family.  It consequently cannot state two all-edge legal plans for one fixed legalized SSA MachineFunction.  In particular, a purported diamond must enumerate:

- every operand/vreg bank assignment at the entry, both outgoing edges, join, and exit;
- each `RepairingPlacement`, materialization/split decision, alias or live-in fact, and verifier condition;
- identical ABI, diagnostics, profile information, target features and downstream instruction-selection contract; and
- all candidate and comparator costs, including planner extraction/CPU/RSS, compilation, object bytes, inserted COPY/repair, RA/spill/frame consequences, and controlled runtime only under the same executable workload.

Without these, a claimed nonlocal plan may either be impossible under the target's RBI or already realized by CFG-aware repair placement.  This is a finite static gap, not a demand for an implementation or a positive result.

## Required certificate for the single revision

The revision closes only if it provides all of the following together.

1. An immutable LLVM commit/file hash and exactly one target triple/subtarget/features/ABI, with the complete relevant `RegisterBankInfo` mapping alternatives and repair/materialization table.
2. One fixed legalized SSA MachineFunction region and two complete same-MIR plans.  Each plan must be verifier-legal across all edges and have a charged full-cost vector.  The candidate plan must be neither reproduced nor dominated by Fast, Greedy, or their finite same-contract configuration grid.
3. A finite boundary state containing at least the live vreg-to-bank interfaces, target mapping/operand constraints, aliases and repair locations, relevant CFG/PHI/terminator facts, and all downstream interface facts that affect the declared cost.  State equality must preserve every legal suffix action and the complete cost vector.
4. An action-to-path and path-to-action proof for a declared bounded-region family, plus an explicit exact/FPT/certified-frontier recurrence and a real parameterized bound.  Width/action-cap exceedance must delegate to the stock union with no candidate-quality claim; generic ILP/CP, register-identity enumeration, or a hidden target change is invalid.
5. A finite Stage-A preclaim fidelity gate: stock command/pin replay, same-MIR exhaustive checker, verifier and downstream-parity check, and a killer that stops the frozen mechanism if no nonlocal witness is found, a repair is illegal, stock emits the same frontier, or full cost leaves no nondominated plan.

## Collision and decision boundary

The first-party documentation and source independently verify the PRIMARY's key current-union facts and its requirement to include CFG-aware repair placement.  They do not provide a direct same-target target-RBI theorem or deployed Global mode.  The direct-paper collision search remains `SEARCH_BOUNDED_OPEN`; no absence inference is made from it.

If the sole revision can produce the certificate above, the resulting contribution is a target-specific bounded nonlocal N2 with a credible conditional Tier-B shape.  If a pinned target exposes only local-equivalent mappings, if its complete action table makes the witness invalid, or if the full union reproduces/dominates the claimed frontier, then the correct subsequent decision is a scientific `BELOW_Q2_STOP` for this frozen mechanism.  Missing implementation, benchmarking, native output, or natural positive performance is not a STOP premise.

## Closing recommendation

`CONFIRM_REVISE_ONCE` with no automatic Stage A/B dispatch.  The revision is the only allowed scientific repair for this Stage 0 mechanism; it must be performed by the PRIMARY owner, after which a reviewer who did not construct it must close the case.
