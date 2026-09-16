# Candidate-grade deep review

## ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION

### Exact object and same-function guarantee

Input: a fixed ordered sequence of rows with fixed Arrow schema containing two or more categorical/dictionary-encoded fields. Output: a conformant Arrow IPC **stream**. The stock Arrow stream reader must reconstruct the identical record-batch row sequence and field values; schema fields/types, row order and null semantics are unchanged. The candidate never changes reader, codec, data values, external transport, or file-format semantics.

### Current strongest executable union

The comparator is current Arrow C++ IPC stream writing with its full documented action interface: a schema then legal dictionary and record-batch messages; dictionary state tracking; no-change/new/replaced/delta paths; default full replacement for changed dictionaries; optional delta only when it is a valid extension; rejection/compatibility restrictions for nested dictionaries; fixed user-provided record-batch/chunk size through `WriteTable(max_chunksize)`; metadata version, compression and threading options; and native reader/writer statistics. A fair baseline union reports the best legal current policy over fixed `max_chunksize` values and both delta-enabled/default configurations, charging every writer/reader cost.

### Union-external complete N2

**State-grammar constructor (N2):** given the whole finite row sequence, jointly select record-batch cut positions and, at every cut for every dictionary field, choose *no event*, a legal delta, or a legal replacement; emit the required dictionary batches before first dependent use. State is the vector of current reader dictionaries, prefix/delta compatibility, per-field indices, and message alignment. Objective is a full cost vector (serialized bytes plus writer and reader work), with a lexicographic guarantee: minimize bytes subject to a bounded number of message events and no worse decoded sequence; or Pareto-enumerate the finite cost frontier.

This is not “generic segmentation”: the transition relation is defined by Arrow's reader-visible dictionary state and IPC grammar; one shared batch cut changes all categorical fields and may make a delta legal for one field but force replacement for another. Current union applies a local changed-dictionary rule and a caller-supplied fixed maximum chunk; it does not expose this complete joint action.

### Minimal legal action-divergence witness

Two dictionary fields, A and B, and three consecutive row regions: region 1 initializes both dictionaries; region 2 extends A's dictionary but replaces B's; region 3 reuses A while B returns to its region-1 values. Two legal streams with identical decoded rows exist: cut after region 1, then emit A-delta/B-replacement before region 2; or cut earlier/later so that one field's extension is included in an initial/replacement dictionary and the other changes at a different legal boundary. The message counts, dictionary bytes and index widths can differ. This witness explicitly requires a state-vector transition, not a scalar threshold.

### Natural carrier, oracle, full cost and controls

Carrier: NYC TLC Yellow Taxi official monthly 2025 records, beginning with January and February releases, transformed only by a frozen schema mapping and original row order. Relevant categorical columns and missing-value handling are frozen from the official dictionary. Controls: same rows/order/schema/metadata version, Arrow revision, compression setting (off in the primary isolation arm), thread count, CPU/RAM, batch input API, cache state and destination medium.

Oracle: Arrow stock `RecordBatchStreamReader` materialized arrays, schema equality, row-count/order/value/null digest, and parser acceptance. Denominator: stream bytes including metadata/padding/dictionary/record bodies; writer CPU/wall/RSS and temporary allocation/bytes; reader CPU/wall/RSS, time to first complete record batch and total decode latency. No experimental number is claimed.

### Finite fidelity closure and 72-hour killer

1. Pin Apache Arrow commit and C++ writer/reader flag defaults; enumerate `IpcWriteOptions`, dictionary tracker and all stream/file distinctions.
2. Freeze two TLC monthly input URLs/hashes and mapping; construct the three-region witness using original rows or a small schema-preserving subset with its provenance.
3. Implement only the finite state grammar over the witness and compare with the full current policy union, then use native reader/digest equality.
4. Kill the proposal if (a) a current writer path emits every candidate history, (b) state choice collapses to a fixed chunk/delta flag, (c) the candidate requires file semantics/changed schema, or (d) full cost has no Pareto point outside the fair union.

### Assessment

- `structural_paper_potential`: `TIER_B_Q2_VIABLE` conditional on a nontrivial Pareto frontier and repeated natural-stream pattern; it is a direct format-constructor N2 with same-reader proof.
- `current_evidence_readiness`: `FINITE_FIDELITY_GAP`; source semantics, carrier, witness, oracle and killer are frozen, but no implementation/result exists.
- `claim_ceiling_before_stageA`: legality/equivalence and existence of an action divergence only; no compression/latency superiority claim.
- `recommendation`: `PROPOSE_STAGE0`.
