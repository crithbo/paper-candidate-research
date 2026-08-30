# Unique opportunity family — OpenSky spatiotemporal law

## UF-142-01

### Exact semantic object and task

The object is a frozen sequence of OpenSky aircraft state observations: aircraft identifier, timestamp, position, altitude, velocity/heading fields where present, and the relevant source/coverage metadata. A valid representation/query task must return the same selected state records and field values under frozen temporal/spatial predicates. It cannot change to trajectory prediction, reconstruction, clustering labels, anomaly detection, route inference, or an error-tolerant simplification task.

### Dataset/version/license closure

- Candidate source: official OpenSky historical database/Trino or a named official pre-curated dataset, with query text, extraction date, schema, licence grant, coverage region and a content hash frozen before any test.
- Current reality: the full historical data service is available to university-affiliated researchers, aviation authorities and government organizations through Trino; public API access is limited. OpenSky's license permits non-profit research/education under its agreement and requires appropriate authorization.
- Result: no particular immutable public trajectory subset plus checksum/version was identified without applying for access or downloading data. This is a resource/fidelity condition, not a scientific DROP.

### Stable-law contract (not a result)

The law would require reproducible evidence that a phase/turnpoint statistic is stable on held-out region and held-out time. The frozen analysis must:

1. stratify by origin-destination, aircraft/airframe where available, altitude band, flight phase proxy and local time;
2. include receiver coverage, source type (ADS-B/ADS-C/FLARM), message rate, sampling gaps and missing-field masks as covariates;
3. test region-held-out and time-held-out transfer against route/aircraft/coverage-matched permutations;
4. report exact state completeness, not merely reconstruction error.

No official or original-paper source located in this review supplies that full multi-region, multi-time controlled result. A single-route study or an ML prediction/recovery result cannot substitute.

### Proposed utilization and action-gap result

Potential actions—trajectory simplification, low-rank recovery, differential coding, route clustering and prefetch/index selection—either alter the exact state/query object, are ordinary compression/index/controller choices, or need a frozen current baseline union. No union-external full constructor was named.

### Status

`NOT_ADMITTED_UNFROZEN`. No lack of implementation, result, compute, data-access approval or AI readiness is interpreted as scientific failure.
