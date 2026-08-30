# FIDELITY_CLOSURE_PLAN — FPMR raw

## Frozen object and action family

Same AArch64 program/call graph, AAPCS64 2025Q4 FP8 modal semantics, FPMR observable state and ABI behavior. The proposed N2 family is an interprocedural construction that chooses legal FPMR state-preservation/materialization around calls jointly with FP8 conversion regions; it may not alter ABI, FP8 exception/value semantics, caller/callee obligations, or replace the compiler with a generic solver.

## Fair comparator and full-cost boundary

Pin current LLVM AArch64 lowering/RA/call-frame/unwind union and compare against its deployable composition under the same ABI. Count compile CPU/RSS, code bytes, call-frame/save-restore instructions, static front-end/uop proxy, runtime cycles, and any FPMR state transitions.

## Finite Stage0 / StageA route

1. Pin ABI commit and LLVM revision; enumerate FPMR feature/ABI entry points and default/nondefault target flags.
2. Build a minimal two-call FP8 witness with fixed observable values/exceptions; inspect assembler, unwind and ABI conformance.
3. Falsify if stock current union already expresses the same joint action, or if a legal construction necessarily changes FPMR/FP8 ABI semantics.

## Claim ceiling

`FINITE_FIDELITY_GAP`: no current LLVM absence or performance claim is made. The 72-hour killer is source/assembly/ABI closure, not an experiment result.
