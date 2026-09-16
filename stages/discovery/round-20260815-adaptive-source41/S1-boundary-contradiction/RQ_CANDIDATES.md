# Source41 RQ candidates

## RQ01 — LLVM GC statepoint exceptional relocation

- Seed: S01; type hypothesis: `COMPILER_TOOL / N2`.
- Same-object versions before evidence:
  1. With a fixed managed call graph and deoptimization/exception semantics, can statepoint placement and relocation live ranges be constructed jointly with a target-specific cost guarantee?
  2. Can a construction preserve all statepoint and exceptional-edge observables while reducing relocation/frame cost without becoming generic register allocation?
- Selected RQ: version 1.
- Boundary: same LLVM statepoint semantics, same runtime/deoptimization output; excludes GC policy, custom collector changes, and generic liveness solver wrappers.
- Earliest falsifier: current LLVM/runtime already makes the proposed joint decision directly, or the construction needs changed stackmap/exception semantics.
- Primary / fallback evidence routes: LLVM LangRef/source + a primary managed-runtime paper / official LLVM release/source history only if the primary transport fails.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ02 — LLVM patchpoint/stackmap frame-state construction

- Seed: S03; type hypothesis: `COMPILER_TOOL / N2`.
- Same-object versions before evidence:
  1. Under fixed patchpoint/stackmap and unwind observables, can placement and frame-state encoding be jointly constructed with a target-specific validity/cost guarantee?
  2. Does the fixed metadata endpoint expose a non-generic frame-layout action unavailable to independent patchpoint placement and PEI?
- Selected RQ: version 1.
- Boundary: same stackmap/deoptimization and unwind semantics; excludes a metadata postprocessor, an external assembler, or generic packing.
- Earliest falsifier: prescribed semantics make the action only an existing frame-layout cost model or direct current pass composition.
- Primary / fallback evidence routes: current LLVM StackMaps/Patchpoint docs/source + original patchpoint/statepoint literature / LLVM source test suite.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ03 — CUDA conditional graph launch/update commitment

- Seed: S05; type hypothesis: `SYSTEM_ARCHITECTURE / N2`.
- Same-object versions before evidence:
  1. With a fixed CUDA graph and kernel-visible results, does conditional-node state admit a native construction that changes update/rebuild grouping without changing launch semantics?
  2. Can conditional graph commitments be constructed with an explicit graph-native guarantee rather than selected by a launch controller?
- Selected RQ: version 2.
- Boundary: same CUDA graph node and kernel-result semantics; excludes host policy, launch selection, and graph rebuild wrappers.
- Earliest falsifier: official API exposes only launch configuration/update policy rather than a native graph action.
- Primary / fallback evidence routes: NVIDIA CUDA Programming Guide/runtime API docs + official samples / current CUDA release notes.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ04 — AArch64 MOPS precise memory-region lowering

- Seed: S07; type hypothesis: `COMPILER_TOOL / N2`.
- Same-object versions before evidence:
  1. For fixed `memcpy`/`memmove` semantics and target feature set, can legal MOPS region formation jointly account for exception/fault boundaries and code cost?
  2. Is there a target-specific Pareto construction over MOPS forms and protected region boundaries that preserves native behavior?
- Selected RQ: version 2.
- Boundary: same source program and C/C++ memory behavior; excludes changed fault semantics, ordinary instruction-cost tuning, and a generic scheduler.
- Earliest falsifier: MOPS lowering is wholly expressed by an existing direct pass/form choice, or the premise requires weakening behavior.
- Primary / fallback evidence routes: Arm MOPS documentation + LLVM AArch64 lowering source / GCC source and current Arm ACLE documentation.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.
