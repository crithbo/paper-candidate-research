# Rust history-aware CGU partition — independent confirmation

## Disposition

- Assignment: `STAGE0-C2-20260814-RUST-HISTORY-AWARE-CGU-PARTITION-CONFIRM-V8.7`
- PRIMARY disposition reviewed: `REVISE_ONCE`
- Sole gate: `RUSTC_NATIVE_ITEM_TO_CGU_ACTION__NON_GENERIC_PREDECESSOR_COHORT_PARTITION_CERTIFICATE`
- Independent decision: `CONFIRM_REVISE_ONCE`
- Conditional tier if the gate closes: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Revision/Stage A/Stage B/implementation/build/experiment: not executed or authorized.

The gate remains a finite, same-object static closure task. Current rustc
already has a rich CGU constructor and Cargo has substantial mode/configuration
choices, so an unqualified “history-aware partition” is not enough. But the
reviewed first-party union does not itself express a predecessor-conditioned,
whole-item placement objective or a target-specific frontier guarantee.
Accordingly, absence of an implemented planner or measured history law is not
a STOP reason, while a PASS would be premature.

## Current union reconstructed

The native unit is not a scalar `codegen-units` setting. Current
[rustc partitioning documentation](https://doc.rust-lang.org/stable/nightly-rustc/rustc_monomorphize/partitioning/index.html)
states that a CGU is a named set of `(mono-item, linkage)` pairs. Its current
[partitioning source](https://doc.rust-lang.org/nightly/nightly-rustc/src/rustc_monomorphize/partitioning.rs.html)
places items, merges to the configured CGU cap, accounts for inlined overlap,
internalizes symbols, checks distinct symbols and sorts output CGUs
deterministically. In incremental mode it uses the stable/non-generic versus
volatile/generic split; linkage/visibility and cross-crate generic placement
remain native constraints.

The strong baseline is therefore:

1. pinned rustc mono-item collection, target checks, placement, name cache,
   linkage/visibility, inlining duplication, merge, internalization and symbol
   predicates;
2. stable/volatile and cross-crate-generic behavior under the fixed current
   crate;
3. the same-information rustc/Cargo grid: `codegen-units`, incremental,
   optimization/profile, LTO (including local ThinLTO effects), relevant Cargo
   profile/config/environment overrides, and clean versus adjacent incremental
   build protocols; and
4. the stock backend/link/test/symbol/ABI checks, with generic partition/ILP
   as a ceiling only.

Rust's [codegen options](https://doc.rust-lang.org/rustc/codegen-options/)
and [Cargo profiles](https://doc.rust-lang.org/cargo/reference/profiles.html)
confirm that CGU count and incremental/LTO are legitimate but different
baseline branches: they alter parallelism, caching and code quality. They may
not be silently repackaged as the candidate action.

## Independent attack results

| Attack | Finding | Disposition |
|---|---|---|
| Same-object adjacent-version contract | The two compared plans must partition the *same current crate/current mono-item graph* and preserve its behavior, ABI, linkage and symbol predicates. Predecessor releases provide information only; adjacent source versions need not be identical programs. | gate clarified |
| Legal whole action | Current rustc supplies a genuine item-to-named-CGU constructor, but no submitted pair of complete legal partitions has yet fixed item coverage, duplicate inlining policy, linkage/visibility, names, merge outcome and symbols. | revision required |
| Current union absorption | The stable/volatile heuristic, current placement/merge and the Cargo/rustc grid are strong subtractors. No inspected first-party source represents predecessor-window cohort membership as an objective that chooses a different complete legal partition. | no direct absorption shown |
| Generic partition/cache collapse | A state containing only graph edges, weights and a cache flag is generic. Rust-specific state must retain current mono-item lineage/DefPath instantiation identity, linkage/visibility, inlined-overlap multiplicity, deterministic CGU-name/merge contract, capacity, current invalidation relation and predecessor-only cohort label. | revision required |
| Future information | A partition may use current graph plus predecessor-window checksums/lockfiles; it must not use successor release diffs, future invalidation, measured future build time or profile feedback as the action input. | hard constraint |
| Guarantee/full cost | The target-specific state must preserve every legal future placement, link/symbol predicate and declared costs, yielding only a bounded exact/FPT/certified frontier. Planner CPU/RSS, all build/rebuild phases, incremental disk/temp, artifacts/link, cold start and runtime stay in the ledger. | revision required |

## Confirmed single revision gate

The PRIMARY atomic gate is confirmed without creating a second mechanism. Its
certificate must now make the following boundary explicit:

1. pin rustc, Cargo, target, profile, features, lockfile and exact current
   crate revision; use a checksum-pinned predecessor window only as available
   information;
2. give two complete partitions of that one current mono-item graph, where
   every root/inlined item, linkage/visibility assignment, CGU name, size-cap
   merge and distinct-symbol condition is stock-native and the final current
   program/ABI is the same;
3. map both partitions against the entire union above, removing points
   reproduced by any compatible current mode rather than comparing only to a
   default setting;
4. prove a finite Rust-specific state preserves all future native
   actions/legality and declared full cost, with an honest bounded
   exact/FPT/certified frontier—not a generic weighted graph solver bearing
   Rust labels; and
5. freeze the finite Stage A preclaim oracle and falsifier: item/linkage/name/
   symbol checks, whole union enumeration, stratum-preserving shuffled
   predecessor control, natural release carrier and complete cost ledger.

The single gate fails scientifically if the cohort state reduces to generic
partition/cache scheduling, requires future information, changes item/linkage/
symbol/ABI semantics, or the current union covers every full-cost point. Its
registered terminal result is
`BELOW_Q2_STOP__GENERIC_PARTITION_OR_CURRENT_RUSTC_UNION_ABSORPTION`.

## Boundary

No implementation, corpus download, build, output, observed history law or
positive performance result was required or performed. Latest direct collision
remains `SEARCH_BOUNDED_OPEN`; unavailable retrieval is not treated as absence.
After mainline acceptance the lane returns to
`IDLE_REUSABLE_AWAITING_MAINLINE`.
