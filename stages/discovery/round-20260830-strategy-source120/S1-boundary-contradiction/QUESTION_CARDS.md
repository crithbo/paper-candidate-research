# Source120 S1 Question Cards

## QC-RQ02 — versioned VHLO semantic-compatibility witnesses

- Exact public identity: current StableHLO portable-artifact compatibility contract and `stablehlo/tests/vhlo` versioned compendium.
- Carrier kind: `CANONICAL_FORMAL_ORACLE`.
- Problem: the native guarantee is preservation of semantics, while the documented regression suite requires syntactic identity. This can reject benign rewrites and does not directly expose semantic breakage.
- Proposed insight: generate executable, input-bearing witnesses from the versioned compendium, classify assertions by specification-defined exact/tolerance/undefined semantics, and report cross-version plus cross-consumer outcomes under one full-cost ledger.
- Contribution type / route: `BENCHMARK_DATASET` + bounded `COMPILER_TOOL`; `N1/N2`.
- Counterfactual decision: changes whether a version/consumer pair may be accepted as semantically compatible, rather than merely parse-compatible.
- Known direct-fatal check: `NONE_FOUND_WITHIN_BOUND`, after subtracting the official generic “use the interpreter” future-work action.
- Strongest objection: #1245 and the compatibility page already plan semantic reference testing; witness synthesis/oracle taxonomy may be an implementation detail rather than a paper contribution.
- Minimum falsifier: on a stratified set of supported-version compendium entries, the proposed generator yields no additional valid semantic coverage or decision-changing classification over syntactic roundtrip plus a plain interpreter run.
- Finite closure route: freeze a commit/version matrix; define exact/tolerance/excluded oracle classes; construct a small witness per class; compare syntactic roundtrip, plain reference evaluation, and at least two current consumers; account for generation/compile/run/oracle cost.
- Bounded debt: independent recent-paper/current-tool collision, executable witness legality, consumer support matrix, and Q2 benchmark-shape calibration. Owner `STAGE0` then `STAGEA_PRECLAIM`; maximum four decisive questions.
- Front-end disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for C0 `YES`.

## Other RQs

| RQ | Identity relation | Disposition | Reason |
|---|---|---|---|
| RQ01 | `CONDITIONAL_SPECIALIZATION` of RQ02 | `EXCLUDED_BEFORE_RAW / MERGE_AS_STRATUM` | Quantized golden tests are useful exact/tolerance strata, but a standalone backend-independent bit-exact oracle overclaims where numerical accuracy is implementation-defined. |
| RQ03 | `CONDITIONAL_SPECIALIZATION` of RQ02 | `EXCLUDED_BEFORE_RAW / MERGE_AS_NEGATIVE_STRATUM` | Interpreter gaps bound coverage and exclusions; unsupported execution alone is maintenance evidence, not a distinct Q2 claim. |
| RQ04 | current native test union | `EXCLUDED_BEFORE_RAW` | Official ONNX node fixtures already define rounding/saturation cases; no non-generic residual action was located. |
| RQ05 | current native test union | `EXCLUDED_BEFORE_RAW` | Per-axis/low-bit fixture extension is ordinary coverage work without a separately justified benchmark estimand. |
| RQ06 | implementation-specific gap | `EXCLUDED_BEFORE_RAW` | One disabled ONNX-MLIR case has contrary support in ONNX Runtime and does not establish a general mechanism or paper-scale negative result. |
| RQ07 | current benchmark capability | `EXCLUDED_BEFORE_RAW` | PRIVATE_TOOLCHAIN comparative artifacts already carry models and I/O arrays; no new same-workload estimand beyond existing comparison infrastructure was frozen. |
| RQ08 | current pass/fallback union | `EXCLUDED_BEFORE_RAW` | Current quant-to-int/QDQ fallback work directly absorbs the action; no stronger same-object residual was found. |

All seven exclusions are structural dispositions from the frozen carriers, not result-aware reformulations. No replacement seed was added.
