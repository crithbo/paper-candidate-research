# IREE-GRAPHTUNE source log

Search date: 2026-08-02. Query families: `IREE tuning dispatch layout fusion`, `graph level compiler autotuning peak memory`, `IREE temporary allocation tuning`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [IREE tuning reference](https://iree.dev/reference/tuning/) | official documentation | strongest deployment baseline: automatic per-dispatch tuning |
| [IREE optimization options](https://iree.dev/reference/optimization-options/) | official documentation | layout/fusion flags and fair cost surface |
| [IREE repository](https://github.com/iree-org/iree) | open artifact | executable compiler/test-suite substrate |
| [IREE RISC-V execution guide](https://iree.dev/community/blog/2026-07-23-running-models-on-risc-v-with-iree/) | official blog | public non-GPU backend option, not device evidence |

Search-bounded result: located individual-dispatch tuning, but not a verified source that makes peak-live-aware interface contracts the graph-level tuning objective. Stage 0 must inspect implementation before asserting residual.
