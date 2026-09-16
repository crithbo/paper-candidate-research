# AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP — Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`，不是因为尚未实现或没有性能结果，而是当前候选尚未证明存在一个不被当前 HWASan 栈标记与 AArch64 后端组合吸收的、同报告契约的两计划动作分歧。
- 为什么：当前官方设计已明确采用“单一 base tag + `ReTag(BaseTag, M)`”来避免多个活 tagged stack pointer 的寄存器压力；当前源码亦已完成 alloca 选择、对齐/填充、per-alloca tag、生命周期 tag/untag。它是很强的直接 subtractor，但尚未单独证明所有同报告、固定函数的 tag-to-layout-to-pressure 联合 frontier 都被枚举。
- 唯一修订门：`SAME_REPORT_TWO_PLAN__LIVE_TAG_RETAG_ASSIGNMENT_FRONTIER_CERTIFICATE`。它必须给出一个固定 AArch64 Linux HWASan 函数的两个合法计划、完整 native action catalog 和 target-specific finite frontier；否则停止。
- 下一道门：独立 confirmation；本报告不授权 Stage A/B。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260814-AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP-PRIMARY-V8.7`
- Input freeze SHA-256: brief `F20DAFB65B69BF770B196583DC7792E353C094D49442186A50B7EA84BD972056`; discovery handoff `1B39FBF1AC4BE84809D0A62534094918E23510E539870C3C265A36E5E4287A75`
- Cross-assignment contamination declaration: none; only the frozen S2 package and current first-party sources were used.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the sole gate
- Confidence: `0.82`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Novelty route: `N2`
- Candidate Q1 venue family: compiler construction / PLDI-CGO-CC style; current evidence supports at most a conditional Q2 shape.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a target-specific bounded Pareto algorithm that preserves a stock HWASan report/no-report contract while jointly selecting existing tag/layout/temporary actions could be a credible compiler N2. It must be more than reordering allocas or retuning register allocation.
- Current evidence-acquisition readiness/risk: medium. LLVM tests and public sanitizer tests give an open CPU route, but the action boundary is the central scientific risk.
- Why missing implementation/results/proof/hardware is not structurally fatal: none is required at Stage 0. The revision is required because the candidate has not yet statically separated its action space from the existing upstream mechanism.

## Frozen object and claim

**Object.** One pinned AArch64 Linux C/C++ function and LLVM IR, fixed ABI, defined functional behavior, fixed HWASan runtime/check semantics, and a predeclared tagged-stack report/no-report witness class. Output includes functional result, stock-compatible report/no-report classification, ABI/unwind validity and object code.

**Conditional claim.** For an acyclic trace with at most `w` simultaneously live tagged alloca pointers and a finite legal tag/layout catalog `F`, compute the nondominated `(instrumentation bytes, tag operations, spills/reloads, stack bytes)` frontier without changing the frozen detection contract.

**Important narrowing.** “Same report/no-report” means the witness must preserve all checked access outcomes, short-granule behavior when enabled, and lifetime end behavior. It is not merely identical C/C++ functional output.

## Claim-package completeness audit

| Item | Independent audit |
|---|---|
| Atomic action | Candidate proposes choosing alloca granule placement/grouping, a base/re-tag derivation assignment, and temporary/spill realization. Current upstream already performs selection of interesting allocas, granule alignment/padding, base-tag construction, per-alloca tag derivation, and tag/untag placement. |
| Information contract | Full local alloca/access/lifetime/liveness trace; no profile, changed ABI, changed runtime, or new detection oracle. The revision must state exactly which ordering/assignment degrees of freedom remain after this contract. |
| Guarantee | Candidate names FPT Pareto enumeration but does not yet define a future-action-preserving state, recurrence, or complexity. |
| Minimum falsifier | A current-union configuration realizes every point of the proposed two-plan frontier; or either plan changes a checked tag outcome, ABI/unwind, or short-granule/lifetime semantics. |
| Opportunity-family relation | Compiler N2, not a fault/debugging claim; no fault is required. |

## Current upstream reality check

Checked 2026-08-14 against LLVM/Clang current official documentation and current `llvm-project/main` sources. This is a source-level reality check, not an experiment.

| Surface | Current first-party finding | Effect on candidate |
|---|---|---|
| HWASan contract | Every object is tag-aligned; the pointer and shadow-memory tags are compared on every instrumented access. Short granules use a distinct check path. | Layout or tag changes must preserve more than functional output. |
| Stack design | Official design states that non-promotable allocas are aligned and tagged in prologue/epilogue, and that one base tag with `ReTag(BaseTag,M)` is used specifically to avoid `M` live stack pointers and register pressure. | The candidate’s motivating mechanism is an implemented native design choice, not an absence. |
| Generic HWASan pass | `HWAddressSanitizer.cpp` defines `getStackBaseTag`, `getAllocaTag`, `tagAlloca`, and `instrumentStack`; it supports base-tag XOR derivation and a call-generated-tag path, aligns/pads allocas, and places tag/untag around supported lifetimes or exits. | A fair baseline must include this complete behavior, not just a post-pass allocator. |
| AArch64 stack-tagging pass | `AArch64StackTagging.cpp` builds a stack-info catalog, aligns/pads allocas, emits one `irg_sp` base, assigns a finite `NextTag`, emits `tagp`, tags/untags lifetime intervals, and includes stack-safety and initializer-merge options. | A new planner must identify a legal action not reducible to this catalog plus normal backend allocation. |
| User-visible modes | Current Clang documents HWASan ABI selection (currently unused) and experimental aliasing; source also contains stack, lifetime, calls/inline checks, short-granule, selective-instrumentation and frame-history controls. | ABI/mode changes and weaker/omitted instrumentation are out of object; remaining legal settings form part of the finite comparator grid. |
| Downstream union | AArch64 register allocation, frame lowering and unwind consume the post-instrumentation program. | A planner that only chooses temporaries/spills after freezing upstream tags is generic RA/frame packaging, not this N2. |

### Direct-coverage audit

| Predicate | Result | Rationale |
|---|---|---|
| Same function/protocol | PASS for the stock HWASan stack path | Candidate freezes the stock HWASan contract; current source implements that path. |
| Same scenario | PASS for tagged stack allocas | Stack instrumentation is explicitly the current design target. |
| Same information | PARTIAL | Current pass uses alloca/lifetime/stack-safety information. It is not shown to optimize the candidate’s claimed full joint frontier. |
| Atomic action covered | PARTIAL-to-strong | Base tag, re-tag, alignment/padding, lifetime tag/untag are native; a yet-unshown assignment/order action might remain. |
| Same guarantee | FAIL | No candidate recurrence/certified frontier exists yet. |
| Same full-cost | PARTIAL | Current compiler path includes the real codegen costs, but no candidate full-cost frontier is defined. |
| Comparable version/config | PASS | First-party current main/docs and documented options were checked. |
| Sufficient implementation depth | PASS for native subtractor; UNKNOWN for proposed residual | The candidate’s residual has not been constructed. |

This is **not** called `DIRECT_FATAL`: the current source strongly covers the named primitive actions but does not by itself establish that every fixed-contract tag assignment/order frontier is identical. It does, however, make an unsupported DP claim insufficient for PASS.

## Named baselines and fairness contract

1. **B0 — current generic HWASan pass:** stock instrumentation including stack/lifetime handling, base-tag and `retagMask` derivation, all documented relevant sanitizer modes, no changed runtime or report semantics.
2. **B1 — current AArch64 stack-tagging pass:** `StackInfoBuilder`, align/pad, `irg_sp` base, finite `NextTag`/`tagp`, lifetime tag/untag, stack-safety and initializer-merge controls where legal.
3. **B2 — stock composition:** B0/B1 result followed by the pinned AArch64 register allocator, frame lowering, unwind/object emission, with the same function/ABI/optimization level.
4. **Ceiling only:** an exact enumerator over the finite revised action grammar. It is an oracle, not a deployment baseline.

All comparisons must charge planner CPU/RSS, compile CPU/RSS, object/text bytes, frame bytes, tag instructions, spills/reloads, runtime check/tag cost and fallback. No candidate may change sanitizer mode, ABI, tag mapping semantics, report predicate, or runtime to improve a metric.

## Residual paper kernel and competing mechanisms

| Mechanism | Verdict |
|---|---|
| M1: live-tag assignment frontier DP jointly chooses a legal `ReTag` assignment/order and its target-pressure realization under a fixed report contract | Possible only if the revision provides a legal two-plan divergence and a target-specific sufficient frontier. Selected for the one revision gate. |
| M2: choose alloca placement then rely on stock HWASan and AArch64 RA/frame lowering | Current composition baseline; not a paper mechanism. |
| M3: independently generate tags, alter aliases/ABI, weaken lifetime or report checks | Changes the frozen object/guarantee; prohibited. |
| M4: generic ILP/RA scheduling over a frozen post-HWASan program | Ceiling/subtractor only; not target-specific N2. |

### Required one-time revision gate

`SAME_REPORT_TWO_PLAN__LIVE_TAG_RETAG_ASSIGNMENT_FRONTIER_CERTIFICATE`

The revision must be a single static certificate, not five independent deliverables:

1. Pin an LLVM commit, AArch64 Linux ABI, sanitizer mode and optimization level; list every candidate-relevant native action/mode in B0–B2.
2. Give one minimal function with at least two simultaneously live interesting allocas and two **native-legal** plans. Both must preserve the predeclared access-by-access report/no-report vector, lifetime/short-granule behavior, ABI and unwind contract.
3. State which action differs (not just a different cost weight): legal alloca-granule placement/order and finite `ReTag` assignment linked to live tagged-pointer pressure. Demonstrate that no B0–B2 setting realizes the same pair.
4. Define a bounded state that preserves every future native tag/lifetime/RA/frame action and declared full-cost vector; provide a target-specific exact/FPT/certified-Pareto recurrence and honest parameter dependence.
5. Freeze a finite Stage A preclaim killer: if exhaustive replay of the catalog finds no action divergence, any contract mismatch, or the candidate frontier is B0–B2-dominated after full cost, stop before any claim-bearing run.

Failure to close any conjunct is a single structural finding: `BELOW_Q2_STOP__CURRENT_HWASAN_STACKTAG_COMPOSITION_OR_GENERIC_RA_PACKAGING`.

## Collision analysis

- **Current-source collision:** direct for the primitive base-tag/Retag/register-pressure rationale; it narrows the residual rather than proving a full algorithmic collision.
- **Paper genealogy:** the official design links the HWASan memory-tagging paper (Serebryany et al., arXiv:1802.09517), which describes a compiler-based AArch64 implementation. It is a domain anchor/subtractor, not evidence of the proposed DP.
- **Latest literature search:** `SEARCH_BOUNDED_OPEN`. No unsupported absence claim is made. The revision must update this with a focused query only if it can affect the frozen N2 action.
- **Method-name deletion test:** removing “Pareto DP” leaves “choose existing HWASan tag/layout/RA actions.” Without the required two-plan certificate this is ordinary pass composition, so the name does not create novelty.

## Q1/Q2 paper shape

- **Problem:** security-instrumentation overhead from stack tagging and resulting register/frame pressure on AArch64.
- **Potential contribution:** a complete, target-specific finite frontier algorithm, not an alternate detector.
- **Evidence plan:** static native-action certificate first; then a public LLVM/Clang sanitizer-test and 20–50 stack-heavy-function corpus with compiler acceptance, exact report outcomes, ABI/unwind checks, object inspection and full compile/runtime ledger.
- **Claim ceiling now:** no performance or detection-improvement claim; only conditional potential and a bounded falsifier plan.
- **Q2 disposition:** `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`; a Q2 paper is plausible only if the single certificate closes. Q1 would require broad natural evidence and a substantive target-specific guarantee beyond that threshold.

## Stage A highest-risk probe plan

- Risk-bearing premise: there is a same-report, union-external legal tag/layout/pressure action divergence.
- Finite killer: enumerate the revised finite grammar on its declared minimal witness and compare B0–B2 plus the exact ceiling. Stop if B0–B2 cover all candidate points, report semantics differ, or planner/full compile costs eliminate Pareto benefit.
- Natural carrier after fidelity closure: LLVM/Clang sanitizer tests plus 20–50 public C/C++ stack-heavy functions, each frozen by source/commit/hash.
- Positive-result ceiling: preliminary support only; it cannot establish broad detection or performance claims without the full-cost corpus.

## Non-relaxable quality audit

| Gate | Disposition |
|---|---|
| Same object | conditional; must be made access-vector exact by revision |
| Latest collision | current-source reality check completed; literature remains `SEARCH_BOUNDED_OPEN` |
| Strong fair baselines | B0–B2 fixed; must be action-complete in revision |
| Natural input/evidence | finite public route exists; no current result claimed |
| Full cost | ledger dimensions fixed, results absent |
| Reproducibility | CPU/open-source route, with commit/test/witness pin required |
| Evidence honesty | pass: no missing result or hardware is treated as negative evidence |

## Evidence path and AI completion

- Evidence route: `PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`
- AI executability class: `AI_CORE_CONDITIONAL`
- Estimated `ai_core_fraction`: `0.66`
- 72-hour first evidence: static revision certificate, compiler-source action audit, and small finite witness specification. No candidate experiment is authorized here.
- Human-only items: none are decisive at Stage 0; optional AArch64 runtime interpretation would only affect later evidence ceiling.

## Dual-axis score

- Academic value: `51/70`
- AI executability bonus: `21/30`
- Total: `72/100`

Scores are ordering aids only. The single action-separation gate controls the decision.

## Discovery repair vector

- Codes: `OMITTED_CURRENT_SAME_OBJECT`, `OMITTED_FIRST_PARTY_FEATURE`, `ATOMIC_ACTION_UNCLEAR`, `EFFECT_OR_GUARANTEE_UNCLEAR`
- Materiality: high; the discovery brief correctly named the native base-tag pressure rationale but did not expose how much of the claimed action is already implemented.
- Was the missing information available before the frozen cutoff?: yes, in current official documentation and source.
- Does this feedback alter the independent scientific decision?: `NO`; it is recorded after the decision and explains the revision boundary.

## Stop conditions

- Revision cannot produce two native-legal same-report plans with a current-union-external action difference.
- The proposed state cannot preserve all future tag/lifetime/RA/frame actions and the declared full-cost vector.
- The recurrence is generic RA/layout enumeration, a flag/mode selection, or a change to protection/report/ABI semantics.

