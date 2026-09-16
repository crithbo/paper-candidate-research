# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Source and Collision Audit

- Mode: `PRIMARY`
- Cutoff: 2026-08-11
- Result: `SEARCH_BOUNDED_OPEN__NO_DIRECT_FATAL_FOUND`
- Current-source conclusion: `DISCOVERY_ACTION_GAP_CONTRADICTED__ALGORITHM_GAP_MAY_REMAIN`
- Scope: bounded Stage-0 search; no universal absence claim.

## Frozen package integrity

The Discovery manifest self hash is `31EB791E2F8560CEC270B961124808706150A5151235E60409CD274C135C136D`. All eight listed entries were independently recomputed and passed. The brief and handoff matched the assignment hashes exactly.

## Authoritative format and API sources

1. [Apache Arrow Columnar/IPC format](https://arrow.apache.org/docs/format/Columnar.html), current format page checked 2026-08-11. It defines Schema, DictionaryBatch, RecordBatch, 8-byte message alignment, initial/use-before-key ordering, dictionary delta concatenation, replacement, and stream interleaving.
2. [Apache Arrow C++ IPC API](https://arrow.apache.org/docs/cpp/api/ipc.html), v25.0.0 page checked 2026-08-11. It documents `IpcWriteOptions`, default replacement, optional compatible deltas, nested restriction, stream-ignored unification, `WriteRecordBatch`, `WriteTable(max_chunksize)`, and read/write statistics.
3. [Apache Arrow integration-testing contract](https://arrow.apache.org/docs/format/Integration.html). It supplies an authoritative cross-implementation equality pattern; the candidate uses the pinned C++ reader as its primary oracle.
4. [Apache Arrow repository](https://github.com/apache/arrow), Apache-2.0 upstream. Latest repository commit returned at cutoff and used for file retrieval: `42694575d0219f6a3a78b1f344bb071a60df6a4e`.

## Current source paths, blobs, and findings

| Path | Blob SHA | Checked behavior |
|---|---|---|
| `cpp/src/arrow/ipc/writer.cc` | `263689a648d08b6a37ab5bde2e717e2f2a9a5e9f` | `WriteTable` only applies a maximum chunk size, but public `WriteRecordBatch` accepts arbitrary caller batches. `WriteDictionaries` implements no-event on pointer/value equality, prefix delta when enabled and non-nested, otherwise replacement for streams. |
| `cpp/src/arrow/ipc/options.h` | `254a4693866e9be5c2b4b0a8d77392ad70c235b2` | Complete options: 64-bit allowance, recursion, alignment, legacy framing, codec, minimum savings, threads, delta flag, file unification, metadata version. |
| `cpp/src/arrow/ipc/dictionary.cc` | `bb5539f2b4bb6137cbd4cbfda43db6204dff234d` | Field-path-to-id mapping, reader dictionary memo append/replace, and per-batch dictionary collection. |
| `cpp/src/arrow/ipc/reader.cc` | `47ea70e43faca6218de4094c9d3ed75d916b48d0` | Stream decoder requires initial dictionaries, accepts interleaved dictionary messages after initialization, and counts new/delta/replacement events. |
| `cpp/src/arrow/ipc/writer.h` | `aefb59f3136e4c98419799eb31faf9700fc6efd2` | Public arbitrary record-batch writing, fixed-maximum table chunking, and writer statistics. |

The repository was accessed successfully through the GitHub connector. A separate `git ls-remote` attempt failed with Windows Schannel credentials; no source absence or scientific inference was drawn from that transport failure.

## Complete current equivalent-action catalog

- Caller supplies any schema-equal `RecordBatch` sequence; this already chooses arbitrary cut positions.
- Caller supplies each batch's physical dictionary arrays and indices; current writer observes their equality/prefix relation and emits no-event/delta/replacement.
- `WriteTable(max_chunksize)` is only a convenience path and cannot stand in for the complete action catalog.
- Options include metadata version, alignment, legacy framing, compression/minimum savings, threading, and delta behavior. `unify_dictionaries` is ignored for streams.
- Flat and nested dictionary paths differ; the frozen candidate is restricted to flat fields because outer nested deltas are not emitted/read compatibly.
- Writer/read statistics expose message, record batch, dictionary batch, delta, replacement, and body-size counts.

Therefore a new claim cannot be “Arrow lacks joint cut/dictionary actions.” The only plausible residual is a nontrivial planner/formal guarantee over actions already available through caller-controlled input construction.

## Original-paper collision search

| Source | Read scope | Collision role |
|---|---|---|
| Liu et al., [A Deep Dive into Common Open Formats for Analytical DBMSs](https://www.vldb.org/pvldb/vol16/p3044-liu.pdf), PVLDB 2023 | format features, Arrow/Parquet/ORC trade-offs and evaluation shape | current evaluation/domain anchor; no same-object joint stream constructor found |
| Raman & Swart, [How to Wring a Table Dry](https://research.ibm.com/publications/how-to-wring-a-table-dry-entropy-compression-of-relations-and-querying-of-compressed-relations), VLDB 2006 | encoding objective, guarantee and system evidence | contribution-shape/methodological adjacent |
| Hildebrandt et al., [Integrating Lightweight Compression Capabilities into Apache Arrow](https://www.scitepress.org/Papers/2020/98201/98201.pdf), ICISSP 2020 | ArrowComp scope and claimed compression integration | direct Arrow subtractor, but different action/objective/stream grammar |

Queries combined `Arrow IPC`, `dictionary delta`, `dictionary replacement`, `record batch`, `batch size`, `joint segmentation`, `dictionary encoding`, `stream`, `planner`, and `optimization`. No checked original paper covered the complete frozen object, algorithm, guarantee, and full-cost claim. Generic segmentation and dictionary-compression work remain mandatory methodological subtractors.

## Witness audit

- Format legality: pass for the explicit flat-field message histories in the PRIMARY report.
- Stock-reader path: source semantics support initial dictionaries, later deltas/replacements, and concatenated logical reconstruction.
- Union externality: fail. Current writer can emit both histories from caller-provided batches/dictionaries.
- Scientific use: the witness may seed fidelity tests but cannot support novelty or superiority.

## Source-bounded conclusion

- `DIRECT_FATAL`: not found.
- `DIRECT_SUBTRACT`: current arbitrary `WriteRecordBatch` input action and deterministic dictionary tracker remove the claimed new-action framing.
- `METHODOLOGICAL_ADJACENT`: generic segmentation/product shortest path and relational/dictionary compression.
- Residual: search-bounded, conditional algorithmic opportunity only.
- Required next source work: the one revision must compare its formal action/property against the complete current action catalog and named generic planners; later Stage B, if ever authorized, must refresh the literature search.

## Discovery material repairs

- Add arbitrary direct `WriteRecordBatch` sequences and physical dictionary inputs.
- Reclassify the 2-field/3-region witness as current-expressible.
- Separate logical-row equality from record-batch partition equality.
- Add dictionary construction/remapping and planning to full cost.
- Replace “new joint action” by the narrower conditional algorithm/formal residual.
