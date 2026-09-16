# Source and Provenance Verification

## Frozen-chain integrity

| Package | Manifest result | Manifest SHA-256 |
|---|---:|---|
| Discovery | 4/4 matched | `6A4C17A10A9D40EE50BA676934B7FB5B62A7F60F2ABF8F5E3199851D182238FB` |
| Stage 0 primary | 4/4 matched | `B378CE5E508338BB37E2F8DE6E068908A63E38BCA244B80CE4285B7FB3116A88` |
| Stage 0 confirmation | 2/2 matched | `5F44B00EA2A354BDB67C233F2E0042A12FEF089D600C312A066FAAC820968128` |
| Stage A owner | 28/28 matched | `8A06B69DB8265045DD86EC6492C5A54A5AA4508EC8FA3A68EF9363A19A4F3BB7` |

The owner handoff and report independently match the mainline-provided hashes:

- `handoff.yaml`: `62962408DEEE87A64E5E3FC12833FB9C926B43425640298E930DB4E7FAFB4A11`
- `STAGEA_REPORT.md`: `6649260ACA29E101E0ED578CC19D200928146A3C4C2DA0D6B6C3F0DB0B6A1B68`

## Natural-input verification

The retained trace slice has 120,001 lines including the header, 2,832,420 bytes, and SHA-256 `E5D16D849BCD2E015C5E54A161E202241E7B7D25696F4055C742D51649DDF2A8`. Its header is `key,op,size,op_count,key_size`; the frozen CacheLib replay header supports those fields and GET/SET/DELETE parsing. The four 30,000-row slices contain natural GET, SET and DELETE records; `op_count` is nonempty and was preserved as multiplicity.

This verifies provenance as a natural MetaKV operation trace. It does **not** verify natural page placement, an OBASE guide graph, live-handle state, object mobility, page-fault behavior, or an MDK policy state. Those facts are absent from the trace and must come from a faithful object/backend model.

## Original-paper support boundary

- The frozen OBASE paper supports a compiler/runtime for unmanaged pointer-based structures, guide-mediated annotated relocatable pointers, access instrumentation, NEW/HOT/COLD organization, and a concurrency-safe relocation protocol. It does not support replacing those mechanisms with unconditional epoch-boundary movability flags.
- The frozen MDK paper formulates average memory savings under a windowed performance proxy and provides policy/MPC machinery. Its policies reason about page reclamation, future promotions or policy state. It does not support equating MDK replay with a one-epoch static sort of pages by prior access count and a slow-page prefix.
- The frozen CacheLib Handle guide supports lifetime protection and GET/SET/DELETE request replay. It does not itself provide arbitrary object-to-page placement or an OBASE relocation adapter.

No new paper, venue claim, or global novelty conclusion was introduced. Source status remains `SEARCH_BOUNDED_OPEN_WITH_TWO_DIRECT_SUBTRACTORS`.

