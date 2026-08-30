# Unique opportunity families — Wave294

| ID | exact object / current union | natural route and oracle |
|---|---|---|
| U01 | fixed arm64e/AArch64 function/ABI, pointer-auth schema, relocations/unwind and observable pointer/call semantics; LLVM PAuth IR/backend/MC and ABI | LLVM PAuth tests; assembler/object authenticated-relocation/disassembler + ABI oracle |
| U02 | fixed Wasm module, EH proposal mode, thrown values/catches and observable semantics; Wasm EH/SjLj flags, EH passes, stackification, MC/runtime | LLVM Wasm EH tests; wasm validator/runtime and deterministic module oracle |
| U03 | fixed async coroutine signature/context/suspends/resume and observable semantics; coro async lowering, continuation tail call, frame construction, target call/frame code | LLVM coroutine tests and public Swift/Clang async examples; verifier/IR/object/runtime oracle |
| U04 | Swift async ABI context/frame | U03 union; raw only |
| U05 | Itanium/DWARF EH personality/table/frame | LLVM EH/target unwind union; raw only |
| U06 | ARM64EC thunk | wrapper/adaptor excluded |
