# Wave64 unique families

| Family | Fixed object/oracle | Strongest union | Natural carrier | Result |
|---|---|---|---|---|
| RH-HASH-BUILD | Fixed keys to exact lookup map | Robin-Hood/open-addressing build union | URL/dictionary keys | `DROP` |
| JUDY-INDEX-BUILD | Fixed keys to exact Judy lookup | Judy trie/index construction union | Public dictionaries | `DROP` |
| CARD-CNF-BUILD | Fixed cardinality constraint to equisatisfiable CNF | Sequential-counter/totalizer/sorting-network encoders | SAT competition constraints | `DROP` |
| LEVELDB-TABLE-BUILD | Fixed sorted KV sequence to native table reader semantics | LevelDB block/index/table builder union | Public KV traces | `DROP` |
