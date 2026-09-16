# SOURCE120-S5-VLLM-CACHE-POLICY-PANEL Stage 0 Report

## 中文摘要

- 结论：`STOP`。
- 为什么：当前 vLLM 确实原生提供 CPU/tiered KV offload 的 LRU、ARC 和自定义 policy 接口，研究对象真实；但候选的科学主张已被当前最强研究联合实质吸收。USENIX ATC 2025 已证明 KV-cache eviction 高度依赖 workload，并明确指出 ShareGPT 缺到达时间、Mooncake trace 只覆盖部分真实语义；UniCache 2026 已在 vLLM 上用 LRU/LFU/FIFO/ARC/OPT 等跨 workload、capacity、model 比较并直接展示策略排名变化；2026 ARC 工作又在 synthetic document-QA 与真实 conversation workload 上比较 vLLM LRU/ARC。把相同 panel 搬到新 native offload API 只剩介质/版本复现，没有留下可信 Q2 级 N3 residual。
- 下一道门：无 SENTRY PASS 路由、无 Stage A。若未来要研究 CPU/tiered offload 的新 cost-aware 动作或新保证，必须使用新 ID 重新 Discovery/Stage 0，不能复活本题。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-SOURCE120-S5-VLLM-CACHE-POLICY-PANEL`
- Input freeze SHA-256: `45248E21AF9B4D121E5A8FC98FE1F052446B5DCDCD9C6FABE60A861F7C66C3E1`
- Cross-assignment contamination declaration: `false`
- Scientific verdict: `STOP`
- Operational disposition: `NONE`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.89`
- Evidence ceiling: `STATIC_CURRENT-SOURCE_AND_PUBLIC-COLLISION_REVIEW; NO CANDIDATE RESULT`
- Novelty route: proposed `N3`; rejected after current-union subtraction. No independent `N1/N2/N3` residual remains.
- Candidate Q1 venue family: none retained.
- Stage semantics: conditional paper-potential screen; this report does not establish a performance result.

## Optional process telemetry

- Atomic repair trace mode/artifact path/hash, if assignment-enabled: `SHADOW / NOT_APPLICABLE_STOP_NOT_REVISE`
- Decision effect while nonproduction: `NONE`
- Authorized source activity: 12 bounded web connector calls; no code/artifact download, persistent resource action, build or experiment. Exact network-byte telemetry was unavailable and was not estimated.

## Structural paper potential vs current readiness

- Structural paper potential if successful: the frozen panel could be a useful engineering benchmark for a newly exposed vLLM API, but the decision endpoint and expected phenomenon are already published at stronger trace and evaluation depth.
- Current evidence-acquisition readiness/risk: execution appears feasible on public vLLM and public traces. Feasibility cannot compensate for lack of scientific residual.
- Why missing implementation/results/proof/hardware is not the reason for STOP: the stop is structural novelty/Q2 shape, not missing results or resources.

## Discovery provenance

- Opportunity origins: `O5 / O8`
- Domain tags: `vLLM, KV offload, prefix caching, cache replacement, benchmark validity, workload characterization`
- Paper genealogy: classical ARC → vLLM prefix caching and Mooncake tiered KV cache → production-trace characterization and workload-aware policy → UniCache/ARC cross-workload policy evaluation → current native vLLM offload CachePolicy.
- Discovery method revision: `SOURCE120_EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: not separately frozen in the brief.
- Contribution type and type-contract verdict: `BENCHMARK_DATASET / MEASUREMENT_CHARACTERIZATION`; contract fails because the proposed estimand and qualitative finding are already covered, leaving only a current-version reproduction.
- Independently audited A/C/D/E coordinates: no claim-pack coordinates used.
- Backtest reference and status: not candidate evidence.
- Reminder: method calibration does not supply candidate novelty.

## Frozen object and claim

The exact object is current vLLM CPU/tiered KV offload policy evaluation under exact KV reuse. The frozen endpoint is whether LRU, ARC and one simple frequency/cost policy retain their ranking across prefix-repetition, ShareGPT-derived and Mooncake-timed carriers under equal capacity, information and full cost.

The review preserves this exact object; it does not replace it with semantic response caching, KV compression or approximate attention eviction.

## Claim-package completeness audit

- Atomic action and mechanism: select eviction victims among exact KV blocks identified by vLLM `OffloadKey`; observed policy ranks vary with reuse locality, one-touch pollution and cost structure.
- Information/assumption contract: online policies receive the same past access and request context; Belady/OPT is an offline ceiling only.
- Effect target/output/guarantee: rank stability and decision-reversing loss; exact KV reuse, no output approximation.
- Boundary/failure region/competing explanation: apparent reversals can be caused by carrier timing synthesis, prompt reconstruction, warm-cache contamination, capacity normalization or policy bookkeeping overhead rather than a new workload law.
- Minimum falsifier: stable ranking across all predeclared carriers/capacities. This remains executable but no longer distinguishes the candidate from the current research union.
- Dependencies and evidence ceiling: public current vLLM and public carrier metadata; benchmark-only ceiling.
- Opportunity-family relation audit: the candidate lies inside the already-developed family of workload-dependent prefix/KV cache eviction characterization.
- Independent search identity/scope: current vLLM source/docs, current GuideLLM carrier semantics, Mooncake, USENIX ATC 2025, UniCache/SIGMETRICS 2026, recent vLLM ARC work and generic ARC.
- Evidence-ledger integrity and contradiction disclosure: no candidate outcomes were observed. Search statements are bounded, not global-first claims.

## Positive opportunity map

- Natural workloads: no fully natural public panel of all required fields was established. ShareGPT supplies conversation content but not submission times; Mooncake supplies timestamps and prefix hash topology but replay tools generate synthetic token prompts.
- Observed or expected cost/headroom: current vLLM exposes a new native offload policy seam, so engineering evaluation is easy to motivate. This is implementation readiness, not a new scientific opportunity.
- Mechanism-specific prediction: workload/carrier composition changes recency/frequency structure and therefore policy ranking. This exact qualitative mechanism is already established by UniCache and production-trace characterization.

## Named baselines and fairness contract

1. Native vLLM CPU offload LRU.
2. Native vLLM CPU offload ARC.
3. UniCache's vLLM panel: FIFO, LRU, LFU, ARC, LeCaR, workload-aware policies and offline OPT across workloads/capacities/models.
4. KVCache Cache in the Wild's production traces and workload-aware vLLM policy.
5. Belady/OPT offline ceiling, charged as privileged-future-information and never compared as an online deployment policy.

Any valid reproduction would require the same model/tokenizer/block size/KV groups, exact block-hash stream, CPU bytes, secondary-tier settings, request arrivals, warmup/reset, store/load bytes, policy overhead, TTFT/TPOT/E2E/goodput and recovered-token denominator. These requirements do not create novelty.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | Current vLLM native offload uses CPU/tiered `CachePolicy`; closest papers primarily target GPU prefix cache or production-wide KV cache | FAIL |
| Same scenario/workload | UniCache and recent ARC work compare policy behavior across synthetic/real workloads; ATC25 compares trace-information classes | PASS |
| Same or weaker information | LRU/LFU/ARC panels use online history; OPT is correctly isolated as offline | PASS |
| Atomic action covered | LRU/ARC/frequency-aware eviction and cross-workload comparison are directly covered | PASS |
| Same/stronger legality, quality and guarantee | Prior work preserves exact prefix-KV reuse and reports hit/latency effects | PASS |
| Same non-worse full-cost boundary | Prior work reports real hit ratio/QTTFT/TTFT but does not isolate current native CPU offload transfer and policy overhead | FAIL |
| Comparable scale/platform/version/config | Prior work spans more traces/models/capacities, but older/different vLLM cache path | FAIL |
| Sufficient full-text/implementation/reproduction depth | UniCache, ATC25, Mooncake and current vLLM source provide strong depth | PASS |

`DIRECT_FATAL`: `NO` because the exact current CPU/tiered object and full-cost boundary are not jointly covered by one work. Nevertheless, the current strongest union leaves no Q2-grade scientific residual.

### Nearest-prior facet matrix

| Prior/current source | Object | Workloads/timing | Policies | Endpoint | Residual effect |
|---|---|---|---|---|---|
| KVCache Cache in the Wild, ATC25'25 | production KV prefix cache, vLLM integration | two production traces; explicitly audits ShareGPT/Mooncake information gaps | LRU and workload-aware policy | workload dependence, hit/latency | directly subtracts carrier-validity and workload-dependence thesis |
| UniCache, POMACS/SIGMETRICS'26 | vLLM prefix cache | seven categories, mixed traces, capacities, models/hardware | FIFO/LRU/LFU/ARC/LeCaR/WA/OPT plus new policy | rank variation, hit ratio, QTTFT | directly subtracts policy-panel and rank-instability thesis |
| Recency/Frequency Adaptive KV Caching, 2026 | vLLM prefix cache | synthetic document QA + real conversation | vLLM LRU vs ARC | hit rate and TTFT | directly subtracts LRU/ARC cross-carrier comparison |
| Mooncake, FAST'25 | distributed DRAM/SSD/RDMA KV cache | real Kimi traces | LRU/global cache scheduling | capacity/SLO/full-system effect | deployment and tiered-cost baseline |
| Current vLLM `4fc943b…` | exact CPU/tiered offload object | no canonical panel result | built-in LRU/ARC + custom policy | native implementation | makes reproduction feasible; does not restore novelty |

### Seed-distance and method-name deletion test

After deleting product and policy names, the claim becomes: “different traces and capacities may reverse the ranking of standard cache replacement policies, so a benchmark should include multiple workload classes.” This is a known cache-measurement result and is directly demonstrated in recent LLM KV-cache literature. The residual fails the deletion test.

## Competing mechanism decision

- Selected mechanism: reuse locality/one-touch pollution varies by carrier.
- Registered backup: transfer-versus-recompute asymmetry in CPU/tiered offload.
- Pivot boundary: making transfer cost drive a new cost-aware action or guarantee changes the frozen measurement claim and requires a new candidate ID. It cannot be used as a repair for this STOP.

## Residual paper kernel

No Q2-grade residual remains. A current-native reproduction may be useful upstream benchmark engineering, but it cannot support a standalone paper at the project's minimum quality line without a new action, estimand or guarantee.

## Evidence route

- `MEASUREMENT_MECHANISM` rejected after collision subtraction.

## Performance-optimization admissibility, if applicable

- Same-function contract: feasible.
- Algorithmic delta: none; only standard/native policies and one routine comparator.
- Full-cost ledger: finite but not novel.
- Strong-implementation fairness: feasible.
- Generality and failure boundary: prior papers are broader than the proposed three-carrier panel.
- Why not routine tuning: it is routine evaluation/replication after subtraction; therefore it does not qualify as a new performance contribution.

## Q1/Q2 paper shape

- Problem: benchmark carrier choice can alter cache-policy selection.
- Contribution: proposed minimal vLLM policy panel.
- Evidence plan: three carriers, capacities, standard policies and full cost.
- Expected paper narrative: already present at stronger depth in ATC25/UniCache/current ARC work; the remaining native-offload reproduction is insufficient for Q2.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: KVCache Cache in the Wild (USENIX ATC 2025), Mooncake (FAST 2025 Best Paper), UniCache (POMACS/SIGMETRICS 2026).
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: no new mechanism, measurement estimand or stable empirical law beyond current literature.
- Evidence-shape gap: proposed public carriers are weaker than ATC25 production traces, and two of three lack natural timing/content jointly.
- Stage A closure plan: none for this ID; a run cannot repair a structural novelty failure.

## Non-relaxable quality audit

- Same-object: well defined and current.
- Latest collision: fails Q2 residual after complete-enough current union.
- Strong fair baselines: identifiable.
- Natural input/evidence: incomplete; ShareGPT timing is synthesized and Mooncake prompt tokens are reconstructed from hash topology.
- Full-cost: finite but not distinguishing.
- Reproducibility: feasible.
- Evidence/claim honesty: no result claimed; STOP is based on structural absorption, not assumed negative performance.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: E1 confirms current policy seams and carrier parsers. E2 was not run and cannot change the novelty decision.
- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.92`
- 72-hour first evidence: technically feasible, scientifically non-decisive after current-union subtraction.
- Human-only items and why they are non-decisive: none; low human dependence does not raise paper quality.

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE`
- Complete action and native semantics are finite and same-object: yes.
- Comparator, denominator, full-cost and small-witness plan: finite.
- Why an unimplemented interface/format/checker is not structurally fatal: interfaces exist; the fatal issue is scientific absorption.
- Reminder: Stage A fidelity closure is irrelevant when Stage 0 has no Q2 residual.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: vLLM visible `main` commit `4fc943b8676e07cfb6be1b7c54cb4f9fba99033e`, reviewed 2026-08-30.
- Current official documentation checked: `docs/features/kv_offloading_usage.md`, current API docs for CPU offload manager/policies, benchmark CLI and GuideLLM trace replay.
- Actual source paths/symbols checked: `vllm/v1/kv_offload/base.py`, `cpu/manager.py`, `cpu/policies/base.py`, `lru.py`, `arc.py`, `factory.py`, `benchmarks/benchmark_prefix_caching.py`.
- Default/non-default flags, thresholds and configurations checked: built-in `lru`/`arc`; external `cache_policy_module_path`; CPU bytes/chunk settings; secondary tiers; request-rate/burstiness; Mooncake timestamp/hash columns.
- Discovery absence claim confirmed, narrowed or contradicted: current policy reality is confirmed. Novelty claim is contradicted/narrowed by current literature.
- If contradicted, current native mechanism and finite configuration-grid baseline: LRU/ARC/custom policy on `OffloadKey = block_hash + group_idx`; UniCache/ATC25/ARC panels are mandatory baselines.
- Any non-tuning residual that remains: none at Q2 level.

## Carrier timing and exact-KV audit

- Prefix repetition: token-controlled synthetic workload; arrivals are benchmark-generated unless explicitly replayed.
- ShareGPT: content/conversation carrier without native submission timestamps; legacy prefix benchmark keeps only the first two turns, repeats/shuffles prompts and measures batch elapsed time. Online `bench serve` adds synthetic Poisson/Gamma timing.
- Mooncake/GuideLLM: timed trace with prefix hash IDs and input/output lengths. GuideLLM creates synthetic token prompts preserving prefix-hash topology; it does not recover original tokens.
- Exact KV semantics: vLLM's policy key is a block hash plus KV group index, and offloading stores/loads full KV blocks. Identical generated token blocks under a fixed model/tokenizer preserve exact reuse; trace hash IDs alone are not proof of original-value identity.
- Consequence: the proposed carriers can support evidence-stratified replay, but cannot all be described as natural timed traces.

## Stage A highest-risk probe plan

- Risk-bearing premise: none retained for this ID.
- Cheap discriminating probe or counterexample search: not authorized because current literature already establishes cross-workload policy rank variation and carrier-information sensitivity.
- Negative result that kills the direction: already structurally met—the proposed endpoint does not distinguish itself from the current union.
- Positive-result ceiling: a native-offload reproduction would remain engineering/replication evidence and would not repair the Q2 gate.

## Stop conditions

The direction is stopped because the current strongest union covers the same policy-comparison action, workload/capacity sensitivity, rank-variation endpoint, exact-KV guarantee and stronger real-trace evidence. The remaining implementation-version/medium delta is not a nontrivial N1/N2/N3 contribution.

## Discovery repair vector

- Codes: `OMITTED_CURRENT_SAME_OBJECT`, `OMITTED_FIRST_PARTY_FEATURE`, `NATURAL_CARRIER_GAP`, `Q2_SHAPE_GAP`
- Materiality: decisive. Discovery did not subtract UniCache's vLLM LRU/LFU/FIFO/ARC/OPT panel, the 2026 vLLM ARC cross-workload evaluation, or ATC25's explicit ShareGPT/Mooncake trace-information audit.
- Was the missing information available before the frozen cutoff?: yes.
- Does this feedback alter the independent scientific decision?: `NO`; the vector records why Discovery overestimated the residual, while the independent decision remains STOP.

## Dual-axis score

- Academic value: `32/70`
- AI executability bonus: `28/30`
- Total: `60/100`

## Human research reserve, if applicable

Not applicable; the issue is not human-core execution.

## User-action blocker, if applicable

Not applicable. No claim-bearing observation was obtained, no resource failure occurred and no scientific revision was consumed.

## Source verification note

This review used AI-assisted source search and synthesis. Current-source and collision claims are limited to the cited official repositories, official conference pages and primary papers. No unpublished evidence was used.
