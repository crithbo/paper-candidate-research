# UNIQUE_OPPORTUNITY_FAMILY ledger

| ID | Signature | Status | Admission reason |
|---|---|---|---|
| F01 | `LLVM_SPLIT_STACK__PROLOGUE_MORESTACK__ARGUMENT_COPY_RETURN_BOUNDARY` | STRUCTURAL_DROP | Current ABI already fixes `__morestack`, required size/argument metadata, body entry and return behavior; residual is ordinary prologue/RA scheduling. |
| F02 | `LLVM_RISCV_ATOMICS_ABI__A6S_A7_MAPPING__ELF_ATTRIBUTE_LINK_BOUNDARY` | STRUCTURAL_DROP | Compiler selection and ELF attribute issue are mapping/configuration compatibility, not a fixed-guarantee non-controller construction. |
| F03 | `CLANG_ASAN_UAR__FAKE_STACK_PUBLICATION__RETURN_LIFETIME_MODE_BOUNDARY` | STRUCTURAL_DROP | Explicit instrumentation/runtime modes express the candidate tradeoff; any remaining placement choice is sanitizer tuning and changes diagnostic guarantee. |
| F04 | `LLVM_AARCH64_VOLATILE_REGISTER__IR_WRITE_FAKE_USE__REGALLOC_BOUNDARY` | STRUCTURAL_DROP | Current semantics insert a `FAKE_USE` for allocatable physical registers; residual is generic register allocation/liveness. |
| F05 | `LLVM_STACKSAVE_RESTORE__DYNAMIC_ALLOCA__EXCEPTIONAL_SCOPE_REWIND_BOUNDARY` | STRUCTURAL_DROP | The `stacksave/stackrestore` contract already names restoration; a proposal reduces to generic cleanup placement/CFG transformation. |

C01 was not counted because it is the explicit Wasm async same-family closure.
