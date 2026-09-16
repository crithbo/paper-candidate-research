# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 GuardCover：面向 torch.compile 动态形状流的在线 guard-region specialization cache

## 中文摘要

- 研究机会：TorchDynamo 当前以 guard cache entry 链表进行多版本 dispatch，并用 entry/ID_MATCH 计数限制重编译；Inductor `FxGraphCache` 保存带 `guards_expr` 的多个编译版本、逐项验证并在 miss 后增加新版本。可以研究一个保持完全语义等价的 guard-region coverage poset，在动态形状流上联合决定静态特化、符号化泛化、被覆盖版本保留/退役与 eager fallback。
- 为什么值得做：当前粗粒度 limits/stances 没有在已检查 locus 中联合计价 compile time、steady-state runtime、guard traversal 与 artifact/CUDA-Graph memory。动态形状 compiler 文献证明问题重要，但没有直接覆盖同一 PyTorch guarded-cache action。
- 当前结论：`PROPOSE_STAGE0 / TIER_B_Q2_VIABLE`；Stage 0 必须独立固定 PyTorch commit、完整 current union、最近论文和 Q2 shape。
- 下一步：独立 Stage 0 current-source/论文碰撞审查；禁止把 Discovery 的 bounded-open 当作 absence 证明。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Origin: `O5`
- Domain: PyTorch compiler, TorchDynamo, Inductor, dynamic shapes, CUDA Graphs
- Contribution route: `N2`
- Contribution type: `COMPILER_TOOL / METHOD_ALGORITHM`
- Discovery method: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`; claim-pack `OFF`
- Opportunity family: `TORCHDYNAMO-GUARD-COVER-CACHE`
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`, finite TorchBench natural/canonical route

## Research question

For one `torch.compile` frame under an online stream of exact signatures, can a guard-implication-aware admission/compaction algorithm choose static specialization, symbolic generalization, covered-entry retention/retirement, or eager fallback to reduce cumulative compile + execution + artifact-memory cost versus current automatic-dynamic/fixed-limit/stance baselines while preserving exact PyTorch semantics?

## Claim package

- Exact object: TorchDynamo per-frame guarded code cache plus its Inductor guarded artifact variants.
- Atomic action: maintain a guard-coverage poset; on a miss, choose static compile, minimal symbolic cover, or eager; retire an entry only if guard implication and full-cost dominance are certified.
- Mechanism: guard predicates reveal semantic coverage unavailable to key-only caching; a small symbolic cover can absorb cold variants while hot static variants remain when runtime benefit pays for bytes/dispatch.
- Information: past signatures/guards/costs only; future trace unavailable.
- Fair comparators: PyTorch default, dynamic-from-start, static-only, fixed recompile limits, `eager_on_recompile`, `eager_then_compile`, simple LRU/count cutoff, DISC/Vortex-style generalized compilation where reproducible, and offline oracle.
- Expected endpoint: lower cumulative full cost and cache growth with exact outputs; no numerical result is claimed in Discovery.
- Full cost: compilation, runtime, guard dispatch, cache/code bytes, CUDA Graph record/pool cost when enabled, fallback.
- Failure region: stationary/fully unique shapes, generalized kernels as fast as static, disjoint/unsafe guard regions, or current union already implementing the action.
- Minimum falsifier: pinned upstream source contains the same implication-aware action; guard implication is unsound; or current/simple baselines match the Pareto frontier on frozen public streams.

## Genealogy and current collision

- Current implementation: PyTorch `cache_size.py`, `codecache.py`, `compiler/__init__.py`, retrieved 2026-08-30.
- Strong subtractor: DISC (`arXiv:2103.05288`) provides fully dynamic IR/runtime flow and explicitly contrasts static recompilation with dynamic kernels.
- Strong subtractor: Vortex (`arXiv:2409.01075`) provides sample-free dynamic tensor-program optimization.
- Current classification: `SEARCH_BOUNDED_OPEN`; no global first/absence claim.
- Residual: online admission/coverage/retirement over PyTorch's existing guarded multi-version artifacts, not a new dynamic-shape code generator.

## Current upstream reality check

- Version/date: official stable docs redirected to PyTorch 2.13; current source `main` retrieved 2026-08-30. Stage 0 must replace branch identity with an exact commit.
- Source symbols: `CacheSizeRelevantForFrame`, `exceeds_recompile_limit`, `GuardedCache.find_guarded_entry`, `FxGraphCache`, `_write_to_local_cache`, `_save_graph`, `torch.compiler.set_stance`.
- Default/nondefault surfaces checked: `recompile_limit`, `accumulated_recompile_limit`; stance modes `default`, `force_eager`, `eager_on_recompile`, `fail_on_recompile`, `eager_then_compile`, `aot_eager_then_compile`; unsafe guard skipping excluded.
- Contrary evidence: `eager_then_compile` already infers dynamism before compiling; this subtracts coarse warmup/phase switching.
- Bounded-open residual: inspected current loci show guarded variants and add-on-miss, but no implication-based cost-aware compaction/retirement. This is a Stage 0 hypothesis, not an absence fact.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Complete action: real Dynamo/Inductor cache entries and guard expressions; no proxy-only cache result.
- Exact semantics: preserve all current guards and eager behavior; never use unsafe guard skipping.
- Small witness: 4–8 result-independent signatures, overlapping guard regions, exact eager/compiled equality, exhaustive oracle.
- Finite route: pin commit → enumerate union/flags → read-only ledger → guard implication checker → assignment-local policy hook → control → public variable-shape workload packet.
- Structural failure: semantics weakening, no finite implication oracle, or direct current absorption.

## Evidence and quality route

- 72-hour first evidence: static preflight + guard-region witness + no-claim cost ledger; no main result required before Stage 0.
- Public evidence route: TorchBench plus exact variable batch/sequence/image signature packets selected result-independently.
- Q2 sufficiency hypothesis: safe compiler mechanism, nontrivial online algorithm, current implementation, full-cost public evaluation, strong dynamic compiler baselines.
- Q1 path: formal guarantee on justified interval/laminar guard families plus broad models and CUDA Graph interaction.
- AI boundary: core implementation/evaluation appears auditable on CPU/single RTX 4070; Stage 0 must verify resource realism.

## Non-relaxable audit

- Same object: explicit.
- Latest collision: bounded, not complete; Stage 0 owns independent closure.
- Strong baselines: named.
- Natural/canonical evidence: finite route, not yet executed.
- Full cost: frozen.
- Reproducibility: exact commit/packet/commands required downstream.
- Claim honesty: no performance, novelty, or absence result claimed.

