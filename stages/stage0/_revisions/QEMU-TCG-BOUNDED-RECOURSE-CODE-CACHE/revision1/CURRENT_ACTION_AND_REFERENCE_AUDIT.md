# Current action and reference audit

## Source pin

- QEMU: v11.1.0
- Immutable commit: `84f07211cc5b4fc6a371559bf8a5de4fb068e648`
- Review date: 2026-08-14
- Audit type: static source/documentation audit; no source tree build or guest execution.

## Current reality check

The current official code and documentation narrow, but do not absorb, the candidate.

1. `tcg/region.c` provides a shared code-generation buffer divided into regions that are dynamically allocated to TCG contexts.  It is a strong current allocation baseline.
2. Capacity handling uses an exclusive/serial full flush.  It clears/invalidates all TB lookup state and resets regions; it is not a selected live-TB retention action.
3. Page invalidation supplies the deletion half of reference maintenance: direct-jump unlinking, page-list and lookup cache/QHT maintenance.  It does not publish a preserving old-host-address to new-host-address transition for live TBs.
4. `goto_tb + exit_tb` makes a direct edge legal only under fixed CPU-state and same-page conditions; an edge otherwise returns to normal lookup.  This is the native safe fallback used in the certificate.
5. QEMU maintains host-PC-to-guest-PC mappings for fault recovery, so byte copying alone is outside the object.  The construction rebuilds translated code and republishes its mapping.
6. `tb-size`, `thread=single|multi`, and `icount` are configuration boundaries.  `icount` is incompatible with MTTCG; neither it nor thread mode is adaptively selected.

## Complete relevant action / reference catalogue

| Reference/action | Existing source role | QLCF-DP treatment |
|---|---|---|
| `TranslationBlock` key and code interval | identifies code under CPU state/code flags | immutable identity; rebuilt descriptor must retain key |
| TCG region | allocates code within shared buffer | source to reset / destination with existing slack |
| QHT | global physical-to-TB lookup | unpublish old then publish unique replacement |
| `tb_jmp_cache` | per-vCPU recent lookup cache | invalidate old aliases; optional post-publication refill |
| `PageDesc` / page list | maps guest page to its TBs | remove old, attach replacement under same page |
| direct jump slot/list | patches legal same-page/fixed-state chains | rechain internal edge or revert origin to lookup exit |
| host-PC map | exception signal recovery | create new map before releasing quiescence |
| full flush | current capacity fallback | explicit DP terminal/no-gain branch |
| page invalidation | deletion of modified guest code | independent control; never used to claim migration |
| `async_safe_run_on_cpu` / exclusive-or-serial maintenance | stops readers for global changes | required quiescent publication boundary |

## Same-object two-plan action map

| Event | Current plan F | Proposed plan M | Semantic contract |
|---|---|---|---|
| `C` page modification | native invalidation/deletion | identical native invalidation/deletion | both remove stale code for `Q` |
| capacity admission `X` | quiesce then full flush/reset all regions | quiesce, rebuild closure `A,B` into slack `R1`, reset only evacuated `R0` | guest trace, I/O, exception mapping unchanged |
| `A -> B` direct chain | regenerated later after lookup | reinstalled after both keys/maps publish | only legal same-page/fixed-state edge |
| external incoming link | full flush removes it | unlink then allow native lookup exit/repatch after publish | no stale host pointer |
| no slack / failed predicate | full flush | full flush | no hidden degraded action |

## Why this is not generic compaction

The candidate selection is not permitted to move arbitrary code bytes, reorder cache entries, or choose `tb-size`.  A transition is legal only when the QEMU reference graph closes: key uniqueness in QHT, page ownership, direct-jump slots/lists, per-vCPU cache aliases, and host-PC exception recovery have all been handled in a fixed total order at QEMU’s own maintenance boundary.  Its frontier therefore represents legal *native maintenance transitions*, not an abstract cache state.

The generic kernel is explicitly bounded: an unlabelled cache policy, compactor, controller, or solver does not meet the state/action bijection and is not a valid method.  The remaining non-product coupling is the simultaneous requirement that preserving one TB’s host address replacement may require chain treatment, QHT uniqueness, page attachment, cache invalidation, host-PC publication, and region-reset eligibility.  The direct-chain and exception labels make this more than independent item packing.

## Collision conclusion

`SEARCH_BOUNDED_OPEN` remains for literature beyond the authoritative current-source and supplied-primary corpus.  No official current QEMU action found in the audit performs the complete capacity-triggered selected-live-TB transition.  Generic DBT/JIT compaction remains methodological adjacent unless it matches every same-object transition, online information, guarantee, and full-cost predicate above.
