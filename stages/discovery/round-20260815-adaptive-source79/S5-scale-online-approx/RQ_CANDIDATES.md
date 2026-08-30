# Source79 S5 RQ candidates

## Primary RQ — S79-01

**Exact anchor.** The current Vulkan specification documents vkMergePipelineCaches, vkGetPipelineCacheData, and vkCreatePipelineCache. It states that merge details are implementation-dependent, while implementations should merge specified pipeline contents and prune duplicate entries.

**Same-object question.** For one Vulkan device, fixed pipeline-create sequence, and stock API-visible cache/creation semantics, can a target-native bounded-recourse cache-merge constructor provide a nontrivial exact or approximation guarantee over host memory, merge work, and pipeline-creation cost?

**Counterfactual.** If the action and output could be frozen at the API boundary, the contribution would alter cache-state maintenance without changing pipeline creation or device compatibility semantics.

**Minimum falsifier.** The specification's opaque/implementation-dependent cache state prevents an API-level observable equality/quality oracle for the purported constructor, or an implementation source union directly covers it.

**Disposition.** RQ_BACKLOG__TARGET_GUARANTEE_UNFROZEN. The current specification is an exact anchor and current action source, but it does not expose a fixed cache-entry representation or an API-level exact estimator sufficient for the proposed target-specific guarantee. No absence claim is made.
