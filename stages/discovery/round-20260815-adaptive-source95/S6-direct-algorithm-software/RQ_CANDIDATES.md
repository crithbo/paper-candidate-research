# Source95 RQ candidates

All RQs were frozen before directed source retrieval. They retain fixed objects and guarantees; none is evidence of novelty or admission.

## S95-RQ01 — Bazel

- Anchor / immutable boundary: Bazel Skyframe; fixed workspace, configuration, source-change trace, configured-target values and observable build result.
- Primary RQ: Does a Bazel-specific coupled invalidation-and-evaluation constructor exist that reduces recomputation cost while preserving the same configured-target results and declared dependencies, without becoming a generic DAG scheduler?
- Scope: source/change graph construction only; no remote-cache policy, API change, or changed build semantics.
- Falsifier: the decision variables collapse to ordinary dependency traversal or execution scheduling.
- Precommitted route: official Skyframe documentation, then the current Skyframe source tree. Fallback is the official Bazel repository browser only for transport failure.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL`.
- Pre-RQ closure: `ORDINARY_CLOSURE`; outcome-aware reformulation forbidden.

## S95-RQ02 — Mercurial

- Anchor / immutable boundary: Mercurial revlog; fixed revision DAG/content, revlog lookup results, and append-only persistence contract.
- Primary RQ: Does a revlog-specific joint snapshot/delta-base constructor have a guarantee beyond generic delta-base selection while maintaining the same revision lookups and append-only model?
- Scope: revlog construction; excludes a new archive format, external compressor, or a changed revision graph.
- Falsifier: the only residual is general delta compression or generic minimum-cost representation selection.
- Precommitted route: official Mercurial revlog documentation plus current source. Fallback is official project help/source mirror only for transport failure.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL`.
- Pre-RQ closure: `ORDINARY_CLOSURE`.

## S95-RQ03 — Pango

- Anchor / immutable boundary: Pango 1.58 rendering pipeline; fixed Unicode text, font/features, width, and glyph/line output contract.
- Primary RQ: Is there a Pango-specific joint line-break/justification constructor with a same-layout guarantee that is not a generic text-layout DP or a change in shaping/line semantics?
- Scope: layout construction only; excludes changed text, fonts, glyph positions, or renderer behavior.
- Falsifier: the action is simply generic shortest-path/line-breaking or a local layout option.
- Precommitted route: official Pango pipeline and API documentation, then current source only if the discriminator survives.
- FINER-lite: feasible `CLEAR`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL`.
- Pre-RQ closure: `ORDINARY_CLOSURE`.

## S95-RQ04 — OpenJPEG

- Anchor / immutable boundary: OpenJPEG `opj_compress`; fixed samples, declared JPEG 2000 profile, and decoder-visible result.
- Primary RQ: Does a JPEG-2000/OpenJPEG-specific packet-progression and tile-part constructor preserve the fixed decoder contract while attaining a non-generic guaranteed access-cost frontier?
- Scope: no altered pixels, quality profile, decoder, or external recompression.
- Falsifier: action freedom is only the exposed standard codec parameter set or generic rate-distortion packet ordering.
- Precommitted route: official OpenJPEG `opj_compress.c` current source and official codec documentation.
- FINER-lite: feasible `CLEAR`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL`.
- Pre-RQ closure: `ORDINARY_CLOSURE`.

No alternative RQ was needed: no genuine same-object ambiguity was found for the four selected anchors.
