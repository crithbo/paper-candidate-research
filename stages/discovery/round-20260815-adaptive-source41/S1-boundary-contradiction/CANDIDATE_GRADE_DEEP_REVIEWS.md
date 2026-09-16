# Candidate-grade deep reviews

## D01 — LLVM statepoint exceptional-edge relocation

**Frozen action and guarantee.** The only admissible candidate is an LLVM-IR-native exceptional-edge relocation representation/construction that keeps base/derived relocation association through a cleanup/rethrow join. It must preserve the same statepoint/deoptimization stackmap interpretation, exception/unwind behavior, and managed program result. It cannot alter collector policy, insert an external runtime wrapper, or replace the compiler with a generic state-space solver.

**Current mechanism and contrary evidence.** LLVM’s current Statepoints documentation says an exceptional path that rethrows while carrying relocations has no representation and is broken in ToT (`SRC01`). Current `RewriteStatepointsForGC.cpp` creates explicit relocates (`SRC02`) and current `StatepointLowering.cpp` contains specialized relocation-map/spill paths with a documented PHI precision limitation (`SRC03`). This is positive locus evidence, not an absence claim beyond the documented unsupported case. The 2016 llvm-dev record (`SRC06`) is historical contrary context, not current-absence proof.

**Same-object survival trace.** A source `invoke` may create a statepoint; a normal edge obtains a relocation; an exceptional edge enters cleanup; a later rethrow must preserve the same base/derived relation. The frozen current documentation says the rethrow-with-relocations representation fails. A candidate must either make that exact four-node trace well formed without changing its statepoint/EH endpoint, or be falsified immediately.

**Fair strongest comparator.** Pinned current LLVM statepoint utility transformation plus current lowering/stackmap emission, with the same GC strategy, exception model, target, and stackmap consumer. The exhaustive default/non-default union remains a bounded Stage 0 debt; it cannot be substituted by an arbitrary “use another GC/runtime” comparison.

**Finite killer.** Within 72 hours of an authorized Stage 0: pin LLVM revision; construct a one-function `invoke → cleanup/landingpad → resume` statepoint IR witness; use verifier/IR inspection plus emitted stackmap/unwind inspection. Kill if the witness is already representable by stock current LLVM, a candidate changes the exception/stackmap contract, or a direct same-object representation paper absorbs it.

**Disposition.** `NOT_ADMITTED_UNFROZEN__DEEP_CLOSURE_DEBT`. It is a legitimate evidence-qualified raw with a finite N1 shape, but no `PROPOSE_STAGE0` is made: direct paper collision, current feature/strategy union, natural runtime carrier and Q2 calibration remain open.
