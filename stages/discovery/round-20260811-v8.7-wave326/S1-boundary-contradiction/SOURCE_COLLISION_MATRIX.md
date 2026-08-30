# SOURCE_COLLISION_MATRIX

| Object | Current official source/documentation | Primary collision/subtractor | Outcome |
|---|---|---|---|
| Redis AOF | [Redis persistence docs](https://redis.io/docs/latest/operate/oss_and_stack/management/persistence/); [current `aof.c`](https://github.com/redis/redis/blob/unstable/src/aof.c) | [Correlated Crash Vulnerabilities, OSDI 2016](https://www.usenix.org/system/files/conference/osdi16/osdi16-alagappan.pdf); [fsync failures, ATC 2020](https://www.usenix.org/system/files/atc20-rebello.pdf) | Current manifest/rewrite union absorbs; papers diagnose old/fault-layer behavior, not a new same-object constructor. |
| containerd content | [official content flow](https://github.com/containerd/containerd/blob/main/docs/content-flow.md); [current core/content](https://github.com/containerd/containerd/tree/main/core/content) | current API/source union | Commit/abort/lease actions explicit; controller-only residual. |
| OCI Distribution | [official API V2](https://distribution.github.io/distribution/spec/api/); [current storage source](https://github.com/distribution/distribution/tree/main/registry/storage) | protocol's own PUT/PATCH/DELETE union | Finalization/cancellation already define visibility; controller-only residual. |
| Remaining seven | official/project source locations listed in `UNIQUE_OPPORTUNITY_FAMILIES.md` | not completed within bounded batch | `NOT_ADMITTED_UNFROZEN`; no absence assertion or scientific DROP. |
