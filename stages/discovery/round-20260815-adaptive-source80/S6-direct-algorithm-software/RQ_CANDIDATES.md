# Research-question candidates

## RQ-S80-01

- Seed: `S80-01`.
- Exact public anchor: Git current `git-diff` documentation plus current upstream diff algorithm configuration/source loci.
- Stable object and guarantee: fixed pre/post source trees, file modes and path semantics; the same patch/hunk output contract accepted by stock Git consumers.
- Primary RQ: **For a fixed pair of Git trees, is there a Git-specific complete hunk-partition/edit-script constructor with a formally useful review-stability or presentation guarantee that remains outside the current `--minimal`, patience, histogram, anchored and indent-heuristic composition?**
- Counterfactual consequence: if yes, users could choose a same-object diff representation by a stated semantic/presentation guarantee rather than an existing heuristic flag.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2, with a target-native action endpoint.
- Precommitted primary route: official `git-diff` / `gitdiffcore` documentation, then current upstream source locus for algorithm option dispatch.
- Transport-only fallback: official Git source mirror if the documentation endpoint is unavailable.
- Strongest null: all legal hunk partitions are ordinary edit-script/LCS/sequence-alignment variants, with Git exposing the meaningful target-level choice already as existing algorithm/configuration actions.
- Pre-RQ closure: `ORDINARY_CLOSURE`; no selective nomination is allowed in this assignment.

The RQ is evidence-neutral. It neither asserts an unimplemented Git action nor claims novelty.
