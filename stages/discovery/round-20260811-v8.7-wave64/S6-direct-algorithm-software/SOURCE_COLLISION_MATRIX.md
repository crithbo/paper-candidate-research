# Source and collision matrix — Wave64

| Family | Primary/current source | Current action / collision |
|---|---|---|
| Robin Hood hashing | [original paper](https://doi.org/10.1145/800025.1198374) | Direct open-addressing/displacement construction family. |
| Judy | [Judy project](http://judy.sourceforge.net/) | Native trie/index node construction union. |
| Cardinality encodings | [Bailleux & Boufkhad](https://doi.org/10.1007/978-3-540-24605-3_38) | Direct CNF encoding family; generic optimizer excluded. |
| LevelDB tables | [LevelDB documentation/source](https://github.com/google/leveldb) | Native block/index/filter table builder union. |

No retained residual relies on a source-absence claim. Current actions are positive direct subtractors, and no generic ILP/postprocessor is treated as a valid constructor.
