# Source and collision matrix

| Family | Official/current source inspected | Direct-collision and union finding | Result |
|---|---|---|---|
| etcd Raft | etcd upstream release/source and `etcdctl` transaction documentation | Current union and primary same-object collision not closed sufficiently for absence/newness claim | `NOT_ADMITTED_UNFROZEN` |
| Kafka transactions | Apache Kafka trunk `KafkaConsumer` source and project source tree | `read_committed`, LSO, and commit/abort-marker semantics already specify the apparent publication rule | `STRUCTURAL_DROP` |
| Linux livepatch | Linux upstream documentation (`/proc/<pid>/patch_state`) and source route | No frozen stock crash/replay oracle for the requested object | `NOT_ADMITTED_UNFROZEN` |
| HotSpot | OpenJDK current class/serialization source route | No fixed replayable grouping witness closed | `NOT_ADMITTED_UNFROZEN` |
| WebAssembly component, QUIC/TLS, eBPF, systemd, LLVM linking, IMA | Official/upstream specification or source routes | One or more mandatory certificate elements absent; no novelty claim made | `STRUCTURAL_DROP`, `EXCLUDED`, or `NOT_ADMITTED_UNFROZEN` as logged |

No issue, future-work statement, old document, or non-availability observation was used as evidence of current absence.
