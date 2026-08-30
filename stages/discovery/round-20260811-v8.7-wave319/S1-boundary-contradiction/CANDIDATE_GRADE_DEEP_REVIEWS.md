# CANDIDATE_GRADE_DEEP_REVIEW — D01

## Native two-history witness

Let `T` be a fixed update trace ending in `fsync(f)` and `C` a crash immediately after `fsync` returns.

- **H-log:** the transaction has no `btrfs_need_log_full_commit()` condition. The source documents that changed items are copied to the per-subvolume log tree, the log is written, and the fsync completes; recovery copies log items back to the subvolume tree and records extents. `T; fsync(f); C` must recover the fsynced result.
- **H-full:** keep the same user trace and observable contract, but include the native state predicate requiring full commit (or the documented zoned log-transaction condition). `start_log_trans` returns `BTRFS_LOG_FORCE_COMMIT`; the fsync path must follow the full transaction commit. `transaction.c` makes one caller the commit winner, blocks incompatible entrants at `TRANS_STATE_COMMIT_START/DOING`, and completes only after tree and super blocks are written.

This is a real native state-machine divergence, but it is **not** a same-information choice between two legal complete constructors: the hidden filesystem state predicate determines which branch is permitted. Selecting the log path in H-full violates the source-pinned invariant; selecting a premature full/partial path in H-log changes the required completion/ordering semantics or is already the stock forced-commit action.

## Candidate attempted and red-team result

Attempted N2: `Btrfs Log-Closure Pareto Planner` would choose a minimal set/order of log-tree copies or force a global transaction commit, with a purported guarantee of durable replay equivalence while minimizing logged blocks and latency.

Required Btrfs-specific invariant would be: **every fsync-returned history has a replay-closed set of inode, directory, extent, checksum and root-reference items, and that set does not cross an incompatible transaction/log generation.** Current code already enforces the closure mechanically with transaction ids/key ranges, log-writer synchronization, `btrfs_need_log_full_commit`, forced commit, replay pinning and abort paths. The remaining proposed selection either:

1. merely reorders the current log writers/commit winner (generic transaction scheduling/controller);
2. chooses log where the invariant forces full commit (illegal); or
3. makes a conservative full commit where log is legal (already expressible by the current full-commit branch and supplies no target-specific guarantee).

Consequently no target-specific exact/FPT/Pareto/approximation algorithm remains. A generic closure/set/ordering solver cannot be admitted as N2, and no N3 regularity-plus-utilization mechanism was frozen.

## Current-upstream and direct-collision check

The official current source pins the special tree-log purpose, item-selection mechanism, explicit forced-commit return, zoned/non-zoned branches, log-writer synchronization, replay stages and transaction-state machinery. The primary Btrfs filesystem description identifies tree-log fsync behavior; CrashMonkey/ACE demonstrates that Btrfs crash-consistency behaviors and historical bugs are directly studied, but it does not supply a same-object planner that leaves a residual after the current union. The 2025 cache-layer paper concerns a different storage-stack compatibility contract, not a Btrfs-native fsync constructor.

## Finite Stage A killer (not executed)

On a bounded xfstests-derived corpus containing single-file fsync, rename/link/unlink, directory fsync and concurrent fsync histories, compare each proposed decision against stock trace outcome at one crash cut after return. Kill the preclaim if any proposed log choice reaches a stock force-commit predicate, fails stock mount/checksum/namespace equivalence, or if all remaining choices reduce to stock log/full-commit branches. Record CPU/RSS, block/log writes, flushes, fsync p50/p90 and recovery/check time.

## Decision

`DROP` — current strongest same-object union supplies both branches and the predicate that makes their choice legal. The witness is genuine but does not leave an admissible target-specific N2 action/algorithm residual. This is a structural decision, not a negative inference from missing implementation, result, hardware, resource, or AI readiness.
