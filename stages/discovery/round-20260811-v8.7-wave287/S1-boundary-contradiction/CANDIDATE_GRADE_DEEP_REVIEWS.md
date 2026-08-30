# Candidate-grade deep review — Wave287

## Current upstream reality

The ratified [Zicfiss specification](https://docs.riscv.org/reference/isa/unpriv/unpriv-cfi.html) specifies shadow-stack push/pop/check, x1/x5 usage, compressed forms, regular-stack plus shadow-stack return handling, and support for unwinding/switching. It explicitly identifies non-leaf functions that spill the link register as the normal prologue/epilogue case.

LLVM's current [ShadowCallStack documentation](https://clang.llvm.org/docs/ShadowCallStack.html) exposes hardware Zicfiss via `-fcf-protection=return`; the upstream [Zicfiss LLVM review](https://reviews.llvm.org/D156549) includes shadow-stack and tail-call lowering/test material. [RISCVFrameLowering](https://llvm.org/doxygen/classllvm_1_1RISCVFrameLowering.html) includes `emitSCSPrologue`, CFI and frame/callee-save paths. GCC's current [Zicfiss commit](https://gcc.gnu.org/pipermail/gcc-cvs/2025-January/416093.html) says it generates shadow-stack instructions in the prologue and supports `SIBCALL_RETURN`. The current [Linux Zicfiss documentation](https://www.kernel.org/doc/html/next/arch/riscv/zicfiss.html) provides the ELF/psABI/runtime boundary.

## Forced divergence / N2 test

The only native action divergence visible from the same function is protected non-leaf prologue+epilogue versus a leaf/tail-call path with no needed link-register spill. It is not a forced candidate divergence: the ISA makes the choice depend on link-register use, and LLVM/GCC already lower the same condition, including tail calls. Changing call graph, tail-call legality, CFI guarantee, or using a flag/controller changes the object. A whole-trace call-placement scheduler therefore reduces to generic shrink-wrap/call scheduling or existing compiler action composition; no target-specific exact/FPT/Pareto state/guarantee survives.

**Decision:** `DROP__CURRENT_ZICFISS_LLVM_GCC_FRAME_TAILCALL_UNION_ABSORBS_OBJECT`. The decision is based on current action/guarantee absorption, not missing hardware, implementation, positive result, resources or AI readiness.

## Finite 72-hour killer

A future different object must pin LLVM/GCC/binutils/kernel, exhibit one public same-callgraph trace whose required Zicfiss action is not expressible by the current prologue/tailcall/frame union, pass assembler/disassembler/verifier/ELF-unwind-runtime checks and show strict target-specific Pareto/guarantee under CPU/RSS/text/reloc/normal+shadow-frame/prologue/runtime denominator. Kill on current-union expression, changed CFI/ABI, generic shrink-wrap/solver, invalid tailcall/unwind, or no strict point. No test was run.
