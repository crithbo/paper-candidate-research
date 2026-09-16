# Source79 RQs

## RQ-01 Vulkan pipeline-cache construction

Fixed object: a Vulkan application, device/driver implementation, pipeline inputs and observable pipeline semantics. RQ: can a producer-side cache constructor jointly decide pipeline cache materialization with a target-specific guarantee beyond `VkPipelineCache` creation/retrieval/merge and implementation-managed contents? Same pipeline result/driver use is required; no custom driver, cache controller, or cache-policy selector.

Primary route: current Vulkan `VkPipelineCache` reference and pipeline chapter. Result: `EXCLUDED_BEFORE_RAW__OPAQUE_IMPLEMENTATION_MANAGED_CACHE_AND_GENERIC_CACHE_SHELL`.

## RQ-02 LLVM bitcode writer layout

Fixed object: LLVM IR module, target and current-version reader semantics. RQ: does a whole bitcode writer layout algorithm retain the stock reader while improving writer/read/full pipeline cost with a target-specific guarantee beyond current self-described abbreviations/wrapper choices? No changed IR, reader, or generic compressor/packing solver.

Primary route: current LLVM Bitcode File Format and BitcodeWriter source reference. Result: `EXCLUDED_BEFORE_RAW__SELF_DESCRIBED_FORMAT_AND_GENERIC_SERIALIZATION_SHELL`.
