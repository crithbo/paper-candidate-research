# Candidate-grade deep reviews

## CD-90-01 — Nix version-cohort closure sharing

- Exact object/function: a fixed Nix store closure; all reachable paths and NAR serialisations must remain valid.
- N3 premise and action: version cohorts repeat byte-identical/NAR-identical files; build full equivalence classes and share their physical representation.
- Current union/direct subtractor: current `nix-store --optimise` / `nix store optimise` already scans identical files and hard-links them via a content-addressed index.
- Natural route/full cost: public Nixpkgs closure; storage saved, index/scan time, hard-link eligibility and path semantics.
- Minimal action-divergence witness: none—every named legal action is equality-based native sharing. A StageA killer would immediately reject any constructor not exceeding this union under the same NAR criterion; it is not run.
- Structural-paper potential: `BELOW_Q2_STOP` for this exact residual because it is directly absorbed, not because an implementation/result is absent.

## CD-90-02 — Cargo version/feature cohort constructor

- Exact object/function: solve a fixed public workspace's Cargo manifest constraints, preserving target, feature and dependency semantics.
- N2 premise/action: use persistent version/feature cohorts to select the whole valid resolution graph.
- Current union/direct subtractor: Cargo's current resolver and feature-unification modes, lockfile output and complete resolve/build accounting.
- Natural route/full cost: public Cargo workspace plus its manifest/lockfile; legality is `cargo`'s resolver/build semantics. A finite killer would compare a fully constructed resolution against the same constraints and union, charging resolution/build/cache time; not run.
- Minimal action-divergence witness: none—version/feature graph selection is the native resolver action. Any apparent gain from choosing a resolver flag would be tuning, not a new residual.
- Structural-paper potential: `BELOW_Q2_STOP` for this exact residual by direct absorption.

## CD-90-03 — Debian version-history delta constructor

- Exact object/function: a signed target Debian `Packages` index and its valid repository access semantics, reconstructed from a fixed history.
- Candidate N2: construct a bounded multi-version patch family/order that minimizes aggregate cohort reconstruction cost while preserving byte-identical target and signed release checks.
- Natural route: official Debian repository histories / `Packages` indices, with `Acquire-By-Hash` and history metadata.
- Fidelity closure plan: freeze a publisher implementation/tag, all direct/one-by-one patch configurations and one signed index-history corpus; verify byte identity, hashes/signature path and complete bytes/CPU/storage denominator. Finite only after those artifacts are selected.
- Minimal action-divergence witness / StageA killer: name a legal patch-set constructor not replayable by the frozen publisher union; otherwise reject before performance testing. No claim that current publisher lacks an action is made.
- Status: `NOT_ADMITTED_UNFROZEN`, not a scientific DROP and not a proposal. Its Tier/readiness are intentionally not scored before same-object publication semantics close.

## CD-90-04 — OCI version-cohort layer constructor

- Exact object/function: a fixed OCI image including ordered layer changesets, config, manifest and required digest/verification semantics.
- Candidate N2 premise/action: exploit repeated base-version layer cohorts to select a cross-release layer layout or sharing representation.
- Direct subtractor: OCI content-addressed layer descriptors and containerd's shared content store/GC-reference union.
- Action-divergence witness: absent. Preserving the exact manifest/config and ordered `diff_ids` yields current digest-level deduplication; changing the arrangement changes the identified OCI image or its specified representation.
- Natural route/full cost: public registry release histories, blob bytes, manifest/config hashes, pull/store/GC cost. A hypothetical StageA killer would reject on changed digest/identity or no incremental saving after current content-store sharing; not run.
- Structural-paper potential: `BELOW_Q2_STOP` for the exact same-object residual.
