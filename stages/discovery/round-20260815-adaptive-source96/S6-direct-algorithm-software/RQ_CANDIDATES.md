# Source96 primary RQs

| RQ | Exact public anchor / immutable same-object boundary | Primary RQ | Primary route | Cheap falsifier |
|---|---|---|---|---|
| S96-RQ01 | HarfBuzz subset API/current source; fixed font, Unicode request, OpenType features, and shaping output | Does a HarfBuzz-specific joint glyph-closure/remapping/table constructor give a non-generic guarantee on bytes and shaping cost? | official HarfBuzz docs/source, then contrary font-subsetting literature | action is generic set closure/table pruning or changes font/shaping semantics |
| S96-RQ02 | Cairo current tessellation path; fixed path, fill rule, CTM, and raster output | Does a Cairo-specific path decomposition/edge ordering constructor improve raster-equivalent cost beyond generic tessellation? | official Cairo source/API, then contrary tessellation algorithms | only general monotone decomposition/edge sorting remains |
| S96-RQ03 | libpng current write API; fixed pixels, PNG decoder output, and compression contract | Does a libpng-specific joint row-filter constructor have a formal full-cost guarantee beyond generic filter/compression selection? | official libpng manual/source, then codec contrary | only generic compression/filter DP remains |
| S96-RQ04 | clang-format current formatting pipeline; fixed input/style and exact formatted text | Does a clang-format-specific line-break/penalty constructor supply a non-generic guarantee while preserving exact formatting? | LLVM current docs/source, then formatting contrary | generic shortest-path/pretty-printing kernel or changed format output |

All primary RQs were set before source outcomes. FINER-lite is `CONDITIONAL` on feasibility/relevance, `HIGH` novelty threat, and `PASS` scope/security. Ordinary closure only; selective depth is OFF.
