# Discovery Divergence Seed Pool

离线非证据 seed；未读取 A4、CRFEPOCH 或组内仓库，未启动资源/实验。

| ID | Anchor candidate | Frozen idea and earliest falsifier |
|---|---|---|
| S4-108-01 | public vLLM startup JSON artifact | exact-version cold/warm JSON output是否可反驳一项已发表的同配置 startup claim？反例：artifact没有固定配置/版本。 |
| S4-108-02 | public vLLM benchmark sweep artifact | 失败/成功 sweep rows是否完整进入固定 SLO ranking？反例：native sweep 已有同一结果语义。 |
| S4-108-03 | public torch.compile cache artifact | cache provenance/validity是否决定一个可复核的 replicated cold-start conclusion？反例：current cache key/validation已闭合。 |
| S4-108-04 | public single-GPU LLM trace benchmark | first request and steady request的 fixed estimand是否可复制而无状态泄漏？反例：当前 harness 已明确边界。 |
| S4-108-05 | public runtime release benchmark table | release-to-release ranking是否因版本/driver/config漂移而不可复现且有 correction action？反例：无同一 artifact/config。 |
| S4-108-06 | public reproducibility package | benchmark metadata缺项是否改变一个固定 action选择？反例：只是 schema/dashboard。 |
| S4-108-07 | public compile cache docs | cache hit/miss case是否存在同对象 negative replication endpoint？反例：Source107 exact action already terminal. |
| S4-108-08 | public benchmark trace schema | timed trace rate transform是否保持同一 decision function？反例：Source104/107 exact hold. |
| S4-108-09 | public APC benchmark | prefix warm/cold run是否可作为同一 output/fixed carrier的负复现？反例：Source103/107 hold. |
| S4-108-10 | public profiler trace | phase timing是否可验证一个 published runtime conclusion而非新指标？反例：缺 exact claim/artifact. |
| S4-108-11 | public MLPerf LLM logs | canonical log/result pair是否支持非重复 benchmark-validity negative？反例：rules already define same endpoint. |
| S4-108-12 | public single-GPU report | reported SLO/full-cost boundary是否能由 artifact replay检验？反例：report has no accessible exact artifact. |

Selected before evidence: S4-108-01→RQ01, S4-108-02→RQ02, S4-108-03→RQ03, S4-108-04→RQ04, S4-108-11→RQ05. Others are non-evidence backlog. `DIVERGENCE_COVERAGE_ADVISORY=PASS`.

