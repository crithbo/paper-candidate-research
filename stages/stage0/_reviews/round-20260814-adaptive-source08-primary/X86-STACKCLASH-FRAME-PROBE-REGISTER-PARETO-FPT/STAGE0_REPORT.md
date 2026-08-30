# X86-STACKCLASH-FRAME-PROBE-REGISTER-PARETO-FPT Stage 0 PRIMARY Report

## 中文摘要

- 结论：`STOP_RECOMMENDED`；质量档 `BELOW_Q2_STOP`。同 ID 不建议科学 revision。
- 原因：固定 x86-64 SysV 静态 frame 的 probe 序列在当前 LLVM 中由已定 `Offset`、`StackProbeSize` 与 alignment 直接扩展；它不是可同寄存器分配共同选择的行动。Greedy RA 已在使用 callee-saved register 与 spill 间计入首次 CSR 的 prologue/epilogue 成本。候选所称 probe scratch 位于 prologue、使用 ABI 可损坏位置或无定义值，不与函数 live ranges 形成同对象可选择的 scratch-or-spill action。余下至多是把跨页阈值加入普通 RA 标量成本，或改变 frame-object packing。
- 直接原因：不需要先测量收益；在“同 MachineFunction、同 ABI/unwind、逐页 probe 安全”合同内，缺少可定义的 non-product native action 与 target-specific frontier。强基线 union 结构性吸收其可合法部分。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260814-X86-STACKCLASH-FRAME-PROBE-REGISTER-PARETO-FPT-PRIMARY-V8.7`
- Input freeze SHA-256: brief `98E3D06CC5E553F784F5CE538FEFB573FEB9C7CF6394FEC3911DD4B871551733`; collision `1112A5339682BB204903595B81CC9A5F6628683867E1375F2F92B31E23F9E116`; discovery log `483F898C602AAC574A67FB8BF3DE47E10798125ABC9969229A9DAA223880688D`; handoff `FBBC556491622EFD960DDB2C6E557C0A0692168C75CEEAFACEC047DBCEB012D9`; manifest `369D88DDB6BF7E7E7059151DBFA086BE652D24ED093F8A1578DEF505B9407E0B`.
- Cross-assignment contamination declaration: none; queued Zcmp material was not read.
- Decision: `STOP_RECOMMENDED`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: high (0.88)
- Evidence ceiling: `E1_STATIC_PREFLIGHT`; no claim-bearing experiment was authorized or run.
- Novelty route assessed: `N2`, structurally not sustained.
- Stage semantics: conditional paper-potential screen; no empirical negative result is claimed.

## Structural paper potential vs current readiness

The candidate fails on **structural paper potential**, not readiness. Missing code, performance results or a natural corpus is irrelevant to this conclusion. Even if a solver found a better local layout, the legal same-object probe behavior is determined after the frame is fixed; the supposed fourth action (probe scratch versus a live-range spill) does not exist in the x86 SysV static-prologue contract. The remaining decision is an ordinary allocator/frame-layout cost adjustment rather than a credible Q2 N2 kernel.

## Frozen object and claim

The frozen object is one x86-64 Linux SysV MachineFunction under `-fstack-clash-protection`, fixed guard/probe size, target features, ABI, observable program output, unwind and page-by-page protection. The alleged joint plan was `(frame-object placement class, callee-save realization, probe boundary, scratch-or-spill realization)`.

Current native order is material: RA determines physical-register/spill decisions; `PrologEpilogInserter` places CSR spills/restores, finalizes frame offsets, then inserts prologue/epilogue; x86 frame lowering expands a `STACKALLOC_W_PROBING` from a numerical offset. Reordering this into planner-controlled live scratch is a changed compiler contract, not a different plan in the frozen object.

## Claim-package completeness audit

- Atomic action and mechanism: **FAIL**. Frame placement and callee-save/spill are real native actions; static probe expansion is a deterministic function of total frame size/alignment; scratch-or-spill across the prologue boundary is not an allocator action for body live ranges.
- Information/assumption contract: fixed and fair, but it exposes no non-product choice once the correct pipeline order is honored.
- Effect target/output/guarantee: a page-safe output is required by current LLVM and is not an optimization guarantee. An FPT claim over page boundaries reduces to a scalar frame-size threshold plus ordinary allocation decisions.
- Boundary/failure region: static frames, fixed ABI and fixed guard size are already enough to collapse the mechanism. Dynamic alloca would be a different stateful object and is not a rescue.
- Minimum falsifier: current source directly provides it: probe expansion reads `Offset`, probe size and alignment only; RA independently evaluates CSR versus spill; PEI finalizes the frame before prologue insertion.
- Dependencies/evidence ceiling: public source fully supports this static finding. No hardware or resource limitation is involved.

## Named baselines and fairness contract

| Comparator | Same object / information | Determinative fact |
|---|---|---|
| Current `RegAllocGreedy` | same MachineIR/liveness/register file | weighs first use of a CSR against spilling, including added prologue/epilogue cost. |
| Current `PrologEpilogInserter` | same target/ABI/frame objects | spills CSRs, finalizes frame offsets, then inserts prologue/epilogue. |
| Current `X86FrameLowering` with stack-clash protection | same frame, guard/probe size and CFI | deterministically turns `Offset` into a generic loop or block of page allocations/probes. |
| Current Clang stack-clash flags and stock assembler/linker | same binary contract | preserve the security and unwind boundary. |
| Generic frame packing/RA/ILP | same inputs only as ceiling | confirms the surviving abstraction is generic, not a candidate method. |

The full-cost ledger would include compilation CPU/RSS, text, frame bytes, probe count, CSR save/restore, spill/reload, CFI/unwind and runtime. It cannot restore a missing atomic action.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence / locator | Result |
|---|---|---|
| Same object/function/protocol | LLVM PEI and x86 prologue source act on the fixed MachineFunction/ABI. | PASS |
| Same scenario/workload | x86 `-fstack-clash-protection` static-frame prologues and current tests cover it. | PASS |
| Same or weaker information | current pipeline uses the full frame/RA information; candidate adds no lawful information. | PASS |
| Atomic action covered | CSR-or-spill is in Greedy; probe expansion is in X86 frame lowering; claimed scratch action is not native. | PASS / FAIL-for-candidate |
| Same/stronger legality, quality and guarantee | current source emits CFI and enforces bounded page allocations/probes. | PASS |
| Same non-worse full-cost boundary | existing RA accounts CSR save/restore and probe count is deterministic from frame size; any extra score is tuning. | PASS |
| Comparable scale/platform/version/config | LLVM main pinned at `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, checked 2026-08-14. | PASS |
| Sufficient source depth | official current source, flags, design, implementation review and tests inspected. | PASS |

### Nearest-prior facet matrix

| Mechanism | Native actions | Probe semantics | Joint target-specific algorithm | Disposition |
|---|---:|---:|---:|---|
| `RegAllocGreedy::tryAssignCSRFirstTime` | CSR vs spill | indirect frame-cost link | heuristic production composition | strong direct subtractor |
| PEI + `X86FrameLowering::emitStackProbeInlineGeneric` | frame/CSR placement then probe emission | exact | deterministic post-frame expansion | direct absorber of probe piece |
| LLVM x86 stack-clash test suite/review | static and dynamic probe cases, natural probe variants | exact | no missing native action established | source-reality anchor |
| Candidate FPT/Pareto DP | same known actions | exact required | no non-product state remains | structural collapse |

### Seed-distance and method-name deletion test

After deleting “StackClash” and “FPT”, the method is: choose CSR versus spill and alter frame size around a page threshold. That is scalar allocator cost tuning or generic frame packing. Restoring the name does not add a native action, a special state transition, or a new guarantee.

## Residual paper kernel

None survives under the frozen contract. Individual frame-object ordering is meaningful for offsets/debug/layout but the static x86 probe generator sees only the final allocation size/alignment. Body live ranges do not cross a prologue probe temporary. A proposal that exposes a live scratch register must change prologue/ABI/CFI semantics; a proposal that only changes page-boundary weights is a routine cost model.

## Q1/Q2 paper shape

No Q2 paper shape remains. A credible stack-clash compiler paper would need a new same-contract native transition/action or a security semantics not expressed by this frozen static-frame object. Recasting a generic solver, using dynamic alloca, changing guard/ABI, or optimizing assembler sequences would be a new candidate ID/object, not a revision.

## Non-relaxable quality audit

- Same-object: preserved in the analysis; it is precisely what exposes the absent scratch action.
- Latest collision: LLVM current main, current driver flags, current source, historical upstream implementation/review, and GCC official material were checked. `SEARCH_BOUNDED_OPEN` is not used to override direct current source facts.
- Strong fair baselines: current full pipeline is included, not a weak default-only comparison.
- Natural input/evidence: a public LLVM test route exists, but no natural result is needed for this structural STOP.
- Full-cost: specified but cannot create algorithmic substance.
- Reproducibility: commit, target, flags/source paths and finite static predicates are recorded.
- Evidence/claim honesty: this is not a claim that current code globally optimizes every possible numerical cost; it is a claim that the proposed joint action is either already a component action or non-native/generic.

## Independent current upstream reality check

- Frozen upstream commit/check date: LLVM main `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, 2026-08-14.
- Current official flags: Clang supports `-fstack-clash-protection`; `-mstack-arg-probe` and `-mstack-probe-size=<arg>` are exposed dimensions and belong to the fairness grid.
- Current source paths/symbols: `lib/CodeGen/RegAllocGreedy.cpp` (`tryAssignCSRFirstTime`, spill cost); `lib/CodeGen/PrologEpilogInserter.cpp` (CSR spill, frame finalization and insertion ordering); `lib/Target/X86/X86FrameLowering.cpp` (`emitStackProbeInlineGeneric`, block/loop expansion and CFI); x86 stack-clash implementation review D68720/tests.
- Current native mechanism: frame size is fixed before the static probe emitter; it uses probe size, `Offset` and alignment to choose an unrolled block or loop. Stack-clash tests already include natural-probe and multi-object cases.
- Discovery premise: narrowed and contradicted on action structure. The components are not merely absent knobs; their ordering prevents the claimed joint live-scratch state.

## Stage A route

None is authorized because the Stage 0 mechanism is structurally invalid. For a distinct future ID, the pre-claim killer would first require a same-MIR pair where both plans preserve executable output, SysV ABI, CFI/unwind and the page-by-page predicate while differing in a *native*, body-relevant cross-boundary action. No such action is identified here.

## Stop conditions and terminal sentinel

`BELOW_Q2_STOP__STATIC_X86_PROBE_DETERMINISM__CSR_SPILL_COMPOSITION__NO_NATIVE_SCRATCH_ACTION`.

No same-ID revision: repairing the conclusion would require one of (a) a new probe/transition semantics, (b) dynamic allocation state, (c) changed ABI/unwind/guard model, or (d) a non-native generic frame-packing solver. Each changes the frozen object or remains below Q2.

## Discovery repair vector

- Codes: `R18_PIPELINE_ORDERING_OMITTED`, `R19_PROLOGUE_SCRATCH_NOT_BODY_LIVE_ACTION`, `R20_PAGE_THRESHOLD_IS_SCALAR_COST`.
- Materiality: decisive; it changes the independent decision from conditional brief to structural STOP.
- Was the missing information available before the frozen cutoff?: yes, in current LLVM source/tests and the existing official implementation review.
- Does this feedback alter the independent scientific decision?: `NO`; it is the independent scientific decision.

## Dual-axis score

- Academic value: `28/70`.
- AI executability bonus: `20/30`.
- Total: `48/100`.

