# Source / facet collision matrix

| Lead | Current source / contract facets checked | Two candidate mechanisms | Fair-union conclusion | Final disposition |
|---|---|---|---|---|
| FUSE-over-io_uring | Register entries; per-CPU queues; `COMMIT_AND_FETCH`; entry recycling; unsupported notifications/interrupts handled by `/dev/fuse`. | pending-request assignment; completion/fetch ordering | User space owns no pending-request selection action; fallback is wrapper. | `DROP_NO_LEGAL_ALGORITHMIC_ACTION` |
| io_uring DBMS | `SINGLE_ISSUER`, `COOP_TASKRUN`, `DEFER_TASKRUN`, `SQPOLL`, registered ring/buffer actions, constraints; published DBMS buffer-manager/shuffle cases. | registered-buffer group allocation; task-run/batch decision | Same information and pin budget; allocation is a standard online policy and other mechanism is configuration. | `DROP_FAIR_UNION_REPLAY_OR_CONFIGURATION_ONLY` |
| Component Canonical ABI | `lift`, `lower`, memory, `realloc`, optional `post-return`, async resource/cancellation contracts. | lifetime co-planning; shared-memory ABI linking | Lifetime plan is runtime policy; shared-memory ABI changes frozen component boundary. | `DROP_M1_RUNTIME_POLICY_ONLY__M2_CHANGED_OBJECT` |

All citations are original/upstream and listed in `DISCOVERY_LOG.md`. No current-absence assertion occurs in this review.
