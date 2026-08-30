# Source109 S1 pre-evidence RQ candidates

All RQs were frozen after the offline seed pool and before external lookup. Each retains its pre-lookup denylist disposition. These records are not raw packages, novelty claims or fallback assertions.

## RQ-S109-01 — TensorRT-LLM paged-context eligibility

- Seed / denylist check before lookup: `S109-01` / `DISTINCT`.
- Tentative public object: a current TensorRT-LLM paged-context attention plugin configuration and its documented runtime contract.
- Stable envelope: exact attention/KV semantics, plugin ABI, engine build, runtime execution and full build/conversion/run cost.
- Primary RQ: Does a current public TensorRT-LLM plugin eligibility condition reject a configuration that an existing plugin path can execute with identical documented paged-context semantics?
- Falsifier: source shows semantic/ABI necessity, existing option covers it, or no native carrier exists.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current TensorRT-LLM plugin docs/source → exact feature test/config → native public LLM carrier → current alternative backend.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S109-02 — TensorRT-LLM low-bit plugin semantic eligibility

- Seed / denylist check before lookup: `S109-03` / `RELATED_ONLY`.
- Related-only discriminator: object=`TensorRT-LLM plugin support contract`; action=`semantic eligibility refinement`; endpoint=`contract coverage`; excludes BitNet/MXFP/Marlin/AWQ repacking or generic low-bit kernel work.
- Stable envelope: exact cache/attention quantization and scale/layout semantics, output tolerance, engine ABI and full cost.
- Primary RQ: Does a current TensorRT-LLM low-bit attention/KV plugin condition exclude an otherwise documented same-semantics configuration for implementation-only rather than semantic reasons?
- Falsifier: support matrix/source makes it semantically unavailable, or action is repacking/configuration tuning.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current support/config source → exact test/reference → public carrier → deployment/alternative plugin contrary source.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S109-03 — feature-conjunction lowering

- Seed / denylist check before lookup: `S109-06` / `DISTINCT`.
- Tentative public object: one TensorRT-LLM attention plugin under a fixed conjunction of cache/mask/position/head features.
- Stable envelope: all documented feature semantics, output, ABI, conversion/dispatch and runtime cost.
- Primary RQ: Is a current plugin conjunction restriction implementation-only, such that a documented backend already permits the same full feature contract through a non-generic lowering action?
- Falsifier: restriction is semantic, existing path is a generic selector, or no native carrier/oracle exists.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: feature matrix/source → backend contract/tests → public LLM carrier → current options and direct prior work.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S109-04 — ORT GenAI export-to-generation semantic contract

- Seed / denylist check before lookup: `S109-02` / `DISTINCT`.
- Tentative public object: ONNX Runtime GenAI graph export and provider generation execution for a named past/present-cache or attention-mask feature.
- Stable envelope: exact ONNX graph, cache/mask/position semantics, public provider, generator API and reference output.
- Primary RQ: Does a current public ORT GenAI artifact make a generation feature claim that lacks a finite graph/reference oracle across the export-to-provider boundary?
- Falsifier: conformance tests already cover it, no explicit feature claim, or test would be a generic ONNX checker.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current ORT GenAI docs/source → exact generator/provider test → public model graph → contrary reference implementation.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S109-05 — provider graph-property certificate

- Seed / denylist check before lookup: `S109-05` / `DISTINCT`.
- Tentative public object: one ORT provider attention optimization with a source-visible graph eligibility predicate.
- Stable envelope: exact graph/protocol, attention/cache outputs, provider ABI and certificate/check cost.
- Primary RQ: Can a finite graph-property certificate admit a public LLM attention graph that current ORT provider feature detection rejects while preserving every documented semantic condition?
- Falsifier: existing feature detection encodes equivalent condition, certificate is metadata plumbing, or no source/oracle is public.
- FINER-lite: Feasible `UNCLEAR`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: provider predicate source → graph/test oracle → public LLM ONNX graph → current capability route.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S109-06 — ORT GenAI cache-ownership negative replication

- Seed / denylist check before lookup: `S109-07` / `DISTINCT`.
- Tentative public object: a current ORT GenAI single-GPU cache-sharing/generation API and its documented ownership behavior.
- Stable envelope: exact generator API, cache ownership/lifetime, request ordering, output and deterministic reference oracle.
- Primary RQ: Does a current documented cache-sharing use permit an alternating single-GPU request sequence whose output or ownership contract cannot be validated by the artifact's tests?
- Falsifier: no such API/claim, tests already cover it, or it requires distributed semantics outside scope.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `UNCLEAR`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: current API/docs → test/lifetime source → public model carrier → reference generator.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S109-07 — exact plugin comparison estimator

- Seed / denylist check before lookup: `S109-04` / `DISTINCT`.
- Tentative public object: one TensorRT-LLM versioned plugin comparison with a stated metric/decision and public benchmark artifact.
- Stable envelope: exact model, request carrier, build configuration, reported denominator and full build/conversion/run cost.
- Primary RQ: Does a public TensorRT-LLM plugin comparison omit an artifact-defined cost that reverses its own same-object semantic-capability ranking under the stated benchmark command?
- Falsifier: no exact comparison claim, full accounting already present, or workload changes object.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `MEDIUM`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: versioned benchmark/doc claim → harness/config source → public carrier → independent full-cost comparator.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## Frozen closure ordering

1. `RQ-S109-01`/`02`/`03`: close current TensorRT-LLM plugin support and feature-contract actions.
2. `RQ-S109-04`/`05`/`06`: independently close ORT GenAI public API/provider oracle availability.
3. `RQ-S109-07`: continue only if a versioned exact comparison claim survives the first closures.

Every RQ retains its denylist outcome. Any later exact-or-contains match is excluded and must not be replaced in this assignment.
