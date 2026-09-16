# LLVM-PPC-PREFIX-PRESSURE-PARETODP — r9 Independent Deep Preclaim Fidelity Review

## 中文摘要

- 独立结论：`CONFIRM_PRECLAIM_INVALID__NO_R10_CLAIM_START__BOUNDED_CORRECTION_ROUTE_EXISTS`。
- r9 已可信闭合的只是 same-function direct/materialized control 的本机合法性、两次 replay 和结构化一致性；这些证据没有科学推断效力。
- frozen PPC-TPD 原子动作尚未实现：当前 `ppc_tpd` 只有全 direct 的 `D0` 与全 materialized 的 `M0` 两个闭式全局状态，没有逐 load/action 的 DP recurrence、future-action state merge 或 RA/coalescing/spill/frame 反馈。
- `ppc_tpd` 与 `form_aware_fixed_ra` 在 source 中共用完全相同的 active-state 分支，候选相对强 ablation 没有实现性 residual。
- r10 静态计划声明的 expanded baseline 输出没有进入 checker 或 full-cost；而且所谓 16 compile 是 16 个 corpus member 的同一 greedy/default-on 配置，不是 frozen current-LLVM configuration union。
- 存在一个有限 same-object preclaim correction route，但本 review 不授权执行、创建 r10、运行工具或消耗 scientific revision。

- Assignment: `STAGEA-GATE-20260826-LLVM-PPC-R9-DEEP-PRECLAIM-FIDELITY`
- Review lane: `STAGEA_GATE`
- Context SHA-256: `43E3F6BB0AE0B5963F0CA64687F92F29EF7F1ACA7E3B69913CFDE14F7C22C819`
- START SHA-256: `5EEA1BE41D7259ED6111B8B08EBDC0ABBE9C2AD44B5CA019C650F22C749F1FB0`
- GATE_PRECOMMIT SHA-256: `D8486C3CA4833898719EB3FA02CA84330A9ACBD2A3BA12E6F6D5A87BBDB494EE`
- Reviewer independence: reviewer did not implement or run r9; owner files remained read-only.
- Evidence ceiling: `STATIC_INDEPENDENT_PRECLAIM_FIDELITY_REVIEW_ONLY__NO_SCIENTIFIC_INFERENCE`
- Quality tier: carried `TIER_B_Q2_VIABLE`; not re-evaluated by this preclaim-only gate.

## Independence from the MAINLINE hypothesis

`MAINLINE_A3_DEEP_FIDELITY_REJECTION.yaml` was treated as a hypothesis locator only. The decision below comes from independent reads of the frozen Stage 0 contract, r9 source, unexecuted plan, plan validation, owner handoff, and dependency graph. The rejection text was not used as authority.

## G1 — frozen atomic-action completeness: FAIL

The frozen action is trace-level Pareto DP over individual prefixed/nonprefixed form choices together with materialized-address liveness, RA/coalescing/spill/frame and typed relocation cost. `run_input_specific_tpd` does not implement that object.

For the retained 12-load control (`visible_interface=13`), it constructs only:

- `D0`: all loads remain direct `PLDpc`;
- `M0`: all loads share the materialized-base construction.

The costs are closed-form functions of load/base/live counts. There is no per-load choice sequence, transition recurrence, state keyed by future native action, merge proof, or predecessor chain through action ordinals. The backpointer field on each state names one whole-trace action and the trace hash; it is not a DP transition history.

RA/coalescing/spill/frame effects do not feed this selection. Stack accesses, copies, and frame setup are counted later from objdump in `run_full_cost`, after `candidate_result.json` has already selected its two-state frontier. This post-selection telemetry cannot substitute for the frozen joint-action recurrence or its auditable surrogate.

## G2 — candidate distinctness: FAIL

The decisive source branch is:

`elif method in {"ppc_tpd", "form_aware_fixed_ra"}: active = states`

Both methods therefore receive the same state set, same dominance filter, same backpointer shape, and same cost vectors by construction. Only the method label differs. No input can make `ppc_tpd` choose an action sequence unavailable to `form_aware_fixed_ra` under this implementation. The candidate currently has no implemented algorithmic residual over the declared strong ablation.

## G3 — strong-baseline consumption: FAIL

The 32-row r10 plan contains 512 baseline compile outputs and 1,024 baseline link outputs. Independent dependency reconstruction found:

- expanded baseline → checker input/argv edges: `0`;
- expanded baseline → full-cost input/argv edges: `0`;
- rows with every expanded baseline output orphaned: `32/32`.

Checker and full-cost instead consume only the internal focus-run direct/materialized artifacts produced under `candidate_values`. The plan validator merely checks that checker/full-cost inputs are subsets of candidate outputs; it never requires consumption of the separately declared baseline outputs. Its `PASS` is therefore a static plan-shape pass, not strong-baseline dependency closure.

The declared baseline is also not the frozen configuration union. Across all 512 compile commands there is one configuration: greedy RA, `ppc-pcrel-linker-opt=true`, and `ppc-late-peephole=true`. PBQP and both disabled-flag controls occur zero times. Only linker relaxation has two variants. Expansion across 16 corpus members cannot replace expansion across legal baseline configurations on the same focus input.

## G4 — control evidence ceiling: PASS as control only

The r9 evidence credibly supports the bounded claims that the retained direct/materialized control can be materialized in the same function, pass native object/link checks, and reproduce across two structured replays. Owner artifacts consistently record selected/reserve tool calls `0`, claim observations `0`, and scientific inference `NONE`.

Those control results do not compensate for G1–G3. They cannot authorize a natural r10 claim run or raise the evidence ceiling.

## G5 — correction route: bounded route exists

The gaps are implementation and dependency-closure defects inside the already frozen mechanism, not evidence that a new object or weaker baseline is required. A finite route exists because the visible interface is capped at 16 and the legal form grammar is binary per action.

The route must, in one new hash-pinned preclaim-only assignment:

1. replace the two global states with an input-specific per-action recurrence whose state preserves future legal actions, typed relocation/link state, liveness/register-role/coalescing/spill/frame obligations or an exact audited surrogate, exact costs, and parent/action backpointers;
2. make `ppc_tpd` RA-sensitive and keep `form_aware_fixed_ra` genuinely fixed-RA, with positive and negative distinctness controls;
3. expand the same-object LLVM baseline grid over greedy/PBQP, both PPC optimization flags, and linker relaxation, then feed every baseline output and command metric into checker and full-cost through an explicit hashed bundle;
4. add fail-closed controls for state merges, method equality, missing configuration, orphan dependency, cost mutation, and interface cap;
5. run only fixed control inputs with two deterministic replays. Natural selected inputs, claim runs, r10 creation, scientific revision consumption, and state transitions remain prohibited until a new independent gate accepts the correction.

This is substantial engineering, but it is finite, same-object, falsifiable, and does not require a mechanism pivot or unbounded physical-register enumeration. Full details are frozen in `CORRECTION_ROUTE_AUDIT.yaml`.

## Quality and state disposition

- Same object: correction route preserves the frozen Power10/ELFv2/medium-code-model object.
- Strong baseline: not closed in r9; exact bounded route specified.
- Natural evidence/full-cost: not started and not inferred.
- Reproducibility: r9 control replay is credible but insufficient for claim fidelity.
- Evidence honesty: PASS; no natural or scientific result was asserted.
- StageA scientific revision: unconsumed and not consumed by this gate.
- r10 claim start: not authorized.
- Stage B: not authorized.
- Formal state change: none; MAINLINE remains the only state writer.

## Final recommendation

`CONFIRM_PRECLAIM_INVALID__NO_R10_CLAIM_START__BOUNDED_CORRECTION_ROUTE_EXISTS`.

MAINLINE may, under its existing authority, decide whether to freeze the bounded preclaim correction route. This handoff itself authorizes no implementation, tool execution, natural input, claim, cleanup, revision, or state transition.
