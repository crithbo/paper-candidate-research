# Discovery Divergence Seed Pool

离线非证据 seed；未检索、下载、构建、实验或读取禁止输入。

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260824-SOURCE107-SINGLE-GPU-LLM-SOFTWARE-V1` / `DISCOVERY_S4`
- Seed ceiling: `<=12`; actual: `12`
- Generation before evidence lookup: `YES`
- Forbidden CRFEPOCH/group inputs: `NOT_USED`

| ID | Engine | Public anchor candidate | Frozen idea / earliest falsifier |
|---|---|---|---|
| S4-107-01 | CONSTRAINT_MANIPULATION | vLLM torch.compile cache docs | A compile-cache hit may improve readiness yet reserve memory that changes steady-state SLO; is there a same-object boundary action? Falsifier: current docs/model already expose equivalent choice. |
| S4-107-02 | ABSTRACTION_LADDER | PyTorch Inductor dynamic-shape documentation | Does dynamic-shape compilation need a cold-to-steady cost contract that changes specialization policy beyond ordinary autotuning? Falsifier: native compiler policy already spans same information/action. |
| S4-107-03 | PROBLEM_REFRAMING | vLLM startup benchmark/sweep | Can a startup benchmark distinguish model-load, profiling, compile and graph-capture readiness with a deployable decision threshold? Falsifier: native startup/sweep already provides the same endpoint. |
| S4-107-04 | BISOCIATION_STRUCTURAL_TRANSFER | CUDA graph capture benchmark | Treat warm-up as inventory investment: can a fixed memory reservation certificate decide compile/capture readiness vs steady SLO? Falsifier: same contract is current configuration. |
| S4-107-05 | NEGATION_OR_INVERSION | public LLM serving benchmark | If cold-start is excluded, does a published steady-state ranking survive a reproducible first-request budget? Falsifier: benchmark formally controls both. |
| S4-107-06 | ADJACENT_POSSIBLE_OR_BOUNDARY | torch.compile cache artifact | Are compiler cache invalidation causes a natural, versioned deployment regime rather than maintenance trivia? Falsifier: no request/SLO decision changes. |
| S4-107-07 | JANUSIAN_TENSION | vLLM chunked prefill + compile docs | Better graph capture may favor stable shapes while requests need dynamic shapes; seek a finite specialization threshold, not a generic fallback. Falsifier: existing dynamic path covers same threshold. |
| S4-107-08 | COMPOSE_DECOMPOSE_SIMPLIFY | PRIVATE_TOOLCHAIN/vLLM benchmark boundary | Can compiler/library-level and invocation-level benchmarks be composed without double-counting host/runtime costs? Falsifier: existing comparative harness has same denominator. |
| S4-107-09 | CONSTRAINT_MANIPULATION | public startup trace | Does first request include tokenizer/model/cache initialization under a canonical single-GPU contract? Falsifier: trace schema already declares it. |
| S4-107-10 | ABSTRACTION_LADDER | PyTorch compile profiling | Can compile-phase trace predict only those compile work items that alter a finite SLO decision? Falsifier: it is just profiling visualization. |
| S4-107-11 | BISOCIATION_STRUCTURAL_TRANSFER | vLLM cache persistence docs | Is warm cache reuse a reproducibility confound only when a specific cache key shares state across a defined workload? Falsifier: current benchmark resets/records it. |
| S4-107-12 | PROBLEM_REFRAMING | public parameter sweep | Do failed compile/specialization cases censor a SLO feasibility frontier in a way that admits a certificate action? Falsifier: sweep already reports same failures and decision. |

## Coverage-constrained convergence

| Selected seed | Distinct surface | RQ ID |
|---|---|---|
| S4-107-01 | compile-cache memory/readiness tradeoff | S4-107-RQ01 |
| S4-107-02 | dynamic-shape specialization policy | S4-107-RQ02 |
| S4-107-03 | startup phase decision endpoint | S4-107-RQ03 |
| S4-107-07 | capture-vs-dynamic-shape threshold | S4-107-RQ04 |
| S4-107-11 | cache state benchmark validity | S4-107-RQ05 |

S4-107-04、05、06、08、09、10、12 进入非证据 backlog。`DIVERGENCE_COVERAGE_ADVISORY=PASS`；本池不声称现有 runtime 缺口或新颖性。
