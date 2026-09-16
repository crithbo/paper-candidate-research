# Source-closure report — S2-90-CQ01

## Scope and disposition

- Assignment: `SOURCE-CLOSURE-SOURCE90-S2-CQ01-SWIFT-SIL-OWNERSHIP-ARC-LAYOUT-V1`
- Frozen object: one fixed Swift module ABI and target compiled by stock Swift with unchanged ownership, lifetime, object-access, ARC, language and runtime semantics, and the same full-cost endpoint.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Authority boundary: this is a Discovery prebrief source closure only.  It does not decide a candidate, clean brief, Q2 shape, PASS, STOP, or stage state.

## Immutable pin and bounded acquisition

The first two official calls resolved `swiftlang/swift` default branch `main` to commit `d056c33516f5c5e934dfc45bff945ef3bb2771b3` (committer date 2026-08-15T01:36:50Z).  All four remaining calls used that exact SHA.

Six precommitted calls were consumed. Repository metadata, commit metadata, and `lib/SILOptimizer/ARC/ARCSequenceOpts.cpp` were retrieved (24,175 response bytes total). The frozen paths for ARC analysis, `AllocBoxToStack`, and the in-tree SIL carrier each returned HTTP 404 at that SHA. These are path-drift telemetry only: no alternate route or search was used, and none is evidence of source absence.

## What the retained source establishes

`ARCSequenceOpts.cpp` is a current stock SIL function transform.  Its retained code includes ARC sequence matching, increment/decrement pairing, loop and post-dominating-release handling, alias/identity/loop analyses, and repeat processing after transformations.  It is a concrete current subtractor for any proposal whose contribution is only local retain/release pairing, post-dominating release placement, or a controller around those existing analyses.

The retained locus does not expose the required complete stock union for ownership, object-access/lifetime lowering, layout/codegen and relevant options. Nor does it expose an in-tree fixed carrier with two complete legal ownership-plus-layout plans. The bounded retained material therefore cannot freeze a joint union-external Swift action, finite guarantee, fair generic ARC-placement/layout-packing objection, or full-cost falsifier.

## Closure debt for a later authorized route

1. Re-freeze direct official source loci for ARC analysis, allocation/lifetime lowering, and an in-tree SIL carrier at one immutable Swift commit; document path migration.
2. On one fixed module ABI and target, enumerate stock SIL actions that affect ownership, object access, ARC lifetime, representation/layout and their option surface.
3. Produce two complete stock-legal plans with unchanged ownership/lifetime/runtime behavior, then determine whether a proposed joint action lies outside the current union.
4. Freeze full cost (compile time/RSS, code and metadata size, runtime/ARC traffic, transformation overhead) and a falsifier rejecting any guarantee when a stock action expresses it or a plan changes frozen semantics.

No conclusion is drawn that this debt cannot be closed; the frozen bounded source route did not provide the required loci.
