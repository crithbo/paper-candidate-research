# Candidate-grade deep reviews

**D01 Zcmp.** LLVM current RISC-V frame lowering explicitly includes Zcmp/Xqccmp push/pop, CFA and callee-save accounting. A joint frame/RA objective is the existing frame-lowering action or generic coloring. `DROP__CURRENT_ABSORPTION`.

**D02 AArch64 LSE.** LLVM AtomicExpand already chooses late LL/SC where forward-progress constraints require it; LSE target selection uses a single instruction and outline atomics use the documented helpers. A same-contract joint construction is target feature/lowering choice, not a non-generic N2. `DROP__CURRENT_ABSORPTION`.

**D03 PowerPC prefixed forms.** LLVM has explicit prefixed instruction flags and MC encoding, but the current RA/form-size union and a target-specific non-generic state/guarantee could not be closed from first-party sources. `NOT_ADMITTED_UNFROZEN`.

**D04 Wasm tail calls.** Valid tail-call lowering is fixed by Wasm validation and stackification; changing stack effects changes the object, while scheduling is generic stackification. `DROP__SAME_OBJECT_FAILS_OR_GENERIC`.

No deep item supplied a complete target-specific exact/FPT/Pareto algorithm beyond the current strongest composition.
