# Source54 Question Cards

## QC-S54-01 — PRIVATE_TOOLCHAIN VMFB archive/runtime metadata

- Exact public identity: a fixed PRIVATE_TOOLCHAIN VMFB compiled module, exported entry-point ABI, inputs/outputs and stock VM runtime load/execute behavior.
- Contribution hypothesis: `COMPILER_TOOL/N2` only if an archive-to-runtime constructor were target-specific and preserved stock module interpretation.
- Current locus / action union observed: VMFB is documented as bytecode-module serialization; runtime module types and VM context instantiation are documented; default `--output-format=vm-bytecode` and optional polyglot-zip packaging are exposed.
- Counterfactual: a residual would need to change compilation plus runtime materialization cost without treating byte layout/compression/zip as the contribution and without changing reader semantics.
- Strongest objection: after fixed VM/runtime semantics, byte arrangement and packaging are generic serialization; a changed FlatBuffer/reader contract is a changed object.
- Minimum falsifier: write a target-specific atomic action/guarantee that differs from generic archive packing while stock VMFB reader accepts it. None is frozen from the bounded source route.
- Initial full cost: compiler serialization CPU/RSS/temp, VMFB bytes, runtime module/context-load CPU/RSS, and entry invocation latency.
- Raw gate: `INCOMPLETE__GENERIC_OR_CHANGED_READER_BOUNDARY`; no raw admission. This is not an absence claim.

## QC-S54-02 — OpenMP mapper/lifetime

- Exact public identity: same host/device values, target mapping semantics and target-region result.
- Identity result: `EXCLUDED_BEFORE_RAW__EXACT_HISTORY` by Source27's OpenMP target-data / Clang-libomptarget mapping+modes matrix. No external delta was supplied.
- No further source closure or raw/deep work is performed.

## QC-S54-04 — MLIR SparseTensor conversion/iteration construction

- Exact public identity: fixed tensor dimensions/values and the stock sparse tensor dialect/runtime consumer behavior.
- Contribution hypothesis: `COMPILER_TOOL/N2` only if a level-conversion plus iteration construction had a target-specific algorithm/guarantee beyond representation selection and dialect pass composition.
- Current locus / action union observed: dialect level type/order, `sparse_tensor.convert`, storage schemes, iteration graphs/lattices, sparse passes, runtime-library option and permutation-aware codegen are all current documented/source action surfaces.
- Counterfactual: a residual would need to preserve values and stock consumer while proving a non-generic construction guarantee beyond choosing/rewriting native level encoding and pass composition.
- Strongest objection: encoding/conversion/iteration is the dialect's existing representation and lowering problem; a free-standing layout planner collapses to generic packing/selector, while an alternate consumer changes the object.
- Minimum falsifier: name an atomic target-specific action and exact/FPT/approx/Pareto guarantee which native conversion+iteration composition cannot express. None is frozen.
- Initial full cost: conversion/build CPU/RSS/temp, positions/coordinates/value bytes, codegen/compile cost and stock access/iteration latency.
- Raw gate: `INCOMPLETE__DIRECT_CURRENT_UNION_OR_GENERIC_CONSTRUCTOR`; no raw admission.

No incomplete implementation, main result, carrier download, hardware, resource or AI-readiness condition caused these dispositions.
