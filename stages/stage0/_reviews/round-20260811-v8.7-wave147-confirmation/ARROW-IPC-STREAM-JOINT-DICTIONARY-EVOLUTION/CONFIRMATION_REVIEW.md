# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Stage 0 Confirmation Review

- Lane: `STAGE0-CONFIRMATION-SENTRY-D`
- Mode: `SENTRY`
- Assignment: `STAGE0-C2-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-CONFIRM-V8.7`
- PRIMARY assignment: `STAGE0-P1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-PRIMARY-V8.7`
- Decision: `CONFIRM_REVISE_ONCE`
- Mechanical SENTRY verdict: `CONFIRM`
- PRIMARY decision reviewed: `REVISE_ONCE`
- Quality tier if the one gate closes: `TIER_B_Q2_VIABLE`
- Quality tier if the gate fails: `BELOW_Q2_STOP`
- Confidence: `0.93`
- Evidence ceiling: `STAGE0_FIRST_PARTY_CURRENT_SOURCE_AND_STATIC_PROPOSITION_AUDIT__NO_CANDIDATE_RESULT`
- Latest-collision disposition: `SEARCH_BOUNDED_OPEN__NO_DIRECT_FATAL_FOUND`
- Scientific revision: `PERMITTED_UNCONSUMED__UNIQUE_1_OF_1`
- Stage A/B authorized: `false / false`
- Cross-assignment contamination declaration: no conclusion, score, mechanism, source absence, or result from another candidate was inherited. Only this topic's frozen Discovery and PRIMARY package was used.

## Outcome first

PRIMARY is correct on the decisive distinction. Apache Arrow at the frozen commit already lets a caller choose arbitrary record-batch cuts and supply each batch's physical dictionary arrays and indices. The C++ stream writer then emits no event, a compatible prefix delta, or a replacement. The Discovery witness is therefore a legal pair of histories but is not outside the current native input-action family. It cannot support action novelty.

This does not yet justify scientific STOP. The current writer is an emitter with a deterministic local dictionary comparison rule; the reviewed official sources do not provide a whole-sequence optimizer, an implicit/factorized solver, or a formal complexity/approximation guarantee over the complete caller-controlled action family. A same-object N2 can still exist as a provably nontrivial computational residual over those already expressible actions.

The present candidate also cannot PASS. Its only stated algorithm is a vector-state dynamic program, which is the ordinary explicit Cartesian-product segmentation baseline once all field dictionary states are made explicit. No Arrow-specific lossless dominance theorem, factorization, FPT bound, approximation guarantee, or comparator-separating certificate has been defined. One atomic scientific revision is therefore warranted and remains unconsumed.

## Frozen package integrity

The frozen PRIMARY directory was read in full and independently verified:

| Artifact | SHA-256 | Result |
|---|---|---|
| `STAGE0_REPORT.md` | `EA9DFCDD0C36534C4C5BC236266D124AD4048D887BC629E83576D36916B20D5F` | PASS |
| `Q1_COMPARATOR_MATRIX.md` | `7741806F77F7CDDE69DDC71BBD4084D99BC0CC668883B7D186E6AD866461BC0E` | PASS |
| `SOURCE_AUDIT.md` | `59CA94A6119DA5EFC39443AFF4534F4120EA2F8B07A4E81C63FCD057D915A6A1` | PASS |
| `handoff.yaml` | `AF35BDB838EA898FE410FE71D87F2DB2711F62A1A25BDBFA7E780B319C3807E5` | PASS |

The PRIMARY manifest self hash is `6DDDBE932E186C6B3EF23A7D3D533B55A7B9AEEA502C03899BBDB57C4E52C60E`; all `4/4` entries passed. The topic's Discovery manifest self hash is `31EB791E2F8560CEC270B961124808706150A5151235E60409CD274C135C136D`; all `8/8` entries passed. Provenance is therefore not a blocker.

The assignment rules are frozen at `AGENTS.md` SHA-256 `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` and `rules/ROLE_STAGE0_REVIEW.md` SHA-256 `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.

## Independent current-upstream reality check

### Pin and authoritative surfaces

- Repository: Apache Arrow, commit [`42694575d0219f6a3a78b1f344bb071a60df6a4e`](https://github.com/apache/arrow/commit/42694575d0219f6a3a78b1f344bb071a60df6a4e), committed 2026-08-10 UTC.
- Official format: [Apache Arrow Columnar/IPC format](https://arrow.apache.org/docs/format/Columnar.html).
- Official C++ API: [Apache Arrow IPC API](https://arrow.apache.org/docs/cpp/api/ipc.html).
- Stock reader: `RecordBatchStreamReader` at the same source pin.

Exact blobs were independently re-fetched and match PRIMARY:

| Path | Blob SHA |
|---|---|
| `cpp/src/arrow/ipc/writer.cc` | `263689a648d08b6a37ab5bde2e717e2f2a9a5e9f` |
| `cpp/src/arrow/ipc/writer.h` | `aefb59f3136e4c98419799eb31faf9700fc6efd2` |
| `cpp/src/arrow/ipc/dictionary.cc` | `bb5539f2b4bb6137cbd4cbfda43db6204dff234d` |
| `cpp/src/arrow/ipc/reader.cc` | `47ea70e43faca6218de4094c9d3ed75d916b48d0` |
| `cpp/src/arrow/ipc/options.h` | `254a4693866e9be5c2b4b0a8d77392ad70c235b2` |

### What current Arrow actually expresses

1. Public `RecordBatchWriter::WriteRecordBatch` accepts a caller-supplied record batch. `IpcFormatWriter::WriteRecordBatch` checks schema equality, calls `WriteDictionaries(batch)`, and then writes the record-batch payload ([`writer.cc` lines 1214–1240](https://github.com/apache/arrow/blob/42694575d0219f6a3a78b1f344bb071a60df6a4e/cpp/src/arrow/ipc/writer.cc#L1214-L1240)). Calling it on an arbitrary schema-equal sequence therefore chooses arbitrary batch cuts.
2. `CollectDictionaries` walks the physical `DictionaryArray` objects in each supplied batch and returns their dictionaries by mapped field id ([`dictionary.cc` lines 286–337](https://github.com/apache/arrow/blob/42694575d0219f6a3a78b1f344bb071a60df6a4e/cpp/src/arrow/ipc/dictionary.cc#L286-L337)). The caller consequently controls physical dictionary contents/order and matching indices, subject to schema and array legality.
3. For each field id, `WriteDictionaries` emits no dictionary message for pointer- or value-equal dictionaries; emits a delta only when enabled, flat, longer, and prefix-compatible; otherwise emits a stream replacement ([`writer.cc` lines 1279–1346](https://github.com/apache/arrow/blob/42694575d0219f6a3a78b1f344bb071a60df6a4e/cpp/src/arrow/ipc/writer.cc#L1279-L1346)).
4. `WriteTable(max_chunksize)` only applies a maximum chunk size before repeatedly calling `WriteRecordBatch`; it is not the complete action surface ([`writer.cc` lines 1164–1183](https://github.com/apache/arrow/blob/42694575d0219f6a3a78b1f344bb071a60df6a4e/cpp/src/arrow/ipc/writer.cc#L1164-L1183)).
5. `emit_dictionary_deltas` defaults to false. `unify_dictionaries` is ignored for streams, and nested outer dictionary deltas are excluded for reader compatibility ([`options.h` lines 91–127](https://github.com/apache/arrow/blob/42694575d0219f6a3a78b1f344bb071a60df6a4e/cpp/src/arrow/ipc/options.h#L91-L127)).
6. The official format defines delta concatenation and non-delta replacement for stream dictionary messages. The pinned first-party tests separately round-trip dictionary delta and replacement histories through the reader ([`read_write_test.cc` lines 1871–1944](https://github.com/apache/arrow/blob/42694575d0219f6a3a78b1f344bb071a60df6a4e/cpp/src/arrow/ipc/read_write_test.cc#L1871-L1944)).

Disposition: `DISCOVERY_ACTION_GAP_CONTRADICTED__NATIVE_INPUT_ACTION_FAMILY_COMPLETE_FOR_FROZEN_FLAT_SCOPE`. The direct caller interface, not only a `max_chunksize` grid, belongs in the strongest current union.

## Same-object and stock-reader audit

The defensible exact object is a fixed logical Arrow schema and a fixed ordered row-value/null sequence serialized as one standard IPC stream, with equivalence judged after concatenating and logically decoding every stock-reader batch. Batch partitioning and physical dictionary representations are actions, so they cannot also be equality dimensions.

The revision must mechanically freeze all of the following:

- at least two flat, non-nested dictionary fields;
- field types, dictionary index widths, ordered flags, schema metadata, field order, row order, values, and null locations;
- absent or byte-identical record-batch custom metadata;
- metadata V5, 8-byte alignment, non-legacy framing, no body compression, fixed threading, and a fixed `emit_dictionary_deltas` arm per comparison;
- the pinned C++ `RecordBatchStreamReader` as the acceptance oracle;
- equality of decoded logical values rather than equality of reader-returned physical dictionaries or batch boundaries.

With these clauses, changing physical dictionary order/content and matching indices is same-object optimization rather than an object swap. Changing schema/index type, sharing dictionary ids by changing serialized schema mapping, using nested dictionaries, changing reader/codec/transport, or allowing metadata to carry the result is outside the candidate.

## Static witness disposition

The two-field/three-region witness is mechanically consistent with the stream grammar at the conceptual source level:

- `A` can use `[a]` then prefix delta `[b]`, while `B` can replace `[x]` with `[y]` and later `[x]`;
- or the caller can initially use `A=[a,b]`, `B=[x,y]`, combine the first two regions, and later replace `B` with `[x]`;
- both histories can decode to the same three logical row regions if their indices are remapped consistently.

Its allowed inference is only `LEGAL_MULTIPLE_NATIVE_HISTORIES_EXIST`. Its union-externality is `FAIL`: both histories can be supplied to today's writer as different legal sequences of physical record batches. No novelty, Pareto improvement, or natural benefit follows from it.

## Why the stated N2 is not yet closed

For any finite catalog, an action-complete exact baseline can construct a layered graph whose state at a cut is the tuple of all per-field physical dictionary states. A transition chooses the next shared cut and one legal dictionary/index realization per field; its cost includes batch overhead, every dictionary/record payload, padding, and any scalarization or finite Pareto label. Shortest path or ILP over this explicit Cartesian state space can enumerate every legal plan.

Therefore “the candidate is not representable by a Cartesian product DP” is neither necessary nor credible: every finite candidate plan is representable by that exact oracle. The only publishable residual is computational or formal—an Arrow-specific structure that avoids explicit product enumeration, proves safe dominance, provides an FPT/approximation bound, or otherwise gives a same-object guarantee that the named ordinary baseline lacks. It cannot claim a better objective value than an exact product oracle on the same catalog.

The Discovery documents do not yet state such a property. Calling product state “reader-visible vector state” and generic shortest path “grammar-constrained DP” does not create N2.

## Unique atomic revision gate

### Gate id

`NATIVE_INPUT_ACTION_COMPLETE__NONPRODUCT_ARROW_DICTIONARY_LATTICE_CERTIFICATE`

### Frozen proposition

On the complete current caller-controlled input-action family, for the fixed flat-schema/logical-row/stock-reader object above, define one Arrow-specific dominance, factorization, parameterized, or approximation property that yields a nontrivial algorithmic guarantee relative to explicit product-state segmentation—while returning only native-writer-realizable batch/dictionary inputs and charging complete construction, planning, serialization, and read costs.

“Nonproduct” here means a provable computational/state/guarantee improvement over explicit product enumeration, not an impossible claim that the legal plans are unrepresentable by the product oracle.

### One coherent revision artifact must contain all of these clauses

1. **Finite native action universe.** Define candidate cut positions and, for every flat dictionary field and interval, every admitted physical dictionary/index realization. Show the map from every plan to a schema-equal `WriteRecordBatch` sequence. Include both matched delta-policy arms; do not reduce the union to fixed `max_chunksize`.
2. **Explicit comparator semantics.** Define (a) current local writer policy over arbitrary caller inputs, (b) independent per-field planning followed by an optimal shared-cut merge/re-optimization, and (c) the exact explicit Cartesian-product shortest-path/ILP ceiling. All receive the same complete row sequence.
3. **Arrow-specific state relation.** State the exact equivalence/dominance/factorization rule induced by prefix delta, replacement, no-event, message ordering, fixed-width indices, or IPC padding. A name such as “dictionary lattice” without a checkable relation fails.
4. **Nontrivial guarantee.** State one exactness, state-count/time bound, FPT parameterization, approximation ratio, or certified frontier guarantee. Give parameters in rows `N`, fields `F`, and per-field action/dominance width. The claimed residual must improve on explicit `product_f(width_f)` enumeration in a nonempty regime, not merely change constants or use an ILP solver.
5. **Two-part small certificate.** Provide a legal stock-reader same-object instance where (i) independent per-field planning plus shared-cut merge is strictly distinguished from the joint optimum or certified frontier, and (ii) the proposed Arrow-specific rule safely merges/prunes/factorizes at least one explicit product state while preserving the stated guarantee. The old three-region witness alone does neither.
6. **Finite falsifier.** Enumerate the full action family on that small instance, compare candidate output/guarantee against the exact product ceiling, and specify reader/equality/full-cost checks. This is a Stage A route; no implementation or result is required in the revision artifact.
7. **Full-cost honesty.** Charge logical-to-dictionary construction, index remapping, planning, temporary and peak memory, message metadata/padding/bodies, writer/reader CPU and wall time, time to first complete batch, total decode latency, digest verification, and fallback. Static byte/complexity claims must be separated from later measured runtime claims.

### Acceptance and failure are mechanical

- If all seven clauses are statically defined and mutually consistent, the revision closes the only Stage 0 gap and supports conditional `TIER_B_Q2_VIABLE` routing. Stage A must still pass its pre-claim fidelity gate before any claim-bearing run.
- If the artifact is only current local policy, independent field policies plus cut merging, explicit Cartesian segmentation/ILP, an input dictionary builder, writer option selection, or emitter engineering, the gate fails and the topic becomes `BELOW_Q2_STOP` after its one consumed revision.
- A missing implementation, native output, theorem proof, or positive natural result does not fail this Stage 0 gate.

This is one atomic revision of the algorithmic proposition; it does not change the problem, exact object, metric family, reader, or natural carrier. The unique scientific revision is explicitly permitted and is not consumed by PRIMARY or this confirmation.

## Four degeneration attacks

| Attack | Independent finding | Mechanical disposition |
|---|---|---|
| Current local Arrow policy | Current code already implements equality, prefix-delta, replacement, and stats once batches/dictionaries are supplied. | Any contribution limited to exposing or retuning these branches fails. |
| Independent per-field planning + optimal shared-cut merge | Shared cuts can make independently selected partitions inconsistent or suboptimal, so a joint residual is possible; however it must be witnessed against a precisely defined optimal merge/re-optimization, not a greedy union of cuts. | Revision must supply the two-part small certificate. |
| Ordinary Cartesian-product segmentation/ILP | This is an action-complete exact oracle for any finite catalog. Candidate cannot beat its objective value under identical costs. | Only a provable state/complexity/approximation/guarantee improvement qualifies. Relabeling the product DP fails. |
| Input preparation or emitter engineering | The implementation necessarily constructs caller batches, but construction alone is already the way current Arrow expresses the actions. | Qualifies only as an implementation of the independently stated algorithm/property; otherwise fails. |

## Bounded collision and paper-shape audit

The independent bounded queries over Arrow IPC, dictionary delta/replacement, record batches, segmentation, planning, and optimization found no original paper that closes the frozen exact object plus the required algorithm/guarantee. The status remains `SEARCH_BOUNDED_OPEN`; it is not an absence proof. No transport failure was used to infer absence.

The strongest checked shape anchors remain appropriate:

- Liu et al., [A Deep Dive into Common Open Formats for Analytical DBMSs](https://www.vldb.org/pvldb/vol16/p3044-liu.pdf), PVLDB 2023: evaluation/full-format anchor, not a same-object constructor.
- Raman and Swart, [How to Wring a Table Dry](https://research.ibm.com/publications/how-to-wring-a-table-dry-entropy-compression-of-relations-and-querying-of-compressed-relations), VLDB 2006: algorithm/theory/system contribution-shape anchor.
- Hildebrandt, Habich, and Lehner, [Integrating Lightweight Compression Capabilities into Apache Arrow](https://www.scitepress.org/PublishedPapers/2020/98201/), 2020: Arrow compression neighbor with a different representation/mechanism.

No checked source directly absorbs the narrowed algorithmic proposition. Current Arrow source directly subtracts action novelty. Generic product-state optimization subtracts the current DP description. The latest-collision gate is consequently open but not fatal.

## Natural route, full cost, and finite Stage A fidelity path

The official [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) exposes January and February 2025 Yellow Taxi records, and the official [Yellow Taxi data dictionary](https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf) identifies categorical-code fields such as `VendorID`, `RatecodeID`, and `payment_type`. This is a valid finite natural carrier. It does not establish asynchronous dictionary drift or benefit; those remain later falsifiable hypotheses.

If the revision closes, the first Stage A pre-claim fidelity gate is finite:

1. freeze input URLs/hashes, original order, schema mapping, Arrow pin, compiler/configuration, and all writer/reader options;
2. prove candidate and every comparator emit only stock-writer-realizable inputs;
3. replay the revised small certificate through the unmodified stock reader and check schema plus concatenated decoded row/value/null equality;
4. enumerate the complete small-instance native/product action ceiling before any natural claim;
5. account for dictionary construction/remapping and planner cost before measuring the two natural months;
6. kill on comparator absorption, equivalence failure, certificate failure, or absence of both a formal residual and a full-cost Pareto residual.

This plan is finite and same-object. Its non-execution at Stage 0 is not negative evidence.

## Independent reviewer records retained before synthesis

### Methodology view

`CONFIRM_REVISE_ONCE`. Exact logical equality and the stock-reader route are sound after freezing custom metadata and decoded-value comparison. The strongest methodological baseline must be action-complete and include explicit product-state optimization. The revision gate is finite only when “nonproduct” is evaluated as a provable computational/guarantee residual, not as action-space externality or a better value than an exact oracle.

### Domain-contribution view

Current Arrow exposes the complete flat-stream input actions but no checked whole-sequence planner. An Arrow-specific dominance/factorization theorem plus format-faithful solver and natural full-cost evaluation can support a focused Q2 data-format/algorithm paper. The present vector DP and old witness cannot. Q1 parity is not plausible at the frozen scope.

### Devil's-advocate view

The strongest counter-argument is that flat dictionary fields are independent except for shared cuts and additive/finitely computable message costs; the entire problem may therefore be nothing more than generic segmented optimization over a Cartesian product. If no Arrow-specific safe dominance or factorization improves the explicit-product computational guarantee, the proposed “lattice” is decorative terminology and the paper kernel disappears. This is a serious revision risk but not yet a formal impossibility or direct absorption proof.

## Independent Q1/Q2 and AI recalibration

- Academic value: `40/70`, conditional on the one certificate.
- AI executability bonus: `27/30`.
- Total priority score: `67/100`; score does not override hard gates.
- AI route: `AI_CORE_EXECUTABLE`, estimated claim-critical fraction `0.85` after revision acceptance.
- Q1 calibration: `PARITY_NOT_PLAUSIBLE` at current scope.
- Q2 judgment: `TIER_B_Q2_VIABLE` only if the static revision gate closes; otherwise `BELOW_Q2_STOP`.
- Evidence honesty: no implementation, native candidate output, byte saving, latency saving, natural drift, Pareto gain, theorem, or main result is claimed.

## Final mechanical instruction to mainline

1. Accept this review as `CONFIRM_REVISE_ONCE` / SENTRY `CONFIRM`.
2. Permit exactly one scientific Stage 0 revision under gate `NATIVE_INPUT_ACTION_COMPLETE__NONPRODUCT_ARROW_DICTIONARY_LATTICE_CERTIFICATE`; mark it unconsumed until a revision artifact is actually delivered and reviewed.
3. Do not route to Stage A/B, do not treat the old witness as novelty, and do not require implementation or positive results in the revision.
4. On revision closure, PASS only if all seven static clauses close. Otherwise use the frozen scientific failure sentinel `BELOW_Q2_STOP__CURRENT_INPUT_CONTROL_OR_GENERIC_PRODUCT_SEGMENTATION`.
5. Leave latest collision as `SEARCH_BOUNDED_OPEN` and refresh it at later gates if the topic survives.

Lane disposition after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`.
