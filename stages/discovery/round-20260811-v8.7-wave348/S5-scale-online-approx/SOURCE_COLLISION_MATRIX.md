# Witness-first admission matrix

| Deployed family | Current action/semantics | Natural trace + union-external two-action witness | Admission |
| --- | --- | --- | --- |
| CockroachDB range relocate/lease | explicit replica/lease relocation; Raft/leaseholder consistency | no official versioned trace; placement/lease choice is control | `NOT_ADMITTED_UNFROZEN` |
| Yugabyte tablet redistribution | transparent tablet movement/splitting | no fixed public migration trace; placement path is native balancing | `NOT_ADMITTED_UNFROZEN` |
| Consul server upgrade/replacement | native voter promotion/demotion, leader transfer, snapshot state | official tutorial is not a reusable versioned natural trace; Autopilot is controller | `DROP__CONTROLLER` |
| NATS/Kubernetes | deployed orchestration/move surface | no fixed same-object trace/witness frozen | `NOT_ADMITTED_UNFROZEN` |
| OpenSearch / Redis | native migration exists | duplicate Wave330 | excluded |

No absent-interface claim is made. Planned/future work, thresholds, generic migration and controllers are not gap evidence.
