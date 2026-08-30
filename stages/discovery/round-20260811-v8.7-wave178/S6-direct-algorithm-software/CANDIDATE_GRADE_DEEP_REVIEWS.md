# Candidate-grade deep review

## PDB type/public hash stream joint constructor — NOT ADMITTED

### Current native action catalog

| component | source-established action | same-object implication |
|---|---|---|
| lld COFF PDB producer | accepts CodeView/debug records, rewrites type indices and string references, merges TPI/IPI, gathers live public symbols, then commits PDB | arbitrary record relocation must update all dependent references |
| TPI/IPI builder | records append with a type hash and index offsets; finalization writes fixed-modulus type hash data and creates the hash stream | a candidate cannot count a new per-record hash or simple record ordering as N2 |
| GSI/PSI/public builder | public symbols are name-sorted; public/global symbol records and hash buckets are built with fixed native serialization, within-bucket lexical sort and stream offsets | a candidate must subtract the present whole GSI/PSI action, not only a public-record loop |
| PDB/MSF builder | finalizes and commits named, DBI, TPI, IPI and GSI streams through one layout | changing stream order/block placement is a cross-stream action, not an emitter patch |

### Action-divergence test

The legal witness requires at least two independent type records and two public symbols whose internal locations are swapped while all TypeIndex, symbol-offset, public/global bucket and MSF references are regenerated. lld's existing construction already does the required category of remapping and sorting. The candidate would therefore need a stronger, precisely formal global choice—such as a dependency-aware assignment with a joint query/space guarantee—that cannot be expressed by the union of current lld and the reference producer. The latter union is not yet frozen.

### Full cost and natural route

A valid Stage A carrier would be a versioned, open-source LLVM/Windows-targeted C++ build corpus with corresponding PDBs. Oracle: `llvm-pdbutil` queries plus a stock Windows debugger/DIA query route, matching type, name, address and source-checksum results. The ledger must include link/PDB production CPU/RSS, PDB bytes, temporary disk/RSS, and symbol/type query CPU/RSS/latency. No measurements were run.

### Finite 72-hour killer / fidelity closure

1. Pin immutable current commits for LLVM lld, LLVM PDB/CodeView and Microsoft PDB-format/reference materials; enumerate `/debug`, `/pdb*`, type-server, incremental and PDB page-size related controls as applicable.
2. Build a small publicly sourced PDB with interdependent TPI/IPI indices, duplicate candidates, live public/global symbols and source checksums. Reconstruct all references under an explicitly specified global action.
3. Reject immediately if stock lld/reference writer already exposes the same whole action, any debugger-visible query differs, the action only varies hash/packing parameters, or no nontrivial approximation/exact/FPT guarantee exists.

The closure is finite, but current cross-writer union and immutable source pins are incomplete. No brief is warranted.

