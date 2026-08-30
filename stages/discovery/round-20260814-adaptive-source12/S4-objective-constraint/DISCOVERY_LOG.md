# S4 Source12 — Measurement / Characterization and Benchmark-Dataset Screen

Assignment `DISCOVERY-S4-20260814-ADAPTIVE-SOURCE12`; canonical method `V8_7_POTENTIAL_READINESS_SEPARATED`; claim-pack mode `OFF`.  This is a bounded, source-only review dated 2026-08-14.  `MEASUREMENT_CHARACTERIZATION` and `BENCHMARK_DATASET` were admitted as independent contribution types; no algorithmic action was required.  A proposed protocol nevertheless had to freeze a natural population, estimand, sampling/confounds, denominator, fair current comparator, held-out falsifier, full cost, and a consequence capable of changing a ranking, conclusion, or design constraint.

No benchmark or collection was run.  Statements below distinguish official documentation about existing measurement controls from an unmeasured, prospective characterization law.

| Raw screen ID | Family / independent-paper shape considered | Current primary evidence and strongest comparator | Admission result |
|---|---|---|---|
| R1 | `ANDROID_MACROBENCHMARK_COMPILATION_STATE_RANKING_VALIDITY` — dataset/protocol on app-startup ranking conditional on compilation and startup state | Current Android Macrobenchmark exposes `CompilationMode`, `StartupMode`, repeated measurement, JSON/traces, and explicitly cautions against emulators.  API docs state `Full` is generally not representative of modern end-user experience and can add load/I-cache cost; default is platform-dependent. | `NOT_ADMITTED_UNFROZEN`: an eligible claim could be a versioned open-app/device matrix with a prespecified state-stratified estimand and held-out applications, but this screen did not freeze the natural app sample, devices, sampling, reversal threshold, or a nontrivial consequence beyond the documented control surface. |
| R2 | `SPEEDOMETER3_INTERACTION_CLASS_RANKING_VALIDITY` — characterization of browser ranking sensitivity to natural interaction classes | Speedometer 3 is an open, multi-stakeholder browser benchmark using TodoMVC, editor, chart and news-site interaction workloads; its own methodology notes that user input cannot be fully emulated and it lengthens operations for timing precision. | `NOT_ADMITTED_UNFROZEN`: no versioned browser/build panel, scorer/estimand, treatment of cache/thermal/power confounds, stable reversal law, held-out workload family, or evidence-changing conclusion was frozen.  A generic rerun/dashboard is insufficient. |
| R3 | `LLVM_LNT_FULL_COST_COMPILE_RUNTIME_RANKING` — compiler evaluation protocol combining compile time, RSS, code size and runtime | Current LLVM LNT tracks per-machine/per-test/per-metric samples.  Its Compile suite already includes wall/system/user compile time, compile memory and code size; its test instructions prescribe repeat samples, CPU pinning and thermal/turbo controls. | `EXCLUDED_SOURCE10_IDENTITY`: this is the prior LLVM test-suite/LNT compiler-evaluation family, not a new Source12 opportunity. |
| R4 | Android Macrobenchmark startup-mode selector | The current API already represents `COLD`, `WARM`, `HOT`, compilation modes and measurement parameters. | `STRUCTURAL_DROP__EXISTING_CONFIGURATION_SELECTOR`: choosing a mode or JSON field is neither a benchmark-validity gap nor an independent characterization contribution. |
| R5 | Browser benchmark reporting dashboard | Existing benchmark scores/reports do not by themselves supply a law, sampling design, or consequence. | `STRUCTURAL_DROP__DASHBOARD_OR_REPORTING_ONLY`. |
| R6 | LLVM test-suite `compare.py` aggregate metric ranking | Official documentation already supports compile-time, code-size and runtime comparison; taking a different aggregation without a natural validity gap is metric restatement. | `STRUCTURAL_DROP__MERE_METRIC_RESTATEMENT`. |

Counts: `RAW_SCREEN_ROW_EVENT=6`; `UNIQUE_OPPORTUNITY_FAMILY=3` (R1–R3); `CANDIDATE_GRADE_DEEP_REVIEW=2` (R1–R2); `STAGE0_BRIEF=0`; `PROPOSE_STAGE0=0`.

## Deep-review closure outcome

R1 has an authentic measurement-risk substrate: current Android documentation itself fixes compilation state, startup state, physical-device and tracing caveats.  It did **not** supply the required natural population or a measured ranking reversal.  Its Stage-A-style falsifier would be a held-out app/device stratum in which a prespecified state-conditioned ranking remains unchanged; that route cannot be made claim-ready without first freezing public application releases, device/OS strata, weighting, and the full collection denominator.  R2 has a public natural workload suite and clear emulation boundary, but lacks the corresponding versioned browser panel and causal/measurement contract.  Neither is rejected for missing implementation, results, hardware, resources, or AI readiness.

The correct final state is therefore `COMPLETE_ZERO_PROPOSALS`: no clean independent measurement or dataset brief was made.

## Primary-source search record

- Android Developers, [Write a Macrobenchmark](https://developer.android.com/topic/performance/benchmarking/macrobenchmark-overview), current page accessed 2026-08-14: target setup, output artifacts, compilation/startup controls and physical-device warning.
- Android Developers, [CompilationMode API](https://developer.android.com/reference/androidx/benchmark/macro/CompilationMode), last updated 2026-07-01: default and nondefault compilation semantics and representativeness caveat.
- BrowserBench, [Speedometer 3 methodology](https://www.browserbench.org/Speedometer3.0/about.html), accessed 2026-08-14: workload composition and emulation/timing limitations.
- LLVM, [LNT Concepts](https://llvm.org/docs/lnt/concepts.html) and [Running Tests](https://llvm.org/docs/lnt/tests.html), current docs accessed 2026-08-14: metric schema and explicit noise-control guidance.

Search boundary: official project documentation plus assignment and preceding-identity exclusions.  This is `SEARCH_BOUNDED_OPEN`, not a global novelty claim.
