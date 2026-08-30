# Source70 RQ candidate

## RQ-S70-01

- Seed: S70-01
- Exact public anchor: Bazel Skyframe reference, official documentation, accessed 2026-08-15.
- Tentative object: Bazel Skyframe evaluation of a fixed Java-producing target after a single source/class edit.
- Immutable guarantee: emitted artifact is bit-for-bit the same as the clean build and remains accepted by the stock reader/toolchain.
- Primary RQ: Can Bazel construct the same exact Java archive after a one-class update with a target-native bounded-recourse action, rather than rebuilding the archive node?
- In scope: current Skyframe incremental evaluation and the archive artifact produced by one fixed target.
- Out of scope: remote-cache TTL, action scheduling, cache configuration, a changed archive format, or generic ZIP tooling.
- Counterfactual consequence: if non-generic, a result could reduce rebuild/write cost without weakening Bazel reproducibility.
- Earliest falsifier: the remaining action is merely generic archive repacking or changes the fixed artifact/reader contract.
- Precommitted ANCHOR/CURRENT/CONTRARY route: one official Skyframe reference, with repository source as transport fallback.
- Selective depth: OFF; ordinary closure only.

## Pre-evidence scope

The reference says Skyframe uses bottom-up invalidation and change pruning, and its discussion of incrementally changing a class in a JAR is explicitly a theoretical example. That text is a contrary/source-context handle, not evidence of an unimplemented residual or a future-work grant.
