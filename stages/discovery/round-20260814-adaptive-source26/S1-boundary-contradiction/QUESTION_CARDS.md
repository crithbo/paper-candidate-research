# Source26 question cards

## QC-L01 — AArch64 MOPS region construction

- Source divergence seed ID/path: `S01` / `DIVERGENCE_SEED_POOL.md`; engine/cluster: `BISOCIATION_STRUCTURAL_TRANSFER` / AArch64 compound-memory.
- Exact public identity: LLVM current AArch64 lowering of `memcpy`, `memmove`, and `memset` to FEAT_MOPS operations; current documentation observed 2026-08-14. Carrier: `IMPLEMENTATION_CARRIER_ONLY` (LLVM tests and public C/C++ programs are a future closure route, not evidence already obtained).
- Network-security exclusion: PASS.
- Problem: a source-level memory intrinsic leaves late target legality/cost decisions to the backend, which can affect code shape. Proposed insight: a contribution would require a whole-region target algorithm with the same values, faults, ABI, and unwinding—not merely a selection flag.
- Exact semantics / same object: fixed AArch64 program, `memcpy/memmove/memset` semantics, target/ABI, and observable fault/exception contract. Type/route: `COMPILER_TOOL` / possible N2. Claim endpoint: target-native MOPS-region action; initial full cost: compile CPU/RSS, code bytes, branch/scalar/MOPS instruction mix, frame/unwind effects, and runtime.
- Opportunity anchor: Arm’s A64 ISA guide is the planned architectural anchor; bounded search only confirmed generic A64 guide, not a version-pinned MOPS semantic chapter.
- Current native union: LLVM current `AArch64SelectionDAGInfo.cpp` exposes hidden `-aarch64-use-mops`, default `true`, for these three memory intrinsics; official LLVM search also identifies `aarch64-mops.ll` and related tests.
- Strongest contrary: LLVM commit `a3569fac...` describes the flag and scalar/library fallback when disabled. This directly absorbs a claim that MOPS lowering itself is absent, but does not prove a stronger region algorithm absent.
- What remains: only an unspecified joint region construction. It has no frozen action skeleton distinct from existing lowering/threshold paths, no natural versioned carrier, and no primary-paper collision closure.
- Minimum falsifier / finite closure: source-pin MOPS legality and LLVM threshold/IR paths; give two same-information legal constructions for one versioned C/C++ corpus; then subtract target-specific compiler literature. This is finite but not completed.
- Required-field audit: INCOMPLETE (precise architecture anchor, natural carrier, complete pass union, action skeleton, and direct-paper collision unresolved).
- Identity relation: FRESH sketch, not an accepted family. Disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`; C0: NO.

## QC-L02 — RISC-V Zfa fixed-contract lowering

- Source divergence seed ID/path: `S02` / `DIVERGENCE_SEED_POOL.md`; engine/cluster: `PROBLEM_REFRAMING` / RISC-V FP form.
- Exact public identity: LLVM current RISC-V target handling of the ratified Zfa 1.0 additional floating-point instructions under a fixed RISC-V ABI and IEEE-style observable floating contract. Carrier: `IMPLEMENTATION_CARRIER_ONLY` (riscv-arch-test is a future small legal-oracle route).
- Network-security exclusion: PASS.
- Problem: Zfa supplies immediate, min/max, round-to-integer, conversion, move, and comparison forms; choosing a form must preserve the specified numerical/exception contract. Proposed insight: a contribution would need a target-specific joint algorithm, not a different `-march` spelling.
- Exact semantics / same object: fixed program, ABI, enabled extension set, rounding/exception outcome, and target ISA. Type/route: `COMPILER_TOOL` / possible N2. Claim endpoint: a legal Zfa/base-form construction; full cost: compile CPU/RSS, text bytes, instruction count/uops, spills and runtime.
- Opportunity anchor: ratified Zfa 1.0 specification, which states the additional instruction classes and dependence on F.
- Current native union: LLVM’s current RISC-V Usage guide records Zfa as supported and documents target variation via `-march`, including extension strings and experimental-extension behavior.
- Strongest contrary: current upstream already owns the relevant feature enablement and target lowering surface; a claim that Zfa forms are unavailable is contradicted. No primary paper or source-pinned instruction-selection pass table was obtained to decide whether any non-generic joint construction remains.
- What remains: a possible algorithm is unspecified and risks reducing to cost-table or instruction-selection tuning; neither is admissible.
- Minimum falsifier / finite closure: pin LLVM and GCC Zfa lowering/tests, freeze exact `-march`/ABI and a public architectural test slice, then show two legal actions with a target-specific guarantee beyond the current composition.
- Required-field audit: INCOMPLETE (complete source union, strongest direct paper, natural carrier, and non-generic action skeleton unresolved).
- Identity relation: FRESH sketch, not an accepted family. Disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`; C0: NO.

