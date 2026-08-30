# Natural-carrier type-split funnel

## Exact raw identities

| ID | Exact public natural carrier/version/date | Same-object problem/estimand | Type and finite closure route | Raw disposition |
|---|---|---|---|---|
| S23-01 Wikidata entity evolution | Weekly JSON dumps plus daily incremental dumps at `dumps.wikimedia.org/wikidatawiki`; JSON/RDF are stable interfaces [Wikidata](https://www.wikidata.org/wiki/Wikidata%3ADatabase_download/en). | Under fixed entity/statement query semantics, estimate whether incremental updates exhibit stable entity-property locality after controlling dump date, entity type, rank/qualifier and dump lag. | `N3` / `MEASUREMENT_CHARACTERIZATION`; 20 weekly dumps plus adjacent incrementals, stock JSON parser/query semantic checks, held-out weeks. | C0-1. |
| S23-02 Common Crawl temporal web graph | Official `CC-MAIN-2025-26`, `2026-08`, `2026-12`, `2026-17`, `2026-21` release paths/dates and official web-graph releases [June 2025](https://commoncrawl.org/blog/june-2025-crawl-archive-now-available) [May 2026](https://commoncrawl.org/blog/may-2026-crawl-archive-now-available). | Under fixed host/domain graph semantics, estimate whether observed churn/locality is stable after controlling crawl interval, fetch policy, truncation threshold, host/domain and release-specific crawler changes. | `N3` / `MEASUREMENT_CHARACTERIZATION`; official release metadata plus 20 version-pinned index/graph slices, held-out releases, full ingest/index/query/storage cost. | C0-2. |
| S23-03 MLPerf Tiny release panel | Official v1.3/v1.4 task/model/quality releases across accelerator classes. | Cross-accelerator phase/ranking estimand. | `BENCHMARK_DATASET`/measurement route. | Excluded before C0: active MLPerf boundary and mapping-selector risk. |
| S23-04 OpenStreetMap history extracts | Public planet/history releases are versioned natural geographic edits. | Query-preserving topology-churn estimand. | `N3`; would need a non-generic same-object decision action. | Raw only: no exact official immutable release/hash and finite action route was frozen in bounded review. |

Tools, readers, indexes and papers are secondary comparators/subtractors only; none is a primary origin.

## Type-specific C0

### S23-01 — N3 / measurement-characterization

- Versioned natural panel: closed by weekly complete JSON and daily incremental dumps.
- Estimand: update-locality concentration over `(entity type, property, rank/qualifier)` conditional strata.
- Confounds: dump lag; transient vs permanent changes; item/property mix; rank/qualifier representation; partial/incremental completeness.
- Independent validity subtractor: null temporal permutation within equal-size/date strata, and current dump documentation’s warning that order is not semantic.
- Full cost: download/parse CPU and RSS, temporary/decompressed bytes, stored representation, query CPU/latency; no cost was measured here.
- Held-out falsifier: effect reverses or is absent on pre-registered later weeks under the same strata.
- Decision consequence: no union-external non-controller action was named beyond generic incremental index/rebuild policy. Thus it fails the N3 action/decision requirement: `NOT_ADMITTED_UNFROZEN`.

### S23-02 — N3 / measurement-characterization

- Versioned natural panel: official monthly crawl IDs/dates and graph releases closed.
- Estimand: host/domain graph edge-survival and locality conditional on crawl policy/interval and domain cohort.
- Confounds: crawler change, fetch truncation (officially changed from 1 MiB to 5 MiB after March 2025), robots/non-200 policy, host/domain normalization and new-URL rate.
- Independent validity subtractor: release-metadata-adjusted temporal null and within-domain cohort holdout.
- Full cost: source index/graph retrieval, parsing, graph construction, storage, query CPU/RSS/latency; unmeasured at Discovery.
- Held-out falsifier: law does not survive a later crawl with fixed metadata/normalization scheme.
- Decision consequence: only snapshot/index selection or generic graph partitioning is currently named, both excluded. `NOT_ADMITTED_UNFROZEN`.

## Survival-trace decision

Type-specific C0 has closed carrier/estimand/confounds/falsifier, but not the mandatory non-controller same-object decision action. Therefore `TYPE_SPECIFIC_C0_FIELDS_CLOSED_AND_ABOUT_TO_ENTER_D1=false`; no single-witness trace is emitted. This preserves the single-trace budget for a genuine near-D1 action.

## D1/deep

Both C0 rows lack an action skeleton and small legal action witness. `D1=0`, `deep=0`, `clean brief=0`; unused capacity expired without backfill.
