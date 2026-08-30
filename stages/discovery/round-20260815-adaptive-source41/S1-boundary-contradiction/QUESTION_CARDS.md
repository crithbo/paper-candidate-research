# Evidence-qualified question cards

## QC01 — LLVM statepoint relocation on exceptional edges

- RQ / identity: RQ01 / `LLVM_GC_STATEPOINT__EXCEPTIONAL_EDGE_RELOCATION__SAME_DEOPT_AND_EH_SEMANTICS`.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; current LLVM Statepoints documentation and current source loci `SRC01`–`SRC03`. A natural managed-runtime corpus is an explicit Stage 0 closure debt, not a claimed result.
- Same-object contract: fixed LLVM GC statepoint, deoptimization, stackmap, and LLVM exception/unwind semantics for the same managed-language call graph; no collector-policy, ABI, or language-exception change.
- Candidate endpoint / route: `COMPILER_TOOL / N1`; a representation/construction for relocation information through exceptional joins, with a formal well-formedness invariant and full-cost dimensions (IR size, compile CPU/RSS, stackmap bytes, relocation/spill/frame instructions, and runtime cycles).
- Counterfactual: if viable, a front end could express a rethrow/cleanup path with relocations while retaining the same statepoint and exception endpoint, rather than rejecting or changing the program representation.
- Non-generic discriminator: `SRC01` states that a rethrow path with relocations presently has no representation; `SRC03` shows specialized statepoint relocation/spill machinery. The proposed action is not an external solver: it must preserve base/derived association and token provenance at exceptional joins.
- Current locus and contrary evidence: `SRC01` current documentation explicitly reports exceptional-edge relocations/rethrows as broken; `SRC02`/`SRC03` are current lowering loci. `SRC06` is historical contrary/design context only. No claim is made that no paper or implementation elsewhere exists.
- Minimum falsifier: a current LLVM path or direct same-object paper already represents a multi-predecessor rethrow with associated relocations under unchanged semantics; or a candidate representation necessarily changes `invoke`/unwind semantics.
- Finite closure: Stage 0 pins a current LLVM commit, checks default/non-default `GCStrategy::UseRS4GC`/statepoint front-end paths, constructs one `invoke → landingpad/cleanup → resume` IR witness, and performs a bounded direct-paper collision check. Failure narrows or drops this raw; it does not imply a main result today.
- Closure debts: complete source union, direct collision/genealogy, exact public runtime carrier, native verifier/test route, detailed cost protocol, Q2 calibration. Owner: `STAGE0`; max decisive questions: 3.
- Front-end disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for C0: `YES`; claim ceiling: `STATIC_RQ_AND_FINITE_CLOSURE_ONLY`.

## QC02 — Patchpoint/stackmap frame state

- RQ / identity: RQ02 / `LLVM_PATCHPOINT_STACKMAP__FRAME_STATE_ENCODING__FIXED_RUNTIME_RESUMPTION`.
- Current official subtractor: `SRC04` documents direct frame-index stackmap encoding and an existing alloca-fold optimization that avoids a register or stack slot.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_MECHANISM_ABSORBS_PRIMITIVE`. The remaining proposal is an ordinary frame-layout/metadata cost reformulation with no target-specific new action or guarantee frozen.

## QC03 — CUDA conditional graph commitment

- RQ / identity: RQ03 / `CUDA_CONDITIONAL_GRAPH__STATIC_TOPOLOGY__DEVICE_CONDITION_EXECUTION`.
- Current official subtractor: `SRC05` fixes conditional-body topology at construction, limits update to described APIs/parameters, and makes the device evaluate the condition after dependencies are met.
- Disposition: `EXCLUDED_BEFORE_RAW__CONFIGURATION_OR_CONTROLLER_ONLY`. No union-external native graph action was frozen without changing topology/semantics.

## QC04 — AArch64 MOPS precise-memory region formation

- RQ / identity: RQ04 / `AARCH64_MOPS__FIXED_MEMCPY_MEMMOVE_SEMANTICS__PRECISE_REGION_FORMATION`.
- Status: `SOURCE_CLOSURE_QUEUE`. The RQ is complete, but no versioned official MOPS semantics plus current LLVM lowering locus was closed within the already-run bounded routes. This is a retrieval/closure gap, not a scientific negative result.
- Precommitted next questions (maximum 3): current Arm MOPS semantics/feature version; current LLVM AArch64 MOPS lowering source/flags; one direct compiler-paper subtractor. Resume only under a later frozen assignment with an external evidence delta.
