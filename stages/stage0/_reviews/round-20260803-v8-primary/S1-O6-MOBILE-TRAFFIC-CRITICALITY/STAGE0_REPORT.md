# Stage 0 PRIMARY report — S1-O6-MOBILE-TRAFFIC-CRITICALITY

**Decision:** `REVISE_ONCE` — **AWAITING_CONFIRMATION**  
**Confidence:** 0.86 | **Route:** N1 | **Score:** academic 43/70 + AI 3/30 = **46/100**  
**Discovery provenance:** the calibrated O1/O6 backtest was read as method provenance only; no score, measurement, or novelty inference was inherited.

## Frozen research object and claim

For a fixed mobile-SoC-like shared NoC/DRAM path, fixed UI/LLM request trace, model-output contract, and thermal/power envelope, choose a per-transaction class/deadline/budget and a starvation-bounded arbiter policy. The claimed result is an equal-quality jank/token-throughput Pareto improvement over accelerator-wide priority, command yielding/preemption, and aggregate caps. The object excludes a generic host scheduler, a vendor-API claim, or a mere QoS wrapper.

## Primary evidence, genealogy, and collision

Sereno is a real, high-quality anchor: its OSDI 2026 paper reports up to 153% extra jank and a software-yield remedy. XSched is the command-level subtractor. The critical current-source correction is that ARM CHI and AMD Versal document per-transaction QoS carried through interconnect/memory paths. Thus the stated `class + deadline/budget` is **not yet** shown to contain information unavailable to existing transaction QoS. That is a direct subtract on the un-frozen information model, but not `DIRECT_FATAL`: no current source located by this review establishes the same *mobile workload-criticality semantic, budget, and first-arbiter contract* with the claimed result and cost boundary.

## Facet / seed-distance matrix

| Facet | Candidate | Closest prior | PRIMARY finding |
|---|---|---|---|
| Object | mobile shared-memory requests | Sereno command/yield | different layer, but only conditionally |
| Information | workload-critical token + budget | CHI/AXI QoS fields | **unfrozen distinction** |
| Action | first-arbiter service constraint | yield/preempt / existing QoS | must prove non-equivalence |
| Guarantee | Pareto + starvation + full cost | measured QoS / QoS policy | unmeasured |
| Natural evidence | synchronized UI/LLM traces | Sereno traces | candidate trace unavailable |

The seed-distance passes only if a precise workload-criticality predicate and its budget cannot be encoded as an existing QoS field/configuration without losing a stated fairness or causal property.

## Finite fair baselines and natural headroom

1. Stock accelerator-priority plus FR-FCFS/weighted arbitration.
2. Sereno-style speculative-decoding yielding on the identical request stream.
3. XSched-style command priority/preemption where applicable.
4. Same-constraint EDF is an offline ceiling only.

Sereno quantifies a natural contention phenomenon, not headroom for this primitive. No candidate-specific public trace proves that the first common arbiter can consume the proposed information. Absence of Qualcomm hardware/API is an evidence-ceiling limitation, **not** a stop reason.

## Mechanisms, contribution, and falsifier

Mechanism A is host command yielding/preemption; mechanism B is aggregate XPU priority/capping; the proposed mechanism is a token-preserving first-arbiter policy. This is potentially N1 only after the information distinction closes. Within 72 hours, a trace-schema audit must (i) exhibit two natural synchronized traces with class-separable requests before the first common arbiter, (ii) specify the token algebra and mapping against CHI/AXI QoS, and (iii) show, in a transparent queue model, one Pareto point not reachable by the three named baselines under equal quality and starvation constraints. Failure of any part is `STOP`.

## Q1 calibration and execution boundary

| Calibrator | Shape used | Calibration result |
|---|---|---|
| Sereno, OSDI 2026 | mobile QoS causal systems paper | strong problem, not residual proof |
| XSched, OSDI 2025 | XPU scheduling mechanism | strong command-level baseline |
| Layerweaver+, IEICE 2022 | NPU QoS scheduling | adjacent only |

Q1 shape is presently below parity because the principal primitive may collapse to existing transaction QoS. AI core fraction is **0.10**: parsing and trace-model scaffolding are auxiliary; semantic and microarchitectural validity are researcher-owned.

## Atomic revision gate

`NONENCODABLE_MOBILE_QOS_SEMANTICS_AND_FIRST_ARBITER_HEADROOM`: freeze one existing QoS contract and formally/constructively show the proposed token adds an unrepresentable required predicate/budget; then provide two natural trace schemas and the small equal-quality baseline comparison above. This is one atomic closure, not a mechanism pivot. No Stage A/B is authorized.
