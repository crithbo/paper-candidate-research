# Final question card — NVDLA C0 closure

- Assignment: `DISCOVERY-S5-20260814-SOURCE28-NVDLA-C0-CLOSURE01`
- Family signature: `NVDLA_FIXED_CONFIG_LOCAL_GRAPH_EDIT_BOUNDED_RECOURSE_LAYER_BUFFER_CONSTRUCTOR`
- Contribution type / route: `SYSTEM_ARCHITECTURE / N2`
- Exact object: fixed NVDLA hardware configuration; a supported network and local graph edit; stock compiler-produced loadable with stock runtime semantics.
- Same-object output contract: identical supported-network semantics and stock-loadable/runtime acceptance; no change to NVDLA reader/runtime or hardware configuration.
- Original endpoint: a target-native bounded-recourse constructor jointly updating layer partitions and buffer/surface state after a local graph edit.
- Fair current union: compiler layer-by-layer compilation, CBUF-driven operation splitting, resource/surface descriptors, memory pools/reuse/greedy eviction/CVSRAM allocation, and all supported target configurations.
- Natural/canonical carrier route: one of official verified MNIST/ResNet-18/ResNet-50 configurations plus an official `regression/` carrier and stock loadable/runtime oracle.
- Full-cost boundary if a distinct action existed: compiler CPU/wall, peak RSS, generated loadable bytes, device memory/surface bytes, compile-time temporary state, and stock runtime acceptance/equivalence; local-edit recourse must count rewritten layers/surfaces and bytes.
- Minimum falsifier: on a fixed supported carrier, a legal local edit for which the new constructor cannot preserve stock loadability/semantics or exceeds its predeclared recourse bound under the same config.
- Disposition: `STRUCTURAL_DROP__NO_FROZEN_UNION_EXTERNAL_TARGET_NATIVE_ACTION`.

## Why it fails C0

The proposed endpoint was not a concrete algorithm. Official current source already covers the named action dimensions (layer splitting, buffer/surface management, and configurable memory reuse/eviction/allocation). No source-backed residual atomic action, recurrence, legality transition, or target-specific bound was frozen. An uninstantiated promise to make the same components incremental is a maintenance/controller wrapper, not an N2 mechanism.

## Claim ceiling

No novelty, performance, bounded-recourse, or implementation-absence claim is made. The source observations only justify the C0 disposition above.
