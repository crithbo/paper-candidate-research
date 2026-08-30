# De-duplication

This is the bounded depth review of the Wave208 V8 startup-snapshot `NOT_ADMITTED_UNFROZEN` row, not a revival of an earlier terminal object. It is distinct from S1 OPA-Wasm, all ELF/PDB/DWARF/DEX/JVM/Lean/pyc/CDS/bitcode exclusions, and every active S1/S2/S3/S5/S6 object in the frozen registry.

Exact object is a V8 startup snapshot produced from the same builtins, heap roots, and embedder input, then read by the matching pinned stock V8 deserializer. Code cache is explicitly excluded: it has distinct input/output semantics and its own deserialization flags.

