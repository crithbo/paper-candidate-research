# Source and collision matrix

| source | primary/official support | family effect |
|---|---|---|
| [ELF gABI](https://gabi.xinuos.com/elf.pdf) | Defines dynamic `DT_RELR` table processing. | RELR is a native standard encoding, not a new residual. |
| [LLVM lld release notes](https://releases.llvm.org/7.0.0/tools/lld/docs/ReleaseNotes.html) | Documents `--pack-dyn-relocs=relr`. | Confirms current linker-family packed-relocation action. |
| [Microsoft PE Format](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format) | Defines `.reloc` 4KiB blocks, type/offset slots and padding. | Format partitions full page-block action. |
| [LLVM Mach-O object source documentation](https://www.llvm.org/docs/doxygen/Object_2MachO_8h_source.html), [lld Mach-O docs](https://lld.llvm.org/MachO/index.html) | Defines chained-fixup reader entities and current compatible linker locus. | Writer union still requires source/config closure. |
| [LLVM PDB format](https://llvm.org/docs/PDB/index.html), [llvm-pdbutil](https://www.llvm.org/docs/CommandGuide/llvm-pdbutil.html) | Defines stream/hash structure and native reader/writer diagnostic tool. | Writer union still requires closure. |
| [Wasm specifications](https://webassembly.org/specs/), [dynamic-linking convention](https://webassembly.p2hp.com/docs/dynamic-linking/index.html) | Separates core validation and tool-convention relocation/linking behavior. | No independent same-object metadata constructor. |

Latest-collision/current-source cutoff: 2026-08-11. No future-work, issue, or unverified absence claim was used.
