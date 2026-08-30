# Current-constructor materialization depth matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE124-MATERIALIZATION-BOTTLENECK-CURRENT-CONSTRUCTOR-DEPTH` · **cutoff:** 2026-08-11.

| Family | Current first-party constructor and exact object | Union-external complete atomic action sketch | Full-cost and natural carrier | 72h killer / red-team result | Final |
|---|---|---|---|---|---|
| TensorFlow SavedModel | SavedModel load/revival/restoration → signature tensors, resources, side effects and errors | signature dependency closure: produce validated minimal function/variable/asset closure, materialize it, prove omitted state unreachable | read+deserialize+restore+validate+first invoke; upstream SavedModel fixtures | two-signature state/side-effect/error comparison; resource/custom-object semantics not finitely closed | `NOT_ADMITTED_UNFROZEN` |
| OpenEXR | current chunk/deep/tile reader → pixels, metadata, deep samples and reader errors | verification-carrying tile DAG: validate chunk/dependency graph, allocate then materialize each tile once | I/O+validate+decompress+allocation+pixel output; upstream tiled/deep images | mixed compression/deep image equivalence; validation order/exception semantics unclosed | `NOT_ADMITTED_UNFROZEN` |
| libpng | current stream/progressive reader → transformed pixel rows and CRC/error behavior | CRC-certified transform fusion: jointly consume/check chunk bytes and construct output row/certificate | read+CRC+inflate/unfilter+transform+copy/errors; `pngtest`/pngsuite | valid/malformed corpus pixel/layout/error comparison; interlace/stride/API CRC semantics unclosed | `NOT_ADMITTED_UNFROZEN` |

## Current-source anchors and collision boundary

Primary anchors: [TensorFlow upstream](https://github.com/tensorflow/tensorflow), [OpenEXR upstream](https://github.com/AcademySoftwareFoundation/openexr), [OpenEXR current changes](https://github.com/AcademySoftwareFoundation/openexr/blob/main/CHANGES.md), [libpng upstream](https://github.com/pnggroup/libpng). Wave111 checkpoint families are not revisited. Wave55–117 active/terminal/reviewed objects remain excluded. The sketches are deliberately recorded as hypotheses: no absent-interface claim is made, no cache/configuration is treated as a new action, and no candidate proceeds until reader/checker equivalence can be finitely closed.
