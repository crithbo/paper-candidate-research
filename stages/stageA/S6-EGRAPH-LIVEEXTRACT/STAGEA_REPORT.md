# S6-EGRAPH-LIVEEXTRACT Stage A Report

- Decision: `REVISE_ONCE`
- Quality tier: `TIER_A_Q1_POTENTIAL` structural ceiling retained
- Evidence ceiling: `CONTROLLED_EXACT_ORACLE_WITH_ONE_PUBLIC_STRUCTURE_NEGATIVE_CONTROL`
- Novelty route: `N2`
- Stage semantics: real pilot research on the highest-risk premise; this report does not complete the paper main claim.

## Frozen contract

`EXPERIMENT_CONTRACT.yaml` freezes a pure acyclic e-graph, roots, selected closure, integer operation/output-size costs, temporary allocation convention, budget `B`, exact schedule semantics, two sequential controls, exhaustive joint oracle, seed `260809`, 400 controlled trials, one pinned public artifact route, full-cost telemetry, stopping rules, and commands. No Stage B operation is authorized.

## Headroom or theoretical gap

The small exact search found one strict point at the same object and `B=15`: joint cost 30 versus runtime-first 32 and memory-first 34. This establishes headroom only for `controlled_235`. It does not establish natural-workload headroom. The pinned public `eggcc-bril/add.bril.json` projection had one extraction and therefore supplied no headroom.

## Minimal mechanism and strongest baselines

- Minimal mechanism: enumerate one representative per reachable e-class and solve exact materialization/deletion/recomputation/root-emission scheduling with Dijkstra over `(emitted roots, resident values)`.
- Strongest executed baselines: globally runtime-minimal extraction followed by exact fixed-DAG scheduling, and globally minimum one-shot-peak scheduling-aware extraction followed by exact fixed-DAG scheduling. All exact ties remain eligible.
- Small-instance ceiling: the joint enumeration plus exact scheduler.
- Literature subtractors not executed: FastOpt, SmoothE, e-boost, Julia EqSat ILP/code reuse, and 2026 exact pattern-aware extraction.

## Natural workload and mechanism-specific prediction

The public structural input is pinned to `egraphs-good/extraction-gym@903ba0f…`, `data/eggcc-bril/add.bril.json`. The projection preserves e-class/enode/child/root structure and source node costs, but uses synthetic unit output sizes because the artifact lacks backend allocation sizes. It is therefore a natural-structure negative control, not natural backend-memory evidence.

Prediction: gains should occur only when a representative with lower additive cost creates a live/recompute penalty under tight `B`, while a slightly different representative removes that penalty. The controlled witness matches this signature: runtime-first recomputes once; the joint choice does not.

## Highest-risk probe result

- Risk-bearing premise: selection and scheduling can be nonseparable at a fixed semantic/allocation boundary.
- Probe/counterexample-search scope: one pinned public projection plus 400 seed-locked controlled acyclic e-graphs, 3,106 exact extractions and 105,496 schedule queries.
- Negative-result meaning: 399 controlled instances and the public projection have no strict witness; benefit is not common under this generator.
- Positive-result ceiling: `PRELIMINARY_SUPPORT`; never `MAIN_CLAIM_ESTABLISHED`.

## Directional increment

- Performance/quality/Pareto/complexity effect: at `controlled_235, B=15`, joint cost is 6.25% below runtime-first and 11.76% below memory-first at identical peak live.
- Why it is not ordinary tuning or a weak-baseline artifact: both controls are exact over their frozen order and retain all ties; the delta is a different representative that removes a recomputation, not a solver parameter.

## Performance evidence chain

- Algorithm/data-structure change: make representative choice and live scheduling a joint state.
- Intermediate mechanism metric: runtime-first executes 6 operations with one recomputation; joint executes 5 with zero recomputation.
- End-to-end effect: exact total-cost proxy 32 → 30 at the same `B=15`.
- Full-cost result: solver wall time and RSS are recorded; real backend runtime/spill/codegen are unavailable and excluded from claims.
- Generality region: not established; hypothesized tight memory, nontrivial alternatives, and reuse/recompute tension.
- No-gain or regression region: 399/400 controlled instances and the single-extraction public projection.

## Current critical-cost analysis

Two final runs took 12.270 s and 11.536 s with peak Python RSS 29.61 MB and 29.46 MB. The public materialization is 866,607 bytes and the locked suite 973,093 bytes. Backend construction, allocation, spill/reload, and machine latency remain missing core costs, so a paper-performance claim is prohibited.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE` for this Stage A probe; `AI_CORE_CONDITIONAL` for the full research path.
- Measured ai_core_fraction: approximately 0.88 of the probe critical path (contract, oracle, generator/importer, tests, two runs, replay and reporting).
- Reproducible commands/artifacts: listed in `COMMAND_LOG.md`; canonical result SHA-256 is `acdf34ff…`.
- Human-only items: authoritative backend-size convention approval, publication-level novelty judgment, and any later user Stage B authorization.

## Mechanism pivot, if used

None. The problem, object, metric, and mechanism stayed fixed. Pivot budget remains available but is not invoked.

## Literature collision update

- `DIRECT_SUBTRACT`: [FastOpt](https://doi.org/10.1145/3689801), [SmoothE](https://doi.org/10.1145/3669940.3707262), [e-boost](https://arxiv.org/abs/2508.13020), [Julia EqSat](https://doi.org/10.1145/3795883), and [Exact Pattern-Aware Extraction](https://doi.org/10.3390/a19050377) subtract additive/DAG/pattern-aware extraction contributions.
- `METHODOLOGICAL_ADJACENT`: [Checkmate](https://proceedings.mlsys.org/paper_files/paper/2020/hash/0b816ae8f06f8dd3543dc3d9ef196cab-Abstract.html) solves fixed-DAG rematerialization; [E-Graphs as a Persistent Compiler Abstraction](https://arxiv.org/abs/2602.16707) changes compiler representation; [EggMind](https://arxiv.org/abs/2604.17364) targets saturation-strategy resource use; [Optimism in Equality Saturation](https://doi.org/10.1145/3808302) targets cyclic analysis.
- `SEARCH_BOUNDED_OPEN`: searches through 2026-08-09 did not identify a source solving the same acyclic e-graph representative/materialize/recompute/legal-schedule object under generated-program peak-live `B`. This is not a global novelty claim.

## Stage B minimal prototype

This is a plan only and is not authorized. If the Stage A revision later passes an independent gate and the user explicitly approves Stage B, the minimum prototype would ingest two public e-graph families, preserve backend-valid sizes/costs, implement a bounded-width live-boundary DP, compare FastOpt/Julia/e-boost-compatible extraction and both sequential orders, and add an orthogonal structural/scale validation with complete compile/runtime/memory costs.

- Primary workload: natural Cranelift or eggcc-bril e-graphs with multiple reachable alternatives and backend-valid size mapping.
- Required orthogonal validation: a second independent e-graph source or a theorem/scale boundary.
- Candidate Q1 venue family: OOPSLA/PACMPL, PLDI, CGO, ASPLOS.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: FastOpt, SmoothE, Julia EqSat, Checkmate; latest-collision subtractors additionally include e-boost and exact pattern-aware extraction.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Evidence already comparable: exact formal object, exact sequential controls, deterministic artifact, one mechanism-specific controlled witness.
- Executable Stage B gaps: natural multi-alternative inputs, backend-valid memory/cost, scalable algorithm/guarantee, end-to-end full cost, broader mechanism analysis.
- Human/resource-dependent gaps: authoritative backend convention and novelty review.

## Non-relaxable quality audit

- Same-object: PASS for all three methods in the locked probe.
- Latest collision: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`; not closed to Stage B standard.
- Strong fair baselines: PASS for the small exact controls; named implementation parity remains open.
- Natural input/evidence: PARTIAL/FAIL FOR PASS — public natural structure exists, but has one extraction and synthetic unit sizes; no natural positive witness.
- Full-cost: PARTIAL/FAIL FOR PASS — oracle cost is complete, backend costs are absent.
- Reproducibility: PASS for the bounded probe, two exact canonical runs.
- Evidence/claim honesty: PASS; controlled result and missing natural evidence are separated.

Because natural positive evidence and backend-valid full cost are non-relaxable, `PASS_RECOMMENDED` is not honest. The one controlled witness is sufficiently informative to avoid `STOP`, so the recommendation is `REVISE_ONCE`.

## Supported and unsupported claims

Supported: a strict ordering-separation witness exists within the frozen controlled formal object; the coupling premise is preliminarily supported.

Unsupported: the effect occurs on natural compiler e-graphs; the method saves real memory/runtime; it scales; it is globally novel; it meets Q1/Q2 paper evidence; or Stage B should begin.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested until the one allowed Stage A revision closes its gate.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B user approval id/time: null.
- Stage B authorized: false.
