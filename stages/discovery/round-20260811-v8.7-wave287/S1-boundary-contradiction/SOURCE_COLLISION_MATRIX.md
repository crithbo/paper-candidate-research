# Source / collision matrix — Wave287

| facet | primary source | conclusion |
|---|---|---|
| ISA | [ratified CFI/Zicfiss](https://docs.riscv.org/reference/isa/unpriv/unpriv-cfi.html) | x1/x5 push/pop/check, compressed forms and return semantics are native actions |
| LLVM | [ShadowCallStack docs](https://clang.llvm.org/docs/ShadowCallStack.html), [Zicfiss review](https://reviews.llvm.org/D156549), [FrameLowering](https://llvm.org/doxygen/classllvm_1_1RISCVFrameLowering.html) | hardware Zicfiss, prologue/tailcall/CFI/frame union already exists |
| GCC | [GCC r15 Zicfiss commit](https://gcc.gnu.org/pipermail/gcc-cvs/2025-January/416093.html) | prologue and sibling/tail-call return support are current competitor actions |
| runtime | [Linux Zicfiss documentation](https://www.kernel.org/doc/html/next/arch/riscv/zicfiss.html) | ELF/psABI support in full same-object contract |
| paper collision | no separate verified same-object joint N2 paper required | direct current compiler-union absorption is decisive; bounded search is not novelty proof |
