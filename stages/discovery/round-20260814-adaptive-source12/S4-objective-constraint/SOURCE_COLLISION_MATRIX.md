# Source12 Measurement / Dataset Source and Collision Matrix

The assignment permits a measurement-characterization or benchmark-dataset contribution without an algorithm.  The fair comparator is therefore the current protocol/dataset and its full measurement contract, not an imagined optimized system.  No unmeasured effect is stated as established.

| Family | Exact population / estimand | Current comparator and documented union | Confounds, denominator and falsifier required | Consequence required for a paper | Disposition |
|---|---|---|---|---|---|
| Android Macrobenchmark compilation-state validity | Versioned open Android app releases; release-equivalent startup latency or frame-time distribution conditional on device/OS, compilation and startup state | Macrobenchmark `measureRepeated`; `CompilationMode` default/Full/Partial/None/Ignore; `StartupMode` cold/warm/hot; physical device; JSON and trace artifacts | Device/OS/thermal/background/process/profile/cache state; collection/build/install/compile/run/trace-analysis cost; held-out apps/devices must falsify a prespecified reversal threshold | Demonstrate that an accepted state-conditioned protocol changes a claimed app ranking or invalidates a previously pooled conclusion | `NOT_ADMITTED_UNFROZEN` |
| Speedometer 3 interaction-class validity | Versioned browser builds on defined Speedometer application interaction classes | Current Speedometer workload suite and score procedure | Browser revision/flags, host/thermal/power/cache, trial allocation and score transform; held-out application class; browser-build/run/analysis cost | Show a stable class-conditioned ranking law that changes a browser conclusion or fair design constraint | `NOT_ADMITTED_UNFROZEN` |
| LLVM LNT full-cost compiler ranking | LLVM test-suite/compiler revision and defined machine context | LNT’s NTS and Compile suites already capture runtime, compile time, compile memory and code size; guidance covers repetitions, pinning and frequency/thermal controls | Existing full-cost-like metric union and anti-noise protocol; would need a distinct natural validity gap and held-out falsifier | A new claim cannot be an alternate metric aggregation alone | `EXCLUDED_SOURCE10_IDENTITY` |
| Android state-mode picking | One app run under a chosen mode | Existing Macrobenchmark configuration API | N/A — selection has no new estimator or dataset | None: a configuration choice is not a measurement paper | `STRUCTURAL_DROP` |
| Browser score dashboard | Displayed benchmark results | Existing report surface | N/A | None: reporting only | `STRUCTURAL_DROP` |
| LLVM aggregate comparison | Existing LNT/test-suite result file | Existing `compare.py` metric comparisons | N/A | None: a restated metric is not a validity gap | `STRUCTURAL_DROP` |

## Current-source reality check

Android's current documentation is affirmative, not an absence claim: it documents benchmark state controls and warns that emulators are unrepresentative; `CompilationMode.Full` is generally not representative on current user devices and may change loading/I-cache cost.  Those facts motivate a possible protocol study, but do not establish that a particular natural app ranking reverses.  BrowserBench documents its workload choices and emulation limitations, again without proving an empirical reversal.  LLVM LNT documents a broad existing measurement/action union, hence the Source10 identity is not resubmitted.

## Rescreen gate

Before any future admission, a candidate must first commit a versioned public carrier, target population, estimand, sampling and confound controls, full collection-to-analysis denominator, accepted comparator, threshold, held-out falsifier and an outcome-changing consequence.  A dashboard, new metric name, aggregation choice, state selector, or benchmark availability alone fails the independent measurement/dataset type contract.
