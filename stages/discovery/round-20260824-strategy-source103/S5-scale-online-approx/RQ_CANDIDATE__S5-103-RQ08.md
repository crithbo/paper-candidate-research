# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S5-103-RQ08`
- Discovery lane / assignment: `DISCOVERY_S5` / `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S5-103-08` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: canonical edge inference benchmark transition-cost measurement.
- Exact public anchor and version/date: MLPerf Tiny or an open mobile inference benchmark; version to be frozen from primary source.
- Stable object and immutable guarantee envelope: benchmark-defined task, backend configuration and transition-cost estimand.
- Decision-relevant counterfactual consequence: benchmark ranking changes after charging a named initialization/fallback/reset cost.
- Single anchor question: does the public benchmark/runtime expose reproducible transition events and a defined decision threshold?
- Co-defined field bundle to close: `carrier / estimand / falsifier`.
- Contribution type hypothesis: `MEASUREMENT_CHARACTERIZATION`

## Candidate research questions

1. On a version-frozen canonical edge-inference benchmark with a stated backend transition event, does adding a pre-registered full-cost transition estimand produce stable, reproducible ranking reversals that change a concrete backend choice?

## Scope and answerability

- In scope: canonical benchmark-only carrier, transition events, ranking function, full-cost denominator and held-out falsifier.
- Out of scope: natural fleet-wide thermal generalization, dashboard construction and unsupported device claims.
- Candidate methodology or evidence route: `MEASUREMENT_MECHANISM`.
- Minimum public carrier/oracle route: benchmark harness plus reproducible transition hook/artifact.
- Earliest falsifier: benchmark lacks a defined transition event or the proposed quantity is only an arbitrary reporting column.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL`.
- Interesting: `CONDITIONAL`.
- Novelty threat: `MEDIUM`.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL`.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 这是 canonical benchmark validity 路线，不能外推部署结论，先核对 harness 是否能冻结 transition estimand。
- Alternative explanation or null hypothesis to test: 只是常规 latency reporting，不能形成测量机制或改变决策。
- Precommitted primary evidence route: MLPerf Tiny official repository/specification and one supported runtime's public documentation.
- Precommitted fallback route for transport/resource failure only: official release archive.
- Forbidden outcome-aware reformulation: 不得把没有 ranking-reversal endpoint 的结果改写成 dashboard。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `NO`.
- One outcome-independent anchor question: benchmark task/harness contains which reproducible transition event and ranking endpoint?
- Co-defined `carrier/action/estimand` bundle: `benchmark carrier / transition cost / ranking reversal`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: no event/endpoint, existing direct measurement coverage or fixed residual.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Packet result: `NOT_RUN`

## Disposition

- `PRE_RQ_CLOSURE_NOMINATED`

