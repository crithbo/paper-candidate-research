# Discovery Research Question Card

- Card ID: `S2-107-QC01`; carrier: `IMPLEMENTATION_CARRIER_ONLY`.
- Exact object: PyTorch `torch.compile` CUDA inference path with CUDA Graph capture/replay and compiler cache.
- Claim endpoint: target-native compiler/runtime action; contribution type: `COMPILER_TOOL`; route: `N2` hypothesized only.
- Full-cost initial boundary: compilation/recompilation, guard/cache lookup, capture and replay, cached workspace memory, host overhead, and GPU execution; no component-only speedup accepted.
- Current source locus: `torch.compile` documents `reduce-overhead`, `triton.cudagraphs`, workspace-memory caching and recompile-limit/eager fallback; CUDA Graph API documents graph/pool capture; CUDA Graph Trees documents native memory-pool and iteration controls.
- Contrary/current mechanism: current PyTorch cache documentation exposes `FXGraphCache`, `InductorCache`, `TritonCache`, PGO and autotuning cache plus explicit cache-location controls (`https://docs.pytorch.org/tutorials/recipes/torch_compile_caching_tutorial.html`).
- Minimum falsifier: current native controls express the proposed capture/cache action with the same semantics and full-cost dimensions.
- Result: falsifier met. No source-supported non-generic atomic action survives; changing cache policy or graph-pool use would be a current-native configuration/wrapper.
- RAW_REQUIRED audit: `INCOMPLETE` (non-generic discriminator absent); disposition: `EXCLUDED_BEFORE_RAW`.
- Search boundary: first-party PyTorch stable API/tutorial pages named above; no group repository, CRFEPOCH material, private source, download, build or experiment.
