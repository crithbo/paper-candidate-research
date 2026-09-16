# QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE

## 中文摘要

- 机会：current QEMU TCG 的共享 code-generation buffer 在容量到达时全量 flush；同时页面改变的失效路径已维护 direct jump、lookup cache 和 page-list 等精确语义不变量。
- 机制：在 quiescent boundary 上对一组完整 live TB 做 bounded-recourse region migration，修复全部 target-specific 引用，而非只调 `tb-size` 或选择刷新策略。
- 公平比较：同一 guest、同一 TCG information、同一 `tb-size`/thread 条件下的 full-flush + granular invalidation union；offline OPT 仅可作 ceiling。
- 下一步：Stage 0 source-pin current QEMU，优先以两 TB、一次 direct chain、一次 page invalidation 的 legal relocation witness 验证 guest/exception 等价；失败即止。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O5 / OTHER_EVIDENCE_BACKED_ORIGIN`
- Domain tags: `DYNAMIC_BINARY_TRANSLATION, ARCHITECTURE_CO_DESIGN, ONLINE_RECOURSE, SYSTEM_SEMANTICS`
- Contribution route: `N2`
- Discovery date: `2026-08-14`
- Discovery method revision: `v8.7 canonical / FRESH_PROBLEM_EVIDENCE_ROTATION_V2`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE`
- Contribution type: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`
- Local audit coordinates: `A2`, `C2`, `D1`, `E0`

## Canonical research claim package

- Exact object/same-function: fixed QEMU TCG guest and CPU state, same target instruction semantics, guest-visible I/O/result, exception host-PC-to-guest-PC mapping and invalidation safety.
- Natural carrier: QEMU’s versioned functional/QTest/unit suites, with a bounded public system/user emulation subset selected only after the two-TB legality witness closes.
- Atomic action: on code-buffer-pressure admission and quiescent vCPU boundary, migrate a dependency-complete, live set of TBs to a fresh region, atomically repair recorded direct jumps and all host-PC, page and lookup-cache references, then release old space; cap moved/invalidated TBs per admission.
- Information model: past/current TCG metadata and profiling only; no future guest trace.
- Strong baseline union: current full capacity flush + documented page-scoped invalidation, direct-jump reversal, lookup-cache/page-list updates, current `tb-size` and thread configurations under equal information.
- Target-specific guarantee: exact guest and exception equivalence; no lookup of an invalid or stale TB; bounded recourse per pressure admission. Any online/competitive bound must explicitly condition on the stated locality/window model and include synchronization/repair cost.
- Full cost: translation CPU, buffer bytes and peak RSS, metadata, direct-jump repair, quiescence/synchronization, cache lookups, guest wall time, cold/warm behavior, and full-flush/no-gain cases.
- Minimum falsifier: two live chained TBs and a page invalidation where migration either leaves a stale jump/host-PC mapping, changes guest result/exception, violates quiescence, or exceeds declared recourse/cost condition.

## Current-upstream reality check

- Source snapshot: QEMU current official master documentation consulted 2026-08-14; exact commit pin is a Stage 0 requirement.
- Current union evidence: official multi-thread TCG documentation states a single shared code-generation buffer with full flush at capacity; it separately details fine-grained page-change invalidation, direct jump reversal, lookup caches, page tables, and quiescence.
- Flags/config checked: `tb-size`, TCG `thread=single|multi`, `icount` interaction, and current testing routes.
- Contrary evidence: granular invalidation already exists and is a mandatory baseline; it does not by itself demonstrate a capacity-triggered, bounded live-TB migration action.  No claim depends on issue text or future-work prose.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Stock oracle: QEMU QTest/unit assertions plus fixed guest output/exception behavior.
- Small witness: two TBs with a direct chain, each entered in page/cache structures; force one page invalidation and one capacity admission. Compare stock flush with a candidate two-region relocation state transition.
- Finite 72-hour killer: stop if source inspection finds an equivalent capacity relocation in the current union, or if all required references cannot be repaired under a single quiescent transition without changing QEMU semantics.
- Stage A full-cost route: only after witness legality, use a bounded version-pinned QEMU stock test subset; record translation, repair, synchronization, cache/RSS and guest costs.
- E2: `NOT_RUN_NOT_REQUIRED_FOR_STAGE0`.

## Sufficiency and evidence ceiling

If Stage 0 closes union externality and Stage A proves the small invariant witness, the algorithm/architecture contribution has credible Q2 potential: a target-specific online data-structure transition with exact emulator semantics, bounded recourse and whole-cost comparison.  Current evidence is static E0 only; no performance gain, theorem, implementation, or experiment is claimed.
