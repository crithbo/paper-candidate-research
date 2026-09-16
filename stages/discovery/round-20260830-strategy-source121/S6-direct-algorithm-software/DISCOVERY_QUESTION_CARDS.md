# Source121 S6 Question Cards

## RQ01 Inductor FP8 loop ordering
- Carrier/current loci: `test_loop_ordering.py`, issue #174417, `torch/_inductor/select_algorithm.py`.
- Current evidence: fixture records one Triton-update failure; current range-tree ordering explicitly sorts dimensions for template tiling/transposition.
- Disposition: `LOCATOR_ONLY__SINGLE_REGRESSION_FIXTURE_NO_GENERAL_NON_GENERIC_ACTION`; no current-absence claim.

## RQ02 Triton autotuner cache-key completeness
- Carrier/current loci: `test_autotuner.py`, `triton/runtime/autotuner.py`.
- Current union: persisted key includes Triton version key, backend hash, function cache key, cache-invalidating environment, tuning key and full config strings; merged tests cover IR override, pruning, restore/reset and exception paths.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_ABSORPTION`; no topic-state effect.

## RQ03 LLVM NVPTX WMMA generated coverage
- Carrier: current `llvm/test/CodeGen/NVPTX/wmma.py`.
- Exact generator exists, but retrieved source does not close its enumerated feature/type/layout matrix or a decision-changing uncovered cell.
- Disposition: `SOURCE_CLOSURE_QUEUE__OPEN_BOUNDED`; no absence/novelty inference.

## RQ04 MLIR GPU barrier elimination legality
- Carrier/current loci: `mlir/test/Dialect/GPU/barrier-elimination.mlir`, `mlir/lib/Dialect/GPU/Transforms/EliminateBarriers.cpp`, GPU memory/barrier semantics.
- Exact object: removal of `gpu.barrier` under unchanged workgroup-memory ordering semantics.
- Endpoint: target-native dependence certificate permitting additional legal eliminations.
- Minimum falsifier: current pass already expresses the same dependence proof, or extra cases require unbounded alias/control reasoning.
- Full-cost boundary: compile-time analysis, IR size, retained/removed barriers and legality checker; no run performed.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; bounded current-pass and formal small-witness debt.

## Counts
- frozen carriers: 8; exact closed: 5; unresolved: 3
- primary RQ: 4; unique families: 4
- excluded/locator/queue: 3; raw: 1; deep: 1; clean brief: 0
