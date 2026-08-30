# Source99 Question Cards

## QC99-01 — OpenJDK HotSpot C2 partial escape construction

- Exact identity/carrier: OpenJDK `master` `src/hotspot/share/opto/escape.cpp`; fixed Java bytecode/C2 configuration/deoptimization semantics; natural implementation carrier is the OpenJDK regression and application corpus.
- Same-object endpoint: eliminate allocations/locks only where Java behavior and deoptimization remain unchanged; cost boundary is compile CPU/RSS, generated code, runtime allocation/lock cost and deoptimization behavior.
- Current locus: the current `escape.cpp` implementation and official HotSpot material identify flow-insensitive EA/scalar replacement. An official Partial Escape Analysis RFC proposes a same-C2 construction for cases not handled by this phase.
- Minimum falsifier: establish whether the RFC construction and its precise guarantee directly covers the proposed partial-EA action under the same C2/deoptimization contract.
- Raw status: `EVIDENCE_QUALIFIED_RAW`; direct-collision debt was closed immediately in deep review.

## QC99-02 — libaom AV1 partition/mode construction

- Exact identity/carrier: `aom` main AV1 encoder; fixed frames and decoder-visible bitstream semantics; public AOM common-test conditions are the natural carrier route.
- Current locus: the official encoder guide says partition search is recursive over the quad-tree and sits atop mode search; current source exposes RD/non-RD paths, pruning, reuse and speed-feature controls.
- Skeptic/falsifier: a candidate that merely selects those pruning thresholds or an RD-tree traversal is a generic search/controller shell.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_RECURSIVE_RD_UNION_AND_GENERIC_SEARCH`. No target-specific action/guarantee survived.

## QC99-03 — oneDNN Graph partition/layout construction

- Exact identity/carrier: fixed operation graph, logical tensors and engine; stock oneDNN Graph compiled-partition execution supplies the oracle.
- Current locus: current official API compiles partitions and chooses an optimal opaque output layout for tensors with `any` layout.
- Skeptic/falsifier: the remaining formulation is graph partition/layout selection, a generic kernel expressly barred from raw admission.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_PARTITION_LAYOUT_KERNEL`.

## QC99-04 — FreeType auto-hinter construction

- Exact identity/carrier: fixed outline/cmap, point size, load flags, target and raster output; stock FreeType glyph retrieval/render is the oracle.
- Current locus: official docs expose default/native hinter precedence, force/no-autohint flags, rendering targets and auto-hinter script properties.
- Decisive same-object failure: changing global metrics/script fitting changes pixel glyph output or rendering policy; exact output preservation leaves no nontrivial action.
- Disposition: `EXCLUDED_BEFORE_RAW__SAME_OBJECT_FAILURE_OR_RENDER_POLICY_CHANGE`.

## Deep result for QC99-01

The first-party HotSpot status document and Partial Escape Analysis RFC cover the exact mechanism family: introduce a C2 phase to allow scalar replacement beyond control-flow-insensitive EA. The residual would therefore be a generic refinement/reimplementation of that known same-object construction, not a fresh target-specific algorithm. `DROP__DIRECT_SUBTRACT_ABSORPTION`; no Stage 0 brief.

Funnel: four RQs; one evidence-qualified raw; one bounded deep; zero clean briefs.
