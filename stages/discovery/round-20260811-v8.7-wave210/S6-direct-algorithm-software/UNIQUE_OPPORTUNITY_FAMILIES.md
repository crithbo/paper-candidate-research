# Unique opportunity family

## U1 — BTF type graph canonicalization / ID / string assignment

- Whole action: choose a canonicalized, deduplicated type-graph order and string-table layout, regenerate all BTF type references, `name_off`, BTF.ext section offsets, `bpf_core_relo.type_id`, CO-RE access-string offsets and related ELF references.
- Minimal legal witness: exchange two dependency-independent type records and their regenerated references, then repack strings and update every BTF.ext type ID/string offset. Stock decoding can preserve the graph only if every dependent record is regenerated.
- Known union: LLVM/pahole type deduplication/emission and libbpf/kernel consumption; exact current producer configurations have not been exhaustively frozen.
- Status: `NOT_ADMITTED_UNFROZEN`. The witness establishes reference regeneration, not an external N2; a type-ID ordering alone is routine serialization ordering.
