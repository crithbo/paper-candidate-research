# Evidence-qualified question cards

## S63-01

- Exact identity: fixed qcow2 node, bitmap, logical disk values, and stock QMP backup/migration result.
- Endpoint and oracle: stock QEMU QMP bitmap/backup/migration semantics.
- Current-source locus: official QEMU 9.2.4 bitmap documentation enumerates bitmap granularity, persistence, and QMP `add`, `remove`, `clear`, `enable`, `disable`, and `merge` actions.
- Full-cost boundary: bitmap build/update/persist/read CPU, metadata bytes, temporary storage, RSS, and endpoint latency.
- Current result: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_OR_GENERIC_METADATA_CONFIGURATION`.  The candidate's unproved layout transition is either expressible by the current action composition or reduces to generic packing; no target-specific N1/N2 survives.

## S63-02

- Exact identity: fixed VM/device state with the same VFIO migration/recovery endpoint.
- Endpoint and oracle: stock QEMU VFIO migration, including the same device-visible recovered state.
- Current-source locus: official QEMU 10.0.3 VFIO documentation exposes capability checking, dirty-log start/stop/synchronization, device/IOMMU tracking modes, and pre-copy tracking control.
- Full-cost boundary: tracking, synchronization, payload, recovery CPU/RSS/bytes/latency.
- Current result: `EXCLUDED_BEFORE_RAW__CURRENT_STATE_MACHINE_CONTROLLER`.  Choosing logging mode or timing lifecycle actions is a native controller/policy and not a union-external complete constructor.

## S63-03

- Exact identity: fixed VM state and stock QMP destination-equivalent migration endpoint.
- Endpoint and oracle: successful stock QEMU migration and recovered VM semantics.
- Current-source locus: official QEMU master migration documentation covers the migration framework and native postcopy, compression, dirty-limit, VFIO, and checkpoint/restart facilities.
- Full-cost boundary: state discovery, stream construction, migration CPU/RSS/temp/cache bytes, transferred bytes, and downtime/end-to-end latency.
- Current result: `EXCLUDED_BEFORE_RAW__CURRENT_FEATURE_CONFIGURATION_UNION`.  The proposed joint stream construction has no frozen non-configuration action witness; it is feature selection/scheduling rather than a target-specific N2.
