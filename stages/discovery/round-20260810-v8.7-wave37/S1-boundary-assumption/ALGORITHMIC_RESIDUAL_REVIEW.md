# Five fresh algorithmic-residual deep reviews

## 1. rustc incremental query-artifact retention

**Exact object:** a fixed Rust crate revision sequence to a native `rustc` compilation result with identical diagnostics/code-generation semantics.  
**Action-divergence witness:** at the same query DAG and revision delta, policy A persists the result of query `Q`; policy B recomputes it. The official red-green/try-mark-green algorithm is the native baseline.

- Decision rule: choose query artifacts to retain/materialize across revisions.
- Information: query DAG, dependency colours, prior query results and changed inputs are already native red-green inputs.
- Complexity/resource: a cache-retention policy consumes the same disk/serialization budget as current incremental work products.
- Quality/guarantee: identical compilation output is attainable only if reuse obeys native dependency validation; no new correctness or approximation guarantee was identified.
- Full cost: serialization, invalidation, disk footprint, cache lookup, cold build and diagnostic/codegen paths all count.
- Generalization/no-gain: the divergence is a cache policy, but no source-supported action outside dependency-validated reuse plus ordinary eviction was found. It is not yet a distinct N2 algorithm with a new constraint/guarantee.

**Disposition:** `DROP_CACHE_POLICY_ONLY__NO_UNION_EXTERNAL_CONSTRAINT`. A finite natural Rust-crate corpus exists, so lack of implementation is not the reason.

## 2. PostgreSQL logical-replication parallel apply

**Exact object:** a fixed publication/subscription and commit stream to the same subscriber relational state under PostgreSQL transactional logical-replication semantics.  
**Action-divergence witness:** at equal worker budget, policy A applies transactions from a single subscription in commit order; policy B reorders two independent-looking transactions across tables.

- Decision rule: partition/apply transactions or tables under worker and slot limits.
- Information: publications, replica identity, WAL order, subscription configuration and schema are native information.
- Complexity/resource: worker/slot budgets and parallel-apply settings are explicit configuration resources.
- Quality/guarantee: the official contract says a subscriber applies data in publisher order for transactional consistency within one subscription; reordering requires a new commutativity proof/guarantee not supplied by the object.
- Full cost: initial snapshot, slot/WAL retention, apply workers, conflict/error recovery, failover-slot synchronization and end-to-end lag are mandatory.
- Generalization/no-gain: preserving the existing guarantee collapses B to native order/parallel configuration; relaxing it changes the guarantee. No complete same-object N2 was found.

**Disposition:** `DROP_GUARANTEE_BOUNDARY__REORDERING_CHANGES_OBJECT`.

## 3. QUIC congestion/pacing update

**Exact object:** a fixed encrypted QUIC connection trace to identical transport delivery semantics and congestion-control fairness envelope.  
**Action-divergence witness:** with equal ACK/loss/RTT observations, policy A updates cwnd using BBR/CUBIC-style state; policy B performs a delay/loss joint update or PEMI-like inferred-loss assist.

- Decision rule: choose cwnd/pacing/loss-response update per feedback epoch.
- Information: endpoint feedback is native; transparent-middlebox inference uses a different deployment information condition.
- Complexity/resource: O(1) state update vs inference/middlebox state; both must charge CPU, timers, retransmission and queueing.
- Quality/guarantee: delivery and fairness need preservation; PEMI adds delay-based fairness enforcement, QUIC-DC and 2025 production-QUIC optimisation already occupy delay/joint/automated algorithm families.
- Full cost: packet processing, pacing timers, losses, tail latency, cross-flow fairness and deployment overhead are part of the denominator.
- Generalization/no-gain: endpoint-only B is absorbed by current congestion-control algorithms; transparent inference changes the deployment object and collides with PEMI. No new information/guarantee frontier survived.

**Disposition:** `DROP_CURRENT_ALGORITHM_COLLISION_OR_DEPLOYMENT_CHANGE`.

## 4. DAMON region-to-operation construction

**Exact object:** a fixed Linux address-space access stream to the same process memory semantics while selecting access-aware maintenance operations.  
**Action-divergence witness:** for the same region access/age snapshot and operation budget, rule A reclaims a cold region; rule B applies LRU sorting or another DAMOS operation to it.

- Decision rule: map monitored regions to operation schemes under a bounded monitoring/operation budget.
- Information: access frequencies, age, region boundaries, estimated bandwidth and tunable sampling intervals are native DAMON inputs.
- Complexity/resource: all candidates operate under existing sampling overhead and operation-scheme configuration; DAMON_STAT already auto-tunes capture intervals within documented limits.
- Quality/guarantee: no new memory-safety, QoS, approximation, or competitive guarantee was identified.
- Full cost: monitoring CPU, sampling accuracy, operation cost, reclamation faults/latency, bandwidth and interference must be counted.
- Generalization/no-gain: DAMOS explicitly exposes access-aware operations with no-code configuration. The witness is a scheme selection, not a new atomic action or N2 constraint structure.

**Disposition:** `DROP_NATIVE_SCHEME_CONFIGURATION__NO_N2_N3_RESIDUAL`.

## 5. F2FS free-space-mode transition

**Exact object:** a fixed F2FS workload and on-disk filesystem semantics under equal free-space and durability requirements.  
**Action-divergence witness:** at the same utilisation and segment state, rule A keeps copy-and-compaction cleaning; rule B changes to threaded-log free-space management.

- Decision rule: select/transition free-space management mode using file-system state.
- Information: utilisation, segment state and write pattern are native F2FS state.
- Complexity/resource: the two modes already trade cleaning work against random writes under the same device budget.
- Quality/guarantee: same durable filesystem semantics hold, but no new endurance, tail-latency, or competitive guarantee was supplied.
- Full cost: cleaning I/O, write amplification, random-write penalty, checkpoint/recovery and device wear must be charged.
- Generalization/no-gain: upstream F2FS documents this exact hybrid and dynamic policy; the action-divergence witness is already the native mechanism. A more elaborate switch rule is tuning without a new structural constraint.

**Disposition:** `DROP_DIRECT_CURRENT_UPSTREAM_ALGORITHM_ABSORPTION`.

## Aggregate decision

All five proposed decision rules were treated as algorithms first, not dismissed because they resemble control. None passed the fair-union, same-object, six-dimensional test; no brief is emitted. Each would have a finite natural carrier (Rust crates, PostgreSQL change streams, QUIC traces, DAMON snapshots, F2FS traces), so evidence-readiness is explicitly not causal to the drops.
