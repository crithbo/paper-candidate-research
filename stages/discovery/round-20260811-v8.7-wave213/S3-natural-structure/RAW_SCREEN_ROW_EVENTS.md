# RAW_SCREEN_ROW_EVENTS — Wave213

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE213-VERSIONED-NATIVE-INDEX-CHURN-N3-BREADTH`. Cutoff: 2026-08-11. Authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.

| ID | public versioned native index/database artifact | layout-independent before/after phenomenon and intended same-object constructor | current state |
|---|---|---|---|
| RAW-213-01 | Common Crawl named CDX URL-index crawl releases | URL-key/record churn, duplicate URL-key locality and false-positive/load cost across named crawl indexes; exact CDX query-index construction | `DEEP_DIVE_REQUIRED` |
| RAW-213-02 | NCBI preformatted BLAST database updates | accession/sequence/index-volume churn and lookup/search load across successive database timestamps; exact BLAST v5 index constructor | `DEEP_DIVE_REQUIRED` |
| RAW-213-03 | USGS 3DEP lidar projects in Entwine Point Tile (EPT) form | point/tile hierarchy churn and spatial-query load across project releases; exact EPT hierarchy construction | `DEEP_DIVE_REQUIRED` |
| RAW-213-04 | Debian Snapshot dated `Contents`/package-index archives | path-to-package posting churn and false-positive/load profile between archive timestamps; exact Contents-index constructor | `NOT_ADMITTED_UNFROZEN`: no current Contents reader/builder union frozen here |
| RAW-213-05 | Ensembl release database dumps/indexes | stable identifier/posting churn between named releases; exact release-query index constructor | `NOT_ADMITTED_UNFROZEN`: adjacent native index artifacts/reader union not frozen from first-party source |
| RAW-213-06 | Internet Archive CDX index snapshots | URL-key/posting churn and lookup cost across index generations; exact CDX constructor | `NOT_ADMITTED_UNFROZEN`: official versioned artifact/checksum route and current constructor union not frozen |

All phenomenon schemas must be computed only from canonical key, record/posting identity, version/release time and native semantic fields—never physical shard order, compression order, cache state or preprocessing placement. Generic partitioning, parameter selection, cache/controller and external sidecar/delta mechanisms are excluded.

