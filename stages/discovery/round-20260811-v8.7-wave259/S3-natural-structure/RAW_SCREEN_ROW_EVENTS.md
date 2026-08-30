# RAW_SCREEN_ROW_EVENTS

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE259-VERSIONED-NATIVE-ARTIFACT-STABLE-IDENTITY-N2N3-BREADTH-II`  
Cutoff: 2026-08-11. Evidence is first-party only; no artifact was downloaded or executed.

| ID | Fresh family and natural version chain | Initial stable-identity phenomenon / proposed whole action | First witness outcome | Funnel state |
|---|---|---|---|---|
| W259-R1 | RPM binary packages in successive Fedora/RPM repositories | Same NEVRA logical package over adjacent releases; predecessor-aware header/payload ordering and compression constructor | RPM’s signed header/payload and digest fields make a changed byte layout a different signed artifact unless the signing relation is rebuilt. | `STRUCTURAL_DROP` |
| W259-R2 | Android APEX packages across AOSP release tags | Same package/version relation; joint payload-file placement constructor | APK and payload signatures bind the physical package/payload. A re-layout changes the signed object, not merely its representation. | `STRUCTURAL_DROP` |
| W259-R3 | Android DEX (`classes.dex`) from adjacent official AOSP build artifacts | Fixed class/method/code semantics; predecessor-aware ID/class-data placement with offset repair | Legal alternate placements are plausible from the format, but current dexlayout/dex2oat source/config union and a pinned natural 20–50-build chain are not closed. | `DEEP_DIVE_REQUIRED` |
| W259-R4 | Rust `.rmeta` from adjacent rustc releases | Fixed crate metadata under one rustc compatibility boundary; predecessor-aware lazy-table placement | Current rustc documents a versioned internal metadata encoding and lazy tables, but the permitted cross-version reader/producer contract is not frozen. | `DEEP_DIVE_REQUIRED` |
| W259-R5 | CPython hash-based `.pyc` from adjacent CPython tags | Fixed source-hash and code-object semantics; predecessor-aware marshal/constant-table construction | Official APIs expose invalidation modes, not a legal independent whole-layout constructor; bytecode-specific API is expressly absent. | `STRUCTURAL_DROP` |
| W259-R6 | Signed Linux `.ko` modules from adjacent kernel tags | Fixed exported-symbol/module semantics; predecessor-aware ELF section/layout constructor | The signature covers the entire module, including debug information; post-signing re-layout violates the stock verified object. | `STRUCTURAL_DROP` |

No row was promoted merely because a format has a physical layout. Rows R3/R4 entered deep review only because a minimal semantic-preserving placement witness can be named; neither is a candidate until the current union and natural chain close.
