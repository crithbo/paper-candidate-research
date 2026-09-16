# Residual-survival cards

Assignment: `DISCOVERY-S3-20260814-ADAPTIVE-SOURCE08-R18V2`  
Method: canonical v8.7; claim-pack/V9: OFF; screen date: 2026-08-14.  
All six cards are neutral, pre-outcome screen records. “Witnessable” means that a finite test can be specified, not that the proposed law has been observed.

| ID | Exact immutable natural carrier | Neutral phenomenon / estimand | Candidate decision consequence | Residual-survival check | D1 witnessable? | Initial disposition |
|---|---|---|---|---|---|---|
| S08-01 | NCBI monthly `taxdump_archive` snapshots: `nodes.dmp`, `names.dmp`, `merged.dmp`, `delnodes.dmp` | Across adjacent monthly snapshots, estimate within-clade concentration of parent/name/merge edits after stratifying rank and total new taxids. | An update-aware lineage-query materialization rule with fixed TaxId/name/ancestor answers. | Natural archive and query semantics are clear, but the whole stock index/constructor union and a non-generic update action were not yet frozen. | Yes | `DEEP_DIVE_REQUIRED` |
| S08-02 | UniProtKB consecutive official release directories and release notes | Estimate whether reviewed-entry annotation changes have stable accession/cohort concentration after stratifying entry type and release size. | A release-aware accession/annotation lookup representation with unchanged record and query answers. | Previous releases are official, but current distribution/export construction and a target-specific, non-cache action are not closed. | Yes | `DEEP_DIVE_REQUIRED` |
| S08-03 | GTDB consecutive official release bundles | Estimate lineage reassignment concentration by rank and genome cohort, controlling for newly admitted genomes. | A characterization result could change release-comparison practice; a same-object constructor is presently unspecified. | The candidate is in danger of measuring taxonomy policy changes rather than a representation residual. | No | `NOT_ADMITTED_UNFROZEN` |
| S08-04 | Ensembl numbered archive releases and stable-ID history | Estimate stable-ID/transcript remapping regimes across adjacent releases, stratified by assembly and annotation source. | A release-transition uncertainty characterization could inform identifier-dependent analyses. | Ensembl states that one-to-one archive-page mapping is not always possible; same-object output cannot yet be frozen. | No | `NOT_ADMITTED_UNFROZEN` |
| S08-05 | NASA POWER datastore/service release-guide records and versioned data releases | Estimate geographic/parameter cohorts with repeated corrected values, controlling for provider and processing-release change. | A correction-risk characterization could change use of version-pinned climate inputs. | The public guide documents semantic data corrections; without immutable before/after data slices, a stable-law estimand is not closed. | No | `NOT_ADMITTED_UNFROZEN` |
| S08-06 | PubChemRDF monthly release metadata, version history and incremental Compound/Substance dumps | Estimate source-stratified record/predicate churn conditional on contributor and entity type. | A provenance-conditioned characterization could guide reproducible biomedical query snapshots. | Schema and contributor changes can change the query language/object; a same-object constructor is not yet identified. | No | `NOT_ADMITTED_UNFROZEN` |

## Source snapshot and canonical signatures

- S08-01 signature: `NCBI_TAXDUMP__MONTHLY_ARCHIVE__TAXID_LINEAGE_AND_NAME_QUERY__EDIT_CONCENTRATION_LAW__UPDATE_AWARE_MATERIALIZATION` — official archive/update evidence: <https://www.ncbi.nlm.nih.gov/books/NBK54428/>.
- S08-02 signature: `UNIPROTKB__CONSECUTIVE_OFFICIAL_RELEASES__ACCESSION_ANNOTATION_LOOKUP__COHORT_CHURN_LAW__RELEASE_AWARE_REPRESENTATION` — official downloads/release-history evidence: <https://www.uniprot.org/help/downloads>.
- S08-03 signature: `GTDB__CONSECUTIVE_RELEASE_BUNDLES__GENOME_TO_TAXON_LINEAGE__RANK_STRATIFIED_REASSIGNMENT_LAW` — official release route: <https://data.ace.uq.edu.au/public/gtdb/data/releases>.
- S08-04 signature: `ENSEMBL__NUMBERED_ARCHIVE_RELEASES__STABLE_ID_TRANSCRIPT_MAPPING__REMAPPING_REGIME_CHARACTERIZATION` — official archive evidence: <https://www.ensembl.org/info/website/archives/index.html>.
- S08-05 signature: `NASA_POWER__VERSIONED_DATASTORE_RELEASES__GRIDDED_PARAMETER_VALUE__CORRECTION_COHORT_LAW` — official release guide: <https://power.larc.nasa.gov/docs/release-guide/>.
- S08-06 signature: `PUBCHEMRDF__MONTHLY_RELEASE_METADATA__PROVENANCE_GRAPH_QUERY__SOURCE_STRATIFIED_CHURN_LAW` — official download/version evidence: <https://pubchem.ncbi.nlm.nih.gov/docs/rdf-ftp>, <https://pubchem.ncbi.nlm.nih.gov/docs/rdf-version>.

No source01–source07 identity was reused. No card asserts an observed positive stable law.
