# RAW_SCREEN_ROW_EVENT records

This adaptive screen deliberately prioritized cross-phase compiler/runtime, ABI, ISA and protocol semantics rather than mature cache/index/maintenance constructors. Source snapshots were taken on 2026-08-14 from official documentation/upstream repositories.

| Row | Family signature | Frozen object and native action sketch | Result |
|---|---|---|---|
| R01 | `LLVM_COROUTINE__FRAME_LAYOUT__SUSPEND_RESUME_DESTROY_EXCEPTION_CLEANUP__FIXED_CPP20_SEMANTICS` | Same C++20 coroutine, suspend graph and exception behavior; choose a frame-field/lifetime/cleanup layout jointly across ramp, resume and destroy functions. | NOT_ADMITTED_UNFROZEN |
| R02 | `LLVM_EH__CLEANUP_SCOPE__LANDINGPAD_FUNCLET_UNWIND_TABLE__SAME_LANGUAGE_SEMANTICS` | Same IR and personality; share/outline cleanup paths and tables while retaining every exceptional edge and unwinder behavior. | STRUCTURAL_DROP |
| R03 | `WASM_EXCEPTION_TAG__THROW_CATCH_UNWIND__ENGINE_VALIDATOR_RUNTIME_BOUNDARY` | Same Wasm module/tag/value semantics; choose a compiled tag/handler representation across validator and runtime unwinder. | NOT_ADMITTED_UNFROZEN |
| R04 | `AARCH64_GCS__CALL_RETURN_STATE__DEBUGGER_UNWIND_CONTEXT_RESTORE` | Same AArch64 GCS process state; arrange expression-wrapper/control-stack transition and restoration. | STRUCTURAL_DROP |
| R05 | `LINUX_FUTEX2_WAITV__MULTIADDRESS_COMPARE_BLOCK__WAKE_PUBLICATION_ORDER` | Same wait-vector values, memory order and return semantics; choose registration/ordering of a multi-address wait. | STRUCTURAL_DROP |
| R06 | `AARCH64_PAUTH__LANGUAGE_ABI_POINTER_PUBLICATION__AUTHENTICATION_BOUNDARY` | Same ABI-visible pointer and authentication guarantee across compiler/runtime transitions. | EXCLUDED |
| R07 | `LLVM_SHADOWCALLSTACK__CALL_RETURN_SHADOW_STATE__UNWIND_COMPATIBILITY` | Same call graph and unwind behavior with shadow-call-stack state. | EXCLUDED |

## First-party source snapshot

- LLVM coroutine specification: <https://llvm.org/docs/Coroutines.html>. It defines ramp/resume/destroy functions, frame state, suspension/destroy preconditions, the cleanup path and current `CoroEarly/CoroSplit/CoroElide/CoroCleanup` pipeline.
- LLVM EH specification: <https://llvm.org/docs/ExceptionHandling.html>; Clang cleanup IR generation: <https://clang.llvm.org/docs/LLVMExceptionHandlingCodeGen.html>.
- WebAssembly official specification/source and test suite: <https://github.com/WebAssembly/spec>; official WABT feature matrix: <https://github.com/WebAssembly/wabt>.
- LLDB current AArch64 GCS documentation: <https://lldb.llvm.org/use/aarch64-linux.html>.
- Linux futex2 documentation: <https://www.kernel.org/doc/html/latest/userspace-api/futex2.html>.
- Clang current pointer-authentication and shadow-call-stack documentation: <https://clang.llvm.org/docs/PointerAuthentication.html>, <https://clang.llvm.org/docs/ShadowCallStack.html>.
