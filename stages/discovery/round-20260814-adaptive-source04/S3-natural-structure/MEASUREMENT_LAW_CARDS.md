# Immutable-carrier measurement law cards

## Carrier facts

- **EDGAR:** SEC documents static quarterly full indexes, daily feed/oldload archives, unique accession numbers and accession-number paths. SEC also says an original filing and a correction normally remain publicly available. A finite carrier is 20 issuer/form amendment chains, pinned by accession number, index path, size and retrieval date.
- **PubMed:** NLM defines the yearly baseline as a complete snapshot and daily update sequence as the record of new/revised/deleted citations. A finite carrier would be one baseline plus 20 numbered updates and their official statistics/README entries. Absence of a checksum in the materials inspected is a closure gap, not a result.
- **Software Heritage:** SWHIDs are documented as persistent and stable; snapshot identifiers are intrinsic SHA-1 hashes of manifests. The dated graph exports document their scope and explicitly note a prior re-upload following a compression defect—therefore an export date alone is insufficient without object IDs and a file-level integrity route.
- **OSM:** the hypothesised replication-diff law was rejected before depth because the required official, checksum-pinned finite carrier was not established in this bounded search.

## Falsifiers and full cost

| family | finite falsifier | full-cost denominator |
|---|---|---|
| EDGAR amendment lag | 20–50 form-homogeneous chains; reject if adjusted ordering has no hold-out reversal or is explained by form/processing strata. | archive/index retrieval, parse/link CPU-RSS, retained raw filings, estimator/report latency. |
| PubMed revision regime | one baseline plus 20 updates; reject if revision-aware and naïve topical rankings coincide under date/status controls. | baseline/update bytes, XML parse/storage, revision reconstruction CPU-RSS, query latency. |
| SWH provenance coverage | 20 origins across two dated export/object-ID panels; reject if coverage/order sensitivity vanishes under archive-time/hosting control. | SWH query/export subset bytes, graph traversal CPU-RSS, retained identifiers, reporting time. |
| OSM footprint certificate | reject unless a checksum-pinned 20–50 diff set and stock topology oracle are first frozen. | diff retrieval, affected-subgraph construction, oracle CPU-RSS, retained certificate bytes. |
| SWH provenance quotient | reject if current graph/hash APIs equivalently represent the quotient with no new guarantee. | graph subset, construction memory/time, index bytes, query latency. |
| EDGAR fact sequence | direct drop: SEC’s published consolidation has the same amendment-chain information and outcome. | not applicable after absorption. |

## Sources and subtractors

- SEC EDGAR access/API and correction guidance: https://www.sec.gov/search-filings/edgar-search-assistance/accessing-edgar-data ; https://www.sec.gov/submit-filings/filer-support-resources/how-do-i-guides/correct-or-delete-filing ; SEC Regulation D report (original-accession amendment consolidation).
- NLM PubMed baseline/update and maintenance documentation: https://pubmed.ncbi.nlm.nih.gov/download/ ; https://www.nlm.nih.gov/bsd/licensee/medline_maintenance.html .
- Software Heritage persistent identifiers and dated graph-export documentation: https://docs.softwareheritage.org/devel/swh-model/persistent-identifiers.html ; https://docs.softwareheritage.org/devel/swh-export/graph/dataset.html .

These current first-party sources are evidence for carrier semantics and existing action union. They do not establish any positive stable law.
