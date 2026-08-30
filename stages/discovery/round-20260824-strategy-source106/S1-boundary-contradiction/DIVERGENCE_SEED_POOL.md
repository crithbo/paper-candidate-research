# Source106 S1 divergence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE106-ACCELERATOR-SOFTWARE-ROTATION-V1` / `DISCOVERY_S1`
- Frozen profile: `SOURCE106_PUBLIC_ACCELERATOR_SOFTWARE_CROSS_LAYER_ROTATION_V1`
- Seed ceiling: `<=12`; generated: `8`
- RQ candidate ceiling after convergence: `<=8`
- Network-security exclusion check: `PASS` — only public simulation, public PIM/DRAM specifications and public LLM traffic artifacts may be considered.
- Generation completed before evidence lookup: `YES`
- Terminal identity exclusion: the held `CRFEPOCH-HBMPIM-LLM-GEMV-REV0` identity and any contains-identity are excluded; no Stage0 artifact or chat was read.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S106-01, S106-05 |
| `PROBLEM_REFRAMING` | yes | S106-02 |
| `CONSTRAINT_MANIPULATION` | yes | S106-03, S106-06 |
| `NEGATION_OR_INVERSION` | yes | S106-04 |
| `ABSTRACTION_LADDER` | yes | S106-07 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S106-08 |

### S106-01

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: A public DRAM model may expose refresh windows and row-buffer state while an LLM traffic trace exposes repeated KV/weight accesses.
- Intended source role: `ANCHOR`.
- Idea sketch: Compile a semantics-preserving placement-and-issue transformation that places a fixed tensor tile on bank/row alternatives selected for its predicted refresh overlap. The claim would be restricted to avoiding an otherwise unavoidable refresh–row-miss coincidence, not to generic request reordering.
- Conclusion-first test: At most, a compiler can reduce refresh-caused row-buffer disruption for a fixed LLM memory-access program under a frozen DRAM/PIM contract; it matters only if a public carrier exposes both placement freedom and the timing event.
- Counterfactual / risk: If no carrier permits the placement action, this is a generic address-mapping or controller-tuning shell.
- Evidence needed: current simulator refresh semantics, a PIM/DRAM placement interface, and a versioned LLM traffic carrier.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-02

- Engine / perspective: `PROBLEM_REFRAMING` / `MEASUREMENT_REVIEWER`
- Starting anchor: Refresh policy effects may be hidden when only aggregate latency is reported.
- Intended source role: `ANCHOR`.
- Idea sketch: Define a reproducible measurement characterization of when row-buffer locality and refresh phase interact in LLM-shaped traces, including a counterfactual no-refresh/reference policy. This is a measurement paper only if the estimand is not already emitted by the public simulator and the trace corpus is natural rather than synthetic.
- Conclusion-first test: The most cautious result is a stable, workload-level interaction law and a diagnostic method, not a new scheduler.
- Counterfactual / risk: A simulator statistic or a hand-made trace would collapse this to dashboard instrumentation.
- Evidence needed: current statistics interface, public LLM trace provenance, and a nontrivial cross-platform estimator.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-03

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`
- Starting anchor: PIM command streams can have bank-local timing constraints that differ from ordinary host request scheduling.
- Intended source role: `CURRENT`.
- Idea sketch: For a fixed PIM kernel command stream, choose legal bank-group assignment/segmentation to retain row locality across mandatory refresh boundaries without changing arithmetic, precision, or output. It would need an explicit PIM command carrier whose current controller does not already make the same choice.
- Conclusion-first test: The claim is a same-function command-layout algorithm with full timing and capacity cost, not a controller parameter sweep.
- Counterfactual / risk: If action is simply FR-FCFS order selection or if changing bank allocation changes the object, it is not admissible.
- Evidence needed: official command legality, current controller path, and a public LLM PIM workload.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-04

- Engine / perspective: `NEGATION_OR_INVERSION` / `OPERATOR`
- Starting anchor: Existing refresh managers may prioritize deadline legality and schedulers may prioritize row hits independently.
- Intended source role: `CONTRARY`.
- Idea sketch: Test whether a public simulator's separated refresh manager and row-hit scheduler create a deterministic avoidable conflict for LLM traffic. If true, a bounded co-decision action could be proposed; if the current scheduler already observes refresh readiness or the effect is parameter-only, terminate it.
- Conclusion-first test: At most, a precisely specified co-decision prevents a demonstrated controller-policy conflict on a natural carrier.
- Counterfactual / risk: It is likely already a generic memory-controller scheduling problem.
- Evidence needed: current source symbols/configuration and an official baseline policy description.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-05

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting anchor: Refresh deadlines create periodic unavailable intervals; row-buffer reuse has a finite reuse distance.
- Intended source role: `ESCAPE`.
- Idea sketch: Establish a sufficient condition under which a fixed bank/row trace admits a legality-preserving phase shift that is guaranteed not to increase ACT/PRE count under refresh. A theory route is viable only if it has a public trace/spec carrier and exposes a nontrivial decision variable beyond phase tuning.
- Conclusion-first test: A formal condition would characterize a restricted, checkable class rather than promise global performance improvement.
- Counterfactual / risk: If the phase is fixed by the controller or the theorem is merely a restatement of DRAM timing, it has no paper-shaped residual.
- Evidence needed: formal timing contract, a concrete action variable, and falsifying public traces.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-06

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: A compiler may have freedom to chunk an invariant LLM decode sequence while preserving outputs and request order at the API boundary.
- Intended source role: `NATURAL_CARRIER`.
- Idea sketch: Select chunk boundaries that avoid issuing a row-sensitive PIM/DRAM microprogram immediately before a mandatory refresh, while accounting for exposed latency and command overhead. This survives only if a public current frontend has such chunking freedom and fixed semantics; otherwise it is generic batching.
- Conclusion-first test: The result would be a target-aware lowering choice for one public artifact with a no-worse semantic contract.
- Counterfactual /risk: API-visible delay, changed batch semantics, or absent command-level carrier invalidates the same-object premise.
- Evidence needed: exact LLM frontend source/trace, lowering interface, and source-level current collision check.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-07

- Engine / perspective: `ABSTRACTION_LADDER` / `MAINTAINER`
- Starting anchor: Current public simulators may accept traces but not preserve enough operation identity to attribute refresh-row-buffer interaction.
- Intended source role: `ANCHOR`.
- Idea sketch: Add an operation-identity trace schema and checker that links LLM operator segments to timing events, with an independently replayable estimator. It is a compiler/tool candidate only if existing trace formats cannot carry equivalent tags and a real LLM trace producer can emit them without synthetic reconstruction.
- Conclusion-first test: A reusable diagnostic artifact could make a previously uncheckable same-object timing question falsifiable.
- Counterfactual / risk: If annotations are metadata-only or a current format already accepts user fields, it is routine plumbing.
- Evidence needed: current trace schema/reader, public producer, and contrary tool search.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S106-08

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `END_USER`
- Starting anchor: Public PIM simulator models may expose per-bank refresh but have no current LLM-shaped source carrier.
- Intended source role: `NATURAL_CARRIER`.
- Idea sketch: Reproduce a real LLM GEMV/KV trace at the address-command boundary and ask whether refresh-induced row-buffer loss changes an application-facing token latency distribution. It is admissible only as a benchmark/measurement object if the source traffic is public, versioned, and retains the native workload semantics.
- Conclusion-first test: The careful conclusion is an evidence-backed benchmark gap, not a general LLM performance claim.
- Counterfactual / risk: A hand-authored microtrace or isolated GEMV command sequence is not a natural carrier.
- Evidence needed: public trace/profiler artifact, simulation adapter, and existing benchmark coverage.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative |
|---|---|---|---|---|
| PIM placement/layout | S106-01, S106-03 | refresh and row-buffer interaction | tensor placement vs command bank assignment | S106-03 |
| controller boundary | S106-04, S106-05 | refresh deadline and row locality | empirical co-decision vs restricted theorem | S106-04 |
| compiler/carrier | S106-06, S106-07, S106-08 | LLM operation identity reaches DRAM/PIM timing | chunking, schema, benchmark | S106-06 |
| measurement | S106-02 | interaction estimand | diagnostic rather than action | S106-02 |

## Coverage-constrained convergence

| Selected seed | Why preserved | Intended boundary | RQ Candidate ID |
|---|---|---|---|
| S106-03 | only same-function PIM command-layout action | PIM command contract; bank-local timing | RQ-S106-01 |
| S106-04 | direct contradiction test against current controller | refresh manager × row-hit scheduler | RQ-S106-02 |
| S106-06 | compiler-level semantic boundary | LLM lowering chunk vs API semantics | RQ-S106-03 |
| S106-02 | measurement contribution path | natural trace interaction estimand | RQ-S106-04 |
| S106-07 | tool/trace-schema alternative | producer-reader operation identity | RQ-S106-05 |
| S106-08 | natural-carrier necessity test | LLM trace → timing model fidelity | RQ-S106-06 |
| S106-05 | non-empirical escape hatch | phase-shift action/theorem | RQ-S106-07 |

S106-01 is contained by the more specific S106-03 and remains backlog. No seed is a locator or a candidate claim.

## Advisory

- Engines used: 6
- Perspective roles used: 7
- Largest object/surface share: PIM/DRAM command timing (3/8)
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 该池覆盖动作、测量、理论和载体四条路线；任何没有公开同对象载体或仅是通用控制器调度的路线均会在 RQ/closure 前淘汰。
