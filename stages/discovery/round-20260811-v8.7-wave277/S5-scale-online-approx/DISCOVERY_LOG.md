# Discovery log — Zarr v3 shard/index bounded-recourse closure

**Assignment:** `DISCOVERY-S5-20260811-V8.7-WAVE277-ZARR-V3-SHARD-INDEX-BOUNDED-RECOURSE-N2-CLOSURE`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

## Rule and scope freeze

`production_v2_v8.1 + v8.6 FIDELITY_CLOSURE_PLAN + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Supplied hashes matched disk: AGENTS `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; plan `F5C7D04DF32391E3FD958C106BBE41B9A8063F137E7D847230CC5027D295AD22`; registry `253F93B7A0E39B9AEE80E5E42E728DA43EEC281CE2DCACE0A5EAE97F4A97D934`; ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

This is a source-level reclosure of the nonterminal S2 Wave195 Zarr line, not a revival of a STOP. No experiment, benchmark, download, Stage0/A/B creation, automation, or shared-file write occurred.

## Fixed object and current union

The object is one fixed Zarr v3 array: identical `zarr.json` schema, chunk grid and logical chunk values; fixed outer-shard and inner-chunk geometry; fixed codec and checksum pipeline; identical stock-reader selections and store-key semantics. The relevant first-party sources are the [v3 sharding-indexed codec specification](https://zarr-specs.readthedocs.io/en/latest/v3/codecs/sharding-indexed/), the [v3 codec-pipeline specification](https://zarr-specs.readthedocs.io/en/latest/v3/codecs/), [current zarr-python codec API](https://zarr.readthedocs.io/en/latest/api/zarr/codecs/), [runtime configuration API](https://zarr.readthedocs.io/en/latest/api/zarr/config/), [storage guide](https://zarr.readthedocs.io/en/latest/user-guide/storage/), and current upstream [sharding implementation](https://github.com/zarr-developers/zarr-python/blob/main/src/zarr/codecs/sharding.py), all checked 2026-08-11.

The fair current whole-action union is: metadata-fixed `ShardingCodec` (`chunk_shape`, `codecs`, `index_codecs`, `index_location`), the normal and fused codec-pipeline paths, all documented `subchunk_write_order` values (`morton`, `unordered`, `lexicographic`, `colexicographic`), range/coalescing configuration, and Local/Zip/Fsspec/Memory-store behavior. It also includes every spec-valid partial-shard update path:

1. read/encode/rewrite a complete shard and its index;
2. append a replacement variable-size inner-chunk payload and a fresh index, leaving former payload/index bytes unused; and
3. on a random-write store, replace a fixed-size inner-chunk byte range and update its index.

The specification deliberately leaves inner-chunk content order unconstrained and identifies write strategy as runtime configuration rather than array metadata. Store synchronization is application-owned. Thus a write-order, shard-size, codec-level, cache, threshold, or append/rewrite selector is already inside the union or is a prohibited controller; it is not a new constructor.

## Minimal same-object transition witness and residual test

Use an outer `[64,64]` shard containing four `[32,32]` inner chunks, fixed `bytes→bytes` inner codec and valid fixed-size index codec at `end`. Let a single update change only inner chunk `(0,1)` to a differently sized encoded payload. Both outputs retain the same logical array values, metadata, codec pipeline, store key and stock-reader result:

| Output | Complete native action | Why it does not establish N2 |
| --- | --- | --- |
| A | rewrite the shard payloads plus a new index | explicitly legal full-shard path |
| B | append the new `(0,1)` payload and new index | explicitly legal append-only path |
| C | fixed-size range overwrite plus index update | legal random-write-store path |

The only possible residual would be a **whole-shard bounded-recourse compaction constructor**: for every update, select a set of old payload intervals to relocate, install one reader-valid index, preserve all fixed semantics, and prove both a per-update relocation bound and a long-run dead-byte/active-byte bound under one frozen store atomic-publication model. This names a possible N2 target, not a contribution or absence claim.

It cannot yet be admitted. The public spec proves byte-format legality but not an atomic publication/recovery protocol shared by the Local, Zip, Fsspec and remote stores; current upstream documentation/source access likewise does not freeze a commit-level, store-specific transition/recovery call graph. The S2 Wave195 result also found no official versioned mutation trace for a fixed public array. A generic copy/rewrite wrapper would not close these gaps.

## Conditional fidelity closure, carrier, accounting and killer

Status is `NOT_ADMITTED_UNFROZEN`, not DROP for missing implementation, result, resource, or AI readiness. A finite closure would pin an upstream commit and one store's overwrite/visibility/failure semantics, then obtain an official versioned same-array mutation trace (the [NOAA NWM Retro v2 Zarr carrier](https://zarr.readthedocs.io/en/latest/user-guide/storage/) is a natural array carrier but not presently a verified mutation trace). The oracle would reopen through the unmodified reader and compare value digests/selections, fixed metadata, per-shard decode/index/checksum, and recovery behavior.

Full cost denominator: old-shard/index range reads; inner-codec CPU; bytes written, retained dead bytes and deletes; index bytes and rewrites; object requests; update/query CPU; peak RSS; temporary space; and reader range-request/read latency. The conditional ≤72h killer is a small four-inner-chunk trace: fail if stock-reader values/metadata/codec behavior differ, if the candidate needs a custom reader or changed store semantics, if a current union action reproduces it, if bounded relocation/fragmentation is violated, or if the full-cost Pareto residual disappears.

## Outcome

`PROPOSE_STAGE0: []`. The only candidate-shaped action remains source/natural-trace/atomic-publication unclosed, while all merely configurational variants are directly absorbed. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
