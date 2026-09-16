# Source122 S5 divergence seed pool

## Metadata

- Assignment: `DISCOVERY-S5-20260830-SOURCE122`
- Topic: `SOURCE122-PORTFOLIO-S5`
- Frozen profile: exact-carrier-first; `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`
- Generated before all Source122 S5 external calls: `YES`
- Seeds: `10/12`
- Network-security exclusion: `PASS`
- Evidence status: `SEED_NON_EVIDENCE`; no novelty, absence, feasibility, or venue claim.

## Frozen seeds

| ID | Exact carrier candidate | S5 problem sketch | Counterfactual action | Main collapse risk |
|---|---|---|---|---|
| S5-122-01 | PyTorch recompilation + dynamic-shape policy | Static guard specializations, symbolic generalization, and eager fallback may make a myopic sequence under changing shapes. | Admit a static specialization, compile a guard-covering symbolic artifact, retire covered variants, or fall back, using past shape/guard/cost observations only. | Generic cache/control policy or current automatic dynamic-shape policy already absorbs the action. |
| S5-122-02 | `torch/_dynamo/cache_size.py` cache-entry chain | Per-frame limits may count entries without exploiting guard implication or code-size/runtime tradeoffs. | Compact semantically covered cache entries while preserving exact outputs and guards. | No safe implication relation or current cache already evicts/compacts. |
| S5-122-03 | Inductor `FXGraphCache` | Persistent graph cache keys may accumulate equivalent specializations across symbolic/static signatures. | Canonicalize or merge exact-equivalent key regions. | Ordinary deduplication or key already canonical. |
| S5-122-04 | CUDA Graph Trees dynamic-shape recordings | Shape-specific recordings can multiply memory-pool states under dynamic inputs. | Admit/retire recordings using exact replay constraints and pool-liveness cost. | CUDA Graph replay requires exact shape/address and cannot be safely compacted. |
| S5-122-05 | `torch.compiler.set_stance` | Eager-then-compile and eager-on-recompile are coarse phase policies for nonstationary shape streams. | Choose a bounded phase transition from eager profiling to a guard cover. | Existing stance directly implements the endpoint; only retuning remains. |
| S5-122-06 | `recompile_limit` / `accumulated_recompile_limit` | Hard limits ignore per-variant compile cost, runtime gain, and memory. | Replace fixed cutoff with target-specific break-even admission. | Generic ski-rental without compiler-specific structure. |
| S5-122-07 | automatic dynamic shapes | Generalizing every observed-changing dimension may over-generalize kernels with large steady-state speed loss. | Select a minimal subset of symbolic dimensions/guard regions online. | Dynamic-shape hints/configuration already expresses a finite optimal grid. |
| S5-122-08 | Triton/Inductor kernel specialization cache | Shape/dtype/alignment variants may duplicate binaries while sharing exact legality regions. | Merge or select specialization regions using kernel metadata and guard implication. | Generic autotuning/cache management; no natural carrier. |
| S5-122-09 | Compiled Autograd cache | Joint forward/backward specialization may multiply variants under changing batch/sequence lengths. | Coordinate forward/backward guard-region admission. | Changes object from Inductor/CUDA-Graph or current AOT cache already shares guards. |
| S5-122-10 | TorchBench dynamic-shape workloads | Current benchmark conclusions may hide compile/runtime/memory Pareto changes across repeated shape streams. | Establish a canonical trace-driven measurement endpoint for specialization policy. | Benchmark-only extension without new conclusion or exact trace provenance. |

## Frozen convergence

- Primary seed: `S5-122-01`.
- Primary RQ: For one `torch.compile` frame receiving an online stream of exact input signatures, can a guard-implication-aware policy choose among static specialization, a symbolically generalized Inductor artifact, retirement of covered variants, and eager fallback to minimize cumulative compile time + execution time + artifact memory while preserving PyTorch semantics, compared with current automatic dynamic-shape and fixed recompile-limit policies?
- Contribution hypothesis: `COMPILER_TOOL / METHOD_ALGORITHM`, route `N2`.
- Exact object: TorchDynamo per-frame guarded compiled-code cache feeding Inductor; CUDA Graph recordings are a conditional downstream cost, not a separate object.
- Immutable guarantee: same Python/PyTorch observable semantics and guard legality as current `torch.compile`; no approximate outputs.
- Target-specific discriminator: cache entries denote guard predicates/shape regions with a coverage relation, while static and symbolic artifacts have different compile, execution, and memory costs. The action is not plain LRU eviction.
- Counterfactual: replace hard recompilation cutoff/all-varying-dim generalization with an auditable online guard-cover admission/compaction decision.
- Minimum falsifier: current automatic dynamic shapes plus existing stance/recompile policies already implement the same action, or guard implication cannot safely certify coverage without changing semantics.
- Precommitted null: after charging compilation, runtime and artifact bytes, a simple current policy or threshold grid matches any proposed guard-cover policy.
- Selective-depth nomination: `NONE`; user-level Sol/high route is not a separate nomination packet.

