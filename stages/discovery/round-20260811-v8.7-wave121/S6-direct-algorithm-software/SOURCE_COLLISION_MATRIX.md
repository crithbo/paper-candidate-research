# Source and collision matrix

| Evidence layer | First-party/standard source | Frozen fact | Red-team implication |
|---|---|---|---|
| Current upstream repository | [official libpng repository](https://github.com/pnggroup/libpng) | current writer source tree and `libpng18` branch are public; `pngwutil.c`, `pngwrite.c`, public `png.h` are relevant symbols | current reality must include writer and configuration paths, not an old issue/future-work claim |
| Current writer source | [pngwutil.c](https://raw.githubusercontent.com/pnggroup/libpng/libpng18/pngwutil.c) | IDAT owns a persistent zstream; `png_deflate_claim` uses level/method/window/memory/strategy and can reset/reinitialize it; `png_compress_IDAT` preserves stream output state across calls | cross-row history is physically meaningful, but not itself a novelty proof |
| Current writer source | [pngwrite.c](https://raw.githubusercontent.com/pnggroup/libpng/libpng18/pngwrite.c) | native high-level write path is in the current source surface | all writer actions must be included in comparator closure |
| Public API | [png.h](https://raw.githubusercontent.com/pnggroup/libpng/libpng18/png.h) | filter and compression settings are part of the public writer/configuration surface | a filter-mask/level/strategy sweep is absorbed and not N2 |
| Format semantics | [W3C PNG Third Edition](https://www.w3.org/TR/png-3/) | PNG is lossless, streamable and specifies valid image/stream semantics | decoded-pixel/format equivalence is the same-object oracle |

## Direct-collision status

No first-party source in this bounded red-team supplies a complete matrix of current same-object PNG optimizers. Absence of a collision is **not** claimed. This unresolved check is one of the explicit reasons for `NOT_ADMITTED_UNFROZEN` rather than `PROPOSE_STAGE0`.
