# SOURCE_COLLISION_MATRIX

| Family | Current official semantic surface | Admission result |
|---|---|---|
| ZooKeeper | [Programmer guide](https://zookeeper.apache.org/doc/current/zookeeperProgrammers.html) | Native session/epoch recovery; no witness. |
| Pulsar | [Transactions](https://pulsar.apache.org/docs/next/transactions/) | Native transaction plus retry bridge; no witness. |
| CockroachDB | [Retry reference](https://www.cockroachlabs.com/docs/stable/transaction-retry-error-reference) | Native retry/serializability; no witness. |
| Temporal | [Retry policy](https://docs.temporal.io/encyclopedia/retry-policies) | Retry/controller only. |
| Kubernetes | [API concepts](https://kubernetes.io/docs/reference/using-api/api-concepts/) | Reconciliation/controller only. |
| systemd | [Service manual](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html) | Restart policy only. |

No current-absence claim, old issue, or future-work statement is used.
