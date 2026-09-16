# Source94 S6 — primary RQs

## S94-01 Git rename pairing

For a fixed pair of Git trees and merge semantics, does an action beyond the current `diffcore` rename pipeline define a Git-specific whole pairing constructor with a non-generic correctness/cost guarantee?

Anchor: Git current `diffcore-rename` source route. Counterfactual: the residual is ordinary similarity matching or threshold selection.

## S94-02 ICU collation keys

For fixed Unicode input and tailoring with identical collation ordering, is a tailoring-specific joint sort-key constructor left beyond current ICU collation paths?

Anchor: ICU upstream collation/sort-key source route. Counterfactual: the action only changes representation or becomes generic string coding.

## S94-03 FreeType auto-hinting

For a fixed font and rendering contract, is a global auto-hint constructor with an exact non-generic rendering guarantee left beyond current FreeType autofit actions?

Anchor: FreeType official source. Counterfactual: it is a local heuristic or changes raster semantics.

S94-04 through S94-06 were left at locator level because the action and contribution boundary was generic before RQ commitment.
