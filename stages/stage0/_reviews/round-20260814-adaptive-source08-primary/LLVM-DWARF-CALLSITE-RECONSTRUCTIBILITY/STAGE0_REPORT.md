# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY Stage 0 PRIMARY Report

## 中文摘要

- 结论：`REVISE_ONCE`，仅可重审静态原子门 `SAME_MIR_TWO_PLAN_CLOBBER_WITNESS__TARGET_SPECIFIC_CALLSITE_FRONTIER`。
- 原因：当前 LLVM 已把 debug 指令与寄存器分配解耦，并在分配后用 `LiveDebugValues` 追踪 copy、spill、restore、clobber；`DwarfDebug` 亦会构造 call-site parameter。它们是必须纳入的强同对象基线，却没有显示一个在分配时以 call-site 可重构性为目标、在完整 native 行动空间上优化的算法。候选尚未冻结两份完整的 native-legal 同 MIR 计划及保 future-action 的有限 frontier，不能在这一轮直接推荐通过。
- 下一道门：用一个固定 target、ABI、优化级与 debug flags 的 clobber MIR，给出两个保持程序、ABI、unwind 与 DWARF 语义的完整分配/插入/表达计划；同时给出 non-generic 的 bounded call-site frontier recurrence、复杂度与 current composition 映射。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-PRIMARY-V8.7`
- Input freeze SHA-256: brief `C620BF823B544CC166014498AD594B635E1C0D27C8A09486F905D139FC81C030`; collision matrix `FA59D6FD1A418B1789D88A012855735814957C5868F102F7566585AFDCFC0C8B`; deep review `C44FC7D9C0C3F3536CCC02DBF0C40E3537F08B7DBEFB3F3CBBA556AD0D6FA1FE`; handoff `41BBA4E930ACBF873A5B4548C80E8379BE4ED921D8772CD11F77A9E0131C223C`; source manifest `3B07522D10261545A0A83499BAA31A9F49D31EB82D5E23AE357C818568E3F37C`.
- Cross-assignment contamination declaration: none; the queued x86 Stack Clash assignment was not read.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: medium (0.72)
- Evidence ceiling: `E1_STATIC_PREFLIGHT`; no claim-bearing run was authorized or performed.
- Novelty route: `N2`
- Candidate Q1 venue family: compiler / programming-languages systems venues; credible Q2 floor, conditional Q1 shape only.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

If successful, a compiler-specific bounded-frontier algorithm that jointly chooses already legal allocation/spill/rematerialization actions to retain call-site reconstructibility, with an exact/FPT/certified Pareto guarantee beyond LLVM's post-allocation propagation, is a credible `TIER_B_Q2_VIABLE` N2 paper. The contribution must be an allocation-time optimization, not another debug-info emitter.

Current readiness is moderate: upstream source, MIR tests and `llvm-dwarfdump` are public and CPU-only; the remaining gap is a static certificate, not a resource requirement. Missing implementation, corpus results and a completed theorem are therefore not STOP reasons. They limit the present claim to potential and make the single revision necessary.

## Frozen object and claim

Frozen object: one optimized C/C++ function lowered to fixed pre-register-allocation MachineIR on one pinned LLVM target/ABI, with a fixed call-site clobber trace and ordinary LLVM/DWARF semantics. A plan may choose only native-legal allocation, copy, spill/reuse, entry-value/rematerialization-expression, or unavailable actions. It must preserve executable behavior, ABI, unwind, machine-code legality, and valid DWARF. The objective is the Pareto vector `(valid call-site parameter reconstruction, text/DWARF bytes, added moves/spills/frame pressure, compile work)`.

The proposed mechanism is a bounded call-site-clobber frontier DP. Its input must include live intervals, fixed call clobbers, target register classes, valid DWARF-expression grammar, legal spill slots and declared resource budgets. Its output must map bijectively to a complete native plan; it may not edit DWARF after code generation to claim a retained value.

## Claim-package completeness audit

- Atomic action and mechanism: select from *existing* native locations/transfers before or during allocation, then emit the corresponding legal debug expression. No new ISA action or changed source semantics is permitted.
- Information/assumption contract: all plans receive the same MachineIR, target/ABI, debug metadata, call sequence, allocatable registers, spill policy and budget. Profile information is excluded from the primary claim.
- Effect target/output/guarantee: improve the valid-reconstruction/full-cost Pareto frontier, with exactness for a declared bounded clobber width or an explicitly qualified approximation/certified frontier.
- Boundary/failure region: if the complete current allocator plus debug passes already realizes every legal point, or the recurrence collapses to ordinary RA cost tuning, the direction stops.
- Minimum falsifier: one clobber MIR in which no two complete legal plans differ, or every candidate point is dominated by the current composition at the same budget.
- Dependencies and evidence ceiling: public LLVM source, a pinned target, MIR parser/verifier, `llvm-dwarfdump`, and a finite CPU route are available. No proprietary stack or GPU is relevant.

## Named baselines and fairness contract

| Comparator | Same object / information | Fair role | Cannot be omitted |
|---|---|---|---|
| Current LLVM allocation + `LiveDebugVariables` / instruction-reference handling + `LiveDebugValues` + `DwarfDebug` | yes, pinned compiler/target/options | primary production baseline | tracks locations through copies, spills, restores and clobbers; emits call-site info |
| Current allocator with normal legal cost knobs, same `-g` / call-site flags | yes | finite configuration-grid baseline | prevents a parameter-only claim |
| Same-MIR generic exact RA / CP/ILP oracle | same input but not deployment method | ceiling/negative control only | distinguishes a target-specific recurrence from a generic solver |
| DWARF entry-value/call-site encoding alone | same emitted program, but no allocation intervention | subtractor | tests whether an emitter-only explanation suffices |

Full cost includes allocator/DP work, copies, spills/restores, frame and unwind effect, text and DWARF bytes, compile CPU/RSS, debug-validity checks, and program runtime. Comparing only coverage is invalid.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence / locator | Result |
|---|---|---|
| Same object/function/protocol | LLVM current documentation defines final DWARF locations after codegen; the candidate fixes pre-RA MachineIR and allocation actions. | PARTIAL |
| Same scenario/workload | `DwarfDebug` supports call-site parameters and entry values, including x86 MIR tests. | PASS |
| Same or weaker information | Current passes use actual post-RA code; proposed planner would have pre-RA live-interval and debug metadata, not extra oracle information. | PARTIAL |
| Atomic action covered | Current code tracks native moves/spills and emits expressions, but the inspected material does not show a joint allocation-time Pareto planner. | UNKNOWN |
| Same/stronger legality, quality and guarantee | Current propagation is sound location tracking; no declared coverage-vs-code-cost Pareto guarantee was found. | UNKNOWN |
| Same non-worse full-cost boundary | Current allocation cost is production-grade; candidate has not supplied a complete equal-cost plan. | UNKNOWN |
| Comparable scale/platform/version/config | LLVM main pinned at `e72ba6cf366a3180cbf5a8690d9e50665880ab76` on 2026-08-14. | PASS |
| Sufficient full-text/implementation depth | Official docs/source and MIR test evidence are sufficient to narrow the residual, but not to prove absence of all allocation-time policies. | PASS |

There is no direct-fatal finding. The key current-source result is subtractive: LLVM instruction referencing deliberately unlinks ordinary debug instructions during register allocation, then `LiveDebugValues` subsequently joins values to physical registers/stack slots. This proves that post-RA propagation must be the strongest baseline; it does not prove an allocation-time debug-quality objective is already optimized.

### Nearest-prior facet matrix

| Work / mechanism | Same MIR allocation action | Call-site DWARF semantics | Allocation-time Pareto algorithm | Complete full-cost objective | Disposition |
|---|---:|---:|---:|---:|---|
| LLVM `LiveDebugValues` instruction-reference implementation | no (post-RA tracking) | partial/yes | no | no | strong subtractor |
| LLVM `DwarfDebug` call-site parameter construction | no | yes | no | no | direct emitter subtractor |
| Generic combinatorial RA (e.g. Unison) | potentially | no LLVM call-site contract | generic | code-quality objective | ceiling only |
| Candidate bounded clobber frontier | required | required | required | required | not yet statically closed |

### Seed-distance and method-name deletion test

Deleting the name “Pareto DP” leaves a meaningful question only if the planner's state retains target clobber/physical-location/DWARF-expression legality and its output maps to native plans. If that state is merely `(interval, register, cost)`, it is ordinary RA tuning and fails the registered gate.

## Competing mechanism decision

- Selected mechanism: allocation-time, target-aware call-site preservation frontier.
- Registered backup: none. A post-processing-only expression recovery or `LiveDebugValues` extension is explicitly not a pivotable substitute.
- Pivot boundary: a revision that changes the function, target/ABI, debug contract, source semantics, or uses non-native storage/action is invalid.

## Residual paper kernel

The defensible residual is narrow: a call instruction can clobber the only native location of a value needed to describe a callee parameter; LLVM may later recover an expression or mark it unavailable. A planner could be new only if it selects an existing legal pre-clobber physical location/spill/rematerialization route jointly with allocation, under a bounded trace, and proves a non-generic frontier property. This is not established yet.

## Evidence route

`PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`.

The first claim-bearing Stage A route is finite and CPU-only: fixed target commit, at least 30 natural optimized debug functions plus MIR reduction; emit two plan forms; check executable equivalence, ABI/unwind and `llvm-dwarfdump` validity; measure the complete ledger. This is not authorized in this assignment.

## Q1/Q2 paper shape

- Problem: optimized compiler debug fidelity is constrained by physical locations at calls.
- Contribution needed for Q2: a full target-specific algorithm and a limited theorem/certified frontier, not a local coverage heuristic.
- Evidence plan: natural source/MIR corpus, current pipeline and finite configuration grid, generic oracle ceiling, full code+debug cost, explicit failure strata.
- Expected narrative: conditional Q2 is plausible; Q1 requires broader target/generalization and a stronger guarantee.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Contribution-shape gap: unclosed same-MIR two-plan witness and target-specific recurrence.
- Evidence-shape gap: Stage A must show non-dominated natural points; it is not a Stage 0 admission requirement.
- Stage A closure plan: pre-claim fidelity gate first, then the registered finite killer below.

## Non-relaxable quality audit

- Same-object: preserved only if both plans use the same pre-RA MachineIR, ABI and LLVM/DWARF reader semantics.
- Latest collision: independently checked against LLVM main and current documentation; no absence inferred from a transport failure.
- Strong fair baselines: current full pipeline, finite legal knobs, emitter-only subtractor, generic oracle.
- Natural input/evidence: LLVM tests/Test-Suite plus public projects form a finite route, not current positive evidence.
- Full-cost: frozen above; coverage-only comparisons are prohibited.
- Reproducibility: fixed commit, target flags, MIR, verifier/dwarfdump, commands and hashes must enter the revision package.
- Evidence/claim honesty: no performance, theorem or fault result is claimed.

## Evidence path and AI completion

- E1 execution-readiness audit: completed as a static source check only; no scientific inference from execution readiness.
- AI executability class: high for MIR generation/reduction, plan enumeration, verification and ledger construction.
- Estimated ai_core_fraction: `0.73`.
- 72-hour first evidence: produce the two-plan static witness and action catalog; if it cannot be made native-legal, stop before a performance run.
- Human-only items: none claim-critical; target choice and paper framing may need normal supervision.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`.
- Complete action/native semantics: finite for a fixed target, but the candidate has not yet enumerated them.
- Comparator/denominator/full-cost/small-witness plan: specified above and must be materialized in revision.
- Unimplemented interfaces are not fatal: the required compiler and checkers are public; the risk is scientific non-separation, not access.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: LLVM main `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, public `git ls-remote`, 2026-08-14.
- Official documentation checked: `InstrRefDebugInfo` and `SourceLevelDebugging`, both current LLVM docs.
- Actual source paths/symbols checked: `lib/CodeGen/LiveDebugValues/LiveDebugValues.cpp`; `LiveDebugValues/InstrRefBasedImpl.cpp`; `LiveDebugVariables`; `lib/CodeGen/AsmPrinter/DwarfDebug.cpp` (`collectCallSiteParameters`, call-site parameter emission).
- Default/non-default surface: instruction-reference use, `LiveDebugValues` VarLoc/InstrRef implementations, target `ShouldEmitDebugEntryValues`, and `-debug-entry-values` test route. Non-default entry values are a baseline dimension, not a claimed residual.
- Discovery absence claim: narrowed. Current LLVM already follows copy/spill/restore transfers, tracks stack-slot clobbering, and supports entry-value/call-site parameter emission. The unconfirmed residual is the allocation-time choice of which otherwise legal action to take under an equal full-cost budget.
- Non-tuning residual: conditional only; it becomes viable solely if the revision closes the registered native two-plan/frontier certificate.

## Stage A highest-risk probe plan

- Risk-bearing premise: a target-specific planner has at least one legal plan point outside current composition and not explained by a generic RA oracle.
- Cheap discriminating probe: one clobber MIR with fixed target/ABI; enumerate the complete legal two-plan action map before running a corpus.
- Negative result that kills the direction: no native two-plan divergence, invalid DWARF/executable/unwind output, or every point dominated by current composition at matching full cost.
- Positive-result ceiling: preliminary support only; it would not prove a general paper claim.

## Stop conditions

1. The revision finds that the two plans differ only in debug metadata after the same generated code, rather than native allocation/spill/rematerialization actions.
2. The finite state is ordinary RA cost tuning or a generic CP/ILP wrapper without target/DWARF-specific guarantee.
3. Current LLVM's complete action catalog reproduces every witness plan at equal information and full cost.
4. The purported plan breaks ABI, unwind, executable equivalence, target code legality or DWARF validity.

## Discovery repair vector

- Codes: `R17_CURRENT_DEBUG_PIPELINE_UNDERMODELED`, `R18_STATIC_NATIVE_PLAN_CERTIFICATE_MISSING`.
- Materiality: material for a future candidate package; it prevents overclaiming a novel planner.
- Was the missing information available before the frozen cutoff?: current LLVM documentation and source were available for inspection.
- Does this feedback alter the independent scientific decision?: `NO`; it explains the `REVISE_ONCE` gate.

## Dual-axis score

- Academic value: `51/70`.
- AI executability bonus: `22/30`.
- Total: `73/100`.

