# Source116 S5 merged-patch lineage seed pool

Offline, non-evidentiary seed generation completed before source lookup.  Each item requires an exact merged patch, parent/current source and a changed test before it can be a locator.  Source115 issue-only, old-release-only and generic negative-replication identities are excluded by the assignment-local denylist.

| Seed | Candidate merged-patch lineage | S5 scale/online residual question | Pre-lookup denylist relation | Disposition |
|---|---|---|---|---|
| 116-S5-01 | llama.cpp context-checkpoint patch/test | After a merged checkpoint repair, does a defined long-session threshold still produce a same-function cache-reuse robustness residual beyond configuration? | DISTINCT_PATCH_LINEAGE | RQ01 |
| 116-S5-02 | vLLM prefix-cache or scheduler patch/test | After a merged cache/scheduler repair, does a current continuous-batching long-context residual remain under a fixed cache budget and output oracle? | DISTINCT_PATCH_LINEAGE | RQ02 |
| 116-S5-03 | SGLang radix-cache or scheduler patch/test | After a merged radix-cache/scheduling repair, does a current online sequence-length residual survive for an exact serving contract? | DISTINCT_PATCH_LINEAGE | RQ03 |
| 116-S5-04 | generic merged bug fix | A merged patch without parent/current/test lineage or a decision-changing same-object endpoint cannot be promoted to a research residual. | EXACT_OR_CONTAINS_DENYLIST | PRE_RQ_NONADMISSION |

No seed asserts novelty, a current defect, or a scientific absence result.
