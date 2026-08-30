# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 Stage 0 Report

## 中文摘要

- 结论：`REVISE_ONCE`。不是科学 STOP；同一 TorchDynamo guarded code cache 对象内仍有可信 `TIER_B_Q2_VIABLE` 残余，但当前 packet 不能直接进入 Stage A。
- 为什么：PyTorch 2.13 已原生覆盖静态后自动动态化、跨运行 PGO、`mark_dynamic`/`shapes_spec`、per-call recompile limit、isolate buckets、eager stances、MRU 调度、最小 differentiating guards，以及带 symbolic guards 的多版本 Inductor cache。它们没有完成成本感知的 guard-coverage 入场与安全退役，因此不满足 DIRECT_FATAL；但原 action 把任意 guard 当成可判定偏序，并把 Dynamo entry 的逻辑退役等同于 Inductor/Triton/CUDA Graph artifact 回收，语义和 full-cost 所有权尚未闭合。
- 下一道门：MAINLINE 验收后交独立 SENTRY。若 SENTRY 确认，只允许一次同对象 contract revision：非 shape guard 必须完全相同，覆盖关系只限 solver 可证明的 ShapeEnv shape predicates；同时冻结 dispatch-entry retirement 与各下游 artifact 的 refcount/ownership 语义，再重新做 Stage 0 closing。禁止直接进入 Stage A。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-TORCHDYNAMO-GUARD-COVER-CACHE-REV0`
- Input freeze SHA-256: `1099ACD8B9DB2DA4C6F8ECC7D417768A1E1C09F16D8CC178491BA32599AC077A`
- Cross-assignment contamination declaration: `false`
- Scientific verdict: `REVISE_ONCE`
- Operational disposition: `NONE`
- Quality tier: `TIER_B_Q2_VIABLE` only after the bounded revision
- Confidence: `0.88`
- Evidence ceiling: `CURRENT_OFFICIAL_SOURCE_AND_PRIMARY_PAPER_REVIEW__ZERO_CANDIDATE_RESULT`
- Novelty route: `N2`
- Candidate Q1 venue family: compiler/runtime systems; current evidence supports Q2 viability, not Tier A.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a safe online compiler-cache policy over real TorchDynamo compile units could be a nontrivial N2 mechanism if it jointly improves cumulative compilation, execution, dispatch and resident-cache cost against the complete PyTorch 2.13 policy union.
- Current evidence-acquisition readiness/risk: public source and official introspection APIs make the object observable, but the public APIs expose entries and guards more readily than they expose safe entry removal and downstream artifact ownership. This is an exact-action gap, not merely missing code.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: missing results are not fatal at Stage 0. The current guard algebra and ownership ambiguity would be fatal if left broad; both have a finite same-object repair.

## Discovery provenance

- Opportunity origins: `O5`, scale/online/approximation source lane.
- Domain tags: PyTorch compiler, TorchDynamo, Inductor, dynamic shapes, guarded dispatch, compilation cache.
- Paper genealogy: TorchDynamo/PyTorch 2 guarded frame cache → automatic dynamic shapes and symbolic ShapeEnv → DISC/Vortex dynamic-shape compilation → current PyTorch 2.13 PGO, isolation, guard filtering and multi-tier cache stack.
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `TORCHDYNAMO-GUARD-COVER-CACHE`
- Contribution type and type-contract verdict: `COMPILER_TOOL / METHOD_ALGORITHM`; conditionally satisfies the method-algorithm contract after the exact-action revision.
- Independently audited A/C/D/E coordinates: exact frame/cache object and action locus were independently rebuilt; current union materially broader than the brief; no candidate result exists.
- Backtest reference and status: not candidate evidence.

## Frozen object and claim

The frozen object is one PyTorch 2.13 `torch.compile` code object / isolate bucket and its associated Dynamo guarded compile units, with Inductor guarded variants counted as downstream artifacts. The frozen endpoint remains cumulative compile + execution + guard-dispatch + resident-artifact cost on an online, result-independent signature stream, under exact eager-equivalent outputs and current PyTorch semantics.

The revision may clarify the guard algebra and ownership model, but may not change the frame, workload class, endpoint, information model or exact-semantics guarantee.

## Claim-package completeness audit

- Atomic action and mechanism: admission chooses static compile, solver-certified symbolic cover, or eager fallback; compaction may logically retire a Dynamo dispatch entry only after coverage, compile-unit compatibility and full-cost dominance checks. Physical artifact deletion requires separate sole-owner proof.
- Information/assumption contract: past signatures, generated guards, measured compile/dispatch/run cost and observable byte/residency counters only; no future trace or result-dependent workload selection.
- Effect target/output/guarantee: lower cumulative full cost without output, side-effect, autograd/recomputation, guard-soundness or fallback-semantics change.
- Boundary/failure region/competing explanation: stationary streams, fully unique shapes, disjoint guards, generalized kernels as fast as static, non-shape specialization changes, activation checkpointing, shared downstream artifacts, or upstream default/simple policies reaching the same frontier.
- Minimum falsifier: no nontrivial solver-certified cover pair after non-shape guards are quotient-equal; safe logical retirement changes compile-unit identity/side effects/recomputation; or a strongest current baseline matches the offline Pareto frontier on every frozen public stream.
- Dependencies and evidence ceiling: public PyTorch 2.13 source, public CPU and one CUDA GPU route; no private traces/hardware required. This review authorizes no execution.
- Opportunity-family relation audit: this is not a new dynamic-shape code generator and not generic cache eviction. Residual is TorchDynamo-specific admission/dispatch compaction over exact current compile-unit semantics.
- Independent search identity/scope: PyTorch v2.13.0 tag `cf30153`, current official docs/devlogs, current project issues/RFCs, PyTorch 2 paper, DISC and Vortex; search cutoff 2026-08-30.
- Evidence-ledger integrity and contradiction disclosure: Discovery's “no implication-aware compaction” remains only a bounded residual. Newly found PGO, exclusion guards, isolate buckets, MRU, guard filters and mega-cache materially narrow the claim.

## Positive opportunity map

- Natural workloads: public variable batch/sequence/image inference streams whose signature order is frozen before results; TorchBench alone is insufficient unless its input variation is natural and reproducible.
- Observed or expected cost/headroom: official sources establish that guard failure causes recompilation, lookup walks compile units, cold compilation can cost seconds to minutes, and guard lookup can be material. No candidate-specific headroom is claimed.
- Mechanism-specific prediction: mixed hot-static and cold-variable streams with overlapping, solver-certified shape regions are the only positive zone. Fully static, fully dynamic or disjoint streams should show no benefit and are mandatory negative strata.

## Named baselines and fairness contract

1. PyTorch 2.13 default: `dynamic=None`, automatic dynamic shapes, default `recompile_limit=8`, `accumulated_recompile_limit=256`, current MRU lookup and all default caches.
2. `dynamic=True`, `dynamic=False`, `mark_dynamic`, and `shapes_spec` with the same backend/options.
3. Automatic-dynamic local PGO on/off with one frozen `workflow_id`, and `automatic_dynamic_exclusion_guard` on/off.
4. Per-call `recompile_limit` grid and `isolate_recompiles` on/off; isolated buckets must not be mixed with the default bucket denominator.
5. `eager_on_recompile`, `eager_then_compile`, `aot_eager_then_compile`, and `fail_on_recompile` where semantically applicable.
6. Current MRU (`use_lru=true`) versus insertion order (`use_lru=false`) and a simple count/LRU-style admission policy; the current list order is not evidence of capacity eviction.
7. Safe current guard filters are excluded from the exact-semantics primary comparison when they are marked unsafe; they may appear only in a clearly labeled ceiling ablation.
8. Inductor FXGraphCache, AOTAutograd, Triton, PGO and autotuning caches must remain identically configured across a comparison; warm/cold cache state is a factorial stratum, not silently pooled.
9. Offline exhaustive/DP oracle on each short exact trace. DISC and Vortex are contextual dynamic-compiler subtractors; they are direct baselines only if reproduced on the same operation, backend and cost denominator.

All policies receive the same ordered signatures and cache state; failed/unsupported cells remain in the denominator as eager/failure/full-cost outcomes.

## Collision analysis

### Eight-predicate direct-coverage audit

The closest collision is the aggregate PyTorch 2.13 native union, not any one paper.

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | `torch/csrc/dynamo/extra_state.cpp`, `torch/_dynamo/config.py`, `torch/_dynamo/pgo.py`, `torch/_inductor/codecache.py` at v2.13.0 | PASS |
| Same scenario/workload | Native mechanisms handle changing shapes and repeated guarded frame lookup; no identical frozen online full-cost panel | PARTIAL / FAIL |
| Same or weaker information | Automatic dynamic and PGO use past observed dynamism; MRU uses past hits | PASS |
| Atomic action covered | Native union compiles/adds, dynamically generalizes, reorders, isolates and falls back; it does not expose the same solver-certified cost-aware cover admission plus safe retirement | FAIL |
| Same/stronger legality, quality and guarantee | Current guards preserve correctness; unsafe guard filters are explicitly weaker. Native union has no equivalent retirement guarantee | PARTIAL / FAIL |
| Same non-worse full-cost boundary | Current mechanisms do not jointly optimize or report compile, execution, traversal, loaded code, disk artifact and CUDA Graph residency under one action | FAIL |
| Comparable scale/platform/version/config | PyTorch 2.13 source and public CPU/CUDA stack are exact and current | PASS |
| Sufficient full-text/implementation/reproduction depth | Official source/docs and primary papers were read deeply enough to classify current mechanics | PASS |

`DIRECT_FATAL=false`: atomic action, guarantee under retirement, and full-cost predicates fail, so direct coverage cannot be declared.

### Nearest-prior facet matrix

| Source/mechanism | Same object | What it covers | Residual after subtraction |
|---|---|---|---|
| PyTorch 2 / TorchDynamo paper | yes | guarded compile units, sequential first-match lookup, frame-cache semantics | online cover/cost/retirement policy |
| PyTorch 2.13 automatic dynamic + PGO | yes | static-first generalization, learned dynamic sources, cross-run avoidance of static recompile | cost-aware choice among static/symbolic/eager and safe compaction |
| PyTorch 2.13 MRU + exclusion guards | yes | reorder first-match dispatch; preserve specialized selection during progressive dynamism | general certified cover relation and full-cost policy |
| `isolate_recompiles` + per-call limits | yes | bucket isolation, per-region cap, eager fallback | within-bucket cover-aware admission/retirement |
| Guard filters / `skip_guard_eval_unsafe` | same guard system | reduce guard evaluation by dropping checks | unsafe modes cannot satisfy exact-semantics guarantee |
| FxGraphCache / Mega-Cache | downstream same stack | multiple guarded symbolic variants and persistent multi-tier artifacts | coordinated ownership-aware logical/physical retirement |
| DISC | adjacent compiler object | fully dynamic representation/runtime flow | TorchDynamo guarded multi-version online policy |
| Vortex | adjacent compiler object | sample-free hardware-aware dynamic tensor compilation | exact TorchDynamo cache semantics and trace-adaptive admission |

### Seed-distance and method-name deletion test

Deleting “GuardCover” leaves a concrete current-system problem: choose among compile-unit variants with overlapping certified shape regions and account for multi-tier artifacts. Deleting the PyTorch-specific guard/cache semantics collapses the proposal to generic online caching/set cover, which is not publishable here. The revision therefore must keep the exact TorchDynamo compile-unit contract visible in both mechanism and evaluation.

## Competing mechanism decision

- Selected mechanism: quotient-equal non-shape guards plus solver-certified ShapeEnv implication; online cost-aware admission and logical dispatch compaction.
- Registered backup: no mechanism pivot is registered in this report.
- Pivot boundary: changing to generic kernel bucketing, generic LRU, guard deletion, or another compiler/runtime is a new object and forbidden.

## Residual paper kernel

For one current TorchDynamo cache bucket, can a policy retain profitable static compile units while admitting a minimal symbolic cover and logically disabling dominated dispatch entries, under exact compile-unit compatibility and separately audited downstream artifact ownership, so that it beats the full PyTorch 2.13 policy union on cumulative full cost?

This is narrower than the Discovery wording but preserves the exact object, stream, action family, information and endpoint.

## Evidence route

- `PERFORMANCE / PARETO_APPROXIMATION`

## Performance-optimization admissibility

- Same-function contract: all policies execute the same `torch.compile` frame and ordered inputs with exact eager-equivalent observable behavior.
- Algorithmic delta: an online decision over a certified coverage DAG with admission, retention and logical retirement; not a scalar threshold tune.
- Full-cost ledger: wall-clock compile and run, guard lookup, graph breaks/eager fallback, entry count, generated/loaded code bytes, persistent cache bytes, peak host/device memory, CUDA Graph record/pool cost, policy overhead and failures.
- Strong-implementation fairness: identical PyTorch tag/backend/options/cache temperature and hardware; policy computation is charged.
- Generality and failure boundary: at least three model families and positive/negative stream strata; arbitrary Python/global/object guards are outside the implication algebra unless identical.
- Why not routine tuning: publishability requires the certified coverage/ownership algorithm to outperform all native grids and a simple cache policy across families, not merely pick a better limit.

## Q1/Q2 paper shape

- Problem: current guarded compilation exposes a specialization-versus-generalization-versus-fallback tradeoff, while existing controls are separate heuristics and caps.
- Contribution: a sound restricted guard-coverage abstraction, ownership-aware cache action, online policy, and public full-cost benchmark/negative boundaries.
- Evidence plan: at least 12 public models across vision, sequence/LLM-like and recommendation/irregular families; result-independent variable-signature streams; CPU plus one public CUDA route; native configuration union, simple policy and offline oracle; repeated full-cost measurements and failure strata.
- Expected paper narrative: the broad arbitrary-guard claim is rejected; a restricted shape-guard compiler mechanism is shown useful only where certified overlap and specialization benefit coexist.

## Q1/Q2 shape calibration

- Comparator file: `q1_calibration.md`
- Reference set: PyTorch 2 (ASPLOS 2024), DISC, Vortex, and current PyTorch 2.13 source/docs as boundary evidence.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Contribution-shape gap: exact implication grammar and artifact ownership are unfrozen; no proof or algorithm is yet evaluated.
- Evidence-shape gap: no natural panel, measured headroom, statistics, failure boundary or artifact.
- Stage A closure plan: only after independent revision closing, run the pre-registered small exact killer; Stage A cannot substitute for the contract repair.

## Non-relaxable quality audit

- Same-object: preserved by the allowed revision.
- Latest collision: current 2.13 union closes broad “dynamic shape cache policy” claims but not the restricted conjunction.
- Strong fair baselines: complete native union and offline oracle required.
- Natural input/evidence: result-independent public streams required; synthetic small witnesses are legality tests only.
- Full-cost: multi-layer ledger and failed-cell denominator required.
- Reproducibility: exact tag/commit, config matrix, stream manifests, seed/order, cache temperature and raw metrics required.
- Evidence/claim honesty: no benefit, novel absence or correctness result is claimed now.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: static public-source route is finite, but this Stage 0 performed no E2, build or run.
- AI executability class: `E1_STATIC_PREFLIGHT`; conditional path to AI-led Stage A after revision acceptance.
- Estimated ai_core_fraction: `0.85`
- 72-hour first evidence: after a future authorized Stage A, source-pinned introspection plus a 4–8-signature exhaustive witness and complete baseline grid.
- Human-only items and why they are non-decisive: none for the public CPU/single-GPU route; upstream design review would be useful only after evidence.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes after the restricted guard quotient and two-level retirement contract are frozen.
- Comparator, denominator, full-cost and small-witness plan: finite and specified above.
- Why an unimplemented interface/format/checker is or is not structurally fatal: public introspection exists, but current safe mutation/retirement is not a supported public policy API. A future assignment must either freeze an exact assignment-local upstream hook or fail before claim-bearing execution; proxy simulation alone cannot support PASS.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: PyTorch `v2.13.0`, release commit `cf30153`, checked 2026-08-30. Main was used only to confirm no post-release reversal at the checked loci.
- Current official documentation checked: [`torch.compile`](https://docs.pytorch.org/docs/stable/generated/torch.compile), [compile-time caching tutorial](https://docs.pytorch.org/tutorials/recipes/torch_compile_caching_tutorial.html), [dynamic shapes](https://docs.pytorch.org/docs/stable/user_guide/torch_compiler/torch.compiler_dynamic_shapes.html), [guard internals DevLog](https://docs.pytorch.org/devlogs/dynamo/2025-06-04-inside-torch-compile-guards/), and [`isolate_recompiles` DevLog](https://docs.pytorch.org/devlogs/dynamo/2026-05-04-dynamo-isolate-recompiles/).
- Actual source paths/symbols checked: [`extra_state.cpp` v2.13.0](https://raw.githubusercontent.com/pytorch/pytorch/v2.13.0/torch/csrc/dynamo/extra_state.cpp) (`lookup_in_list`, `move_to_front`, `invalidate`, buckets, `_set_lru_cache`); [`config.py` v2.13.0](https://raw.githubusercontent.com/pytorch/pytorch/v2.13.0/torch/_dynamo/config.py) (limits, automatic dynamic, exclusion guard, PGO); [`codecache.py` v2.13.0](https://raw.githubusercontent.com/pytorch/pytorch/v2.13.0/torch/_inductor/codecache.py) (`GuardedCache`, `FxGraphCache`, multiple guarded variants); current `pgo.py` for dynamic-source persistence.
- Default/non-default flags, thresholds and configurations checked: default limits 8/256; `dynamic` modes; PGO; exclusion guard default false; stances; `isolate_recompiles`; per-call limit; current MRU/insertion-order switch; modular caches.
- Discovery absence claim confirmed, narrowed or contradicted: narrowed. No same atomic conjunction was found, but the first-party union already contains most individual ingredients and a strong overlapping-graph correctness warning.
- If contradicted, current native mechanism and finite configuration-grid baseline: the full grid is listed in Named baselines.
- Any non-tuning residual that remains: certified restricted coverage plus compile-unit-compatible logical compaction and ownership-aware full-cost policy.

Current issue [#166926](https://github.com/pytorch/pytorch/issues/166926) is decisive contrary evidence: two valid overlapping entries may not be interchangeable during activation-checkpoint recomputation because saved-activation signatures can differ. This prevents treating guard implication alone as a safe retirement proof. RFC [#174970](https://github.com/pytorch/pytorch/issues/174970) also shows that cache-policy hooks remain an active interface question rather than a settled public extension.

## Stage A highest-risk probe plan

- Risk-bearing premise: after quotienting identical non-shape guards, real public frames still contain nontrivial ShapeEnv implication/overlap pairs whose compile units are observationally compatible and whose policy opportunity is not already captured by current automatic dynamic + PGO + MRU + limits.
- Cheap discriminating probe or counterexample search: two public frames from two different model families; 4–8 pre-registered signatures each; enumerate all policy actions and exact input orders; compare default, dynamic, PGO, MRU/insertion order, limit grid, simple cache and offline oracle. Before any cost claim, verify output/dtype/shape, side effects, output signature, autograd/recompute compatibility, guard truth table and artifact refcounts.
- Negative result that kills the direction: no nontrivial certified pair in either family; any broader entry changes observable/recompute behavior; safe public/upstream hook cannot represent logical retirement without object change; or strongest current/simple baseline is within 5% of the offline full-cost frontier and has no worse peak residency in every witness.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

1. SENTRY finds a direct same-action current implementation satisfying all eight coverage predicates.
2. Solver-certified implication requires weakening any non-shape guard or exact semantics.
3. Compile-unit compatibility cannot be checked finitely for the frozen inference/training scope.
4. Safe retirement necessarily changes PyTorch object or requires unsupported private semantics with no finite upstream hook.
5. No positive natural stream contains useful certified overlap, or native/simple baselines match the Pareto frontier.
6. A Q2 evaluation cannot cover the frozen 12-model/three-family breadth and full-cost denominator on the public CPU/single-GPU route.

## Discovery repair vector

- Codes: `[OMITTED_FIRST_PARTY_FEATURE, ATOMIC_ACTION_UNCLEAR, FULL_COST_GAP, Q2_SHAPE_GAP]`
- Materiality: PyTorch 2.13 PGO, exclusion guards, isolation, MRU/insertion order, guard filters and multi-tier cache ownership materially alter baselines and the legality of retirement.
- Was the missing information available before the frozen cutoff?: `yes`
- Does this feedback alter the independent scientific decision?: `NO`

## Dual-axis score

- Academic value: `49/70`
- AI executability bonus: `25/30`
- Total: `74/100`

## Primary sources

- [PyTorch 2.13 release, commit cf30153](https://github.com/pytorch/pytorch/releases/tag/v2.13.0)
- [PyTorch 2: Faster Machine Learning Through Dynamic Python Bytecode Transformation and Graph Compilation](https://pytorch.org/assets/pytorch2-2.pdf)
- [DISC: A Dynamic Shape Compiler for Machine Learning Workloads](https://arxiv.org/abs/2103.05288)
- [Vortex: Efficient Sample-Free Dynamic Tensor Program Optimization via Hardware-aware Strategy Space Hierarchization](https://arxiv.org/abs/2409.01075)

