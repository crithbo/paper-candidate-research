# SOURCE_COLLISION_MATRIX

| Surface | First-party current source | Establishes | Collision result |
|---|---|---|---|
| RVV ISA | [RISC-V ratified V specification](https://docs.riscv.org/reference/isa/unpriv/v-st-ext), observed 2026-08-11 | `vstart` restart semantics, precise trap constraints, FOF `vl`/interrupt behavior, non-idempotent memory restriction | Hardware already owns the atomic restart action. |
| RVV source/release | [RISC-V ISA manual source](https://github.com/riscv/riscv-isa-manual), latest release `riscv-isa-release-846efd1-2026-05-27` | Official provenance for current specification sources | Not an absence claim. |
| ABI | [RISC-V psABI 1.1 July 2026](https://riscv-non-isa.github.io/riscv-elf-psabi-doc/) | `vstart=0` at procedure entry/return; explicit nonzero must clear before call/return; vector CC variant rules | Directly rules out same-ABI interprocedural state carriage. |
| Intrinsics | [RVV intrinsic specification source](https://github.com/riscv-non-isa/riscv-rvv-intrinsic-doc/blob/main/doc/rvv-intrinsic-spec.adoc), observed 2026-08-11 | Intrinsic user model assumes `vstart=0`; positive use implementation-defined; compiler manages `vl`/`vtype` | No portable source-level positive-`vstart` constructor. |
| GCC | [GCC FOF `vl` handling patch](https://gcc.gnu.org/pipermail/gcc-patches/2026-January/706992.html) | Current compiler actively handles FOF-produced VL in its vsetvl path | Counters a claim that FOF VL is ignored. |
| LLVM/QEMU | [LLVM upstream](https://github.com/llvm/llvm-project), [QEMU upstream](https://github.com/qemu/qemu), observed 2026-08-11 | Current implementation/test and CPU-emulation entrypoints for a future finite replay | Neither is used to infer absence; a patch would be outside the admitted action. |

No future-work, issue, old documentation, or missing implementation is used to establish the result. The direct collision is normative ISA + current psABI, not a resource failure.

