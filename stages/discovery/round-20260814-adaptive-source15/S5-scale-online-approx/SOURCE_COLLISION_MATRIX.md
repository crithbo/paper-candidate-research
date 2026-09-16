# Hardware-semantic source / collision matrix — Source15

| signature | fixed semantics and stock oracle | current union / collision | two-plan residual | full-cost / finite falsifier | disposition |
|---|---|---|---|---|---|
| `RISCV_ZCMP__CALLEE_SAVE_PUSHLIST__FIXED_MACHINEIR_ABI_ISA_CONSTRUCTION` | Fixed LLVM MachineIR, RISC-V Zcmp ABI/ISA and LLVM verifier/assembler/disassembler oracle. | Active Stage0 `RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP`. | Not reopened. | Existing Stage0 contract owns it. | `EXCLUDED_ACTIVE_IDENTITY` |
| `AARCH64_SVE_SME__ZA_STATE_ABI__FIXED_LLVM_IR_TO_NATIVE_CONSTRUCTION` | Fixed LLVM IR/AArch64 feature set with stock verifier/assembler/linker/replay oracle. | Active/hold SVE-SME joint stateful codegen exceptional closure. | Not reopened. | Existing frozen fidelity plan owns it. | `EXCLUDED_ACTIVE_OR_HOLD_IDENTITY` |
| `LLVM_X86_APX__EGPR_REX2_EVEX_ABI_FRAME_CONSTRUCTION` | Fixed LLVM MachineIR/x86 ABI/APX semantics and stock LLVM/binutils/unwind oracle. | Existing frozen x86 frame/register contract in registry. | Not reopened. | Existing full-cost ledger owns it. | `EXCLUDED_ACTIVE_OR_HOLD_IDENTITY` |
| `LLVM_DWARF__CALLSITE_RECONSTRUCTIBILITY__DEBUG_SEMANTIC_CONSTRUCTION` | Fixed executable, unwind/DWARF observable semantics and stock toolchain oracle. | Revision1 closing active. | Not reopened. | Existing revision owns its sole scientific revision. | `EXCLUDED_ACTIVE_IDENTITY` |
| `LLVM_AMDGPU__OCCUPANCY_RESOURCE_CODEGEN__FIXED_MIR_SEMANTICS` | Fixed MIR/target semantics with LLVM verifier, codegen and occupancy/full-cost oracle. | Existing exact AMDGPU recovery R3D. | Not reopened. | Existing recovery assignment owns input and cost scope. | `EXCLUDED_ACTIVE_OR_BLOCKED_IDENTITY` |
| `NVPTX_CUDA__ASYNC_COPY_TMA__FIXED_KERNEL_SEMANTIC_MAPPING` | Fixed CUDA kernel semantics, PTX/cubin/native execution boundary. | Current async-copy/TMA/compiler primitive union; any timing threshold or issue order is a controller. | No union-external semantic action found. | Would charge compile/resource/synchronization/code size/runtime; killer is direct primitive equivalence. | `DROP_CURRENT_UNION_ABSORPTION` |

## Common fairness condition

The comparison must retain the same ISA/ABI, input program, hardware feature set and observable output—not replace the hardware target or weaken the semantic contract.  No ordinary scheduler, configuration or generic formal checker is counted as a residual.
