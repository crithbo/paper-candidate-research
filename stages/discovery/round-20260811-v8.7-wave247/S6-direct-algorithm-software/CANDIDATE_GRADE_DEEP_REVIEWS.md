# Candidate-grade deep review

## D1 — OpenEXR chunk/tile/level joint layout N2

| Facet | Review result |
|---|---|
| Reader/oracle | Same OpenEXR pixel/channel/part/level/window/compression semantics; stock reference library decode, including ROI/full decode, is required. |
| Source reality | Official layout says the library is authoritative if documentation conflicts; official repository is the reference implementation. Current writer commit, API path, options/defaults and all line-order/config branches are not frozen here. |
| Strong union | Native scanline/tile/deep, multipart, chunk offset table, compression, level/line-order and writer API composition; strengthened by existing image-layout/ROI practice. Incomplete current source and direct collision closure means it is not a closed union. |
| Legal witness | Fixed tiles can retain their coordinate-tagged payload while regenerated offset tables refer to alternate physical chunks, but actual admissibility requires source/API validation. |
| Candidate ceiling | Nontrivial finite-state/global joint algorithm with an explicit bytes-versus-ROI/full-decode cost guarantee; no generic packing, parameter sweep or format transformation. |
| 72h fidelity/killer | Pin OpenEXR source/version; enumerate writer paths/options for tiled/scanline/multipart/mipmap/ripmap/line-order/compression; produce two stock-decoding layouts with identical pixels; subtract current tools/papers; reject if emission order is forced/absorbed, if any fixed semantic changes, or if no formal guarantee remains. |
| Decision | `NOT_ADMITTED_UNFROZEN`, zero brief. |
