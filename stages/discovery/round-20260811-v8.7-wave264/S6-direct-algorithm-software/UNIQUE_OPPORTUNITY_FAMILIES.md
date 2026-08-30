# Sphinx inverted-index closure

The fixed object is one document/analyzer/schema/query workload with stock Sphinx query results. A two-output action witness exists: equivalent source documents can be indexed in a bulk history or created as native indexes then merged, producing query-equivalent index contents with different segment and physical posting layouts.

The full current action union must include indexer build modes, merge, `--merge-dst-range`, document/attribute conflict semantics, and all ordinary layout/compression configuration. Official Sphinx documentation states that merge reads both input indexes and writes a result, with the documented update/duplicate-ID behavior. Therefore the witness is already a native composition.

The candidate N2 was a joint dictionary/posting block layout planner. It reduces to the general compressed inverted-index construction/contiguity/partitioning problem. Its possible guarantees are direct literature properties, not Sphinx-specific semantics. Outcome: `STRUCTURAL_DROP`; no brief.

If it had remained viable, a public versioned document corpus and query set would have been checked through stock query/digest equality, charging indexing/merge CPU/RSS/temp/index bytes and query/read latency/RSS. No such run occurred.
