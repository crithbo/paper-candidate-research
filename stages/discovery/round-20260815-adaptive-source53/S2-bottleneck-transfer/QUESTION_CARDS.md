# Evidence-qualified Question Cards

## QC-S53-02 — MPI partitioned persistent readiness

- Exact identity: a fixed sender/receiver, communicator, tag, datatype, partition count and message bytes under MPI partitioned persistent point-to-point semantics.
- Claim endpoint: whole sender/receiver preparation plus completion cost, with message bytes and MPI completion behavior unchanged.
- Counterfactual consequence: if a legal co-defined partition-materialization/readiness action existed outside the native union, it could reduce preparation/communication overlap cost without weakening delivery or completion semantics.
- Current-source locus: current Open MPI documentation exposes `MPI_Psend_init`, `MPI_Precv_init`, `MPI_Pready`, `MPI_Pready_list`, and `MPI_Pready_range` as the partitioned request and readiness action surface.
- Non-generic discriminator required for raw: a target-specific algorithmic state and guarantee that is not a re-expression of choosing partitions and declaring their readiness.
- Minimum falsifier: current union already represents every claimed partition boundary/readiness operation; or no target-specific guarantee beyond generic partition ordering can be written.
- Initial full-cost boundary: application materialization/preparation, sender and receiver CPU, network bytes, request state/RSS, and completion latency.
- Disposition: `PRE_RAW_DIRECT_CURRENT_UNION_ABSORPTION`. The available source makes the exact hypothesized action a sequence of native request initialization plus native partition-ready calls. It is not promoted to raw.

## QC-S53-03 — LLVM OpenMP offload image layout

- Exact identity: a fixed OpenMP source/module set, target triples/architectures, host executable, ABI-visible output and stock `libomptarget` load/registration behavior.
- Claim endpoint: compile-to-linked executable plus startup/load cost, executable bytes, memory and device-image accessibility, without a loader/ABI change.
- Counterfactual consequence: a non-generic metadata/image-layout constructor could matter only if it preserves the stock binary descriptor and loader interpretation while changing an actual whole-image decision.
- Current-source locus: LLVM's current offload design and `llvm-offload-binary` documentation describe a versioned header, image/entry/string metadata, host embedding, extraction/device linking, and wrapper-produced registration descriptor.
- Non-generic discriminator required for raw: target-specific algorithm/complexity/guarantee beyond arranging an ordered string map and image buffer.
- Minimum falsifier: the output is a documented string-map/image serialization and the remaining layout choice is generic packing/ordering; or any change needs new loader/ABI semantics.
- Initial full-cost boundary: device compilation, image metadata/wrapping, host linking, executable bytes, runtime registration/load CPU/RSS and temporary files.
- Disposition: `PRE_RAW_GENERIC_SERIALIZATION_OR_CHANGED_LOADER_BOUNDARY`. The documented format is explicitly a string-map/image container and the docs specify the stock wrapper/loader path. No union-external, target-specific N1/N2 is frozen.

S53-01 is excluded before Question Card admission by the exact identity certificate.  No Question Card enters evidence-qualified raw.
