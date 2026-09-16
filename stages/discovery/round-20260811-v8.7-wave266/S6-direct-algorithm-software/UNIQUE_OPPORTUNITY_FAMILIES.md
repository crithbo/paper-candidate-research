# GNU MO hash/offset layout closure

The exact object is a fixed logical catalog with contexts, plural variants and declared charset, read with stock GNU gettext lookup semantics. The official format fixes an increasing-lexicographic original-string table and a parallel translation table. Context and plurals have specified concatenated representations. The hash table merely contains indices into the sorted originals and may be absent, with binary search used instead.

A native-legal two-layout witness exists: `msgfmt --no-hash` versus a hashed file, or distinct legal alignments, can preserve all stock translation answers. Yet it is already documented native action/configuration freedom. The candidate joint constructor—choose hash size/table offsets/string placement—cannot alter the sorted logical table without changing lookup contract; retaining it leaves generic static hashing and byte-layout packing, or `msgfmt` option selection.

Natural route if needed: version-pinned GNU translation catalogs with stock lookup/result digest. Full cost would include `msgfmt` CPU/RSS/temp/bytes and lookup/parse CPU/RSS. None was run. Outcome: `STRUCTURAL_DROP`; no brief.
