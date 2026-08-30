# Source99 primary RQ candidates

## RQ99-01 — HotSpot C2 escape analysis

- Exact public anchor: OpenJDK HotSpot `escape.cpp` on `master` and the HotSpot escape-analysis status material.
- Immutable object: a fixed Java method/bytecode, C2 compilation configuration, deoptimization and Java behavior.
- Primary RQ: Can a C2-specific bounded partial-escape construction preserve deoptimization semantics while deciding scalar replacement more precisely than the current flow-insensitive construction?
- Anchor question: Does current C2 or a first-party direct predecessor already express that construction?
- Route: OpenJDK current source, then official status/RFC. Ordinary closure only.

## RQ99-02 — libaom AV1 partition/mode construction

- Exact public anchor: Alliance for Open Media `aom` main encoder partition-search documentation/source.
- Immutable object: fixed input frames, AV1 bitstream/decoder semantics, rate-distortion and encoder-time boundary.
- Primary RQ: Does a target-specific joint partition/mode constructor remain outside libaom’s present recursive RD search and speed-feature union?
- Route: official encoder guide and `partition_search.c`/`speed_features.h`.

## RQ99-03 — oneDNN Graph partition artifact

- Exact public anchor: oneDNN Graph current compiled-partition API.
- Immutable object: fixed operation graph, logical tensor contract and target engine.
- Primary RQ: Does a non-generic joint partition/layout constructor remain after the native compiled-partition and opaque-layout union?
- Route: official Graph partition and compiler documentation.

## RQ99-04 — FreeType auto-hinter

- Exact public anchor: FreeType 2.14.3 auto-hinter and glyph retrieval documentation.
- Immutable object: fixed font outline, cmap, point size, rendering target and pixel output semantics.
- Primary RQ: Can global script/metric analysis plus glyph fitting be altered while preserving the exact stock raster output, rather than merely changing rendering policy?
- Route: official properties, glyph retrieval and auto-hinter documentation.

All RQs were selected before evidence lookup. No alternate RQ was required because no genuine same-object scope ambiguity existed.
