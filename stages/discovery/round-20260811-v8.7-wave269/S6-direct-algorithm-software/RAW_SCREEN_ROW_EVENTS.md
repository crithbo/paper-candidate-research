# Witness-first raw screen

| Family | Oracle and action witness | Status |
|---|---|---|
| CUDD BDD reorder | Fixed Boolean function; BDD equivalence checker; distinct variable orders can represent it. | `NOT_ADMITTED_UNFROZEN` |
| ABC logic mapping | Fixed Boolean network and equivalence checker; distinct cut/mapping choices can preserve logic. | `NOT_ADMITTED_UNFROZEN` |
| clangd background index shard | Fixed compilation database/source symbols; stock navigation result; distinct shard emission histories possible. | `NOT_ADMITTED_UNFROZEN` |
| Universal Ctags tag writer | Fixed source symbols and libreadtags lookup; tag ordering variants. | `STRUCTURAL_DROP`: ordering is reader-visible or routine sorting. |
| libsolv solv-file builder | Fixed package universe and solver result; ID/table representations vary. | `NOT_ADMITTED_UNFROZEN` |
| Doxygen search-index writer | Fixed extracted entities/query result; serialized index ordering variants. | `STRUCTURAL_DROP`: stock reader contract/action union not frozen to a non-routine constructor. |

Each row was screened against registry and current lane objects before promotion. No row was admitted solely because a representation can vary.
