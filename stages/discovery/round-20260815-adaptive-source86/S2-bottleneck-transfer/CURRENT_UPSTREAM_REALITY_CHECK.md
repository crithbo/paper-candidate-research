# Current-upstream reality check

The current configuration-key header exposes enable/disable memory patterns, memory optimizer configs, model-mapping choices and capacity-aware partitioning-related settings. The C API/session surface documents graph optimization levels, allocators, execution providers and session configuration. Current test defaults show memory pattern enabled and graph optimization level enabled.

Therefore the strong comparator receives the identical ONNX graph, provider/device configuration, input shapes and any profile facts, and may use stock graph optimization/partitioning, memory-pattern construction, CPU/GPU arenas and documented memory-optimization/provider settings. Existing components are contrary evidence against a flag or controller contribution.

The observed `main` branch has no immutable commit pin in this packet. No claim is made that ONNX Runtime lacks joint partition/pattern construction or that no direct paper exists. Result: `CURRENT_UNION_PARTIALLY_FROZEN__NO_ABSENCE_CLAIM__SOURCE_CLOSURE_REQUIRED`.
