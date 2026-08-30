# Exact public anchor

Selected anchor identity: LLVM IR `callbr` used for Clang/GCC-style inline `asm goto` with output and label constraints, current LLVM documentation observed 2026-08-15.

- LLVM Language Reference, `callbr` section: <https://llvm.org/docs/LangRef.html>.
- Clang Language Extensions, `ASM Goto with Output Constraints`: <https://clang.llvm.org/docs/LanguageExtensions.html>.

The IR contract fixes a fallthrough destination and a finite set of indirect label destinations; label constraints are permitted only with `callbr`. The LangRef additionally limits ordinary `callbr` use to inline `goto` assembly or selected intrinsics. These sources are anchors, not a current-absence claim.
