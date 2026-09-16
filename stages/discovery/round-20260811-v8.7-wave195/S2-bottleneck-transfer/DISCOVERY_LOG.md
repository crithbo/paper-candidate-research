# Discovery log — S2 Zarr v3 shard-index transition depth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE195-ZARR-V3-SHARD-INDEX-TRANSITION-DEPTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. All supplied plan/registry/ROLE hashes match disk.

## Current source, spec and action union

Frozen sources: [Zarr v3 / zarr-python glossary](https://zarr.readthedocs.io/en/stable/user-guide/glossary/), [current configuration](https://zarr.readthedocs.io/en/latest/api/zarr/config/), [current codec source documentation](https://zarr.readthedocs.io/en/latest/api/zarr/codecs/), [release notes](https://zarr.readthedocs.io/en/latest/release-notes/), [storage guide](https://zarr.readthedocs.io/en/latest/user-guide/storage/), and [zarr-python upstream](https://github.com/zarr-developers/zarr-python), all observed 2026-08-11. Static source access did not produce a commit SHA or a complete crash/recovery migration call graph; no absence claim follows.

**Exact object:** one logical v3 array with fixed values, dtype, chunk grid, shard/inner-chunk geometry, codec/checksum behavior and stock zarr-python reader/writer results. **Union:** `ShardingCodec` with its stored `chunk_shape`, inner and index codecs/index location; standard `BatchedCodecPipeline` and opt-in `FusedCodecPipeline`; `subchunk_write_order`; range coalescing settings; Local/Zip/Fsspec/Memory Store behavior; metadata and codec configuration; all default/non-default settings. Shards are storage/write units while inner chunks are independently readable units.

## Attempted whole N2 and witness

The only plausible action is a dynamic joint constructor that, after a finite update sequence, rewrites each affected shard's inner-chunk placement and index while preserving values, codec decoding and stock-reader results, then atomically switches the array to the new representation with bounded recourse.

The minimal legal witness would need two constructors over the same update trace: a new constructor produces a different shard/index layout with equal stock-reader values, metadata/codec semantics and crash-recovery behavior, without a custom reader, external migration wrapper or configuration-only action; the current writer union must be unable to express it.

No witness closes. `subchunk_write_order` is already a current codec option and is explicitly not persisted in array metadata; pipeline and coalescing choices are runtime configuration. A changed stored codec/shard specification requires rewrite plus a publication/recovery protocol, for which no source-level current action or atomicity semantics were frozen. A generic copy/rewrite is a prohibited wrapper, not N2.

## Natural carrier, oracle, full cost and killer

The official storage guide references public Zarr stores such as NOAA NWM Retro v2, which is a natural array carrier, but accessible materials do not establish a versioned mutation/late-update trace for one fixed array. It cannot be silently substituted by static snapshots.

Oracle: stock reader materialized value digest and selections, `zarr.json` array metadata/codec equality where contract requires it, per-shard decode/checksum, and reopen/read behavior. Cost: update/build + inner encode + shard/index rewrite + store I/O + CPU/RSS + bytes/object count + temporary storage + read latency and recovery/validation.

Conditional ≤72h killer (not run): pin upstream commit and store semantics; obtain an official same-array mutation trace; force a small partial-shard update; compare current writer and candidate through crash/interruption/reopen; fail on reader/value/codec mismatch, configuration equivalence, wrapper requirement, missing atomicity route, or no full-cost residual.

## Outcome

`NOT_ADMITTED_UNFROZEN`; `PROPOSE_STAGE0: []`. The decision is not based on missing implementation, results, resources or AI readiness. No experiment, benchmark, download, automation, Stage0/A/B creation or shared-control modification occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
