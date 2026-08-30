# Unique opportunity family — PDBx/mmCIF writer action depth

## UF-126-01

### Exact semantic object

A frozen wwPDB PDBx/mmCIF data block interpreted under the current PDB Exchange Dictionary: the data block identifier, categories, item values, loop rows, parent/child/key relationships, and all dictionary-validated values. The claim cannot weaken this to “same visual structure” or “same coordinates only”.

### Natural carrier

RCSB publishes real PDB entries in PDBx/mmCIF and related archive formats. The regularity hypothesis is repeated categories and locally repeated atom/residue/assembly values in real entries. It is only a hypothesis until a later authorized measurement; it is not treated as a positive compression result.

### Legal action catalog

1. Choose legal CIF lexical representation/whitespace and grouping of key-value versus loop syntax.
2. Choose category and item emission order where syntax/dictionary/consumer behavior permits.
3. Choose loop column order and row order only where they preserve all required semantic and consumer-observable ordering.
4. Choose a supported writer/output representation, including current archive alternatives such as BinaryCIF, if the exact semantic object and consumer contract permit it.
5. Apply a standard external compressor only as a full-cost baseline component, never as a novel writer action.

### Current strongest union

The current union includes: the wwPDB PDBx Python `PdbxReader`/`PdbxWriter` container/category writer path; wwPDB dictionary validation; the current wwPDB-supported parser/writer ecosystem listed in its software resources; archive-provided mmCIF/XML/BinaryCIF representations; and normal compression/reader costs. It is deliberately broader than one script or one writer default.

### Minimum action-divergence witness

No witness was frozen. The only named action is order/lexical/output representation selection. It either (a) is already a normal writer/encoder action, (b) changes an archive representation/consumer contract, or (c) risks changing order that a consumer exposes through parsed table order. No atomic nontrivial whole-writer operation outside the above union was identified.

### Status

`NOT_ADMITTED_UNFROZEN`. This is not a readiness-based DROP: implementation, experimental result, compute and AI capability were not considered. It simply lacks an auditable same-object union-external action certificate.
