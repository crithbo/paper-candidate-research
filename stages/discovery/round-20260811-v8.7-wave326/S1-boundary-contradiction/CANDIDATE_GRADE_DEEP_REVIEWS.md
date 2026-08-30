# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 — Redis multi-part AOF rewrite/manifest visibility

- **Native two-action witness.** For the same command prefix, an in-progress rewrite may add later commands to an incremental AOF and then atomically switch the manifest, while an ordinary append extends the current incremental AOF without rewrite. Both are stock native paths and must replay the same retained command sequence at restart.
- **Current union and source pin.** Current official persistence docs describe AOF persistence, background rewrite, multi-part base/incremental AOF files and manifest-based loading. Current `src/aof.c` is the source pin; documented persistence modes and rewrite configuration are non-default entrances that must be included. Redis's own checker/replay and manifest path are the oracle.
- **Subtractor and six dimensions.** The state information, commit choice and recovery guarantee are entirely owned by the native AOF/manifest state machine. Choosing rewrite timing, fsync cadence or child scheduling is controller/tuning; rewriting a different file layout is a changed object; generic selection over append/rewrite states has no Redis-specific algorithmic guarantee. Historical crash papers diagnose durability/fault handling, not a retained same-object planner.
- **Natural route/full cost/killer.** Public Redis AOF regression workload; keyspace/hash equality and `redis-check-aof`; CPU/RSS, AOF/base/manifest bytes, fsyncs, rewrite CPU, command latency and restart time. Kill in ≤72h if each candidate is an existing append/rewrite/manifest transition or changes the durability contract.
- **Decision:** `DROP` — current union absorbs the only two native actions.

## D02 — containerd ingest commit/lease ownership

- **Native two-action witness.** For a fixed content digest, a writer can `Commit` after bytes and digest verification, making content visible, or `Abort`, leaving no committed object; independently an active lease retains ownership during the transition. Both are native content-store operations.
- **Current union and source pin.** Official content-flow documentation and current `core/content` source expose the ingestion, content and commit flow. The fair union includes writer status, commit, abort, labels, digest checks, leases and GC—not only the default API path.
- **Subtractor and six dimensions.** Any policy that decides when to commit/abort/release is a controller. A construction that changes digest or makes partial content reader-visible changes the object/guarantee. A generic dependency/lease graph solver has no target-specific residual once stock visibility is pinned to successful digest-verified commit.
- **Natural route/full cost/killer.** containerd content test fixtures and OCI images already used by the test suite; digest/content API oracle; upload CPU/RSS, bytes, lease/metadata writes, GC, commit and pull latency. Kill if the proposed schedule is replayable by stock writer+lease operations or emits different visibility.
- **Decision:** `DROP` — explicit commit/abort and lease primitives absorb the seam.

## D03 — OCI Distribution upload finalization

- **Native two-action witness.** Given one upload UUID and fixed target digest, the protocol permits PATCH-ing a chunk and PUT finalization with digest, or DELETE cancellation of the upload. Only successful finalization makes the blob addressable by digest.
- **Current union and source pin.** The official Distribution V2 API specifies POST/PATCH/GET/PUT/DELETE upload lifecycle and the digest finalization contract; current registry storage source is pinned. The union includes resumable ranges, status requests, final PUT and cancellation.
- **Subtractor and six dimensions.** Chunk placement/resume selection is a client transfer controller; changing digest/manifest visibility changes object semantics. Server-side action construction beyond standard storage/finalization requires an implementation absence claim not frozen here; no target-specific non-generic N2 guarantee remains.
- **Natural route/full cost/killer.** Distribution conformance/upload fixtures, blob digest and manifest-pull oracle; CPU/RSS, transferred/retained bytes, registry metadata, latency, recovery cleanup and retry cost. Kill if candidate is just standard PATCH/PUT/DELETE composition or changes digest-visible state.
- **Decision:** `DROP` — protocol action union directly defines the complete visibility boundary.
