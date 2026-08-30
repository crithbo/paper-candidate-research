# Independent Stage 0 confirmation — LLVM DWARF call-site reconstructibility

- Assignment: `STAGE0-C2-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-CONFIRM-V8.7`
- Role: independent confirmation sentry
- Decision: `CONFIRM_REVISE_ONCE`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Stage A/B authorization: `false` / `false`
- Scientific revision executed here: `false`

## Ruling

The PRIMARY's one-gate disposition is confirmed.  Present LLVM source makes a
post-allocation metadata-only claim untenable, but does not directly establish
that the complete current pipeline selects allocation actions to optimize a
call-site-reconstructibility/full-cost Pareto frontier.  A single static
revision is therefore warranted rather than PASS or scientific STOP.

The required gate remains exactly:

`SAME_MIR_TWO_PLAN_CLOBBER_WITNESS__TARGET_SPECIFIC_CALLSITE_FRONTIER`.

## Current-union attack

The native comparison must cover compatible LLVM configurations, rather than
silently composing alternative debug-location modes.  It includes the pinned
target allocator, coalescing/copy insertion, spill/reload, frame and unwind
pipeline; `LiveDebugVariables` where used; instruction-reference or VarLoc
`LiveDebugValues` as selected by the fixed target/options; and `DwarfDebug`
call-site parameter/entry-value emission.

This union is strong.  `LiveDebugVariables` explicitly updates variable
locations as values move between registers and stack slots during allocation.
Instruction referencing removes debug instructions during allocation and
rejoins value and physical-location data only afterwards; `LiveDebugValues`
recognizes copy-like, spill, restore and stack-clobber operations.  `DwarfDebug`
already constructs call-site parameter entries using forwarded-register and
clobbered-register-unit logic.  Consequently, a plan that only emits a better
expression after identical native code, tracks a spill more accurately, or
chooses an existing debug flag is directly absorbed.

No reviewed first-party source, however, demonstrates a target-specific
allocation-time solver selecting retain/copy/spill/rematerialization actions
for one fixed pre-RA MIR under a reconstructibility-vs-full-cost guarantee.
Post-RA propagation and call-site emission are subtractors, not proof of that
joint action optimization.  A generic exact RA/CP/ILP oracle remains a ceiling,
not an N2 mechanism.

## Conditions for the sole revision

The revision must, without changing source function, target/ABI, debug
contract or DWARF reader semantics:

1. pin one target/ABI and current LLVM source/options, and enumerate every
   legal allocation, coalescing/copy, spill/reload, frame, unwind,
   rematerialization and debug-expression action relevant to a fixed pre-RA
   MachineIR call-clobber trace;
2. provide two **complete native plans** for that identical MIR.  Both must
   preserve executable behavior, ABI, unwind, machine-code and DWARF validity;
   they must differ in pre/during-allocation native actions, not only metadata;
3. define valid call-site reconstruction against the fixed DWARF expression
   grammar.  An entry value is only legal under its documented register and
   unmodified-parameter limitations, so it cannot be used to erase a real
   clobber or spill obligation;
4. prove a bounded state/quotient preserves all future native actions,
   target-register overlap/clobber legality, debug-expression legality and all
   declared costs.  It must give an exact, FPT, or certified Pareto recurrence,
   an honest complexity bound, and a cap/no-gain boundary specific to this
   target/call-site model; and
5. freeze (but do not run) the Stage-A preclaim falsifier: exhaustive tiny-MIR
   plan enumeration, executable/ABI/unwind and `llvm-dwarfdump` checks,
   comparison to the full compatible LLVM union plus legal configuration grid,
   generic-oracle ceiling, natural corpus, and code+DWARF+compile/RSS/frame/
   runtime full cost.

## Boundaries and disposition

The static gate is finite.  Failure to implement it, obtain a corpus result,
or show a positive frontier is not a Stage-0 STOP reason.  In contrast, the
pre-registered scientific STOP applies if the two plans cannot differ in native
actions, collapse to ordinary allocator weighting/generic solving, or are
reproduced by the complete current union at equal information and full cost.

Latest-collision status is `SEARCH_BOUNDED_OPEN`; no transport or retrieval
failure was treated as evidence of absence.

## First-party evidence used

- [LLVM instruction-referencing documentation](https://llvm.org/docs/InstrRefDebugInfo.html): debug instructions are unlinked during allocation, then post-RA location information is joined; target hooks recognize copies, spills, restores and stack clobbers.
- [LLVM source-level debugging documentation](https://llvm.org/docs/SourceLevelDebugging.html): `DW_OP_LLVM_entry_value` is register-limited and its use by `LiveDebugValues`/`AsmPrinter` is bounded.
- [LiveDebugVariables source](https://llvm.org/doxygen/LiveDebugVariables_8cpp_source.html): virtual-register debug values are represented through allocation and updated on register/stack moves.
- [LiveDebugValues source](https://llvm.org/doxygen/LiveDebugValues_8cpp_source.html): current VarLoc and InstrRef propagation modes and their option surface.
- [DwarfDebug source](https://llvm.org/doxygen/DwarfDebug_8cpp_source.html): call-site parameter collection and clobbered-register-unit treatment.

