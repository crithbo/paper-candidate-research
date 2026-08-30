# Exact public anchor

| Field | Frozen value |
|---|---|
| Object | Fixed RISC-V medlow static ELF input-object set with relaxation annotations; same initialized data, symbols, external interfaces, ABI, and executable observable behavior |
| Stock oracle | Stock ELF loader plus program tests/observable output; the candidate emits a stock-readable ELF, not a custom format or reader |
| Architecture contract | RISC-V ELF psABI linker-relaxation specification, including one `gp` / `__global_pointer$` and the signed ±2 KiB GP-relaxation condition |
| Current upstream locus | LLVM `RISCVUsage.rst`; LLD `lld/ELF/Driver.cpp` and `lld/ELF/Arch/RISCV.cpp`, all observed at `main` on 2026-08-15 |
| Natural carrier | Zephyr Project v4.4.0 signed release tag `684c9e8`, restricted to its versioned RISC-V board/application source set at a later authorized Stage-0 route |
| Bottleneck-transfer hypothesis | After code generation supplies relaxable relocation groups, the fixed ±2 KiB GP window makes data layout / GP choice the constraint that determines which stock instruction rewrites are available. This is a hypothesis, not a measured claim. |

The anchor is public and versioned, but no source tree or benchmark was acquired.
