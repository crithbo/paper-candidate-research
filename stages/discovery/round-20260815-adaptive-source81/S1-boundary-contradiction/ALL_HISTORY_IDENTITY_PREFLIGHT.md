# All-history five-field identity preflight

Candidate signature:

`JAVA_FFM_ARENA__SCOPE_CLOSE_TEMPORAL_ACCESSIBILITY__FIXED_MEMORYSEGMENT_FOREIGNCALL_ENDPOINT__JAVA_FFM_FULL_COST`

| Field | Frozen value |
|---|---|
| Object | Java FFM `Arena` and its associated `MemorySegment` objects |
| Action/estimand | scope placement/partition and close timing |
| Endpoint | fixed values/call results with spatial, temporal, and thread-access guarantees |
| Guarantee | same arena kind where relevant and same explicit-close observation |
| Full cost | native bytes retained/released, allocation/close CPU, segment checks, thread coordination, downcall and end-to-end work |

Bounded inspection of the permitted shared registry/plan material found no exact five-field match. This is `NO_MATCH__NOT_NOVELTY_PROOF`; broad runtime, foreign-memory, or ABI overlap is RELATED_ONLY. Frozen R64, terminal, and held inputs were not read.
