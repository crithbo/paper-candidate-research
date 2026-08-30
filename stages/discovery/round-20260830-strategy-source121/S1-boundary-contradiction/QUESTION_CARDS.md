# Source121 S1 Question Cards

## QC-RQ08 — quantized fallback ranking validity

- Exact public identity: current ExecuTorch `export_llm` quantization/backend configurations, AOT partitioning, `.pte`, ETRecord/ETDump and Inspector events.
- Version/date: current official documentation/source observed `2026-08-30`; Stage 0 must freeze exact tag/commit.
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`.
- Exact object/contract: identical official model, inputs and output-quality threshold compiled under precommitted ExecuTorch quantization/backend configurations; no cross-framework or changed-model substitution.
- Same-object estimand: whether end-to-end ranking between configurations changes when fallback-region and delegate-boundary costs are included, relative to delegated-node/share or delegate-only timing proxies.
- Decision affected: selection of quantization/backend/`extended_ops` configuration for a fixed model and device.
- Contribution type/route: `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`, `N3` with an optional N2 estimator.
- Non-generic discriminator: ExecuTorch-specific mapping from AOT partition records to ETRecord/ETDump events, quantized-vs-fallback regions, and output-gap validation; not a generic profiler dashboard.
- Current locus: official LLM export page shows a fixed `8da4w + XNNPACK + extended_ops` route, delegated/nondelegated tables and ETRecord; Inspector exposes per-event timing and delegation metadata.
- Known direct fatal: `NONE_FOUND_WITHIN_BOUND`; status is `SEARCH_BOUNDED_OPEN`.
- Strongest objection: current Inspector already exposes most observables, so the candidate collapses unless it defines a validated estimand/held-out law that changes configuration ranking.
- Minimum falsifier: on a frozen official-model/configuration panel, full-cost ranking never differs from simple delegated share/delegate timing, and boundary-aware features do not improve held-out ranking prediction.
- Full-cost boundary: export/lowering, initialization, model bytes, delegate and fallback execution, boundary conversion/layout/synchronization, host time, repeated inference, instrumentation overhead, and output-quality validation.
- Finite closure: freeze exact commit and 3-5 official models; pre-register 3-4 quantization/backend configurations; validate source→edge→runtime outputs; collect paired ETRecord/ETDump; attribute boundary/full costs; evaluate ranking reversal and held-out prediction.
- Bounded debt: exact public model/weight availability, current paper/tool collision, instrumentation observer effect, and minimum Q2 breadth. Owner `STAGE0` then `STAGEA_PRECLAIM`; maximum four decisive questions.
- Front-end disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for C0 `YES`.

## Other frozen RQs

| RQ | Disposition | Reason |
|---|---|---|
| RQ01 | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | ONNX schema plus node tests already define the relevant semantics; a coverage-weighted wrapper adds no non-generic action. |
| RQ02 | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | Native tests and schema already expose per-tensor/per-axis/blocked/low-bit cases; no distinct decision endpoint survived. |
| RQ03 | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | ORT provider/source/test surfaces are the direct comparator; no current semantic divergence was established. |
| RQ04 | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | Current QDQ graph transformers already own rewrite legality; without a distinct decision or failure carrier the proposal is an ordinary checker. |
| RQ05 | `EXCLUDED_BEFORE_RAW__GENERIC_SELECTOR` | Producer/selector mismatch reduces to supported-op coverage and configuration enumeration, not a non-generic paper mechanism. |
| RQ06 | `EXCLUDED_BEFORE_RAW__ORDINARY_SUPPORT_GAP` | The exact ONNX-MLIR exclusion is real, but one missing per-axis/int4 implementation is not paper-scale after current supporting backends are considered. |
| RQ07 | `EVIDENCE_QUALIFIED_RAW__MERGED_INTO_RQ08` | Partition/delegation observability is a prerequisite for the RQ08 estimand, not an independent claim. |

No replacement RQ was added after external lookup began.
