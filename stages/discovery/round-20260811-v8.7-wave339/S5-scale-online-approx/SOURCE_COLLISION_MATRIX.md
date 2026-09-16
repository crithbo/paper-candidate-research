# Ceph/Vitess closure and collision matrix

| Object | Current-source reality | Exact same-object oracle | Candidate complete action | Closure outcome |
| --- | --- | --- | --- | --- |
| Ceph pool migration | official document is development/planned, not proof of current union or absence; current main inspected but action/config graph not closed | fixed RADOS objects, old-pool redirect, stock client reads/writes, crash recovery and availability | bounded hash-interval migration with atomic watermark/redirect state and recourse bound | `NOT_ADMITTED_UNFROZEN` |
| Vitess reshard | archived workflow exists; current docs/source/commit/config map and versioned trace not frozen | fixed SQL rows, vindex/routing, VReplication/GTID, stock client cutover/recovery | bounded VReplication-state/key transfer with traffic semantics and availability/recourse bound | `NOT_ADMITTED_UNFROZEN` |

Both candidates have full-cost ledgers and finite killers in the discovery log. Neither a scheduling threshold nor a generic migration wrapper is considered an action gap.
