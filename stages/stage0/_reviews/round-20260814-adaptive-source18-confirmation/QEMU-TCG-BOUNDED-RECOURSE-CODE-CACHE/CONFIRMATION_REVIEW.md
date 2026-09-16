# QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE — Independent Stage 0 confirmation

## 冻结范围与独立性

- Assignment: `STAGE0-C2-20260814-QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE-CONFIRM-V8.7`.
- Role: independent confirmation sentry; this review did not author the PRIMARY packet.
- PRIMARY integrity: report, Q1 matrix, source audit, and handoff match all four supplied SHA-256 values; the supplied manifest is consistent (`4/4`).
- Review is static only.  No QEMU build, code change, guest execution, benchmark, revision, Stage A, or Stage B was performed.

## 裁决

**`CONFIRM_REVISE_ONCE`**

The sole atomic gate is a permissible finite revision:

`PINNED_QEMU_REGION_ALLOCATION_AND_TB_REFERENCE_CATALOG__LIVE_TB_RELOCATION_CERTIFICATE`.

QEMU's current union is stronger than a single-buffer baseline: one shared code-generation buffer is divided into multiple dynamically allocated regions; capacity exhaustion then uses an exclusive/serial full flush that clears per-CPU jump caches, resets QHT, removes all TB records, and resets all regions.  Page invalidation contains a detailed deletion/unlink repair path.  None of the official material reviewed exposes a capacity-triggered action that retains a selected live TB set, regenerates/relocates it, repairs all affected references, and reclaims only its prior storage.

Thus the residual is not yet absorbed, but the packet supplies neither an immutable pin nor a complete two-TB reference-closed transition or target-specific guarantee.  It cannot pass now.  These are static certificate gaps, not an objection that performance results or a built QEMU are unavailable.  One revision may close exactly this gate; it must stop if it finds existing equivalent capacity relocation or degenerates into generic cache control/compaction.

## Independent attack findings

### 1. Multi-region allocation does not equal live-TB relocation

Current `tcg/region.c` divides `code_gen_buffer` into equally sized regions allocated dynamically to TCG contexts, deliberately using more regions than threads when possible.  This addresses uneven translation demand before aggregate capacity is exhausted.  It is a mandatory baseline, and it prevents any claim that QEMU currently has only a single allocatable region.

At exhaustion, `tcg_region_alloc()` fails and the current reset path reinitializes every context's region allocation.  The documented `tb_flush__exclusive_or_serial()` flushes every CPU jump cache, resets the QHT, removes all TBs, and calls `tcg_region_reset_all()`.  This destructive reset is not a bounded live-set migration.  A proposal that merely prefers regions, changes `tb-size`, or chooses a flush threshold is therefore absorbed/insufficient; a proposal must retain the named live closure and total repair action.

### 2. The two-TB witness has a real but demanding same-object boundary

QEMU direct chaining uses `goto_tb + exit_tb` only when the CPU-state change is fixed and the chain does not cross a page boundary.  The initial jump targets an exit/update path; the main loop later patches the origin slot to the destination host address.  QEMU also maintains guest-code page lists, a global QHT lookup structure, per-vCPU jump caches, direct-jump lists, and host-PC-to-guest-PC exception mapping.

Current page invalidation demonstrates the deletion half of a repair sequence: mark the TB invalid under its jump lock, remove it from QHT and page list, invalidate the jump cache, remove its outgoing jump-list entries, and unlink incoming direct jumps.  This does not prove that a live destination may have its host address changed safely.  The revision must state a total *preserving* repair order for a fixed two-TB direct chain: admission pressure, quiescence, outgoing and incoming chain handling, QHT/page/cache update, host-PC mapping recreation, final publication, and old-region reclaim.  It must show no stale direct jump, lookup result, page member, or fault mapping is observable.

### 3. Quiescence and configuration are non-negotiable

The official MTTCG design requires `async_safe_run_on_cpu()` for global changes while vCPUs are quiescent; the full-flush source additionally requires an exclusive or serial context.  The candidate must use a comparable boundary.  It cannot substitute a changed guest trace, a changed target/host pairing, a changed `tb-size`, or an incompatible `icount`/MTTCG setting to manufacture two actions.

The immutable QEMU commit and blob set are still absent.  Failure to retrieve them through a particular transport is a provenance/readiness limitation only; revision must obtain a full SHA and pin all state-bearing source paths before any later claim-bearing work.

### 4. Target-specific bounded recourse remains a valid narrow N2, not generic cache work

The candidate is only nontrivial if its state contains QEMU-specific region occupancy, live TB reference closure, direct-chain/page constraints, host-PC mapping obligations, quiescence state, and repair budget; it must map state paths bijectively to legal native transitions and charge translation/regeneration, code bytes/RSS, metadata, lookup/cache maintenance, patching, synchronization, and guest execution costs.

A generic victim policy, LRU/threshold controller, generic compactor, cache-size tuner, arbitrary live-code mover, or generic solver is not the required N2.  A conditional exact/FPT/certified-frontier or online guarantee is acceptable only with finite parameters, explicit no-gain/flush boundary, and future-native-action/legality/full-cost preservation.  The packet has not yet supplied this certificate, so revision is necessary rather than Stage-A admission.

### 5. Collision result

The bounded current-source search verifies direct subtractors—multi-region allocation, capacity full flush, page invalidation, direct-jump repair, jump-cache/QHT/page-list maintenance, and quiescence—but not an equivalent capacity-triggered retention/relocation action.  Generic DBT/JIT cache compaction remains methodological adjacent unless it meets the same QEMU reference closure, exception mapping, online information, and full-cost predicates.  `SEARCH_BOUNDED_OPEN` remains; no absence is inferred from search/transport limits.

## Claim matrix

| Claim | Confirmation status | Reason |
|---|---|---|
| Current region allocation is dynamic and multi-region | `CONFIRMED` | `tcg/region.c` allocates regions to contexts on demand. |
| Capacity handling retains/relocates a bounded live TB set | `REJECTED_FOR_CURRENT_UNION` | Current full flush clears caches/QHT/TBs and resets all regions. |
| Current invalidation fully specifies live relocation | `REJECTED` | It safely deletes/unlinks TBs; it does not publish a preserving host-address transition. |
| Same-QEMU two-TB live-relocation witness is already established | `NOT_YET_PROVIDED` | Direct-chain, cache/page/QHT, host-PC, quiescence, pressure, and publication order are not frozen together. |
| Residual is more than generic cache/controller work | `CONDITIONAL_ON_GATE` | Only a QEMU-specific reference-closed state/guarantee can establish this. |
| Direct current-union/literature absorption | `NOT_ESTABLISHED__SEARCH_BOUNDED_OPEN` | Strong native subtractors do not cover the complete specified action/guarantee. |
| One finite scientific revision is appropriate | `CONFIRMED` | The object/interface remains fixed; the sole repair is action-catalogue, witness, and certificate closure. |

## Source basis and evidence ceiling

- QEMU, [MTTCG design](https://www.qemu.org/docs/master/devel/multi-thread-tcg.html): shared lookup structures, quiescent global changes, full flush, invalidation, atomic direct-jump/cache operations.
- QEMU, [translator internals](https://www.qemu.org/docs/master/devel/tcg.html): direct-chain legality, page lists, invalidation, and host-PC exception recovery.
- QEMU, [current `tcg/region.c`](https://gitlab.com/qemu-project/qemu/-/blob/master/tcg/region.c): dynamic multi-region allocation and reset semantics.
- QEMU, [current `tb-maint.c`](https://gitlab.com/qemu-project/qemu/-/blob/master/accel/tcg/tb-maint.c): exclusive full flush plus QHT/page/jump-cache/direct-jump invalidation order.

Evidence ceiling remains `E1_STATIC_CURRENT_SOURCE_AUDIT`.  No code-cache result, throughput effect, memory reduction, correctness observation, theorem, or performance conclusion is asserted.

## Routing

- Decision: `CONFIRM_REVISE_ONCE`.
- Conditional quality ceiling: `TIER_B_Q2_VIABLE` only if the narrow reference-closure/recourse certificate closes.
- Scientific revision: `0/1` consumed; the next owner may execute only the named atomic gate.
- Stage A/B: `false`.
- Preclaim fidelity if a later revision closes: immutable source/action pin; source-level two-TB repair replay; QTest/unit and guest/exception oracle; full native-union comparator; translation, code/RSS, metadata, repair, synchronization, lookup and guest full-cost ledger.
- Lane state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
