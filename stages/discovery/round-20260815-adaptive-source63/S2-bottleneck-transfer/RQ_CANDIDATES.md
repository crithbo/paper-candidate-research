# Same-object research-question candidates

## RQ-S63-01 — dirty bitmap transition

For a fixed qcow2 node, logical disk contents, dirty region set, and stock QMP backup/migration semantics, could a target-specific bitmap-layout/transition constructor improve build, update, persistence, and read full cost without changing the reader or backup endpoint?

The minimum falsifier is that QEMU already exposes the needed operation as a composition of bitmap granularity and QMP add/remove/clear/enable/disable/merge operations, leaving only generic metadata packing or configuration.

## RQ-S63-02 — VFIO dirty-log state

For a fixed VM/device, device-visible state, and stock migration/recovery semantics, could a non-controller joint dirty-log/state constructor reduce tracking and synchronization full cost while preserving the same migration endpoint?

The minimum falsifier is that native lifecycle actions already include dirty logging start/stop/synchronization and method choice; then a purported contribution is a policy/controller, not a new complete action.

## RQ-S63-03 — live-migration stream state

For a fixed VM state and destination endpoint, could a target-specific joint dirty-stream/state construction algorithm improve full migration cost beyond QEMU's native migration feature union without scheduling or configuring the stream?

The minimum falsifier is that the purported action is a feature/configuration selection over native migration, compression, postcopy, dirty-limit, or checkpoint controls.
