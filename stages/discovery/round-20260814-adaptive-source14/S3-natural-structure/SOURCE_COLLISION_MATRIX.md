# Offline action / current-union closure matrix

| Deep family | Current official action union | Full-cost boundary | Why admission fails now | Finite closure/falsifier | Decision |
|---|---|---|---|---|---|
| OpenXLA HLO scheduling and buffer assignment | XLA documents a valid topological scheduling space, tries scheduler algorithms for peak memory, applies latency-hiding scheduling, may rematerialize, and then assigns buffers before LLVM lowering. It also exposes backend-dependent memory-fitting effort levels. | Compiler CPU/RSS/temp, schedule/rematerialization/analysis time, peak device memory, generated executable bytes, compile/load and fixed HLO output/runtime latency/throughput. | An offline action is well-defined, but a checksum-pinned natural HLO release panel and an action divergence beyond the documented scheduling/rematerialization/memory-fitting union were not closed. No absence assertion is made. | Pin 20–50 public HLO/model version pairs; stratify shapes/device/compiler release; reject if holdout law fails, stock union reproduces action, or full cost has no Pareto. | `NOT_ADMITTED_UNFROZEN`. |
| ExecuTorch memory planning | `MemoryPlanningPass` consumes TensorSpec shape/lifetime information; official docs name naive and greedy best-fit planners and invite custom memory planning algorithms. | Export/compiler CPU/RSS, analysis time, static arena bytes/fragmentation, serialized program bytes, runtime peak memory and latency under identical exported program/IO constraints. | A target-specific new planner is not automatically absorbed by an extensibility hook, but this assignment did not close the required immutable natural versioned carrier and held-out law. A synthetic graph would violate the contract. | Acquire a bounded official model release panel and pin ExportedProgram hashes; reject if no stable held-out law or only generic interval packing remains. | `NOT_ADMITTED_UNFROZEN`. |

## Official evidence

- OpenXLA scheduling, rematerialization and buffer assignment: <https://openxla.org/xla/hlo_to_thunks>; current memory effort levels: <https://openxla.org/xla/effort_levels>.
- ExecuTorch memory-planning actions: <https://docs.pytorch.org/executorch/stable/compiler-memory-planning.html>.
- MLIR bufferization/algorithm boundary: <https://mlir.llvm.org/docs/Bufferization/>, <https://mlir.llvm.org/doxygen/namespacemlir_1_1bufferization.html>.
- TorchInductor compiler/scheduling context: <https://docs.pytorch.org/docs/main/user_guide/torch_compiler/torch.compiler.html>.

Search is bounded. Missing immutable carrier/source closure—not missing implementation or hardware—is the admission reason. Built-in tactic/config selectors, cache maintenance, all reader/format routes and all network-security/vulnerability/exploit topics were excluded.
