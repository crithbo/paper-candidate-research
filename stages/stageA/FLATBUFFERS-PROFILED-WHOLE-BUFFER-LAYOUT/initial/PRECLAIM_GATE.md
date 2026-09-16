# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Decision: `PASS`
- Closed at: `2026-08-11T08:47:00+08:00`
- Claim-bearing observations before closure: `0`
- Scope: execution fidelity only; no scientific PASS/STOP follows from this document.

## Atomic-action mapping — PASS

`NATIVE_ACTION_CATALOG.md` maps each candidate transition to pinned stock public-builder calls and distinguishes optimized plan actions, fixed exact-object facts, current configuration arms, and excluded noncanonical escape hatches. Generated `Pack`/direct helpers remain comparators. The audit explicitly covers vtables, shared strings, aliases, table field permutations, vectors/key order, alignment/current position, ordinary finish/header, presence/ForceDefaults, capacity/allocator/reuse, and verifier limits.

The pinned TFLite schema has four and only four generated force-vector-alignment expansions (`16,4,4,16`). `Offset64` and force-string alignment are absent and frozen non-applicable for the standard `<2^32`-byte TFLite stratum. They are not silently omitted candidate actions.

## Native codec/reader parity — PASS

All gate buffers were emitted by unmodified FlatBuffers `7e163021e59cca4f8e1e35a7c828b5c6b7915953` public C++ builder calls and read by its generated readers plus stock `Verifier`. No proxy codec, byte postprocessor, patched emitter, alternative reader, or external compression participated.

The native two-plan witness reproduced both frozen 56-byte images and exact profile distances `20` and `36`. The tiny suite additionally verified ordinary identifier `FBLT`, generated/direct helper baselines, explicit aliases, string-pool lookup, fixed keyed-vector order and an actual reader-visible 16-byte aligned vector address.

## Comparator semantics — PASS

All registered arms receive the same schema, identity-labelled logical DAG, values/nulls/presence, vectors/key order, profile, ordinary header and reader/verifier. The current union is not a fictitious simultaneous configuration: each fixed `DedupVtables`/`ForceDefaults`/capacity arm is individually realizable, and results will be reported as their union. Generated default, stable topo, hot-first, current config grid, local subtree DP, same-budget generic bounded planner, tiny exhaustive ceiling and FB-RCFDP are separated in `Q1_COMPARATOR_MATRIX.md`.

## Common denominator/full cost — PASS

`EXPERIMENT_CONTRACT.yaml` preregisters raw bytes and measured reader/profile latency plus profile extraction, planning, builder, verifier and reader CPU/wall/RSS/temporary/allocation/fallback costs. The static weighted address distance is only a cache/locality proxy; it cannot substitute for measured allocator or reader runtime. p50 and p90 are both required.

## Small witness and exact oracle — PASS

The native exhaustive suite covered three complementary exact objects:

- vtable history, 64-bit scalar alignment, table field permutations, explicit table alias and current configuration arms;
- direct/shared strings, shared-pool insertion/lookup, explicit string alias and safe shared-history forgetting;
- fixed keyed-vector order, direct/sorted native helpers, current-position effects and generated `force_align:16`.

It enumerated `1,136` config-labelled legal paths and `148` distinct final byte images. Every native equality/verifier/header/alignment check passed. For each case the unpruned reuse-closure DP frontier exactly equalled the exhaustive frontier. It performed `564` candidate state merges in total, including `314` merges between distinct raw terminal prefixes after offsets/vtable/string/profile facts became suffix-dead. Path keys were unique and all declared action variants were reached.

## Gate boundary

The official natural corpus may now be frozen and measured. Any later equality/verifier failure, native-action omission, tiny-oracle regression, direct absorption, `<10%` retained action coverage, singleton/no strict natural quotient compression, or absence of held-out p50/p90 full-cost residual follows the preregistered killer disposition. Resource failure before the first natural claim-bearing observation would remain `BLOCKED_USER_ACTION_REQUIRED`, not a scientific STOP.
