# Source and collision matrix

Frozen cutoff: 2026-08-11. All technical evidence is first-party official project documentation/source.

| id | official source | current action / guarantee evidence | outcome |
|---|---|---|---|
| R01/R02 | [Zstd project](https://facebook.github.io/zstd/index.html), [Zstd manual](https://facebook.github.io/zstd/zstd_manual.html) | training, dictionaries, CDict/DDict, memory/context/reset and exact decoder compatibility | direct current union |
| R03 | [Zstd comparison table](https://facebook.github.io/zstd/index.html) establishes only a competing Brotli trade-off, not a new Brotli action | no first-party complete witness frozen | not admitted |
| R04 | [RE2 source](https://github.com/google/re2), [RE2 header](https://github.com/google/re2/blob/main/re2/re2.h) | configurable budget, DFA cache flush, NFA fallback, bounded parser/compiler/engine | direct current union |
| R05 | [DRAT-trim source](https://github.com/marijnheule/drat-trim) | additions/deletions, polynomial checking, deletion cost purpose, modes/core outputs | direct current certificate union |
| R06 | first-party current complete LRAT construction not frozen in this batch | no legal same-object union/action | unfrozen/no deep |

No source-absence claim is made: R03/R06 fail the positive-contract threshold, while R01/R02/R04/R05 collide with positive current constructors.
