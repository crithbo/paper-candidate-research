# Discovery log — S2 checkpoint state-construction depth red-team

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE117-CHECKPOINT-STATE-CONSTRUCTION-DEPTH-REDTEAM`  
**Upstream packet:** Wave111 DMTCP / CRIU / SCR / VPIC `NOT_ADMITTED_UNFROZEN` rows  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen rule and rescreen scope

Rule revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`; method `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`.

This is a **repeat/rescreen**, not a new-family sweep. A row may enter candidate-grade deep review only after a new exact whole state-construction action is frozen: it must produce state image/metadata, make it readable/checkable, restore it, and retain restart-equivalent behavior—not merely choose compression, deduplication, placement, caching, replication or control scheduling.

## Red-team action attempts

| Repeat family | Proposed complete-action hypothesis attacked | Restart-equivalence / union result | Outcome |
|---|---|---|---|
| DMTCP | construct image from live-memory deltas plus a reference graph, validate graph, reconstruct process image at restore | state capture/file/socket/plugin state is already native image production; delta/reference choice is compression/dedup path unless it changes plugin/restore semantics | `NOT_ADMITTED_UNFROZEN` |
| CRIU | jointly construct kernel-object image plus lazy page stream and verification witness, then restore on demand | current dump/image/lazy-page/restore path already owns kernel object reconstruction; new graph requires exact namespace/fd/TCP/cgroup semantics and no complete action was fixed | `NOT_ADMITTED_UNFROZEN` |
| SCR | construct a restart state jointly across cache levels/replicas with an integrity witness | current library’s state construction is checkpoint data cached/replicated on node storage; proposed construction selects level/replica/encoding and lacks a different restart-equivalent reader | `NOT_ADMITTED_UNFROZEN` |
| VPIC | construct field/particle state plus compact cross-reference witness consumed by restart reader | alternate carrier changes native checkpoint-input reader; sort/layout/format manipulation is application- or encoding-level, not a general restart-equivalent construction | `NOT_ADMITTED_UNFROZEN` |

Counts: `raw_row_events=4`; `repeat_rescreen_events=4`; `unique_opportunity_families=0`; `preliminary_action_divergence_witnesses=0`; `candidate_grade_deep_reviews=0`; `grounded_briefs=0`.

## Current-upstream reality checks

### DMTCP

**Exact object:** restart of the same process tree, including plugin-mediated state under DMTCP semantics. **Full cost:** quiesce, state capture/image construction, metadata/checking, write/movement, restore and first correct post-restart observation. Current DMTCP upstream provides the checkpoint/restart image and plugin mechanisms. The red-team construction collapses to its existing capture/image/restore union unless it changes state mediated by a plugin. No action-divergence witness survives.

**Natural carrier / finite killer:** official DMTCP process tests; if a future action is stated, restore must reproduce file/socket/process observations and demonstrate that it is not a plugin/option/encoding path.

### CRIU

**Exact object:** frozen Linux task tree restored with the same supported process, namespace, cgroup, file and TCP semantics. **Full cost:** freeze, parasite-assisted information collection, CRIU image construction, page movement/validation, restore and resumed I/O. Current upstream explicitly describes checkpointing to image files, restore, live migration, parasite injection, TCP state and the source/test components. The proposed joint image-plus-lazy-page action cannot be completed without exact kernel-object semantics; what is known is already the native dump/lazy restore union. It remains unfrozen rather than dropped for missing results.

**Natural carrier / finite killer:** CRIU `test` suite with supported TCP/process scenarios; compare resumed behavior and image-reader acceptance, rejecting altered connection/resource semantics.

### SCR

**Exact object:** restart-equivalent MPI application state under SCR’s checkpoint/restart semantics. **Full cost:** state save, node-local cache/replication, integrity/metadata, shared-storage interaction, restore and recomputation avoided. Current LLNL upstream documents a multi-level checkpoint/restart system caching checkpoint data at compute nodes and exposes source, examples and testing. The proposed multi-level state graph does not differ from current cache/replica state construction without a new reader or changed failure contract. It is not promoted merely because checkpoint-level placement is important.

**Natural carrier / finite killer:** SCR `examples/test_api`; a future action must preserve MPI restart state under a specified failure/replica condition and not be expressible by existing level/replication configuration.

### VPIC

**Exact object:** restart-equivalent particle/field simulation state and subsequent numerical evolution as accepted by VPIC’s checkpoint input. **Full cost:** simulation pause, dump construction, I/O/checking, restore, and resumed simulation. Current upstream documents native checkpoint-restart input and a flexible application-native I/O format, alongside sample input decks. A changed packed/reference representation has no same-reader guarantee; it is a changed checkpoint carrier until a compatible reader and equivalence condition are provided. No complete action was frozen.

**Natural carrier / finite killer:** VPIC `sample/harris` checkpoint/restart; reject any candidate that changes restart-reader acceptance or fails subsequent field/particle-state equivalence.

## Result

No new exact state-construction action passed red-team. The four source families remain repeat/rescreen entries and are not relabelled as new opportunities. No direction was rejected due to absent implementation, result, resource, hardware, download or AI readiness. No experiment, benchmark, automation, Stage0/A/B or shared-control mutation occurred.

`PROPOSE_STAGE0: []`; lane state `IDLE_REUSABLE_AWAITING_MAINLINE`.
