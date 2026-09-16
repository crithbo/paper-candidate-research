# Unique opportunity family

## F1 — joint DWARF v5 `.debug_names` planner

**Same-object contract.** For a fixed set of DIEs, names, CU/TU membership, references, and debug semantics, generate a standards-conforming `.debug_names` section accepted by stock readers. The decoded lookup result and verifier-visible relationships must be unchanged; no DIE edits, name removal, reader alteration, external compressor, or after-the-fact section patcher is allowed.

**Hypothesized whole action.** Jointly choose legal name-index ordering, hash-bucket placement, abbreviation-table entries/codes, entry-pool layout, and regenerated offsets/references across CU/TU and local/global index structures. This would exceed a single frequency sort only if it has a frozen algorithmic objective or guarantee over bytes, lookup cost, or both.

**Minimal legal action-divergence witness.** Two distinct names with distinct hashes can occupy different legal positions in their respective name/hash-table records while their corresponding entry-pool offsets and all affected references are regenerated. A section that preserves the same DIE/name lookup mapping but changes table offsets/ULEB encodings is representation-distinct. This is a legality witness only: it does not establish a union-external planner or a benefit.

**Why not admitted.** The current LLVM writer/linker action union has not been commit-pinned or exhaustively enumerated, including all debug-name mode flags and writer back ends. The native `AccelTable` abstraction already includes names, entries, hashes, buckets, and debug-names abbreviations, so an apparent layout choice could be directly absorbed. No primary direct-collision closure has separated a nontrivial planner from existing accelerator-table construction, frequency ordering, or ordinary emitter work.

**Natural route.** LLVM Test-Suite and public DWARF-bearing C/C++ debug builds can supply a versioned natural carrier. A later gate would preserve DIE/name content and compare `llvm-dwarfdump --debug-names --verify` plus stock lookup behavior; no artifact was downloaded or run here.
