# N3 finite-closure matrix

| family | confounds / contrary explanation | strongest known comparator | finite closure and full cost |
|---|---|---|---|
| GBIF taxonomy ranking | taxon synonymy, collection bias, coordinate precision, record deletion, backbone change | GBIF download filters, taxonomic keys and latest-backbone portal | 20–50 DOI-pinned downloads; bytes, download/query, canonicalisation CPU-RSS, retained records, estimator time; no direct literature subtraction yet. |
| ClinicalTrials history | delayed reporting, sponsor/phase mix, archive availability, outcome edits | current study record and current history/metadata route | 20–50 NCT records across history versions; retrieval, diff/construct CPU-RSS, storage, cohort-query latency. |
| Crossref metadata | deposit lag, publisher policy, type/language, update/delete events | Crossref snapshot/API and publisher metadata | two public snapshots, 20 publisher/type strata; snapshot bytes, normalisation CPU-RSS, retained metadata, report time. |
| GBIF duplicate quotient | provider IDs, taxon remapping, coordinate uncertainty, shared specimens | GBIF keys and duplicate/filter facilities | only continue if a same-query stock-legal witness survives; otherwise direct absorption. |
| HEPData version ranking | revised tables, uncertainty conventions, record version choice | HEPData current record/version interface | pin 20 records and file checksums; parse/storage CPU-RSS, ordering calculation, retained inputs. |
| NOAA GOES reprocessing | sensor/geometry/cloud, algorithm collection change, event labeling | official product collection metadata and current reader | pin 20 scenes/events with product checksums; acquisition, decode, comparison CPU-RSS, storage, report latency. |

All laws remain unobserved hypotheses. None is a dashboard or synthetic anomaly, and no controller is represented as an exploitation mechanism.
