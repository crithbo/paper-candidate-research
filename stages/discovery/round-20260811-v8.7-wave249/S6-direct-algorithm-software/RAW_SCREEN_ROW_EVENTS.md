# Raw screen rows

| Family | Heuristic constructor | Static same-object witness | Result |
|---|---|---|---|
| GNU gperf MPH | keyword association/graph and table layout | Two perfect-hash constructions can preserve keyword recognition. | UNFROZEN |
| GNU Bison table packing | parser action/goto table compression | Two table packings can preserve parser language/actions. | UNFROZEN |
| Graphviz dot layered layout | rank/crossing/coordinate heuristic | Two legal drawings preserve graph input but output coordinates are the object. | STRUCTURAL_DROP |
| CUDD BDD reorder | dynamic variable-reordering heuristic | Reorders preserve Boolean function but BDD identity/order is consumer-visible. | STRUCTURAL_DROP |
| GNU ar archive index | member/symbol-index construction | Member/index order can vary but archive resolution/order semantics intervene. | STRUCTURAL_DROP |
| Qhull facet construction | geometric conflict/horizon construction | Facet enumeration may vary, but proposed residual is existing geometric algorithm territory. | UNFROZEN |
