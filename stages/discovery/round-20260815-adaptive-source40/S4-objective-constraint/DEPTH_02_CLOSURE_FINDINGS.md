# SOURCE40_DEPTH_02 closure findings

Scope is limited to the three frozen questions in `SOURCE40_DEPTH_02_NEUTRAL_PACKET.yaml`. No raw admission, brief, novelty, Q2, or state decision is made.

## 1. Exact carrier/version and metric semantics

The deterministic rule pins the first entry on the official 2026 Q1 floating-point-rate results page:

- Carrier URL: `https://www.spec.org/cpu2017/results/res2026q1/cpu2017-20260112-50922.html`
- Artifact identity: `cpu2017-20260112-50922`; ASUSTeK ASUS RS520QA-E13-RS8U, AMD EPYC 9135; floating-point rate result.
- Suite/version: SPEC CPU 2017 v1.1.9; tested 2025-12-05; report generated and originally published 2026-01-27.
- Reported endpoint: SPECrate2017 floating-point base 375 and peak 383. The result index shows energy base/peak as `--`.

Official semantics: SPECrate is copies multiplied by reference-time / system-under-test execution-time, aggregated as a geometric mean using median-of-three or slower-of-two valid runs. Optional v1.1+ energy metrics use measured total energy during the selected performance run and a corresponding geometric-mean ratio. Sources: official result, official overview, and run rules at `https://www.spec.org/cpu2017/Docs/runrules.html#metrics` (checked 2026-08-15).

## 2. Official/current reporting boundary versus frozen full-cost endpoint

The obvious official boundary does **not** appear semantically equivalent to the frozen full-cost estimator:

- The performance endpoint is execution-time throughput, not setup/build/compile/teardown cost.
- Energy reporting is optional and covers energy consumed by the selected performance run; the pinned artifact reports no energy values.
- The rules require reproducible continuous builds and disclose compiler/configuration information, but do not incorporate compilation time, setup time, peak RSS, or teardown cost into the reported performance or energy metric.
- Therefore the official boundary is a strong contrary/comparator, but not an observed full-cost aggregate for this carrier.

Important ceiling: a derived full-cost number would not itself be an official SPEC metric. Public use must respect SPEC fair-use and disclosure rules; official CPU2017 energy metrics cannot be estimated.

## 3. Finite same-object falsifier route

A finite route exists without changing the pinned artifact:

1. Freeze the exact HTML/CSV/config identity above and the v1.1.9 metric definitions.
2. Audit whether the artifact exposes each frozen denominator component: setup, build/compile, execution, energy, peak memory, teardown.
3. Falsify the proposed estimator route if either (a) official semantics already aggregate all components equivalently, or (b) any claim-critical component is unobservable from the fixed artifact and official disclosures.

The current static check supports outcome (b): execution score and detailed build configuration are present, but energy is `--`, and build/setup duration, peak RSS, and teardown cost are not reported as metric inputs. Thus the packet has a finite falsifier, and the pinned carrier alone is insufficient to instantiate the proposed full-cost estimator. Whether a broader same-workload measurement study remains scientifically admissible is intentionally left to the breadth-model canonical disposition.

## Retrieval boundary

Four pre-counted network attempts; official SPEC pages only. No files were downloaded, no benchmark was run, and no external artifact was substituted.
