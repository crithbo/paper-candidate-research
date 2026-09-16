# Raw-screen row events

| exact family | native reader/oracle | initial global action | disposition |
|---|---|---|---|
| ELF `DT_RELR` packed relative relocations | ELF dynamic loader / ABI reader | encode relative relocation locations as RELR entries | STRUCTURAL_DROP |
| ELF GNU hash table | ELF dynamic loader | jointly assign dynsym/hash bucket/bloom/chain layout | NOT_ADMITTED_UNFROZEN |
| PE image `.reloc` base-relocation blocks | Windows PE loader | assign relocations to page blocks and type-offset slots | STRUCTURAL_DROP |
| Mach-O `LC_DYLD_CHAINED_FIXUPS` | dyld / LLVM Mach-O parser | jointly select page starts, pointer chains and imports | NOT_ADMITTED_UNFROZEN |
| PDB TPI/public-symbol hash streams | debugger / `llvm-pdbutil` reader | jointly assign records, stream pages and lookup hashes | NOT_ADMITTED_UNFROZEN |
| Wasm linking relocation custom sections | Wasm linker/validator | construct relocation records for linked code/data | STRUCTURAL_DROP |

All are distinct exact objects; none repeats ELF string tables or DWARF line tables. No result depends on missing implementation, performance result, hardware or AI readiness.
