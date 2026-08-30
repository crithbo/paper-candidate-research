# SOURCE_COLLISION_MATRIX — Wave160

Frozen cutoff: 2026-08-11. Sources are official/first-party data providers and documentation; no retrieval workload or experiment was executed.

| family | frozen natural carrier / source | current action/config union evidence | collision / action-gap finding | outcome |
|---|---|---|---|---|
| Reactome | [V97 home/data access](https://reactome.org/); [data model](https://reactome.org/documentation/data-model/) | [Content Service](https://reactome.org/dev/content-service/) and current official [Cypher example](https://reactome.org/documentation/faq/43-graph-database-and-cypher-query/222-disease-to-pathways-api-or-neo4j) expose IDs, entity/event relations and graph queries | direct same-object projection/reachability union | `DROP` |
| ChEBI | [downloads](https://www.ebi.ac.uk/chebi/downloads/); [ontology version](https://www.ebi.ac.uk/ols4/ontologies/chebi) | [ChEBI 2.0 API](https://www.ebi.ac.uk/chebi/webServices.do) lists `children`, `parents`, `all_children_in_path`, search endpoints | direct same-object path/closure union | `DROP` |
| Crossref | [REST API](https://www.production.crossref.org/documentation/retrieve-metadata/rest-api/); [typed relations](https://www.production.crossref.org/documentation/schema-library/markup-guide-metadata-segments/relationships/) | record retrieval/filter/facet endpoints are documented | no canonical exact typed-relation-closure oracle or constructor union frozen | `NOT_ADMITTED_UNFROZEN` |
| GDELT | [GKG 2.1 codebook](https://data.gdeltproject.org/documentation/GDELT-Global_Knowledge_Graph_Codebook-V2.1.pdf) | schema/provenance fields documented | no same-object exact projection oracle/union frozen | `NOT_ADMITTED_UNFROZEN` |
| NHDPlus HR | [USGS guide](https://pubs.usgs.gov/sir/2025/5031/sir20255031.pdf) | national network supports navigation/analysis/data display | no current executable exact reach-set union frozen | `NOT_ADMITTED_UNFROZEN` |
| BioSample | [NCBI documentation](https://www.ncbi.nlm.nih.gov/biosample/docs/) | reciprocal sample/data/BioProject links and structured attributes documented | no frozen native closure output/strongest executable union | `NOT_ADMITTED_UNFROZEN` |

`CURRENT_UPSTREAM_REALITY_CHECK`: Reactome and ChEBI make the relevant current action explicit; their documented service endpoints and graph-query capability are the recorded adverse evidence. The other four rows make no implementation-absence claim, so no unsupported “current system lacks X” inference is made.

