# Candidate-grade deep review

## D1 — ripgrep prefilter/DFA/cache joint constructor: `NOT_ADMITTED_UNFROZEN`

**Same-object contract.** Fix regex, input bytes, Unicode/multiline/binary semantics, traversal/filter behavior and match output. Any construction must retain stock-compatible failure/fallback behavior.

**Action-divergence witness.** A legal witness must force two complete searches to select different jointly constructed prefilter/automaton/cache plans while yielding identical outputs and using the same information/budget. Switching `--engine`, altering a cache limit, changing mmap policy or choosing a fallback is already in, or is merely a selector over, the known union; it is not a witness for N2.

**Current strongest union and baselines.** ripgrep documents finite automata/SIMD/literal optimization, default/PCRE2/auto engine paths, Unicode, multiline, mmap/incremental strategy, binary behavior and parallel traversal. RE2 supplies a linear-time, budgeted non-backtracking baseline; Hyperscan supplies hybrid automata for multiple regex/stream use. A fair residual must subtract their common semantic subset.

**Residual/collision.** No target-specific complete algorithm or theorem has been identified beyond that union, and direct primary literature/artifact closure is incomplete. Current source-level onepass/lazy/full DFA/NFA/hybrid/cache/flag enumeration is also not commit-pinned. No absence claim is made.

**Finite killer.** In 72 hours, pin ripgrep and regex-automata commits/options; freeze public corpus/query subset; compare two same-output constructions and RE2/Hyperscan where semantics coincide; reject if result is engine selection, cache tuning, controller behavior, generic automata construction or a current-union composition. Ledger: compile/search CPU-RSS, latency, throughput, state/cache bytes and full-scan equality.

**Decision.** `NOT_ADMITTED_UNFROZEN`; missing implementation/results/resources is not used negatively.
