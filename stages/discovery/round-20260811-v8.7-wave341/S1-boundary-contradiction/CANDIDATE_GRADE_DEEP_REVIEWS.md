# Candidate-grade deep reviews

## D01 — ext4 Fast Commit / JBD2 fallback

**Decision: `DROP` (current-union/direct-absorption).** The exact object is one ext4 state and VFS trace under the ext4 crash-recovery contract. Current upstream `fs/ext4/fast_commit.c`, ext4 documentation, and the FastCommit ATC'24 primary paper establish a hybrid design: simple, frequent modifications use Fast Commit, while complex or unsupported cases retain JBD2. Thus the only visible two-action rule—choose the fast logical path or the full journal path—is already the stock recovery-aware constructor. A proposed selector would be a controller; a changed log/replay format would need a different recovery object. The direct paper collision is FastCommit (USENIX ATC 2024), which describes the merged mechanism.

The finite killer is static and executable in Stage A: use one eligible and one ineligible xfstests trace with identical crash-cut protocol; if the alleged action is Fast Commit/JBD2 selection or cannot retain ext4 recovery semantics through mount/fsck/readback, stop. No brief is warranted.

## D02 — OpenZFS ZIL / transaction-group recovery

**Decision: `NOT_ADMITTED_UNFROZEN`.** The action witness is native and same-object: a sync write receives a ZIL intent-log recovery path whereas main-tree propagation is transaction-group based. Official OpenZFS source and workload documentation identify these paths, and import/replay is a natural oracle. However, this pass did not close a pinned complete union over ZIL logging, TXG synchronization, dataset properties, cache/flush modes, replay/fallback paths, and all default/non-default knobs; nor did it close a primary same-object direct-collision search. A proposal would therefore risk mislabelling a stock policy/configuration as an N2. This is not a resource or readiness conclusion.

Finite closure/killer: enumerate the named source entry points and dataset properties, then use a fixed sync-write/crash/import trace. If every legal candidate reduces to stock ZIL/TXG selection or alters the recovery guarantee, kill; otherwise freeze the new target-specific invariant before admission.

## D03 — ZooKeeper snapshot / transaction-log replay

**Decision: `NOT_ADMITTED_UNFROZEN`.** ZooKeeper documentation supports the stock recovery shape—load a snapshot and replay ordered transactions—and supplies a natural server restart oracle. Yet the complete current source/configuration union for snapshot creation, transaction logging, replay, data-dir layout, and defaults was not sufficiently source-pinned, and no primary direct-collision closure was reached. The two-action witness alone cannot establish a union-external non-controller construction.

Finite closure/killer: pin current persistence source symbols and configuration defaults, then run the static two-history audit on one snapshot/replay sequence. If a candidate is only checkpoint timing, retry, or policy selection, kill; otherwise require a target-specific invariant with identical ordered-state semantics.
