# Unique opportunity family

## Mach-O chained-fixups global chain/start/import construction

**Exact object.** Fixed Mach-O segments/sections, pointer locations, bind/rebase targets, dylib ordinals, addends and loader-visible execution. Output is a valid `LC_DYLD_CHAINED_FIXUPS` representation with unchanged stock dyld/LLVM parser result. Byte identity is not required.

**Current complete action union.** `ld64.lld` provides `-fixup_chains` (chained fixups) and `-no_fixup_chains` (classic dyld opcodes). Current source rejects requested chains for non-PIC output, unsupported architectures, and `-preload`; the supported branch includes x86_64/x86_64h/arm64. The current writer/test surface covers the import format triad: inline import, 32-bit addend and 64-bit addend. Reader-side current LLVM representation makes the relevant whole action explicit: per-segment page starts, chains in data pages, bind/rebase targets, imports and pointer format.

**Minimal legal action-divergence witness.** On page P, pointers at offsets `a<b` with `b-a` encodable may be one chain `a→b` or two starts; a pointer on page Q necessarily starts a Q chain. This is legal multiplicity but not a residual: with fixed pointer locations, take every legal within-page next edge to minimize starts; a forced page/range break cannot be removed without relocating a pointer. Choosing extra starts weakly increases chain-start metadata and does not introduce information/guarantee. Import-format selection is already present in current writer behavior.

**Outcome.** `STRUCTURAL_DROP__FIXED_LAYOUT_FORCES_CHAIN_GRAPH__CURRENT_LINKER_COVERS_ENCODING_BRANCHES`. Any purported global optimization either changes section/pointer layout (changed object), makes an inferior discretionary break, changes dyld semantics, or is a local serialization/packing variant.
