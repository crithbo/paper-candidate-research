# Source106 S1 pre-evidence RQ candidates

All cards were selected before any external evidence lookup. They are RQ cards, not raw proposals or novelty claims. The terminal hold `CRFEPOCH-HBMPIM-LLM-GEMV-REV0` and all contains-identities are excluded.

## RQ-S106-01 — PIM command layout

- Seed: `S106-03`; type hypothesis: `COMPILER_TOOL`.
- Tentative public object: a versioned public PIM simulator with a legal command stream for a public LLM-shaped memory operation.
- Stable envelope: fixed arithmetic, precision, output and public command legality; only bank-group/layout choice may vary.
- Primary RQ: Can a semantics-preserving bank-group/layout transformation reduce refresh-associated row-buffer disruption for a fixed public LLM PIM command stream without increasing command, capacity, or exposed-latency full cost?
- Falsifier: the carrier has no layout action, current source already covers it, or the action is ordinary controller scheduling.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current simulator/PIM source → official timing specification → public LLM command/trace carrier → contrary current-controller search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S106-02 — controller co-decision

- Seed: `S106-04`; type hypothesis: `METHOD_ALGORITHM`.
- Tentative public object: a current open DRAM controller model with explicit refresh manager and row-hit scheduler, exercised by a versioned LLM traffic trace.
- Stable envelope: same trace, DRAM standard, QoS/deadline legality, request service semantics and full controller cost.
- Primary RQ: Does a current public controller expose a refresh–row-hit co-decision gap that a bounded policy can close without weakening refresh legality or merely retuning an existing scheduler?
- Falsifier: refresh readiness is already included in current scheduling, no natural LLM trace reaches the model, or action reduces to parameter tuning.
- FINER-lite: Feasible `CLEAR` for static source closure; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: official current controller source/configuration → documentation → public LLM traffic carrier → direct-coverage matrix.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S106-03 — lowering chunk boundary

- Seed: `S106-06`; type hypothesis: `COMPILER_TOOL`.
- Tentative public object: a source-visible LLM frontend/lowering path targeting a public DRAM/PIM timing carrier.
- Stable envelope: fixed API request, outputs, precision, ordering/SLO semantics and command full cost.
- Primary RQ: Can a target-aware compiler choose output-equivalent LLM lowering chunk boundaries that avoid a mandatory refresh/row-buffer conflict without changing API-visible batching semantics?
- Falsifier: no lowering freedom exists, no exact timing carrier exists, or action is generic batching.
- FINER-lite: Feasible `UNCLEAR`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: public frontend source + source-visible timing adapter + current collision search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S106-04 — interaction measurement law

- Seed: `S106-02`; type hypothesis: `MEASUREMENT_CHARACTERIZATION`.
- Tentative public object: natural, versioned LLM memory trace replayed by a public timing model.
- Stable envelope: exact trace identity, replay configuration, event estimator and no inferred deployment extrapolation.
- Primary RQ: Is there a reproducible workload-level interaction between refresh phase and row-buffer locality in a public LLM traffic carrier that is not already available as a simulator statistic?
- Falsifier: trace is synthetic/changed-object, estimator already available, or interaction is not stable beyond ordinary configuration effects.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `MEDIUM`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: simulator stats/source → trace provenance → existing diagnostic/benchmark search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S106-05 — operation-identity schema

- Seed: `S106-07`; type hypothesis: `COMPILER_TOOL`.
- Tentative public object: a current trace producer-reader pair for LLM memory timing analysis.
- Stable envelope: trace replay results and operations unchanged; only provenance/identity representation may be extended.
- Primary RQ: Is there a public source-visible LLM trace pipeline in which operation identity needed to attribute refresh-row-buffer interaction cannot already be represented or recovered by the existing schema?
- Falsifier: existing user metadata/schema suffices, no native producer exists, or tagged trace cannot support a non-routine analysis.
- FINER-lite: Feasible `CLEAR` for source inspection; Interesting `UNCLEAR`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: producer/reader formats → current source symbols → contrary instrumentation search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S106-06 — natural carrier closure

- Seed: `S106-08`; type hypothesis: `BENCHMARK_DATASET`.
- Tentative public object: a publicly released LLM memory traffic artifact that can be replayed without synthetic reconstruction.
- Stable envelope: provenance, version, workload semantics and exact replay adapter are preserved.
- Primary RQ: Does a versioned public LLM memory-traffic artifact preserve enough command/address semantics to quantify refresh-caused row-buffer disruption in a current public DRAM/PIM model?
- Falsifier: no public native artifact, adapter reconstructs rather than preserves semantics, or prior benchmark already supplies the same carrier/estimand.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `MEDIUM`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: public artifact provenance → reader/adapter source → benchmark search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S106-07 — restricted phase theorem

- Seed: `S106-05`; type hypothesis: `THEORY_FORMAL`.
- Tentative public object: an explicit refresh timing contract and fixed bank/row trace.
- Stable envelope: same trace, command legality and no worse ACT/PRE/capacity cost.
- Primary RQ: Under a published refresh timing model, is there a nontrivial checkable class of fixed traces for which a legal phase-shift action avoids a refresh-row-buffer conflict without a controller policy change?
- Falsifier: phase is not an available action, condition is tautological, or no public carrier can instantiate it.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `UNCLEAR`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: official timing contract → current implementation action locus → public trace witness.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## Frozen closure ordering

1. `RQ-S106-02` and `RQ-S106-01`: determine whether a non-generic action exists in current source.
2. `RQ-S106-06`: independently require a natural public LLM carrier.
3. `RQ-S106-03`/`04`/`05`/`07`: only continue if their required carrier/action survives the first two checks.

No optional alternatives were selected: these are distinct objects or contribution types, not same-object variants.
