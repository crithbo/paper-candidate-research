# S4-SLO-PAGEPACK Revision 1 Q1/Q2 Comparator Matrix

- Stage: `STAGEA_REVISION1`
- Venue family: systems / memory management
- Calibration status: `PARITY_NOT_PLAUSIBLE_FOR_FROZEN_MECHANISM`
- Recommended tier: `BELOW_Q2_STOP`
- Positive evidence ceiling had the gate passed: `PRELIMINARY_SUPPORT_ONLY`

## Current primary-source anchors

| Role | Source | Frozen contribution | Revision implementation |
|---|---|---|---|
| Object-layout anchor | OBASE, OSDI 2026 official paper | Guide/SODA tracking, NEW/HOT/COLD, CIW, SAMA, TAG/ATC/ODM relocation | one named CIW3/SAMA configuration plus executed Guide relocation audit |
| SLO-policy anchor | MDK, OSDI 2026 official paper | windowed performance proxy, AGE/PAW/PACE policies, OPP offline ceiling | online AGE `R_A=20`, fixed 5% promotion-rate target, no sweep |
| Same-object API anchor | CacheLib Item/Handle official source | handle lifetime and safe access boundary | frozen OBASE-admissible adapter; mobility not inferred from trace |
| Natural input anchor | cacheMon MetaKV official trace corpus | natural request/object sizes and operation multiplicity | exact parent 120,000-row slice and three frozen epochs |

## Comparator matrix

| Dimension | Candidate | Faithful OBASE→AGE | Finding |
|---|---|---|---|
| Object/semantics/backend | same 12 objects/epoch, 4 KiB tier, frozen GET/SET/DELETE | identical | PASS |
| Information | previous epoch only | same prior rows/state/mobility | PASS |
| Layout action | exact joint assignment and initial slow-page set | NEW/HOT/COLD CIW3 SAMA runs | genuinely different actions |
| SLO action | fixed boundary target; promote on access | online AGE age/demote/promote | actual policy replay, not static prefix |
| Pointer safety | Guide/TAG/ATC/ODM state machine | same protocol on own state | PASS |
| Semantic evidence | independently executed transcript/final-state hashes | independently executed hashes | PASS |
| Full cost | exact states/transitions/subsets, migration, metadata, replay | layout classification/placement, policy windows, migration, metadata, replay | typed vector, no arbitrary conversion |
| Natural result | raw avg residual +4,096/0/+2,595 B | SLO legal in epochs 2/3; benefit wins epoch 2 | candidate full-cost positive 0/3 |
| Reproducibility | byte-identical dual replay | same | PASS |

## Q1/Q2 shape judgment

The methodological gates are now much stronger than the initial owner package: same object, named deployable policy, executed pointer relocation, causal information, complete typed cost vector and dual replay all close. The remaining failure is contribution-bearing, not readiness-bearing. The exact candidate cannot turn its raw page-packing benefit into a strict full-cost non-dominated point because enumerative planning dominates the cost vector, while the faithful composition provides a cheaper competing mechanism and directly wins epoch 2.

This frozen candidate therefore lacks the minimum positive N2 kernel for a credible Q2 paper. Q1 parity is not plausible. A different approximate solver could be a different frozen mechanism, but it was not authorized in this sole revision and cannot be inferred from these results.

## Claim ceiling

Supported only: finite three-epoch scientific negative result under the frozen configurations. Unsupported: production throughput/latency, unbounded theory, all MDK/OBASE parameters, global novelty or a general impossibility theorem.

