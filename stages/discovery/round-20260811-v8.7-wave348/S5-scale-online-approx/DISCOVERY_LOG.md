# Discovery log — deployed online-recourse witness breadth

**Assignment:** `DISCOVERY-S5-20260811-V8.7-WAVE348-FRESH-DEPLOYED-ONLINE-RECOURSE-WITNESS-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen controls verified: AGENTS `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; plan `2FE77A9DABCA2B7262C6A4729912F862D0F48D8EE70D9D6CBD354BEF53AF399C`; registry `E6C86737025B11782A094D0133194DDFDB0C81E06787CFE50223A748E569AD9E`; ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

The witness-first screen considered nine deployed-state families: CockroachDB `ALTER RANGE RELOCATE`; CockroachDB range snapshots/lease transfers; Yugabyte tablet redistribution/splitting; Consul Autopilot upgrade; Consul dead-server replacement; NATS JetStream stream move; Kubernetes volume relocation; OpenSearch relocation; and Redis atomic slot migration. OpenSearch and Redis duplicate Wave330 and are excluded. The [CockroachDB relocation command](https://www.cockroachlabs.com/docs/stable/alter-range), [replication layer](https://www.cockroachlabs.com/docs/v26.2/architecture/replication-layer), [Yugabyte distribution](https://docs.yugabyte.com/stable/explore/linear-scalability/data-distribution/), and [Consul Autopilot](https://developer.hashicorp.com/consul/docs/manage/scale/autopilot) show deployed atomic/consistent actions, but each apparent residual is placement, lease/leader choice, promotion timing or rebalancing policy—already native control, not a union-external constructor.

No candidate had both a fixed versioned public natural migration trace and a two-action invariant witness outside the complete current union. Public documentation examples, dashboards, command outputs and operator tutorials do not establish such a trace. This is an admission failure, not a scientific conclusion about missing implementation/results/resources. `PROPOSE_STAGE0: []`.

Full-cost contract required for any future admission: source/destination state bytes, log/snapshot transfer, duplicate residency, CPU/RSS/temp, network/I/O, client availability/tail latency, reader/recovery and rollback. Finite 72h killer: pin source/config and an official versioned trace, execute no new algorithm yet, then fail closed if the native action reproduces the two-output witness, semantics differ, or no charged Pareto residual exists. No experiment, benchmark, Stage0/A/B, shared write or E-drive reference occurred. `IDLE_REUSABLE_AWAITING_MAINLINE`.
