# Source, action-space, and collision matrix — WAVE43 S2

## Primary-source routes and their permitted use

| Object | Primary route | Current-reality use | What it does not establish here |
|---|---|---|---|
| Kafka tiered storage | [Apache Kafka tiered storage documentation](https://kafka.apache.org/documentation/#tiered-storage); [Apache Kafka upstream source](https://github.com/apache/kafka) | Route for a future frozen tag/commit, remote-log/fetch/cache/retention action inventory, and default/non-default configuration audit. | An unavailable page does not prove that an action, flag, or collision is absent. |
| Flink checkpointing | [Apache Flink checkpointing under backpressure](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/checkpointing_under_backpressure/); [Apache Flink upstream source](https://github.com/apache/flink) | Route for a future frozen tag/commit, checkpoint mode/recovery inventory, and default/non-default configuration audit. | An unavailable page does not prove that a selective capture action is unavailable or unimplemented. |

## Candidate-grade union and action audit

| Object | Fair strongest executable union to freeze | Proposed atomic action | Union-external certificate required | Natural/fidelity route | Full cost and finite falsifier | Result |
|---|---|---|---|---|---|---|
| Kafka tiered storage | Versioned remote-log lifecycle + fetch path + local cache/residency/retention actions, with every applicable default and opt-in setting recorded. | One coupled transition: choose offset-range hydration, sharing lease, and post-lease local residency release for the same fetch. | Show an offset/fetch-locality/capacity state where no sequential composition of union actions produces the same shared lease transition while preserving consumer response and retention. | Public Kafka-produced fetch/retention trace or official workload artifact; small source-level/broker witness on CPU. | Charge remote bytes, local disk, broker CPU, fetch tail latency, and retention/availability.  Falsify if the action is a cache/retention wrapper, changes semantics, or is reproduced by union. | DROP: the comparator and legal transition are not finite yet. |
| Flink checkpointing | Versioned aligned, unaligned, and all configured timeout/hybrid capture and recovery actions, including their information and guarantees. | One barrier-time coupled transition: choose edge/channel capture cut plus the compatible recovery materialization order. | Exhibit a minimal graph in which the candidate's selective cut is legal, preserves exactly the same completed checkpoint/recovery state, and cannot be replayed by the union. | Public Flink job/trace route with a small backpressured graph; CPU MiniCluster/source witness after fidelity closure. | Charge checkpoint time, alignment delay, channel-state bytes, recovery time, throughput, and resource use.  Falsify if illegal, changed guarantee/object, or union replay. | DROP: no legal same-guarantee witness is frozen. |

## Collision conclusion

There is **no claim of direct upstream absorption** and no claim of upstream
absence in this rescreen.  A native mode, policy, hook, or configuration is
only a strong baseline.  The two directions fail before collision resolution:
their candidate whole action cannot yet be kept distinct from a wrapper,
changed contract, or undefined semantics.  Thus there is no grounded brief to
send to Stage 0.
