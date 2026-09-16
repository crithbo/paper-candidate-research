# RAW_SCREEN_ROW_EVENT records

| Row | Primary signature | Anchor and same-object action promise | Primary disposition |
|---|---|---|---|
| C01 | `LLVM_CXX20_COROUTINE_FRAME_LAYOUT_EXCEPTION_CLEANUP` | Fixed C++20 switched-resume coroutine; joint frame field/lifetime layout across ramp/resume/destroy under identical completion and exception behavior. | STRUCTURAL_DROP |
| R01 | `LLVM_STACKMAP_PATCHPOINT__JIT_DEOPT_STATE_PUBLICATION__MACHINE_LOCATION_CONTRACT` | Same LLVM IR patchpoint/statepoint and client runtime contract; choose legal live-value locations/shadow region under equivalent deoptimization reconstruction. | STRUCTURAL_DROP |
| R02 | `GLIBC_IFUNC__RESOLVER_TIMING__ELF_RELOCATION_CONSTRUCTOR_BOUNDARY` | Same dynamically linked ELF program and selected implementation; choose resolver/relocation timing while retaining documented constructor/call behavior. | STRUCTURAL_DROP |
| R03 | `WASM_COMPONENT_ASYNC_ABI__STACK_SWITCHING__CONTINUATION_INSTANCE_LIFETIME` | Same component export/async result semantics; choose continuation representation/lifetime between component ABI and core Wasm. | NOT_ADMITTED_UNFROZEN |
| R04 | `CLANG_MUSTTAIL__CLEANUP_SCOPE__TAILCALL_EXCEPTION_BOUNDARY` | Same C++ function/ABI and observable cleanup/exception behavior; choose mandatory tail call placement around cleanups. | STRUCTURAL_DROP |
| R05 | `LLVM_GC_STATEPOINT__BASE_DERIVED_RELOCATION__EXCEPTIONAL_EDGE_SAFETYPOINT` | Same managed-language IR/runtime semantics; jointly encode base/derived relocation state across safepoints and exceptional edges. | NOT_ADMITTED_UNFROZEN |

Each raw row has exactly one primary disposition. `C01` is a same-family rescreen, not a new opportunity family.
