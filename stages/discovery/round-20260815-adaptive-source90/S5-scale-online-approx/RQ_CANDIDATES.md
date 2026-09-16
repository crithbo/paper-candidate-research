# Source90 S5 RQ candidates

## S5-90-RQ01

- Seed / anchor: SC90-01 / webpack Cache configuration, current documentation, accessed 2026-08-15.
- Fixed object: webpack filesystem cache for generated modules/chunks under unchanged compilation and emitted-output semantics.
- Primary RQ: Under fixed webpack cache validity and emitted output semantics, is there a non-policy, target-native online bounded-recourse cache-state constructor outside the current memory/filesystem cache and snapshot configuration union?
- In scope: persistent cache entries, cache validity, restoration, and storage overhead.
- Out of scope: changing dependencies, emitted assets, arbitrary cache replacement, cache age/generation/timeout tuning, or a different bundler.
- Falsifier: current official configuration already makes the surviving decision a cache type, snapshot, age, generation, memory-collection, or timeout option.
- Source plan: primary https://webpack.js.org/configuration/cache/; transport-only fallback https://webpack.js.org/configuration/other-options/.
- Nomination: ORDINARY_CLOSURE / TERRA_HIGH_ORDINARY; selective depth OFF.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
