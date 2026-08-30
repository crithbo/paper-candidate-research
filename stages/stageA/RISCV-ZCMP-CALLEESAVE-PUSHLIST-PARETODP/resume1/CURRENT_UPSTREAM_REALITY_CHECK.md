# Current upstream reality check

- LLVM commit: `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`
- Target: `riscv32-unknown-elf`, RV32IMAC+Zcmp, ILP32, O2
- Source parity: `13/13` decisive blobs
- Executable parity: exact local source build, hashes retained
- Current-union executable audit: `PASS`

Current source exposes ordinary GPR register allocation (greedy/basic/fast), copying/coalescing/split/spill/reload, target cost and hint controls, fixed psABI callee-saved registers, `RISCVMachineFunctionInfo::getPushPopKind/isPushable`, fixed CSR order and the s10/s11 exception, Zcmp rlist and four list-relative stack adjustments, native residual slots, FrameLowering CFI, the save/restore-libcall branch, late POP+RET to POPRET/POPRETZ conversion, pseudo expansion and the native assembler/linker/unwind readers.

The target pipeline runs pre-RA pseudo expansion, standard register allocation, post-RA handling, prologue/epilogue insertion, late PushPop before final pseudo expansion, then encoding. `RISCVPushPopOptimizer` consumes a pre-existing legal POP adjacent to `PseudoRET`; it does not choose a pre-RA identity mapping or construct a multi-path Pareto frontier. Conversely, the current allocators can already select the candidate's best witness point, and the union includes that point. The only admissible residual is therefore an executable natural function for which the frozen global bounded constructor yields a native point absent from all 18 current arms under the same information and full-cost denominator.

No current-source absence, transport failure or lack of a formal guarantee is itself counted as empirical headroom. `SEARCH_BOUNDED_OPEN` remains the literature ceiling; this document closes current implementation reality, not novelty.
