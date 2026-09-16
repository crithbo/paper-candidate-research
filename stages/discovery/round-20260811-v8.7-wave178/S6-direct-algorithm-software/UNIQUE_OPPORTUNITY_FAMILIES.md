# Unique opportunity family

## PDB TPI/IPI plus GSI/PSI/public-hash stream construction

**Frozen same object.** Identical debug type records, ID/type references, source checksum/string references, live public/global symbols, addresses/segments and native debugger query outcomes. The reader contract is stock DIA/LLVM PDB parsing/query semantics; an admissible writer may change internal record order, stream indices and MSF block placement only while rewriting every dependent reference and preserving all type/symbol/address answers.

**Hypothesized complete N2.** A joint dependency-aware type-record/topological index assignment plus public/global record ordering, fixed-format hash serialization and MSF stream/block placement that optimizes a stated query/size/write-cost objective with an approximation, exact or parameterized guarantee.

**Minimal legal witness.** Two independent, structurally distinct type records and two live public symbols can be assigned different internal stream positions only if all TypeIndex, symbol offset, GSI/PSI and MSF references are regenerated. This is a format-legality witness, not proof that the current producer union lacks this action.

**Disposition.** `NOT_ADMITTED_UNFROZEN__CURRENT_LLD_WHOLE_OUTPUT_CONSTRUCTOR_FOUND_BUT_COMPLETE_CURRENT_CROSS_WRITER_AND_CONFIGURATION_UNION_NOT_CLOSED`. lld already performs type-index remapping/dedup inputs, deterministic public/global ordering and native hash/stream construction. The available primary evidence does not establish the complete Microsoft/reference writer, incremental/type-server and all lld/LLVM option union under a current immutable source pin, so a union-external conclusion would be speculative.

