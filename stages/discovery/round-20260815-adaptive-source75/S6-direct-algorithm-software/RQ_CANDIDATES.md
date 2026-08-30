# RQ candidates

## RQ-S75-01

- Exact anchor: GNU Grep 3.12 manual, official current online edition, accessed 2026-08-15.
- Stable object: fixed newline-delimited byte/text input, fixed set of `-F` patterns, locale and output flags; same matching-line result and exit semantics.
- Primary RQ: “Can GNU grep fixed-string multi-pattern prefilter construction be replaced by a target-specific whole constructor with a non-generic guarantee beyond the current native matcher union?”
- Out of scope: regex mode, changing patterns/input/locale/output semantics, index/cache policy and experiment execution.
- Precommitted source roles: official manual (ANCHOR/CURRENT), its stated Boyer–Moore/Aho–Corasick algorithms (CONTRARY); generic exact string matching as the falsifier. `NONE` selective nomination.
- FINER-lite: feasible CLEAR; relevance CONDITIONAL; novelty threat HIGH; scope fit PASS. Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.
