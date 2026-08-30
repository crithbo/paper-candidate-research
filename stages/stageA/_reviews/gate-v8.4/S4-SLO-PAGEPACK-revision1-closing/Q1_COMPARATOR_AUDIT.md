# Q1/Q2 Comparator Audit

## Named composition fidelity

| Dimension | Frozen requirement | Executed revision | Gate finding |
|---|---|---|---|
| OBASE access/classification | Guide/SODA, NEW/HOT/COLD, CIW and adaptive cold threshold | last-access windows with constant `OBASE_CI_THRESHOLD=3` | adaptive threshold is absent |
| OBASE layout | SAMA-style runs and stated footprint-descending first fit | only the current page is tested; a new page opens on failure | next-fit within each heap, not stated first-fit |
| OBASE relocation | Guide/TAG/ATC/ODM with safe destination placement | separate event streams, but final slot intervals overlap | aggregate capacity passes; concrete relocation fails |
| MDK policy | online AGE, 30 s scans/10 min threshold ratio, 5% promotion-rate window | `1000` rows per logical scan, `R_A=20`, online aging/promotion | faithful trace-level policy state; no wall-clock claim |
| Information | prior epoch only | both candidate selection and OBASE classification use prior rows | pass |
| Oracle boundary | no OPP/post-hoc envelope | OPP excluded; one fixed composition emitted | pass |

The comparator is much stronger than the initial threshold/prefix proxy, but it is not the pre-specified faithful OBASE default composition. A fixed CIW=3 classifier may be a named ablation, not an adaptive default. Its packing routine also differs from its own frozen “first-fit” description. These are comparator-fidelity defects, so the result cannot kill the candidate.

## Full-cost and Pareto audit

The ledger is typed and covers migration, layout footprint/fragmentation, retained metadata, fallback, solver work, classification, placement, policy checks and semantic replay. That is good reporting practice.

The decision rule is not a valid non-dominance test: it requires the candidate to be no worse in all deterministic cost fields while also yielding more benefit. A point with more reclaimed capacity and more planning work is Pareto-incomparable, not dominated. No solver-work budget or conversion to the fixed SLO exists in revision 1. The recorded `0/3` therefore means “candidate does not dominate the comparator on every field,” not “the comparator absorbs the candidate on all three epochs.”

## Structural potential versus readiness

- Structural paper potential: `TIER_B_Q2_VIABLE` remains conditional. A joint layout/SLO algorithm still has a recognizable N2 paper shape if a faithful executable comparator and net fast-tier metric leave a residual.
- Current evidence readiness: `REVISION1_GATE_FAILED__STOP_NOT_CONFIRMED`.
- Q1 parity: `PARITY_NOT_PLAUSIBLE_CURRENTLY`; multiple trace families, a deployable/approximate planning algorithm, runtime evidence and an updated collision audit remain non-bounded gaps.
- Q2 continuation cannot be automatically recommended from this package because same-object relocation and strong-comparator hard gates are open.

## Claim ceiling

Supported: the frozen deterministic program produces the reported layouts, AGE timelines, typed counters and byte-identical stable files.

Unsupported: faithful adaptive OBASE composition; valid concrete destination-slot relocation; strong-baseline absorption; an epoch-level preliminary-support claim; production behavior; all configurations; a general impossibility result.

