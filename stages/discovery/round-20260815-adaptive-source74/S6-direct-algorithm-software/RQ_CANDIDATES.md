# RQ candidates

## RQ-S74-01

- Seed: S74-01; selected before evidence review.
- Exact public anchor: GNU Make manual, current online edition, “Implicit Rule Search Algorithm”, accessed 2026-08-15.
- Stable object: a fixed GNU Makefile, target request, filesystem snapshot, rule database and command-variable environment; observable result is GNU Make's selected applicable rule chain and the resulting update behaviour.
- Primary RQ: “For a fixed GNU Make implicit-rule instance, is there a target-specific whole-chain constructor with a non-generic guarantee that is not already expressed by GNU Make's documented implicit-rule search?”
- Scope: no build scheduling, no changed recipes, no altered filesystem snapshot, and no execution experiment.
- Falsifier route: the official algorithm itself enumerates and orders the proposed choice space, or the remaining formulation is ordinary AND/OR shortest-path/rule-chain search.
- FINER-lite: feasible `CLEAR` (manual and source locus); relevance `CONDITIONAL`; novelty threat `HIGH`; scope fit `PASS`.
- Precommitted source roles: ANCHOR/current = GNU Make manual; contrary = the same manual's prescribed search algorithm and the generic AND/OR derivation kernel. Fallback is official manual mirror only for transport failure.
- Pre-RQ closure nomination: `NONE`; ordinary Terra route only.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.
