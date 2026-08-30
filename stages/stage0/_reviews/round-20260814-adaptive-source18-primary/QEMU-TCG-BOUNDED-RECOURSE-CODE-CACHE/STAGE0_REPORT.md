# QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE — Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`，送独立 confirmation；不授权 Stage A/B。
- 质量档：`TIER_B_Q2_VIABLE`（条件性）。当前 QEMU 已有多 region 按需分配、页级失效、jump/cache/page-list 修复及全 flush；但容量压力下仍重置完整 TB lookup 与全部 TCG regions，未见同对象的 capacity-triggered live-TB relocation。
- 关键校正：Discovery 的“单 code-generation buffer”应收窄为共享且容量受限的 code-cache topology；`tcg/region.c` 已将 buffer 划分为多个按需分配 regions。该现有动作是强基线，不是 live migration。
- 原子修订门：`PINNED_QEMU_REGION_ALLOCATION_AND_TB_REFERENCE_CATALOG__LIVE_TB_RELOCATION_CERTIFICATE`。
- 原因：目标有明确同语义和有限证伪路线，但尚无 immutable QEMU pin、完整引用/host-PC repair catalog、二 TB 原生合法两计划 witness，或区别于 cache controller/通用 compaction 的 target-specific algorithm and guarantee。

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260814-QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE-PRIMARY-V8.7`
- Input freeze: discovery 4/4 matched assignment hashes.
- Cross-assignment contamination: none.
- Decision: `REVISE_ONCE`
- Confidence: `0.78`
- Evidence ceiling: `E1_STATIC_CURRENT_SOURCE_AUDIT`
- Novelty route: `N2`
- Stage semantics: conditional paper-potential screen only; no code, measurement, theorem, or gain is claimed.

## Structural paper potential vs readiness

If successful, this is not a `tb-size` policy: a complete, quiescent representation transition that preserves guest execution, exception host-PC→guest-PC recovery, direct chains, page membership and all lookup paths while moving a bounded live TB set could be a Q2-level target-specific online cache/DBT algorithm. Its novelty must come from the **reference-closure plus bounded recourse construction**, not from selecting victim TBs or choosing a cache size.

Current readiness is static. Official documentation and current source locators expose the relevant state and test route, but no candidate artifact or two-plan witness exists. Those missing outputs reduce evidence readiness only. The revision must pin a commit and make the proposed construction finite before any Stage-A fidelity experiment.

## Frozen object and exact claim

One fixed QEMU TCG guest, target CPU state, QEMU target/host pair, `tb-size`, TCG thread mode and `icount` compatibility setting. Both plans preserve guest-visible I/O/result, target instruction semantics, direct-chain behavior, invalidation safety, and exception host-PC-to-guest-PC reconstruction.

At a valid quiescent admission boundary, choose a dependency-complete live TB set, regenerate or relocate it into a fresh native TCG region, atomically repair every affected code pointer/reference, then reclaim the old region. No TB runs during this operation; no guest future trace is used; moved/invalidate/repaired TB count is bounded. This differs from full flush, page invalidation, cache-size tuning, and region allocation only if the entire state transition is explicitly defined.

## Current upstream reality check

Checked 2026-08-14 using official QEMU current documentation and official source locators.

| Current union element | Current action | Consequence for candidate |
|---|---|---|
| code cache capacity | official MTTCG docs state capacity forces full translation flush | mandatory baseline |
| `tcg/region.c` | code buffer is divided into regions dynamically allocated to TCG contexts; more regions than threads are used when possible | Discovery single-region wording narrowed; allocator must be in comparator |
| `tb_flush` / `tb-maint.c` | flushes jump caches, resets QHT, removes all TB records, resets all regions, and may run through `async_safe_run_on_cpu` | current capacity action is destructive reset, not retention/migration |
| page invalidation | invalid TBs are removed from direct-jump lists, page structures and lookup caches | required repair primitives, not a relocation action |
| direct chaining | `goto_tb` only under fixed-state / same-page constraints | included in two-TB witness legality |
| host-PC mapping | QEMU maps host PC to guest PC for exceptions | relocation must preserve/recreate this mapping |
| `tb-size`, TCG threading, `icount` | cache size and MTTCG are configured; `icount` is incompatible with MTTCG | fixed fair-config family; no flag pivot allowed |

Official sources: [MTTCG](https://www.qemu.org/docs/master/devel/multi-thread-tcg.html), [translator internals](https://www.qemu.org/docs/master/devel/tcg.html), [QEMU options](https://www.qemu.org/docs/master/system/qemu-manpage.html), [TCG instruction counting](https://www.qemu.org/docs/master/devel/tcg-icount.html), [current region allocator](https://gitlab.com/qemu-project/qemu/-/blob/master/tcg/region.c), and [TB maintenance](https://gitlab.com/qemu-project/qemu/-/blob/master/accel/tcg/tb-maint.c).

## Collision decision and fair union

No exact `DIRECT_FATAL` was found in the bounded current-source/primary-material search. Existing QEMU actions establish a much stronger subtractor than Discovery initially stated: dynamic region allocation plus full flush, granular invalidation, atomic jump/cache updates, page lists, QHT and quiescence. They nevertheless do not publish an action that retains/moves a capacity-selected live TB set while repairing all references.

Generic DBT code-cache replacement/compaction is only methodological adjacent unless it covers the same QEMU reference closure, host-PC exception semantics, online information, quiescence, and full-cost boundary. It may not be promoted to a fatal union merely because it moves code bytes.

The required fair union is: current region allocation under identical `tb-size`/thread mode; capacity full flush; granular page invalidation; direct-jump unlink/reset/relink; jump cache/QHT/page list maintenance; compatible `icount` mode; and serial/multi-thread configurations allowed by the frozen contract. Offline OPT is a ceiling only.

## Single atomic revision gate

> On an immutable current QEMU pin, define the complete region/allocation and TB-reference grammar, then exhibit two native legal states of the same two-TB chain such that one is current full-flush behavior and the other is a quiescent bounded live-TB migration which preserves all guest/exception semantics and is generated by a target-specific bounded-recourse algorithm with an honest conditional guarantee.

The revision must provide, without implementation or benchmarking:

1. Immutable source SHA/blob set and full default/non-default union: `tb-size`, `thread=single|multi`, `icount`, regions, direct links, jump cache, QHT, page lists, host-PC mapping and safe-work/quiescence.
2. A native two-TB witness: one legal direct chain, page/cache membership, one page invalidation and one capacity admission. It must state a total reference repair order and prove no stale lookup/jump/host-PC mapping is observable.
3. A non-product state and target-specific recurrence (region occupancy, live reference closure, chain/page constraints, repair budget), with exact/FPT/certified-frontier or conditional online guarantee and stated complexity.
4. A Stage-A fidelity gate and killer: source-level state transition, QTest/unit + guest/exception oracle, full flush/granular union, and full accounting of translation, code/RSS, metadata, repair, synchronization, lookup and guest costs.

The gate fails if current QEMU already performs equivalent capacity relocation, if a witness needs changed guest/host semantics, or if the only proposal is a victim selector, threshold policy, generic compactor or controller. Sentinel: `BELOW_Q2_STOP__CURRENT_QEMU_CAPACITY_RELOCATION_OR_GENERIC_CACHE_CONTROLLER_COMPACTION`.

## Q1/Q2 paper shape, evidence and score

Public QEMU functional, QTest and unit suites are natural first carriers; a bounded system/user subset may follow only after the two-TB fidelity gate. A credible Q2 result would need exactness plus a target-specific bounded-recourse/online result on multiple public workloads and the full ledger. Q1 needs substantially broader target/host evidence and a stronger general guarantee.

| Non-relaxable gate | Status |
|---|---|
| Same object | PASS, conditional on immutable pin |
| Current collision | PASS / `SEARCH_BOUNDED_OPEN`; no equivalent action found |
| Fair baseline | PASS as concrete union plan |
| Natural carrier | PASS, official QEMU suites |
| Full-cost | PASS as mandatory ledger, unmeasured |
| Reproducibility | REVISE: pin and witness absent |
| Evidence honesty | PASS; no performance inference |

- Academic value: `53/70`
- AI bonus: `22/30`
- Total: `75/100`
- AI class: `AI_CORE_CONDITIONAL`; estimated core fraction `0.68`.
- Repair vector: `OMITTED_FIRST_PARTY_FEATURE`, `ATOMIC_ACTION_UNCLEAR`, `EVIDENCE_LOCATOR_OR_VERSION_GAP`. It does not alter this independent decision.

## Handoff

Only `REVISE_ONCE` is recommended. Confirmation should attack whether multiple current regions plus `tb_flush` can already express the claimed action, and whether the proposed proof state is QEMU-specific rather than generic code-cache compaction. Stage A/B remains unauthorized.
