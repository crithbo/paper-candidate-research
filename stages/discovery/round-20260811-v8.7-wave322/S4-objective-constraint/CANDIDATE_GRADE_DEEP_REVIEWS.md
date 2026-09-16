# Candidate-grade deep reviews

No candidate was run. Each natural route is pre-registered for a later permitted Stage A and is not evidence that the stated cliff exists.

## D01 — Cargo resolver tail-risk

- **Same object / oracle:** fixed Cargo version, registry snapshot, workspace manifests, target, and resolver semantics; the stock Cargo resolver and resulting valid `Cargo.lock`/feature graph are the oracle.
- **Current union:** Cargo master `97b3bcefc74ddf1203b21f158129e4b7df33254a`. Official documentation exposes resolver versions, top-level workspace resolver choice, feature unification, `--features`, `--no-default-features`, target selection, locked/frozen operation, and compatibility policy. The fair union includes all applicable default and non-default documented resolver options—not a hand-picked default.
- **Natural carrier / schema:** 20–50 pre-committed public Cargo workspaces with locked registry-index snapshots, selected before observation. Record dependency/feature/target conflict structure, resolution CPU/RSS, index/network-disabled setup cost, lockfile bytes, resolved graph/package duplicates, and downstream duplicated-build work. Match graph size and target while varying conflict/feature structure; repeat with warm local index and fixed resolver version.
- **Candidate mechanism required:** a target-specific joint resolver/feature-partition construction that preserves the exact selected-version and feature semantics plus lockfile validity, and is not a resolver-version/flag selection or generic SAT/ILP wrapper.
- **Collision / 72h killer:** first map the entire attempted action to documented/current resolver paths. Reject if a normalized tail does not repeat across independently selected workspaces, or if the action is expressible by resolver 1/2/3/options/current feature-unification union.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__NATURAL_CARRIER_SNAPSHOT_AND_COMPLETE_SOURCE_ACTION_UNION_NOT_CLOSED`; no action-divergence witness or N2/N3 is claimed.

## D02 — systemd unit-transaction startup tail-risk

- **Same object / oracle:** fixed systemd revision, unit-file set, machine configuration, and unit activation semantics; stock manager transaction building and activation result are the oracle.
- **Current union:** systemd main `9b75d9bc66dc4f64e4fdd33603d199d374c0873b`. Official unit material establishes dependency/order/preset semantics, but this desk review did not close the complete loader, generator, manager, default/non-default manager configuration, and transaction action union.
- **Natural carrier / schema:** 20–50 versioned public system images or unit trees selected and source-hashed before observation. Measure unit/dependency graph shape, transaction-build CPU/RSS, critical-path/tail activation time, journal I/O, failed-unit behavior, and state/cache effects. Match hardware/image, boot state, enabled units, generator output, and I/O cache; repeat cold versus warm start separately.
- **Candidate mechanism required:** a native, semantics-preserving transaction/graph constructor with explicit state/complexity and identical unit order/condition/failure semantics. A unit enablement policy, startup controller, or generic graph layout is not sufficient.
- **Collision / 72h killer:** reject if the required action is already a manager/generator/configuration union member, if output unit semantics change, or if a normalized tail transition does not reproduce across the pre-registered image/unit set.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__CURRENT_MANAGER_UNION_AND_VERSIONED_NATURAL_CARRIER_NOT_CLOSED`.

## D03 — OpenSSL chain-construction verification tail-risk

- **Same object / oracle:** fixed OpenSSL revision, target certificate, untrusted candidates, trust store, verification purpose/flags, and accept/reject/error result. Stock `X509_verify_cert`/`X509_build_chain` provides the oracle.
- **Current union:** OpenSSL master `6d250710fb8cfd5c9a41af373c0c1ca85ff836c2`. Official documentation specifies target, trust store, untrusted stack, verification parameters/callback, untrusted-first versus `X509_V_FLAG_TRUSTED_FIRST`, alternative-chain behavior, and verification CLI options including defaults. The fair union includes those flags/stores/modes; it does not omit `trusted_first` or alternative-chain controls.
- **Natural carrier / schema:** 20–50 public, versioned certificate-chain bundles and trust-store snapshots preselected before measurement. Record certificate/issuer graph branching, key/signature algorithms, trust-store size, chain-build and verify CPU/RSS/tail latency, bytes loaded, and cache/store construction. Hold purpose, security level, hostname, trust-store snapshot, and network/offline retrieval policy fixed; stratify by chain depth/branching and repeat.
- **Candidate mechanism required:** a target-specific issuer-candidate construction/search representation that preserves the identical OpenSSL chain-verdict semantics and all required error behavior, with a stated complexity/guarantee. Changing trust policy, verification flags, or using generic graph search/ILP is not an action gap.
- **Collision / 72h killer:** reject if a stock option/chain-order path reproduces the action, if two candidate paths differ in verdict/error semantics, or if a normalized tail transition does not repeat on the pre-registered certificate sets.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__VERSIONED_NATURAL_BUNDLE_AND_COMPLETE_CURRENT_SOURCE_UNION_NOT_CLOSED`.
