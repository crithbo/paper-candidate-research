# SEGMENTED-SCALE-W4A16-REV0 Stage 0 Report

## 中文摘要

- 结论：`STOP`。
- 为什么：冻结的 M=16/gfx1151 vLLM 路径确有一组 scale-per-`BLOCK_K` 的限制，因而 q=2/4 的分段映射在语义上可定义；但候选给出的实际构造只是将 q 次合法的 32-wide group iteration 放进一个更大的外层 tile，并显式加载 q 个本来必须读取的 scale。它没有给出 union 外的 target-specific 编译算法、选择规则、复杂度/近似保证或不可由 loop fusion、unrolling 与 tile 配置表达的机制。规模、精度与 full-cost 都未改变；收益也未被结构性地强制。
- 下一道门：无。该同 ID 应停止；若以后以同一对象提出可审计、非产品式 schedule-construction algorithm（而不只是 q/tiling 设置），必须使用新 Topic ID。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260823-SEGMENTED-SCALE-W4A16-REV0`
- Input freeze SHA-256: `7EBDF44A101BABD3BFC6230E82F4D9D61B766296FF0FF6DF560C2A746044FD85`
- Cross-assignment contamination declaration: 本审查未读取或复用其他候选的科学材料；仅使用本 assignment 列出的 Discovery 包、用户附件、官方 vLLM 上游和公开一手/论文资料。
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.84`
- Evidence ceiling: `STATIC_SOURCE_AND_SEMANTIC_AUDIT_ONLY__NO_COMPILED_OR_PERFORMANCE_CLAIM`
- Novelty route: 所称 `N2` 未闭合；抽象的“跨多个 group 使用 scale tile”已是 block-scaled GEMM 常规动作，未形成同对象的新 `N1`。
- Candidate Q1 venue family: ML systems/compiler（OSDI/MLSys/CGO 类）；当前不具备合格 Q2 论文核。
- Stage semantics: conditional paper-potential screen; this report does not establish any kernel performance claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: 对“固定的 q=2/4 register tile 实现”本身为低。即使它有性能结果，也首先是单 target、四 shape 的手工 fusion/tile 选择；没有可推广的算法或保证，不能仅凭正结果升格为 Q2 论文。
- Current evidence-acquisition readiness/risk: 资源和自然 carrier 足以开展后续工程研究：官方 commit、四个 source-recognized shape、同函数 reference test 与明确 full-cost 项都已定位。该 ready 状态不改变本次结构性 STOP。
- Why missing implementation/results/proof/hardware is or is not structurally fatal: 不以缺实现、GPU 或结果裁决；STOP 的理由是候选动作的可分解性和缺失的研究核，而非这些缺失。

## Discovery provenance

- Opportunity origins: `OTHER_EVIDENCE_BACKED_ORIGIN`。
- Domain tags: compiler-tool, Triton, W4A16, AMD-RDNA, quantized-linear。
- Paper genealogy: vLLM dense W4A16 source → target-specific subtractors（HIP skinny、Marlin）→ generic block-scaled Triton/CUTLASS methods → tensor-program schedule literature。
- Discovery method revision: frozen package reports `OFF__OFF__OFF`。
- Discovery claim-pack mode: `OFF`。
- Opportunity family ID: `SEGMENTED-SCALE-W4A16-REV0`。
- Contribution type and type-contract verdict: `COMPILER_TOOL`; FAIL。一个可选 kernel tile 不是完整 compiler-tool 贡献类型合同。
- Independently audited A/C/D/E coordinates: A=scale-to-K mapping; C=full W4A16 dense GEMM semantics; D=non-dominated full-cost frontier; E=only a conditional schedule hypothesis. A/C 可定义，D/E 未被算法性机制连接。
- Backtest reference and status: 不适用；Discovery 方法不是候选证据。

## Frozen object and claim

对象保持为 vLLM `568afb3a13806beb53bb2e6bd518269357b237c0`、AMD `gfx1151`、dense M=16 W4A16 GPTQ sequential uint4b8、G=32、FP32 accumulation/FP16 output、四个冻结 (K,N) shape。候选只可将 q=2/4 个连续 G=32 K group 的 scale 作为 register-staged tile，并保持

`ScaleUsed[n,k] = S[n,floor(k/32)]`。

这一定义确实保持 packed nibble、group mapping 和数值函数；它不承诺减少 scale bytes。

## Claim-package completeness audit

- Atomic action and mechanism: `q` 个 scale vectors 加载后，对 q 个 32-wide segment 分别 dequantize and accumulate。
- Information/assumption contract: 输入 shape、packing、target 和 source-visible configuration 固定；没有 profile、额外 oracle 或未来信息。
- Effect target/output/guarantee: 只允许同输出 full-cost Pareto 假设；无已证明的速度、occupancy 或成本保证。
- Boundary/failure region/competing explanation: q-vector live state、larger weight tile、spill/occupancy、更多 programs；竞争解释是 current configuration 加 unroll/fusion 已表达同一构造。
- Minimum falsifier: candidate lowering 等价为 q 次 group loop，或没有 union Pareto；前者已在静态 action analysis 中成立为结构性解释。
- Dependencies and evidence ceiling: execution须等未来独立 assignment；本次未执行 kernel/model。
- Opportunity-family relation audit: 同一 dense M=16 object，非 M≤5 HIP route；PASS。
- Independent search identity/scope: official vLLM frozen commit、Triton/CUTLASS current docs、Marlin primary source/metadata；见 `CURRENT_UPSTREAM_REALITY_CHECK.md` 与 `COLLISION_AND_BASELINE_AUDIT.md`。
- Evidence-ledger integrity and contradiction disclosure: Discovery 的旧路径在实际 commit 中路径已漂移至 `vllm/model_executor/kernels/linear/mixed_precision/`; blob SHA 一致。该机械修正不改变 source finding。

## Positive opportunity map

- Natural workloads: 当前 `_GFX1X_PREFILL_OVERRIDES` 明列四个 G=32 形状，注释为真实 model projection shapes；它们是合理的 implementation carrier，不是已观测的自然收益。
- Observed or expected cost/headroom: source 注释显示 G=32 强制 `BLOCK_K=32`，并以较大 `BLOCK_M`/pipeline amortize 小 K tile。候选可能改变 loop/control 与 register composition，但没有静态下界要求它优于该 current choice。
- Mechanism-specific prediction: 若完整 non-product schedule constructor 存在，必须能在不增加强 baseline information 的情况下选择 q/BM/BN/warps/stages，并给出比“q 次 source group iteration + current finite configurations”更强的合法性或成本结论；当前没有这种构造。

## Named baselines and fairness contract

1. **Current dense vLLM Triton route**：commit-pinned `triton_w4a16.py` + `rdna_hybrid_w4a16.py` 的 per-shape overrides、`BLOCK_K=min(BLOCK_K,G)`、warps/stages。相同 object、信息与输出，是主要强基线。
2. **Same dense semantic, explicit per-K group index baseline**：对每个 K element/segment 计算 `floor(k/G)` 并取 scale。它是较弱但可辨别“scale tile 是否真有必要”的 negative control；full-cost 必须含 index/address cost。
3. **Current HIP skinny route**：`wvSplitK_int4_g` 是同格式/同 group 的强 deployment subtractor，但 dispatch 合法域为 M≤5；不能冒充 M=16 同函数的 equal-quality baseline。
4. **Marlin / Triton block-scaled / CUTLASS**：分别为 CUDA-only same-format kernel、不同 FP4/FP8 scale-MMA abstraction、不同 NVIDIA target/storage baseline；均用于减去通用思想，不作为 gfx1151 exact competitor。

任何未来比较须计：codegen/compile、kernel code size、q-scale live registers、weight/activation/scale movement、VGPR/LDS/occupancy/spill、program/launch、correctness、kernel latency 和 vLLM end-to-end latency。不得把 scale bytes 写作收益。

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | Result |
|---|---|---|
| Same object/function/protocol | vLLM frozen dense M=16 path is exact; Triton/CUTLASS docs use different formats/targets | FAIL for external direct coverage |
| Same scenario/workload | Four vLLM prefill shapes are in exact source; external documents not gfx1151 dense GPTQ | FAIL |
| Same or weaker information | External block-scaled methods use public tensor/scales but different layouts/instructions | PARTIAL |
| Atomic action covered | Current vLLM has no q-scale tile; generic block-scaled work loads multiple scales in K tiles | PARTIAL |
| Same/stronger legality, quality and guarantee | Same output invariant is only symbolic for candidate; external format guarantees differ | FAIL |
| Same non-worse full-cost boundary | No executed full-cost frontier for candidate or exact external producer | UNKNOWN |
| Comparable scale/platform/version/config | Marlin is CUDA-only; CUTLASS is NVIDIA SM100; Triton docs target MX/FP4/FP8 | FAIL |
| Sufficient full-text/implementation/reproduction depth | vLLM source depth sufficient; exact same-object paper search remains bounded open | PARTIAL |

No item satisfies all eight predicates, so there is no `DIRECT_FATAL` implementation/paper collision. This does **not** rescue the candidate: the remaining action is a generic composition rather than a paper kernel.

### Nearest-prior facet matrix

| Source/family | Object | Action relation | Classification | Consequence |
|---|---|---|---|---|
| vLLM dense Triton + RDNA hybrid | exact dense M=16/gfx1151 W4A16 | one scale vector per K tile; clamps K to G | `DIRECT_SUBTRACT` | required primary baseline |
| vLLM HIP skinny | W4A16/G32 but M≤5 only | group index per lane/chunk, across groups | `DEPLOYMENT_BASELINE` | prohibits broad “first multi-group K” claims |
| vLLM Marlin selector | W4A16 family but CUDA-only | different target kernel | `DEPLOYMENT_BASELINE` | not an AMD M16 equal baseline |
| vLLM MoE W4A16 path | MoE, not dense linear | group metadata within routed expert operator | `METHODOLOGICAL_ADJACENT` | subtracts generic metadata argument |
| Triton block-scaled matmul | MX/FP4/FP8 scale-MMA | scale tiles/preshuffle/pipeline | `METHODOLOGICAL_ADJACENT` | subtracts “multi-scale tile” as new abstraction |
| CUTLASS block-scaled GEMM | NVIDIA Blackwell MX | 1x32 scales + swizzle/hardware MMA | `METHODOLOGICAL_ADJACENT` | different target/format, strong conceptual subtractor |
| MARLIN | CUDA FP16xINT4 | bespoke scheduling/pipelining | `DEPLOYMENT_BASELINE` | establishes strong evidence expectations, not direct coverage |
| FlashInfer exact M16/gfx1151 implementation/paper | not sufficiently established in bounded sources | unknown | `SEARCH_BOUNDED_OPEN` | no absence inference; not decisive here |

### Seed-distance and method-name deletion test

Remove “segmented scale tile”, “Triton”, “q”, and target names: the mechanism becomes “unroll/fuse q consecutive dequantize–dot loop iterations, retain q metadata vectors, and tune the tile.” This is ordinary loop/tile composition. No distinct decision problem, non-product constraint, data structure, or guarantee remains. Test result: FAIL.

## Competing mechanism decision

- Selected mechanism: none accepted.
- Registered backup: none; introducing a schedule selector/cost model now would materially create a different N2 claim rather than evaluate the frozen action.
- Pivot boundary: a future candidate must freeze a general, target-specific selection/guarantee before evaluation; it must not relabel a finite q/config table as an algorithm.

## Residual paper kernel

Residual engineering hypothesis exists—group-bound K iteration may be retiled with correct scale indexing—but it is not a residual **paper** kernel. The q-scale tile is merely the necessary local representation for fusing already-legal group iterations. Its register/liveness cost is additive and it offers no non-product coupling with the M=16 accumulator tile established by source semantics.

## Evidence route

`PERFORMANCE`, conditionally. A future new ID could test it, but this topic lacks the N2 mechanism required to justify that experiment as a paper probe.

## Performance-optimization admissibility

- Same-function contract: PASS symbolically; per-k scale, packing, FP32 accumulation and FP16 output fixed.
- Algorithmic delta: FAIL; fixed unroll/retiling and source configuration change.
- Full-cost ledger: complete enough as a future ledger but no nontrivial algorithm makes the ledger paper-bearing.
- Strong-implementation fairness: current exact route and adjacencies are named.
- Generality and failure boundary: confined to one G, one target, four shapes, q∈{2,4}.
- Why not routine tuning: it **is** routine unless a separately frozen non-product compiler construction is supplied. Source’s existing shape override table also demonstrates that tile/warps/stages selection is already a current tuning surface.

## Q1/Q2 paper shape

- Problem: exact group-scale quantized GEMM on a current AMD serving path is relevant.
- Contribution: insufficient: no new general compiler construction, complexity/property, or natural law.
- Evidence plan: a fair target-specific performance study is feasible but cannot compensate for the contribution gap.
- Expected paper narrative: at most an implementation case study; below the Q2 threshold.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`.
- Reference set: TVM (OSDI 2018), Ansor (OSDI 2020), MARLIN (primary arXiv artifact/domain neighbor).
- Status: `PARITY_NOT_PLAUSIBLE`.
- Contribution-shape gap: those anchors introduce a compiler/search construction or substantive kernel design with evidence across defined scopes; this candidate specifies one manually fused schedule.
- Evidence-shape gap: no experiment is required at Stage 0, but eventual evaluation would need kernel, serving, codegen and full-cost evidence.
- Stage A closure plan: not authorized; a performance probe would test implementation maturity, not repair the absent research mechanism.

## Non-relaxable quality audit

- Same-object: PASS for current baseline; external direct collision absent only within bounded scope.
- Latest collision: no direct fatal established; generic scale-tile prior art is a material subtractor.
- Strong fair baselines: sufficient to determine that the frozen action is a composition, not a distinct mechanism.
- Natural input/evidence: finite source-recognized shape carrier; it does not prove prevalence.
- Full-cost: correctly enumerated, but no algorithmic residual remains to measure.
- Reproducibility: frozen source blobs and symbolic invariant are retained.
- Evidence/claim honesty: no speed, register, compiler-lowering or natural-frequency result is claimed.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: E1 source preflight PASS; E2 not run.
- AI executability class: `AI_CORE_EXECUTABLE` only for a future implementation study, not for a sufficient academic core.
- Estimated ai_core_fraction: `0.75` of an engineering probe; it cannot raise the academic verdict.
- 72-hour first evidence: would be output equivalence plus compiler/occupancy/full-cost comparison, but is not authorized for a stopped topic.
- Human-only items and why they are non-decisive: hardware access may limit later performance evidence; it is not a stopping reason.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`.
- Complete action and native semantics are finite and same-object: yes.
- Comparator, denominator, full-cost and small-witness plan: finite and auditable.
- Why an unimplemented interface/format/checker is or is not structurally fatal: not structurally fatal; the structural failure is generic composition.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: vLLM `568afb3a13806beb53bb2e6bd518269357b237c0`, checked 2026-08-23.
- Current official documentation checked: Triton block-scaled matmul documentation; CUTLASS block-scaled GEMM documentation; official vLLM GitHub frozen source tree/blobs.
- Actual source paths/symbols checked: `.../mixed_precision/triton_w4a16.py` (`g_idx`, scale broadcast, clamp); `rdna_hybrid_w4a16.py` (`MAX_SKINNY_BATCH_SIZE=5`, overrides, dispatch); `csrc/rocm/skinny_gemms_int4.cu`; `.../marlin.py`; `compressed_tensors_moe_w4a16_flydsl.py`.
- Default/non-default flags, thresholds and configurations checked: M≤5 HIP dispatch; M>5 Triton; G=32 overrides; `BLOCK_K=min(BLOCK_K,group_size)`; target eligibility for Marlin/RDNA3.
- Discovery absence claim confirmed, narrowed or contradicted: narrowed. Exact dense current route lacks q-scale staging at source, but generic multi-scale tiling is already an established methodological action. No external absence claim is made.
- Any non-tuning residual that remains: none demonstrated by this frozen action.

## Stage A highest-risk probe plan

- Risk-bearing premise: target source selection does not already lower an unrolled multi-group loop to an equal action, and scale/live-state tradeoff creates a non-dominated vector.
- Cheap discriminating probe or counterexample search: not authorized because the topic fails before Stage A. For a new ID, compare exact q=1 versus q=2/4 plus per-element indexing, including compiler IR and full-cost.
- Negative result that kills the direction: no union Pareto or lowering equivalence.
- Positive-result ceiling: even a positive result would show an implementation improvement, not prove this topic’s missing N2 claim.

## Stop conditions

`STOP__ROUTINE_SEGMENTED_SCALE_LOOP_FUSION_WITHOUT_NONPRODUCT_COMPILER_CONSTRUCTION`.

## Discovery repair vector

- Codes: `CLAIM_MECHANISM_UNCLEAR`, `Q2_SHAPE_GAP`.
- Materiality: material; Stage 0 independently finds that correct scale mapping does not by itself constitute a compiler algorithm.
- Was the missing information available before the frozen cutoff?: yes; current source and generic block-scaled docs were available.
- Does this feedback alter the independent scientific decision?: `NO`.

## Dual-axis score

- Academic value: `34/70`.
- AI executability bonus: `22/30`.
- Total: `56/100`.

