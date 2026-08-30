# WEBGRAPH-REFERENCE-FOREST Revision1 User Review Packet

- Stage: `STAGEA_REVISION1`
- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260810-WEBGRAPH-REFERENCE-FOREST-REVISION1-V8.7`
- Decision: `STOP_NARROW_FROZEN_MECHANISM`
- Quality tier: `BELOW_Q2_STOP` for the frozen candidate
- Evidence ceiling: `VALID_TWO_NATURAL_GRAPH_FULL_COST_NEGATIVE_KILL__FIXED_W4_D3_ONLY`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `yes`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

The dense exact implementation is faithful. It reproduces every frozen primary optimum and all native semantics, reduces the parent exact solver's construction cost by roughly an order of magnitude, reaches baseline-like RSS, and retains 72,761 B / 127 B persisted size residuals on CNR/Wiki.

The 11-pair full-cost run is valid and reproducible. Nevertheless, candidate construction remains 7.63–8.33× baseline on CNR and 1.83–3.33× on Wiki, while CNR random access is 1.072×/1.144× at p50/p90. These exceed the frozen 1.05 ceiling.

## What is not established

This does not establish that global reference selection is generally useless or impossible. It does not test approximations, pruning, alternate objectives, other `W,D`, other codecs, vertex orders or broader corpora. It does not authorize a new revision, Stage B or a paper project.

## Exact object and narrow boundary

The decision applies only to released WebGraph `0.6.2`, exact fixed successor lists, native BE BVGraph writer/readers, interval 4, `W=4`, `D=3`, chunk 128, final BvCompZ baseline, complete legal-action exact primary bit minimization, and the two frozen natural graphs under the no-regression full-cost rule.

## Fair baseline and integrity

Baseline and candidate use the same inputs, information, native action costs, writer, EF, readers and checksums. Pair order alternates. Pair 0 is excluded. All 44 variant outputs have stable exact hashes, and all cross-variant successor/checksum checks pass. There is no timing oracle or selective fallback.

## Recommended next state

- Request only an independent Stage A closing review of `STOP_NARROW_FROZEN_MECHANISM`.
- Do not enter Stage B or `PENDING_USER_STAGEB_REVIEW`.
- Do not reinterpret the result as a general WebGraph/reference-forest impossibility theorem.
- Lane after accepted delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`.

This packet is a review aid. It does not authorize Stage B or a formal paper project.

