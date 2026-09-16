# RQ01 Ordinary Closure

- Anchor: `ggml-org/llama.cpp` `master`, observed 2026-08-24; [API](https://github.com/ggml-org/llama.cpp/blob/master/ggml/include/ggml-backend.h), [implementation](https://github.com/ggml-org/llama.cpp/blob/master/ggml/src/ggml-backend.cpp).
- Current action/locus: backend priority and supported-op assignment; `ggml_backend_sched_split_graph`; reserve/allocation; tensor copies; `ggml_backend_sched_graph_compute[_async]`.
- Endpoint: same `ggml_cgraph` output/status and backend-operation legality.
- Contrary/full cost: native scheduler already owns assignment, splitting, copies, reserve/allocation and async compute; full cost includes scheduling, allocation, copies, synchronization, launch, memory and graph reset/rebuild.
- Stop: two first-party loci plus visible scheduler API do not freeze an exact commit nor a distinct action/guarantee without widening object or guessing.
- Disposition: `LOCATOR_ONLY__EXACT_COMMIT_AND_DISTINCT_ACTION_ENDPOINT_UNFROZEN`; no absence claim, raw admission or exhaustion.
