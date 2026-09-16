# UST-SEGMENTED-FORMAT-COVER — Independent Stage 0 Confirmation

- Assignment: `STAGE0-C1-20260810-UST-SEGMENTED-FORMAT-COVER-CONFIRM-V8.7`
- Role/mode: `STAGE0_CONFIRMATION_SENTRY / SENTRY`
- Cutoff: `2026-08-10`
- Protocol disposition: **CONFIRM**
- Stage 0 disposition: **CONFIRM_REVISE_ONCE**
- Conditional tier if the one revision closes: **TIER_B_Q2_VIABLE**
- Current readiness: `SOURCE_READY__MECHANISM_RESIDUAL_UNDERFROZEN`
- Confidence: **0.89**
- Stage A/B authorized: **false / false**

## 1. Independent judgment

PRIMARY's `REVISE_ONCE` is necessary and, under the mechanical interpretation below, sufficient as the only Stage 0 revision gate. The current proposal is not yet a paper-level N2: its explicit mechanism is an additive labelled contiguous segmentation over UST format costs, followed by composition of multiple native `Tensor`/`Matmul` objects. That construction is heavily absorbed by the union of classic optimal sparse partitioning and current hybrid SpMM systems. The public UST API's lack of a one-call heterogeneous cover is not innovation.

The topic is not a scientific STOP yet. The same-SpMM object is coherent, the public source/API and natural corpus give a finite route, and no exact current work was verified that simultaneously fixes UST v1.0.0, original row order, the same `A/B/C` contract, a bounded multi-format cover, and the same non-product algorithm or guarantee. One finite revision can therefore ask a single falsifiable question: does the frozen UST action family contain one pre-named legal cross-segment coupling or formal guarantee that survives a strengthened contiguous-partition baseline and the current hybrid-SpMM family? If the answer is no, the terminal outcome is fixed in advance.

This confirmation does not assert that such a residual exists. It authorizes neither implementation nor measurement and does not convert a successful revision certificate into proof of the main research claim.

## 2. Frozen package integrity

The Discovery and PRIMARY packages match the frozen registry and manifests.

| Package | File | SHA-256 | Result |
|---|---|---:|---|
| Discovery | `DISCOVERY_LOG.md` | `560DD103F0DE4CD677A00C8875899F287DADA07AC34992C506862120DA523D89` | verified |
| Discovery | `SOURCE_COLLISION_MATRIX.md` | `3A1CC4BFC9DC4E5C48C45ECDF39B4FE6B231E682193549C572A821D56AB70B5B` | verified |
| Discovery | `UST-SEGMENTED-FORMAT-COVER_TOPIC_BRIEF.md` | `32D09E23FE190E3D4B3EDFC022D4D05DB65090666956E3435444E37B30AC07E0` | verified |
| Discovery | `handoff.yaml` | `00704C3760DBFB3F9C603F74966244D0890AAE8329D4A8C3FB52CAA264BFA182` | verified |
| Discovery | `HASH_MANIFEST.sha256` | `3D51BAD84512C9B6EC05C8B1882D990A30F0FDDDE21B2F0901CA4683641BE946` | self verified, 4/4 |
| PRIMARY | `STAGE0_REPORT.md` | `7145BA2CE15FF012CDB89671186038F0098CB0F8C836D8DB9862B208D2F41355` | verified |
| PRIMARY | `Q1_COMPARATOR_MATRIX.md` | `CB5048F7571C042D120D9F82FB01FD7D8A10D496CAF5B3D0D06628C931EEA633` | verified |
| PRIMARY | `SOURCE_AUDIT.md` | `7998975B53DBF4C8DB64FB521FB88BAE2735DA5EE509F5BAF6DC2292FA5C0460` | verified |
| PRIMARY | `handoff.yaml` | `E6FE6BD47229FCCEA9B59CB2C2B6B881E61586F4D4C59C97CB9D5A9DB275E47E` | verified |
| PRIMARY | `HASH_MANIFEST.sha256` | `A2B023143D87E29FAAB7CDB871A33EA3F6444DCB9FB97FF45071BD460B106A48` | self verified, 4/4 |

No provenance or ownership conflict was found.

## 3. Same-object contract

The exact object is retained only under all of the following:

- one fixed canonical sparse matrix `A`, with coordinates, values, and original row order unchanged;
- a preregistered sequence of dense operands `B_r`, fixed `R`, shapes, dtype, transpose flags, `alpha`, `beta`, and memory limit;
- the same in-place native SpMM function `C_r := alpha A B_r + beta C_r` and original output-row order;
- at most `K` contiguous row intervals, each represented by one legal UST v1.0.0 `TensorFormat` and executed through a native `Matmul` plan;
- every row is owned exactly once; temporary results, row placement/copy, directory, conversion, plan/JIT, workspace, launch, fallback, and peak live memory are charged;
- floating comparison uses a frozen native numerical contract and tolerance; bitwise equality is claimed only for an order-safe witness.

Multiple UST tensors and plans are an implementation composition under this same mathematical object. They are not evidence of a native first-class cover and are not themselves an N1/N2 contribution.

## 4. Independent UST v1.0.0 current-source boundary

The official [UST `Tensor` documentation](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.ust.Tensor.html) states that a UST binds its extents and data/index types to one `TensorFormat`; `convert()` creates a new UST in one specified target format. The public constructor routes are `from_package`, `from_file`, and `convert`. This supports PRIMARY's narrow finding that the documented object is one tensor–one format, not a first-class heterogeneous segment collection.

The official [`Matmul` documentation](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.Matmul-class.html) confirms a stateful plan/execute object, preparation amortization across executions, operand reset, and currently in-place output. Consequently:

- format conversion, codegen/library dispatch, plan reuse, operand reset, and repeated execution are native baseline behavior;
- user code can compose several tensors and plans, so “UST lacks a one-click cover API” is only an API fact, not a research residual;
- each segment's plan, workspace, launch, output placement, and reuse cost must be represented in the common ledger;
- a plan cache, directory, Python controller, or multi-object wrapper is directly insufficient for N2.

The PRIMARY source package pins NVIDIA/nvmath-python `v1.0.0` at commit `bb27be436099b36559bae15a307c94d76b12e902` and records source-blob hashes. This SENTRY independently confirmed the decisive public semantics in the official v1.0.0 documentation and verified the frozen source-audit package hashes; it did not run or install the repository.

## 5. Collision-first literature result

### Decisive finite family

1. Ahrens and Boman, [*On Optimal Partitioning for Sparse Matrices in Variable Block Row Format*](https://arxiv.org/abs/2005.12414), already provide contiguous row grouping, detailed runtime/memory cost models, repeated-multiply amortization, and a linear-time dynamic program for optimal 1D-VBR row grouping. This directly removes generic additive contiguous-row DP and reuse accounting as novelty.
2. Yang, Li, and Li, [*A parallel computing method using blocked format with optimal partitioning for SpMV on GPU*](https://doi.org/10.1016/j.jcss.2017.09.010), combine an optimal partitioning strategy, dynamic programming, and a hybrid CSR/ELL blocked representation. The operation and deployment differ, so this is not exact fatal; it is a stronger classic methodological subtractor than a generic “hybrid format” citation.
3. [HR-SpMM](https://doi.org/10.1145/3721145.3725770) is the same SpMM operation and combines adaptive row partitioning, long/short-row regimes, hybrid Tensor/CUDA-core execution, and auxiliary indexing. It removes “row partition + heterogeneous execution” as a contribution by itself.
4. [GeneralSparse](https://www.usenix.org/conference/atc25/presentation/wang-yaoyu) is the same SpMM operation and contributes input-sensitive sparse-matrix division, format adjustment, cost-model selection, and generated execution. It is a current strong system-level method subtractor.
5. [RSH-SpMM](https://arxiv.org/abs/2603.08734), a 2026 preprint, adds a fine-grained row-structured hybrid representation, adaptive partitioning, disjoint Tensor/CUDA paths, auxiliary structure, load balancing, and locality-aware row reordering. Its row reordering and custom kernel/format keep it outside the exact frozen object, but it materially narrows any claim based on local structural heterogeneity or hybrid two-path execution.
6. NVIDIA UST v1.0.0 supplies the legal format/action catalog and native per-object execution plans. It removes any claim based only on format plurality, dispatch, conversion, or reuse.

No one source in this bounded set is an exact direct fatal match. The union does, however, absorb the presently stated additive cover mechanism. Collision status is therefore:

`NO_VERIFIED_DIRECT_FATAL / CURRENT_MECHANISM_METHODologically_ABSORBED / SEARCH_BOUNDED_OPEN_FOR_ONE_NONPRODUCT_RESIDUAL`.

### Claim matrix

| Claim/action | Strongest subtractor | Collision class | SENTRY ruling |
|---|---|---|---|
| One UST tensor and format selection | UST v1.0.0 format DSL, conversion, dispatch | `DIRECT_SUBTRACT` | Not novel. |
| Repeated `B`, plan reuse/reset | native stateful `Matmul` | `DIRECT_SUBTRACT` | Not novel. |
| Several UST tensors plus directory and plans | composable native primitives | `DEPLOYMENT/WRAPPER_COLLISION` | API composition, not N2. |
| Contiguous row partition optimized by additive DP | 1D-VBR; Yang et al. | `ALGORITHM_KERNEL_COLLISION` | Not novel. |
| Hybrid row classes/formats and disjoint execution | HR-SpMM; RSH-SpMM; classic hybrid formats | `METHODOLOGICAL_COLLISION` | Not novel without a distinct action/guarantee. |
| Input-aware division + format adjustment + cost model/codegen | GeneralSparse | `STRONG_METHOD_SUBTRACTOR` | Generic system story absorbed. |
| Missing native one-click cover API | UST docs/source boundary | `ABSENCE_ONLY` | Cannot carry novelty. |
| One fixed, legal, non-product UST coupling or formal guarantee with action-divergence witness | no exact source found | `SEARCH_BOUNDED_RESIDUAL` | Only admissible revision target. |

## 6. Revision gate: necessity, atomicity, and sufficiency

Gate: `NONPRODUCT_UST_COVER_RESIDUAL_BEYOND_CONTIGUOUS_PARTITION_AND_HYBRID_SPMM`.

### Necessity: confirmed

Without this gate, the mechanism is the product of (a) an existing UST action catalog, (b) standard contiguous labelled segmentation, and (c) existing hybrid execution composition. Even if that product produced a speedup, it would remain vulnerable to the structural criticism “ordinary DP and wrapper engineering over current components.” It would not reliably reach the Tier B contribution floor.

### Atomicity: confirmed under one logical certificate

The gate is one proposition, not five independent success criteria:

> There exists one pre-named legal action, coupling, or formal guarantee in the frozen same-SpMM UST cover whose feasible/optimal behavior cannot be reproduced by the complete strengthened contiguous-segmentation comparator or the named hybrid-SpMM family.

The mathematical model, finite action audit, minimal action-divergence witness, algorithm/theorem statement, and future falsifier are evidence obligations for that single proposition. The revision must choose the interaction before evaluation; it may not return a menu of possible future mechanisms.

### Comparator normalization required for sufficiency

“Additive labelled DP” must not be defined too weakly. The fair comparator must include ordinary finite-state/resource augmentation for `K`, fixed `R`, memory budget, label-transition costs, and any additive or finite-state plan/setup charge available under the same information. Merely introducing a budget dimension, a reuse state, a transition penalty, or a wider format label is still standard segmentation and fails the gate.

This is a baseline clarification inside the frozen gate, not a second revision and not a new candidate mechanism.

### Sufficiency: conditionally confirmed

For Stage 0 structural-potential purposes, the gate is sufficient if the one revision supplies all of the following without changing object or mechanism family:

1. one fixed mathematical decision model over the complete finite UST action catalog;
2. one explicitly named non-product action/interaction or formal guarantee;
3. one minimal legal same-object witness on which it changes feasibility, the selected action, or a proved bound relative to the strengthened segmentation comparator;
4. one nontrivial algorithm, complexity, approximation, or formal-property statement that remains meaningful after deleting the name UST;
5. explicit subtraction against 1D-VBR, Yang-style optimal hybrid partitioning, HR-SpMM, GeneralSparse, and RSH-SpMM;
6. a finite Stage A preclaim route and failure predicate, without claiming the future result.

The revision does not need an implementation, proof of the full theorem, natural speedup, or completed benchmark. It must freeze a well-posed conditional paper kernel and a route by which later work can falsify it.

### Automatic terminal outcome

The unique revision is failed, with no pivot or second revision, if it returns only:

- additional formats, features, weights, thresholds, `K`, reuse values, environment selectors, or cost terms;
- a resource-constrained or transition-cost segmentation expressible by the strengthened finite-state DP;
- a multi-`Tensor`/multi-plan controller, directory, emitter patch, or postprocessor;
- a local byte/time heuristic without a new global property;
- a hybrid row split equivalent in action to the named SpMM family;
- row reordering, approximation, pruning-specific semantics, a new custom kernel family, or a different sparse operation.

The resulting terminal recommendation is fixed as:

`CONFIRM_STOP / BELOW_Q2_STOP__HYBRID_ROW_PARTITION_PLUS_UST_WRAPPER_ABSORPTION`.

## 7. Fair baseline set after confirmation

- **B0 — UST complete global grid:** every compatible whole-matrix format, library/codegen path, legal current algorithm/kernel selector, same dtype/`alpha`/`beta`/memory limit/`R`, native plan reuse, and separate cold/warm ledgers.
- **B1 — strengthened labelled segmentation:** same permitted boundaries, labels, `K`, memory/reuse information, and full cost, including ordinary finite-state/resource and transition-cost augmentation.
- **B2 — current hybrid-SpMM method family:** HR-SpMM, GeneralSparse, RSH-SpMM, and Yang-style optimal hybrid partitioning as method/negative subtractors; only use an executable arm when its artifact preserves the frozen object and denominator.
- **B3 — bounded exhaustive ceiling:** exact small-instance cover under the identical model; an oracle/ceiling, not a deployment baseline.

This is a finite fair family, not a universal or metric-wise synthetic union.

## 8. Structural potential and readiness

### Structural paper potential

`TIER_B_Q2_VIABLE_CONDITIONAL`. If the single certificate closes, the paper can have a coherent N2 shape: a same-object global UST cover problem with a non-product algorithm/property, an explicit relationship to a strong finite prior family, and a natural full-cost/no-gain evaluation route. Current material does not support Tier A.

### Current evidence readiness

`SOURCE_READY__MECHANISM_RESIDUAL_UNDERFROZEN`. The source, API, public SuiteSparse carrier, and CPU-side model/verifier route exist. There is no current candidate implementation, result, theorem proof, or natural action-divergence observation. Those absences do not cause STOP at Stage 0.

## 9. Finite Stage A route if mainline later accepts a successful revision

Stage A remains unauthorized. A later preclaim route can be finite:

- pin UST source/tag/commit and complete native action catalog;
- close one exact/order-safe and one floating witness for row ownership, conversion, in-place output, `alpha/beta`, tolerance, and memory;
- freeze at least 20 SuiteSparse matrices by ID/hash and preregister heterogeneous plus homogeneous/no-gain strata;
- freeze `R in {1,8}`, dense widths, format set, `K`, memory budget, and all baseline settings before measurement;
- compare the accepted non-product action with B0–B3 and record action divergence before performance;
- charge conversion, directory, planner/JIT, all plans, launches, workspace, output placement/copy, peak memory, execution, and fallback, with cold/warm and p50/p90 reporting.

The later killer remains: no faithful witness; no accepted action divergence on at least 10% of eligible natural matrices; no preregistered natural stratum with a non-dominated full-cost point; or all gains reproduced by B0/B1/B2. A positive probe is preliminary support/non-falsification only, not proof of the main claim.

## 10. Claim ceiling and final disposition

Permitted now:

> One scientific revision may test whether a non-product, same-object UST cover algorithm or formal guarantee survives the complete current UST action family, strengthened contiguous-segmentation baseline, and current hybrid-SpMM subtractors.

Prohibited now: a first segmented sparse-format claim; first hybrid SpMM; first UST format selection; novelty from missing API; a demonstrated natural regime; a demonstrated performance advantage; a proved algorithm/theorem; Stage A/B authorization.

Final state:

- Protocol: `CONFIRM`
- Decision: `CONFIRM_REVISE_ONCE`
- Gate necessary: `true`
- Gate atomic: `true`, as one residual-existence certificate
- Gate sufficient for conditional Stage 0 potential: `true`, only under the strengthened comparator interpretation
- Direct fatal found: `false`
- Search status: `SEARCH_BOUNDED_OPEN`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Stage A/B/experiments authorized: `false / false / false`
- Control or upstream files modified: `false`
- Lane return: `IDLE_REUSABLE_AWAITING_MAINLINE`
