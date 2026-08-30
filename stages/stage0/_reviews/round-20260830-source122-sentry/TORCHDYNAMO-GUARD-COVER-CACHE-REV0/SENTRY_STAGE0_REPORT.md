# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 Stage 0 SENTRY Report

## 中文摘要

- SENTRY disposition：`CONFIRM`。
- 科学建议：确认 PRIMARY 的 `REVISE_ONCE`。不是 `STOP`，但当前 packet 不得直接进入 Stage A。
- 质量档：一次同对象 contract revision 完成且经独立 closing 后，仍可保持 `TIER_B_Q2_VIABLE`；当前不具备 Stage-A-ready contract。
- 为什么：PyTorch 2.13 已原生覆盖 guarded compile-unit list、first-match lookup、MRU/插入序、isolated bucket、recompile limits、automatic dynamic、exclusion guard、PGO、stances、guard filtering 与多层持久 cache。它们显著扣除宽泛 cache-policy 贡献，但没有同时完成 restricted ShapeEnv-certified cover admission、compile-unit-compatible logical compaction 和 ownership-proven downstream artifact reclamation。issue #166926 还给出决定性反例：两个 guard 都有效不代表两份 compiled code 在 activation-checkpoint recomputation 中可互换。
- 下一门：只允许一次同对象 revision，冻结 restricted quotient、compatibility oracle、logical/physical retirement ownership、完整 baseline/Q2 denominator；之后必须重新独立 closing。禁止直接 Stage A。
- 用户操作：不需要。

- Lane id: `STAGE0_SENTRY`
- Assignment id: `STAGE0-SENTRY-20260830-TORCHDYNAMO-GUARD-COVER-CACHE-REV0`
- Context SHA-256: `9A931076E3182B9EDA136B8A02E70A50DE4D157CFB7BCF17784F3EC3965FA3F4`
- START SHA-256: `EEA871E84EA8D621ED12E79723D69AA4598DFC4C194E8FD260FEA652C1265E5C`
- Model route: `gpt-5.6-sol/high` temporary user-command override
- Search/open usage: `24/24` (`7` search-query items + `17` open items; additionally `4` in-page find operations)
- Implementation/build/experiment/Stage A/Stage B/shared write: `0`
- Claim-bearing observation: `false`
- Cross-assignment contamination: `false`
- Evidence ceiling: `CURRENT_PYTORCH_2_13_FIRST_PARTY_SOURCE_AND_PUBLIC_PRIMARY_TEXT__ZERO_CANDIDATE_RESULT`
- Confidence: `0.92`

## Independent decision table

| Required check | SENTRY finding |
|---|---|
| PyTorch 2.13 current union | `CONFIRMED_HEAVY_SUBTRACTION` |
| Strict eight-predicate direct fatal | `NO` |
| Arbitrary-guard/recompute counterexample | `CONFIRMED_DECISIVE` |
| Restricted ShapeEnv quotient | `REQUIRED_AND_FINITE` |
| Logical vs physical retirement split | `REQUIRED` |
| Q2 breadth | `CONFIRMED_AS_MINIMUM_FLOOR` |
| One bounded revision | `ELIGIBLE` |
| Post-closing Stage A killer | `CONFIRMED_WITH_RECOMPUTE_NEGATIVE` |
| PRIMARY disposition | `CONFIRM` |

The first defect is one coherent pre-observation contract defect: `ARBITRARY_GUARD_IMPLICATION_PLUS_CROSS_LAYER_RETIREMENT_OWNERSHIP_UNFROZEN`. Repairing it preserves the exact TorchDynamo bucket, online signature stream, past-only information, exact PyTorch semantics and cumulative full-cost endpoint.

## Independent PyTorch 2.13 current-union audit

### Guarded dispatch and bucket semantics

The v2.13.0 `extra_state.cpp` source confirms:

- a code object owns an `ExtraState` whose cache entries are partitioned by `isolate_recompiles_id`;
- lookup searches the isolated bucket and may fall back read-only to the default bucket;
- it walks guarded entries, returns the first valid compiled code and, when `use_lru=true`, moves the hit to the front;
- new entries are inserted at the front under MRU/LRU mode and at the back under insertion-order mode;
- `_set_lru_cache()` already switches MRU versus insertion ordering;
- `invalidate()` invalidates one Dynamo cache entry and moves it to the back, which is an internal logical-retirement primitive, not proof of downstream artifact reclamation.

Source: [PyTorch v2.13.0 `extra_state.cpp`](https://raw.githubusercontent.com/pytorch/pytorch/v2.13.0/torch/csrc/dynamo/extra_state.cpp).

Official `torch.compile` documentation confirms code-object caches, guard-failure recompilation, default `recompile_limit=8`, automatic dynamic behavior for `dynamic=None`, per-call limits and `isolate_recompiles`. The isolate design explicitly creates separate cache buckets while allowing fallback reuse of non-isolated entries. Sources: [PyTorch 2.13 `torch.compile`](https://docs.pytorch.org/docs/2.13/generated/torch.compile.html), [isolate-recompiles DevLog](https://docs.pytorch.org/devlogs/dynamo/2026-05-04-dynamo-isolate-recompiles/).

### Automatic dynamic, exclusion and PGO

The v2.13 config source confirms defaults `recompile_limit=8` and `accumulated_recompile_limit=256`; it performs static-first automatic dynamic recompilation and exposes `automatic_dynamic_exclusion_guard=false` by default. That exclusion mechanism preserves selection of prior specialized entries only for a bounded progressive-dynamism case and explicitly does not cover data-dependent branches, graph breaks or unrelated guard failures. PGO persists automatic-dynamic decisions across runs. Sources: [PyTorch v2.13.0 `config.py`](https://github.com/pytorch/pytorch/blob/v2.13.0/torch/_dynamo/config.py), [advanced dynamic/PGO controls](https://docs.pytorch.org/docs/stable/user_guide/torch_compiler/compile/dynamic_shapes_advanced_control_options.html).

### Current guard-reduction and multi-tier cache stack

Current official documentation exposes guard profiling through the `TorchDynamo Cache Lookup` event and several guard-filter/skip mechanisms, but labels the important guard-dropping modes unsafe because they may silently reuse stale code. Those modes cannot satisfy the candidate's exact-semantics guarantee. [Reducing Guard Overhead](https://docs.pytorch.org/docs/main/user_guide/torch_compiler/compile/programming_model.reducing_guard_overhead.html)

The compile-cache tutorial confirms that Mega-Cache aggregates PGO, AOTAutograd, Inductor/FXGraphCache, Triton and autotuning artifacts, with local/remote persistence and device/version validity. Thus “retiring one Dynamo entry” cannot be equated with reclaiming every downstream file, loaded module, kernel binary or CUDA Graph pool. [Compile Time Caching](https://docs.pytorch.org/tutorials/recipes/torch_compile_caching_tutorial.html)

The open RFC #174970 independently describes DynamoCache, AOTCache and FXGraphCache as distinct cache systems and proposes separate validity-extension hooks at their different layers. This is strong evidence that cross-layer ownership/validity is not a single entry-local operation. [RFC #174970](https://github.com/pytorch/pytorch/issues/174970)

## Direct-fatal audit

### Eight predicates

| Predicate | Strongest checked coverage | Direct coverage |
|---|---|---|
| Same object/function/protocol | PyTorch 2.13 native guarded Dynamo cache and downstream cache stack | `PASS` |
| Same scenario/workload | Native mechanisms handle variable signatures, recompiles and repeated dispatch; no identical frozen result-independent full-cost stream | `PARTIAL` |
| Same or weaker information | automatic dynamic, PGO and MRU use past observations only | `PASS` |
| Same atomic action | native union compiles, generalizes, reorders, isolates, limits, falls back and internally invalidates; it does not expose the same certified cover admission plus compatibility-checked compaction and ownership-proven reclamation | `FAIL_DIRECT` |
| Same/stronger legality/guarantee | ordinary guards are sound for their own compiled unit; unsafe filters weaken guarantees; no cross-entry observational-compatibility proof | `FAIL_DIRECT` |
| Same non-worse full cost | current components do not jointly optimize compile, execution, guard traversal, logical entries, persistent files, loaded code and CUDA Graph residency under the candidate action | `FAIL_DIRECT` |
| Comparable version/platform/scale | current v2.13 public CPU/CUDA routes exist | `PASS` |
| Sufficient implementation/full-text depth | tag source, official docs, issues/RFC and primary papers were inspected | `PASS` |

No checked source or deployable union closes all eight predicates. `DIRECT_FATAL=false`.

### Adjacent compiler subtraction

- PyTorch 2 already establishes guarded frame caching, symbolic shapes and broad TorchBench/HuggingFace/TIMM evaluation; the candidate cannot claim guarded compilation or dynamic-shape reasoning as new. [PyTorch 2 paper](https://pytorch.org/assets/pytorch2-2.pdf)
- DISC supplies an end-to-end fully dynamic compiler and reports compile/runtime/memory improvements; Vortex provides hardware-aware, sample-free dynamic tensor program optimization. Both subtract generic dynamic-shape compiler novelty but are not TorchDynamo cache-retirement mechanisms. [DISC](https://arxiv.org/abs/2103.05288), [Vortex](https://arxiv.org/abs/2409.01075)
- DyPARS (CGO 2026) chooses shape-dependent graph variants at runtime and beats TorchInductor/BladeDISC on five models. It is a strong adjacent shape-variant selector and future baseline candidate, but does not operate on one current Dynamo guarded bucket, prove cross-entry compile-unit compatibility or reclaim downstream artifacts. [DyPARS DOI](https://doi.org/10.1109/CGO68049.2026.11395218)

The residual must therefore remain TorchDynamo-specific: a sound online action over a restricted current compile-unit quotient, not generic set cover, caching or dynamic-kernel selection.

## Arbitrary-guard and recomputation counterexample

Arbitrary Dynamo guard implication cannot be the candidate's legality relation. Guard sets can contain Python type/identity, aliasing, globals, module attributes, side-effect state, backend/config, tensor metadata and ShapeEnv predicates. Even if two guard predicates both accept one input—or one truth set includes another—the compiled units may have different output structures, saved tensors, side effects, graph breaks, autograd history or recomputation behavior.

Issue #166926 is decisive first-party contrary evidence. During activation-checkpoint recomputation, two cache entries can both be valid, yet MRU selection chooses a different graph than the original forward. The issue states that the entries may have different output signatures or saved activations/order, causing a `CheckpointError` with no recovery. It proposes preserving the exact forward entry for recomputation rather than treating validity overlap as interchangeability. [PyTorch issue #166926](https://github.com/pytorch/pytorch/issues/166926)

Consequences:

1. guard implication is necessary only for dispatch coverage, never sufficient for retirement;
2. the compatibility oracle must include outputs, pytree structure, dtype/shape, aliasing/mutations, Python-visible side effects, backend/options, graph-break/fallback behavior, autograd saved-tensor signatures and activation-checkpoint recomputation identity;
3. any unknown compatibility dimension makes the pair incomparable;
4. the future Stage A packet needs a recomputation negative/control, not merely forward output equality.

## Restricted ShapeEnv quotient

The revision must define compile units as comparable only when all non-shape dimensions are exact-equal:

- Python code object and isolated bucket;
- backend and compile options;
- tensor dtype/device/layout/rank and aliasing class;
- Python type/identity/global/module state guards;
- side-effect and mutation obligations;
- output/autograd/recompute signature class;
- fallback/graph-break boundary and downstream cache-key context.

Only the remaining ShapeEnv predicates may enter the coverage relation. They must be normalized over the same source-to-symbol mapping and proven by the frozen ShapeEnv/SymPy solver. For candidate cover `B` over specialized entry `A`, the solver must prove `Guard_A => Guard_B`; `unknown`, timeout, unsupported atom, data-dependent value, dynamic-rank change or differing 0/1-specialization obligation yields `INCOMPARABLE`, never assumed coverage.

The quotient is therefore:

`exact_equal_non_shape_compatibility_class x solver_certified_shape_region`.

This is finite and auditable. It also prevents the proposal from degenerating into unsafe guard dropping.

## Logical versus physical retirement ownership

### Logical retirement

Logical retirement changes Dynamo dispatch only: an entry is disabled, invalidated or skipped so lookup no longer selects it. The v2.13 internal `invalidate()` primitive is a mandatory native baseline. Reportable outcomes include guard-lookup time, dispatch depth and live Dynamo entry count.

### Physical reclamation

Physical reclamation means releasing downstream resources: AOTAutograd/FXGraphCache records, generated modules, Triton binaries/cubin, autotuning and PGO entries, persistent local/remote cache objects, loaded code handles, CUDA Graph recordings/pools and host/device allocations. These may be shared across multiple Dynamo entries, processes or future loads.

The revision must freeze an ownership ledger:

- stable artifact identity/key and producing compile unit;
- all known logical owners/consumers;
- in-memory reference/lifetime evidence;
- persistent local/remote cache ownership and reacquisition policy;
- CUDA Graph/pool lifecycle;
- a sole-owner/refcount proof before any deletion or memory-savings claim.

Without sole-owner evidence, the candidate may claim only logical compaction and measured lookup/entry-count effects. It must not infer physical bytes freed from a Dynamo entry count reduction. Physical reclamation is a separate optional action and must be charged for coordination, bookkeeping and deletion/rebuild cost.

## Minimum Q2 breadth and fair baselines

SENTRY confirms PRIMARY's breadth as a minimum floor:

- `>=12` public models across `>=3` workload families, including vision, variable-sequence/LLM-like and recommendation/irregular or equivalent distinct guard regimes;
- result-independent positive streams with certified overlap and mandatory static, fully dynamic, disjoint/unique-shape and recomputation negative strata;
- CPU plus one public CUDA route on exact PyTorch 2.13 tag/backend/options;
- cold/warm cache factorials and identical PGO/AOTAutograd/Inductor/Triton/autotune/CUDA Graph configuration;
- all failed, eager-fallback, unsupported and ownership-unknown cells retained;
- repeated cumulative compile, execution, guard lookup, policy, fallback, logical-entry, persistent-byte, loaded-code and peak host/device-residency measurements.

Mandatory native/simple baselines:

1. PyTorch 2.13 default automatic dynamic + MRU + limits;
2. `dynamic={None,True,False}`, `mark_dynamic` and `shapes_spec`;
3. PGO on/off and automatic-dynamic exclusion guard on/off;
4. per-call/global limit grid and `isolate_recompiles` on/off;
5. eager/fail-on-recompile stances where applicable;
6. MRU versus insertion order;
7. safe default guard evaluation; unsafe filters only as labeled ceiling ablations;
8. simple count/LRU admission and no-compaction policies;
9. exhaustive short-trace offline full-cost/Pareto oracle;
10. DyPARS/DISC/Vortex only where the same operation, backend and cost boundary can be reproduced fairly.

PyTorch 2's much broader benchmark suites mean 12 models cannot support a breadth claim by count alone. Q2 shape comes from the restricted sound mechanism, complete native union, positive/negative streams, ownership audit and full-cost denominator. Q1 potential is not established.

## Bounded one-time revision

### Preserve

- one exact PyTorch 2.13 `torch.compile` frame/code object and bucket;
- online result-independent ordered signature stream;
- past-only information;
- exact eager-equivalent semantics;
- cumulative compile + execution + dispatch + residency endpoint;
- public CPU/single-GPU evidence ceiling.

### Required delta

- quotient all non-shape/compatibility dimensions by exact equality;
- restrict implication to solver-certified ShapeEnv predicates;
- freeze the compile-unit compatibility oracle, including autograd/recomputation;
- separate logical Dynamo retirement from physical downstream reclamation;
- require sole-owner/refcount proof for any physical reclamation claim;
- freeze the full PyTorch 2.13 baseline grid, Q2 panel and all-cell denominator;
- freeze an exact source-pinned internal hook or extension route before claim-bearing execution.

### Forbidden delta

- arbitrary guard dropping or unsafe filters as the primary method;
- generic cache eviction/set cover with PyTorch labels;
- proxy-only simulation supporting scientific PASS;
- result-dependent stream/model/cell selection;
- inferring artifact-memory savings without ownership evidence;
- changing compiler/object/endpoint or using private traces;
- Stage A before independent revision closing.

This remains one eligible `REVISE_ONCE`: all changes close one atomic soundness/ownership contract defect before any result, preserve the object/RQ/endpoint, have a finite checker route and consume no mechanism pivot. Revision consumption remains `false` until MAINLINE dispatches and executes the revision.

## Post-closing Stage A killer

Only after a separate closing accepts the revision:

- two public frames from different families;
- 4–8 preregistered ordered signatures per frame;
- one certified positive-overlap frame and one activation-checkpoint/recompute or equivalent compatibility-negative frame;
- exact enumeration of admissible cover/admission/logical-retirement actions;
- identical current native grid, simple cache and offline oracle;
- output/side-effect/autograd/recompute checks before any cost inference;
- logical ownership ledger, with physical reclamation disabled unless sole ownership is proven.

Kill the direction if any condition holds:

1. no nontrivial ShapeEnv-certified cover pair remains after exact non-shape quotienting;
2. any candidate pair changes outputs, side effects, saved activations, recomputation selection or fallback semantics;
3. no safe source-pinned hook can represent logical retirement without changing the object;
4. physical ownership cannot be proven and logical compaction yields no independent lookup/full-cost gain;
5. default/PGO/MRU/limits/simple policies are within `5%` of the offline full-cost frontier with no worse peak residency in every positive witness;
6. the residual collapses to generic caching or an adjacent dynamic-shape variant selector.

A positive result is preliminary non-falsification only, not proof of a Q2 paper claim.

## Quality and AI route

- Independent quality tier: `TIER_B_Q2_VIABLE` after bounded revision and independent closing only.
- Scientific verdict: `REVISE_ONCE`.
- Operational disposition: `NONE`.
- Novelty route: `N2` restricted compiler mechanism.
- AI route: `AI_CORE_EXECUTABLE` after contract closing; estimated `ai_core_fraction=0.84`.
- Human blocker: none for public CPU/single RTX 4070 evidence.
- Scientific revision consumed now: `false`.

## Limitations and evidence honesty

- No implementation, experiment or candidate result was produced; coverage opportunity and cost benefit remain hypotheses.
- v2.13.0 source contents were independently checked; the PRIMARY-provided release commit label was not separately re-resolved within the bounded web envelope.
- Search boundedness cannot prove global absence; the novelty status is `SEARCH_BOUNDED_OPEN_WITH_NO_DIRECT_FATAL_FOUND`.
- Main-branch July 2026 guard-overhead documentation is current boundary evidence; the future contract remains pinned to v2.13.0 unless MAINLINE freezes another safe boundary.
- AI-assisted research tools were used for source discovery, verification and synthesis; decisive claims point to first-party source/docs/issues or primary papers.

## Final SENTRY disposition

`CONFIRM__REVISE_ONCE__TIER_B_Q2_VIABLE_AFTER_RESTRICTED_QUOTIENT_AND_OWNERSHIP_CLOSURE`

