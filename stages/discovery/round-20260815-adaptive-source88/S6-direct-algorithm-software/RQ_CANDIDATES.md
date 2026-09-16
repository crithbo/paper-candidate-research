# RQ candidates — Source88 S6

## RQ-S88-01

- Anchor: official GNU Coreutils `sort` manual (current 9.10/9.11 pages), checked 2026-08-15.
- Exact object: fixed input line multiset and input-file order, locale, key and ordering options, stable/unique mode, Coreutils version, resource options and output destination.
- Immutable endpoint: byte sequence prescribed by the comparator/tie semantics, exit status and error behavior; `--stable` preserves input relative order for equal keys.
- Primary RQ: “Can a GNU-sort-specific joint run/merge/buffer constructor improve full cost while preserving this fixed sorting endpoint beyond the current executable union?”
- Candidate type: `METHOD_ALGORITHM`, N2. Counterfactual: an admitted residual must be more than choosing `--parallel`, `-S`, `-T`, `--batch-size` or a generic external sorting schedule.
- Source roles frozen: Coreutils `sort` invocation as anchor/current; same page's merge and resource trade-offs as contrary.
- Ordinary closure, no selective nomination.
