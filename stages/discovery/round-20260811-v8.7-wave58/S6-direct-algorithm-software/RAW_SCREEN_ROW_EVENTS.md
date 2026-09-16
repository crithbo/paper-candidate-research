# Wave58 raw screen events

| raw_id | unique family | result |
|---|---|---|
| R01 | Cuckoo-filter bucket assignment | `DROP` |
| R02 | XOR/fuse-filter static construction | `DEEP` |
| R03 | Quotient-filter cluster construction | `DROP` |
| R04 | BBHash minimal-perfect-hash build | `DROP` |
| R05 | MARISA static trie construction | `DROP` |
| R06 | Cedar double-array trie construction | `DROP` |
| R07 | Aho–Corasick automaton construction | `DROP` |
| R08 | Bloom-filter bit allocation/build | `DROP` |

`repeat=0`: excluded Wave56 graph-ordering/packing, earlier PTHash/FST/Hyperscan/Lucene FST/Roaring objects, online sketches, natural-phenomenon utilization and S4 objective changes.
