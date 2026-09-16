# UNIQUE_OPPORTUNITY_FAMILY ledger

| ID | Signature | Dedup / same-object decision | Canonical disposition |
|---|---|---|---|
| F01 | `LLVM_COROUTINE__FRAME_LAYOUT__SUSPEND_RESUME_DESTROY_EXCEPTION_CLEANUP__FIXED_CPP20_SEMANTICS` | Fresh compiler/runtime semantic seam after registry/history check; not a cache or ordinary constructor. | NOT_ADMITTED_UNFROZEN |
| F02 | `LLVM_EH__CLEANUP_SCOPE__LANDINGPAD_FUNCLET_UNWIND_TABLE__SAME_LANGUAGE_SEMANTICS` | Fresh exact object, but current EH lowering already exposes the required cleanup/exception constructs; residual is generic CFG/table compaction. | STRUCTURAL_DROP |
| F03 | `WASM_EXCEPTION_TAG__THROW_CATCH_UNWIND__ENGINE_VALIDATOR_RUNTIME_BOUNDARY` | Fresh formal/runtime object; official spec and official validation/interpreter assets exist. | NOT_ADMITTED_UNFROZEN |
| F04 | `AARCH64_GCS__CALL_RETURN_STATE__DEBUGGER_UNWIND_CONTEXT_RESTORE` | Different from prior SME/Zicfiss/CET lanes, but actual action is debugger support/wrapper state repair. | STRUCTURAL_DROP |
| F05 | `LINUX_FUTEX2_WAITV__MULTIADDRESS_COMPARE_BLOCK__WAKE_PUBLICATION_ORDER` | Fresh protocol primitive; contract is explicitly atomic compare-and-block. | STRUCTURAL_DROP |

Historical exclusions: PAuth was covered by prior architecture-state work; ShadowCallStack is a contained reapplication of prior shadow-stack state families. They do not count as accepted unique families.
