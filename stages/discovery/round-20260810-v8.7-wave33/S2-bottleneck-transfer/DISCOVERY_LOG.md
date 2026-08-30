# Discovery log — DISCOVERY-S2-20260810-V8.7-WAVE33

## Method and scope

- Cutoff: 2026-08-10.  Used production discovery v2/v8.1, v8.6 fidelity-plan
  admission, v8.7 current-upstream reality checks, and broad-then-deep
  contribution-first screening.  The TLS-blocked two-axis v8.2r2 method was
  not used.
- Twelve new genealogies were selected to avoid Wave29’s HyCache, IRHash,
  ByteCheckpoint, ODRP, Juneberry, FlacIO, GogetaFS, GraCE, Syncopate, VTC,
  MPK, and Obscura lines.  They also avoid active, blocked, terminal, and
  paused registry objects.
- No implementation, download, experiment, benchmark, or downstream stage was
  created.  Absence of any such result is not used as a negative inference.

## Broad coverage: 12 new contribution genealogies

| # | Anchor contribution lineage | Bottleneck transfer / candidate residual | Broad decision |
|---:|---|---|---|
| 1 | Incr, OSDI 2026 | full shell re-execution → dependency/effect metadata and cache retention | DROP: no current same-object native shell contract was fixed; an external cache wrapper is prohibited. |
| 2 | CloudTS, FAST 2026 | cloud query latency → tag metadata and object-group layout | DROP: CloudTS’s global tag dictionary plus mapping/layout is already the complete joint action; Cortex mapping changes semantics. |
| 3 | Knative cold-start/probing line | container start → readiness/network-stack coordination | DROP: current action space is queue-proxy/autoscaler policy; residual is controller behavior. |
| 4 | MedFS, FAST 2025 | delta-compression write reduction → inode/data-area maintenance | DROP: current F2FS does not establish the same mobile log-structured delta-compression object. |
| 5 | Archer, FAST 2025 | page compression → association-aware region/LRU decisions | DROP: next action is page placement/eviction selection. |
| 6 | PolyStore, FAST 2025 | device-level throughput → cross-device metadata/placement | DROP: transparent placement is a policy controller; no new same-function atomic action. |
| 7 | GeminiFS, FAST 2025 | GPU storage access → host/GPU metadata synchronization | DROP: dependence on the paper’s GPU file-system contract prevents a portable same-object CPU/open-tool killer. |
| 8 | Pineapple, NSDI 2025 | consensus-leader removal → logical-timestamp coordination | DROP: the residual is the protocol’s ordering/coordination core and not a separable N2. |
| 9 | Pyrrha, NSDI 2025 | receiver scheduling → shared-link congestion control | DROP: remaining choice is flow-control scheduling/controller. |
| 10 | DISC, NSDI 2025 | multi-tier data relay removal → backpressure accounting | DROP: no new complete action beyond shared connection control. |
| 11 | KRR, OSDI 2025 | record/replay efficiency → snapshot-restoration OS path | DROP: no non-excluded current runtime exact object and finite native fidelity bridge were fixed. |
| 12 | Incr’s adjacent persistent-cache lineage | incremental reuse → invalidation/storage overhead | DROP: source-level effect tracking and cache retention are already Incr’s coupled action; no seed-distance. |

## Deep audit of the three nearest lines

### A. CloudTS → Cortex-style cloud monitoring query

- Exact-object attempt: a Cortex-compatible time-partitioned tag query over
  the same metric samples and query result.
- Strong union: CloudTS’s global tag dictionary, two-dimensional
  timeseries–tag mapping, grouped compressed objects, and Cortex’s native
  query/storage path.
- Direct collision: the only frozen cross-stage action—joint global tag
  metadata plus grouped object layout—is CloudTS’s stated core contribution.
  Moving to a different metadata representation changes the object/format
  contract before a fair same-object comparator is fixed.
- Natural route exists (production monitoring time series and Cortex), but the
  required `FIDELITY_CLOSURE_PLAN` is structurally unclosable under a single
  representation.  No brief.

### B. Knative cold start → readiness/proxy coordination

- Frozen current upstream: Knative Serving `v1.23.0` / `7ed4aa2`, released
  2026-07-29; official docs and repository material observed 2026-08-10.
- Reality: a revision is an immutable code/configuration snapshot; Service,
  Route, Configuration, Revision, autoscaler, activator, and Queue-Proxy are
  native components.  Queue-Proxy aggregates rewritten readiness probes;
  high-scale routing can bypass the activator; request routing is governed by
  `target-burst-capacity` and `concurrency-target` conditions.
- Default/non-default paths: default TCP readiness when absent; custom
  readiness/liveness/startup probes; direct versus activator routing;
  autoscaler/network/provider and Queue-Proxy resource configuration.
- Direct subtractor: the alleged residual chooses probe/routing/drain policy
  across these exposed mechanisms.  It is an existing-point selector/controller,
  not N1/N2.  No absence claim is carried forward and no brief is emitted.

### C. MedFS → Linux F2FS compression/metadata

- Exact-object attempt: a same-function Linux F2FS compressed file read/write
  contract with mobile update workloads.
- Strong-union test: MedFS depends on a mobile log-structured delta format,
  delta-inlining, and a complementary maintenance strategy; F2FS offers a
  different native file-system and compression contract.  The two cannot be
  combined as a fair same-object union without changing on-disk semantics.
- Natural route is potentially finite (kernel selftests and public Android-like
  workloads), but that does not repair the object mismatch.  No implementation
  gap is alleged; no brief.

## Decision

`COMPLETE_ZERO_PROPOSALS`.

All 12 lines were independently screened and the three nearest were audited
more deeply.  The result follows direct absorption, controller boundaries, or
same-object fidelity failure—not lack of an artifact, checker, implementation,
positive result, private hardware, or AI readiness.

## Primary and official sources

- [Incr](https://www.usenix.org/conference/osdi26/presentation/xie-yizheng), OSDI 2026.
- [CloudTS](https://www.usenix.org/conference/fast26/presentation/zhang-kai), FAST 2026.
- [FAST 2025 technical sessions](https://www.usenix.org/conference/fast25/technical-sessions) (MedFS, Archer, PolyStore, GeminiFS).
- [NSDI 2025 technical sessions](https://www.usenix.org/conference/nsdi25/technical-sessions) (Pineapple, Pyrrha, DISC).
- [Knative Serving overview](https://knative.dev/docs/serving/), [probing](https://knative.dev/docs/serving/services/configure-probing/), and [architecture](https://knative.dev/docs/serving/architecture/), observed 2026-08-10.
- [Knative Serving v1.23.0 release](https://github.com/knative/serving/releases), commit `7ed4aa2`.
