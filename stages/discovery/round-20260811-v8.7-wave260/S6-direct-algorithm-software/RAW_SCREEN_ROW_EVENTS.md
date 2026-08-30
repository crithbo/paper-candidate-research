# Witness-first raw screen rows

| Family | Fixed object and stock oracle | Minimal action-divergence witness | Status |
|---|---|---|---|
| Xapian Glass B-tree bulk construction | Fixed term/posting set; stock Xapian query result/digest | Two legal page-fill/split histories can yield equal postings results | `NOT_ADMITTED_UNFROZEN` |
| GNU gettext `.mo` hash-table writer | Fixed messages/plurals/context; stock gettext lookup | Two hash-table size/order assignments decode to equal translations | `NOT_ADMITTED_UNFROZEN` |
| Sphinx Search inverted-index builder | Fixed documents/analyzer/query semantics; stock search result oracle | Posting-block and dictionary partition choices may differ | `NOT_ADMITTED_UNFROZEN` |
| Fossil artifact delta constructor | Fixed content graph and artifact verification | Different legal delta bases may reconstruct equal artifact content | `STRUCTURAL_DROP`: version-control/delta object is too close to excluded history and has no frozen fresh guarantee. |
| GNU `ar` archive symbol-index writer | Fixed member bytes/symbol resolution; stock linker/archive reader | Member/index layout variants preserve contents | `STRUCTURAL_DROP`: ordering is linker-observable or routine writer engineering. |
| libsolv repository solv-file builder | Fixed package universe and SAT/query results; stock libsolv reader | Equivalent ID/order layouts may decode equally | `NOT_ADMITTED_UNFROZEN` |

No row is admitted from mere representation freedom.
