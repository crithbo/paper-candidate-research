# RAW_SCREEN_ROW_EVENTS — Wave185

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE185-NATURAL-DYNAMIC-GRAPH-LOCALITY-N3-BREADTH`. Frozen cutoff: 2026-08-11. Authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.

The phenomenon schema is deliberately layout-independent: for a fixed time slice, it may use only node/edge identity, direction/type, timestamp/version and native metadata, never file order, shard placement, source order or an implementation cache.

| ID | versioned natural carrier | layout-independent phenomenon and candidate same-object action | oracle / initial witness | result |
|---|---|---|---|---|
| RAW-185-01 | OSM weekly full-history Planet and date-aligned full-history diffs | Relation/way member delta locality across consecutive slices; exact historical object-membership reconstruction. | Given object ID and time, exact version/member list; a member edit in one relation while an unrelated relation is unchanged. | `DEEP_DIVE_REQUIRED` |
| RAW-185-02 | Debian Snapshot dated archive states (roughly six-hour historic imports; timestamp API) | Dependency constraint churn locality between adjacent archive timestamps; exact install candidate set for frozen suite/arch. | APT package-universe solution under timestamp; one dependency-version change. | `DEEP_DIVE_REQUIRED` |
| RAW-185-03 | Ethereum ordered blocks / JSON-RPC block-height queries | Address/transaction incidence locality between consecutive block intervals; exact block/transaction projection. | `eth_getBlockByNumber` output at frozen height; a transaction-bearing block. | `DEEP_DIVE_REQUIRED` |
| RAW-185-04 | NCBI Taxonomy hourly `new_taxdump` plus monthly archive | Parent/child lineage churn locality across monthly dumps; exact ancestor/descendant relation closure. | Parent/child result for a frozen TaxId; merge/deletion/change edge. | `DEEP_DIVE_REQUIRED` |
| RAW-185-05 | crates.io/Cargo package dependency declarations | Proposed version-reuse locality between package-release observations. | Cargo resolver/`Cargo.lock` exact result is defined, but an official frozen global registry time-slice carrier was not established in this batch. | `NOT_ADMITTED_UNFROZEN` |
| RAW-185-06 | npm public registry package metadata | Proposed dependency-tree churn locality across publish events. | npm lock/install semantics are defined, but no official global version-slice carrier/oracle was frozen without using an uncontrolled mirror. | `NOT_ADMITTED_UNFROZEN` |

Excluded before deep review: file-order locality, data cleaning, generic graph partition/reordering, generic package solver/ILP, index selection, online controller, and any task that changes native output semantics.

