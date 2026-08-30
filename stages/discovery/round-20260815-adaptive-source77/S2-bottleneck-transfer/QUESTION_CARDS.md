# Source77 Question Card outcomes

## QC-S77-01 — LLVM profile merge

Same object/full cost: fixed binary/profiles plus merge CPU/RSS/temp/bytes, PGO profile load and resulting compile/runtime. Current official union already includes merge weighting, input selection, binary/extbinary/text output, sparse/split layout, compression, multi-threading, failure modes and correlation controls. A residual would need a target-specific same-semantics algorithm, not a format/weight/thread selector. No such action/guarantee is frozen. `EXCLUDED_BEFORE_RAW__CONFIGURATION_OR_GENERIC_SERIALIZATION_SHELL`.

## QC-S77-02 — GNU archive index

Same object/full cost: fixed object members/symbols, archive/index build bytes/CPU/RSS and stock-linker resolution. The possible action is member layout/index placement. With no target-specific decision rule or guarantee beyond normal archive indexing, it is generic packing; changed reader/format is prohibited. `EXCLUDED_BEFORE_RAW__GENERIC_PACKING_SHELL`.

## QC-S77-03 — GCC gcov aggregation

Same object/full cost: fixed instrumented program and exact coverage report; generation/merge/read/check CPU/RSS/bytes. The current manual pins the data-file object but this bounded route does not pin a concrete native merge/check action, its non-default controls, or a non-generic construction guarantee. The absence of that source closure is not negative evidence. `LOCATOR_ONLY`, `RAW_REQUIRED=INCOMPLETE`.

Counts: raw/C0/D1/deep/clean-brief = `0/0/0/0/0`.
