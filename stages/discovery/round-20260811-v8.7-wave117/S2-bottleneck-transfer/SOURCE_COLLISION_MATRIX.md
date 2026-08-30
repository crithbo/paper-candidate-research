# Repeat/rescreen state-construction action matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE117-CHECKPOINT-STATE-CONSTRUCTION-DEPTH-REDTEAM` · **cutoff:** 2026-08-11.

| Repeat source | Official current anchor | Restart-equivalent object / full-cost | Current strongest union | Action-divergence witness result | Natural carrier / finite killer | Final |
|---|---|---|---|---|---|---|
| DMTCP | [DMTCP upstream](https://github.com/dmtcp/dmtcp) | process-tree restart; quiesce+capture/image+check+movement+restore | native checkpoint/restart image plus plugins/state paths | proposed delta/reference graph is dedup/encoding unless state semantics change | upstream process tests; post-restart resources + option/plugin audit | `NOT_ADMITTED_UNFROZEN` |
| CRIU | [CRIU upstream](https://github.com/checkpoint-restore/criu) | Linux task-tree restart; freeze+kernel state/image+page verification+restore | dump/image/lazy pages, parasite, TCP and restore mechanisms | no exact kernel-object image constructor beyond current union | CRIU test suite; TCP/process restart equivalence | `NOT_ADMITTED_UNFROZEN` |
| LLNL SCR | [SCR upstream](https://github.com/LLNL/scr) | MPI state restart; save+cache/replica+integrity+restore | multi-level cache/replication/checkpoint reader union | cache-level/replica state graph is placement policy absent new reader | `examples/test_api`; restart under stated replica condition | `NOT_ADMITTED_UNFROZEN` |
| VPIC | [VPIC upstream](https://github.com/lanl/vpic) | particle/field restart; dump+I/O/check+restore+numerical continuation | native checkpoint input and application I/O reader | compact/reference carrier changes reader contract | `sample/harris`; reader acceptance and subsequent-state equivalence | `NOT_ADMITTED_UNFROZEN` |

## Red-team conclusion and collision boundary

Wave111’s original four rows are deliberately recorded as `repeat_rescreen_events=4`, not new families. The matrix does not infer an implementation absence: it records that no whole state-image production–checking–restoration action could be frozen without reducing to the present union or changing restart-equivalent reader semantics. Compression, deduplication, placement, cache and controller formulations remain excluded from N2.
