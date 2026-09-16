# Static Absorption and Fairness Audit

## Code-level equivalence

In `revision_probe.py`, `ABSORBER` and `PDEC`:

- both require `certificate_feasible` pages;
- both store the same affine metadata;
- both call the same `local_partition` routine;
- both call the same `apply_update` routine with no PDEC-only branch;
- both use the same model window, exact comparison and query-profile code.

Starting from identical empty states, every operation therefore produces identical states, actions, guarantee flags and cost vectors by induction. The 218,240 equality checks verify the frozen implementation but are not 218,240 independent empirical samples. The decisive evidence is the code-level mechanism isomorphism plus the absence of any extra PDEC state or action.

## Independent arithmetic checks

- `13,640 joint states × 2 operations × 8 keys = 218,240` exhaustive transitions.
- Absorbed plus unabsorbed exhaustive transitions: `218,240 + 0 = 218,240`.
- Strict exhaustive residual: `0`.
- Natural comparisons: `639 effective updates + 2 same-key no-op calls = 641`; all `641` are absorbed.
- The ten natural delete events are absent-state no-ops handled outside the transition routine; no effective-delete evidence is claimed.
- PDEC maximum candidate slots: `4`; full leaf capacity: `4`; strict-subpage violations: `8,598` exhaustive and `442` natural.

## Is the affine frontier a fair control?

As an end-to-end performance baseline, a control defined to copy the candidate would be circular and invalid. That is not the use made here. The initial gate asked a mechanism-absorption question: after granting a conventional COW B+tree the same 24-byte affine hint, information and action repertoire, is any irreducible PDEC state, transition, guarantee or priced metric left?

The answer is no because the frozen PDEC leaf consists only of those granted components and the certificate-feasible split policy. The frontier is therefore an expressiveness/guarantee best-response envelope, not an independently optimized system whose timing is compared. Plain and default-affine controls remain separately present and show that PDEC really does split earlier; the frontier shows that this difference is implementable by the same B+tree leaf without a distinct mechanism.

This boundary must be stated precisely: the result does not establish that a separately engineered B+tree implementation will have identical end-to-end performance. It establishes that the frozen leaf-local N1/N2 claim has no action/guarantee/full-local-cost residual once the same hint and policy are admitted.

## Guarantee and cost outcome

- `G1`: the affine frontier inherits certified no-fallback behavior. PDEC still reaches a four-slot window and three comparisons, so capacity 4 supplies no strict local search-width improvement over full-leaf binary search.
- `G2`: maxima `4 touches / 2 auxiliary pages / 5 rebuilt slots` occur for the controls as well.
- `M1`: PDEC and the affine frontier have identical state, transition, query-guarantee and cost vectors everywhere.

On the natural replay, relative to plain COW, PDEC has 14 more final leaves, 10,664 more committed bytes, 3,584 more payload-write bytes and 14 more aggregate logical touches. PDEC does rebuild fewer aggregate key slots than plain/default affine, so plain does not strictly dominate every component; this does not rescue novelty because the affine frontier reproduces the entire PDEC vector exactly.

## Minor implementation-scope caveat

The revision profiles affine-window behavior explicitly for predecessor queries. Its range implementation validates exact output and page-level output sensitivity but does not separately expose a model-window/fallback profile for the range start. This cannot create a hidden PDEC residual: absorber and PDEC share the same state and query implementation. It only prevents any stronger range-window claim, which the closing report does not make.

