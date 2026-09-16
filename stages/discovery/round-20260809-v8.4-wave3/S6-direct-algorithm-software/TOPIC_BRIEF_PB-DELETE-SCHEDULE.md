# PB-DELETE-SCHEDULE — Dependency-scheduled checked deletion certificates for certified MaxSAT preprocessing

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: `ALGORITHM_DATA_STRUCTURE`, `SOLVER`, `FORMAL_CERTIFICATE`, `CPU_REPRODUCIBLE`
- Contribution route: `N2`
- Discovery date: 2026-08-09
- Discovery method revision: `production v2/v8.1` only; O7 v2 backtest `CALIBRATED`.  TLS-blocked two-axis `v8.2r2` was not used.

## Research question

For a fixed MaxSAT preprocessor transformation trace, can a dependency-aware algorithm choose and batch **checked core-constraint deletions** so that it preserves the same equioptimal output instance and machine-checkable certificate semantics, while reducing certificate construction/checking cost relative to the trace order used by the current proof logger?

## Paper genealogy

- Anchor paper: Ihalainen et al., [Certified MaxSAT Preprocessing](https://doi.org/10.1007/978-3-031-63498-7_24), IJCAR 2024.  It logs all supported preprocessing transformations as VeriPB proofs and uses checked deletion for core constraints.
- Key predecessors: Bogaerts et al., [Certified Symmetry and Dominance Breaking for Combinatorial Optimisation](https://www.bartbogaerts.eu/articles/2023/005-JAIR-CertifiedDominance/CertifiedSymmetryAndDominanceBreakingForCombinatorialOptimisation_JournalExtension.pdf), JAIR 2023 (formal checked-deletion rule); Gocht and Nordström, [Certifying Parity Reasoning Efficiently Using Pseudo-Boolean Proofs](https://arxiv.org/abs/2209.12185) (proof-logging efficiency route).
- Follow-up / competing papers: [PBLean](https://arxiv.org/abs/2602.08692), 2026, imports VeriPB certificates into Lean; [Redundancy Rules for MaxSAT](https://drops.dagstuhl.de/storage/00lipics/lipics-vol341-sat2025/html/LIPIcs.SAT.2025.7/LIPIcs.SAT.2025.7.html), SAT 2025, supplies another proof-system baseline.
- Counter-evidence / negative source: the [VeriPB 3.0 proof-format overview](https://gitlab.com/MIAOresearch/software/VeriPB/blob/HEAD/proof_format_overview.md) already supports checked deletion and checks multi-deletions in the stated order; this proposal cannot claim the rule, checker, or generic certificate format.
- Artifact / benchmark / specification: public [MaxPre](https://github.com/chrjabs/MaxPre) and [VeriPB](https://gitlab.com/MIAOresearch/software/VeriPB), plus the official [Pseudo-Boolean Competition 2025](https://www.cril.univ-artois.fr/PB25/) and [MaxSAT Evaluation](https://maxsat-evaluations.github.io/) instance/results carriers.  The anchor used 558 weighted and 572 unweighted natural MaxSAT instances from MaxSAT Evaluation 2023.
- Search boundary: primary papers and official/upstream artifacts through 2026-08-09.  Searches for `pseudo Boolean proof deletion order`, `VeriPB proof minimization`, and checked-deletion algorithms found the rule, implementations, and certified preprocessor, but no same-object algorithm that optimizes a frozen deletion dependency schedule.  This is `SEARCH_BOUNDED_OPEN`, not a firstness claim.

## Topic-origin card

- Trigger: checked deletion maintains the strong equioptimal/equisatisfiable certificate contract, while the official PB competition explicitly permits unchecked mode because proof generation/checking can be much faster; the IJCAR paper identifies VeriPB checking as a main bottleneck, with checked-deletion steps costly.
- Measurable observation / quantitative anchor: Ihalainen et al. evaluate 1,130 natural MaxSAT Evaluation 2023 instances under fixed CPU/memory limits.  Competition 2025 specifies that checked deletion is the default for core constraints but permits opting out for speed.  These facts establish a natural full-cost tension, not a measured improvement for the candidate.
- Baseline limitation: current logger follows transformation trace order and each checked deletion is validated sequentially against the remaining core; generic checker optimizations validate a supplied proof but do not decide a lower-cost valid deletion schedule.
- Structural cause: whether a deleted constraint is rederivable changes with previously removed core constraints, so deletion ordering/batching is a dependency-and-proof-cost problem rather than an independent per-step switch.
- Decision variable: an ordered partition of eligible core constraints into deletion batches, with a per-batch rederivation witness/proof plan and a live-core dependency frontier.
- Candidate Q1 venue family: SAT / CP / IJCAR / JAIR-style certified optimization; current forecast is deliberately Tier B pending Stage 0.

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/handoff.yaml`
- Backtest status: `CALIBRATED` (3/3 positive recoveries; negative control abstained).
- This field calibrates the discovery method and is not candidate evidence.

## Importance and group fit

Certified preprocessing is a practical bottleneck at the solver–checker interface: it provides a strong end-to-end output-preservation contract for natural MaxSAT instances, while current competition rules expose a trust/performance trade-off.  The object is CPU-only, public, and preserves the solver's output semantics; no proprietary hardware or hidden trace is necessary.

## Exact object

The object is **MaxPre 2.2-style proof-producing preprocessing of weighted/unweighted WCNF MaxSAT**, with an output WCNF instance and a VeriPB/CakePB-checkable equioptimality certificate.  It is not generic SAT deletion, Lean import, arbitrary VeriPB proof compression, proof-checker UI, nor a new MaxSAT heuristic.  Function/quality means identical input WCNF and transformed output semantics: certificate verification establishes the prescribed equioptimality contract and the output instance remains the same for a fixed transformation trace.

## Named fair baselines

- Deployment/default baseline: unmodified MaxPre proof emitter plus current VeriPB/CakePB workflow in the IJCAR artifact.
- Closest recent-paper baseline: IJCAR 2024 certified MaxSAT preprocessing's trace-order checked-deletion construction.
- Competitive simple baseline: stable input/trace order; greedy earliest-ready deletion with the existing per-deletion checker; and an unchecked-deletion mode only as a **different-guarantee speed reference**, never as an equal-quality winner.
- Optional offline ceiling: a time-unbounded exact search over batch orders on small traces, reporting solver time separately; it is a ceiling, not a deployable baseline.

## Mechanism hypothesis

The candidate maintains a dynamic bipartite dependency index between live core constraints and cached rederivation obligations.  It selects a deletion batch only when each member has a certificate plan against the post-batch core; mutually dependent candidates are split.  The emitted proof uses existing checked-deletion syntax, so verification semantics are unchanged.  The proposed contribution is an online scheduling/indexing algorithm that avoids repeatedly reconstructing invalidated proof contexts—not a new checker command.

## Competing mechanisms

- Mechanism A — dependency-frontier batching: maintain reverse dependency counts and a ready frontier; greedily choose a batch minimizing estimated rederivation footprint subject to no intra-batch dependency cycle.  Prediction: benefits cluster around long preprocessing traces with repeated local substitutions, and vanish if ready sets are singleton.
- Mechanism B — proof-DAG reuse with lazy invalidation: memoize RUP/subproof prerequisite slices, invalidate only a slice touched by a deletion, and choose the next ready deletion by retained witness overlap.  Prediction: lowers certificate generation/check time only when overlap survives; may increase peak memory on broad dependency graphs.
- Mechanism C — existing trace order plus independent checked deletions: no extra index; the fair simple baseline.
- Preferred mechanism and why: A is the initial finite N2 because it changes the decision structure (legal batch/order under live-core dependencies) and has a clear correctness invariant.  B is a registered competing mechanism, not a free component union; Stage A must compare them separately before any hybrid is considered.

## Mechanism signature

A valid improvement must retain the same output WCNF and pass the same checker while showing a cost reduction attributable to (i) larger safe ready batches or (ii) smaller rederivation footprints.  Faster output caused by switching to unchecked deletion, changing transformations/output, weakening equioptimality, omitting proof elaboration, or only retuning a solver parameter is disqualifying.

## Seed-distance test

- What changes relative to the anchor: the anchor emits correctness evidence following the transformation trace; this candidate solves a constrained scheduling problem over eligible checked deletions and proofs while holding that trace/output fixed.
- What changes relative to the closest prior work: VeriPB implements the rule and checks a supplied order; it does not supply a dependency-scheduled construction algorithm or compare it against a fixed transform trace under a full ledger.
- Why this is not an application/backend rename: the input object, WCNF semantics, proof format, and checker remain identical; only the online deletion schedule/witness-reuse algorithm changes.
- Result of method-name deletion test: “Given a sequence of semantics-preserving constraint removals, choose a legal order and partition whose rederivability proofs have minimum executable cost while the final constrained instance is unchanged” remains a distinct algorithmic problem.

## Candidate paper claim

For fixed natural MaxSAT preprocessing traces, dependency-scheduled checked deletion can preserve the certified equioptimal output contract and reduce end-to-end certificate construction/checking cost on a nontrivial, characterized subset of instances; the method has a soundness invariant mapping every batch to existing checked-deletion obligations.  No universal speedup or solver-quality improvement is claimed.

## Evidence route

- `PERFORMANCE` plus formal preservation invariant.

## Software/algorithm performance admissibility, if applicable

- Same-function contract: input WCNF, transformation trace, output WCNF, objective, and VeriPB/CakePB acceptance must be identical to the trace-order baseline; compare output hashes/canonical forms plus formal checker outcome.
- Algorithmic delta: dynamic live-core dependency index, legal batch-order selection, and cached obligation slices—not a parameter, a different checker, or a post-hoc dashboard.
- Full-cost ledger scope: preprocessing, dependency-index maintenance, witness discovery, proof bytes, elaboration, checker CPU, peak RSS, disk I/O, and timeouts; report end-to-end separately from each component.
- Generality hypothesis: applies to proof-producing transformations containing multiple checked core deletions with nontrivial dependency overlap; it need not help proof traces that never delete core constraints.
- Why this is not routine tuning: the decision variable is a combinatorial schedule/partition subject to rederivability constraints, and the output is a valid certificate construction algorithm with a correctness invariant.
- Expected no-gain region: singleton-ready-frontier traces; independent deletions without shared proof slices; already-small traces where index overhead dominates; solver traces that use unchecked deletion or only prove UNSAT (different guarantee).

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior | Residual |
|---|---|---|---|
| Research problem | Cost-efficient strong certificates for fixed MaxSAT preprocessing | Certify preprocessing correctness | Minimize legal checked-deletion construction cost without weakening contract |
| Exact object | MaxPre-style WCNF→WCNF equioptimal proof traces | Same | Same-object |
| Decision variables | Deletion order, batches, witness-slice reuse | Transformation order and individual deletion witness | New constrained schedule |
| Constraints / information | Live-core dependency/rederivability and output fixed | Check supplied deletion against current core | Schedule feasibility structure |
| Core algorithm or mechanism | Frontier index + legal batch selection | Checked-deletion validation/proof emission | Construction algorithm, not checker rule |
| Guarantee | Existing checker accepts same output/equioptimality contract | Existing contract | Invariant for schedule-to-existing proof obligations |
| Evidence object | Public MaxPre/VeriPB on natural MaxSAT Evaluation traces | Same natural corpus | Fair same-object comparison |

## Current collision classification

- DIRECT_FATAL: none found through 2026-08-09 for a dependency-scheduled checked-deletion construction algorithm on this frozen object.  Must be re-audited at Stage 0.
- DIRECT_SUBTRACT: checked deletion itself, proof-format support, and certified MaxSAT preprocessing are prior work and excluded from claims.
- METHODOLOGICAL_ADJACENT: PBLean's reflected certificate import; generic proof trimming; SAT/DRAT deletion methods; these change proof system or target.
- DEPLOYMENT_BASELINE: MaxPre + VeriPB/CakePB; current VeriPB's checked and unchecked modes.
- SEARCH_BOUNDED_OPEN: specific schedule optimization residual only, never global novelty.

## Decisive falsifier

On a frozen sample of natural MaxSAT Evaluation traces that contains at least 30 traces with two or more checked deletions, stop if either: (a) fewer than 20% expose a ready dependency choice/batch of size >1 after canonical trace extraction; (b) the candidate cannot reproduce the baseline output and checker acceptance exactly; or (c) its full end-to-end p50 and p90 cost is not lower than trace-order checked deletion while proof bytes or peak RSS rise enough to remove any Pareto advantage.  A strong null result is a STOP for this frozen mechanism, not a prompt to relax certification.

## Executable evidence path

### 72-hour first evidence

1. Freeze MaxPre/VeriPB/CakePB commits, compiler/runtime, and 30 naturally occurring MaxSAT Evaluation 2023 traces that actually execute checked core deletions; retain source/WCNF/output/proof hashes.
2. Build a read-only trace extractor that reconstructs only the core-deletion dependency graph and verifies that replayed baseline proofs pass unchanged.
3. Implement Mechanism A on the extractor output; emit existing-format proof operations, compare canonical output WCNF/objective and checker verdict against trace order.
4. Kill on the falsifier above.  If non-killed, compare A, B, and trace order with the complete ledger—no unchecked-mode comparison may establish equal-quality performance.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE` (about 75%): repository build, trace extraction, graph/index implementation, proof replay, benchmark harness, and cost accounting are auditable.  The critical researcher task is formal review that the batch invariant really implies the existing checked-deletion obligations; AI output cannot self-certify that proof.

### Semantics-preserving open alternatives

MaxPre's trace-order emitter, current VeriPB checked deletion, CakePB verification, and a no-schedule stable-order replay are all public same-semantic alternatives.  Unchecked deletion is an explicit weaker-guarantee reference only.

## Q1/Q2 sufficiency hypothesis

- Structural paper potential: `TIER_B_Q2_VIABLE` if a formal schedule invariant plus full-cost Pareto improvement occurs over a characterized natural subset.  It is not promoted merely because current experiments are absent.
- Current evidence readiness: `MODERATE_FINITE_CPU_ROUTE`; public artifacts/corpora and a finite killer exist, but no candidate result has been run.
- Why this supports at least a complete Q2 paper: same-object algorithmic construction, unchanged certified output contract, CPU reproducibility, natural benchmark traces, a sharp no-gain boundary, and formal soundness reduction to existing checked deletion together form a coherent narrow contribution.
- Why it may reach Q1, or why it remains Tier B: it remains Tier B until there is evidence across distinct MaxSAT preprocessing transforms/competitions, a rigorous complexity or approximation statement for scheduling, and independently verified full-cost gains.
- What would still be required at Stage B: current collision audit; formally reviewed invariant; multiple frozen versions/corpora; comparison against all named baselines; ablations A/B; proof-size/RSS/CPU/disk ledger; negative regions; reproduction package.
- Preliminary contribution-shape analogs, if any: JAIR 2023 certified dominance/symmetry, IJCAR 2024 certified MaxSAT preprocessing, SAT 2025 redundancy rules.
- Reminder: preliminary analogs do not replace Stage 0 Q1 calibration.

## Non-relaxable quality audit

- Same-object: frozen to MaxPre-style WCNF preprocessing and its equioptimal certificate; no generic proof/compression claim.
- Latest collision: 2026 VeriPB release, PBLean 2026, SAT/PB 2025 rules, and IJCAR/SAT 2025 papers screened; Stage 0 must repeat this audit.
- Strong fair baselines: trace-order checked deletion, stable and greedy legal orders, optional exact ceiling; unchecked is labelled non-equivalent.
- Natural input/evidence: MaxSAT Evaluation instances/traces and PB competition assets, not synthetic graph-only cases.
- Full-cost: explicit end-to-end ledger including proof construction, checking, bytes, RSS, disk, and timeouts.
- Reproducibility: public repositories, pinned commits and competition/evaluation assets; Stage A must record hashes.
- Evidence/claim honesty: Discovery has run no implementation or benchmark.  All performance assertions are hypotheses; the only documented facts are prior artifacts/rules/papers.

## Dual-axis score

- Academic value: `48/70`
- AI executability bonus: `23/30`
- Total: `71/100`

## AI and researcher boundary

AI may implement and replay the specified algorithm and account for costs.  A human/formal-methods reviewer must independently validate the batch invariant and ensure that any certificate remains a same-contract checked-deletion proof.  Low readiness would not be a scientific STOP, but this candidate has a finite CPU route.
