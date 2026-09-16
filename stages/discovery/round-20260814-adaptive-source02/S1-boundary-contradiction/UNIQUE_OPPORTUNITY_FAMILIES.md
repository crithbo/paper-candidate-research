# UNIQUE_OPPORTUNITY_FAMILY ledger

| ID | Signature | Status | Why it survives or fails family-level admission |
|---|---|---|---|
| F01 | `LLVM_STACKMAP_PATCHPOINT__JIT_DEOPT_STATE_PUBLICATION__MACHINE_LOCATION_CONTRACT` | STRUCTURAL_DROP | Official contract already makes the runtime/client responsible for selected liveness and reconstruction; remaining layout choice is target-generic location allocation/metadata compaction. |
| F02 | `GLIBC_IFUNC__RESOLVER_TIMING__ELF_RELOCATION_CONSTRUCTOR_BOUNDARY` | STRUCTURAL_DROP | Official glibc contract explicitly allows different lazy/non-lazy timing and warns programs not to depend on it; a candidate either changes the object guarantee or is link/load configuration. |
| F03 | `WASM_COMPONENT_ASYNC_ABI__STACK_SWITCHING__CONTINUATION_INSTANCE_LIFETIME` | NOT_ADMITTED_UNFROZEN | Official component design specifies a route, but it is proposal-level and no one engine/runtime current union or target-specific mechanism is frozen. |
| F04 | `CLANG_MUSTTAIL__CLEANUP_SCOPE__TAILCALL_EXCEPTION_BOUNDARY` | STRUCTURAL_DROP | Current Clang rejects tail calls that skip cleanup; a legal residual is generic tail-merging/cost selection, not a distinct same-object N2. |
| F05 | `LLVM_GC_STATEPOINT__BASE_DERIVED_RELOCATION__EXCEPTIONAL_EDGE_SAFETYPOINT` | NOT_ADMITTED_UNFROZEN | Formal current interface exists, but a target runtime, complete source union and non-generic construction are not frozen. |

Dedup: the carry-forward coroutine rescreen is not counted as fresh. No mature cache/index/maintenance family was screened.
