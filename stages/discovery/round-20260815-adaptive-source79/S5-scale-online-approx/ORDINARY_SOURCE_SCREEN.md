# Source79 S5 ordinary source screen

## Primary/current sources

| Role | Source | Frozen observation | Effect |
|---|---|---|---|
| Current formal anchor | Vulkan specification, pipelines chapter, https://docs.vulkan.org/spec/latest/chapters/pipelines.html | vkMergePipelineCaches is a legal native action; merge details are implementation-dependent and duplicate entries should be pruned. | Fixes the API action but not an observable cache-entry output. |
| Current API contract | Vulkan pipeline-cache guide, https://docs.vulkan.org/guide/latest/pipeline_cache.html | Cache reuse may persist between application runs and pipeline creation can compile shaders. | Establishes cost context, not a driver-specific action union. |
| Contrary | Current Vulkan specification / vkCreatePipelineCache, https://registry.khronos.org/VulkanSC/specs/1.0-extensions/man/html/vkCreatePipelineCache.html | Cache data can be incompatible with a device and the cache contents cannot be treated as a portable, fixed representation. | Blocks a representation-preserving target guarantee at API level. |

## Result

This is not evidence-qualified raw. A native merge exists, but a nontrivial target-specific guarantee cannot be stated against a fixed observable cache-state object using only the specification. Picking a driver or application trace after observing results would change the object and violate the source-closure/identity discipline.

Disposition: LOCATOR_ONLY__RQ_BACKLOG__OPAQUE_OUTPUT_AND_CARRIER_UNFROZEN. No implementation absence, direct collision, scientific DROP, or proposal is asserted.
