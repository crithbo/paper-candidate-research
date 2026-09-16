# UNIQUE_OPPORTUNITY_FAMILIES

| Family | Fixed semantic object / native commit contract | Strongest current union | Natural carrier / oracle | Status |
|---|---|---|---|---|
| U01 Redis AOF | Fixed Redis command stream and recovery-visible key/value state at an AOF persistence contract. | append/fsync modes, multi-part AOF manifest, background rewrite, incremental AOF, manifest switch/recovery. | Redis regression AOF cases; `redis-check-aof`, restart/replay, AOF manifest. | Deep → drop |
| U02 containerd content | Fixed OCI content bytes/digest and content-store visibility/lease semantics. | Writer create/write/status/commit/abort, digest verification, labels, leases and garbage collection. | containerd content tests; digest equality/content API oracle. | Deep → drop |
| U03 OCI Distribution upload | Fixed blob bytes/digest and registry blob-visibility semantics. | POST upload, PATCH chunks, GET status/range, PUT digest finalization, DELETE cancellation. | Distribution conformance suite; digest and manifest pull oracle. | Deep → drop |
| U04 MySQL binlog | Fixed committed SQL transaction and binlog/replica visibility. | current binlog flush/sync/order options. | MySQL MTR and binlog inspection. | Unfrozen |
| U05 LMDB | Fixed key/value relation and reader transaction snapshot. | dual meta pages, copy-on-write B-tree commit. | LMDB test corpus + checker. | Unfrozen |
| U06 QEMU migration | Fixed guest state/network continuity. | migration runstate/pre/post-copy transitions. | QEMU migration tests / guest checksum. | Unfrozen |
| U07 OverlayFS | Fixed VFS namespace/data/durability contract. | copy-up/metacopy/upper fs behavior and mount options. | xfstests. | Unfrozen |
| U08 journald | Fixed journal record sequence/seal verification. | append, rotation, sealing/vacuum controls. | journalctl verification. | Unfrozen |
| U09 Wasmtime | Fixed Wasm instance observable behavior and resource ownership. | store/resource lifecycle APIs. | upstream API tests. | Unfrozen |
| U10 JetStream | Fixed stream/consumer delivery/ack state. | ack, snapshot, replay and retention settings. | JetStream integration suite. | Unfrozen |
