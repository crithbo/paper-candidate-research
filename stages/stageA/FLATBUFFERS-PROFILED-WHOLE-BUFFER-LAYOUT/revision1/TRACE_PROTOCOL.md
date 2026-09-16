# Training-only native request trace protocol

This protocol is frozen before any corrected natural objective row.

The collector accepts exactly one model path, a frozen `train` model identifier and 64 request ordinals. It runs only pinned generated TFLite accessors and emits the exact accessor-event sequence. Orchestration rejects any manifest record whose split is not `train`; it never opens the 13 held-out files or any initial result file while deriving the trace.

Each event is named by a logical endpoint such as `tflite.Model.subgraphs` or `tflite.Tensor.shape`, not by a source or output byte offset. `logical_endpoint_mapping.tsv` gives the generated accessor and the canonical reflection `Object.field` key used by the planner. The estimator is the unsmoothed event count over all 704 requests. Therefore every profile-aware arm receives the same training-only weights and no absent endpoint receives invented evidence.

The replay metric cycles the frozen 704 `(training-origin-model-id, request-ordinal, seed)` descriptors. The origin identifier is provenance only; on a target buffer the same deterministic accessor program uses the frozen seed modulo that target's native vector lengths. Every arm for a model therefore executes the identical logical request sequence under the stock generated reader. Warm uses 5,000 requests; cold uses 50 requests, each preceded by the unchanged 8 MiB/64-byte-stride eviction traversal.

No weight, endpoint, request count, selector rule, arm, beam width, transition cap, corpus item, split, runtime repetition count or Pareto definition may change after the trace freeze.
