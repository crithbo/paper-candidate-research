# Source119 S1 Primary RQs

Each primary RQ was frozen before targeted source lookup.

1. `RQ01`: Under current PRIVATE_TOOLCHAIN HAL buffer range and alignment semantics, is there a target-native decision between direct dispatch and repack/copy that preserves the same tensor result but is not expressible as ordinary configuration?
2. `RQ02`: Under current PRIVATE_TOOLCHAIN parameter archive semantics, can alignment and lifetime information support a same-object zero-copy placement action with complete setup/mapping cost?
3. `RQ03`: Under current PRIVATE_TOOLCHAIN dynamic-shape dispatch semantics, is there a non-generic action that jointly selects dispatch partition and guard structure while preserving program semantics?
4. `RQ04`: Under current MLIR Quant semantics, can per-axis quantization invariants drive a backend lowering decision between integer kernel and explicit dequant/requant without changing numerical guarantees?
5. `RQ05`: Under current MLIR MemRef/data-layout semantics, can target ABI alignment require a layout-transform decision that generic legality cannot express?
6. `RQ06`: Under current MLIR sparse GPU lowering, can encoding invariants drive a target-specific sparse-format/vectorization action rather than a generic format selector?
7. `RQ07`: Under current ExecuTorch partition/delegate semantics, can fallback-boundary full cost change the maximal legal delegated region through a non-generic partition algorithm?
8. `RQ08`: Under current ExecuTorch memory planning and delegate ownership semantics, can lifetime/reuse invariants drive a non-generic decision to reuse, pin, or transfer intermediates?

For every RQ, the null is that current upstream already expresses the action, or the residual collapses to generic configuration/partitioning/scheduling.
