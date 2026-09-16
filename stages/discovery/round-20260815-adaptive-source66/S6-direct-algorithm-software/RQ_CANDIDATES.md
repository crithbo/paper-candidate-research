# RQ candidate — S66-01

- Seed: `S66-01` in `DIVERGENCE_SEED_POOL.md`.
- Exact anchor: OpenJDK `master` C2 SuperWord source plus JEP 426, accessed 2026-08-15.
- Stable contract: fixed Java loop, HotSpot C2 compilation tier/options, target ISA and unchanged Java behavior.
- Hypothesis only: `COMPILER_TOOL` / N2 joint SLP pack construction with a target-specific guarantee.

## Primary RQ

For a fixed Java loop and target ISA, does a C2-specific joint SuperWord pack construction remain after the current C2 vectorization path and known globally optimized SLP constructions are fairly subtracted?

- Earliest falsifier: the only surviving action is generic SLP pack selection/global optimization, or the distinction is solely a HotSpot implementation/flag choice.
- Primary source route: current `superword.cpp`, `c2_globals.hpp`, and JEP 426.
- Contrary route: goSLP, a globally optimized SLP construction.
- Mode: `ORDINARY_CLOSURE`; no selective/strong-model packet was nominated or run.
- Result: `EXCLUDED_BEFORE_RAW__GENERIC_SLP_KERNEL`; no post-result replacement.
