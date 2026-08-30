# Source and collision matrix

| primary/official source | frozen support | action-space effect |
|---|---|---|
| [Apple `dyld_chained_fixups_header`](https://developer.apple.com/documentation/kernel/dyld_chained_fixups_header) | Header includes imports/start offsets and formats. | Authoritative native metadata contract. |
| [LLVM current Mach-O reader](https://www.llvm.org/docs/doxygen/Object_2MachO_8h_source.html) | Chained fixups are pointer chains in data pages with segment/page-start/target state. | Freezes loader/parser action coordinates. |
| [LLVM current `Driver.cpp`](https://codebrowser.dev/llvm/lld/MachO/Driver.cpp.html) | Current flag resolution and PIC/architecture/preload gates. | Freezes default/non-default chain mode gates. |
| [LLVM `Options.td`](https://llvm.googlesource.com/llvm-project/lld/+/517e171d5bd3f493e5ec99a6a39db5663f6511d5/MachO/Options.td) | `-fixup_chains` and `-no_fixup_chains` native interface. | Absorbs configuration-level mechanism. |
| [LLVM chained-fixups source test](https://sources.debian.org/src/llvm-toolchain-16/1%3A16.0.6-15~deb11u2/lld/test/MachO/chained-fixups-addend.s) | Tests all three import/addend formats with stock parser inspection. | Absorbs import-layout encoding variant. |

Latest collision/current-source cutoff: 2026-08-11. No issue, future-work or unverified absence assertion is used.
