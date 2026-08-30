# Source and collision matrix — Wave257 ORC closure

| Facet | Current primary/official evidence | Fair union or counter-evidence | Disposition |
|---|---|---|---|
| Stripe/index/Bloom semantics | [ORC v2 spec](https://orc.apache.org/specification/ORCv2/), [Indexes](https://orc.apache.org/docs/indexes.html) | row groups, row-index positions and Bloom streams are native reader-visible components | fixed contract |
| Writer options | [Java config](https://orc.apache.org/docs/core-java-config.html), [Spark config](https://orc.apache.org/docs/spark-config.html) | stripe size/row cap, global stride, create-index, Bloom columns/FPP/version, compression/encoding are strong baseline union | a single default is not baseline |
| Reader composition | [core API index](https://orc.apache.org/api/orc-core/index-all.html) | row-group selection and physical stream placement already current operations | no controller/wrapper residual |
| Proposed N2 | `ORCJointSegIndex(W)` finite DP over contiguous cuts + global stride + Bloom budget | must construct legal sequence of cuts, not select one config | action certificate not closed |
| Nearest paper collision | [columnar evaluation](https://arxiv.org/abs/2304.05028), [Bloom filter query optimization](https://arxiv.org/abs/2505.02994) | empirical format study and query-plan work do not directly absorb same-file constructor | `SEARCH_BOUNDED_OPEN` |
| Natural/full cost | public versioned ORC corpus + query trace must be pinned in Stage A | planner/write/open/index/Bloom/decompress/full scan + CPU/RSS/bytes/temp | finite conditional route only |

**Decision:** `NOT_ADMITTED_UNFROZEN`. No config selector, row reordering, generic ILP, custom reader/format or compression tuning is retained.
