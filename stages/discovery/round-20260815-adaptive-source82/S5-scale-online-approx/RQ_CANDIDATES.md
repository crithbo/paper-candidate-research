# Source82 S5 RQ candidates

## Primary RQ — S82-01

**Exact anchor.** Current official Zig Build System documentation states that build tasks can cache results and that the generated local cache is intended to speed subsequent builds and may be deleted without consequences. It documents local and global cache-directory options.

**Same-object question.** For a fixed Zig project, source/configuration update sequence and stock build artifact semantics, can a target-native incremental constructor provide a bounded-recourse or amortized cache/build-state guarantee beyond the current build-system union?

**Counterfactual consequence.** A positive construction would reduce complete incremental rebuild cost while producing the same artifacts and preserving build-step semantics.

**Minimum falsifier.** A current native action union expressing the construction, or the candidate action reduces to generic cache placement/eviction/key policy rather than target-specific Zig build-state construction.

**Disposition.** RQ_BACKLOG__GENERIC_CACHE_POLICY_OR_CARRIER_UNFROZEN. The current official anchor documents cache behavior but does not identify a non-generic union-external action or versioned public natural update carrier. No absence claim is made.
