# Policy Alignment Report

## Identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-MINIMUM-VIABLE-CALIBRATION-R13B`
- `approval_id`: `R11A-MINIMUM-VIABLE-CALIBRATION-20260813-R13B`
- `decision`: `MAINLINE_IMPLEMENTATION_AUTHORIZED`
- `date`: `2026-08-13`
- `shared_files_modified`: `false`

## Outcome

The approved replacement is mechanically implementable without another policy choice. It changes the calibration sample architecture, not the scientific quality gates:

1. the existing 28 historical cases become open development regression material only;
2. the initial independent blind evaluation is exactly 24 families, four per stratum;
3. up to two presealed balanced tranches of six may be released only by an Auditor-owned preregistered trigger, producing cumulative blind sizes 30 and at most 36;
4. the identity roster remains finite and contamination-safe;
5. the original R13 128-commitment proposal is superseded and was never approved.

## Exact old-to-new contract semantics

| Surface | Old R11A semantics | R13B approved semantics |
|---|---|---|
| Historical 28 cases | protected prior identities used only for exclusion; not an explicit development corpus | `OPEN_DEVELOPMENT_REGRESSION_ONLY`; format/regression/error-type use allowed, blind scoring forbidden |
| New eligible-index minimum/target/maximum | `60 / 72 / 80` | initial blind core exactly `24`; evaluation may reach `30` and at most `36` only through preregistered triggers |
| Strata | each of six strata at least 8 in the 60–80 pool | core exactly 4 per stratum; each released reserve tranche adds exactly 1 per stratum; maximum 6 per stratum |
| New development selection | 12 development cases selected from the new eligible index | zero new-blind cases diverted to development; the old 28 supply development regression only |
| Blind reveal | 24, then +8, then +8, maximum 40 | 24, then +6, then +6, maximum 36 |
| Expansion authority | interval inconclusive at 24/32 under old contract | Auditor-only allowlisted coverage/uncertainty/decision-discordance/inconclusive trigger; never answer- or score-improvement-driven |
| Identity capacity | current four are insufficient; old unapproved R13 proposed 128 unique | maximum 72 unique commitments including current four; maximum 88 raw leads; four new rolling batches only |
| Case freezing | all 40 blind identities frozen before Executor | core plus all available balanced reserve identities, qualification artifacts, selection order and keys frozen before first Executor |
| Contribution diversity | at least five types; one type <=30% | unchanged; integer caps are 7 at n=24, 9 at n=30 and 10 at n=36 |
| Statistical/scientific gates | frozen R10/R11A endpoints, hard gates and evidence rules | unchanged; smaller sample may yield `INCONCLUSIVE`, never an easier PASS |
| Downstream sequence | PACKER → EXECUTOR → AUDITOR → two shadows → possible production | unchanged; Packer never re-enters after first Executor; Auditor only releases presealed tranches through mainline |
| Canonical mode | `OFF` | remains `OFF` through calibration and both prospective shadows |

## Why this is contamination-safe

- The old 28 and every derivative artifact are physically and logically outside the new blind pool.
- R12A prior-nonmatch remains mandatory for every new blind family, including the current two and all reserves.
- Each rolling batch commitment precedes both private intersection and source qualification.
- Final core/reserve membership and deterministic rank are sealed before the first Executor call.
- The Auditor cannot choose identities or inspect unreleased reserve answers; it emits only a trigger reason and requested next tranche.
- The Executor receives only the currently released sealed packet. Receiving a later tranche does not reveal its answers or the trigger's measured values.
- Development results, blind results and shadow results have separate manifests, denominators and reports.

## Existing two eligible families

They are not grandfathered. Mainline must mechanically test each family against all of the following:

1. its identity commitment was immutable before R12A intersection;
2. the exact R12A Packer-visible result is `prior_identity_match: false`;
3. checkpoint 011 records complete source qualification under the frozen Phase-1 contract;
4. identity, target/outcome and artifact hashes are absent from the open-development register and every prior blind/development identity set;
5. no Executor/Auditor or method-development consumer has received its target identity, outcome or answer;
6. it satisfies the final deterministic stratum rank and contribution-diversity selection.

Only a family passing all six may count toward the 24. Failure changes only R13B admission; it does not create a scientific negative finding.

## Rolling capacity decision

- unique commitment ceiling: `72` including the existing four;
- raw-lead ceiling: `88` including the existing four;
- new unique batches: `20 / 20 / 20 / 8`;
- new raw caps: `24 / 24 / 24 / 12`;
- maximum new batches: four;
- no fifth, replacement or capacity-transfer batch.

At 72 unique commitments, 36 source-qualified blind families are arithmetically reachable at a 50% overall yield, while the initial 24 requires only 33.33%. This is exactly half of the superseded R13 unique ceiling and remains finite. The current `2/4` eligible observation is descriptive rather than predictive, but it supports 72 over a brittle 60–64 ceiling and does not justify 128.

## Auditor expansion mechanics

At n=24 and, if used, n=30, the Auditor first evaluates hard-stop precedence. Contamination unknown, identity leak, answer leak, terminal STOP revival, E2-to-academic leakage, invalid pairing or another frozen hard-gate failure ends evaluation without expansion.

If hard stops are clean, exactly one of the following preregistered trigger classes may authorize the next balanced six-family tranche:

- `COVERAGE_TRIGGER`: post-seal independent audit leaves any stratum below its scheduled scorable count;
- `UNCERTAINTY_TRIGGER`: a frozen confirmatory endpoint is mechanically `INCONCLUSIVE_INTERVAL_CROSSES_BOUNDARY`;
- `DECISION_DISCORDANCE_TRIGGER`: hard gates pass, but frozen confirmatory endpoint classifications contain at least one PASS and at least one FAIL/NOT_SHOWN/INCONCLUSIVE, so the preregistered overall rule is not decisive;
- `OVERALL_INCONCLUSIVE_TRIGGER`: the frozen aggregation rule returns `PILOT_NOT_CALIBRATED_INCONCLUSIVE` with an allowlisted non-hard-failure reason.

A low score, favorable/unfavorable answer, case identity, target method, desired result, desire to rescue a FAIL, or discretionary request to improve confidence is never a trigger. Without a trigger at n=24, the packet closes at 24. A trigger at n=24 may reveal exactly one presealed family per stratum and reach 30. A still-valid trigger at n=30 may reveal the second balanced tranche and reach 36. No further expansion is legal.

## Scientific and downstream invariants

Q1/Q2, same-object, latest collision, fair current strong baseline, natural input/evidence, full-cost, reproducibility, evidence honesty, claim ceiling and STOP non-revival are unchanged. R13B authorizes no Discovery, Stage0/A/B, E2, experiment, production or formal project action.

Only an independent Auditor `CALIBRATED/PASS` followed by two prospective noncanonical shadow PASSes may permit mainline to consider a safe-boundary production cutover. That cutover is not authorized by R13B itself.

## Recommendation to mainline

Implement the additive R13B amendment exactly as specified. Do not request R13A, do not modify the immutable old R13 audit directory, and do not contact PACKER until the mainline-owned amendment, supersession record, open-dev separation contract and existing-two admission gate are all frozen and mechanically accepted.

