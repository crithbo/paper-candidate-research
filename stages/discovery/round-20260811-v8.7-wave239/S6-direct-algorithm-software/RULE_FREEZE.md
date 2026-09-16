# Rule freeze — Wave239

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE239-SQUASHFS-BLOCK-FRAGMENT-DEDUPE-JOINT-N2-CLOSURE`.
- Frozen control hashes supplied at dispatch: registry `8041E99A4D11BD614614BB35BE1C768C588DF7639098DC99CD86E8736747A7E3`; plan `6CC9C66D866FC5BCEC0F9CFC74395EFAC7C404F62D72B25B7EA9D2618C720EFC`.
- Role-rule SHA-256 observed on disk: `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Authoritative method: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`. R7/v8.8 are not decision semantics.
- Scope: Discovery source review only. No build, image creation, mount, benchmark, download, Stage0/A/B, shared-file edit, or automation was performed.

## Decision rule applied

The object is the same directory tree, file bytes, permitted metadata/xattrs and fixed SquashFS format/reader contract. A candidate may combine already legal block, fragment and deduplication actions, but it must beat the current same-information composition with a non-routine whole-image N2 algorithm or guarantee, preserve the reader-visible object, carry full construction and read cost, and have a finite fidelity closure. Missing implementation or results is not negative evidence. An incompletely enumerated current union is `NOT_ADMITTED_UNFROZEN`, not an absence claim.
