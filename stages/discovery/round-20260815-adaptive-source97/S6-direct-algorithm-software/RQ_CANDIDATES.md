# Source97 primary RQs

| ID | Frozen same-object RQ | Primary anchor route | Minimum falsifier |
|---|---|---|---|
| S97-RQ01 | For a fixed Lua program/input trace, can a Lua-table-specific joint array/hash migration constructor guarantee a better time-RSS frontier without changing table-visible semantics? | Lua official source/manual; current table source locus | ordinary dynamic hash-table resize/rehash absorbs the decisions |
| S97-RQ02 | For fixed XML input and parser results, does libxml2 have a dictionary/name-storage construction with a non-generic parser-specific guarantee? | GNOME libxml2 official docs/source | the only action is generic string interning/deduplication |
| S97-RQ03 | For fixed pixels and palette/decoded contract, can ImageMagick quantization-tree construction yield a target-specific guarantee beyond generic palette clustering or changed error semantics? | ImageMagick official docs/source | generic quantization/clustering or changed palette/error contract |
| S97-RQ04 | For a fixed FFT problem and numerical output, does FFTW plan construction offer a non-controller target-specific whole algorithm guarantee? | FFTW official manual/current source | planning is a generic planner/search/cache and uses measurements not allowed here |

FINER-lite: scope/security `PASS`; novelty threat `HIGH`; feasibility/relevance `CONDITIONAL`. All RQs froze before source outcomes; selective depth is OFF.
