# Source and collision matrix

| Target | First-party source / check | Result | Consequence |
|---|---|---|---|
| libpng repository pin | [official repository](https://github.com/pnggroup/libpng), `git ls-remote` attempt | branch `libpng18` and source surface observed; exact SHA unavailable because Schannel returned `SEC_E_NO_CREDENTIALS`, while GitHub commit page returned 429 | no commit hash invented; action gap cannot be fully current-pinned |
| libpng writer | [current pngwutil.c](https://raw.githubusercontent.com/pnggroup/libpng/libpng18/pngwutil.c); [current pngwrite.c](https://raw.githubusercontent.com/pnggroup/libpng/libpng18/pngwrite.c); [current png.h](https://raw.githubusercontent.com/pnggroup/libpng/libpng18/png.h) | persistent IDAT zstream, zlib parameter fields and native writer/chunk actions are affirmative source facts | fixed-tuple/filter-mask tuning is absorbed |
| PNG object semantics | [W3C PNG Third Edition](https://www.w3.org/TR/png-3/) | standard lossless PNG stream and decoded-pixel semantics | defines same-object reader/oracle |
| ZopfliPNG | [official Google Zopfli repository](https://github.com/google/zopfli) | Zopfli provides valid DEFLATE/zlib compression; repository includes `README.zopflipng`; archived 2025-10-14 but still a deployable same-object writer | expands strongest fair union beyond one zlib tuple |
| OptiPNG | [official project repository endpoint](https://github.com/OptiPNG/optipng) | current source fetch failed | complete union unknown; no absence claim |
| pngcrush | [official project endpoint](https://sourceforge.net/projects/pngcrush/) | source endpoint unavailable to this assignment | complete union unknown; no absence claim |

## Collision outcome

Direct collision/absorption cannot be resolved honestly: ZopfliPNG proves the earlier comparator was too narrow, and OptiPNG/pngcrush complete action surfaces remain unverified. This is an admission failure (`NOT_ADMITTED_UNFROZEN`), not a scientific STOP.
