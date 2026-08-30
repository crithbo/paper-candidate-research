# Primary RQ — S3-98-01

- **Anchor:** official `systemd/systemd` main repository’s `hwdb.d/` source tree and official systemd device/hwdb documentation, checked 2026-08-15.
- **Tentative object:** an `hwdb.bin` generated from a fixed versioned set of `.hwdb` rules, queried with stock systemd/udev device-property semantics.
- **Invariant boundary:** same matching inputs, property mappings, precedence, and stock binary reader; no changed rules, custom lookup implementation, cache/controller, or changed device semantics.
- **Five-field preflight:** no exact object/action/endpoint match was found in the frozen registry/history surface for `hwdb.bin`; that no-match is not novelty or absence evidence.

## RQ

Across a fixed release series of systemd `hwdb.d` rules, can a predecessor-aware binary-hwdb constructor preserve every stock modalias/property query result while improving final database plus same-information release-transition cost over the current updater and a generic binary-delta baseline?

If viable, this would be N2 only after a target-specific whole constructor/guarantee is specified; N3 requires later measured release-stability evidence. Full cost would include update/generation CPU/RSS/temp storage, binary and delta bytes, and stock lookup/loading costs.
