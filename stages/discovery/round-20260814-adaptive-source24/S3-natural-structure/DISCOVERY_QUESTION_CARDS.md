# Discovery question cards

Each card is evaluated before raw admission. `LOCATOR_ONLY` is non-scientific: it is neither a negative conclusion nor raw/C0 accounting.

| Card | Exact carrier/version | Same-object question/estimand | Type / endpoint / counterfactual | Required evidence still missing | Disposition |
|---|---|---|---|---|---|
| Q24-01 Common Crawl host/domain web-graph releases | `cc-main-2025-26-dec-jan-feb`, `cc-main-2026-jan-feb-mar`, `cc-main-2026-feb-mar-apr`, `cc-main-2026-mar-apr-may`; official release index and semantics [Web Graphs](https://commoncrawl.org/web-graphs). | Under fixed host/domain graph semantics, measure whether edge survival is stable after crawl-policy, truncation, interval and domain-cohort control. | N3/measurement; endpoint is held-out law; counterfactual is metadata-adjusted temporal null. | Non-controller decision consequence remains absent; exact identity is Source23 Common Crawl C0. | `EXCLUDED__SATURATED_SOURCE23_IDENTITY`. |
| Q24-02 Wikidata JSON/incremental dump chain | Weekly canonical JSON plus daily increments; stable JSON/RDF interface [Wikidata](https://www.wikidata.org/wiki/Wikidata%3ADatabase_download/en). | Under fixed statement-query semantics, estimate entity-property update locality with rank/qualifier/date controls. | N3/measurement; endpoint is held-out locality law; counterfactual time permutation. | Non-controller decision consequence absent; exact identity is Source23 Wikidata C0. | `EXCLUDED__SATURATED_SOURCE23_IDENTITY`. |
| Q24-03 OpenStreetMap full-history release chain | Public history extracts are a prospective carrier class, but an exact immutable release URL/checksum/date panel was not closed by this bounded locator. | Query-preserving topology/edit-churn law. | N3; endpoint would be a held-out temporal law and same-object offline construction decision. | Exact versioned carrier, independent subtractor, finite closure and non-generic action all absent. | `LOCATOR_ONLY__NOT_RAW_NOT_C0_NOT_SCIENTIFIC_STOP`. |
| Q24-04 Crossref metadata snapshot chain | Public metadata snapshots are a prospective carrier class, but no exact dated immutable snapshot/semantic oracle pair was closed. | Citation/metadata update churn estimand under fixed record semantics. | Measurement/N3; endpoint would be coverage/ranking-stability or a non-controller consequence. | Exact carrier, current union/subtractor, materiality threshold and finite closure absent. | `LOCATOR_ONLY__NOT_RAW_NOT_C0_NOT_SCIENTIFIC_STOP`. |

No mature tool or paper constructor was used as a primary origin. No card is a security-related topic.

## Precommit reconciliation

| Locator | Question-card complete? | Raw admission |
|---|---|---|
| Q24-01 | Yes, but saturated identity | No—excluded before raw |
| Q24-02 | Yes, but saturated identity | No—excluded before raw |
| Q24-03 | No | No—locator only |
| Q24-04 | No | No—locator only |

Fresh raw `0`; C0 `0`; score/ranking was not applied because there was no admissible raw. No outcome-aware backfill.
