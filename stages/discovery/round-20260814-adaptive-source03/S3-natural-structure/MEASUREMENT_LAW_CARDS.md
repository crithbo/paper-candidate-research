# Measurement-law cards

Each card states a preclaim rather than an observed result. `UNFROZEN` means the missing closure is documented, not that the law is false.

## M1 — CrUX field-UX cohort-composition ranking reversal

- **Exact object and observable:** origin-level LCP performance ordering from monthly `chrome-ux-report.all.YYYYMM` records, compared with the ordering after a pre-registered common device/network mixture is applied to the corresponding raw histograms.
- **Natural carrier / public slice:** the official BigQuery monthly tables from 2017 onward; a bounded plan is 24 non-overlapping monthly releases `202401`–`202512`, with origin, form factor, effective connection type, LCP histogram and eligibility retained. Google documents the monthly tables and the raw schema.
- **Denominator:** origins present in every training/holdout month with all predeclared strata above the official reporting threshold; rank association and pairwise reversals are reported only within that common panel. This avoids interpreting origin entry/exit as a quality change.
- **Confounds / contrary explanation:** origin eligibility, traffic mix, coarse popularity rank, overlapping 28-day periods, missing strata, and aggregation precision. The History API is specifically unsuitable for independence tests because its weekly periods overlap; the monthly BigQuery releases are the proposed carrier.
- **Decision consequence:** if the controlled reversal persists, overall p75 should not be used alone for origin-ranking or comparative field-performance claims; reports should publish a fixed target mixture and a sensitivity interval.
- **Current union and collision:** CrUX exposes aggregate, device and country summaries, raw histograms, and an API with optional form-factor aggregation. Sengupta et al. (2023) already examine device/country variation and performance differences; this is a direct partial subtractor, so a brief would need to establish that it does not already test a fixed-mixture origin-ranking estimand.
- **Fidelity / 72-hour falsifier:** use 20 training and 4 held-out monthly tables; run the same fixed-mixture estimator with and without country restriction. Reject the preclaim if rank reversals disappear under the common-panel/stratum rules or are no larger than bin-resolution sensitivity.
- **Closure result:** `NOT_ADMITTED_UNFROZEN__IMMUTABLE_CARRIER_AND_COLLISION_SCOPE_NOT_CLOSED`. Official documentation establishes monthly release organization, but does not state an immutable table checksum/version contract; no read-only download/query was authorized to freeze a reproducible slice. The direct paper collision is partial but not closed at candidate grade.

## M2 — GDELT language/source-composition event-ranking reversal

- **Exact object:** daily GDELT 2.0 Event records, with event-type/location rankings measured under a fixed source-language mixture.
- **Carrier:** official date-named event ZIP files and the official index’s MD5/file-size listing; the file path and digest are a version-pinned natural news-event trace.
- **Law / consequence:** test whether country/event rankings reverse after language/source balancing across weekly holdouts; a confirmed law would change what comparative conflict/event inferences can be reported from raw event counts.
- **Confounds:** reporting availability, translation pipeline, source duplication, taxonomy changes and geopolitical news volume. These have stronger explanatory priority than a purported new law.
- **Closure result:** `NOT_ADMITTED_UNFROZEN__DIRECT_MEASUREMENT_LITERATURE_AND_CANONICAL_SOURCE_PANEL_UNCLOSED`. No new claim or brief.

## M3 — Common Crawl capture-coverage cohort reversal

- **Exact object:** capture-status and content-digest records for the same canonical URL cohort across named Common Crawl releases.
- **Carrier:** release-specific CDXJ indexes; each record gives timestamp, URL, status, digest, WARC filename, offset and length. The current documentation describes monthly index releases and their queryable immutable-looking record identifiers.
- **Law / consequence:** test whether domain/language coverage rankings reverse after a fixed URL-age/language/status mixture is applied across crawl releases; a positive result would change how web-measurement studies select and compare crawl snapshots.
- **Confounds:** crawl seed policy, robots/access failures, URL canonicalisation, response status and language classifier error.
- **Closure result:** `NOT_ADMITTED_UNFROZEN__CROSS_LANE_WEB_CORPUS_RISK_AND_COLLISION_UNCLOSED`. The family is not advanced: its measurement object may overlap previously reviewed WebGraph/web-corpus work, and a literature subtraction was not bounded.

## M4 — GHCN-Hourly revision/coverage regime bias

- **Exact object:** station-hour observations and quality/availability fields in versioned GHCNh archive releases.
- **Carrier:** NOAA’s documented archive filename convention includes product version, data date and creation date; this can identify 20–50 archived files without using a synthetic weather benchmark.
- **Law / consequence:** test whether station or region extremum/coverage rankings persist after version, station continuity and source-provenance standardisation. If not, climatological comparison should publish revision/coverage sensitivity rather than a single ranking.
- **Confounds:** station additions/removals, source substitution, quality-control releases, observing-time changes and spatial coverage.
- **Closure result:** `NOT_ADMITTED_UNFROZEN__KNOWN_QC_AND_CLIMATE_HOMOGENISATION_UNION_NOT_SUBTRACTED`. NOAA already documents extensive QC and changing coverage; no candidate-grade novelty claim is made.

## M5 — ICOADS release/provenance regime bias

- **Exact object:** individual marine surface observations and monthly summaries across official ICOADS releases.
- **Carrier:** official year-month IMMA/CSV archive access and release provenance; NOAA states that releases gain coverage, quality and metadata while the data are updated daily.
- **Law / consequence:** test whether regional marine climate anomaly rankings reverse under a fixed observation-platform/provenance mixture across releases; if stable, it would specify when release-to-release comparisons are decision-safe.
- **Confounds:** ship/buoy/platform mix, new source incorporation, metadata revisions, changing spatial coverage and QC.
- **Closure result:** `NOT_ADMITTED_UNFROZEN__RELEASE_VERSIONS_AND_EXISTING_CLIMATE_ADJUSTMENT_UNION_UNCLOSED`. No frozen release-pair panel or literature subtraction was available within bounded inspection.

## M6 — USGS ComCat preferred-solution revision ranking

- **Exact object:** ComCat event products and preferred origin/magnitude solution versions for the same event identifiers.
- **Carrier:** USGS documents unique identifiers for specific product versions and data types/terms; a finite carrier would pin product-version payloads for 20–50 events in a predeclared magnitude/time window.
- **Law / consequence:** test whether hazard-relevant event ordering changes systematically as preferred products are revised, conditional on event age, network/agency and magnitude band. A positive law would change retrospective catalog study protocols.
- **Confounds:** legitimate late-arriving observations, analyst review, agency/network differences, product-type semantics and event mergers.
- **Closure result:** `NOT_ADMITTED_UNFROZEN__PUBLIC_ARCHIVE_SLICE_AND_EXISTING_SEISMOLOGICAL_REVISION_COLLISION_UNCLOSED`.

## Primary source triads

1. CrUX: official BigQuery schema and history-pipeline documentation; the public release route; Sengupta et al., *Through the Lens of Google CrUX* (2023), arXiv:2308.06409.
2. GDELT: official daily-file index with checksums; Event Database Codebook v2.0; GDELT 2.0 primary project description.
3. Common Crawl: official CDXJ specification; official index/API route; WARC record fields including capture digest.
4. GHCNh: NOAA official archive filename/version documentation; NCEI Global Hourly/ISD description; cited NCEI QC documentation.
5. ICOADS: NOAA official product description; year-month archive route; release/provenance documentation.
6. ComCat: USGS ComCat documentation; product-version/event-term documentation; current API/catalog semantics.
