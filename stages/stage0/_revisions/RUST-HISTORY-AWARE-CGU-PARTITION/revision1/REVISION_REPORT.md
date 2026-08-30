# RUST-HISTORY-AWARE-CGU-PARTITION — Stage 0 revision1 disposition

## Disposition

- Assignment: `STAGE0-P1-20260814-RUST-HISTORY-AWARE-CGU-PARTITION-REVISION1-V8.7`
- Sole gate: `RUSTC_NATIVE_ITEM_TO_CGU_ACTION__NON_GENERIC_PREDECESSOR_COHORT_PARTITION_CERTIFICATE`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Scientific revision: **not consumed** (`0/1`)
- Scientific STOP: **not issued**
- Stage A / Stage B: not authorized
- Lane disposition: `IDLE_REUSABLE_AWAITING_MAINLINE`

This is a bounded input-fidelity blocker, not negative evidence about the
mechanism.  The frozen inputs establish the native Rust action space and a
finite way to obtain an actual carrier, but contain no pinned current crate,
current mono-item graph, root/inlined-item closure, or native legality ledger.
The assignment forbids downloading, building, or otherwise generating those
artifacts.  Therefore a claimed pair of complete same-current-graph partitions
would be invented rather than reviewed.

## Why the gate cannot truthfully be executed from the frozen inputs

The revision's required proposition has a material object-level antecedent:
one current crate and its current mono-item graph.  Neither the PRIMARY nor
confirmation packet binds one.  Their proposed `g<A>, g<B>` is expressly a
minimal *pattern*, not an emitted graph or a crate identity.  It does not give:

1. a current crate source/checksum, lockfile, features, target, Cargo profile
   and rustc pin;
2. the complete root and inlined `MonoItem` universe, usage/inlining closure,
   linkage/visibility, size estimates, and target-specific predicates; or
3. the resulting deterministic name/merge/internalization/distinct-symbol
   ledger under current rustc.

Rust's current partitioning source makes those data semantically relevant.  A
CGU is a named set of `(mono-item, linkage)` pairs; the current path places
roots, derives reachable inlined copies, assigns linkage and visibility, merges
by size/overlap, internalizes symbols, and orders CGUs deterministically.
Thus an abstract two-vertex graph cannot witness a complete legal Rust
partition.

## Current-union result retained for resumption

The current-source reality check is *not* an absence claim:

- `partitioning.rs` documents the native object and current stable/volatile
  placement heuristic, as well as root/inlined handling and deterministic
  merge/name behavior.
- rustc/Cargo `codegen-units`, incremental, LTO and profile/config branches
  remain mandatory same-information comparators; they cannot be re-labelled as
  the candidate.
- No inspected first-party source gives a direct eight-facet collision with a
  predecessor-conditioned whole item-to-CGU objective plus Rust-specific
  frontier guarantee.  Status remains `SEARCH_BOUNDED_OPEN`, not an absence
  proof.

These findings neither close nor refute the proposed N2.  The gate may still
be scientific if a resumed packet supplies a real current graph and demonstrates
an action beyond the full current union.

## Required minimal unblock package

Provide the following small, immutable **text/metadata package**; no broad
corpus or candidate implementation is requested:

1. One current public crate identity: source archive SHA-256, exact version,
   `Cargo.lock` SHA-256, enabled features, target, Cargo profile and rustc
   40-hex commit/release pin.
2. A current-graph extraction ledger produced in an approved environment:
   complete roots, reachable inlined copies, `MonoItem`/DefPath identity,
   instantiation mode, linkage/visibility, size estimate, usage edges,
   deterministic native CGU names, merge result, internalization and
   distinct-symbol outcome.  It must be tied to the single current crate only.
3. One or more predecessor release checksums/lockfile hashes.  They may provide
   cohort labels only; no successor source, measured future invalidation,
   build-time result or profile feedback may enter the candidate action.
4. A current rustc source/blob 40-hex pin for the relevant partitioning code.

With this package, resume the same gate in a fresh resume subdirectory.  The
review must then either (a) name two complete legal partitions of that graph,
state a Rust-specific future-action/full-cost preserving frontier and bounded
guarantee, or (b) issue the pre-registered scientific sentinel if the result
reduces to generic partition/cache scheduling or is absorbed by the current
union.

## Claim ceiling

No implementation, empirical result, natural law, speedup, or theorem is
claimed.  More importantly, this review does not claim that a same-object
action-divergence witness exists.  It only records why the current frozen
inputs are insufficient to construct or falsify one without violating the
assignment's no-download/no-build boundary.

## Sources

- [Current rustc partitioning source](https://doc.rust-lang.org/nightly/nightly-rustc/src/rustc_monomorphize/partitioning.rs.html)
- [Rust compiler development guide: monomorphization](https://rustc-dev-guide.rust-lang.org/backend/monomorph.html)
- [rustc codegen options](https://doc.rust-lang.org/rustc/codegen-options/index.html)
- [Cargo profiles](https://doc.rust-lang.org/cargo/reference/profiles.html)
