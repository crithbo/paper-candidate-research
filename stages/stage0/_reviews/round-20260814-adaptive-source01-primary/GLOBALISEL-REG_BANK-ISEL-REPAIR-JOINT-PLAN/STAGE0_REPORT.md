# GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN — Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`。
- 为什么：LLVM 当前 `RegBankSelect` 的可部署模式仍是逐指令 Fast/Greedy；官方文档把跨多指令的 Global 模式列为未来模式。因此，固定 target 的 bounded-width 联合 bank-mapping/repair DP 有可信的 N2 论文潜力。可是 Discovery 未冻结一个实际 target 的完整 `RegisterBankInfo` action catalog，故目前未能证明自然同对象上存在非局部、union 外的动作分歧。
- 下一道门：`PINNED_RBI_ACTION_CATALOG__NONLOCAL_BOUNDED_REGION_CERTIFICATE`。
- 是否需要用户操作：否；这是一次静态、有限的 Stage 0 scientific revision，不授权实现或实验。

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260814-GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Quality tier if gate closes: `TIER_B_Q2_VIABLE`
- Confidence: `0.82`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_FIDELITY_PLAN__NO_COMPILE_OR_PERFORMANCE_CLAIM`
- Novelty route: `N2`
- Candidate venue family: compiler construction / code-generation journals and systems venues
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

**Structural potential if successful.** A target-specific exact/FPT dynamic program on bounded-width legalized GMIR regions can be a credible Tier-B N2 contribution: it jointly selects legal target-provided bank mappings and repair placements while providing an explicit certificate and a no-gain fallback to stock GlobalISel. The contribution is a bounded nonlocal algorithm, not a new instruction, flag, or generic solver wrapper.

**Current readiness.** `FINITE_FIDELITY_GAP`. The frozen brief fixes the class of object but not one target triple/subtarget and its complete legal mapping alternatives. Consequently, it does not yet establish a real same-MachineFunction witness in which a region plan differs from the full current union. Missing implementation, benchmark, natural positive result, or hardware is not a stop premise.

## Frozen object and claim

The revision must pin one LLVM commit/file hash, target triple/subtarget/features, ABI, optimization level and pass controls; one legalized SSA `MachineFunction`; and the target's complete `RegisterBankInfo` mapping and repair semantics. Both candidate and comparators receive identical GMIR, RBI tables, MBFI/MBPI/profile information (if enabled), target features, and downstream pipeline.

The intended function is: select a legal instruction mapping and legal repair placement for every instruction/region boundary, minimize a declared full-cost vector, preserve verifier/ABI/diagnostic/executable semantics, and return a certificate. The candidate may claim exactness only for an explicit bounded-region class; it must delegate outside that class to the full stock union with no quality claim.

## Independent current-upstream reality check

- Check date: 2026-08-14; current official LLVM documentation identifies the observed source documentation as LLVM `23.0.0git`.
- Official documentation: [RegBankSelect](https://llvm.org/docs/GlobalISel/RegBankSelect.html), [GlobalISel](https://llvm.org/docs/GlobalISel/index.html), and [target porting guidance](https://llvm.org/docs/GlobalISel/Porting.html).
- Actual source checked: [RegBankSelect.cpp](https://llvm.org/doxygen/RegBankSelect_8cpp_source.html) and [RegBankSelect.h](https://llvm.org/doxygen/RegBankSelect_8h_source.html).
- Default/non-default action union: Fast selects the target default mapping. Greedy enumerates `getInstrPossibleMappings`, computes the per-instruction mapping/repair cost, and selects the cheapest local mapping. The supported mode enum contains Fast and Greedy only; the public documentation describes Global as an intended future mode.
- Important narrowing: current source already has `RepairingPlacement`, including CFG-aware repair placement and PHI/terminator handling. It also uses MBFI/MBPI in non-Fast mode. A candidate that merely reuses those placements, changes a local cost weight, or calls a generic optimizer is absorbed.

## Named baselines and fairness contract

1. **Current stock Fast**: target default mapping, unchanged pipeline.
2. **Current stock Greedy**: all target-provided alternative mappings, source-defined mapping/copy/repair costs, MBFI/MBPI where current mode enables them.
3. **Full stock composition**: IRTranslator → Legalizer → RegBankSelect → InstructionSelect → normal RA/scavenger/frame/scheduling/post-RA/MC, with legal compatible controls and identical full-cost ledger.
4. **Bounded exact oracle**: a tiny exhaustive enumerator for the revision's pinned region only. It is a Stage-A checker/oracle, never the proposed method or an equal deployment baseline.
5. **Adjacent subtractors**: combinatorial RA/instruction scheduling and historical GlobalISel global-mode design. They are not same-object direct coverage because they do not provide the pinned target RBI mapping-plus-repair bounded-region certificate.

All comparisons must charge region extraction/DP/certificate CPU and RSS; current and candidate RegBankSelect plus downstream compilation; object/text size; COPY and repair count; spills/frame effects; and controlled runtime only where the same executable workload is measured. COPY count alone is an invalid main metric.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence | Result |
|---|---|---|
| Same object/function/protocol | Current LLVM acts on legalized SSA MachineFunctions through target RBI; papers found are generic/adjacent | `UNKNOWN_NO_DIRECT_COVERAGE_FOUND` |
| Same scenario/workload | No deployed bounded-width region contract located | `UNKNOWN` |
| Same or weaker information | Current Greedy receives local mapping tables and optional frequency data; proposed plan must receive no more | `PASS_FOR_RESIDUAL` |
| Atomic action covered | Current source selects one MI at a time; Global is documented as future | `FAIL_DIRECT_COVERAGE` |
| Same/stronger legality, quality and guarantee | Current source guarantees legality of its selected mapping, not exact/FPT region optimum | `FAIL_DIRECT_COVERAGE` |
| Same non-worse full-cost boundary | Current mapping costs are local; downstream full cost is not a stated certificate objective | `FAIL_DIRECT_COVERAGE` |
| Comparable scale/platform/version/config | Requires one pinned target and function before a final comparison | `NOT_YET_CLOSED` |
| Sufficient depth | Current official source is sufficient for the current action union; literature search remains `SEARCH_BOUNDED_OPEN` | `PASS_CURRENT_SOURCE_ONLY` |

No `DIRECT_FATAL` was found. This is not an absence claim: `SEARCH_BOUNDED_OPEN` remains for direct paper collisions and must be rechecked before claim-bearing work.

### Nearest-prior facet matrix

| Comparator | Mapping scope | Repair placement | Target RBI action alphabet | Guarantee | Status |
|---|---|---|---|---|---|
| LLVM Fast | one MI/default | native local | yes | none beyond legal selection | baseline |
| LLVM Greedy | one MI/min local cost | native local/CFG-aware | yes | no region optimum | strongest deployed baseline |
| Historical LLVM Global design | intended multi-MI combination | unspecified deployable implementation | conceptual | none deployed | genealogy only |
| Combinatorial RA/scheduling | later/lower different decision space | spill/move oriented | not LLVM RBI exact object | solver-dependent | methodological adjacent |
| Proposed bounded DP | reducible bounded-width region | complete legal edge/operand repair action | pinned complete RBI table | exact/FPT/certified frontier on declared class | only if revision closes |

## Atomic revision gate

`PINNED_RBI_ACTION_CATALOG__NONLOCAL_BOUNDED_REGION_CERTIFICATE`

The single core proposition is:

> On one pinned target and legalized SSA MachineFunction family, the complete legal RBI mapping/repair action catalog admits two same-information region plans whose complete downstream-compatible cost differs; current Fast/Greedy and its legal configuration grid select the local plan, while a finite boundary-state recurrence selects a legal nonlocal plan and returns an exact/FPT/certified frontier without changing GMIR, ABI, or diagnostics.

The revision must provide, together, not as independent add-ons:

1. immutable LLVM/target/RBI pin plus complete mapping and `RepairingPlacement` action table for the declared instruction family;
2. one native-legal bounded diamond or loop witness, with two all-edge plans, exact mapping alternatives, repair locations, verifier legality, and full cost vector;
3. a finite sufficient state over boundary vreg-bank assignments, live repair aliases and mandatory downstream interface facts; an action-to-path/path-to-action argument; and an explicit exact/FPT/certified-frontier recurrence with a defined parameter bound; and
4. a finite Stage-A preclaim killer: stock commands and same-MIR tiny exhaustive checker must show the candidate plan is legal and is not reproduced/dominated by Fast, Greedy, or their finite same-contract configuration grid.

Failure of any clause means the contribution is an absorbed local policy, incomplete target abstraction, or generic solver wrapper. One scientific revision is allowed; it must not implement or benchmark the direction.

## Competing mechanism decision

- Selected: target-specific bounded-width DP over legal RBI mapping plus repair-edge interface.
- Rejected backup: cost-weighted Greedy/repair-placement tuning. It is current-action configuration, not N2.
- Pivot boundary: changing target, using an incomplete RBI catalog, or optimizing later RA without a fixed mapping/repair contract requires a new object/ID.

## Q1/Q2 paper shape

The plausible Tier-B narrative is a defined compiler decision problem, a target-specific algorithm/certificate with a clear no-gain boundary, current compiler baseline fidelity, and natural LLVM corpus evidence with full compile/runtime costs. Q1 status is only conditional: it would need cross-target replication or a substantially broader theorem.

- Calibration status: `PARITY_CONDITIONAL`
- Tier: `TIER_B_Q2_VIABLE` if the revision gate closes; current status remains `REVISE_ONCE`.

## Evidence and Stage-A plan

- Evidence route: `PERFORMANCE + PARETO_APPROXIMATION + COMPLEXITY_THEORY`.
- Natural route: versioned LLVM test-suite and public Clang/LLVM bitcode/MIR for the pinned target, restricted to GlobalISel/RBI-supported functions.
- 72-hour preclaim killer after Stage-A authorization: extract up to 20 fixed bounded regions; enumerate their action catalog using a separate oracle; stop the mechanism if no nonlocal witness exists, a selected repair is illegal, stock full union emits the same frontier, or the charged full cost gives no nondominated point.
- Positive ceiling: preliminary support only; neither this report nor the revision will claim performance.

## Non-relaxable quality audit

- Same-object: revision required to pin a real target/RBI and preserve same GMIR/ABI/toolchain semantics.
- Latest collision: current-source reality check independently confirms Fast/Greedy only; literature remains `SEARCH_BOUNDED_OPEN`.
- Strong fair baselines: Fast, Greedy, complete stock composition, finite oracle.
- Natural input/evidence: viable route exists but frozen corpus is not yet selected.
- Full-cost: defined above; copy count alone prohibited.
- Reproducibility: commit, target tables, flags, corpus manifests and oracle must be frozen before claim-bearing work.
- Evidence honesty: no implementation, measured residual or main result asserted.

## Discovery repair vector

- Codes: `ATOMIC_ACTION_UNCLEAR`, `NATURAL_CARRIER_GAP`, `FULL_COST_GAP`.
- Materiality: high. Discovery correctly found the current local/global gap, but should have frozen one concrete target RBI table and an all-edge nonlocal witness before Stage 0.
- Available before cutoff: yes, through current target source/RBI and supported MIR tests.
- Does this feedback alter the independent scientific decision: `NO`; it specifies the single revision gate.

## Dual-axis score

- Academic value: `56/70`
- AI executability bonus: `23/30`
- Total: `79/100`
- AI class: `AI_CORE_CONDITIONAL`; estimated `ai_core_fraction: 0.70` once the target action table is pinned.

