# SEGMENTED-SCALE-W4A16-REV0 — M16 group-scale segment schedule
+
## 中文摘要
+
- 研究机会：vLLM 在冻结 gfx1151 M=16 W4A16 路径中，当前每个 Triton K tile 只能关联一个量化 group scale，因此 G=32 会把 BLOCK_K 强制夹到 32；M≤5 的 HIP skinny 实现不覆盖 M=16。
- 为什么可能值得做：候选动作把 q 个 group scale 形成一个显式寄存器 tile，并用 q 个 32-wide K 子段绑定其正确 scale；同时使用 M=16 的较小 accumulator tile。它改变的是当前源代码无法通过单纯调 BLOCK_K 合法表达的数据流。
- 为什么保留：同函数符号见证、当前 source union 和静态 full-cost 的双向风险已冻结；没有现有 M=16 同动作的官方当前 producer 命中。性能、IR、自动 hoisting 和最强论文碰撞仍是有限 Stage 0 债务。
- 下一步：仅建议独立 Stage 0 复核 current collision、完成 compiler/IR legality 和 full-cost frontier；本 Discovery 未运行任何 kernel 或模型。
+
- Status: PROPOSE_STAGE0
- Quality tier: TIER_B_Q2_VIABLE
- Opportunity origin: OTHER_EVIDENCE_BACKED_ORIGIN
- Domain tags: compiler-tool, Triton, W4A16, AMD-RDNA, quantized-linear
- Contribution route: N2
- Discovery date: 2026-08-23
- Discovery claim-pack mode: OFF
- Discovery RQ frontend mode: OFF
- Opportunity family ID: SEGMENTED-SCALE-W4A16-REV0
- Contribution type: COMPILER_TOOL
- Carrier kind: IMPLEMENTATION_CARRIER_ONLY
+
## Research question
+
Can a q=2 or q=4 register-staged scale tile and K-subsegment mapping yield a same-output, target-specific M=16 W4A16 code-generation frontier over vLLM’s one-group BLOCK_K=32 schedule, once all live-state and end-to-end costs are counted?
+
## Canonical claim package
+
- Exact object: vLLM v0.26.0 commit 568afb3a, gfx1151, dense M=16, G=32 symmetric uint4b8 GPTQ sequential, frozen four shapes.
- Atomic action: construct a 16x32 output program with a 64/128 logical K tile partitioned into 2/4 32-wide subsegments; stage one scale vector per subsegment and bind each vector only to its own subsegment.
- Mechanism: preserve scale correctness while trading current one-group K-loop control and oversized masked accumulator state for q-vector metadata staging plus smaller M=16 accumulator state.
- Fair comparator: exact selected vLLM RDNA hybrid Triton path and its per-shape overrides, not an M≤5 HIP kernel, changed representation, or foreign target.
- Endpoint: a non-dominated same-output full-cost frontier, if any; no claim of universal speedup or scale-byte reduction.
- Full cost: source/codegen and compile time; code size; numerical equivalence; W4, activation and scale movement; VGPR/LDS/occupancy/spills; grids/launches; kernel and vLLM end-to-end latency.
+
## Current collision classification
+
| Predicate | Current vLLM selected M=16 Triton path | Result |
|---|---|---|
| Same object and target | Yes. | PASS |
| Same action | No: one g_idx/scale vector per tile and explicit clamp to G. | FAIL |
| Same information | Yes for source-visible shapes and representation. | PASS |
| Same correctness contract | Yes for baseline; candidate symbolic schedule preserves it. | PASS |
| Same full-cost frontier | No candidate result exists; must be measured fairly. | UNKNOWN |
+
- DIRECT_FATAL: none within the bounded official current-source check.
- DIRECT_SUBTRACT: vLLM M=16 Triton W4A16 with G clamp.
- METHODOLOGICAL_ADJACENT: HIP W4A16 M≤5 path and generic block-scaled matmul.
- SEARCH_BOUNDED_OPEN: strongest same-object paper/implementation collision and compiler automatic-hoisting require Stage 0.
+
## Why this is not a routine tune
+
Changing current BLOCK_K alone is illegal: source explicitly says it applies the wrong group scale when BLOCK_K exceeds group_size. The proposed action must add a q-group scale representation and a subsegment mapping, then jointly account for its additional scale live state and M=16 tile geometry. A flag sweep, generic unrolling, scalar per-element scale gather, or a claim based only on M/BLOCK size is excluded.
+
## Fidelity closure plan
+
- Status: FINITE_FIDELITY_GAP.
- Small witness: the two 32-wide group schedule versus a q=2 64-wide logical segment.
- Stage 0 checks: direct collision search; frozen compiler/Triton IR comparison; exact source action interface; M=16 carrier; full-cost protocol and no-gain region.
- Structural stop: direct M=16 action coverage, same effective compiler lowering, or no non-dominated full-cost vector.
- Execution readiness: E1 static source preflight complete; E2 not run and not required by this assignment.
+
## Q2 sufficiency hypothesis
+
A complete Q2 paper would require more than a kernel tune: it must provide a compiler schedule-construction rule, semantics proof/invariant, target-specific cost model or certified selection condition, fair baselines and natural M=16 evidence. This package only establishes that this shape is finite and not currently absorbed by the inspected source union; Stage 0 decides whether the algorithmic and collision contracts survive.
