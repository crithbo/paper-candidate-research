# Discovery log — Wave320 verified data-movement bottleneck breadth

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE320-VERIFIED-DATA-MOVEMENT-BOTTLENECK-BREADTH.
- Cutoff 2026-08-11; v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen controls: plan 8A3AE8F81754D4C91B4FDA9324814A118DD729262BDE1353C4FD0B30CB11537D; registry B74A21132B0DB7021959BABD5A28249D3B22A09B076ABC3119EFB36947D2347B; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Six fresh families

| Family | Fixed object/guarantee and stock oracle | Result |
|---|---|---|
| OCI image layer materialization and digest verification | Fixed manifest, compressed layer bytes and DiffIDs; stock pull/unpack/digest oracle. | Deep; NOT_ADMITTED_UNFROZEN. |
| Android APK install materialization and signature verification | Fixed APK bytes, signer/SDK compatibility and installed package behavior; stock verifier/install oracle. | Deep; NOT_ADMITTED_UNFROZEN. |
| WebAssembly decode/validation/instantiation | Fixed Wasm binary/imports and observable execution; standard validation plus embedding oracle. | Deep; NOT_ADMITTED_UNFROZEN. |
| Linux signed module loading | Fixed module bytes/signature/kernel acceptance. | Raw; action union not closed. |
| RPM payload/signature installation | Fixed package payload and package-manager verification result. | Raw; no legal whole action witness. |
| Debian package archive/checksum installation | Fixed archive/control/payload and stock acceptance. | Raw; no legal whole action witness. |

## Candidate-grade deep review

### OCI

OCI specifications bind manifests to layer descriptors and distinguish compressed layer digest from uncompressed DiffID. Stock pull verifies a declared digest before materialization. Any change to layer byte layout, digest, manifest descriptor, unpacker or verifier changes the exact object/guarantee; a pull cache, transport selector or external repacker is excluded. No source-authorized same-digest and stock-unpack-equivalent joint copy/materialization action with target-specific algorithm/guarantee was frozen. Status NOT_ADMITTED_UNFROZEN.

### APK

APK Signature Scheme v2 is whole-file integrity protection and its stock verification fixes signing-block placement and protected bytes. Changing ZIP central-directory/signing-block layout requires re-signing or changes the protected object; altering verification ordering, sampling, or installation policy weakens or changes the guarantee. No stock-verifier-equivalent pair with a legal cross-copy/materialization action beyond generic ZIP packing was frozen. Status NOT_ADMITTED_UNFROZEN.

### WebAssembly

The WebAssembly specification fixes the binary module, decoding, validation and instantiation semantic phases. Validation is a sound/complete algorithmic obligation for the fixed byte stream and imports; materializing a different binary is a different module unless byte-identical. Streaming/parallel decode or caching is runtime scheduling/caching, and an alternative validator must preserve the formal validity/instantiation contract. No union-external complete data-movement/checking action and target-specific guarantee was frozen. Status NOT_ADMITTED_UNFROZEN.

## Finite natural route and killer

A later closure can use 20–50 version-pinned public OCI image manifests/layers, AOSP APK fixtures, or WebAssembly specification/test-suite modules. Stock oracles are digest/unpack equivalence, Android verification/install acceptance, and Wasm validation plus observable execution. Full cost includes producer/build, copy/network bytes where applicable, materialization CPU/RSS/temp, verification/validation CPU-RSS, cold/warm load/instantiate and final stored bytes.

Within 72 hours fail closed if a proposed action changes the signed/digested/binary object, stock verifier/reader, required guarantee, or resolves to generic packing, cache, transport scheduling, flags or wrapper. A direct primary collision search is only meaningful after a lawful same-object action is frozen.

## Decision

COMPLETE_ZERO_PROPOSALS. Three deep audits remain NOT_ADMITTED_UNFROZEN; three are raw. No scientific conclusion rests on missing implementation, result, resource or AI readiness, and none is terminal STOP.
