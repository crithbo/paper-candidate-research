# Discovery log — S1 boundary / contradiction, Wave 12

**Assignment:** `DISCOVERY-S1-20260809-V8.6-WAVE12`  
**Cutoff:** 2026-08-09  
**Method:** accepted Discovery v2/v8.1 plus calibrated v8.6 `FIDELITY_CLOSURE_PLAN` admission (`6 TP / 0 FN / 6 TN / 0 FP`). The TLS-blocked two-axis v8.2r2 method was not used.

## Scope and non-inference

This is Discovery only. No implementation, checker construction, experiment, benchmark, Stage 0/A/B directory, registry update, or claim-bearing observation was made. A missing native interface would have been admissible if the exact semantic object and same-function guarantee were frozen and a finite, auditable closure plan survived collision review. It is not a DROP reason by itself.

Excluded before search: active or previously resolved PB/Git/Rocks/S4/S1 objects; prior Wave 1/3/4/6/8/10 objects; and all renamed replays. Serverless periodic work was not retained: no provider-native same-object action and no finite acquisition path were established.

## Source-led scouts

### Scout A — MLIR side-effect contract versus transformation legality

The upstream MLIR rationale says that implicit behaviour not reflected in SSA data flow cannot freely be reordered/eliminated/introduced, explicitly records that non-local control flow lacks proper modelling, and directs operations with effects to `MemoryEffectsOpInterface` / `ConditionallySpeculatable`. The current implementation returns `nullopt` when effects are unknown, rather than treating them as no effect. This is a real source/semantic boundary, not a fabricated fault.

Initial same-object hypothesis: an effect-completeness refinement could use operation-level contract evidence to decide transformation legality for MLIR programs whose effects are presently unknown or coarse.

It does **not** survive strongest-union subtraction. Ratte already supplies composable semantics, deterministic executable MLIR programs and reference interpreters; DESIL supplies UB elimination, lowering-path search and differential checking for silent MLIR errors; and the 2026 MLIR verifier directly tests semantic equivalence of transformed program pairs across `mlir-opt`, MLIR-AIR and MLIR-AIE. The residual would only be a heuristic/pre-filter/controller around those mechanisms unless a new sound action and natural corpus are first shown. No such union-external atomic N1/N2 action was established. **DROP: direct absorption / no action-gap certificate.**

### Scout B — solver proof output interface versus external checking

cvc5 officially emits Alethe, but documents format-mode restrictions and only partial theory support. This is a genuine proof-interface coverage boundary, and an absent adapter/checker would be a finite fidelity gap rather than an automatic STOP.

It was not promoted because the natural carrier and contribution freeze would overlap the excluded proof-certificate/PB object family: no distinct same-function action was identified outside existing proof production, proof-format translation, and external checking. Any proposal would amount to a format wrapper or renamed certificate pipeline. **DROP: prohibited object overlap; no independent action gap.**

### Scout C — storage-upgrade format compatibility

The 2026 NSDI UpFuzz paper is a same-object, natural data-format-upgrade study with an artifact. It was used as a collision check rather than a seed for a renamed proposal. No new legal action outside upgrade compatibility testing/fuzzing was identified without switching storage object or weakening the compatibility contract. **DROP: direct same-object collision.**

## Decision

`COMPLETE_ZERO_PROPOSALS`. Zero is deliberate: the only mature boundary found (MLIR effect contracts) is already covered by a fair, current strongest union, while the remaining leads either overlap excluded certificate work or collide directly. No brief is emitted, so no fidelity status is assigned. There is no resource blocker and no scientific claim about the infeasibility of the broader areas.

## Primary sources consulted

1. [MLIR: Side Effects & Speculation](https://mlir.llvm.org/docs/Rationale/SideEffectsAndSpeculation/) (upstream rationale; accessed 2026-08-09).
2. [MLIR current `SideEffectInterfaces.cpp`](https://mlir.llvm.org/doxygen/SideEffectInterfaces_8cpp_source.html) (upstream implementation; accessed 2026-08-09).
3. [Ratte: Fuzzing for Miscompilations in Multi-Level Compilers Using Composable Semantics](https://www.doc.ic.ac.uk/~afd/papers/2025/ASPLOS-Ratte.pdf) and [artifact](https://zenodo.org/records/14768651) (authors’ paper/artifact, 2025).
4. [DESIL: Detecting Silent Bugs in MLIR Compiler Infrastructure](https://xgdsmileboy.github.io/files/paper/oopsla25.pdf) (authors’ OOPSLA 2025 paper).
5. [Practical Formal Verification for MLIR Programs](https://arxiv.org/abs/2605.01124) (authors’ 2026 paper).
6. [cvc5 Alethe proof-output documentation](https://cvc5.github.io/docs/cvc5-1.1.2/proofs/output_alethe.html) (official documentation).
7. [UpFuzz: Detecting Data Format Incompatibility Bugs during Distributed Storage System Upgrade](https://www.usenix.org/conference/nsdi26/presentation/han) (NSDI 2026 paper/artifact page).

All web checks were performed on 2026-08-09 and limited to paper originals, author artifacts, or upstream/official documentation.
