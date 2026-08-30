# Candidate-grade depth red-team

Official current Sphinx documentation describes native index merging: `indexer --merge DSTINDEX SRCINDEX`, optional `--rotate`, and destination-range filtering. It explicitly says a merge reads both source indexes and writes the result. The resulting handling of duplicate document IDs and old keywords is part of the fixed native semantics, so a fair comparator includes the complete merge/configuration union rather than a single bulk build.

The minimal two-layout witness is real but absorbed by that union. A planner over postings/dictionary partition, contiguity and compression has no special Sphinx action or guarantee; the same formulation is directly addressed by the inverted-index construction/compression literature. Recasting it as generic compression, packing or ILP is expressly excluded.

Finite falsifier: source-pin Sphinx, create two stock-query-equivalent indexes for one frozen corpus/query set, replay bulk/incremental/merge modes, charge build/merge/read/query/RSS/bytes, then reject on union replay or generic guarantee. The static collision already makes the narrow claim structurally invalid. **Status: `STRUCTURAL_DROP`.**
