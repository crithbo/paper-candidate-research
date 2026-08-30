# Source / collision matrix — Wave294

| family | primary current source | strongest subtraction / result |
|---|---|---|
| AArch64 PAuth | [LLVM PAuth](https://llvm.org/docs/PointerAuth.html), [Clang PAuth ABI](https://clang.llvm.org/docs/PointerAuthentication.html) | IR, attributes, backend and authenticated relocations already encode fixed-schema actions: `DROP` |
| Wasm EH/SjLj | [TargetMachine](https://llvm.org/doxygen/WebAssemblyTargetMachine_8cpp_source.html), [ExceptionInfo](https://llvm.org/doxygen/WebAssemblyExceptionInfo_8h_source.html), [backend files](https://llvm.org/doxygen/dir_96ba75976c22f2500bfbc06f8c4c2b70.html) | mode is a contract flag; fixed-mode EH/stackification already current union: `DROP` |
| async coroutine | [LLVM Coroutines](https://www.llvm.org/docs/Coroutines.html) | context, frame, resume and tail-call construction are stock semantic lowering: `DROP` |
| Swift async | [AArch64 frame source](https://llvm.org/doxygen/classllvm_1_1AArch64FrameLowering.html) | overlapping async context union: raw only |
| Itanium/DWARF EH | [LLVM EH](https://llvm.org/docs/ExceptionHandling.html) | generic personality/unwind/table union: raw only |
| ARM64EC | no deep source required | thunk/adaptor is wrapper: excluded |

Latest search is bounded and not a claim of literature absence.
