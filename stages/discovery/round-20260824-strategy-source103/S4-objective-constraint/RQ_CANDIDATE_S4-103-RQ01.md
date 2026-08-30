# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S4-103-RQ01`
- Discovery lane / assignment: `DISCOVERY_S4` / `DISCOVERY-S4-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S4-103-02`; `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: SGLang public online-serving benchmark client.
- Exact public anchor and version/date: `sgl-project/sglang` `docs/developer_guide/bench_serving.md` on `main`, locator observed 2026-08-24; exact commit is a closure field.
- Stable object and immutable guarantee envelope: one public HTTP serving benchmark client; request/response semantics and measured timestamps must remain native to the chosen version.
- Decision-relevant counterfactual consequence: whether two same-workload runtime configurations can be fairly ranked for a frozen SLO-driven deployment decision.
- Single anchor question: which timestamps, completions, warm-up handling and denominators does the native benchmark version record for TTFT/TPOT/E2E/throughput?
- Co-defined field bundle to close: `carrier / estimand`.
- Contribution type hypothesis: `BENCHMARK_DATASET` or `MEASUREMENT_CHARACTERIZATION`.

## Candidate research questions

1. Under a frozen single-GPU interactive serving workload and native benchmark semantics, can a full-cost/SLO attainment estimand reveal a reproducible deployment-ranking reversal that aggregate token throughput alone cannot decide?
2. Optional same-object alternative B and the genuine ambiguity requiring it: `NONE`.
3. Optional same-object alternative C and the genuine ambiguity requiring it: `NONE`.

## Scope and answerability

- Selected or merged RQ: primary RQ above.
- Exact phenomenon, decision or estimand being asked about: benchmark-to-deployment ranking validity under an explicit SLO/full-cost contract.
- In scope: one public runtime/harness version, public workload/carrier, a finite configuration set and comparable output semantics.
- Out of scope: cross-cluster disaggregation, private traces, subjective UX score, or a claim that any present benchmark is globally invalid.
- Immutable semantic/quality boundary: same model/output protocol, precision, workload and completion definition across compared configurations.
- Candidate methodology or evidence route: `MEASUREMENT_MECHANISM`.
- Minimum public carrier/oracle route: native JSON/summary output plus a documented timestamp path.
- Earliest observation that could falsify the question's motivating premise: native output already contains a fully specified attainment/full-cost decision metric equivalent to the proposed estimand.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — depends on version-pinned harness and public workload route.
- Interesting: `CLEAR` — benchmark protocol can alter a same-object deployment choice.
- Novelty threat: `HIGH` — goodput/SLO literature is an explicit strongest-threat family.
- Ethical/scope fit: `PASS`.
- Relevant: `CLEAR` — only if the corrected decision remains reproducible and non-generic.

## Pre-evidence selection

- Selected for evidence lookup: `YES`.
- Selection reason in plain Chinese: 保留 benchmark validity 入口，并优先攻击它是否只是已有 goodput/TTFT/TPOT 语义的改名。
- Alternative explanation or null hypothesis to test: 当前 native benchmark 已提供等价全成本/SLO 指标，或任何差异只来自不公平配置。
- Precommitted primary evidence route: 官方 benchmark 文档与同版本源码/CLI 输出字段。
- Precommitted fallback route for transport/resource failure only: 同版本 release tarball 或官方文档快照。
- Forbidden outcome-aware reformulation: 发现无 ranking reversal、已有指标覆盖或配置不公平后，不改为泛化指标论文。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`.
- Exact anchor and stable object/guarantee frozen: `YES`.
- One outcome-independent anchor question: native benchmark 对 TTFT、TPOT、E2E、成功请求和 warm-up 的精确定义是什么？
- Co-defined `carrier/action/estimand` bundle: `carrier + estimand`.
- Named primary sources: `TWO` — official doc and current source locus.
- Known direct fatal: `NO_KNOWN_FATAL`.
- Finite stop condition: 两个一手来源若已完整表达同一 estimand，则 `EARLY_FATAL`；若可定义不变 residual，则 `CLOSED_TO_TYPED_RQ`。
- Requested model route: `TERRA_HIGH_ORDINARY`.
- Frozen nomination timestamp: 2026-08-24.
- Packet result: `UNRESOLVED_BACKLOG` — current benchmark/metric surfaces and goodput literature are strong subtractors, but no non-generic same-object residual was frozen.
- Evidence locators / provenance: official GitHub documentation locator; no scientific interpretation yet.

## Disposition

- `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`
