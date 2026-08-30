# UNIQUE_OPPORTUNITY_FAMILIES — Wave153

| Family | modality | natural structure predicate available from same input | intended exact contribution shape | uniqueness / boundary |
|---|---|---|---|---|
| PubChem structure search | molecular graph | query block-cut tree and cycle rank | FPT exact subgraph-search constructor | distinct graph corpus; rejected after current-union check |
| Rfam CM alignment | RNA sequence + secondary-structure graph | annotated base-pair graph pathwidth/branching | parameterized exact CM inference | distinct sequence/graph corpus; semantics not frozen |
| TreeBASE tree comparison | phylogenetic tree pairs | disagreement-component size on shared taxa | FPT exact agreement constructor | distinct tree corpus; oracle not frozen |
| TIGER boundary overlay | planar polygon graph | separator/boundary-interaction width | exact overlay DP | distinct geometric corpus; only generic index action found |
| USGS 3DEP neighborhood construction | point cloud / terrain | local occupancy and elevation continuity | exact spatial-neighborhood constructor | distinct sparse geometric corpus; only generic index action found |
| OpenAlex citation-induced graph | temporal directed graph | temporal cohort width | parameterized exact query constructor | distinct graph corpus; oracle/union not frozen |

The table is a unique-family inventory, not six candidate claims. Only PubChem, Rfam and TreeBASE reached candidate-grade deep review because they had a sufficiently concrete proposed atomic action to audit.

