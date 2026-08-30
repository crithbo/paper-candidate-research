# LLVM-BITCODE-ABBREV-PLANNER Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-V8.7`
- Input freeze SHA-256: `edd6b635484828d2e98a51ba5916c9503a847ba1d1fb7d3e34826aa78249502e`
- Natural corpus freeze SHA-256: `74dd21052e889e22780f49151cf36e2322a6ba8cf959054afdf6346f1529ebc0`
- Cross-assignment contamination declaration: no GIT or other-candidate fact,
  input, result, or file was used; old topic root remained read-only.
- Decision: `STOP_RECOMMENDED` (owner recommendation; mainline adjudicates)
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `NEGATIVE_KILL__B2_FULL_ACTION_ABSORPTION`
- Novelty route tested: `N2`
- Stage semantics: bounded real pilot of the highest-risk premise, not a paper.

## Pre-claim contract fidelity gate

- Gate status: `PASS`
- Frozen atomic actions mapped: `ATOMIC_ACTION_MAP.md`.
- Comparator audit: complete B0 source/flag inventory plus B1 exact current-
  grammar oracle, B2 greedy same full family/bounds, and B3 tiny ceiling.
- Native parity: ordinary raw bitcode only; all arms use unmodified LLVM 22.1.8
  commit `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1` reader/checkers.
- Metric denominator: whole-file bytes and common native tool/read path.
- Full cost: compile, plan, write, strict checks, reads, CPU/wall/RSS, failure
  and fallback are recorded in JSON and summarized in `RESULTS.md`.
- Small witness: 4→5 definitions crossed CodeLen 3→4; valid live BLOCKINFO
  scope move; B3 independently matched WL at 160 bits.
- Non-claim controls: old failed-offset rewrite and rejected top-level
  BLOCKINFO route.
- Claim-bearing run started only after PASS: `true`.

## Frozen contract

The input is a pinned Module plus exact expanded semantic block/record trace;
the output is one ordinary raw native bitcode file.  Only grammar,
BLOCKINFO/immediate scope and definition order, induced IDs/CodeLen, and
unchanged-record assignment/fallback may change.  Record values—including
physical offsets—cannot change.  Stage B remains unauthorized.

## Headroom or theoretical gap

Current source lacks a file-global exact planner.  The admitted residual was a
bounded joint optimization over grammar, placement, assignment, alignment, and
CodeLen steps.  The gap was structurally real but empirically had no residual
over the fair B2 algorithm on the frozen natural corpus.

## Minimal mechanism and strongest baselines

WL-SLDP constructs deterministic native grammars, enumerates local subsets by
width ladder, solves exact assignment with a bit-residue DP, applies one
capacity-neutral BLOCKINFO action, and globally convolves leaf frontiers under
a module definition budget.  B2 receives the same grammar/scope universe,
limits, information, and exact ledger, adding the best immediately positive
action greedily.  B2 produced exactly the WL file on all 100 modules.

## Natural workload and mechanism-specific prediction

The pre-registered public corpus contains 100 unique build-derived
llvm-test-suite modules with four O/debug strata and source-size quartiles.
The prediction was that repeated natural record shapes would expose a global
width/scope selection missed by greedy actions.  The observed residual was
0/63 useful modules, falsifying the finite prediction.

## Highest-risk probe result

- Risk-bearing premise: ≥10% of useful natural modules expose a primary action
  benefit outside B1/B2, with positive p50 and p90 union residual.
- Scope: 100 natural modules; 400 strict native arm files.
- Negative meaning: B2 absorbed every WL primary benefit; the frozen N2 lacks
  paper headroom in this action domain.
- Positive-result ceiling: not applicable; no `PRELIMINARY_SUPPORT` issued.

## Directional increment

WL saved 320 B total versus B0 on 63 modules, but B2 saved the same 320 B and
produced byte-identical files.  The directional increment versus the strongest
union is exactly zero at the total, p50, p90, and per-module levels.

## Performance evidence chain

- Algorithm: width-ladder subset frontier + exact residue assignment + forest
  definition-budget DP.
- Mechanism metrics: 22 modules emitted a novel grammar and 24 used the scope
  action, exactly matched by B2.
- End-to-end: B0 484,840 B; B1 484,604 B; B2/WL 484,520 B.
- Full-cost: 0.019831 measured CPU-hours; max planner RSS 35.1 MB; all strict
  checks/read trials complete.
- Generality/no-gain: 100/100 B2 absorption across all four trace strata.

## Current critical-cost analysis

WL planning p50/p90 was 0.04096/0.07297 seconds per module, versus B2
0.03924/0.07611.  Outputs are identical, so neither timing noise nor minor RSS
differences can create a primary Pareto benefit.  Cost is not the mathematical
reason for rejection; absence of any size/access residual is.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE_PUBLIC_CPU`.
- Measured ai_core_fraction: effectively 1.0 for this Stage A implementation,
  corpus construction, replay, verification, and analysis; no human-only claim
  step was required.
- Reproducible artifacts: complete scripts, frozen inputs, per-module plans,
  arm files, native checks, CSV/JSON summaries, and manifest.
- Human-only items: mainline scientific adjudication and any external decision.

## Mechanism pivot, if used

None.  Pre-claim implementation corrections did not consume scientific
revision.  The post-gate observation directly triggers frozen STOP conditions.

## Literature collision update

Current upstream reality was frozen at LLVM main commit
`a1194be1baefa99d20a09bd04b16056be0ab7225`; executable parity uses release
commit `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`.  The full ordinary writer API,
BLOCKINFO/local definitions, record calls, dynamic source choices, and relevant
flags were audited.  No global planner was found in the bounded source audit,
but the candidate is stopped by direct B2 experimental absorption rather than
by a novelty claim.

## Stage B minimal prototype

Not proposed.  The frozen candidate fails Stage A, `stageb_authorized=false`,
and no project or Stage B directory was created.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE`
- Evidence comparable: exact object, current strong baselines, natural corpus,
  full cost, failure boundary, reproducibility.
- Fatal gap: zero N2 residual over B2 on every natural module.

## Non-relaxable quality audit

- Same-object: PASS for all 400 arms.
- Latest collision: bounded current-source audit complete; negative result does
  not require a firstness claim.
- Strong fair baselines: PASS; B2 is decisive.
- Natural input/evidence: PASS; 100 frozen public modules.
- Full-cost: PASS and under resource caps.
- Reproducibility: PASS subject to final manifest validation.
- Evidence/claim honesty: negative only; no positive or Stage B claim.

## Supported and unsupported claims

Supported: in this frozen executable domain/corpus, B2 reproduces all WL
outputs and primary benefits; residual coverage is 0% and p50/p90 residual is
0 B.  Unsupported: universal impossibility, all LLVM versions/grammars,
external-compression behavior, reader-speed superiority, or paper-level
novelty.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested by owner because STOP is
  recommended; mainline adjudication remains required.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B user approval id/time: null.
- Stage B authorized: false.

## User-action blocker

Not applicable.  Resource acquisition recovered through the frozen public HTTP
route and a complete claim-bearing observation was obtained.
