# Current-union / contrary matrix

| RQ | current union / direct contrary | decision |
|---|---|---|
| S65-01 | allocator algorithm selection, range splitting, spill-temp and frame constraints | generic register-allocation skeleton; no raw |
| S65-02 | immutable prior graph, fingerprint lookup, try-mark-green, old-node/edge copy and changed-node construction | existing incremental graph mechanics or generic cache policy; no raw |
| S65-03 | binding descriptors, layout creation, compatibility/validation, explicit and auto layout semantics | no legal same-object action beyond specified descriptors; no raw |

The matrix makes no completeness or absence claim beyond the cited current surfaces, and no `NO_MATCH` result is treated as novelty.
