# DISCOVERY-S5-20260810-V8.7-WAVE36-ALGORITHMIC-RESIDUAL — Discovery log

**Lane:** `DISCOVERY-S5-SCALE-ONLINE-APPROX`  
**Cut-off:** 2026-08-10  
**Method:** accepted production Discovery v2/v8.1, v8.6 fidelity admission, v8.7 current-upstream reality check. TLS-blocked two-axis v8.2r2 was not used.

## Outcome

`COMPLETE_ZERO_PROPOSALS`. This is a residual re-review of three Wave-31 near-threshold, non-active and non-terminal lines: PolarStore, SPLIDT and HCDN. Wave 31 is not amended and no stopped object is revived.

## Six-dimensional algorithmic residual review

| Line | Decision rule | Information | Complexity / resource | Quality / guarantee | Full cost | Generalization / no-gain | Result |
|---|---|---|---|---|---|---|---|
| PolarStore cloud-native compression | A putative follow-on chooses a hardware/software codec or schedule per object/epoch. | Existing PolarStore already has database-aware I/O, dual-layer compression and compression-aware scheduling. A new per-object choice would not add information. | Any gain is a codec-placement/scheduling choice; no new representation or bound was specified. | It must retain database semantics, compression ratio and uncompressed-comparable performance. The frozen action does not strengthen those guarantees. | Must include host CPU, PolarCSD work, transfer, storage bytes, I/O latency and cluster scheduling; a scheduler-only comparison omits none of these but also adds no algorithm. | May help only workload-specific codec skew; a homogeneous workload has no structural reason to improve. | `DROP_CONTROLLER_OR_ACTION_SELECTION_ONLY` — direct subtraction leaves no N2 algorithm. |
| SPLIDT stateful line-rate decision-tree inference | Candidate thought: incrementally alter partition/tree layout after stream drift instead of batch retraining. | The official artifact exposes partitioned DT training/inference, DSE, baselines and seven natural traffic datasets. The actual current training-source/config contents required to establish or refute an online-update action could not be retrieved in this read-only pass. | Any honest comparison must count retraining, tree transformation, TCAM rule generation/installation, recirculation, register/MAT use, and packet latency. No complexity or resource bound was independently derived. | Same object requires line rate, the classifier task, time-to-detection and target feasibility; a changed prediction/latency contract is not a residual. | Full cost includes control-plane update and target compilation, not just classifier F1. | Drift may create an opening only if the full update method is not already represented; a stationary stream is the no-gain region. | `NOT_PROPOSED__RESOURCE_BOUNDED_CURRENT_SOURCE_CHECK` — not an academic DROP. The v8.7 absence claim cannot be made until the actual artifact source and all relevant configurations are inspectable. |
| HCDN live-video delivery | The residual considered was a new global stream-to-edge representation replacing periodic redirection selection. | HCDN already consumes stream/node hotness, load, capacity, node type and client-side prediction. A candidate that merely chooses redirections uses the same information. | A genuine representation would need boundable update, query and edge-state cost; no such construction was identified outside OpenTiga strategies. | Must preserve live delivery QoE, startup and stall semantics; altering the traffic class or prefetch assumption changes object. | HCDN explicitly includes controller memory, control bandwidth, redirection/connection overhead, midgress and edge costs. | Stream-node skew is its positive region; uniform stream-node hotness is a no-gain region. | `DROP_CONTROLLER_ONLY` — the surviving action is periodic strategy orchestration, expressly excluded by the assignment. |

## Current source / collision record

* **PolarStore:** official FAST '26 page states the dual-layer hardware/software mechanism, database I/O optimization and compression-aware scheduling. No upstream absence is alleged. The private deployment is not a reason to DROP; it is irrelevant after the controller-only residual finding.
* **SPLIDT:** the authors' official project points to public artifact repository `SpliDT-Decision-Trees/SpliDT-Artifact-NSDI26`, branch `main`; its repository page identifies the `dse-and-training-framework` submodule at `712f49d` and `hypermapper` at `3dfa8a7`, and records seven public natural datasets. The raw source/config URLs could not be obtained by the available read-only fetch (`cache miss`), so no symbol, flag, threshold or absence statement is asserted. This is a bounded source-access condition, not negative academic evidence.
* **HCDN:** the official NSDI '26 paper itself documents global stream-node hotness, periodic scheduling, redirection rules, control-plane overhead and the OpenTiga central orchestrator. The residual is controller-only by positive paper evidence; no upstream absence claim is needed.

## Required candidate components deliberately not fabricated

No topic brief was written because none met all of: exact same-object action gap, two non-synonymous mechanisms, fair complete union, natural carrier, finite fidelity closure plan and 72-hour decisive falsifier.

For SPLIDT, if a future assignment can inspect the frozen source/configuration set, the finite attack would be: establish whether its full current method accepts a stream-update sequence and incrementally modifies partition/tree/rule state under the unchanged line-rate, TTD and target-feasibility contract. If it already does, the residual is `DIRECT_FATAL`; if it does not, a separate new candidate must still specify the atomic update algorithm, complete cost and an independent latest-collision search. This is not a proposed Stage0 plan and authorizes no download or experiment.

No candidate was rejected for missing implementation, core result, artifact download, compute resource or AI readiness. Only PolarStore and HCDN have structural controller-only outcomes; SPLIDT remains an unproposed, resource-bounded source-check lead.
