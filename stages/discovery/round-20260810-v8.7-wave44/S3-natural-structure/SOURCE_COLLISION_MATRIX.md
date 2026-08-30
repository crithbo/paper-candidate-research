# Source / collision / six-dimensional residual matrix — WAVE44

## Current-upstream reality protocol

All entries use current official project/specification/API material cited in `DISCOVERY_LOG.md`, checked `2026-08-10`. No absence claim is based on issues, future work, failed download, or a missing benchmark. Native flags/formats/optimizer surfaces are treated as strong baselines, not automatic algorithmic absorption; each drop below instead follows the complete six-dimensional comparison.

| Lineage | Decision rule | Information | Complexity/resource | Quality/guarantee | Full cost | Generalization/no-gain | Outcome |
|---|---|---|---|---|---|---|---|
| Soufflé | relation representation/index selection | relation schema/access patterns | native B-tree/Brie/Eqrel build/memory | same least fixed point | compile/build/evaluation | only representation choice remains | `DROP__SELECTOR` |
| DuckDB | join order/build side/per-split plan | statistics and query | optimizer DP/intermediate materialization | same SQL result | planning + intermediates | direct SplitJoin family; no residual | `DROP__DIRECT_SUBTRACT` |
| ClickHouse | primary/skip/projection/granule layout | part values and predicates | native index/part write/read | same query result | index bytes, merge/write, scan | configuration dominates | `DROP__SELECTOR` |
| systemd journal | compression/object packing choice | append stream fields | writer/index/hash/entry arrays | native journal/file compatibility | write, index, seek, recovery | cross-entry packing changes object | `DROP__OBJECT_CHANGE` |
| Avro | block/codec selection | records/schema | writer/codec/sync handling | Avro reader/schema evolution | encode, marker, split/read | standardized actions only | `DROP__SELECTOR` |
| Redis | compact/general encoding transition | size/type/cardinality | native conversion and memory | command semantics | conversion, memory, operation latency | current union directly covers | `DROP__DIRECT_SUBTRACT` |
| eBPF verifier | abstract-state merge/pruning | kernel program state/CFG | verifier state storage/exploration | kernel safety/soundness | verification time/memory | only policy remains without new domain | `DROP__SELECTOR_OR_UNCLOSED_SOUNDNESS` |
| OpenJDK CDS | class archive membership/placement | classpath/loader metadata | dump/map/archive build | loader/classpath correctness | dump, archive, startup, RSS | cross-app method changes semantics | `DROP__OBJECT_CHANGE` |
| Prometheus TSDB | chunk/block/encoding transition | sample type/time series | WAL/head/block/compaction | ingest/query/storage semantics | write, compaction, query, retention | current format controls own action | `DROP__DIRECT_SUBTRACT` |
| SequenceFile | record/block compression and codec | key/value stream | writer block/codec/reader | file-reader compatibility | write, sync, split/read | native choice only | `DROP__SELECTOR` |

## Finiteness and action-divergence audit

No near-threshold line had both (i) a union-external complete static action and (ii) a finite same-object fidelity closure plan. The tempting witnesses—different relation layouts, join trees, granule sizes, codecs, encodings, verifier cache policies, archive memberships, chunk transitions and compression blocks—each alter only a native action/configuration or change the reader/loader/kernel semantics. Therefore no `TOPIC_BRIEF` is emitted and no artificial synthetic witness is substituted for a natural positive route.
