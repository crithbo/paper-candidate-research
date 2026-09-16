# Discovery log — Wave343 verified-pipeline state-coupling breadth

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE343-FRESH-VERIFIED-PIPELINE-STATE-COUPLING-BREADTH.
- Cutoff 2026-08-11; v8.7+R5-P0; QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 8BED71F1078434DD27461F5B85657FA18E44B072F335666332DA2F91FC59E95D; registry 22FE6C6DE76A5D94B8B40B64DA9E74161F8D3305BF9B946132D97AB5405E7662; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Eight screened state-coupling families

| Family | Shared correctness object / stock oracle | Status |
|---|---|---|
| ext4 JBD2 journal and recovery | Fixed filesystem state, committed journal transactions and stock replay/mount result. | Deep; NOT_ADMITTED_UNFROZEN. |
| PostgreSQL WAL and crash recovery | Fixed database state, WAL records/checksums and stock recovery/query result. | Deep; NOT_ADMITTED_UNFROZEN. |
| OpenZFS send/receive and snapshot state | Fixed source/target snapshots, stream semantics and stock receive/scrub result. | Deep; NOT_ADMITTED_UNFROZEN. |
| XFS log and recovery | Fixed filesystem/log/recovered state. | Raw. |
| btrfs send/receive and scrub | Fixed subvolume/snapshot/checksum state. | Raw. |
| etcd Raft log/snapshot restore | Fixed replicated state-machine result. | Raw. |
| Redis AOF/RDB load and rewrite | Fixed key/value state and stock load result. | Raw. |
| Kubernetes etcd backup/restore | Fixed API state and stock restore result. | Raw. |

## Candidate-grade reviews

### ext4 JBD2

Current kernel documentation fixes journal transactions, descriptor/data/revocation/commit records and replay to the last valid commit; checksums and data mode are part of the correctness/guarantee surface. Fast commits already encode minimal state deltas and are replay-idempotent, with traditional full commit fallback. A proposal that selects fast/full commit is an existing policy; a new global reordering risks commit/replay semantics. No source-authorized two-journal witness with an independent target-specific algorithm/guarantee was frozen.

### PostgreSQL WAL

Current PostgreSQL documentation fixes WAL record CRC checks during crash/archive recovery and replication, along with reconstruction of persistent structures. Changing record order, checksum representation, recovery reader or committed database state changes the stock correctness object. Checkpoint/WAL configuration or parallel replay are policy/runtime choices. No union-external action over producer and recovery state was frozen.

### OpenZFS send/receive

OpenZFS defines send as snapshot serialization and receive as reconstruction of a dataset; incremental streams require a shared base snapshot, and stored streams are not equivalent to a checksummed received dataset. Source/target snapshot history, receive behavior and scrub result are semantic constraints. Stream compression, transport wrapper, send flags or target rollback are existing mechanisms/configuration, not a joint constructor. No stock-equivalent two-stream/state witness with target-specific guarantee was frozen.

## Natural route, full cost and killer

Finite public carriers: version-pinned kernel ext4 journal fixtures, PostgreSQL regression/WAL fixtures and OpenZFS snapshot streams, 20–50 bounded traces. Stock oracles: mount/replay/fsck where applicable, PostgreSQL recovery/query, and ZFS receive/scrub/snapshot equality. Charge state construction/logging CPU-RSS-temp-bytes; recovery/replay/receive CPU-RSS; cold/warm access and final persisted bytes.

Within 72 hours fail closed if an action changes committed/recovered state, record order/checksum, reader, snapshot history/stream semantics, or is only fast-commit/checkpoint/send-flag/cache/scheduler selection. A direct collision review is deferred until a legal whole action and guarantee exist.

## Decision

COMPLETE_ZERO_PROPOSALS. Three deep lines are NOT_ADMITTED_UNFROZEN and five remain raw. Missing implementation/results/resources/AI readiness played no role; no terminal STOP or novelty claim is made.
