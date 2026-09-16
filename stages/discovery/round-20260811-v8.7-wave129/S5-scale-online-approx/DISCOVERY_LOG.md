# DISCOVERY-S5-20260811-V8.7-WAVE129-SCALE-BREAKPOINT-CONSTRUCTOR-DEPTH

- Lane/cutoff: `DISCOVERY-S5-SCALE-ONLINE-APPROX`; current first-party cutoff `2026-08-11`.
- Frozen authority: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.
- Method: accepted v2/v8.1, v8.6 fidelity admission and v8.7 upstream reality. No v8.8/R7 shadow/dormant semantic used.
- Scope: three new current scale-breakpoint constructors, excluding Wave120. Each had to name a complete same-object migration/rebuild action before deep review.
- Input SHA-256: `AGENTS.md=66231f71ef6ab250a1ad9ff576d5840978f09efc03bf5d2f0527d47f4d82b063`; `plan.md=027ee47d3fe952ba0bff0bb71a2da1122bbcfbf2bec536d7a22148bf6dbdca36`; `registry.yaml=96249777da1419d0b6964541f069d0613960d5fa869d547c07ec975f3c3bcdbd`; `ROLE_DISCOVERY=fcb9bd73c39f39d31f6c8154e6b48ea23187ff28bdf2bb3d9c59e3d28fa518a3`.

## Funnel

| Unit | Count | Result |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 3 | Three distinct scale-breakpoint constructors. |
| `UNIQUE_OPPORTUNITY_FAMILY` | 3 | Redis Cluster, Elasticsearch, Cassandra. |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 3 | Each passes complete-action naming, then is collision-reviewed. |
| `STAGE0_BRIEF` | 0 | `COMPLETE_ZERO_PROPOSALS`. |

## Scale-breakpoint deep reviews

### Redis Cluster atomic slot migration — `DROP`

- Breakpoint: a large reshard moves many hash slots/keys; the source pauses writes only after snapshot completion and replication lag falls below the handoff threshold, making movement/lag/availability coupled rather than a local metadata update.
- Exact object and complete action: online Redis Cluster hash-slot ownership transfer through source/destination migration tasks, snapshot/import/trimming, ownership handoff and client redirection.
- Information/guarantee/current union: current slot map, task state, replication stream lag and client request path; atomic slot migration, specified key visibility and completion semantics. `CLUSTER MIGRATION`, `CLUSTER SETSLOT` state transitions, `MIGRATE`, resharding, and compatible cluster protocol form the union.
- Full cost/natural carrier/72h killer: slot-key counts, migration bytes, retries, write pause, client latency/`ASK`/`MOVED`/`TRYAGAIN`, old/new ownership and configuration epoch all count. A finite public `redis-benchmark`/key-write stream replay would reject an alleged residual if a slot is not atomically handed off, changes visibility semantics, or omits transfer/pause cost.
- Disposition: candidate-like differences are slot batch size, lag threshold, source/destination choice, or order—all existing task/config/controller choices. No union-external constructor action.

### Elasticsearch shard relocation and peer recovery — `DROP`

- Breakpoint: a large shard relocation creates/recover a target copy before deleting the source, with recovery bandwidth, disk watermarks and allocation/rebalance interacting with global cluster availability.
- Exact object and complete action: current primary/replica shard copy relocation across nodes, recovery state machine and allocation update while retaining search/index availability as documented.
- Information/guarantee/current union: cluster state, shard routing/allocation constraints and recovery source; copy/recovery/primary promotion semantics. `ShardRouting` relocation, allocation/recovery APIs, peer/snapshot recovery and reroute form the union.
- Full cost/natural carrier/72h killer: source/target disk and network bytes, recovery concurrency/bandwidth, duplicate shard life, indexing/search availability, retries and delete-source completion. A finite public Rally-compatible index/update stream with a forced relocation would reject a candidate if it changes shard-copy semantics or loses to the existing recovery action under the same bytes/availability ledger.
- Disposition: `indices.recovery.max_bytes_per_sec`, retry count, disk watermarks, rebalance enablement and manual reroute are all documented configuration/operational controls; no new complete same-object action emerged.

### Cassandra streaming rebuild — `DROP`

- Breakpoint: large-ring bootstrap/rebuild transfers SSTables across nodes; source/DC/range selection and streaming throughput make transfer work, recovery duration and background traffic global rather than local.
- Exact object and complete action: node rebuild/bootstrapping by streaming SSTables from source nodes for token/keyspace ranges, with resumable bootstrap and Netty asynchronous/multithreaded streaming.
- Information/guarantee/current union: token ownership, source DC/nodes/tokens, streaming session and SSTable state; replica-data rebuild consistency. `nodetool rebuild`/bootstrap, source/range arguments, repair/rebuild streaming and whole-SSTable streaming are the union.
- Full cost/natural carrier/72h killer: streamed SSTable bytes, connections, source load, throughput cap, retries/resume, background compaction and client availability. A finite Cassandra stress/YCSB key-write plus node rebuild trace would reject a residual that fails range ownership/stream completion or omits bytes/catch-up/throughput cost.
- Disposition: source selection, `--tokens`, `--exclude-local-dc`, `--sources`, stream-throughput cap and concurrency are existing configurations/operational policies. No union-external constructor was named.

## Canonical outcome

`COMPLETE_ZERO_PROPOSALS`. The three `DROP`s reflect direct same-object action-union absorption, not absent implementation, results, resources, data or AI readiness. No experiment, benchmark, download, Stage0/A/B creation, automation or shared-control modification occurred.
