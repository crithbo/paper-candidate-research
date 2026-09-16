# Discovery log — DISCOVERY-S6-20260809-V8.4-WAVE7

## Boundary

- Wrote only this assignment directory.
- Used the accepted/calibrated production `DISCOVERY_METHOD_V2_V8_1`; explicitly excluded TLS-blocked `v8.2r2`.
- Used paper originals and official/upstream RocksDB/Zstd documentation/source only, current to 2026-08-09.
- Excluded Git pack, PB deletion, all Wave4 and Wave5 exact objects, and terminal-topic revival.
- No E-drive reference, benchmark, experiment, Stage 0/A/B creation, master-file mutation, or status transition.

## Baseline-residual-first trace

1. Chose a public CPU object with a machine-checkable contract: fixed KV manifest to a standard RocksDB SST.
2. Froze current dictionary modes, byte/buffer/training settings, reader/cache costs and no-dictionary alternative before creating a mechanism.
3. Subtracted Zstd Cover/FastCover/trainer and RocksDB's existing per-SST buffering/training/persistence design.
4. Rejected parameter changes, cross-SST policy and external reorder as non-residual actions.
5. Kept only a possible internal retained-cover construction under identical input, budget, trainer and format; its novelty is `SEARCH_BOUNDED_OPEN` pending independent Stage 0 review.

## Source observations

- RocksDB's official dictionary design says per-SST scope replaced adjacent-file scope because same-file data can be more correlated; it buffers output blocks, trains/persists a dictionary, and identifies memory/cache/read costs.
- The official BlockBasedTable format states that entries are sorted, blocks are independently compressed, dictionaries reside in a metadata block, and the documented sampling mode is uniformly random 64-byte samples.
- Upstream Zstd says its trainer uses supplied samples and already exposes random capping plus Cover/FastCover dictionary algorithms. Therefore none can be claimed as a contribution.

## Outcome

`ROCKSDB-DICT-COVER` is the sole conditional recommendation: `TIER_B_Q2_VIABLE` structural potential; `MODERATE_FINITE_CPU_ROUTE` current evidence readiness. Its finite killer requires residual action coverage, strict reader equivalence and non-dominated fully charged size/write/read results. There is no current performance or correctness result.
