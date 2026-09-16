# Source96 ordinary closure and Question Cards

## S96-QC01 — HarfBuzz subset plan

- Exact anchor/current locus: official `hb-subset` manual and current `harfbuzz/src` tree, observed 2026-08-15.
- Fixed contract: font face, requested Unicode/features, and shaping-visible result; no changed script, glyph position, OpenType layout behavior, or custom reader.
- Current action evidence: the documented subset plan computes retained glyphs/tables, glyph old/new mappings, serialization links, and supports layout closure/flags.
- Proposed endpoint/full-cost: subset bytes plus `hb-shape` CPU/RSS/latency under fixed output.
- Cheapest falsifier: the alleged joint closure/remapping/pruning action is already the native subset-plan operation; any remaining table-object packing is generic serialization/packing.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_ACTION_ABSORPTION_OR_GENERIC_SERIALIZATION`; no absence claim and no source queue.

## S96-QC02 — Cairo path construction

- Exact anchor/current locus: official Cairo paths API, observed 2026-08-15.
- Fixed contract: path, fill rule, transform and raster output; flattening tolerance is held fixed.
- Current action evidence: current API represents path operations and exposes path copying/flat copying; flattening is explicitly piecewise-linear approximation under a tolerance.
- Proposed endpoint/full-cost: tessellation/render CPU/RSS plus raster equality.
- Cheapest falsifier: ordering/decomposition remains ordinary planar tessellation/geometry. Changing tolerance or approximation changes the output/quality boundary.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_GEOMETRIC_KERNEL`; no implementation/resource inference.

## S96-QC03 — libpng adaptive row filters

- Exact anchor/current locus: official libpng repository plus PNG specification/manual, observed 2026-08-15.
- Fixed contract: pixels, PNG decoder output and valid PNG compression contract.
- Current action union: PNG permits per-scanline selection among five filters; libpng exposes filter masks and weighted filter heuristics, including relative filter costs; the specification itself recommends adaptive per-scanline filtering.
- Proposed endpoint/full-cost: output bytes, encode CPU/RSS, decode CPU/RSS and I/O.
- Cheapest falsifier: the candidate is exactly generic adaptive filter/compression selection, and source documentation already makes its native controls explicit.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_ACTION_UNION_AND_GENERIC_COMPRESSION_KERNEL`.

## S96-QC04 — clang-format break penalties

- Exact anchor/current locus: Clang 24.0.0git official clang-format and style-option docs, observed 2026-08-15.
- Fixed contract: source, fully specified style and exact formatted output. Changing penalties/style changes the formatter contract; holding exact output removes a meaningful candidate action.
- Current action union: official style documentation enumerates numerous line-break penalties and line-breaking behavior; clang-format supports style-file and inline style configuration.
- Proposed endpoint/full-cost: formatting CPU/RSS/temp and exact text equality.
- Cheapest falsifier: any residual is constrained pretty-printing/shortest-path style optimization, or it changes the exact output via a style/penalty choice.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_PRETTY_PRINTING_KERNEL_OR_CHANGED_OBJECT`.

## Raw gate result

All four RQs had an exact anchor and same-object formulation but failed the source-supported non-generic discriminator. `EVIDENCE_QUALIFIED_RAW=0`; this is neither a novelty assertion nor a negative inference from implementation, result, resources, or AI readiness.
