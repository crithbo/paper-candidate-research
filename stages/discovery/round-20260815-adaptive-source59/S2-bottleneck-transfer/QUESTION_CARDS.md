# Question cards — Source59 S2

## QC-S59-01 — GNU ld section GC and unwind construction

- Exact object: fixed ELF object inputs, root/export policy, executable semantics and stock unwinding result.
- Current union: `--gc-sections` recursively retains sections via symbols/relocations; `--eh-frame-hdr` controls the output header; linker-generated unwind info for generated sections is on by default where supported. Relevant options are explicit current native actions.
- Minimum falsifier: if alleged gain selects section-GC roots, preserves exports, or toggles EH-frame/generated-unwind output, it is current configuration/composition.
- Full-cost boundary if a surviving action existed: link CPU/RSS/temp, output bytes, EH/metadata bytes, stock unwind lookup, cold loader and executable runtime.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_OR_CONFIG`; a whole new action/guarantee is not named.

## QC-S59-02 — Go `pclntab`/module-data construction

- Exact object: fixed Go package/object set and target; stock runtime function lookup/reflection behavior is preserved.
- Current source: `pcln.go` builds carrier, header, function-name, CU, file, PC and function-data tables; `symtab.go` wires their sizes/addresses into module data.
- Cheapest falsifier: a candidate restricted to sorting or packing these tables is generic metadata layout, not target-specific N2; no non-generic state/action/guarantee has been frozen.
- Finite route if later legally re-opened: one exact Go version, versioned natural Go repository set, stock runtime lookup oracle, and build CPU/RSS/temp + executable bytes + lookup full cost.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no missing implementation/result/resource inference.

## QC-S59-03 — LLD ELF section GC and EH aggregation

- Exact object: fixed ELF link and stock runtime-unwind output semantics.
- Current source/contrary locus: official LLVM source material identifies LLD ELF handling as merging EH frames and creating `.eh_frame_hdr` for runtime; LLD docs establish the target-native ELF linker scope.
- Minimum falsifier: a code/metadata formulation that only repeats section selection and frame/header emission is already native composition.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_DIRECT_ABSORPTION`.
