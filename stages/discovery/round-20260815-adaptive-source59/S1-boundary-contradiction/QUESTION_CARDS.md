# Question card QC01

| Required field | Frozen status |
|---|---|
| exact public identity | x86-64 TLSDESC ABI + current Sourceware glibc dynamic loader |
| same-object contract | fixed DSO/versioned open-close trace; same relocation, ABI resolver behavior, TLS address result and visibility semantics |
| carrier kind | implementation carrier; direct glibc TLS descriptor/dlclose test family named but not source-pinned |
| claim endpoint | target-native resolver/relaxation action plus full-cost |
| counterfactual | a legal global materialization decision would change descriptor state without extending its lifetime or changing ABI result |
| non-generic discriminator | must depend on TLSDESC resolver/relocation/module lifetime state, not generic cache eviction or delayed binding |
| current locus | Sourceware glibc project and published TLS descriptor `xdlclose` test locator |
| minimum falsifier | current union already composes every legal state, or a proposed transition retains a descriptor beyond module visibility |
| initial full cost | dynamic-loader CPU/RSS, resolver calls, relocation/text bytes, `dlopen`/`dlclose` latency and TLS allocation/lifetime cost |
| finite route | resolve one current Sourceware glibc commit; inspect only TLSDESC dynamic resolver/relocation and direct test paths, then freeze a two-state legal trace |

`RAW_REQUIRED=INCOMPLETE`: current action union and legal trace are bounded source debt, not a scientific failure or novelty claim. Disposition: `SOURCE_CLOSURE_QUEUE`.
