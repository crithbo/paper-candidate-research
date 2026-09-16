# Source and collision matrix

| Source | Evidence / result |
|---|---|
| [PostgreSQL current hash-index docs](https://www.postgresql.org/docs/current/hash-index.html) | Crash recovery, overflow behavior, VACUUM squeeze/recycling and exactly-one mapped bucket split. |
| [Current `hash.h`](https://github.com/postgres/postgres/blob/master/src/include/access/hash.h) | Metapage/bucket/overflow/bitmap state, mapping, split flags, build/insert/squeeze/vacuum paths. |
| [PostgreSQL source](https://github.com/postgres/postgres) | Canonical current implementation anchor; no old-document absence claim. |

Direct subtractor: linear/extensible hashing with overflow maintenance. Fixed mapping leaves no complete same-object split-assignment residual; an exhaustive literature census is not needed for this structural result.
