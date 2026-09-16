# Discovery Divergence Seed Pool

离线、非证据 seed pool；未检索、下载、构建或访问 CRFEPOCH Stage 0/chat、A3 或组内仓库。

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260824-SOURCE106-ACCELERATOR-SOFTWARE-ROTATION-V1` / `DISCOVERY_S4`
- Seed ceiling: `<=12`; actual: `12`
- Generation completed before evidence lookup: `YES`
- CRFEPOCH identity hold: checked against registry only; no exact/contains seed retained.

## Seed records

| ID | Engine | Public anchor candidate | Sketch and earliest falsifier | Preliminary disposition |
|---|---|---|---|---|
| S4-106-01 | `ABSTRACTION_LADDER` | public NVDLA/VTA performance-model artifact | Can model-ready latency omit compiler/host transition cost that changes a same-object deployment decision? Falsifier: native artifact already defines and charges that boundary. | KEEP |
| S4-106-02 | `CONSTRAINT_MANIPULATION` | MLPerf LLM Server/Interactive rules | Can an explicit accelerator compile/cache startup boundary change a canonical scenario decision without changing SUT semantics? Falsifier: rules/current reference already include it. | KEEP |
| S4-106-03 | `PROBLEM_REFRAMING` | public PRIVATE_TOOLCHAIN/MLIR accelerator benchmark artifact | Does an accelerator compilation benchmark need a decision threshold over compile time and runtime rather than a speed table? Falsifier: native benchmark already reports same Pareto action. | KEEP |
| S4-106-04 | `BISOCIATION_STRUCTURAL_TRANSFER` | public GPU kernel/accelerator roofline model | Treat model calibration as a release gate: can a static model certify when it must not select a mapping? Falsifier: current estimator already has same uncertainty/action contract. | KEEP |
| S4-106-05 | `NEGATION_OR_INVERSION` | public open accelerator reference model | If a mapping is optimal under model cost but infeasible under a stated runtime constraint, is this a reproducible benchmark-validity endpoint? Falsifier: tool natively encodes the same feasibility. | KEEP |
| S4-106-06 | `ADJACENT_POSSIBLE_OR_BOUNDARY` | public single-GPU LLM benchmark | Does readiness/cold-warm state interact with accelerator backend selection under a native shared benchmark contract? Falsifier: existing benchmark natively enumerates the state/action. | KEEP |
| S4-106-07 | `JANUSIAN_TENSION` | open dataflow accelerator model | A data-movement saving may create host orchestration overhead; seek a finite crossover certificate, not a new architecture claim. Falsifier: full model already accounts same cost. | KEEP |
| S4-106-08 | `COMPOSE_DECOMPOSE_SIMPLIFY` | canonical accelerator mapping outputs | Can a minimal model-state bundle identify rankings robust to layout/shape changes? Falsifier: only ordinary feature ablation remains. | KEEP |
| S4-106-09 | `CONSTRAINT_MANIPULATION` | public LLM operator benchmark + model | Do explicit shape buckets alter a cost-model decision only because the benchmark carrier hides a transition? Falsifier: native input schema already carries it. | KEEP |
| S4-106-10 | `ABSTRACTION_LADDER` | public performance-model validation paper | Does validation need a decision-regret endpoint rather than aggregate error? Falsifier: direct prior already has same estimator/action. | KEEP |
| S4-106-11 | `BISOCIATION_STRUCTURAL_TRANSFER` | public accelerator simulator trace | Can trace replay distinguish runtime cost from model artifact cost without moving to a different object? Falsifier: trace protocol already specifies both. | KEEP |
| S4-106-12 | `PROBLEM_REFRAMING` | public benchmark sweep | Is a feasibility frontier valid when toolchain compilation failures are censored? Falsifier: current sweep reports failures under same contract. | KEEP |

## Coverage-constrained convergence

| Selected seed | Distinct carrier/action surface | RQ ID |
|---|---|---|
| S4-106-01 | open accelerator model vs runtime boundary | S4-106-RQ01 |
| S4-106-02 | canonical LLM scenario boundary | S4-106-RQ02 |
| S4-106-03 | compiler runtime/compile Pareto endpoint | S4-106-RQ03 |
| S4-106-07 | data-movement/host crossover certificate | S4-106-RQ04 |
| S4-106-12 | failure-censored sweep validity | S4-106-RQ05 |

S4-106-04、05、06、08、09、10、11 保留为非证据 backlog。覆盖为 accelerator-model boundary、canonical scenario、compiler benchmark、full-cost crossover与sweep validity；不构成录取配额。

`DIVERGENCE_COVERAGE_ADVISORY=PASS`；所有 seed 均排除 generic goodput/energy、CRFEPOCH exact/contains 和无 target decision 的 dashboard。
