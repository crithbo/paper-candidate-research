# QEMU TCG bounded-recourse code cache — Stage 0 revision 1

## Disposition

- Assignment: `STAGE0-P1-20260814-QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE-REVISION1-V8.7`
- Sole gate: `PINNED_QEMU_REGION_ALLOCATION_AND_TB_REFERENCE_CATALOG__LIVE_TB_RELOCATION_CERTIFICATE`
- Decision: `PASS_RECOMMENDED` — **independent revision closing required**.
- Quality tier: `TIER_B_Q2_VIABLE` (conditional paper potential).
- Scientific revision: **consumed (1/1)** by this gate-bearing static certificate.
- Evidence ceiling: `E1_STATIC_CURRENT_SOURCE_AND_CERTIFICATE_AUDIT`.
- Stage A / Stage B: not authorized by this report.
- Confidence: 0.79.

This is not a claim that relocation improves QEMU today.  It closes the Stage 0 question: a finite same-object, target-specific research kernel and a falsifiable fidelity route exist if the construction succeeds.  No QEMU build, guest execution, benchmark, or implementation was performed.

## Sole proposition

For pinned QEMU, a capacity admission can, when a finite region-slack and reference-closure predicate holds, replace the current destructive capacity flush with a quiescent transition that rebuilds a bounded live TranslationBlock (TB) closure in an existing destination region, repairs every QEMU-native reference, then resets the evacuated source region.  The decision is selected by a QEMU-specific bounded-frontier dynamic program rather than a cache-size controller or generic compactor.

**Falsifier.** The proposition fails if a complete native source audit finds equivalent capacity retention/relocation already present; if a live TB cannot be rebuilt under the same QEMU key/CPU-state contract without changing guest semantics; if any direct-jump, page, QHT, per-vCPU jump-cache, or host-PC mapping reference lacks a total repair transition; or if the alleged recurrence reduces to an unlabeled cache/compaction solver.  The audit below did not trigger any of those failures.

## Immutable source and exact object

The pin is the official QEMU v11.1.0 release commit `84f07211cc5b4fc6a371559bf8a5de4fb068e648` (2026-08-11).  The pinned source catalogue is `tcg/region.c`, `accel/tcg/tb-maint.c`, `accel/tcg/translate-all.c`, the TCG lookup/translation paths, and the official TCG, MTTCG, option, and icount documentation.

The certificate freezes one `qemu-system-x86_64` system-emulation contract on an x86-64 host, a fixed CPU model/machine, `-accel tcg,thread=single`, fixed `tb-size`, `icount=off`, and a fixed guest instruction stream.  It preserves target instruction semantics, I/O, exceptions, code-page membership, lookup behavior, direct-chain legality, and guest-PC recovery.  MTTCG and `icount` remain members of the *current action catalogue* but are not changed in this object.  This avoids manufacturing a transition by changing the threading or time contract.

## Current action catalogue and strongest union

| Native surface | Frozen/current action | Comparator role |
|---|---|---|
| Region topology | shared code buffer divided into dynamically allocated TCG regions | mandatory allocation baseline |
| Capacity exhaustion | exclusive/serial `tb_flush`: clear TB records, lookup state and reset regions | current destructive fallback |
| Granular invalidation | page-triggered TB invalidation, direct-jump unlink, page/QHT/cache removal | repair primitive / negative control |
| Direct chain | `goto_tb + exit_tb`, only fixed CPU-state and same-page | legal-chain predicate |
| Lookup | per-vCPU `tb_jmp_cache` plus global QHT | reference catalogue |
| Exception mapping | host-PC to guest-PC mapping for signal/exception recovery | must be recreated for rebuilt code |
| Configurations | `tb-size`; `thread=single|multi`; compatible `icount` family | same-information configuration union |

The union is deliberately not described as “single buffer”.  Dynamic region allocation is a direct subtractor.  It allocates future code to regions; it does not retain a capacity-selected live TB closure while reclaiming only its old region.  Full flush, granular invalidation, and profile/threshold control cannot express the preserving transition below without adding its reference-closure construction.

## Native two-TB witness

Let guest physical page `P` contain direct branch TB `A` at `p` and destination TB `B` at `p + 4`, with fixed CPU-state key `s`, fixed code flags `c`, and a same-page direct chain `A --slot0--> B`.  Both initially reside in source region `R0`; their exact state is:

`TB(t) = (key=(pc, s, c), region, host_code_interval, QHT_entry, page=P, incoming_jump_list, outgoing_slot, jmp_cache_refs, hostPC_map)`.

`A` has one outgoing slot and `B` has an incoming entry from `A`.  The QHT contains the two `(key -> TB)` bindings; `PageDesc(P)` contains both TBs; the relevant per-vCPU `tb_jmp_cache` entry may name `B`; host-PC intervals decode faults in each TB to their original guest PCs.  A third independent TB `C` on page `Q` is included only as the required native page-invalidation control: a modification of `Q` takes QEMU’s existing delete/unlink path and `C` is never moved.

At admission of a new TB `X`, plan F is the current capacity action: quiesce, full flush all TB references and regions, then regenerate on demand.  Plan M is admitted only if destination region `R1` already has slack for rebuilt `A'`, `B'`, their metadata, and the declared repair ledger; no cache-size increase or hidden scratch allocation is allowed.  Plan M rebuilds `A'` and `B'` under the identical `(pc,s,c)` keys, recreates their host-PC mapping, reinstalls the legal same-page chain, and resets `R0` after its live members have retired.  Both plans have the same guest trace and I/O/exception semantics; M retains a bounded live closure whereas F does not.

The only observable difference permitted between F and M is the charged internal full-cost vector: translation work, code/RSS occupancy, metadata, repair/synchronization, lookup warmness, and later guest wall time.  A stale pointer, changed direct-chain condition, altered CPU-state key, or changed exception mapping invalidates M.

## Total quiescent repair and publication order

The following is a total native-reference transition, not code-byte copying:

1. Freeze the same QEMU configuration and obtain the global exclusive/serial quiescent boundary used for code-cache maintenance; no vCPU executes a TB during the transition.
2. Verify `A` and `B` are valid, their direct chain is same-page/fixed-state legal, `R0` is an evacuation candidate, and `R1` has declared slack.  Enumerate `R0`’s complete live TB set, not merely `A,B`.
3. Collect every incoming direct jump, outgoing slot, QHT binding, page-list membership, per-vCPU jump-cache reference, and host-PC mapping for that set.  Reversibly unlink external incoming jumps and invalidate cache entries that name old code; an origin then takes its existing main-loop lookup fallback.
4. Remove old keys from QHT and old page-list bindings while all readers are quiescent.  This prevents duplicate equal-key bindings.  Preserve the immutable guest key/CPU-state/code-flag descriptor needed by ordinary translation.
5. Rebuild selected TB descriptors/code in `R1` through the ordinary translator, attach each new TB to QHT and the original page list, and publish its new host-PC mapping.  The old and new host code do not coexist as lookup answers for the same key.
6. Recreate only legal internal direct links (`A' -> B'` here) using the current direct-jump patching primitive; leave external links as safe lookup exits or repatch them only after destination publication.  Rebuild/cache-populate only entries whose new target has been published.
7. Check that no old reference remains in any direct-jump list, QHT binding, page list, jump cache, or host-PC interval.  Retire old TB metadata and reset `R0`; release quiescence.  If any predicate fails, abandon M before publication and use current full flush.

The order is sufficient because QEMU’s documented direct-chain path already returns to the main loop when an exit/lookup is required, QHT and jump-cache updates are native lookup mechanisms, and all relocation-sensitive readers are stopped at the global boundary.  It is also necessary: deleting any catalogue member leaves a possible stale code or exception reference.

## QEMU live-closure frontier DP (QLCF-DP)

The mechanism is not “select a victim”.  It is a finite transition constructor over a **QEMU-labelled reference graph**:

- vertices are live TBs with immutable `(pc,s,c)` keys, region, code bytes, metadata bytes, guest page and host-PC interval;
- directed labelled edges are direct-jump slots/incoming lists, QHT ownership, page-list ownership, jump-cache aliases, and host-PC interval ownership;
- actions for each TB are `MOVE`, `DROP_TO_LOOKUP`, or `FULL_FLUSH`; only `MOVE` preserves a live key; `DROP_TO_LOOKUP` is a native safe fallback, not a semantic change;
- admissibility includes destination slack, same-page/fixed-state chain legality, all-reference closure, quiescence, and a bounded repair budget `r`.

For a fixed tree decomposition of this labelled closure graph, a frontier state is

`(frontier TB actions, direct-slot status, QHT/page/cache/hostPC publication bits, destination-slack vector, repair count, region-reset eligibility)`.

Introduce/forget transitions are allowed only after every named QEMU reference of a forgotten TB is either recreated at its new descriptor or explicitly reverted to the documented lookup exit.  The recurrence minimizes the complete internal ledger lexicographically under the frozen objective, and includes full flush as a terminal action.  It is exact for treewidth `w`, `d` available destination regions, slack discretization `B`, and repair bound `r`, in `O(n · 3^(w+1) · 2^O(w) · (B+1)^d · (r+1))` time; these parameters are declared, not hidden.  Unbounded-width/insufficient-slack inputs take the existing full-flush branch, which is the no-gain boundary.

This is target-specific rather than a generic cache controller: state feasibility and the proof invariant are defined by QEMU TB keys, direct-chain legality, QHT uniqueness, `PageDesc` membership, jump-cache aliases, host-PC recovery, and global maintenance quiescence.  A generic LRU, compactor, cache-size policy, ILP, or arbitrary code mover has none of these action-to-native-transition obligations and cannot substitute for the claimed certificate.

**Guarantee.** For every selected QLCF-DP transition satisfying its predicates, Plan M is a trace-preserving QEMU maintenance transition: every future lookup either names the rebuilt TB with the same key or takes the existing main-loop translation fallback; every direct edge is either rebuilt under its legal predicate or reverted; and every host-PC lookup refers to a published new interval.  The DP is exact only inside the declared finite action catalogue and parameter bounds; it makes no unconditional speedup claim.

## Finite Stage A fidelity gate and killer (not run)

Before any claim-bearing run, a later owner must pin the listed blobs and execute the source-level two-TB replay plus independent page-invalidation control.  Required oracles are guest instruction/I/O equality, direct-chain legality, QHT/page/jump-cache membership, and a fault-to-guest-PC check.  The ledger must include translation/regeneration, code bytes/RSS, TB metadata, QHT/page/cache changes, patch/unpatch/synchronization, lookup misses, and wall time.

The pre-registered killer is any of: (a) no emitted same-page fixed-state two-TB chain under the frozen contract; (b) an unrepairable old reference; (c) a QEMU native action already performing equivalent capacity retention; (d) no legal slack-bearing admission cases in the declared natural corpus; or (e) M has no Pareto point against dynamic regions + full flush + granular invalidation once all costs are charged.  A positive result would be preliminary support only.

## Sources

- [QEMU v11.1.0 tag / immutable commit](https://gitlab.com/qemu-project/qemu/-/commit/84f07211cc5b4fc6a371559bf8a5de4fb068e648)
- [Pinned region allocator](https://gitlab.com/qemu-project/qemu/-/blob/84f07211cc5b4fc6a371559bf8a5de4fb068e648/tcg/region.c)
- [Pinned TB maintenance](https://gitlab.com/qemu-project/qemu/-/blob/84f07211cc5b4fc6a371559bf8a5de4fb068e648/accel/tcg/tb-maint.c)
- [QEMU MTTCG design](https://www.qemu.org/docs/master/devel/multi-thread-tcg.html)
- [QEMU translator internals](https://www.qemu.org/docs/master/devel/tcg.html)
- [QEMU options](https://www.qemu.org/docs/master/system/qemu-manpage.html)
- [QEMU icount contract](https://www.qemu.org/docs/master/devel/tcg-icount.html)
