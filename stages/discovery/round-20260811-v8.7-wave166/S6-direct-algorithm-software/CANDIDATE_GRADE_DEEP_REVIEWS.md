# Candidate-grade deep reviews

## 1. ELF `DT_RELR` packed relative relocations — STRUCTURAL_DROP

**Same object/oracle.** Fixed set of dynamic relative relocation locations and unchanged ELF loader-visible image. The ELF gABI defines `DT_RELR` and the RELR table; stock dynamic loader success and relocated memory/image equivalence would be the oracle.

**Current union and witness.** The current lld family exposes packed dynamic relocation modes including RELR; RELR itself is the standardized complete encoding action for relative relocation positions. A smallest witness is a word-address relocation followed by eligible nearby words, permitting an address entry plus bitmap entries. Choosing bitmap packing is exactly the native standardized representation; changing relative locations changes linked layout/object. A further “global packing” is external compression or generic packing. `STRUCTURAL_DROP__STANDARD_NATIVE_ENCODING_ABSORBS_ACTION`.

**72-hour killer/full cost.** Pin lld commit and `--pack-dyn-relocs` modes; freeze a public shared-library input; validate loader-equivalent relocation set; reject if the action is the existing RELR codec or changes section/symbol layout. Ledger: link/load CPU-wall/RSS, ELF/RELR bytes, temp, and startup relocation time. Not run.

## 2. PE `.reloc` base-relocation table — STRUCTURAL_DROP

**Same object/oracle.** Fixed PE image relocation sites/types and same successful Windows loader rebasing semantics. Microsoft specifies `.reloc` blocks by 4KiB Page RVA, with type/offset slots and 32-bit-aligned blocks.

**Action witness.** Two relocations in a page form one legal block; a relocation in another page forces a separate Page-RVA block. Slot ordering/padding do not create a new global constructor: page ownership is format-defined, type/offset carries the exact address operation, and `ABSOLUTE` already pads blocks. Reassigning sites across pages changes the image. `STRUCTURAL_DROP__FORMAT_PARTITIONS_COMPLETE_ACTION`.

**72-hour killer/full cost.** Pin lld-link/MS linker and all relocation flags; use an open PE input with two pages; stock-load/rebase and compare relocation targets; reject if only slots are sorted/padded or image layout changes. Ledger: link/load CPU-wall/RSS, `.reloc` bytes, temporary space and load latency. Not run.

## 3. Mach-O chained fixups — NOT_ADMITTED_UNFROZEN

**Same object/oracle.** Fixed Mach-O bind/rebase targets and unchanged dyld-visible execution. LLVM's current Mach-O reader exposes chained fixups with per-segment page starts, pointer chains and import table; `llvm-otool --chained-fixups` is a stock inspection oracle.

**Candidate/witness.** Two fixup pointers on one page and one on another permit different legal chain starts/next offsets while preserving targets. This is a real multi-page state witness. Yet current `ld64.lld`/ld64 writer paths, target/version flags, chain format choices and all default/non-default behavior were not exhaustively source-pinned. No union-external complete action is claimed. `NOT_ADMITTED_UNFROZEN`.

**72-hour killer/full cost.** Pin ld64.lld and Apple-compatible target/version flags; enumerate chained-fixup writer actions; use a small public Darwin-target input and LLVM parser/dyld oracle; reject if stock writer expresses it, target/image semantics change, or only pointer order changes. Ledger: link/dyld CPU-wall/RSS, fixup/import bytes, temp and launch. Not run.

## 4. PDB type/public-symbol hash streams — NOT_ADMITTED_UNFROZEN

**Same object/oracle.** Fixed CodeView type and public-symbol records with same debugger lookup and matching PDB/executable fields. LLVM describes PDB streams, TPI hash stream, public stream and serialized hash tables; `llvm-pdbutil` reads/writes/investigates PDBs.

**Candidate/witness.** Two distinct type records referenced by public symbols permit different stream-page and hash bucket assignments while retaining record identity. It is a static action witness, but no source-pinned current lld-link/PDB writer union—stream allocation, type deduplication, hash construction and relevant flags—was completed. The putative mechanism could be ordinary hash-table construction or PDB emitter work. `NOT_ADMITTED_UNFROZEN`.

**72-hour killer/full cost.** Pin LLVM/lld-link commit and `/DEBUG`/PDB options; enumerate PDB writer stream/hash operations; use a public COFF project and `llvm-pdbutil` equivalence; reject if stock writer covers action, debug lookup changes, or only serialization/order differs. Ledger: link/pdbutil CPU-wall/RSS, PDB bytes, temp and debugger lookup. Not run.

## Breadth structural rows

**ELF GNU hash — NOT_ADMITTED_UNFROZEN.** GNU-hash necessarily couples dynamic-symbol order, bloom filter, bucket and chain state. The natural carrier and loader oracle are clear, but this pass did not enumerate current GNU ld/lld complete hash construction, all `--hash-style` modes, ordering constraints and relevant export/version flags. A complete global action cannot be asserted outside that union.

**Wasm relocation custom section — STRUCTURAL_DROP.** Current Wasm specification separates core module validation from tool-convention linking; relocation custom records are linker metadata. Dynamic-linking conventions exclude code relocations for PIC and use imports/globals for external addresses. Thus a candidate changes linker/module arrangement or only emits relocation records; it is not an independent same-object global constructor under a stock module contract.

## Conclusion

No row satisfies a union-external whole N2/N1 plus finite fidelity closure. The three `NOT_ADMITTED_UNFROZEN` rows retain explicit finite routes; no brief is produced.
