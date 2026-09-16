# RAW_SCREEN_ROW_EVENT

| ID | New family / official source | Initial same-object witness | Result |
|---|---|---|---|
| R01 | Apache ZooKeeper sessions/recovery ([docs](https://zookeeper.apache.org/doc/current/zookeeperProgrammers.html)) | No complete action beyond native session/epoch recovery. | `NOT_ADMITTED_UNFROZEN` |
| R02 | Apache Pulsar transactions ([docs](https://pulsar.apache.org/docs/next/transactions/)) | Candidate is producer/consumer retry coordination, not atomic action. | `NOT_ADMITTED_UNFROZEN` |
| R03 | CockroachDB retry protocol ([docs](https://www.cockroachlabs.com/docs/stable/transaction-retry-error-reference)) | Candidate is client retry under native serializability. | `NOT_ADMITTED_UNFROZEN` |
| R04 | Temporal workflow retry/side effect ([docs](https://docs.temporal.io/encyclopedia/retry-policies)) | No non-controller bridge frozen. | `NOT_ADMITTED_UNFROZEN` |
| R05 | Kubernetes API resourceVersion/status ([docs](https://kubernetes.io/docs/reference/using-api/api-concepts/)) | Controller reconciliation is excluded. | `NOT_ADMITTED_UNFROZEN` |
| R06 | Linux systemd service restart state ([docs](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html)) | Restart policy does not specify complete same-object atomic action. | `NOT_ADMITTED_UNFROZEN` |
