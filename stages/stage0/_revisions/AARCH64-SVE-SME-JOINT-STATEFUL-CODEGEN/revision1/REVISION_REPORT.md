# Stage 0 revision 1 — AArch64 SVE/SME joint stateful code generation

**Assignment:** `STAGE0-P2-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-REVISION1-V8.7`  
**Atomic gate:** `NATIVE_SME_ABI_ACTION_COMPLETE__SAME_INTERFACE_TRANSITION_LAZYSAVE_PREDICATE_FRONTIER_CERTIFICATE`  
**Decision:** `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`  
**Tier:** `TIER_B_Q2_VIABLE` (conditional)  
**Evidence ceiling:** `STAGE0_STATIC_ACTION_AND_GUARANTEE_CERTIFICATE_ONLY__NO_NATIVE_REPLAY_OR_PERFORMANCE_CLAIM`  
**Scientific revision:** `1/1 CONSUMED`  
**StageA/B:** `false`

## Result

The gate closes as a narrow N2, not as a claim that SME interface state is freely selectable.  The fixed object is an LLVM AArch64 MachineIR region with fixed LLVM IR SM/ZA attributes, fixed AAPCS64 N/S/SC and private/shared/agnostic-ZA interface classes, fixed target features, and fixed externally visible call signatures.  The candidate chooses only among ABI-legal placements and compositions of already-native SME state actions and SVE/SME spill actions.  It cannot change an ACLE attribute, calling interface, callee contract, target feature, or reader/ABI semantics.

The residual is a target-specific exact Pareto optimization over a bounded interface region.  Current `MachineSMEABI` is a mandatory comparator, but its visible assignment is a deterministic bundle rule: it assigns the first desired incoming state and falls back to `ACTIVE` on conflict, then inserts local state changes.  It explicitly works in SSA before register allocation and tracks only the placement-sensitive physical `X0`/`NZCV` condition at an insertion point.  This is neither a complete joint ZA/TPIDR2/SM/Z-P frontier nor a stated exact/FPT guarantee.  The revision's candidate preserves that current lowering as a selectable action policy and compares against its complete native composition; it does not claim that the current pass lacks the native instructions.

## Frozen same object and source/action pin

| Surface | Frozen contract |
|---|---|
| LLVM source | LLVM `main`, observed 2026-08-11 through the first-party raw source of [`MachineSMEABIPass.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Target/AArch64/MachineSMEABIPass.cpp), source total 1,141 lines; LLVM documentation identifies the associated documentation snapshot as `23.0.0git`.  The available transport could not resolve a Git SHA (`SEC_E_NO_CREDENTIALS`); this is recorded as `SEARCH_BOUNDED_OPEN`, not absence.  The StageA fidelity gate must replace this observation pin with an immutable commit and file hash before any claim-bearing run. |
| Arm/ACLE/ABI | [AAPCS64 2025Q4](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst), issued 2026-01-23 and current source observed 2026-08-11; [ACLE 2026Q1](https://github.com/ARM-software/acle/releases/tag/r2026Q1), release commit prefix `c218a6b`. |
| IR/interface | A fixed `aarch64_pstate_sm_{enabled,compatible,body}` class and fixed ZA interface (`new/in/out/inout/preserves` or private/agnostic mapping), unchanged function type, call-site attributes, ABI, target triple, `+sve/+sme` feature set, and caller/callee visibility. |
| Object boundary | Same LLVM input and same stock AArch64 assembler, linker, loader and AAPCS64-visible behavior.  No custom ABI, reader, runtime, emulator, instruction encoding, or input/profile-only action is admitted. |

The observation pin is sufficient for this Stage0 static construction because all candidate transitions below are read directly from the currently observed native action grammar.  It is not an implementation/replay claim.  Commit-level reproduction is explicitly the first StageA fidelity condition rather than a claim that a failed credential exchange proves anything about current upstream.

## Native action grammar and complete strongest composition

The comparator is the union of fixed-attribute Clang/LLVM lowering, call-boundary SM pseudos and `SMSTART`/`SMSTOP` expansion, `MachineSMEABI`, `aarch64-sme-peephole-opt`, ordinary AArch64 register allocation/scavenging/spill/frame lowering, post-RA scheduling, stock assembler/linker, and all legal default/non-default optimization controls that preserve the frozen interface and features.  A candidate trace is rejected if that union already emits the same trace or computes the same frontier/guarantee.

For the revision region, the admitted action alphabet is finite:

1. prescribed N/S/SC entry/call/return transitions, including conditional state tests where the current state is not statically known;
2. the `MachineSMEABI` states `ACTIVE`, `ACTIVE_ZT0_SAVED`, `LOCAL_SAVED`, `LOCAL_COMMITTED`, `ENTRY`, and `OFF`, restricted to state pairs implemented by its `emitStateChange` switch;
3. existing lazy-save setup (`TPIDR2_EL0` receives the ABI TPIDR2 block), lazy ZA save, restore, TPIDR2 clear, ZA enable/disable, and the existing runtime support calls; and
4. legal Z/P group placement, whole scalable spill/reload, ordinary GPR/NZCV preservation required by the selected native transition, frame allocation/alignment, and fixed post-RA emission.

`LOCAL_COMMITTED` is excluded from the ZA-state witness: current LLVM documents that transition as ZT0-only when there is no ZA state.  Treating it as an alternate ZA action would be false.  Likewise, a PSTATE.SM transition is a legality constraint with its existing required Z/P consequence; it is not a free interface change.

## Same-interface two-action witness

Consider a fixed streaming-compatible, shared-`inout ZA` caller `F`, a fixed normal/private-ZA callee `C`, and a bounded diamond region.  `F` contains a ZA use on the hot successor and a `RequiresZASavePseudo`-marked call to `C` on the cold successor.  The fixed SC-to-N call boundary supplies the required SM transition; it is unchanged in both traces.  A pair of explicitly typed, live SVE values `zv` and predicate values `pv` are live over that boundary only through their ABI-legal scalable whole-spill/reload sites.  No Z/P value is carried in a register across a vector-length-changing SM transition.

```
bb.entry:       ; fixed SC + shared inout-ZA interface, ZA active
  define zv, pv ; typed scalable values; future uses and group constraints fixed
  br %c, bb.call, bb.za
bb.call:
  RequiresZASavePseudo
  [required SC -> N transition] ; existing lowering
  BL C                          ; fixed private-ZA / normal contract
  [required N -> SC transition]
  br bb.join
bb.za:
  ZA-requiring SME operation; use zv, pv
  br bb.join
bb.join:
  use zv, pv; return under the unchanged SC/shared-ZA contract
```

The two legal native traces are:

| Trace | Native placement | Why it is legal and distinct |
|---|---|---|
| `A` — local-active | Select `ACTIVE` for the conflicting edge bundle; emit `ACTIVE -> LOCAL_SAVED` at the marked call, including the TPIDR2 setup/lazy save, and `LOCAL_SAVED -> ACTIVE` only where the subsequent ZA operation requires it.  Place the required whole Z/P spill/reload around the fixed SM boundary. | This is within the observed current grammar and includes the current fallback style. |
| `B` — predecessor-lazy | Split the placement boundary within the same MachineIR region; emit the existing `ACTIVE -> LOCAL_SAVED` setup on the predecessor side, retain the saved state over the private-call arm, and emit the existing `LOCAL_SAVED -> ACTIVE` restore only on the ZA-using arm.  Use the same required SC/N transition and the same legal Z/P whole-spill/reload classes. | It preserves interface, values, ABI state, TPIDR2 protocol, and all visible calls.  It differs in state action placement and in the frame/code/dynamic-transition cost vector.  It is not an interface change or a new instruction. |

The source directly establishes the needed components: an `ACTIVE -> LOCAL_SAVED` transition invokes ZA save where state exists; lazy setup writes `TPIDR2_EL0`; `LOCAL_SAVED -> ACTIVE` restores through the ABI support path and clears TPIDR2.  The source's conflict fallback to `ACTIVE` means it does not itself certify the whole alternative placement frontier.  This witness proves action divergence only.  It makes no throughput, code-size, or natural-workload advantage claim.

## Candidate algorithm: SME-ABI Predicate-Frontier DP (SAP-FDP)

For a region with bounded live interface `k`, bounded control boundary/treewidth `t`, and bounded scalable spill-role count `p`, form a region decomposition.  A state is:

`(port, SM-class/current-knownness, ZA-state, TPIDR2-obligation, ZT0-state, legal-mode class, canonical typed-Z/P live-role map, whole-spill-slot map, X0/NZCV obligation, frame-alignment/variable-SVL flag, exceptional-return obligation, cost-vector)`.

Two states are merged **only** when their remaining-machine-instruction suffix has the same fixed call/exception ports, same SM/ZA/TPIDR2/ZT0 obligations, same mode legality, and a bijection of Z/P values with identical typed future-use signatures, tied-operand restrictions, group/subregister requirement, call-clobber status, and identical scalable spill slots.  The merge therefore preserves every suffix native action and every declared cost; it is not arbitrary register renaming.  A singleton role is retained if any signature differs.

The recurrence enumerates only the grammar above and performs min-plus Pareto joins on decomposition boundaries.  It rejects an action if AAPCS64 state, asynchronous-control ordering, target mode legality, frame alignment, or future use cannot be preserved.  It returns the complete nondominated vector set for the declared bounded region:

`cost = (static code bytes, transition instructions, ZA/TPIDR2 support calls, scalable spill/reload bytes, frame bytes, compile-state count)`.

For fixed `(k,t,p)` and the fixed finite action alphabet, the recurrence is exact and FPT: `O(|R| · f(k,t,p) · A^O(t))` time and `O(f(k,t,p) · A^O(t))` retained frontier space, where `A` is the constant native state/action alphabet.  The frontier can be exponential in the cost dimensions; output-sensitive retention is charged.  If the live-role signature count or region-width cap is exceeded, SAP-FDP returns `CAP_EXCEEDED__NO_CANDIDATE_CLAIM` and delegates to the complete current LLVM union.  It does not silently enumerate identities, call a generic ILP, or claim a benefit in that no-gain regime.

This is target-specific N2 because the state equality and recurrence are defined by N/S/SC, ZA/TPIDR2 lazy-save, SVL-scalable Z/P whole-spill, ABI support routines, and the current LLVM transition grammar.  Generic register allocation, generic scheduling, an ILP wrapper, profile-driven interface choice, or a local `SMSTART/SMSTOP` peephole is outside the claim and is a registered failure sentinel.

## Finite StageA preclaim fidelity and killer route

Before any claim-bearing observation, StageA must:

1. replace the observation pin with an immutable LLVM commit/file hash and reproduce the action-table audit; freeze AAPCS64/ACLE revisions and all LLVM pass/feature controls;
2. compile the tiny diamond witness and exhaustively enumerate every admissible bounded native action path; prove SAP-FDP path-to-MachineIR trace and trace-to-DP-path equivalence, including TPIDR2 and exceptional ports;
3. run stock assembler, linker, object inspection, ABI/IR/MIR checks, and a stock verifier/emulator only as fidelity checks; no custom reader is admissible;
4. compare the complete strongest LLVM composition with SAP-FDP on the same attributes, IR, features, and cost vector; and
5. use a finite natural corpus of attribute-annotated LLVM IR/MIR plus a corpus killer that stops the candidate if the current union emits the same frontier, if the action requires an attribute/interface change, or if the small oracle finds a missing legal transition.

Full cost must include planner compile CPU/RSS, code bytes, frame/scalable spill bytes, transition/support-call count, and the normal compile/link/load denominator.  A natural benefit, native replay result, or performance result is not asserted here and is not a Stage0 stopping condition.

## Registered failure sentinel

`BELOW_Q2_STOP__CHANGED_INTERFACE_OR_MANDATORY_COMPOSITION_OR_GENERIC_RA_WRAPPER`

This recommendation is for independent closing only.  It neither starts StageA/B nor claims that the witness has been executed.
