# QNN-VTCM-HANDOFF Stage 0 Report

- Decision: `RESERVE_RECOMMENDED`
- Confidence: medium on the public interface and collision classification; low on headroom until a compatible multi-session HTP device is profiled.
- Evidence ceiling: official documentation and source-level audit only. No HTP, timing, PPA, energy, or hardware-contention experiment has been run.

## Frozen object and claim

The canonical object is the same-model, multi-session QNN-EP HTP admission problem and finite configuration bundles defined in [topic_brief.md](topic_brief.md). The policy may select a documented bundle only at a compatible session/context boundary, while dynamic run options are limited to their documented scope. It must not claim an online VTCM lease-transfer primitive, per-request spill/fill command, or opaque allocator state.

The falsifiable claim is conditional: a profile-conditioned session-admission policy can beat the strongest fixed joint bundle on tail latency/isolation debt only after context preparation/cache, RPC, copy, synchronization, warmup, CPU/reference/fallback, and recovery costs are charged. A non-device analytical replay can test accounting logic, not the central HTP performance claim.

## Positive opportunity map

- Natural workload: a user-supplied or authorized-device trace of >=2 same-model fixed-shape QDQ HTP sessions, retaining temporal arrivals rather than generated timing.
- Public opportunity: the QNN EP exposes the needed bundle components—VTCM size, cross-session backup sharing, spill/fill cache buffer, shared allocator, priority and profiling—while documenting relevant incompatibilities and lifecycle costs.
- Mechanism-specific prediction: the configuration selected for an arrival must reverse when the measured/declared bundle preparation, copy/synchronization, or isolation debt outweighs its steady-state benefit; otherwise a static joint bundle should win.
- Headroom: plausible but unmeasured. It is not established by documentation, and no numerical gain is claimed.

## Strongest baseline and collision analysis

The baseline set is `DEFAULT`, every one-sided control, every actually compatible static union, `MYOPIC-JOINT`, same-action-set `JOINT-ORACLE`, and `PRIORITY-ONLY`, as precisely registered in the topic brief. `JOINT-STATIC` and `MYOPIC-JOINT` are the deployment baselines that can falsify the practical contribution; an unlimited scheduler or a model with fictitious VTCM transfers is not fair.

Native VTCM backup sharing and static spill/fill are `DIRECT_SUBTRACT` deployment baselines, not contributions. The public QNN EP otherwise exposes components but no documented arrival/profile-conditioned portfolio selection over the complete ledger. HaX-CoNN and V10 are `METHODOLOGICAL_ADJACENT` and subtract generic shared-memory/transition and multi-tenant-NPU scheduling claims. No `DIRECT_FATAL` source was found under the stated search boundary. The remaining novelty status is `SEARCH_BOUNDED_OPEN`.

## Competing mechanism decision

- Selected mechanism: costed admission/dispatch among already generated, actually compatible QNN configuration/context bundles, using measured external timing and a held-out arrival trace.
- Rejected formulation: an assumed dynamic “lease-transfer” manager with direct ownership of VTCM/spill/fill. The audit found no public control surface for that stronger formulation. The one permitted Stage 0 mechanism pivot is consumed by this narrowing; it does not change the QNN EP object, model, metrics, or arrival trace.
- Registered backup: priority/performance/RPC-only admission policy with exactly the same trace and ledger. It is a baseline/ablation, not a promoted paper mechanism.
- Pivot boundary: no pivot remains. A later proposal must retain the frozen public QNN EP portfolio/action semantics; it cannot add an unpublished control or change to a different NPU/API.

## Residual paper kernel

The residual is not “turn on QNN options.” It is a reproducible decision boundary: when should an arriving same-model QNN session be admitted to a particular **static, public** context bundle rather than the strongest fixed union, once context construction/cache, VTCM backup-sharing compatibility, copies, RPC, synchronization, warmup, and CPU behavior are jointly priced? This is distinct from cross-DSA layer scheduling but becomes academically viable only if a natural trace produces non-dominated reversals.

## Evidence path and AI completion

- AI executability class: `AI_AUXILIARY_ONLY`.
- Estimated `ai_core_fraction`: `0.35` (source audit, harness, cost-ledger/oracle, parsers, config sweep and reproducibility are AI-executable; central concurrent-HTP observation/control is device-dependent).
- 72-hour first evidence: validate public configuration compatibility; build a manifest-driven harness and ledger checker; run QNN CPU/reference semantic checks if the licensed SDK is available. This is not decisive evidence for the HTP claim.
- Human-only decisive items: user-authorized compatible Snapdragon/HTP device, SDK/device access, natural multi-session arrival/profile collection, and validation of actual bundle effects. These are why the candidate is routed to reserve rather than automated Stage A.

## Stage A killer gate (conditional on user authorization)

On one locked device/model/trace, sweep every compatible `JOINT-STATIC` bundle and replay the held-out trace with the candidate and `PRIORITY-ONLY`. Pass only if all of the following hold:

1. semantic outputs match the frozen reference at declared operator boundaries;
2. the policy exhibits at least one pre-registered configuration reversal explained by measured ledger terms;
3. its p99 or declared isolation-debt metric improves over both `JOINT-STATIC` and `MYOPIC-JOINT` under the same complete boundary, without worsening an explicit safety/SLO constraint; and
4. a same-action-set oracle does not show the candidate’s decision as reducible to the static union, myopic rule, or a priority-only action.

This gate is not authorized or started here.

## Stop conditions

Stop on an audited direct QNN-EP policy collision; inability to form a semantically fixed same-model multi-session object; a natural device trace with no non-dominated configuration reversal; or `JOINT-STATIC`/`PRIORITY-ONLY` matching every candidate action under the full ledger. Lack of a Qualcomm device alone is not a stop condition.

## Dual-axis score

- Academic value: `54/70` — importance/venue fit 12/15; post-baseline headroom 10/15; mechanism/insight 15/20; generality/story 10/12; independent boundary 7/8.
- AI executability bonus: `10/30` — public artifact/baseline 3/7; AI core work 3/8; local same-semantics evidence 0/7; 72-hour evidence 1/5; automation/replay 3/3.
- Total: `64/100`.

## Human research reserve

The academic gate passes provisionally (`54/70`) and there is no direct-fatal collision, but the main claim depends on concurrent HTP behavior that public sources and local CPU/reference paths cannot establish. Recommend that the mainline retain it as `HUMAN_RESEARCH_RESERVE`; it must not automatically enter Stage A/B.
