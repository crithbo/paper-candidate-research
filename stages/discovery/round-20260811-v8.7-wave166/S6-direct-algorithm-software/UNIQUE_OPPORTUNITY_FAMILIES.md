# Unique opportunity families

| family | fixed same object | public natural carrier route | full-cost denominator | outcome |
|---|---|---|---|---|
| ELF RELR | same dynamic-relative relocations and loader result | versioned GNU/LLVM-linked open binary inputs | link/load CPU-wall-RSS, RELR/ELF bytes, temp, startup | STRUCTURAL_DROP |
| ELF GNU hash | same exported symbols and loader lookup behavior | versioned public shared-library build | link/load CPU-wall-RSS, dynsym/hash bytes, temp, lookup/startup | NOT_ADMITTED_UNFROZEN |
| PE `.reloc` | same image and rebased loader semantics | versioned open PE build | link/load CPU-wall-RSS, reloc bytes, temp, startup | STRUCTURAL_DROP |
| Mach-O chained fixups | same binds/rebases and dyld-visible image | versioned open Darwin-targeted build | link/dyld CPU-wall-RSS, fixup bytes, temp, launch | NOT_ADMITTED_UNFROZEN |
| PDB TPI/public hash | same CodeView types/symbols and debugger lookup | versioned LLVM/COFF build | link/pdbutil CPU-wall-RSS, PDB bytes, temp, debug lookup | NOT_ADMITTED_UNFROZEN |
| Wasm relocation sections | same linked module semantics/validator result | versioned open wasm object build | link/validate CPU-wall-RSS, relocation bytes, temp | STRUCTURAL_DROP |

Only a union-external complete constructor with an action witness could advance. No such action was closed in this breadth pass.
