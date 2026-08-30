# SOURCE_COLLISION_MATRIX

| Family | Current first-party source / documentation | Primary same-object collision | Result |
|---|---|---|---|
| LMDB | [current `mdb.c`](https://github.com/LMDB/lmdb/blob/mdb.master/libraries/liblmdb/mdb.c); [OpenLDAP backend guide](https://www.openldap.org/doc/admin26/backends.html) | [ATC 2020 fsync failures](https://www.usenix.org/system/files/atc20-rebello.pdf); [OSDI 2014 filesystem semantics](https://www.usenix.org/system/files/conference/osdi14/osdi14-paper-pillai.pdf) | Alternating meta page/root protocol and recovery rule directly described; no union-external action. |
| MySQL | [current `binlog.cc`](https://github.com/mysql/mysql-server/blob/trunk/sql/binlog.cc); [MySQL 8.4 binary log](https://dev.mysql.com/doc/refman/8.4/en/binary-log.html); [current binary-log variables](https://dev.mysql.com/doc/refman/8.4/en/replication-options-binary-log.html) | [Removing Double-Logging with Passive Data, FAST 2022](https://www.usenix.org/system/files/fast22-huang.pdf) | Ordered group-commit and server/engine recovery contract directly subtract proposed reordering. |

No old issue, future-work statement, or missing implementation is used as negative evidence.
