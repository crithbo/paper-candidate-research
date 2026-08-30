# Source84 S5 RQ candidates

## Primary RQ — S84-01

**Exact anchor.** Current ccache documentation states that it accelerates recompilation by caching previous compilations and detecting the same compilation. Its current manual documents automatic cleanup at size/file limits, manual cleanup, age-based eviction and cache compression.

**Same-object question.** For a fixed C/C++ compilation stream, compiler/configuration set and ccache hit/miss output semantics, can a target-native constructor provide a bounded-recourse or amortized guarantee beyond the current cache-maintenance union?

**Counterfactual consequence.** A positive construction would change cache-state maintenance while retaining exact compiler-result reuse semantics.

**Minimum falsifier.** The current union covers automatic/manual cleanup, age eviction and compression, leaving a candidate that is only generic storage or cache-policy selection.

**Disposition.** RQ_BACKLOG__CURRENT_UNION_ANCHOR_NO_NONGENERIC_ACTION. The source packet gives a complete maintenance-anchor direction but not a target-native action outside it or a versioned natural carrier. No absence claim is made.
