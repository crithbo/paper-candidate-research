# Candidate-grade deep reviews

## CD-98-01 — WARC revisit-cohort constructor

- Exact object: a WARC capture whose payload and recorded revisit facts remain readable under WARC 1.1.
- Stable natural structure and proposed action: repeated captures with identical payload digests would jointly select original/revisit records and complete reference fields.
- Current union/direct subtractor: WARC response/resource and both standardized revisit profiles with digest and `WARC-Refers-To` construction.
- Natural finite killer: on a frozen WARC subset, reject if each record/reference cannot be read and resolve to the original payload, or if all legal actions replay the standard profile union. Count digest, lookup, output and storage. Not run.
- Result: `DROP`, direct native action absorption; no Q2 residual for this exact object.

## CD-98-02 — OSM spatial/tag cohort fileblock constructor

- Exact object: a fixed OSM entity sequence with preserved entities, ordering/tags and replication metadata; readers must decode every fileblock.
- Mechanism: use stable local tag/spatial cohorts to jointly assign entities to fileblocks and select string-table reuse/encoding.
- Natural finite route: frozen public extract plus replication sequence; PBF reader provides decode/semantic oracle; full costs are encoded bytes, reader time/memory and index/replication impact.
- Minimal action-divergence/StageA killer: freeze current Osmosis revision and all serializer flags, then either name a legal construction unavailable to that union or reject before a performance claim. No absence claim is made.
- Result: `NOT_ADMITTED_UNFROZEN`, because same-object semantics and full current union have not closed; not because implementation/resources/results are missing.

## CD-98-03 — Wikimedia revision-chain constructor

- Exact object: all revisions and their XML import semantics for a frozen pages-meta-history subset.
- Mechanism: use repeated page-local revision-chain structure to choose a jointly indexed/delta representation.
- Natural finite route: official history dump subset and XML import/reader; count representation bytes, decoding/index cost and complete revision recovery.
- Minimal action-divergence/StageA killer: before measurement, show a representation accepted by the canonical reader, or a frozen formal equivalence reader with unchanged object; otherwise reject. An invented external sidecar/format is not same-object.
- Result: `NOT_ADMITTED_UNFROZEN`; current stable union and same-object legality cannot be stated yet.

## CD-98-04 — CT cohort-shared inclusion proof constructor

- Exact object: a fixed batch of RFC 9162 inclusion queries and their standard verifier outcomes.
- Mechanism: issuer/domain query cohorts share Merkle paths; construct a minimal joint proof.
- Direct subtractor: RFC 9162 individual inclusion/consistency proof semantics and their full hash/server/verifier costs.
- Natural finite killer: verify all requested paths under the standard grammar. A shared bundle changes that grammar; without it, no action remains beyond native path construction.
- Result: `DROP` for same-object failure, not absent implementation.

## CD-98-05 — NVD modified-cohort answer constructor

- Exact object: the same NVD CVE/CPE API query answers for a frozen modified-time range.
- Mechanism: modified-time cohorts would jointly encode the answer delta.
- Direct subtractor: API date-range/modified-since retrieval, pagination and 2.0 feed delivery.
- Natural finite killer: byte/schema-equivalent answer set and complete request/parse/transfer cost. A cache/batching rule is an excluded controller; another provider layout changes object.
- Result: `DROP` by native incremental answer action / controller boundary.

## CD-98-06 — SPDX cross-document cohort constructor

- Exact object: a set of SPDX 3.0 SBOM documents and their standard model/SHACL validation outcomes.
- Mechanism: repeat package/license/dependency subgraphs would be factored as a global construction.
- Direct subtractor: standard document/model validation, serialization and reference resolution.
- Natural finite killer: each output must remain standard-valid and preserve each document's semantics, while counting factor index, serialization and validation costs. A cross-document sidecar fails the same-object test.
- Result: `DROP`—only a wrapper/new external storage object was identified.
