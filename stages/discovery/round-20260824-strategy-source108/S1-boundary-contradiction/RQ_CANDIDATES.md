# Source108 S1 pre-evidence RQ candidates

These RQs were frozen after offline divergence and before targeted source lookup. They are not raw proposals, claims of an artifact defect, or novelty claims. The assignment's predecessor and terminal identity holds remain excluded without reading prohibited artifacts.

## RQ-S108-01 — paged-KV causal contract replication negative

- Seed: `S108-02`; type hypothesis: `REPLICATION_NEGATIVE`.
- Tentative public object: a current versioned FlashInfer paged-KV attention wrapper and its documented causal/window/ragged semantics.
- Stable envelope: exact wrapper API, cache-page representation, token-position convention, attention output/LSE contract and public reference implementation.
- Primary RQ: Does the current public artifact supply a finite, source-visible oracle that verifies causal/window semantics after page-table reuse and ragged updates, or does a precise untested contract boundary remain that can change a user-visible correctness decision?
- Falsifier: current tests/reference already cover the contract, no stated semantic claim exists, or no native request carrier can exercise it.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current API/docs → exact wrapper/test/reference source → public LLM request carrier → contrary test/implementation search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S108-02 — KV dtype/layout validation boundary

- Seed: `S108-03`; type hypothesis: `MEASUREMENT_CHARACTERIZATION` or `REPLICATION_NEGATIVE`.
- Tentative public object: one versioned FlashInfer KV-cache dtype/layout configuration in a named attention path.
- Stable envelope: exact cache dtype/layout, scaling/quantization behavior, window/causal mode, output tolerance and public request sequence.
- Primary RQ: Does a current public support/validation contract leave a configuration-defined KV precision/layout region whose artifact-level numerical test is not predictive of the stated decode-level decision?
- Falsifier: matrix/test already covers the exact region, no native decode carrier/oracle exists, or endpoint is generic model accuracy.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: versioned support docs/source → exact test and tolerance locus → native public decode carrier → contrary validation.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S108-03 — auxiliary-output oracle coverage

- Seed: `S108-05`; type hypothesis: `THEORY_FORMAL` or `REPLICATION_NEGATIVE`.
- Tentative public object: an exact FlashInfer attention operator with optional LSE/auxiliary output and causal/window/ragged modes.
- Stable envelope: exact operator signature, mask convention, numerical tolerance, reference oracle and output semantics.
- Primary RQ: Is there a finite oracle-equivalence condition for all documented modes of a current public attention operator that is absent from the artifact's validation and whose absence changes a stated support conclusion?
- Falsifier: existing reference tests cover all modes, proposed condition is a routine additional case, or no support conclusion depends on it.
- FINER-lite: Feasible `CLEAR` for source closure; Interesting `UNCLEAR`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: operator API → test/reference locus → documented support matrix → contrary issue/paper/test search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S108-04 — benchmark estimator correction

- Seed: `S108-06`; type hypothesis: `BENCHMARK_DATASET` or `MEASUREMENT_CHARACTERIZATION`.
- Tentative public object: a versioned FlashInfer benchmark harness, its stated metric and a public LLM attention carrier.
- Stable envelope: exact benchmark command/configuration, reported denominator, plan/setup/JIT/cache policy and decision rule.
- Primary RQ: Does a current public artifact benchmark use an estimator that omits an artifact-defined cost component and thereby reverses or invalidates a documented backend/configuration recommendation under the same workload semantics?
- Falsifier: harness already reports the component, no recommendation changes, or the required workload changes object/semantics.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `MEDIUM`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: benchmark source/config → documentation claim → independent public benchmark/carrier → contrary full-cost protocol.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S108-05 — source-visible backend predicate

- Seed: `S108-07`; type hypothesis: `COMPILER_TOOL`.
- Tentative public object: a current attention-artifact backend selection predicate for one exact KV/layout/shape contract.
- Stable envelope: same attention output, cache representation, numerical behavior, ABI and total conversion/dispatch/runtime cost.
- Primary RQ: Does a current source-visible backend predicate reject a case that an already available backend can execute with identical documented semantics and non-worse full cost, leaving a non-generic compiler action?
- Falsifier: predicate protects semantic/ABI legality, current option already exposes equivalent behavior, or action is generic dispatch selection.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: predicate source → backend contracts/tests → native LLM carrier → current-option/contrary search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S108-06 — documented cache-option ranking negative

- Seed: `S108-04`; type hypothesis: `REPLICATION_NEGATIVE`.
- Tentative public object: a versioned llama.cpp KV cache/flash-attention option plus its explicit documentation or artifact-level performance recommendation.
- Stable envelope: exact release/commit, model, request trace, precision/quality setting, option semantics and complete cost boundary.
- Primary RQ: Does a public documented cache/attention recommendation fail to preserve its ranking when evaluated on the exact canonical command and quality/full-cost denominator it specifies?
- Falsifier: there is no recommendation/canonical command, no exact carrier, or result only shows generic configuration sensitivity.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current README/docs/release → benchmark harness/command → public model/request carrier → independent contrary artifact.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## Frozen closure ordering

1. `RQ-S108-01` and `RQ-S108-03`: establish exact FlashInfer semantic/API/test claim and finite oracle.
2. `RQ-S108-04` and `RQ-S108-05`: test for a current benchmark/predicate residual only after the artifact contract is frozen.
3. `RQ-S108-02` and `RQ-S108-06`: continue only if an exact support/recommendation claim plus a native carrier remains.

No optional same-object alternatives were selected. Switching between these contribution types after source results would be outcome-aware reformulation and is prohibited.
