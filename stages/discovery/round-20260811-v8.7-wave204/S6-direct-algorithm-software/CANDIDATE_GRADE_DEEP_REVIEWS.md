# Candidate-grade deep review

## MLIR current bytecode table/ID/record planner — NOT_ADMITTED_UNFROZEN

### Current upstream reality

Current LLVM upstream `mlir/lib/Bytecode/Writer/BytecodeWriter.cpp` gives a concrete, nontrivial baseline. `StringSectionBuilder` deduplicates strings and assigns insertion-order IDs with `MapVector`; its string section writes reverse lengths and concatenated strings. `DialectWriter` emits `IRNumberingState` numbers for attributes, types, and resource handles and writes strings via string-table IDs. `PropertiesSectionBuilder` performs byte-level serialized-property deduplication. The emitter uses a compact varint with a one-byte fast path for values below 128, then variable-width encoding.

The documented current options are desired bytecode version, elision of resource data, elision of locations, dialect-version map, custom attribute/type callbacks, and external resource printers. The format additionally permits dialect-defined encodings/version upgrades. These options and custom interfaces prevent treating a visible insertion-order path as a complete current action union or an absence claim.

### Same-object witness and limit

For a bytecode table containing two distinct strings with unequal use counts, replace their table-local IDs and regenerate every string reference. If an ID crosses a varint-width boundary, the resulting valid bytecode can have a different byte count while stock parsing produces the same IR. The standard's table/offset representation makes this a native-legal action witness, subject to respecting every dialect/resource/version reference.

The witness proves only serialization freedom. Assigning low IDs to high-frequency entries is ordinary frequency ordering. A putative N2 must jointly reason about dialect grouping, table records, relative offsets, resource/property dependencies and reader/writer cost, and must be demonstrably outside the entire current writer/config/custom-encoding union.

### Natural carrier, oracle, full cost, and finite killer

- Natural route: version-pinned MLIR and LLVM Test-Suite MLIR files plus upstream bytecode tests; no corpus was fetched or executed here.
- Oracle: stock bytecode parser, verifier, textual canonicalization/structural IR digest and bytecode round-trip; dialect-version/resource/properties must be included in equality.
- Full-cost: writer CPU/wall/RSS/temp; bytecode bytes and section sizes; parser/verifier CPU/wall/RSS; peak temporary buffers; downstream pass/load cost where a normal reader requires it. Bytes alone are not a claim.
- 72-hour killer: pin a current LLVM commit; enumerate every `IRNumberingState` population and section-table emission site plus all `BytecodeWriterConfig` public paths; construct one native writer/rewrite witness; verify decoded IR/dialect/resource/property equality; reject if a custom encoder/configuration expresses the purported action, if the residual is only frequency sorting, if an existing direct planner collides, or if full-cost removes the advantage.

### Fidelity and decision

`FINITE_FIDELITY_GAP`: same-object semantics, a minimal legal witness, natural route, oracle, denominator, and finite falsifier are available. The remaining source-level union and direct collision are not closed, and no non-routine N2/guarantee is frozen. This is not negative evidence about an unimplemented algorithm; it is insufficient evidence for a grounded Stage 0 proposal. Structural paper potential remains unassessed; current evidence readiness is below admission.
