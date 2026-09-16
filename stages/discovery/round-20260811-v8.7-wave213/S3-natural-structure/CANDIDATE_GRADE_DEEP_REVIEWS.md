# CANDIDATE_GRADE_DEEP_REVIEWS — Wave213

## DEEP-213-01 — Common Crawl CDX version churn: `NOT_ADMITTED_UNFROZEN`

- **Natural carrier/oracle.** Common Crawl publishes named crawl CDX URL indexes and an index server that returns matching CDX records. Freeze two release names, response/index listing metadata and an exact query key/predicate. The stock oracle is the returned exact record set.
- **Phenomenon schema/confounds.** Pre-register adjacent-release key additions/deletions, posting overlap, response cardinality and query/load bytes; stratify URL domain, canonical URL key class, crawl interval and query predicate. Never use shard layout, index ordering or cache hits.
- **Whole action/witness.** Candidate would build an exact CDX-native posting constructor whose prefix/range lookup output equals the stock response. Witness: one URL key changes, another matched key remains; two physical source orders must yield identical records and continuation semantics.
- **Union/full cost/72h killer.** The current public CDX server itself supplies the native query, and Common Crawl documents offline index use. But no current CDX builder source/config/action union or before/after artifact checksum pair was frozen, so no absence or absorption claim beyond stock query output is valid. Full cost: release acquisition/checksum, build/update/query CPU/RSS, bytes, record verification and load. Killer: 20–50 preregistered queries on two named indexes plus held-out crawl; any record mismatch or controlled-law reversal rejects. Not run.
- **Decision.** `NOT_ADMITTED_UNFROZEN`.

## DEEP-213-02 — NCBI BLAST v5 index churn: `NOT_ADMITTED_UNFROZEN`

- **Natural carrier/oracle.** NCBI distributes regularly updated preformatted BLAST databases, including taxonomic information and identifier indices. `blastdbcmd` reads the DB and reports/extracts native entries; `makeblastdb` produces v5 (LMDB) databases by default in current documented behavior.
- **Phenomenon schema/confounds.** Across two timestamped database releases, calculate accession/sequence additions/deletions, index-volume overlap, masked/unmasked state and query selectivity; control database name, molecule type, masking, taxonomic payload, format version and build settings.
- **Whole action/witness.** Candidate needs an exact independently readable v5 construction with native identifier/search results, not merely incremental download. Witness: one changed accession and one unchanged accession must retain `blastdbcmd` results and current DB metadata under two input orders.
- **Union/full cost/72h killer.** The current documented union includes download/update, `blastdbcmd`, and `makeblastdb`, with input type, `dbtype`, `parse_seqids`, masking, v5/LMDB and map-size boundary evidence. No current source commit, all flags/config or verified release-pair hash route was frozen, and no controlled churn law is measured. Full cost must include source/release bytes, database build/update/search CPU/RSS, LMDB mapping, storage and native query equivalence. Killer: 20–50 accession/query cases on two freeze-pinned releases and a held-out release; any native mismatch or law failure rejects. Not run.
- **Decision.** `NOT_ADMITTED_UNFROZEN`; not a negative inference from missing execution/resources.

## DEEP-213-03 — USGS 3DEP EPT hierarchy churn: `NOT_ADMITTED_UNFROZEN`

- **Natural carrier/oracle.** USGS LidarExplorer uses EPT for public 3DEP lidar projects to visualize/search point clouds. Exact object is a named project/release EPT hierarchy and its native point/tile selection semantics.
- **Phenomenon schema/confounds.** Compare canonical spatial bounds, point IDs/classes and hierarchy node occupancy across release/project pairs; control project area, acquisition date, quality level, point classification, density and query box. Do not use storage tile order or viewer cache.
- **Whole action/witness.** Candidate would construct an independently valid EPT hierarchy preserving exact point/tile selection and hierarchy metadata. Witness: one changed spatial node and one unchanged node must produce identical native selected points under different file orders.
- **Union/full cost/72h killer.** USGS documents EPT as its LidarExplorer visualization format, but neither current Entwine builder source/config/full action union nor a public paired-release EPT checksum route was frozen. Existing viewer/index behavior cannot be guessed into an action gap. Full cost includes EPT hierarchy/data bytes, build/update/query CPU/RSS, storage and point-set verification. Killer: two official project/release artifacts, 20–50 spatial selections and held-out project; any point/hierarchy mismatch or controlled-law reversal rejects. Not run.
- **Decision.** `NOT_ADMITTED_UNFROZEN`.

