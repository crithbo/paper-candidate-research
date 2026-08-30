# Discovery Divergence Seed Pool

本表位于 Research Question Card 之前，只负责扩大创意召回。`SEED` 不是 locator、raw、C0、候选证据或新颖性声明；允许暂时缺少版本、current union 和 falsifier。seed 阶段不得联网、下载、构建或运行实验，必须在原 assignment 的模型与 wall-time 预算内完成。

## Pool metadata

- Assignment / lane:
- Frozen profile:
- Seed ceiling: `<=12`
- RQ candidate ceiling after seed convergence: `<=8`
- Network-security exclusion check: `PASS / OUT_OF_SCOPE`
- Generation completed before evidence lookup: `YES / NO`

## Divergence coverage

引擎数量与覆盖只作 advisory，不设最低数；不得为了凑数制造 seed。

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | | |
| `PROBLEM_REFRAMING` | | |
| `CONSTRAINT_MANIPULATION` | | |
| `NEGATION_OR_INVERSION` | | |
| `ABSTRACTION_LADDER` | | |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | | |
| `JANUSIAN_TENSION` | | |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | | |

同时记录视角轮换，但不设录取配额：`END_USER / OPERATOR / MAINTAINER / COMPILER_OR_BACKEND_ENGINEER / HARDWARE_ARCHITECT / MEASUREMENT_REVIEWER / THEORIST`。同一对象若只从一个角色重复改写，应触发 advisory。

## Seed records

每个 seed 限 2–4 句。先生成完整池，再做聚类和收敛；生成中途不得根据证据结果补位或删改。

### `<SEED-ID>`

- Engine:
- Perspective role:
- Starting anchor or hunch:
- Exact public anchor candidate and version/date if already known:
- Intended source role: `ANCHOR / CURRENT / CONTRARY / ESCAPE`
- Two-sentence idea sketch:
- Conclusion-first test: `如果成功，最谨慎的论文结论只能是什么？为什么有人会在意？`
- Exact structural mapping, tension or manipulated constraint:
- Counterfactual consequence if the idea were true:
- Likely generic/current-union/changed-object risk:
- Evidence needed before it can become a locator:
- Relation to existing seed/family: `FRESH_SKETCH / VARIANT / CONTAINS / CONTAINED / LITERAL_DUPLICATE / ACTIVE_OR_STOP_IDENTITY`
- Generic-shell noun-swap test: `PASS / GENERIC_SHELL`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE / GENERIC_SHELL / LITERAL_DUPLICATE / FORBIDDEN_SCOPE / ACTIVE_OR_STOP_IDENTITY`

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| | | | | |

## Coverage-constrained convergence

不得使用可补偿总分或强制 Top-N。若可查证 seed 多于 RQ ceiling，先冻结选择，再进入 Research Question 收敛；优先保留在对象、机制、贡献类型、证据载体和反证路线中至少一项非支配的组合。这里不直接生成 locator，也不得开始外部证据检索。

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| | | | |

每个被选 seed 随后进入 `templates/DISCOVERY_RQ_CANDIDATE.md`。先形成一个 primary RQ；只有真实范围歧义存在时，才增加至多两个保持同一对象与保证的备选。未收敛的问题进入 RQ backlog，不得越过该层直接计 raw。

## Append-only backlog

未被选中的 seed 保留为非证据性 backlog；只有出现新的公开证据、对象变化或后续 assignment 明确重开时，才可再次进入 convergence。不能把 backlog 数量当召回率、论文机会数或 precision 分母。

## Advisory

- Engines used:
- Perspective roles used:
- Largest object/surface share:
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS / TOO_FEW_ENGINES / SINGLE_PERSPECTIVE / DOMINATED_BY_ONE_SURFACE`
- Plain-Chinese note:
