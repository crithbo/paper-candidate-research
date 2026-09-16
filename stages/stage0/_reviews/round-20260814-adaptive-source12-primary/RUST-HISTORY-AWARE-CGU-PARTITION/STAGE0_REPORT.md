# RUST-HISTORY-AWARE-CGU-PARTITION — Stage 0 PRIMARY

## Decision

- Assignment: `STAGE0-P1-20260814-RUST-HISTORY-AWARE-CGU-PARTITION-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Conditional tier if closed: `TIER_B_Q2_VIABLE`
- Confidence: 0.74
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Route: `N2` with a conditional `N3` history-cohort law
- Stage A/B authorization: `false / false`

The same-object carrier is real: current rustc's partitioner maps mono items to named CGUs before code generation, and the official documentation explicitly frames partition granularity as the incremental-rebuild versus optimization tradeoff. Its current stable/non-generic and volatile/monomorphized two-CGU-per-source-module heuristic is a strong direct subtractor, not a fatal collision. The proposal is retained for one revision because its current “history-aware weighted graph partition” description can still collapse to generic partitioning or a cache controller. The revision must name a Rust-specific sufficient state, legal action divergence, and a guarantee that survives current rustc/Cargo modes.

## Structural potential vs readiness

- Structural potential if successful: Q2 viable. A legal whole-CGU item-placement algorithm with a predecessor-only cohort law, bounded guarantee, and full incremental/build-quality ledger would form a compiler-tool paper.
- Current readiness: finite static closure is possible using official source docs, checksum-pinned crate releases, lockfiles and stock compilation; no corpus or result has yet been obtained.
- Non-fatal gaps: no fork, build, historical corpus download, theorem, or speedup was required at Stage 0.

## Frozen object and action

Fixed adjacent versions of the same crate, dependency lockfile, features, target, rustc pin and Cargo profile produce the same semantic program and ABI. `collect_and_partition_mono_items` receives the current mono-item graph and emits each item exactly once into a deterministic named CGU with existing linkage, target checks and distinct-symbol predicates retained.

The action is the **whole item-to-CGU membership partition**, constrained by a frozen count/size/inline-overlap contract, using only predecessor-window source/checksum/lockfile information and the current graph. It does not alter `codegen-units`, Cargo cache policy, LTO, profile, PGO information, runtime inputs, source, ABI or codegen backend.

## Current upstream reality check

Official current rustdocs establish the native action boundary:

- Stable rustdocs identify `collect_and_partition_mono_items` in `rustc_monomorphize` 1.97.1 (`8bab26f4`, 2026-07-14); its partitioning module states that CGUs are named sets of `(mono-item, linkage)` pairs.
- Current nightly docs (1.99.0, `09ee43b2`, 2026-07-27) expose the same module and functions including `partition`, `place_mono_items`, `merge_codegen_units`, name computation and symbol checks.
- The Rust compiler development guide says current incremental partitioning creates two CGUs per source module: stable non-generic code and volatile monomorphized/specialized code. It also documents cross-crate generic placement behavior.
- `-C codegen-units` controls maximum CGUs (official default 16 nonincremental, 256 incremental); `-C incremental`, LTO and Cargo profile/environment overrides are all legal baseline choices. LTO changes the code-quality/full-cost boundary and cannot be silently switched.

This confirms a complete native constructor and invalidates any “rustc only has a scalar knob” claim. It does **not** establish that rustc has a predecessor-history objective. `SEARCH_BOUNDED_OPEN` remains a collision classification, not a novelty proof.

## Fair current union

1. Pinned rustc collection/target-specific checks/current `partition`/`place_mono_items`/merge/name/symbol logic.
2. Current stable/volatile module split and cross-crate generic placement.
3. Same-information finite `codegen-units`, incremental, LTO and optimization/profile grid from rustc/Cargo; include documented profile environment overrides.
4. Same-program clean and adjacent incremental builds, stock linker/backend, tests and symbol/ABI oracle.
5. Generic weighted partitioning/ILP only as an offline ceiling.

Full cost must charge partition analysis, all compilation/rebuild phases, CPU/wall/RSS, incremental/cache/temp disk, artifacts, link time, cold start and representative runtime. A changed LTO/profile setting is a baseline branch, not a candidate gain.

## Collision and paper-kernel audit

| Facet | Current strongest evidence | Disposition |
|---|---|---|
| exact whole-partition object | official rustc partition module | closed |
| current native heuristic | stable/volatile per source module | direct subtractor |
| scalar/config tradeoffs | rustc/Cargo CGU/incremental/LTO/profile | mandatory union |
| history-conditioned item membership | no direct current action found | open |
| target-specific guarantee | none supplied in brief | revision required |
| natural law | checksum-pinned adjacent crates is finite route, no result | Stage A evidence, non-fatal |
| direct paper collision | bounded search found no eight-predicate cover | `SEARCH_BOUNDED_OPEN` |

The strongest alternative is that current stable/volatile partitioning plus the legal configuration grid already accounts for all practical benefit. A second alternative is that version history only improves a generic cache-placement model. Both are falsifiers, not reasons to claim novelty today.

## Single revision gate

`RUSTC_NATIVE_ITEM_TO_CGU_ACTION__NON_GENERIC_PREDECESSOR_COHORT_PARTITION_CERTIFICATE`

The gate is one proposition: on one pinned rustc/Cargo/target/profile contract and one checksum-pinned adjacent crate chain, define two legal item-to-CGU partitions of the **same current mono-item graph** that differ under predecessor-only cohort information; prove all current item/linkage/name/symbol and deterministic-output predicates; specify a finite Rust-specific state (item placement, linkage/visibility, inline-overlap, CGU capacity and invalidation cohort) sufficient for future legal placement/full cost; and give exact bounded-subproblem, FPT, or certified approximation behavior which is not generic graph partitioning.

The minimal witness must contain a current generic `g<A>` and `g<B>` with equal current legality but distinct predecessor cohort relation, then map both candidate and complete current union actions. It fails if the split is merely an extra CGU count, cache/PGO choice, future-information use, a generic partition solver with Rust labels removed, or a changed symbol/linkage/ABI contract. Terminal sentinel: `BELOW_Q2_STOP__GENERIC_PARTITION_OR_CURRENT_RUSTC_UNION_ABSORPTION`.

## Natural and Stage A route

The later carrier is 20–50 checksum-pinned crates with three adjacent releases, fixed lockfiles, features, target and profile. Before any claim-bearing measurement, Stage A must validate mono-item coverage, linkage, deterministic CGU names, distinct symbols, link/test behavior and the two-item witness. The finite killer stops if the held-out change-cohort law fails a stratum-preserving shuffled baseline, the current union reproduces all actions, legality changes, analysis cost removes full-cost Pareto benefit, or no residual remains after the declared union.

## Q1/Q2 calibration and score

`PARITY_CONDITIONAL`: the target-specific algorithm plus a natural version-history law is Q2-shaped, but neither is closed now. It is not a Q1 recommendation.

- Academic potential: 54/70.
- AI bonus: 23/30; `AI_CORE_CONDITIONAL`, `ai_core_fraction=0.72` for history extraction, partitioner, legality oracle and ledger after authorization.
- Total: 77/100, non-decisive.

## Stop and repair vector

Stop only if the revision establishes current-union absorption, an unavoidable generic-partition/cache reduction, future-information leakage, or an invalid same-object legality contract. Do not stop for lack of a crate download, implementation, observed law, performance result or hardware.

`STAGE0_REPAIR_VECTOR: [OMITTED_CURRENT_SAME_OBJECT, OMITTED_GENERIC_KERNEL, ATOMIC_ACTION_UNCLEAR, FULL_COST_GAP]`; material and decision-preserving.
