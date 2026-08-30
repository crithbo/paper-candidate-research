# UNIQUE_OPPORTUNITY_FAMILIES

## Dedup result

The six raw signatures are distinct at object/problem level from the Source01–04 S1 closures recorded in `plan.md`, `registry.yaml`, and the immediately preceding S1 handoffs. In particular, none is LLVM coroutine frame layout, Wasm component/engine async ABI, PAuth, WebAssembly EH/SjLj, or a mature cache/index-maintenance constructor.

| Signature | Domain | Canonical object and invariant | Why this is not merely a name change |
|---|---|---|---|
| `LINUX_RSEQ__PREEMPT_SIGNAL_ABORT__POST_COMMIT_PERCPU_UPDATE__FIXED_RSEQ_ABI` | runtime / ABI | A fixed rseq descriptor, user update trace, migration/signal cut and post-commit observation. | The object is the kernel-mediated preemption/signal abort boundary, not a coroutine or generic atomic operation. |
| `ELF_TLSDESC__COMPILER_RELOCATION__LINKER_GNU2_TLS_TAG__LOADER_RESOLUTION_COST__FIXED_ELF_ABI` | compiler / ABI / loader | Fixed ELF symbols, relocations and loader-visible TLS result. | It couples compiler relocation emission with linker/loader legality, not ordinary register allocation. |
| `RISCV_ZICFILP__ELP_STATE__INDIRECT_BRANCH_TARGET_LPAD__FIXED_CFI_SEMANTICS` | ISA / compiler | Fixed RISC-V CFI state transition and target legality. | The guarantee is landing-pad CFI, not prior Zicfiss shadow-stack work. |
| `JVM_CONDY__BOOTSTRAP_RESOLUTION_PUBLICATION__CLASSFILE_CONSTANT_POOL__FIXED_JVMS_RESULT` | compiler / runtime protocol | A fixed class file and JVMS dynamic-constant value-or-error observation. | The producer/VM contract is per-constant dynamic resolution, not generic class loading. |
| `LINUX_FUTEX_WAITV__MULTIWAIT_CHECK_SLEEP__WAKE_INDEX_VISIBILITY__FIXED_FUTEX2_UAPI` | runtime protocol | Fixed futex words, check-before-sleep and wake-index result. | The object is multi-wait atomic observation, not io_uring or scheduler policy. |
| `AARCH64_GCS__CALL_RETURN_GUARDED_STACK__UNWIND_TRANSITION__FIXED_AAPCS64_SEMANTICS` | ISA / ABI / compiler | Fixed guarded-stack call graph, return and unwind observations. | It is a GCS state contract, not ARM SME/ZA or generic prologue tuning. |

