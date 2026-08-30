# Wave76 unique families

| family | fixed reader/format | union | natural carrier | outcome |
|---|---|---|---|---|
| WT-COLPAGE | fixed column records to WiredTiger read semantics | native page/column encoding union | public KV tables | DROP |
| HFILE-INDEX | fixed KV blocks to HFile reader | native block/index builder | HBase sample tables | DROP |
| LMDB-PAGE | fixed KV state to LMDB reader | B+tree/free-list construction | public KV traces | DROP |
| PG-TOAST | fixed value to TOAST reader semantics | native chunk/compression/page union | public SQL tables | DROP |
| REDIS-RDB | fixed DB to RDB load semantics | RDB writer/encoding union | Redis datasets | DROP |
| FDB-TUPLE | fixed tuple set to key decode order | tuple encoding union | public KV keys | DROP |
