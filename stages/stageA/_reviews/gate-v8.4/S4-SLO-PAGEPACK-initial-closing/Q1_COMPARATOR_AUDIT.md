# Q1/Q2 Comparator Audit

## Comparator status

| Comparator role | Frozen source | Owner implementation | Gate finding |
|---|---|---|---|
| Same-object layout | OBASE/HADES | sweep prior-access thresholds; pack HOT then COLD with deterministic first fit | mechanism-shaped proxy, not OBASE guide/instrumentation/control-loop replay |
| SLO policy | MDK | rank pages by prior access count and enumerate a static slow-page prefix | not an MDK AGE/PAW/PACE/OPP or MPC replay; no windowed promotion/policy state |
| Fair deployable composition | OBASE-or-HADES layout to online MDK-style policy | proxy threshold/target sweep | same trace and prior counts, but interface, policy semantics and full cost are not faithful |
| Offline ceiling | exact actual-access layout | separately labeled ceiling | correctly not called a deployable baseline, but planning cost makes it a costed algorithm rather than a pure structural ceiling |

The code computes both a prior-information deployable proxy selection and an actual-feasible envelope. The residual uses the latter. In these three instances, the selected point is also predicted-feasible and reclaims all initial pages, so the post-hoc selection does not change the recorded maximum. Nevertheless a universal sweep/envelope cannot substitute for the required named deployable current baseline, and its proxy fidelity remains the controlling defect.

## Structural potential versus readiness

- Structural paper potential, if a faithful same-object residual exists: `TIER_B_Q2_VIABLE`.
- Current evidence readiness: `REVISE_ONCE__FAITHFUL_SAME_OBJECT_COMPOSITION_GATE_OPEN`.
- Q1 parity: not currently plausible; multi-structure generality, runtime evidence and a stronger contribution/guarantee would remain Stage B-scale gaps after a positive Stage A gate.
- Q2 viability: not disproved by the current proxy negative, because the mandatory strong-comparator and same-object gates are not closed.

## Independent reviewer views

- Editor/venue-fit: the problem remains relevant, but the current result cannot support either a paper claim or a scientific STOP.
- Methodology: deterministic enumeration is strong, while construct validity of the object, policy and cost model is insufficient.
- Domain contribution: OBASE and MDK remain direct subtractors; their real composition has not been executed or faithfully emulated.
- Devil's advocate: selecting twelve mostly nonpersistent items makes “all pages can be slow” unsurprising and tests a registered no-gain region rather than the proposed selective-packing signature.

No comparator was independently added or replaced. Venue calibration remains based on the frozen OBASE, MDK, HADES and BRUMM set.

