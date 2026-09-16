# Unique opportunity families

## F01 — WebGPU GPUBuffer map/unmap ownership seam

- Signature: `WEBGPU_GPUBUFFER__MAP_UNMAP_CPU_GPU_OWNERSHIP_WINDOW__FIXED_QUEUE_VISIBLE_BYTES_ENDPOINT__WEBGPU_FULL_COST`
- History relation: `NO_MATCH__NOT_NOVELTY_PROOF`.
- Current strongest union: W3C mapping state and usage contract plus Chromium GPUBuffer map/unmap path.
- Natural carrier/oracle: WebGPU staging-buffer workload; mapping state, view detachment, and GPU queue availability.
- Disposition: `EXCLUDED_BEFORE_RAW__MAPPING_OWNERSHIP_TRANSITION_IS_OBSERVABLE_OR_GENERIC_LIFETIME_ACTION`.
