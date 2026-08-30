# QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE — Independent revision1 closing

## Frozen scope and integrity

- Assignment: `STAGE0-C2-20260814-QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE-REVISION1-CLOSING-V8.7`.
- Sole gate: `PINNED_QEMU_REGION_ALLOCATION_AND_TB_REFERENCE_CATALOG__LIVE_TB_RELOCATION_CERTIFICATE`.
- This reviewer independently authored neither the PRIMARY nor revision1 package.
- Revision payload integrity: `REVISION_REPORT.md`, `CURRENT_ACTION_AND_REFERENCE_AUDIT.md`, `CLAIM_MATRIX.md`, and `handoff.yaml` match all four frozen hashes; the supplied manifest is consistent (`4/4`).  The contract's `report/action_audit/claim_matrix` labels are aliases for those canonical filenames.
- No second revision, implementation, build, download, benchmark, guest execution, Stage A, or Stage B was performed.

## Closing decision

**`INCONCLUSIVE_POLICY_HOLD`**

Revision1 does not establish a passable static certificate, but the record does not establish scientific `STOP` either.  The decisive issue is not missing performance data: the claimed live-rebuild action has not been tied to a verified immutable QEMU source state, and its two-plan feasibility is internally unresolved.

The packet freezes `-accel tcg,thread=single` yet relies on a distinct already-existing destination region `R1` with slack to rebuild A/B before resetting source `R0`.  In the independently readable current `tcg/region.c`, `tcg_n_regions()` returns one region when `max_threads == 1`; the same file allocates extra regions only for multi-threaded contexts.  Thus the present two-region Plan M is not demonstrated for its frozen single-thread object.  If QEMU v11.1.0 has the same rule, Plan M is a same-object formal failure; if it differs, the packet must prove that difference from immutable blobs.  It does neither.

The revision names commit `84f07211cc5b4fc6a371559bf8a5de4fb068e648`, but the required independent retrieval of its commit and blob URLs was unavailable in this environment (GitLab/GitHub cache-miss responses and read-only `git ls-remote` TLS credential failure).  This is **not** an inference that the commit does not exist.  It does mean the contract's required exact-source verification cannot be awarded.  With revision `1/1` already consumed, the correct disposition is HOLD—not PASS, not an automatic second revision, and not a transport-based STOP.

## Decisive audit

### 1. Current union remains a strong subtractor, not direct absorption

Current official QEMU material confirms dynamic allocation of regions within the shared code-generation buffer.  It also confirms that full capacity maintenance, performed in an exclusive/serial context, flushes per-CPU jump caches, resets QHT, removes all TB records, and resets all regions.  Page invalidation safely deletes a TB: mark invalid, remove QHT/page entries, invalidate jump-cache aliases, remove its outgoing list entries, and unlink incoming direct jumps.

Those facts rule out claiming a single-region baseline or treating deletion primitives as live preservation.  They do not, on their own, prove an equivalent selected-live-TB capacity relocation.  `SEARCH_BOUNDED_OPEN` therefore remains for direct collision; generic cache compaction/controller work is not promoted to direct absorption.

### 2. Plan F is native; Plan M is not shown native-legal under the frozen object

Plan F corresponds to QEMU's existing quiescent full flush.  Plan M correctly lists many necessary obligations: QHT uniqueness, PageDesc membership, jump-cache aliases, direct-jump slots/lists, host-PC recovery, quiescence, and old-region retirement.  The `goto_tb + exit_tb` direct chain condition (fixed state and same page) and the safe lookup-exit fallback are also real constraints.

But the Plan-M admission predicate presupposes R1 slack while the declared configuration is single-threaded.  It never supplies a source-level allocation/action map showing a second assigned region or a legal way to create/reassign one without changing the frozen thread/configuration contract.  It also never enumerates actual immutable-blob symbols by which host-PC interval registration is removed/recreated.  Calling that operation “publish host-PC mapping” is a required proof obligation, not a verified native transition.

The contradiction cannot be repaired by interpreting R1 as extra storage: the report expressly forbids hidden scratch allocation and requires existing-region slack.  Nor can it be repaired by switching to MTTCG, because `thread=single` is part of the fixed same-object plan and `icount`/thread mode are explicitly frozen.

### 3. QLCF-DP has a useful shape, but no valid native action correspondence yet

The labelled frontier state is materially stronger than an unlabelled LRU/controller: it includes direct slots, QHT/page/cache/host-PC publication bits, destination slack, repair count, and reset eligibility, and includes full flush as a declared no-gain fallback.  Its conditional treewidth/slack/repair complexity is honest as an abstract recurrence.

However, an exact/FPT frontier needs a total map between every selected `MOVE` state and an available native maintenance transition.  The unavailable source pin plus the unclosed R1 predicate break this action/path correspondence at the root.  The recurrence therefore proves neither a same-QEMU exact action nor a QEMU-specific guarantee in the stated single-thread object.  It cannot be promoted to PASS merely because a generic DP can be written around the intended reference graph.

### 4. Full-cost and Stage-A route are finite only after the action closes

Revision1 properly identifies translation, code/RSS, metadata, patching, synchronization, lookup misses and guest wall time as costs.  It also defines reasonable later oracles.  But their comparison unit is a hypothetical Plan M.  Until R1 allocation and host-PC publication are shown native legal under a verifiable pin, that full-cost ledger is a conditional future route rather than a completed Stage-0 action certificate.

## Claim matrix

| Claim | Closing status | Reason |
|---|---|---|
| Revision payload is internally hash-consistent | `ACCEPTED` | Four canonical payloads match frozen hashes. |
| Pinned v11.1.0 source/blob catalogue independently verified | `NOT_VERIFIED` | Required immutable commit/blob retrieval unavailable; no absence inference made. |
| Full-flush plan F and current deletion union are native | `ACCEPTED` | Official current QEMU docs/source expose the required full-flush/invalidation primitives. |
| Existing destination R1 is legal in frozen `thread=single` object | `NOT_CLOSED` | Current source has one region for one thread; revision supplies no immutable evidence of a different v11.1.0 rule. |
| Plan M has a complete reference/publication transition | `NOT_CLOSED` | Host-PC registration/replacement and region allocation action are named but not bound to verified source symbols. |
| QLCF-DP is a target-specific exact bounded-frontier method | `NOT_CLOSED` | Native action/path correspondence depends on the unclosed R1/pin predicates. |
| Current QEMU directly absorbs selected live-TB capacity relocation | `NOT_ESTABLISHED__SEARCH_BOUNDED_OPEN` | Full flush/all-region reset and invalidation are not equivalent preservation actions. |
| Scientific STOP | `NOT_ESTABLISHED` | The unverified pin cannot be turned into absence, and a different frozen source state is not disproved. |

## Source basis and evidence ceiling

- QEMU, [MTTCG design](https://www.qemu.org/docs/master/devel/multi-thread-tcg.html): quiescence, full flush, lookup/cache/page/direct-jump maintenance.
- QEMU, [translator internals](https://www.qemu.org/docs/master/devel/tcg.html): direct-chain predicate and host-PC-to-guest-PC exception recovery.
- QEMU current [region allocator](https://gitlab.com/qemu-project/qemu/-/blob/master/tcg/region.c): dynamic regions; one region for a single TCG thread; current reset behavior.
- QEMU current [TB maintenance](https://gitlab.com/qemu-project/qemu/-/blob/master/accel/tcg/tb-maint.c): exclusive full flush and deletion/unlink primitives.

Evidence ceiling is `E1_STATIC_CURRENT_SOURCE_AND_CERTIFICATE_AUDIT`, narrowed by the unverified revision pin.  No correctness result, performance improvement, memory saving, theorem result, or observed natural workload conclusion is claimed.

## Required routing

- Scientific revision: `1/1_CONSUMED`.
- Decision: `INCONCLUSIVE_POLICY_HOLD`.
- Stage A: `false`; Stage B: `false`.
- No automatic same-ID revision, Stage-A creation, reserve transfer, or archival is authorized.
- Only an explicit user-policy decision may authorize an exceptional, narrow re-opening with an immutable source/blob package and a same-object legal destination-region action; otherwise the user may choose withdrawal/archival.  This is not a request for automatic revision2.
- Lane terminal state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
