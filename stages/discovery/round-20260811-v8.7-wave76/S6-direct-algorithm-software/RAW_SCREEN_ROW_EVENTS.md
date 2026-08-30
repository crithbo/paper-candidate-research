# Wave76 raw events

| raw | family | result |
|---|---|---|
| R01 | WiredTiger column-store page encoding | `DEEP → DROP` |
| R02 | HBase HFile block-index construction | `DEEP → DROP` |
| R03 | LMDB free-list/page construction | `DEEP → DROP` |
| R04 | PostgreSQL TOAST chunk construction | `DEEP → DROP` |
| R05 | Redis RDB encoding construction | `DROP` |
| R06 | FoundationDB tuple/key encoding | `DROP` |

Cross-deduplicated from registry, Wave29–74 and the unregistered S2 Wave70 exact-object boundary; no page/cache controller object retained.
