# Source and collision matrix — Wave320

| Family | Official/primary source | Strongest current semantics | Admission effect |
|---|---|---|---|
| OCI image | [OCI manifest specification](https://specs.opencontainers.org/image-spec/manifest/?v=v1.0.1), [OCI image format](https://oci-playground.github.io/specs-latest/specs/image/ceeb2eba078e8b630f5ee62df2e92323fb521f0e/oci-image-spec.pdf) | Layer descriptor digest and uncompressed DiffID bind materialization identity. | Repacking/layout changes need source-authorized same-object witness. |
| Android APK | [AOSP APK Signature Scheme v2](https://source.android.com/docs/security/features/apksigning/v2), [v3.2](https://source.android.com/docs/security/features/apksigning/v3-2) | Whole-file signing and verifier parsing/order are protected current contract. | ZIP/signature rearrangement not an unconstrained action. |
| WebAssembly | [Wasm Core Specification](https://www.w3.org/TR/wasm-core/), [validation algorithm](https://webassembly.github.io/spec/core/appendix/algorithm.html) | Decode, validation and instantiation define fixed binary semantics and validity. | Cache/streaming schedules not N2. |
| Linux module signing | [kernel module signing](https://docs.kernel.org/admin-guide/module-signing.html) | Installation signature and load-time verification establish guarantee. | Raw; full producer/loader union not closed. |
| RPM | Current official rpm source/spec required. | No legal same-object action frozen. | Raw. |
| Debian packages | Current official dpkg/apt source/spec required. | No legal same-object action frozen. | Raw. |

## Collision conclusion

No direct collision or novelty clearance is asserted. The legal same-object atomic action prerequisite is unclosed for all six lines; SEARCH_BOUNDED_OPEN is not a novelty result.
