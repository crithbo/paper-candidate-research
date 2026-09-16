# Canonical current-source and collision matrix

| Family | First-party current anchor | Same-object subtraction | Result |
|---|---|---|---|
| Tesseract DAWG | Tesseract `dawg2wordlist` manual and training documentation | Existing DAWG/trie/minimal-automata literature must be closed after producer-source union | `NOT_ADMITTED_UNFROZEN` |
| HarfBuzz subset | HarfBuzz source and `hb-subset` manual | Native default GSUB layout closure; no-layout-closure is an explicit option | `STRUCTURAL_DROP` |
| SUNDIALS Jacobian | LLNL SUNDIALS official source and documentation | Sparse Jacobian/preconditioner algorithms require source and primary-collision closure | `NOT_ADMITTED_UNFROZEN` |
| Gecode extensional | Gecode extensional reference and current module documentation | Documented DFA, TupleSet, compact-table and layered-graph propagation variants | `STRUCTURAL_DROP` |

No current-absence claim supports an admission. The two unfrozen rows are
search-bounded open, not negative scientific findings.
