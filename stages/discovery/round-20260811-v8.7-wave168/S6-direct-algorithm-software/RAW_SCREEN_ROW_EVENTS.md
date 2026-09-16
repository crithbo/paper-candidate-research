# Raw-screen row events

| event | current primary evidence | conclusion |
|---|---|---|
| ABI/reader pin | Apple documents `dyld_chained_fixups_header`; LLVM current Mach-O reader exposes chained targets, segments, page starts and pointer-chain iterator. | Stock loader/parser semantics and action coordinates frozen. |
| linker flag union | Current LLVM Mach-O `Options.td` exposes `-fixup_chains` and `-no_fixup_chains`; current `Driver.cpp` checks PIC, x86_64/arm64 and `-preload` constraints. | Complete user-visible chain/classic mode branch and relevant non-default boundaries frozen. |
| import-format union | Current lld test covers `DYLD_CHAINED_IMPORT`, `_ADDEND`, and `_ADDEND64` selected by addend ranges, inspected by `llvm-objdump --macho --chained-fixups`. | Import encoding branch is not an absence gap. |
| global witness | Two same-page pointers within encodable next range and a third pointer on another page form two possible visual chain partitions. | Maximal legal edge inclusion minimizes starts for fixed locations; alternate breaks only add starts/metadata. |
| final | No same-output union-external global constructor remains. | STRUCTURAL_DROP |
