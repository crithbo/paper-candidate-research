# AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP — Stage 0 revision1

## 中文摘要

- 决定：`RECOMMEND_BELOW_Q2_STOP`。
- 唯一门：`SAME_REPORT_TWO_PLAN__LIVE_TAG_RETAG_ASSIGNMENT_FRONTIER_CERTIFICATE` 已实际审查并关闭失败；本次是唯一一次科学 revision，额度 `1/1` 已消耗。
- 决定性原因：在冻结的 HWASan-only current action grammar 内，base tag、`retagMask(AllocaNo)`、pointer replacement、对齐/填充、短粒度写入及 lifetime/exit re-tag 均由当前 pass 决定。MTE `SanitizeMemTag` 的 `tagp`/`NextTag` 已剔除，不能充当第二个同对象计划。余下的 alloca 物理布局在 HWASan 插桩时尚未知；改变它属于后续通用 frame/RA 或改变 IR，而不是 HWASan-only 动作。故不存在能同时保持完整检测轨迹且影响所声明 Pareto 维度的两个 native-realizable HWASan 计划。
- 这不是缺实现、硬件、性能结果或自然语料造成的停止；它是 frozen same-object action space 的结构性单例/通用化结论。
- Stage A/B：未授权。

## Revision identity and frozen boundary

| Field | Value |
|---|---|
| Assignment | `STAGE0-P1-20260814-AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP-REVISION1-V8.7` |
| Revision | `1/1`, consumed by this gate-bearing static disposition |
| LLVM pin | `llvm-project` main `e72ba6cf366a3180cbf5a8690d9e50665880ab76` (read-only `git ls-remote`, 2026-08-14) |
| Exact object | AArch64 Linux user-space function with `sanitize_hwaddress`, fixed ABI, stock HWASan runtime/checker, fixed optimization level and fixed report/no-report trace contract |
| Excluded object | `sanitize_memtag` / AArch64 MTE stack-tagging, including `tagp`, `irg_sp`, `settag` and `NextTag` |
| Decision | `RECOMMEND_BELOW_Q2_STOP` |
| Failure sentinel | `BELOW_Q2_STOP__CURRENT_HWASAN_STACKTAG_COMPOSITION_OR_GENERIC_RA_PACKAGING` |
| Evidence ceiling | `E1_STATIC_PREFLIGHT__CURRENT_SOURCE_ACTION_CATALOG` |

## Single proposition and falsification result

**Proposition under test.** There exist two distinct current-HWASan-native realizations of one fixed function which have identical functional output, complete HWASan report/no-report trace, short-granule and lifetime semantics, ABI and unwind behavior, but different legal alloca-index/retag/live-materialization choices whose future-preserving bounded state supports a target-specific Pareto recurrence.

**Result: false for the frozen HWASan-only action grammar.**

The source’s own explanation is decisive: during `instrumentStack`, alloca offsets are “not known yet”; the pass therefore keeps one base tag in a temporary and, for every alloca use, shifts/ORs it and XORs a fixed retag mask. Its loop assigns `N = I++`, then calls `getAllocaTag(StackTag,N)`, replaces alloca uses, and performs the fixed tag/lifetime logic. The native grammar contains no second legal layout or retag-assignment action for the planner to choose.

## Corrected current native action catalogue

The catalogue is intentionally **HWASan-only**. Every row below is a current source action/mode, not an inferred capability.

| ID | Current HWASan action | Same-object status | Can provide a second candidate plan? |
|---|---|---|---|
| H1 | select interesting static, non-promotable, non-safe allocas via `StackInfoBuilder` | fixed by IR/analysis | no |
| H2 | decide whether stack instrumentation/use-after-scope is enabled | frozen on, because disabling changes protection/report trace | no |
| H3 | construct one `StackTag` from the frame pointer (normal AArch64 user-space path) | fixed under the pinned mode | no |
| H4 | enumerate `AllocasToInstrument`; assign `N=I++`; obtain `StackTag XOR retagMask(N)` | fixed native action | no |
| H5 | replace alloca uses with the tagged pointer; tag aligned storage | fixed native action | no |
| H6 | `tagAlloca`: shadow tag store; short-granule remainder/tag storage when enabled | fixed by size/mode | no |
| H7 | lifetime start/end and reachable-exit tag/untag using the native UAR tag | fixed by IR lifetime/CFG and chosen mode | no |
| H8 | runtime call tag generation (`hwasan-generate-tags-with-calls`) | alternate global compiler mode with runtime-generated values | no: it lacks a statically selected, same-trace plan and changes the frozen mode/cost |
| H9 | checks as outlined/inline/call based on modes | configuration surface; freezing exact checks is required by the report contract | no |
| X1 | `sanitize_memtag` AArch64 `tagp`/`NextTag` actions | not HWASan: source guard is `SanitizeMemTag` | excluded |

### Why `tagp`/`NextTag` are not admissible

`AArch64StackTagging.cpp` is a different MTE pass. Its `runOnFunction` returns unless the function has `Attribute::SanitizeMemTag`; a HWASan function uses `SanitizeHWAddress`. Its `irg_sp`, `tagp` and `NextTag` actions therefore alter the sanitization object and cannot be a comparator action or Plan B. Their use in the prior PRIMARY catalogue was corrected by confirmation and is not retained here.

## Complete-contract test

| Contract component | What current HWASan fixes | Consequence for two-plan requirement |
|---|---|---|
| Report/no-report access vector | Tagged pointer and shadow tag must match at every instrumented access | Changing tag assignment can change a mismatch; preserving the vector restricts it to observationally equivalent masks. |
| Short granules | `tagAlloca` records the remainder in shadow and actual tag in the final byte | Any new physical packing that changes a final granule must re-prove this entire path; no HWASan layout action exists to choose it. |
| Lifetime and UAR | the pass selects tag starts/ends/exits and `UARTag` from CFG/lifetime state | Changing the end tag or its timing changes the defined report contract. |
| ABI / unwind | HWASan may instrument personality paths; downstream frame/unwind consumes the generated IR | A generic frame rewrite is not a HWASan tag-planning action. |
| Live tagged-pointer pressure | one base value plus a fixed XOR is used for each tagged alloca use | A mask permutation leaves the same base value, operand shape and per-use instruction class; it cannot create the claimed pressure tradeoff. |

## Action-divergence audit

The requested two plans cannot be named without leaving the object:

1. **Change the mask/alloca index.** Current `retagMask(N)` uses an AArch64 single-instruction-encodable mask list and `getAllocaTag` produces the same base-XOR form for every alloca. A permutation is not a pressure/materialization action: it preserves the number of live tagged pointers, the number of uses and the one-extra-instruction-per-use form. If it changes the fixed report vector, it violates the object; if it does not, it has no target-specific Pareto delta.
2. **Change alloca physical placement/grouping.** The HWASan source states offsets are not known at its insertion point. Such a choice belongs to IR/frame construction or downstream allocation. It is neither a legal action in the HWASan-only grammar nor, without a new target-specific restriction, more than generic layout/RA packaging.
3. **Use independent/generated tags or weaken instrumentation.** Runtime tag generation is a compiler option with runtime values and different full cost; disabling stack/lifetime/short-granule/check paths weakens or changes the frozen trace. Neither yields two fixed same-report plans.
4. **Use MTE `tagp`/`NextTag`.** Prohibited cross-object substitution.

Thus the candidate has no native-realizable `Plan A != Plan B` action divergence. A state `S=(live pointers, tag class, granules, pressure)` would merely enumerate an externally introduced layout/RA choice; it cannot be a future-HWASan-action-preserving target-specific DP. An exact/FPT/Pareto guarantee over that state would be a generic solver/RA formulation, which the frozen contract forbids.

## Strongest union and full-cost boundary

The fair union is current HWASan only (H1–H9), followed by the pinned AArch64 backend’s normal RA/frame/unwind pipeline. It must not contain MTE. This union does **not** prove a generic solver could never optimize frames; it proves the stated HWASan tag/layout/register-pressure candidate supplies no distinct same-object action after its required MTE removal.

Full cost remains correctly specified—planner/compile CPU and RSS, object/text bytes, frame bytes, tag operations, spills/reloads, check/tag runtime and fallback—but there is no candidate frontier to measure. Missing measurements are not the reason for the decision.

## Finite Stage A falsifier (frozen, not executed)

If a future new-ID candidate supplies a different action grammar, its preclaim gate must:

1. pin LLVM, sanitizer mode, target triple, ABI and optimization level;
2. enumerate all fixed-function native plans from the new grammar;
3. compare the complete access report/no-report vector, short-granule state, lifetime/UAR events, ABI/unwind and output;
4. charge the complete source-to-object and runtime ledger; and
5. stop if the planned divergence is absent, if a semantics component differs, or if all candidate points are dominated by current HWASan plus normal backend.

This is not Stage A authorization and no experiment was run.

## Structural potential and readiness

- Structural paper potential: `BELOW_Q2_STOP` for this ID. The proposed contribution is absorbed/collapses before any performance claim: its primitive pressure rationale is native and its only apparent alternate plan is outside the HWASan object or generic codegen.
- Current evidence readiness: adequate for this static determination. A public CPU route exists, but it is irrelevant because no eligible candidate action remains.
- Resource and implementation statement: no missing resource, implementation, native output or benchmark result supports this STOP.

## Next-state recommendation

Do not issue a same-ID second revision. Any successor needs a new identifier and a newly frozen same-object action that is not a MTE substitution, along with a target-specific action divergence and formal/algorithmic guarantee before it can re-enter Stage 0.

