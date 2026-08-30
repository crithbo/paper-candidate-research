# Unique opportunity families

## U1 — LLVM DWARF abbreviation dictionary, scope, and code assignment

- Exact object: LLVM-produced DWARF abbreviation tables and corresponding DIE byte stream for a fixed decoded DIE forest and attributes.
- Candidate whole action: jointly partition eligible DIE scopes into abbreviation tables, choose legal dictionary declarations, assign nonzero codes, and rewrite each DIE's abbreviation reference while preserving all reader-visible DIE semantics.
- Current known union: structural declaration creation/dedup through `DIEAbbrev::Profile` and `DIEAbbrevSet`, native declaration emission, ULEB code emission, and the producer's existing CU/type-unit/debug-mode paths. The full path/flag union is not yet source-enumerated.
- Minimal legal divergence: within one table containing at least 128 distinct legal declarations, swap the code assigned to a high-use declaration with one assigned to a low-use declaration, then rewrite every corresponding DIE code and retain identical declarations. This is reader-legal if code 0 remains reserved and all references/table forms are updated. It only establishes encoding freedom, not a research residual.
- Potential N2 proposition: a joint scope/dictionary/code constructor minimizing total abbreviation bytes plus DIE-code bytes under DWARF legality, with a nontrivial approximation/complexity guarantee.
- Admission state: `NOT_ADMITTED_UNFROZEN`. The visible witness can collapse to ordinary weighted code ordering; no source-closed proof yet establishes an LLVM-union-external, non-routine global action or a valid formal increment.
