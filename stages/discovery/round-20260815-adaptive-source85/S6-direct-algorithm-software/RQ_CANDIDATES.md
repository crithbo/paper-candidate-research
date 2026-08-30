# RQ candidates — Source85 S6

## RQ-S85-01

- Seed: `S85-01`.
- Exact public anchor: GNU Make Manual, current online manual, §§10.1, 10.4 and 10.8, checked 2026-08-15.
- Tentative object: one fixed GNU makefile, rule database, filesystem snapshot, command/environment values, requested targets, and GNU make version.
- Immutable endpoint: stock GNU make's selected recipes/intermediate-file actions and the resulting observable build behavior, including recipe side effects and failure status.
- Primary RQ: “For that fixed GNU make object, does a target-specific whole implicit-rule-chain constructor exist that preserves the stock build endpoint while improving construction cost beyond GNU make's current chain-selection mechanism?”
- Alternative RQs: none; an alternative that fixes only final target bytes would weaken/alter the stock build endpoint by discarding recipe side effects and intermediates.
- Contribution hypothesis: `METHOD_ALGORITHM`, `N2`.
- Counterfactual consequence: if a same-endpoint residual existed, build systems could choose a distinct legal rule-chain construction with a declared cost/guarantee; if no endpoint-preserving alternatives exist, this is not a build-algorithm opportunity.
- Selected for ordinary closure: YES.
- Precommitted source routes: GNU make manual `Using Implicit Rules`, `Chains of Implicit Rules`, and `Implicit Rule Search Algorithm`; fallback is the manual top page only for transport failure.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`; no sol/high request.

FINER-lite: feasible `CLEAR` (public manual); relevant `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; interesting `CONDITIONAL`. These are scheduling notes, not evidence.
