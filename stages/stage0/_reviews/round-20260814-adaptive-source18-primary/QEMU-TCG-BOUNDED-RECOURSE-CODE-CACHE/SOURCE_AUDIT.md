# QEMU TCG current-source and collision audit

## Input integrity

| Input | Contract SHA-256 | Result |
|---|---|---|
| Brief | `4F283CF6E7D0C8A8683C139BB33C61BB3E46F7F19559DF3CCE3082DC0EDBCC18` | readable / scope consistent |
| Collision matrix | `7A4FFF741471729EEC88DD1CEFE55D9D5EB4CF9B785C6A719BF7E306B2031841` | readable |
| Discovery log | `9818B3416B777237706417069C1AA6EB21AAB5E2AA2D67052CE4519ECA4C7902` | readable |
| Handoff | `73DEC0D465EA7EE9E6A80315D687708E51334A3C726B2589B7B23AD27978EA39` | readable |

## First-party source findings

1. Official MTTCG states capacity triggers flush of all translations and requires vCPU quiescence for global changes; it separately names direct-jump reversal, lookup-cache/hash/page-list repair.
2. Current `tcg/region.c` divides the code buffer into regions allocated dynamically to TCG contexts. This is a material Discovery correction: it is part of the strong baseline, but it is allocation rather than relocation of live TBs.
3. Current `accel/tcg/tb-maint.c` flush path clears per-CPU jump caches, resets QHT, removes all TB records and calls `tcg_region_reset_all`. Its invalidation path unlinks jumps under destination locking and invalidates per-TB lookup cache entries.
4. Translator internals require same-page/fixed-state conditions for direct block chaining and retain host-PC→guest-PC mapping for exception handling. Any relocation must preserve or recreate both, not simply copy code bytes.
5. Official options define `tb-size`, `thread=single|multi`; official icount documentation says icount is incompatible with MTTCG. These settings must be frozen, not selected adaptively by the candidate.

## Collision classification

No same-object capacity-triggered live-TB migration action was located in the bounded primary/current source search. Generic code-cache compaction, DBT cache policies and non-QEMU JIT systems remain `METHODOLOGICAL_ADJACENT`; complete direct coverage remains `SEARCH_BOUNDED_OPEN`. Current region allocation/full flush/granular invalidation are direct subtractors and must be jointly replayed.

## Source pin note

The review uses official master documentation and official GitLab `master` source locators. A revision must record exact repository SHA plus immutable blobs before claim-bearing work. This provenance gap is not evidence of absence or a scientific STOP.
