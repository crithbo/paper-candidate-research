# RQ candidates — Source86 S6

## RQ-S86-01

- Seed: `S86-01`.
- Exact public anchor: GNU gettext utilities 0.26 manual, `msgmerge Invocation` and `Fuzzy Entries`, accessed 2026-08-15.
- Tentative object: fixed existing `.po` catalog, fixed new `.pot` template, locale/plural/context metadata, GNU gettext version/options, and a translator-validated meaning contract.
- Primary RQ: “Can a GNU-gettext-specific whole catalog-update constructor choose fuzzy carry-over pairings that preserves the same validated translation semantics while providing a non-generic guarantee on translator work, runtime catalog quality and update cost?”
- Stable endpoint: accepted translations must remain semantically valid for the revised messages; fuzzy hypotheses alone are not accepted translations.
- Contribution hypothesis: `METHOD_ALGORITHM`, `N2`.
- Counterfactual: a surviving residual would change which old translations are presented for human review without silently changing accepted translation meaning; otherwise the task is generic text correspondence or a workflow policy.
- Precommitted primary source route: official GNU gettext `msgmerge Invocation`, `Workflow flags`, and `Fuzzy Entries`; fallback is the current manual top page for transport only.
- Ordinary closure: YES; no selective-depth nomination.

FINER-lite: feasible `CLEAR`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevant `CONDITIONAL`. This card is pre-evidence scheduling only.
