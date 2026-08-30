# Candidate-grade deep reviews — Wave294

## D01 AArch64 PAuth — `DROP`

Current [LLVM PAuth documentation](https://llvm.org/docs/PointerAuth.html) defines IR intrinsics, signed constants, call operand bundles and function attributes used to control backend codegen; it also specifies authenticated Mach-O and ELF relocation representations. The [Clang arm64e ABI documentation](https://clang.llvm.org/docs/PointerAuthentication.html) fixes the ABI-visible signing schemes and keys. A sign-before-call versus authenticated relocation path is a legal action difference only when the ABI schema differs; holding it fixed, it is current lowering. Any purported joint placement is generic scheduling/cost policy or changes the security contract. `DROP__CURRENT_ABI_IR_BACKEND_MC_UNION`.

## D02 WebAssembly EH/SjLj — `DROP`

Current [WebAssembly target source](https://llvm.org/doxygen/WebAssemblyTargetMachine_8cpp_source.html) exposes EH/SjLj and legacy-EH flags (legacy defaults true); current [exception representation](https://llvm.org/doxygen/WebAssemblyExceptionInfo_8h_source.html) records catch-region nesting for CFG stackification, and the backend inventory includes LateEHPrepare and Emscripten SjLj lowering. A mode change is a flag/guarantee change, not same-object action; within a fixed mode, catch layout is the stock structured-EH pipeline. No target-specific algorithm or strict action divergence remains. `DROP__CURRENT_EH_MODE_AND_STACKIFICATION_UNION`.

## D03 async coroutine context — `DROP`

Current [LLVM coroutine documentation](https://www.llvm.org/docs/Coroutines.html) fixes async-context argument position, tail-called continuation, values live across suspension stored in the coroutine frame, projection function and resume intrinsic. The current state graph is therefore already part of semantic lowering; choosing a different context/frame layout either changes the ABI/continuation contract or is generic frame allocation/scheduling. `DROP__CURRENT_ASYNC_LOWERING_UNION`.

For D01--D03, a finite StageA killer would pin compiler/runtime versions; take a public test; require ABI/validator/verifier/object/unwind equivalence; and show a strict target-specific Pareto/guarantee after compile CPU/RSS, text/object/reloc bytes, frame/context/handler state and runtime are charged. Kill on existing-union expression, changed guarantee/mode/ABI, generic solver or absent strict point. Nothing was run.
