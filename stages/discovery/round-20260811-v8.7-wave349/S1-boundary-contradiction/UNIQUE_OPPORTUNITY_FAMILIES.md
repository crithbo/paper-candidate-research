# Unique opportunity families

The screen produced ten nonduplicate families. The closest native two-action records were etcd and Kafka:

| Family | Same-object state and two-action observation | Why it fails the required promotion certificate |
|---|---|---|
| etcd Raft | For one replicated command, a committed log entry and its application to the state machine are distinct legal transitions; restart replays persisted consensus state. | A complete current union over raft, persistence, snapshots, apply loops, recovery and configuration was not pinned. A candidate grouping rule would otherwise be an online controller. |
| Kafka transactions | For one transactional record sequence, a consumer can observe ordinary records under `read_uncommitted`, while `read_committed` stops at the last stable offset until commit/abort markers resolve it. | The grouping boundary is defined by the existing transaction protocol and coordinator; changing it is a semantics/policy change, not an N2. |
| Remaining eight | Each has a state or validation boundary. | At least one mandatory element—native replay, a legal two-action witness, fixed same-object guarantee, or non-controller target-specific algorithm—was absent or not source-closed. |

Therefore no candidate-grade deep review was authorized.
