# Current-source collision matrix

| Family | Current-upstream reality / flags | Decisive subtractor | Decision |
|---|---|---|---|
| PostgreSQL WAL | Checkpoint determines redo start; `fsync`, full-page writes, recovery prefetch/decode buffer and recovery targets are documented current controls. | Native redo/full-page/checkpoint union; residual is tuning or changed recovery guarantee. | `DROP` |
| Kafka transactions | Transactional ID, producer transactions, atomic output+offset update, transaction state log and abort-on-restart are documented current semantics. | Current EOS state machine. | `DROP` |
| BookKeeper ledger | Fencing/quorum/readable-prefix recovery form the native recovery action union. | Current fencing and quorum recovery. | `DROP` |
| FoundationDB | Recovery is a distributed state-machine contract, not a separately frozen replay action. | Any new coordinator action changes information or is controller. | `STRUCTURAL_DROP` |
| Badger / bbolt | Current file/page rewrite and recovery logic preserve current storage semantics. | Local GC/rebuild policy absent a new guarantee/action. | `STRUCTURAL_DROP` |
| JetStream / Pulsar | Native transactional/ack coordinator states define delivery visibility after restart. | Retry/scheduling is a controller or changes exactly-once semantics. | `STRUCTURAL_DROP` |

No absence claim survived; therefore no unfrozen interface was promoted and no `NOT_ADMITTED_UNFROZEN` record is needed.
