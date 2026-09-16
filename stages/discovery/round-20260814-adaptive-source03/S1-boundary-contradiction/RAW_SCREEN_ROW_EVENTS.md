# RAW_SCREEN_ROW_EVENT records

| Row | Signature | Source-pinned native action promise | Primary disposition |
|---|---|---|---|
| C01 | `WASMTIME43_COMPONENT_ASYNC_ABI__FUTURE_STREAM_CONTINUATION__INSTANCE_LIFETIME` | Fixed Wasmtime 43+ component async ABI; choose continuation ownership/stack transition under identical async func/stream/future results. | STRUCTURAL_DROP |
| R01 | `LLVM_SPLIT_STACK__PROLOGUE_MORESTACK__ARGUMENT_COPY_RETURN_BOUNDARY` | Fixed split-stack function ABI; choose stacklet/prologue/argument transfer under same call/unwind behavior. | STRUCTURAL_DROP |
| R02 | `LLVM_RISCV_ATOMICS_ABI__A6S_A7_MAPPING__ELF_ATTRIBUTE_LINK_BOUNDARY` | Fixed RISC-V program/atomic semantics; choose mapping/attribute emission across compiler/linker. | STRUCTURAL_DROP |
| R03 | `CLANG_ASAN_UAR__FAKE_STACK_PUBLICATION__RETURN_LIFETIME_MODE_BOUNDARY` | Fixed ASan diagnostic semantics; choose fake-stack lifetime across return and runtime reporting. | STRUCTURAL_DROP |
| R04 | `LLVM_AARCH64_VOLATILE_REGISTER__IR_WRITE_FAKE_USE__REGALLOC_BOUNDARY` | Fixed AArch64 semantics and named physical register write; choose placement/liveness preservation of volatile register state. | STRUCTURAL_DROP |
| R05 | `LLVM_STACKSAVE_RESTORE__DYNAMIC_ALLOCA__EXCEPTIONAL_SCOPE_REWIND_BOUNDARY` | Fixed function/VLA/exception semantics; choose dynamic stack-region restoration across lexical and exceptional exits. | STRUCTURAL_DROP |

Every raw row maps to exactly one primary disposition. C01 is a same-family rescreen, not a new family.
