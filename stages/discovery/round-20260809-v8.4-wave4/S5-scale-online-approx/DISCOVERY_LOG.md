# DISCOVERY-S5-20260809-V8.4-WAVE4 — Discovery Log

**Assignment date / evidence cutoff:** 2026-08-09  
**Lens:** O5 — scale, online operation, approximation, and dynamic data structures  
**Method in use:** accepted and calibrated production Discovery method v2 / selection v8.1 only. The TLS-blocked two-axis v8.2r2 method was neither used nor invoked.  
**Decision:** `ZERO_PROPOSALS` — no `PROPOSE_STAGE0` emitted.

## Scope and exclusions

This pass deliberately did not revisit Wave 2/3 objects: dynamic sparse/KV state, sliding-window quantiles, or online quantization. It also did not reopen terminal candidates or the currently blocked S5 occupancy direction. The object had to be a CPU-executable algorithm, representation, or complexity improvement rather than a controller, checker, parameter policy, or dataset substitution.

## Search protocol

Three independent passes were applied to each seed:

1. **Genealogy / seed distance.** Read the original paper or official proceedings page and identified whether the central representation/action already supplies the apparent contribution.
2. **Same-object competing mechanism.** Named the current direct subtractor and the minimum fair baseline union; a static/offline method was retained only as a ceiling, never a deployment baseline.
3. **Artifact, natural-input, and executable route.** Looked for an official artifact/source and a public natural trace/corpus able to support a 20–50-instance CPU Stage-A falsifier.

Only first-party sources were used: author preprints and official conference/project pages. Search results were treated as locators, not evidence.

## Seeds inspected

| Seed family | Exact object considered | Natural input / plausible finite killer | Outcome |
|---|---|---|---|
| Dynamic IPv6 LPM | Online update-and-lookup representation for IPv6 forwarding information bases, measured jointly on lookup latency, update latency, memory, and rebuild/RCU cost | Public routing-table snapshots plus update streams are plausible, but this pass did not establish a first-party trace/artifact and a non-derivative representation beyond current LPM structures | `DROP_INSUFFICIENT_GROUNDED_RESIDUAL` |
| Splitless streaming sketches | CPU-resident approximate per-flow sketches with changing resource budget | Packet traces are natural, but the apparent action is resource placement/transfer; the current competitive family already makes it a deployment policy/controller problem | `DROP_POLICY_WRAPPER` |
| Out-of-core all-distances sketches | Dynamic maintenance of approximate graph-neighborhood sketches under edge updates | Temporal graph streams are plausible, but no frozen update model, error contract, and same-object baseline union was found without simply asserting future work beyond the static ADS design | `DROP_INSUFFICIENT_GROUNDED_RESIDUAL` |
| Incremental compiler equivalence | Reuse of equality-saturation state across related compiler transformations | MLIR/PolyBench-style corpora are natural, but the output is an equivalence validator/checker rather than a new optimization, representation, or complexity result | `DROP_CHECKER` |
| Compiler phase ordering | Choosing optimization passes under changing budgets | Benchmark suites exist, but the proposed action is a phase-selection controller; no admissible non-controller core object remains | `DROP_POLICY_WRAPPER` |
| Dynamic sketch placement | Reassigning sketches across heterogeneous changing resources | Natural packet streams exist, but the object is explicitly an online placement/allocator controller and would violate this lane's prohibition | `DROP_POLICY_WRAPPER` |

## Calibration and current evidence boundary

The result is a bounded-open Discovery result, not a statement that the research areas are exhausted. In particular, PlanB is a strong present-day subtractor for static IPv6 LPM, but it does not itself prove that every dynamic LPM representation is impossible. Conversely, the absence in this pass of a frozen update semantics, direct subtractor union, official trace/artifact, and finite falsifier means that proposing “add updates to PlanB” would be an ungrounded renaming rather than a Stage-0-ready mechanism.

No result, implementation, or experiment was run. No Stage 0/A/B directory was created.

## Why no brief was created

Neither surviving non-policy seed cleared all of the following at once:

- a distinct N1/N2/N3 contribution rather than “make the static method online”;
- a fixed same-object comparison set containing the best current deployable mechanism;
- a full-cost account including rebuild/update and memory amplification;
- a public natural workload and 20–50-instance Stage-A killer that could reject the mechanism quickly.

Creating a brief under those conditions would overstate novelty and readiness. This is therefore an intentional zero-proposal completion, not a resource, implementation, or AI-readiness rejection.

## Source ledger (first-party)

1. Zhang et al., **PlanB: Efficient Software IPv6 Lookup with Linearized B+-Tree**, NSDI 2026, official proceedings/paper page: <https://www.usenix.org/conference/nsdi26/presentation/zhang-zhihao>.
2. Yin et al., **HEC: Equivalence Verification Checking for Code Transformation via Equality Saturation**, author preprint, 2025: <https://arxiv.org/abs/2506.02290>.
3. Chen et al., **SketchPipe: Toward Accurate Sketch-based Network Measurement on Multi-Pipeline Switches with Splitless Sketch Placement**, official NSDI 2026 technical sessions: <https://www.usenix.org/conference/nsdi26/technical-sessions>.
4. Agarwal et al., **HeteroSketch: Coordinating Network-wide Monitoring in Heterogeneous and Dynamic Networks**, official NSDI 2022 technical sessions: <https://www.usenix.org/conference/nsdi22/technical-sessions>.
5. Yang et al., **Oasis: An Out-of-core Approximate Graph System via All-Distances Sketches**, official FAST 2025 technical sessions: <https://www.usenix.org/conference/fast25/technical-sessions>.
6. MileStone, **A Multi-Objective Compiler Phase Ordering Framework for Graph-based IR-Level Optimization**, author preprint, 2026: <https://arxiv.org/abs/2605.23435>.
