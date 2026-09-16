# Unique opportunity family

## ripgrep regex-engine / prefilter / DFA-cache joint constructor

- Exact object: fixed regex syntax/features, input bytes, traversal/filter semantics and match output.
- Native oracle: stock ripgrep match output; a same-syntax compatible RE2/Hyperscan comparator only under the frozen language subset.
- Current union: literal prefilter, finite automata/SIMD, PCRE2 default/auto path, Unicode, multiline, mmap/incremental strategy, binary handling, parallel traversal and fallbacks.
- Conditional whole action: jointly construct a prefilter/automaton/cache/search strategy while retaining exactly the same regex semantics and failure behavior.
- Conditional N2: target-specific exact/FPT/Pareto/approximation/formal guarantee that exceeds the executable union and same-information RE2/Hyperscan methods. Engine selection/cache parameter tuning is excluded.
- Natural route: versioned public code/text corpus plus query suite; compile/search CPU-RSS-latency-throughput/full-scan cost and match equality.
- Status: no brief; complete current source union and direct primary collision closure remain unpinned.
