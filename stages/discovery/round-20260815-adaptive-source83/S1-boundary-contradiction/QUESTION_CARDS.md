# Question cards

## QC01 — WebGPU CPU/GPU buffer ownership transition

- Exact identity: current WebGPU GPUBuffer map state and mapped range views.
- Carrier: `NATURAL`; mapped staging-buffer upload/readback use.
- Same-object problem: reduce lifecycle cost without changing bytes, views, validation, mapping state, or GPU queue availability.
- Contribution considered: N2 mapping-window constructor.
- Current source/spec locus: W3C WebGPU Buffer section and Chromium `GPUBuffer` source locus.
- Current union: `unmapped`, `pending`, and `mapped` are exclusive; while mapped the buffer cannot be used in queue operations; `unmap` detaches tracked views and returns contents/availability as specified.
- Configuration check: usage flags determine whether read/write mapping is legal; changing them changes the object’s permitted action set, not a hidden same-contract option.
- Strongest skeptic: early/late `unmap` changes CPU view validity or GPU command availability; no timeline change reproduces a distinct same-endpoint action beyond ordinary last-use ownership release.
- Minimum falsifier: one buffer trace with a GPU command while mapped or a mapped-range access after unmap. The first violates availability; the second fails view validity.
- Finite closure: public state transition and browser implementation locus; no experiment/build/download.
- Initial full cost: map latency, byte copies, mapped CPU memory, GPU queue stall/availability, validation, and end-to-end workload time.

Disposition: `EXCLUDED_BEFORE_RAW__MAPPING_OWNERSHIP_TRANSITION_IS_OBSERVABLE_OR_GENERIC_LIFETIME_ACTION`.
