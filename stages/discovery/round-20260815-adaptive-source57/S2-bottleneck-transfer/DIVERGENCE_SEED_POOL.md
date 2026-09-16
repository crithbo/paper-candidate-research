# Source57 non-evidence seed portfolio

Offline seed pool, created before targeted evidence. No seed asserts absence, novelty, raw status, a paper claim, or Q2 potential.

| Seed | Engine / perspective | Transfer sketch | Early risk | State |
|---|---|---|---|---|
| S57-01 | State canonicalization / runtime engineer | WasmGC can move validation cost to runtime canonical-type/RTT construction and lookup. | Existing engine type interning may absorb it. | Keep. |
| S57-02 | Check-to-layout inversion / GPU compiler engineer | SPIR-V optimization can move generation cost to validator/type/ID decoration materialization. | May be specification validation or generic instruction order. | Keep. |
| S57-03 | Compile-to-cache reversal / driver engineer | Vulkan pipeline compilation can shift shader cost to pipeline-cache serialization and compatible-load construction. | Cache/configuration policy risk. | Keep. |
| S57-04 | Descriptor-boundary transfer / runtime engineer | OpenCL program binary load can shift compile cost to specialization metadata/loader construction. | Binary cache or ABI contract risk. | Backlog. |
| S57-05 | Metadata/reader tension / language engineer | Kotlin metadata adaptation can shift compilation cost to reflection/metadata-reader materialization. | Generic serialization. | Backlog. |
| S57-06 | Compile/load tension / systems engineer | WebAssembly AOT image packaging can shift compilation to relocation/registration layout. | Current loader or packaging generic; likely related. | Backlog. |

Selected pre-evidence routes: S57-01, S57-02 and S57-03. The remaining seeds are not outcome replacement slots.
