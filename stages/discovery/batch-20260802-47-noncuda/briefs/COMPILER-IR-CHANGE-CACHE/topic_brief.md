# COMPILER-IR-CHANGE-CACHE
- Status: `DROP`; Primary lane: incremental compilation; Discovery date: 2026-08-02
## Research question
Can IR change caching reduce recompilation?
## Exact object
Incremental rebuild from IR/checksum/dependency changes.
## Strongest fair baseline
Whole-program dependency closure and affected-fragment recompilation.
## Current collision subtraction
Same core as `COMPILER-IRHASH-CHANGEFRONTIER`, already directly covered.
## Decisive falsifier
Dependency-closure rebuild matches every cache invalidation action.
## Dual-axis score
- Academic value: `42/70`; AI executability bonus: `24/30`; Total: `66/100`
