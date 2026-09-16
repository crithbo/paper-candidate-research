# S1-O6-MOBILE-TRAFFIC-CRITICALITY Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_2`
- Assignment id: `STAGEA-L2-20260809-S1-O6-MOBILE-TRAFFIC-CRITICALITY-RESERVE-PROBE`
- Input freeze SHA-256: `AF8EDE3A7B9186A665C51C898AE0FB87F1CF6D49D839D1BDD1ADB8662BD9985D`
- Cross-assignment contamination declaration: PB context, tools, corpus and judgments were cleared and not reused.
- Decision: `RESERVE_RECOMMENDED_WITH_USER_RESEARCH_REQUEST`
- Quality tier: `TIER_B_Q2_VIABLE` as conditional structural potential
- Evidence ceiling: `PRE_CLAIM_PUBLIC_SOURCE_AUDIT_ONLY__NO_CLAIM_BEARING_PROBE`
- Novelty route: `N1`
- Stage semantics: restricted real highest-risk preflight; no Stage A mechanism result and no paper main claim.

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED`
- Frozen atomic actions mapped to implementation paths: contractually mapped, but the natural per-request source-to-first-arbiter path is not present in public data.
- Comparator implementation/parameter/semantic audit: Arm defines 4-bit AxQOS identifiers but not exact use; no frozen mobile source gives actual comparator semantics/parameters.
- Native codec/reader/format parity: no natural same-object transaction record exists to validate native/candidate parity.
- Metric denominator and unit parity: denominators are preregistered, but cannot be instantiated on a common request stream.
- Full-cost dimensions and collection paths: the ledger is complete; several physical/arbiter collection paths are absent.
- Small legality/equivalence/object-identity witness: unavailable.
- Non-claim-bearing proxy/control outputs retained: none; no proxy was run.
- Claim-bearing run started only after PASS: `false`; the gate did not pass.

## Frozen contract

The object is a natural mobile UI/frame or camera/ISP foreground workload concurrent with on-device LLM inference. The candidate may only transform source/criticality/budget semantics into a no-richer-than-native request-level action at the first arbiter shared by both traffic classes. Request arrivals, payloads, dependencies, quality, bandwidth/capacity, power/thermal and starvation budgets are fixed across candidate and baselines. B4 is the strongest native dynamic per-transaction QoS comparator with identical information.

## Headroom or theoretical gap

Sereno establishes that foreground QoS degradation under mobile LLM traffic is natural and that software yielding can materially change the end-to-end tradeoff. Arm/AMD establish that per-transaction QoS is a real competing mechanism. The residual between a richer source-preserving contract and actual native QoS remains a hypothesis only; no natural request/action evidence closes it.

## Minimal mechanism and strongest baselines

The minimal mechanism is a legal classifier/encoding plus bounded arbitration action at the first shared arbiter, preserving the frozen source and budget. Baselines are B0 stock, B1 Sereno-style yield, B2 XSched-style command scheduling, B3 native static QoS and B4 native dynamic same-information QoS. EDF is an offline ceiling only and never a union oracle.

## Natural workload and mechanism-specific prediction

The natural anchor is Sereno's commercial-phone foreground application plus on-device LLM concurrency. The mechanism-specific prediction would be a candidate action at class-separable contention windows that B4 cannot reproduce at equal quality and full cost. Public materials do not expose those request windows or actions, so the prediction was not tested.

## Highest-risk probe result

- Risk-bearing premise: `FIRST_ARBITER_CAUSAL_DELTA_VS_NATIVE_TRANSACTION_QOS`.
- Probe/counterexample-search scope: the mandatory fidelity preflight over official specifications, peer-reviewed primary papers and the XSched author artifact.
- Negative-result meaning: none for the mechanism; the preflight is fail-closed before observation.
- Positive-result ceiling: not applicable; neither `NOT_FALSIFIED` nor `PRELIMINARY_SUPPORT` is claimed.

## Directional increment

- Performance/quality/Pareto/complexity effect: not measured.
- Why it is not ordinary tuning or a weak-baseline artifact: the proposed N1 increment is only meaningful if it preserves a source/budget contract through a distinct first-arbiter action beyond actual B4. The current gate cannot establish that distinction.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: not implemented.
- Intermediate mechanism metric: not measured.
- End-to-end effect: not measured.
- Full-cost result: not measured.
- Generality region: not established.
- No-gain or regression region: preregistered native-QoS absorption boundary, not tested.

## Current critical-cost analysis

All required dimensions are frozen in `EXPERIMENT_CONTRACT.yaml`. The missing collection paths are especially consequential for mapping/classification work, tag/path storage, arbiter state/cycles, DRAM timing/row behavior, fairness/starvation enforcement, power/thermal attribution and trace-model error. Omitting them would make a Pareto claim invalid.

## AI execution ledger

- AI executability class: `AI_AUXILIARY_ONLY`
- Measured ai_core_fraction: `0.30`
- Reproducible commands/artifacts: input hashing, official-source acquisition, PDF semantic audit, contract/control matrix, source/action audit and package validator.
- Human-only items: natural trace authorization/acquisition, cross-layer mapping and causal annotation, platform-specific comparator interpretation, witness attestation and physical full-cost calibration.

The fraction is measured against the main-claim critical path, not file count. AI completed the public-source and integrity portion, while every decisive causal step remains human-owned.

## Mechanism pivot, if used

No mechanism pivot or scientific revision was used.

## Literature collision update

Sereno directly subtracts application-level yielding; XSched subtracts command-level scheduling; Layerweaver+ subtracts request/layer QoS scheduling; native AXI/Versal QoS subtracts a new-tag story and mandates B4. No permitted primary source covers the complete frozen action, but the absence of an executable natural object prevents a novelty conclusion. Search remains bounded and conditional.

## Stage B minimal prototype

No Stage B prototype is proposed or authorized. If the human package later closes the same Stage A gate, the next action is a resumed restricted Stage A comparison on the same object, not Stage B.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: Sereno, XSched, Layerweaver+, Arm AXI/ACE and AMD Versal QoS.
- Status: `PARITY_CONDITIONAL`
- Evidence already comparable: problem importance, adjacent mechanisms, mandatory comparator, natural end-to-end workload anchor.
- Executable Stage B gaps: none; Stage B is forbidden.
- Human/resource-dependent gaps: complete mapping, actual comparator, natural witness, full-cost measurement and same-object result.

## Non-relaxable quality audit

- Same-object: specified but not instantiated; fail closed.
- Latest collision: primary subtractors audited; complete closure conditional on the executable object.
- Strong fair baselines: B0–B4 frozen; B4 not executable from public materials.
- Natural input/evidence: natural setting established; required per-request evidence absent.
- Full-cost: dimensions frozen; collection paths incomplete.
- Reproducibility: source/preflight package reproducible; scientific run absent.
- Evidence/claim honesty: no proxy, PASS, STOP, performance or causal claim.

## Supported and unsupported claims

Supported: the official-source corpus has the frozen hashes; Sereno supplies a natural mobile problem but aggregate observability; Arm defines per-transaction QoS fields without exact platform use; XSched/Layerweaver+ act at different layers; the pre-claim gate cannot close from public materials.

Unsupported: candidate benefit, candidate failure, native-QoS dominance, Pareto residual, implementability on a vendor mobile SoC, causal first-arbiter effect, generality, or completion of a paper main claim.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested because owner recommends reserve.
- User-facing evidence packet: `USER_REVIEW_PACKET.md` and `USER_RESEARCH_REQUEST.md`.
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: null
- Stage B authorized: false

## Human research reserve

Prior `HUMAN_RESEARCH_RESERVE / AI_AUXILIARY_ONLY` provenance is preserved. The reserve reason is not lack of download access or temporary tooling. The central research act—mapping natural requests and causal semantics through the actual first arbiter and native comparator—requires human platform access, interpretation and attestation. The minimum exit package is specified in `USER_RESEARCH_REQUEST.md`.

## User-action blocker, if applicable

Not applicable. Public-source acquisition completed, and the limiting factor is the human-owned core research object rather than a transient resource failure.

- Claim-bearing observation obtained before failure: no
- Evidence ceiling: `PRE_CLAIM_PUBLIC_SOURCE_AUDIT_ONLY__NO_CLAIM_BEARING_PROBE`
- Scientific revision consumed: no
- Blocker packet: none
